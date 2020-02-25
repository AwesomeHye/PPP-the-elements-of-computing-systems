import lombok.extern.slf4j.Slf4j;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Slf4j
public class VmTest {
    Path sourcePath;
    Path targetPath;

    /**
     * sourcePath: D:\Programming\workspace\JAVA\Local\LECTURE\PPP_COMPUTING_SYSTEM\virtualmachine\target\classes\sourcefiles
     */
    @Before
    public void setPath() throws URISyntaxException {
        sourcePath = Paths.get(getClass().getClassLoader().getResource("sourcefiles").toURI());
        log.info("sourcePath: {}", sourcePath.toString());
    }


    @Test
    public void executeVm() throws IOException {
        Files.walk(sourcePath).filter(path -> path.toFile().isDirectory()).forEach(parentPath -> {
            try {
                Files.list(parentPath).filter(filePath -> filePath.toString().endsWith(".vm")).forEach(filePath -> {
                    log.info("{}: {}",parentPath.getFileName(),  filePath.toString());
                });

            } catch (IOException e) {
                e.printStackTrace();
            }
        });
        log.info("FF");
    }
}
