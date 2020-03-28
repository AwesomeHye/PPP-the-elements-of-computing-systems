import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import static org.junit.Assert.*;
@Slf4j
public class StringTest {

    @Test
    public void emptyTest(){
        String line = "    ";
        assertFalse(line.isEmpty());
        assertTrue(line.trim().isEmpty());
    }

    @Test
    public void ignoreCapital(){
        String str = "ABcde";
        log.info(str.toLowerCase());

        str = "가나de!Q@@EREFDdvdwpf-gflf나라ㅏ+";
        log.info(str.toLowerCase());
    }

    @Test
    public void countMatcher(){
        String str = "<BooleanQuery fieldName='filter1'><Clause operator='OR'><Near inOrder='true' distance='3'><ConceptQuery>신한금융투자_lv4</ConceptQuery><ConceptQuery>ENT_lv4</ConceptQuery></Near></Clause></BooleanQuery>";
        assertEquals(10, StringUtils.countMatches(str, "<"));
    }
}
