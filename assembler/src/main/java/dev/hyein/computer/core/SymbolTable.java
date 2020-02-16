package dev.hyein.computer.core;

import lombok.Data;
import org.apache.commons.lang3.StringUtils;

import java.util.HashMap;
import java.util.Map;

@Data
public class SymbolTable {
    private Map<String, String> symbolTable;
    private int currentAddress;

    public SymbolTable(){
        symbolTable = new HashMap<>();
        addDefaultSymbols();

        currentAddress = 16;
    }

    private void addDefaultSymbols() {
        symbolTable.put("SP", getBinary16bitString(0));
        symbolTable.put("LCL", getBinary16bitString(1));
        symbolTable.put("ARG", getBinary16bitString(2));
        symbolTable.put("THIS", getBinary16bitString(3));
        symbolTable.put("THAT", getBinary16bitString(4));
        symbolTable.put("R0", getBinary16bitString(0));
        symbolTable.put("R1", getBinary16bitString(1));
        symbolTable.put("R2", getBinary16bitString(2));
        symbolTable.put("R3", getBinary16bitString(3));
        symbolTable.put("R4", getBinary16bitString(4));
        symbolTable.put("R5", getBinary16bitString(5));
        symbolTable.put("R6", getBinary16bitString(6));
        symbolTable.put("R7", getBinary16bitString(7));
        symbolTable.put("R8", getBinary16bitString(8));
        symbolTable.put("R9", getBinary16bitString(9));
        symbolTable.put("R10", getBinary16bitString(10));
        symbolTable.put("R11", getBinary16bitString(11));
        symbolTable.put("R12", getBinary16bitString(12));
        symbolTable.put("R13", getBinary16bitString(13));
        symbolTable.put("R14", getBinary16bitString(14));
        symbolTable.put("R15", getBinary16bitString(15));
        symbolTable.put("SCREEN", getBinary16bitString(16384));
        symbolTable.put("KBD", getBinary16bitString(24576));
    }


    //label (LOOP)
    public void addEntryIfNotExist(String symbol, int address){
        if(!isContainsSymbol(symbol)){
            addEntry(symbol, address);
        }
    }

    // variable @i
    public void addEntryIfNotExist(String symbol){
        if(!isContainsSymbol(symbol)){
            addEntry(symbol, currentAddress);
            currentAddress++;
        }
    }

    private void addEntry(String symbol, int address){
        symbolTable.put(symbol, getBinary16bitString(address));
    }

    public Boolean isContainsSymbol(String symbol){
        return symbolTable.containsKey(symbol);
    }


    public String getAddress(String symbol){
        return symbolTable.get(symbol);
    }

    public String getBinary16bitString(int decimal){
        return StringUtils.leftPad(Integer.toBinaryString(decimal), 16, '0');
    }
}
