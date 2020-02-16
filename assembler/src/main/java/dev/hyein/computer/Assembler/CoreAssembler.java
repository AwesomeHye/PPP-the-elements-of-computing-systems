package dev.hyein.computer.Assembler;

import dev.hyein.computer.core.Code;
import dev.hyein.computer.core.Parser;
import lombok.Data;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Data
public class CoreAssembler {
    private List<String> assembly;
    private Parser parser;
    private Code code;

    public CoreAssembler (){
        parser = new Parser();
        code = new Code();
    }

    public List<String> translate(List<String> assembly){
        List<Map<String, String>> parsedAssembly = parser.parse(assembly);

        return code.translate(parsedAssembly);
    }
}
