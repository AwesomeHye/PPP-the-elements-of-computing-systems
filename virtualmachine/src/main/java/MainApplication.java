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
import java.util.*;
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

      //Map<directoryName(for static), Map<fileName, fileContent>>
      AtomicReference<Map<String, Map<String, List<String>>>> intermediateFileWithDirectory = new AtomicReference<>(new HashMap<>());
      //Map<fileName, fileContent>
      AtomicReference<Map<String, List<String>>> intermediateFile= new AtomicReference<>(new LinkedHashMap<>());
      AtomicReference<Path> targetFilePath = new AtomicReference<>();
      AtomicReference<List<String>> assembly = new AtomicReference<>(new ArrayList<>());

      // each directory
      Files.walk(sourcePath).filter(path -> path.toFile().isDirectory()).forEach(parentPath -> {
         Map<String, List<String>> tmpFile= new HashMap<>();


         //get Intermediate Code
         try {
            Files.list(parentPath).filter(filePath -> filePath.toString().endsWith(".vm")).forEach(filePath -> {
               String fileName = filePath.getFileName().toString();
               log.info("INPUT: {}", filePath.toString());
               try {
                  tmpFile.put(fileName, Files.readAllLines(filePath));
//                  intermediateFile.get().put(fileName, Files.readAllLines(filePath));
               } catch (IOException e) {
                  e.printStackTrace();
               }

            });


            //if Intermediate Code is exist
            if( !tmpFile.isEmpty() ) {
               //if Sys.vm is exist, put first
               tmpFile.keySet().stream().sorted((a, b) -> {
                  if(a.equals("Sys.vm"))
                     return -1;
                  else
                     return 0;
               }).forEach(f -> {
                  intermediateFile.get().put(f, tmpFile.get(f));
               });


               String directoryName = parentPath.getFileName().toString();
               intermediateFileWithDirectory.get().put(directoryName, intermediateFile.get());

               //translate Intermediate Code to Assembly
               assembly.get().addAll(vmTranslator.translate(intermediateFileWithDirectory.get()));

               //write Assembly to Target Path
               targetFilePath.set(parentPath.resolve(parentPath.getFileName().toString().concat(".asm")));
               Files.deleteIfExists(targetFilePath.get());
               Files.createDirectories(targetFilePath.get().getParent());
               Files.write(targetFilePath.get(), assembly.get(), StandardOpenOption.CREATE_NEW);


               //post processing
               assembly.get().clear();
               intermediateFileWithDirectory.get().clear();
               intermediateFile.get().clear();

               log.info("OUTPUT: {}", targetFilePath.toString());
               log.info("==================================================================================================================================\n", parentPath);
         }
         } catch (IOException e) {
            e.printStackTrace();
         }
      });




   }
}
