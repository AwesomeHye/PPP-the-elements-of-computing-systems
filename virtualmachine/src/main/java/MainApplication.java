import lombok.extern.slf4j.Slf4j;
import parser.IntermediateCodeParser;
import translator.VmTranslator;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;

@Slf4j
public class MainApplication {

   /**
    * sourcePath: D:\Programming\workspace\JAVA\Local\LECTURE\PPP_COMPUTING_SYSTEM\virtualmachine\target\classes\sourcefiles
    */
   public static void main(String[] args) throws URISyntaxException, IOException {
      Path sourcePath = Paths.get(MainApplication.class.getClassLoader().getResource("sourcefiles").toURI());
      IntermediateCodeParser parser = new IntermediateCodeParser();
      VmTranslator vmTranslator = new VmTranslator();

      log.info("source path: {}\n", sourcePath);

      AtomicReference<Map<String, List<String>>> intermediateCode = new AtomicReference<>(new HashMap<>());
      AtomicReference<Path> targetFilePath = new AtomicReference<>();
      AtomicReference<List<String>> assembly = new AtomicReference<>(new ArrayList<>());

      Files.walk(sourcePath).filter(path -> path.toFile().isDirectory()).forEach(parentPath -> {


         //get Intermediate Code
         try {
            Files.list(parentPath).filter(filePath -> filePath.toString().endsWith(".vm")).forEach(filePath -> {
               String fileName = parentPath.getFileName().toString();
               log.info("======================== STARTED ========================");
               log.info("INPUT: {}", filePath.toString());

               try {
                  intermediateCode.get().put(fileName, Files.readAllLines(filePath));
               } catch (IOException e) {
                  e.printStackTrace();
               }

            });


            //if Intermediate Code is exist
            if( !intermediateCode.get().isEmpty() ) {

               //translate Intermediate Code to Assembly
               assembly.get().addAll(vmTranslator.translate(intermediateCode.get()));

               //write Assembly to Target Path
               targetFilePath.set(parentPath.resolve(parentPath.getFileName().toString().concat(".asm")));
               Files.deleteIfExists(targetFilePath.get());
               Files.createDirectories(targetFilePath.get().getParent());
               Files.write(targetFilePath.get(), assembly.get(), StandardOpenOption.CREATE_NEW);


               //post processing
               assembly.get().clear();
               intermediateCode.get().clear();

               log.info("OUTPUT: {}", targetFilePath.toString());
               log.info("======================== FINISHED ========================\n", parentPath);
            }
         } catch (IOException e) {
            e.printStackTrace();
         }
      });




   }
}
