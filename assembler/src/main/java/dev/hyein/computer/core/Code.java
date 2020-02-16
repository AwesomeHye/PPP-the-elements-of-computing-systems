package dev.hyein.computer.core;

import dev.hyein.computer.type.CommandType;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * TRANSLATE parsed command To binary code
 */
@Slf4j
@Data
public class Code {
    /**
     * translate without symbol assembly
     * @param parsedAssembly
     * @return
     */
    public List<String> translate(List<Map<String, String>> parsedAssembly){
        List<String> translateParsedAssembly = new ArrayList<>();

        for (Map<String, String> parsedCommand: parsedAssembly) {
            StringBuilder binaryLine = new StringBuilder();

            CommandType commandType = CommandType.valueOf(parsedCommand.get("commandType"));
            switch (commandType){
                case C_COMMAND:
                    binaryLine.append(1).append(1).append(1)
                            .append(translateComp(parsedCommand.get("comp")))
                            .append(translateDest(parsedCommand.get("dest")))
                            .append(translateJump(parsedCommand.get("jump")));
                    break;
                case A_COMMAND:
                    translateACommand(parsedCommand, binaryLine);
                    break;
            }

            translateParsedAssembly.add(binaryLine.toString());
        }

        return translateParsedAssembly;
    }

    /**
     * translate with symbol assembly
     * @param parsedAssembly
     * @param symbolTable
     * @return
     */
    public List<String> translate(List<Map<String, String>> parsedAssembly, SymbolTable symbolTable){
        List<String> translateParsedAssembly = new ArrayList<>();

        for (Map<String, String> parsedCommand: parsedAssembly) {
            StringBuilder binaryLine = new StringBuilder();

            CommandType commandType = CommandType.valueOf(parsedCommand.get("commandType"));
            switch (commandType){
                case C_COMMAND:
                    binaryLine.append(1).append(1).append(1)
                            .append(translateComp(parsedCommand.get("comp")))
                            .append(translateDest(parsedCommand.get("dest")))
                            .append(translateJump(parsedCommand.get("jump")));
                    break;
                case A_COMMAND:
                    translateACommand(parsedCommand, symbolTable, binaryLine);
                    break;
            }

            translateParsedAssembly.add(binaryLine.toString());
        }

        return translateParsedAssembly;
    }

    //without symbol
    private void translateACommand(Map<String, String> parsedCommand, StringBuilder binaryLine) {
        String symbol = parsedCommand.get("symbol");

        if(StringUtils.isNumeric(symbol.substring(0, 1))){
            // symbol is decimal
            Integer decimal = Integer.valueOf(symbol);
            if(decimal > 32767) { // 0111 1111 1111 1111
                log.error("number is exceeded: {}", decimal);
                throw new OutOfMemoryError();
            } else {
                binaryLine.append(StringUtils.leftPad(Integer.toBinaryString(decimal), 16, "0"));
            }
        }
    }

    //with symbol
    private void translateACommand(Map<String, String> parsedCommand, SymbolTable symbolTable, StringBuilder binaryLine) {
        String symbol = parsedCommand.get("symbol");

        if(StringUtils.isNumeric(symbol.substring(0, 1))){
            // symbol is decimal
            Integer decimal = Integer.valueOf(symbol);
            if(decimal > 32767) { // 0111 1111 1111 1111
                log.error("number is exceeded: {}", decimal);
                throw new OutOfMemoryError();
            } else {
                binaryLine.append(StringUtils.leftPad(Integer.toBinaryString(decimal), 16, "0"));
            }
        } else {
            // symbol is label
            binaryLine.append(symbolTable.getAddress(symbol));
        }
    }

    private String translateComp(String compCommand){
        StringBuilder compBinary = new StringBuilder();
        char register;

        if(compCommand.contains("M")){
            register = 'M';
            compBinary.append(1);
        } else {
            register = 'A';
            compBinary.append(0);
        }

        switch (compCommand){
            case "0":
                return compBinary.append("101010").toString();
            case "1":
                return compBinary.append("111111").toString();
            case "-1":
                return compBinary.append("111010").toString();
            case "D":
                return compBinary.append("001100").toString();
            case "!D":
                return compBinary.append("001101").toString();
            case "-D":
                return compBinary.append("001111").toString();
            case "D+1":
                return compBinary.append("011111").toString();
            case "D-1":
                return compBinary.append("001110").toString();
        }

        if(compCommand.equals(String.valueOf(register)))
            return compBinary.append("110000").toString();
        else if (compCommand.equals("!" + register))
            return compBinary.append("110001").toString();
        else if (compCommand.equals("-" + register))
            return compBinary.append("110011").toString();
        else if (compCommand.equals(register + "+1"))
            return compBinary.append("110111").toString();
        else if (compCommand.equals(register + "-1"))
            return compBinary.append("110010").toString();
        else if (compCommand.equals("D+" + register))
            return compBinary.append("000010").toString();
        else if (compCommand.equals("D-" + register))
            return compBinary.append("010011").toString();
        else if (compCommand.equals(register + "-D"))
            return compBinary.append("000111").toString();
        else if (compCommand.equals("D&" + register))
            return compBinary.append("000000").toString();
        else if (compCommand.equals("D|" + register))
            return compBinary.append("010101").toString();

        log.error("invalid comp command: {}", compCommand);
        throw new RuntimeException();
    }

    private String translateDest(String destCommand){
        switch (destCommand){
            case "null":
                return "000";
            case "M":
                return "001";
            case "D":
                return "010";
            case "MD":
                return "011";
            case "A":
                return "100";
            case "AM":
                return "101";
            case "AD":
                return "110";
            case "AMD":
                return "111";
            default:
                log.error("wrong dest command: {}", destCommand);
                throw new RuntimeException();
        }
    }

    private String translateJump(String jumpCommand){
        switch (jumpCommand){
            case "null":
                return "000";
            case "JGT":
                return "001";
            case "JEQ":
                return "010";
            case "JGE":
                return "011";
            case "JLT":
                return "100";
            case "JNE":
                return "101";
            case "JLE":
                return "110";
            case "JMP":
                return "111";
            default:
                log.error("wrong jump command: {}", jumpCommand);
                throw new RuntimeException();
        }    }
}
