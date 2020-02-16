package dev.hyein.computer.Assembler;

import dev.hyein.computer.core.SymbolTable;
import dev.hyein.computer.type.CommandType;
import org.apache.commons.lang3.math.NumberUtils;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class Assembler extends CoreAssembler {
    private SymbolTable symbolTable;

    public Assembler(){
        super();
        symbolTable = new SymbolTable();
    }

    @Override
    public List<String> translate(List<String> assembly) {
        List<Map<String, String>> parsedAssembly = super.getParser().parse(assembly);
        generateSymbolTable(parsedAssembly);


        Iterator<Map<String, String>> iterator = parsedAssembly.iterator();
        while(iterator.hasNext()){
            Map<String, String> parsedCommand = iterator.next();

            if(parsedCommand.get("commandType").equals(CommandType.L_COMMAND.name()))
                iterator.remove();
        }

        return super.getCode().translate(parsedAssembly, symbolTable);
    }

    private void generateSymbolTable(List<Map<String, String>> parsedAssembly) {

        //1-pass
        int linePos = 0;
        for(Map<String, String> parsedCommand: parsedAssembly){
            CommandType commandType = CommandType.valueOf(parsedCommand.get("commandType"));

            if(commandType.equals(CommandType.L_COMMAND)){
                String symbol = parsedCommand.get("symbol");
                symbolTable.addEntryIfNotExist(symbol, linePos);
            } else
                linePos++;

        }

        //2-pass
        for(Map<String, String> parsedCommand: parsedAssembly){
            CommandType commandType = CommandType.valueOf(parsedCommand.get("commandType"));

            if(commandType.equals(CommandType.A_COMMAND)){
                //add symbol table if label
                String symbol = parsedCommand.get("symbol");
                if(!NumberUtils.isDigits(symbol.substring(0, 1))){
                    symbolTable.addEntryIfNotExist(symbol);
                }

            }
        }
    }
}