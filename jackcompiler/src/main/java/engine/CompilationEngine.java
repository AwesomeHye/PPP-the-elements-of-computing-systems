package engine;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

@Slf4j
@Data
public class CompilationEngine {
    private NodeList tokenizationNodeList;
    private Document xmlCompilationDocument;

    /**
     * set source(tokenized xmlDocument) created by JackTokenizer
     * @param xmlTokenizerDocument
     * @return
     */
    public CompilationEngine setMappingTokens(Document xmlTokenizerDocument) {
        Element rootElement = xmlTokenizerDocument.getDocumentElement();
        this.tokenizationNodeList = rootElement.getChildNodes();

        return this;
    }

    /**
     * compile jack code using tokenizationNodeList
     * @return
     */
    public CompilationEngine compile() {
        try {
            DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
            xmlCompilationDocument = documentBuilder.newDocument();

            compileSimpleThingsFirst();


        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        }

        return null;
    }

    private void compileSimpleThingsFirst() {
    }

    /**
     * write xml document to file
     */
    public void writeXml() {

    }



}
