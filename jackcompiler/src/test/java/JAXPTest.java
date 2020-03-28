import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.File;
import java.io.IOException;

@Slf4j
public class JAXPTest {

    @Test
    public void writeXml() throws  TransformerException, ParserConfigurationException {
        DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();

        Document doc = documentBuilder.newDocument();
        doc.setXmlStandalone(true);

        Element clazz = doc.createElement("class");
        doc.appendChild(clazz);

        Element keyword = doc.createElement("keyword");
        keyword.appendChild(doc.createTextNode("k1"));
        clazz.appendChild(keyword);


        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = transformerFactory.newTransformer();
        transformer.setOutputProperty(OutputKeys.INDENT, "yes"); //들여쓰기
        transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4"); //들여쓰기 4칸
        transformer.setOutputProperty(OutputKeys.DOCTYPE_PUBLIC, "yes"); //개행

        DOMSource domSource = new DOMSource(doc);
        StreamResult streamResult = new StreamResult(System.out);
        transformer.transform(domSource, streamResult);
    }

    @Test
    public void readXml() throws ParserConfigurationException, IOException, SAXException, TransformerException {
        DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();

        File file = new File("D:\\Programming\\workspace\\JAVA\\Local\\LECTURE\\PPP_COMPUTING_SYSTEM\\jackcompiler\\target\\classes\\jack\\ArrayTest\\output\\MainT.xml");
        Document document = documentBuilder.parse(file);


        Element rootElement = document.getDocumentElement();
        NodeList childNodes = rootElement.getChildNodes();
        // <keyword> class </keyword>
        log.info(""+childNodes.item(1).getNodeName()); //keyword
        log.info(""+childNodes.item(1).getTextContent()); //class

        // print child nodes
        for(int i = 0; i < childNodes.getLength(); i++){
            Node node = childNodes.item(i);
            if(node.getNodeType() == Node.ELEMENT_NODE){
                Element childElement = (Element) node;
//                log.info(childElement.getTagName()); //identifier
//                log.info(childElement.getTextContent()); //Main
            }
        }

        // manufacture node
        Document newDocument = documentBuilder.newDocument();
        newDocument.setXmlStandalone(true);

        Element classElement = newDocument.createElement("class");
        newDocument.appendChild(classElement);

        for(int i = 0; i < childNodes.getLength(); i++){
            Node node = childNodes.item(i);
            if(node.getNodeType() == Node.ELEMENT_NODE){
                Element childElement = (Element) node;
                String tagName = childElement.getTagName();

                //if tag name is "integerConstant", wrap with term tag
                if(tagName.equalsIgnoreCase("integerConstant")){
                    Element term = document.createElement("term");
                    term.appendChild(childElement);
                    classElement.appendChild(newDocument.adoptNode(term));
                } else {
                    classElement.appendChild(newDocument.adoptNode(childElement));
                }


            }
        }

        //print manufactured document
        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = transformerFactory.newTransformer();
        transformer.setOutputProperty(OutputKeys.INDENT, "yes"); //들여쓰기
        transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4"); //들여쓰기 4칸
        transformer.setOutputProperty(OutputKeys.DOCTYPE_PUBLIC, "yes"); //개행

        DOMSource domSource = new DOMSource(newDocument);
        StreamResult streamResult = new StreamResult(System.out);
        transformer.transform(domSource, streamResult);

    }


}
