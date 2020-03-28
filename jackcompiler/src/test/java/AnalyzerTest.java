import engine.CompilationEngine;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import tokenizer.JackTokenizer;

import java.net.URISyntaxException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;

@Slf4j
public class AnalyzerTest {

    @Test
    public void getFiles() throws URISyntaxException {
        Path inputRootPath = Paths.get(getClass().getClassLoader().getResource("jack").toURI());
        JackTokenizer jackTokenizer = new JackTokenizer(inputRootPath);
        log.info(Arrays.deepToString(jackTokenizer.getInputJackFiles().toArray())); //D:\Programming\workspace\JAVA\Local\LECTURE\PPP_COMPUTING_SYSTEM\jackcomplier\target\classes\jack\Square\Main.jack ...
    }

    @Test
    public void tokenize() throws URISyntaxException {
        Path inputRootPath = Paths.get(getClass().getClassLoader().getResource("jack").toURI());
        JackTokenizer jackTokenizer = new JackTokenizer(inputRootPath);
        jackTokenizer.getInputJackFiles().forEach(path -> {
            jackTokenizer.readFile(path)
                    .analyze()
                    .parseTokensToXmlFormat()
                    .writeXml();
        });
    }

    @Test
    public void compile() throws URISyntaxException {
        Path inputRootPath = Paths.get(getClass().getClassLoader().getResource("jack").toURI());
        CompilationEngine compilationEngine = new CompilationEngine();
        JackTokenizer jackTokenizer = new JackTokenizer(inputRootPath);
        jackTokenizer.getInputJackFiles().forEach(path -> {
            compilationEngine.setMappingTokens(jackTokenizer.readFile(path).analyze().parseTokensToXmlFormat().getXmlDocument())
                            .compile()
                            .writeXml();
        });

    }
}
