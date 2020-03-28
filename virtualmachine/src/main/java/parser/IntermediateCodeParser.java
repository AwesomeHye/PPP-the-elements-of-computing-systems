package parser;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import type.CommandType;

import java.util.*;
import java.util.stream.Collectors;
@Slf4j
public class IntermediateCodeParser {
    Iterator<String> intermediateCodeIterator;
    List<Map<String, String>> parsedVMCommand;

    String currentCommand;
    Map<String, String> parsedCurrentCommand;

    /**
     * parse vm codes and set components
     * @param intermediateCodes Map<directoryName, Map<fileName, vm_codes>> intermediateCode
     * @return parsed components(commandtype, arg1, arg2, filename(for static variable)) by line
     */
    public List<Map<String, String>> parse(Map<String, Map<String, List<String>>> intermediateCodes) {
        parsedVMCommand = new ArrayList<>();

        for(String directoryName: intermediateCodes.keySet()) {
            for (String fileName : intermediateCodes.get(directoryName).keySet()) {
                //refine vm file content
                List<String> refinedIntermediateCode = refineIntermediateCode(intermediateCodes.get(directoryName).get(fileName));
                intermediateCodeIterator = refinedIntermediateCode.iterator();

                //parse line by line
                CommandType commandType;
                while (hasMoreCommands()) {
                    advance();

                    parsedCurrentCommand = new LinkedHashMap<>();
                    parsedCurrentCommand.put("directoryname", directoryName);
                    parsedCurrentCommand.put("filename", fileName.split("\\.")[0]);

                    commandType = getCommandType();
                    parsedCurrentCommand.put("commandtype", commandType.name());

                    if (commandType != CommandType.C_RETURN)
                        parsedCurrentCommand.put("arg1", getArg1(commandType));

                    if (commandType == CommandType.C_PUSH || commandType == CommandType.C_POP || commandType == CommandType.C_FUNCTION || commandType == CommandType.C_CALL)
                        parsedCurrentCommand.put("arg2", String.valueOf(getArg2(commandType)));

                    parsedVMCommand.add(parsedCurrentCommand);
                }
            }
        }

        return parsedVMCommand;
    }

    //trim, 주석 제거, 빈 줄 제거
    private List<String> refineIntermediateCode(List<String> rawAssembly) {
        return rawAssembly.stream()
                .map(line -> line.trim().replaceFirst("//.*", ""))
                .filter(StringUtils::isNotEmpty)
                .collect(Collectors.toList());
    }

    private boolean hasMoreCommands(){
        return intermediateCodeIterator.hasNext();
    }

    private void advance(){
        currentCommand = intermediateCodeIterator.next();
    }

    private CommandType getCommandType(){
        String command = currentCommand.split(" ")[0];
        switch (command){
            case "add":
            case "sub":
            case "neg":
            case "eq":
            case "gt":
            case "lt":
            case "and":
            case "or":
            case "not":
                return CommandType.C_ARITHMETIC;
            case "push":
                return CommandType.C_PUSH;
            case "pop":
                return CommandType.C_POP;
            case "label":
                return CommandType.C_LABEL;
            case "goto":
                return CommandType.C_GOTO;
            case "if-goto":
                return CommandType.C_IF;
            case "function":
                return CommandType.C_FUNCTION;
            case "return":
                return CommandType.C_RETURN;
            case "call":
                return CommandType.C_CALL;
            default:
                log.error("invalid command type: {}", command);
                throw new RuntimeException();
        }
    }

    private String getArg1(CommandType commandType){
        switch (commandType){
            case C_ARITHMETIC:
                return currentCommand.split(" ")[0];
            case C_PUSH:
            case C_POP:
            case C_FUNCTION:
            case C_CALL:
            case C_LABEL:
            case C_GOTO:
            case C_IF:
                return currentCommand.split(" ")[1];

            default:
                return currentCommand.split(" ")[1];
        }
    }

    private Integer getArg2(CommandType commandType) {
        String value = currentCommand.split(" ")[2].trim();
        if (StringUtils.isNotEmpty(value))
            return Integer.valueOf(value);
        else {
            log.error("do not have second argument: {}", currentCommand);
            throw new RuntimeException();
        }
    }

}
