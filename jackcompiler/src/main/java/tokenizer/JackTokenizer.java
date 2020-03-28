package tokenizer;

import enumm.KeywordType;
import enumm.TokenType;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.math.NumberUtils;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@Slf4j
@Data
public class JackTokenizer {
    private List<Path> inputJackFiles;

    private Iterator<String> tokenIterator;
    private String currentToken;

    private Path currentPath;
    private Document xmlDocument;

    private List<String> mappingTokens;


    public JackTokenizer(){
        this.mappingTokens = new ArrayList<>();
    }

    public JackTokenizer(Path inputRootPath) {
        this();
        gatherJackFiles(inputRootPath);
    }

    /**
     * gather jack files
     *
     * if path is directory, gather all jack files
     * else, add jack file
     * @param inputRootPath
     */
    public JackTokenizer gatherJackFiles(Path inputRootPath) {
        if(Files.isDirectory(inputRootPath)){
            try {
                this.inputJackFiles = Files.walk(inputRootPath).filter(path -> path.toString().endsWith(".jack")).collect(Collectors.toList());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else {
            if(inputRootPath.toString().endsWith(".jack"))
                this.inputJackFiles.add(inputRootPath);
        }
        return this;
    }

    /**
     * refine & load jack code line
     * set currentPath, tokenIterator
     * @param path
     * @return
     */
    public JackTokenizer readFile(Path path) {
        try {
            currentPath = path;
            List<String> tokens = new ArrayList<>();
            String rawJackCode = getRefinedJackCode(Files.readAllLines(path));

            Pattern pattern = Pattern.compile("\"[^\"]*\"");
            Matcher matcher = pattern.matcher(rawJackCode);

            int currentPosition = 0;
            while(matcher.find()){
                tokens.addAll(Arrays.asList(rawJackCode.substring(currentPosition, matcher.start()).replaceAll("([^A-Za-z0-9])", " $1 ").replaceAll("\\s+", " ").trim().split(" ")));
                tokens.add(rawJackCode.substring(matcher.start(), matcher.end()));
                currentPosition = matcher.end();
            }
            if(currentPosition <= rawJackCode.length()){
                tokens.addAll(Arrays.asList(rawJackCode.substring(currentPosition).replaceAll("([^A-Za-z0-9])", " $1 ").replaceAll("\\s+", " ").trim().split(" ")));
            }
            tokenIterator = tokens.iterator();

        } catch (IOException e) {
            e.printStackTrace();
        }
        return this;
    }

    /**
     * preprocess to white-space tokenizing the jack code string & remove comments
     * @param rawJackCode
     * @return single line jack code
     */
    private String getRefinedJackCode(List<String> rawJackCode) {
        // remove single-line comment
        List<String> lines = rawJackCode.stream().map(line -> {
            if(line.contains("//")){
                return line.split("\\/\\/")[0];
            }
            return line;
        })
                .filter(line -> !line.trim().isEmpty())
                .collect(Collectors.toList());

        // remove multi-line comment & white-space tokenization
        StringBuilder oneLineWithAnnotation = new StringBuilder();
        lines.forEach(line -> oneLineWithAnnotation.append(line));
        return oneLineWithAnnotation.toString().replaceAll("\\/\\*((?!\\*\\/).)*\\*\\/", ""); //remove multi-line comment
//                .replaceAll("([^A-z])", " $1 ") //symbol left, right padding
//                .replaceAll("\" ((?!\").)* \"", "\"$1\"") //deal STRING_CONST
//                .replaceAll("\\s+", " ");
    }


    public JackTokenizer analyze() {
        TokenType currentTokenType;
        while (hasMoreTokens()) {
            advance();

            currentTokenType = getTokenType();
            mappingTokens.add(currentTokenType.getTagName()+ "___" + getTokenValue(currentTokenType));

        }


        return this;
    }

    private Boolean hasMoreTokens(){
        return tokenIterator.hasNext();
    }

    private void advance(){
        currentToken = tokenIterator.next();
    }

    private TokenType getTokenType(){
        if(currentToken.length() == 1 && currentToken.matches("[^a-zA-Z0-9가-힣]"))
            return TokenType.SYMBOL;

        if(NumberUtils.isCreatable(currentToken))
            return TokenType.INT_CONST;

        if(currentToken.matches("\"[^\"]*\""))
            return TokenType.STRING_CONST;

        if(KeywordType.getKeywordList().contains(currentToken.toUpperCase()))
            return TokenType.KEYWORD;

        return TokenType.IDENTIFIER;
    }

    private String getTokenValue(TokenType tokenType){
        switch (tokenType){
            case KEYWORD:
                return getKeyword();
            case SYMBOL:
                return getSymbol();
            case IDENTIFIER:
                return getIdentifier();
            case INT_CONST:
                return getIntVal();
            case STRING_CONST:
                return getStringVal();
            default:
                throw new RuntimeException("invalid tokenType: " + tokenType.name());
        }
    }

    private String getKeyword() {
        return currentToken;
    }

    private String getSymbol() {
        return currentToken;

    }

    private String getIdentifier() {
        return currentToken;

    }

    private String getIntVal() {
        return currentToken;

    }

    private String getStringVal() {
        return currentToken.replaceAll("\"", "");

    }


    /**
     * parse jack code and create xml document
     * @return
     * @throws ParserConfigurationException
     */
    public JackTokenizer parseTokensToXmlFormat()  {
        try {
            //create Document for XML
            DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder documentBuilder = null;

            documentBuilder = documentBuilderFactory.newDocumentBuilder();

            xmlDocument = documentBuilder.newDocument();
            xmlDocument.setXmlStandalone(true);

            Element tokens = xmlDocument.createElement("tokens");
            xmlDocument.appendChild(tokens);

            createTokenElement(xmlDocument, tokens);
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        }
        return this;
    }

    private void createTokenElement(Document doc, Element tokens) {
        String tokenType, value;
        for(String mappingToken: mappingTokens){
            tokenType = mappingToken.split(Pattern.quote("___"))[0];
            value = mappingToken.split(Pattern.quote("___"))[1];
            Element keyword = doc.createElement(tokenType);
            keyword.appendChild(doc.createTextNode(value));
            tokens.appendChild(keyword);
        }
    }


    /**
     * write xml document to file
     */
    public void writeXml() {
        try {

            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            transformer.setOutputProperty(OutputKeys.DOCTYPE_PUBLIC, "yes");

            String outputPath = currentPath.getParent().resolve("output").resolve(currentPath.getFileName().toString().split("\\.")[0].concat("T.xml")).toString();
            if(Files.notExists(Paths.get(outputPath).getParent())){
                Files.createDirectory(Paths.get(outputPath).getParent());
            }
            if(Files.notExists(Paths.get(outputPath))) {
                Files.createFile(Paths.get(outputPath));
            }

            Result result = new StreamResult(new BufferedOutputStream(new FileOutputStream(outputPath)));
            transformer.transform(new DOMSource(xmlDocument), result);
            transformer.transform(new DOMSource(xmlDocument), new StreamResult(System.out));


            mappingTokens.clear();
        } catch (Exception e){
            e.printStackTrace();
        }
    }


}
