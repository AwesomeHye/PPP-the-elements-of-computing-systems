package writer;

import lombok.extern.slf4j.Slf4j;
import type.CommandType;

import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
public class CodeWriter {
    private Path templatePath;
    private Path currentTemplatePath;
    private int assemblyLineNum;
    private String functionName;
    private Map<String, Map<String, String>> asmCommandSymbol;
    private boolean insertedBootstrapCode;
    private int booleanIndex;
    private int returnIndex;
    public CodeWriter(){
        try {
            templatePath = Paths.get(getClass().getClassLoader().getResource("sourcefiles/asmTemplate").toURI());
            asmCommandSymbol = new LinkedHashMap<>();
            functionName = "null";
            insertedBootstrapCode = false;
            booleanIndex = 0;
            initAsmCommandSymbol();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }

    }


    /**
     * insert and translate parsed command to assembly
     * @param intermediateCodeComponentsList List<Map<component_option, value>>
     * @return
     */
    public List<String> translateAssemblyCode(List<Map<String, String>> intermediateCodeComponentsList) {

       List<String> assembly = new ArrayList<>();

        for(Map<String, String> codeComponents: intermediateCodeComponentsList){
            if(!insertedBootstrapCode && codeComponents.get("filename").equals("Sys")){
                insertBootstrapCode(assembly);
            }
            String commandType = codeComponents.get("commandtype");
            switch (CommandType.valueOf(commandType)){
                case C_ARITHMETIC:
                    assembly.addAll(writeArithmetic(codeComponents.get("arg1")));
                    break;
                case C_PUSH:
                    assembly.addAll(writePushPop("push", codeComponents));
                    break;
                case C_POP:
                    assembly.addAll(writePushPop("pop", codeComponents));
                    break;
                case C_LABEL:
                    assembly.addAll(writeConditionalBranch("label", codeComponents.get("arg1")));
                    break;
                case C_IF:
                    assembly.addAll(writeConditionalBranch("if-goto", codeComponents.get("arg1")));
                    break;
                case C_GOTO:
                    assembly.addAll(writeConditionalBranch("goto", codeComponents.get("arg1")));
                    break;
                case C_CALL:
                    assembly.addAll(writeCallFunction("call", codeComponents));
                    break;
                case C_FUNCTION:
                    assembly.addAll(writeCallFunction("function", codeComponents));
                    functionName = codeComponents.get("arg1");
                    break;
                case C_RETURN:
                    assembly.addAll(writeReturn());
                    break;
                default:
                    log.error("invalid commandtype: {}", commandType);
                    throw new RuntimeException();
            }

            assemblyLineNum=assembly.stream().filter(line -> !line.startsWith("//")).collect(Collectors.toList()).size();
        }

        insertedBootstrapCode = false;
        booleanIndex = 0;
        returnIndex=0;
        functionName = "null";
        return assembly;
    }

    /**
     * if vm file includes "Sys.vm", insert bootstrap code
     * @param assembly
     */
    private void insertBootstrapCode(List<String> assembly) {
        Path bootstrapCodePath = templatePath.resolve("bootstrap.asm");
        try {
            assembly.addAll(Files.readAllLines(bootstrapCodePath));
        } catch (IOException e) {
            e.printStackTrace();
        }
        insertedBootstrapCode = true;
    }

    /**
     * translate arithmetic command to assembly
     * @param op add, sub, neg, eq, gt, lt, and, or, not
     * @return assembly
     */
    private List<String> writeArithmetic(String op) {
        Map<String, String> asmCommandComponents = asmCommandSymbol.get(op);

        //set dynamic components
        //[eq, gt, lt]
        if(asmCommandComponents.containsKey("{FUNC_NAME}")) {
            asmCommandComponents.replace("{FUNC_NAME}", functionName);
        }
        if(asmCommandComponents.containsKey("{BOOLEAN_INDEX}")) {
            asmCommandComponents.replace("{BOOLEAN_INDEX}", String.valueOf(booleanIndex++));
        }

        currentTemplatePath = templatePath.resolve(asmCommandComponents.get("template"));
        return createAssembly(asmCommandComponents);
    }

    /**
     * translate push, pop command to assembly
     * @param action push | pop
     * @param codeComponents VMComponents
     * @return assembly
     */
    private List<String> writePushPop(String action, Map<String, String> codeComponents) {
        String segment = codeComponents.get("arg1");
        String index = codeComponents.get("arg2");

        Map<String, String> asmCommandComponents = asmCommandSymbol.get(action + "_" + segment);
        //set dynamic components
        //[constant]
        if(asmCommandComponents.containsKey("{NUM}"))
            asmCommandComponents.replace("{NUM}", index);
        //[pointer]
        if(asmCommandComponents.containsKey("{SYM_INDEX}")) {
            if ((index.equals("0"))) {
                asmCommandComponents.replace("{SYM_INDEX}", "");
            } else {
                asmCommandComponents.replace("{SYM_INDEX}", "+1");
            }
        }
        //[static]
        if(asmCommandComponents.containsKey("{FILE_NAME}")) {
            asmCommandComponents.replace("{FILE_NAME}", codeComponents.get("filename"));
        }

        //[others]
        if(asmCommandComponents.containsKey("{INDEX}")) {
            asmCommandComponents.replace("{INDEX}", index);
        }

        currentTemplatePath = templatePath.resolve(asmCommandComponents.get("template"));
        return createAssembly(asmCommandComponents);
    }

    /**
     * translate label, if-goto, goto command to assembly
     *
     * @param op label, if-goto, goto
     * @param label
     * @return assembly
     */
    private List<String> writeConditionalBranch(String op, String label) {
        Map<String, String> asmCommandComponents = asmCommandSymbol.get(op);

        //set dynamic components
        if(asmCommandComponents.containsKey("{LABEL}")) {
            asmCommandComponents.replace("{LABEL}", label);
        }
        if(asmCommandComponents.containsKey("{FUNC_NAME}")) {
            asmCommandComponents.replace("{FUNC_NAME}", functionName);
        }

        currentTemplatePath = templatePath.resolve(asmCommandComponents.get("template"));
        return createAssembly(asmCommandComponents);
    }

    /**
     * translate call, function command to assembly
     * @param op call, function
     * @param codeComponents
     * @return assembly
     */
    private List<String> writeCallFunction(String op, Map<String, String> codeComponents) {
        String functionName = codeComponents.get("arg1");
        String num = codeComponents.get("arg2"); //call: ARG_NUM, function: LCL_NUM

        Map<String, String> asmCommandComponents = asmCommandSymbol.get(op);

        //set dynamic components
        if(asmCommandComponents.containsKey("{FUNC_NAME}")) {
            asmCommandComponents.replace("{FUNC_NAME}", functionName);
        }
        if(asmCommandComponents.containsKey("{RET_INDEX}")) {
            asmCommandComponents.replace("{RET_INDEX}", String.valueOf(returnIndex++));
        }
        if(asmCommandComponents.containsKey("{ARG_NUM}")) {
            asmCommandComponents.replace("{ARG_NUM}", num);
        } else if(asmCommandComponents.containsKey("{LCL_NUM}")) {
            asmCommandComponents.replace("{LCL_NUM}", num);
        }

        currentTemplatePath = templatePath.resolve(asmCommandComponents.get("template"));
        return createAssembly(asmCommandComponents);
    }

    /**
     * translate return command to assembly
     * @return assembly
     */
    private List<String> writeReturn() {
        Map<String, String> asmCommandComponents = asmCommandSymbol.get("return");

        currentTemplatePath = templatePath.resolve(asmCommandComponents.get("template"));
        return createAssembly(asmCommandComponents);
    }

    /**
     * create assembly by inserting asmCommandComponents to template file
     * @param asmCommandComponents
     * @return assembly
     */
    private List<String> createAssembly(Map<String, String> asmCommandComponents) {
        List<String> asm = new ArrayList<>();
        try {

            asm = Files.readAllLines(currentTemplatePath);

            String line;
            for(int i = 0; i < asm.size(); i++){
                for(String key: asmCommandComponents.keySet().stream().filter(key -> !key.equals("template")).collect(Collectors.toList())){
                    line = asm.get(i);
                    if(line.contains(key))
                        asm.set(i, line.replace(key,asmCommandComponents.get(key)));
                }

            }

        } catch (IOException e) {
            e.printStackTrace();
        }
        return asm;
    }



    /**
     * create translate assembly template code
     */
    private void initAsmCommandSymbol() {
        //// ARITHMETIC ////
        HashMap<String, String> addSymbols = new HashMap<>();
        addSymbols.put("template", "compute-arithmetic.template");
        addSymbols.put("{OP}", "ADD");
        addSymbols.put("{op}", "add");
        addSymbols.put("{symbol}", "+");
        asmCommandSymbol.put("add", addSymbols);

        HashMap<String, String> subSymbols = new HashMap<>();
        subSymbols.put("template", "compute-arithmetic.template");
        subSymbols.put("{OP}", "SUB");
        subSymbols.put("{op}", "sub");
        subSymbols.put("{symbol}", "-");
        asmCommandSymbol.put("sub", subSymbols);

        HashMap<String, String> andSymbols = new HashMap<>();
        andSymbols.put("template", "compute-arithmetic.template");
        andSymbols.put("{OP}", "AND");
        andSymbols.put("{op}", "and");
        andSymbols.put("{symbol}", "&");
        asmCommandSymbol.put("and", andSymbols);

        HashMap<String, String> orSymbols = new HashMap<>();
        orSymbols.put("template", "compute-arithmetic.template");
        orSymbols.put("{OP}", "OR");
        orSymbols.put("{op}", "sub");
        orSymbols.put("{symbol}", "|");
        asmCommandSymbol.put("or", orSymbols);

        HashMap<String, String> eqSymbols = new HashMap<>();
        eqSymbols.put("template", "boolean-arithmetic.template");
        eqSymbols.put("{op}", "eq");
        eqSymbols.put("{SYM}", "-");
        eqSymbols.put("{CMP_SYM}", "==");
        eqSymbols.put("{JUMP}", "JEQ");
        eqSymbols.put("{FUNC_NAME}", "{FUNC_NAME}");
        eqSymbols.put("{BOOLEAN_INDEX}", "{BOOLEAN_INDEX}");
        asmCommandSymbol.put("eq", eqSymbols);

        HashMap<String, String> gtSymbols = new HashMap<>();
        gtSymbols.put("template", "boolean-arithmetic.template");
        gtSymbols.put("{op}", "gt");
        gtSymbols.put("{SYM}", "-");
        gtSymbols.put("{CMP_SYM}", ">");
        gtSymbols.put("{JUMP}", "JGT");
        gtSymbols.put("{FUNC_NAME}", "{FUNC_NAME}");
        gtSymbols.put("{BOOLEAN_INDEX}", "{BOOLEAN_INDEX}");
        asmCommandSymbol.put("gt", gtSymbols);

        HashMap<String, String> ltSymbols = new HashMap<>();
        ltSymbols.put("template", "boolean-arithmetic.template");
        ltSymbols.put("{op}", "lt");
        ltSymbols.put("{SYM}", "-");
        ltSymbols.put("{CMP_SYM}", "<");
        ltSymbols.put("{JUMP}", "JLT");
        ltSymbols.put("{FUNC_NAME}", "{FUNC_NAME}");
        ltSymbols.put("{BOOLEAN_INDEX}", "{BOOLEAN_INDEX}");
        asmCommandSymbol.put("lt", ltSymbols);

        HashMap<String, String> negSymbols = new HashMap<>();
        negSymbols.put("template", "single-operator-arithmetic.template");
        negSymbols.put("{op}", "neg");
        negSymbols.put("{SYM}", "-");
        asmCommandSymbol.put("neg", negSymbols);

        HashMap<String, String> notSymbols = new HashMap<>();
        notSymbols.put("template", "single-operator-arithmetic.template");
        notSymbols.put("{op}", "not");
        notSymbols.put("{SYM}", "!");
        asmCommandSymbol.put("not", notSymbols);

        //// PUSH ////
        HashMap<String, String> pushConstSymbols = new HashMap<>();
        pushConstSymbols.put("template", "push_constant.template");
        pushConstSymbols.put("{NUM}", "{NUM}");
        asmCommandSymbol.put("push_constant", pushConstSymbols);

        HashMap<String, String> pushArgumentSymbols = new HashMap<>();
        pushArgumentSymbols.put("template", "push.template");
        pushArgumentSymbols.put("{SEGMENT}", "ARGUMENT");
        pushArgumentSymbols.put("{ADDR}", "ARG");
        pushArgumentSymbols.put("{INDEX}", "{INDEX}");
        asmCommandSymbol.put("push_argument", pushArgumentSymbols);

        HashMap<String, String> pushLocalSymbols = new HashMap<>();
        pushLocalSymbols.put("template", "push.template");
        pushLocalSymbols.put("{SEGMENT}", "LOCAL");
        pushLocalSymbols.put("{ADDR}", "LCL");
        pushLocalSymbols.put("{INDEX}", "{INDEX}");
        asmCommandSymbol.put("push_local", pushLocalSymbols);

        HashMap<String, String> pushThisSymbols = new HashMap<>();
        pushThisSymbols.put("template", "push.template");
        pushThisSymbols.put("{SEGMENT}", "THIS");
        pushThisSymbols.put("{ADDR}", "THIS");
        pushThisSymbols.put("{INDEX}", "{INDEX}");
        asmCommandSymbol.put("push_this", pushThisSymbols);

        HashMap<String, String> pushThatSymbols = new HashMap<>();
        pushThatSymbols.put("template", "push.template");
        pushThatSymbols.put("{SEGMENT}", "THAT");
        pushThatSymbols.put("{ADDR}", "THAT");
        pushThatSymbols.put("{INDEX}", "{INDEX}");
        asmCommandSymbol.put("push_that", pushThatSymbols);

        HashMap<String, String> pushPointerSymbols = new HashMap<>();
        pushPointerSymbols.put("template", "push_pointer.template");
        pushPointerSymbols.put("{INDEX}", "{INDEX}");
        pushPointerSymbols.put("{SYM_INDEX}", "{SYM_INDEX}");
        asmCommandSymbol.put("push_pointer", pushPointerSymbols);

        HashMap<String, String> pushTempSymbols = new HashMap<>();
        pushTempSymbols.put("template", "push_temp.template");
        pushTempSymbols.put("{SEGMENT}", "TEMP");
        pushTempSymbols.put("{ADDR}", "R5");
        pushTempSymbols.put("{INDEX}", "{INDEX}");
        asmCommandSymbol.put("push_temp", pushTempSymbols);

        HashMap<String, String> pushStaticSymbols = new HashMap<>();
        pushStaticSymbols.put("template", "push_static.template");
        pushStaticSymbols.put("{FILE_NAME}", "{FILE_NAME}");
        pushStaticSymbols.put("{INDEX}", "{INDEX}");
        asmCommandSymbol.put("push_static", pushStaticSymbols);

        //// POP ////
        HashMap<String, String> popArgumentSymbols = new HashMap<>();
        popArgumentSymbols.put("template", "pop.template");
        popArgumentSymbols.put("{SEGMENT}", "ARGUMENT");
        popArgumentSymbols.put("{ADDR}", "ARG");
        popArgumentSymbols.put("{INDEX}", "{INDEX}");
        asmCommandSymbol.put("pop_argument", popArgumentSymbols);

        HashMap<String, String> popLocalSymbols = new HashMap<>();
        popLocalSymbols.put("template", "pop.template");
        popLocalSymbols.put("{SEGMENT}", "LOCAL");
        popLocalSymbols.put("{ADDR}", "LCL");
        popLocalSymbols.put("{INDEX}", "{INDEX}");
        asmCommandSymbol.put("pop_local", popLocalSymbols);

        HashMap<String, String> popThisSymbols = new HashMap<>();
        popThisSymbols.put("template", "pop.template");
        popThisSymbols.put("{SEGMENT}", "THIS");
        popThisSymbols.put("{ADDR}", "THIS");
        popThisSymbols.put("{INDEX}", "{INDEX}");
        asmCommandSymbol.put("pop_this", popThisSymbols);

        HashMap<String, String> popThatSymbols = new HashMap<>();
        popThatSymbols.put("template", "pop.template");
        popThatSymbols.put("{SEGMENT}", "THAT");
        popThatSymbols.put("{ADDR}", "THAT");
        popThatSymbols.put("{INDEX}", "{INDEX}");
        asmCommandSymbol.put("pop_that", popThatSymbols);

        HashMap<String, String> popPointerSymbols = new HashMap<>();
        popPointerSymbols.put("template", "pop_pointer.template");
        popPointerSymbols.put("{INDEX}", "{INDEX}");
        popPointerSymbols.put("{SYM_INDEX}", "{SYM_INDEX}");
        asmCommandSymbol.put("pop_pointer", popPointerSymbols);

        HashMap<String, String> popTempSymbols = new HashMap<>();
        popTempSymbols.put("template", "pop_temp.template");
        popTempSymbols.put("{SEGMENT}", "TEMP");
        popTempSymbols.put("{ADDR}", "R5");
        popTempSymbols.put("{INDEX}", "{INDEX}");
        asmCommandSymbol.put("pop_temp", popTempSymbols);

        HashMap<String, String> popStaticSymbols = new HashMap<>();
        popStaticSymbols.put("template", "pop_static.template");
        popStaticSymbols.put("{FILE_NAME}", "{FILE_NAME}");
        popStaticSymbols.put("{INDEX}", "{INDEX}");
        asmCommandSymbol.put("pop_static", popStaticSymbols);

        //label
        HashMap<String, String> labelSymbols = new HashMap<>();
        labelSymbols.put("template", "label.template");
        labelSymbols.put("{LABEL}", "{LABEL}");
        labelSymbols.put("{FUNC_NAME}", "{FUNC_NAME}");
        asmCommandSymbol.put("label", labelSymbols);

        //if-goto
        HashMap<String, String> ifGotoSymbols = new HashMap<>();
        ifGotoSymbols.put("template", "if-goto.template");
        ifGotoSymbols.put("{LABEL}", "{LABEL}");
        ifGotoSymbols.put("{FUNC_NAME}", "{FUNC_NAME}");
        asmCommandSymbol.put("if-goto", ifGotoSymbols);

        //goto
        HashMap<String, String> gotoSymbols = new HashMap<>();
        gotoSymbols.put("template", "goto.template");
        gotoSymbols.put("{LABEL}", "{LABEL}");
        gotoSymbols.put("{FUNC_NAME}", "{FUNC_NAME}");
        asmCommandSymbol.put("goto", gotoSymbols);

        //call
        HashMap<String, String> callSymbols = new HashMap<>();
        callSymbols.put("template", "call.template");
        callSymbols.put("{FUNC_NAME}", "{FUNC_NAME}");
        callSymbols.put("{ARG_NUM}", "{ARG_NUM}");
        callSymbols.put("{RET_INDEX}", "{RET_INDEX}");
        asmCommandSymbol.put("call", callSymbols);

        //function
        HashMap<String, String> functionSymbols = new HashMap<>();
        functionSymbols.put("template", "function.template");
        functionSymbols.put("{FUNC_NAME}", "{FUNC_NAME}");
        functionSymbols.put("{LCL_NUM}", "{LCL_NUM}");
        asmCommandSymbol.put("function", functionSymbols);

        //return
        HashMap<String, String> returnSymbols = new HashMap<>();
        returnSymbols.put("template", "return.template");
        asmCommandSymbol.put("return", returnSymbols);
    }

}
