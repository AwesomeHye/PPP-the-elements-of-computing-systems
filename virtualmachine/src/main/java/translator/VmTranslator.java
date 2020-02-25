package translator;

import lombok.extern.slf4j.Slf4j;
import parser.IntermediateCodeParser;
import writer.CodeWriter;

import java.util.List;
import java.util.Map;

@Slf4j
public class VmTranslator {
    IntermediateCodeParser intermediateCodeParser;
    CodeWriter codeWriter;

    public VmTranslator(){
        intermediateCodeParser = new IntermediateCodeParser();
        codeWriter = new CodeWriter();
    }

    /**
     * VM ROLE: translate intermediate code to hack assembly
     * @param intermediateCode Map<fileName, contents> intermediateCode
     * @return assemly
     */
    public List<String> translate(Map<String, List<String>> intermediateCode) {
        List<Map<String, String>> intermediateCodeComponents = intermediateCodeParser.parse(intermediateCode);

        return codeWriter.translateAssemblyCode(intermediateCodeComponents);
    }
}
