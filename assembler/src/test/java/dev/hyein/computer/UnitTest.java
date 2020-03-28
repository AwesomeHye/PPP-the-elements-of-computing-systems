package dev.hyein.computer;

import static org.junit.Assert.assertTrue;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.junit.Test;
import static org.junit.Assert.*;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Enumeration;
import java.util.List;

/**
 * Unit test for simple App.
 */
@Slf4j
public class UnitTest
{
    @Test
    public void getResourcePathByThread() throws IOException, URISyntaxException {

        Enumeration<URL> urls = Thread.currentThread().getContextClassLoader().getResources("asm");

        while(urls.hasMoreElements()){
            URL url = urls.nextElement();
            log.info("url: {}", url);
            Files.walk(Paths.get(url.toURI())).filter(path -> path.toFile().isFile()).forEach(path -> {
                try {
                    File file = path.toFile();
                    log.info("file: "+ file);
                    List<String> input = FileUtils.readLines(file, StandardCharsets.UTF_8);
                    log.info("content: {}", input);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            });

        }
    }

    @Test
    public void getResourcePath() throws IOException, URISyntaxException {

        URL url = getClass().getClassLoader().getResource("asm");
        log.info("url: {}", url); // file:/D:/Programming/workspace/JAVA/Local/LECTURE/PPP_COMPUTING_SYSTEM/assembler/target/classes/asm

        Files.walk(Paths.get(url.toURI())).filter(path -> path.toFile().isFile()).forEach(path -> {
            try {
                File file = path.toFile();
                log.info("file: "+ file);
                List<String> input = FileUtils.readLines(file, StandardCharsets.UTF_8);
                log.info("content: {}", input);
            } catch (IOException e) {
                e.printStackTrace();
            }
        });

    }

    @Test
    public void issNumeric(){
        assertFalse(StringUtils.isNumeric(""));
        assertFalse(StringUtils.isNumeric("-1"));
        assertFalse(NumberUtils.isCreatable(""));
        assertTrue(NumberUtils.isCreatable("-1"));
        assertTrue(NumberUtils.isParsable("-1"));
    }

    @Test
    public void lpad(){
        log.info(StringUtils.leftPad(Integer.toBinaryString(2), 16, "0"));
    }
}
