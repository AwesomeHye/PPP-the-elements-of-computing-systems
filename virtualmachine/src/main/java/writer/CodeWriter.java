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
    private Map<String, Map<String, String>> asmCommandSymbol;

    public CodeWriter(){
        try {
            templatePath = Paths.get(getClass().getClassLoader().getResource("sourcefiles/asmTemplate").toURI());
            asmCommandSymbol = new LinkedHashMap<>();
            initAsmCommandSymbol();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }

    }


    /**
     * insert and translate parsed command to assembly
     * @param intermediateCodeComponentsList
     * @return
     */
    public List<String> translateAssemblyCode(List<Map<String, String>> intermediateCodeComponentsList) {
        List<String> assembly = new ArrayList<>();

        for(Map<String, String> codeComponents: intermediateCodeComponentsList){
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
            }
            assemblyLineNum=assembly.stream().filter(line -> !line.startsWith("//")).collect(Collectors.toList()).size();
        }
        return assembly;
    }

    /**
     * translate push, pop command to assembly
     * @param action push | pop
     * @param codeComponents VMComponents
     * @return assembly
     */
    private List<String> writePushPop(String action, Map<String, String> codeComponents) {
        List<String> asm = new ArrayList<>();
        String segment = codeComponents.get("arg1");
        String index = codeComponents.get("arg2");

        Map<String, String> asmCommandComponents = asmCommandSymbol.get(action + "_" + segment);
        //set dynamic data
        //constant
        if(asmCommandComponents.containsKey("{NUM}"))
            asmCommandComponents.replace("{NUM}", index);
        //pointer
        if(asmCommandComponents.containsKey("{SYM_INDEX}")) {
            if ((index.equals("0"))) {
                asmCommandComponents.replace("{SYM_INDEX}", "");
            } else {
                asmCommandComponents.replace("{SYM_INDEX}", "+1");
            }
        }
        //static
        if(asmCommandComponents.containsKey("{FILE_NAME}")) {
            asmCommandComponents.replace("{FILE_NAME}", codeComponents.get("filename"));
        }

        //others
        if(asmCommandComponents.containsKey("{INDEX}")) {
            asmCommandComponents.replace("{INDEX}", index);
        }

        try {

            //set static data
            currentTemplatePath = templatePath.resolve(asmCommandComponents.get("template"));
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
     * translate arithmetic command to assembly
     * @param op add, sub, neg, eq, gt, lt, and, or, not
     * @return assembly
     */
    private List<String> writeArithmetic(String op) {
        Map<String, String> asmCommandComponents = asmCommandSymbol.get(op);
        currentTemplatePath = templatePath.resolve(asmCommandComponents.get("template"));
        if(asmCommandComponents.containsKey("{TRUE_LINE}"))
            asmCommandComponents.replace("{TRUE_LINE}", String.valueOf(assemblyLineNum+17));
        if(asmCommandComponents.containsKey("{END}"))
            asmCommandComponents.replace("{END}", String.valueOf(assemblyLineNum+21));

        List<String> asm = new ArrayList<>();
        try {
            asm = Files.readAllLines(currentTemplatePath);

            for(String line: asm){
                for(String key: asmCommandComponents.keySet().stream().filter(key -> !key.equals("template")).collect(Collectors.toList())){
                    if(line.contains(key))
                        asm.set(asm.indexOf(line), line.replace(key,asmCommandComponents.get(key)));
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
        eqSymbols.put("{TRUE_LINE}", "{TRUE_LINE}");
        eqSymbols.put("{JUMP}", "JEQ");
        eqSymbols.put("{END}", "{END}");
        asmCommandSymbol.put("eq", eqSymbols);

        HashMap<String, String> gtSymbols = new HashMap<>();
        gtSymbols.put("template", "boolean-arithmetic.template");
        gtSymbols.put("{op}", "gt");
        gtSymbols.put("{SYM}", "-");
        gtSymbols.put("{CMP_SYM}", ">");
        gtSymbols.put("{TRUE_LINE}", "{TRUE_LINE}");
        gtSymbols.put("{JUMP}", "JGT");
        gtSymbols.put("{END}", "{END}");
        asmCommandSymbol.put("gt", gtSymbols);

        HashMap<String, String> ltSymbols = new HashMap<>();
        ltSymbols.put("template", "boolean-arithmetic.template");
        ltSymbols.put("{op}", "lt");
        ltSymbols.put("{SYM}", "-");
        ltSymbols.put("{CMP_SYM}", "<");
        ltSymbols.put("{TRUE_LINE}", "{TRUE_LINE}");
        ltSymbols.put("{JUMP}", "JLT");
        ltSymbols.put("{END}", "{END}");
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

    }

}
