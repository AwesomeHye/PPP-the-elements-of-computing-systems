package dev.hyein.computer;

import dev.hyein.computer.Assembler.Assembler;
import dev.hyein.computer.Assembler.CoreAssembler;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;

@Slf4j
public class AssemblerWithSymbolTest {
    Path sourcePath;
    Path targetPath;

    /**
     * input asm files: D:\Programming\workspace\JAVA\Local\LECTURE\PPP_COMPUTING_SYSTEM\assembler\target\classes\asm
     * output hack files: D:\Programming\workspace\JAVA\Local\LECTURE\PPP_COMPUTING_SYSTEM\assembler\hack
     * @throws URISyntaxException
     */
    @Before
    public void setPath() throws URISyntaxException {
        sourcePath = Paths.get(getClass().getClassLoader().getResource("asm").toURI());
        targetPath = Paths.get("hack");
        log.info("targetPath: {}", targetPath.toAbsolutePath());
        log.info("sourcePath: {}", sourcePath);
    }

    // assembly without symbol
    @Test
    public void coreAssembler() throws IOException {
        CoreAssembler coreAssembler = new CoreAssembler();


        log.info("====================================== write by coreAssembler ======================================");
        Files.walk(sourcePath).filter(path -> path.toString().endsWith("L.asm")).forEach(path -> {

            writeHackFiles(coreAssembler, path);

        });
        log.info("====================================================================================================");

    }

    // assembly with symbol
    @Test
    public void assembler() throws IOException {
        CoreAssembler assembler = new Assembler();

        log.info("====================================== write by assembler ======================================");
        Files.walk(sourcePath).filter(path -> path.toString().endsWith(".asm"))
                .filter(path -> !path.toString().endsWith("L.asm"))
                .forEach(path -> {

            writeHackFiles(assembler, path);

        });
        log.info("====================================================================================================");
    }

    private void writeHackFiles(CoreAssembler coreAssembler, Path path) {
        AtomicReference<List<String>> assembly = new AtomicReference<>(Collections.emptyList());
        AtomicReference<List<String>> binaryCode = new AtomicReference<>(Collections.emptyList());
        AtomicReference<String> fileName = new AtomicReference<>();
        AtomicReference<Path> filePath = new AtomicReference<>();

        try {
            //read assembly
            assembly.set(refineAssembly(path));

            //translate assemblyIterator to binary code
            binaryCode.set(coreAssembler.translate(assembly.get()));

            //set path
            fileName.set(path.getFileName().toString().split("\\.")[0].concat(".hack"));
            filePath.set(targetPath.toAbsolutePath().resolve(fileName.get()));
            log.info(""+filePath.get());

            //write binary code
            Files.deleteIfExists(filePath.get());
            Files.createDirectories(filePath.get().getParent());;
            Files.write(filePath.get(), binaryCode.get(), StandardOpenOption.CREATE_NEW);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //공백제거, 주석 제거, 빈 줄 제거
    private List<String> refineAssembly(Path assemblyPath){
        List<String> refindAssembly = new ArrayList<>();
        try {
            List<String> assembly = Files.readAllLines(assemblyPath);
            refindAssembly = assembly.stream()
                    .map(line -> line.replace(" ", "").replaceFirst("//.*", ""))
                    .filter(StringUtils::isNotEmpty)
                    .collect(Collectors.toList());

        } catch (IOException e) {
            e.printStackTrace();
        }
        return refindAssembly;
    }

}
