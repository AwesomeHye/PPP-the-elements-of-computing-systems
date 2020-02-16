package dev.hyein.computer.core;

import dev.hyein.computer.type.CommandType;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

import java.util.*;

/**
 * PARSE hack assembly
 */
@Data
@Slf4j
public class Parser {
    private Iterator<String> assemblyIterator;
    private List<Map<String, String>> parsedAssembly = new ArrayList<>();

    private String currentCommand;
    private Map<String, String> parsedCurrentCommand;

    /**
     *
     * @param assembly D=M+D | @15
     * @return commandType:C_COMMAND, dest:D, comp:M+D | commandType:A_COMMAND, symbol:15
     */
    public List<Map<String, String>> parse(List<String> assembly){
        assemblyIterator = assembly.iterator();

        while(hasMoreCommands()){
            currentCommand = advance();

            parsedCurrentCommand = new LinkedHashMap<>();
            parsedCurrentCommand.put("commandType", getCommandType().name());
            switch (getCommandType()) {
                case C_COMMAND:
                    parsedCurrentCommand.put("dest", getDest());
                    parsedCurrentCommand.put("comp", getComp());
                    parsedCurrentCommand.put("jump", getJump());
                    break;
                case A_COMMAND:
                case L_COMMAND:
                    parsedCurrentCommand.put("symbol", getSymbol());
                    break;
            }

            parsedAssembly.add(parsedCurrentCommand);
        }

        return parsedAssembly;
    }

    private boolean hasMoreCommands(){
        return assemblyIterator.hasNext();
    }

    private String advance(){
        return assemblyIterator.next();
    }

    private CommandType getCommandType() {
        if(currentCommand.startsWith("@"))
            return CommandType.A_COMMAND;
        else if (currentCommand.startsWith("(") && currentCommand.endsWith(")"))
            return CommandType.L_COMMAND;
        else if(currentCommand.contains("=") || currentCommand.contains(";"))
            return CommandType.C_COMMAND;
        else {
            log.error("PARSE ERROR: {}", currentCommand);
            throw new RuntimeException();
        }
    }

    private String getSymbol(){
        switch (getCommandType()){
            case A_COMMAND:
                return currentCommand.replace("@", "");
            case L_COMMAND:
                return currentCommand.replace("(", "").replace(")", "");
            default:
                log.error("symbol has to be A or L COMMEND");
                throw new RuntimeException();
        }
    }

    private String getDest(){
        if(currentCommand.contains("="))
            return currentCommand.split("=")[0];
        else
            return "null";
    }

    private String getComp(){
        if(currentCommand.contains("="))
            return currentCommand.split("=")[1];
        else if(currentCommand.contains(";"))
            return currentCommand.split(";")[0];
        else
            return "null";
    }

    private String getJump(){
        if(currentCommand.contains(";"))
            return currentCommand.split(";")[1];
        else
            return "null";
    }
}
