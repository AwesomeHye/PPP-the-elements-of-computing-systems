package enumm;

import lombok.NoArgsConstructor;

import java.util.Arrays;
import java.util.List;

@NoArgsConstructor
public enum KeywordType {
    CLASS, METHOD, FUNCTION, CONSTRUCTOR, INT, BOOLEAN, CHAR, VOID, VAR, STATIC, FIELD, LET, DO, IF, ELSE, WHILE, RETURN, TRUE, FALSE, NULL, THIS;

    public static List<String> getKeywordList(){
        return Arrays.asList(CLASS.name(), METHOD.name(), FUNCTION.name(), CONSTRUCTOR.name(), INT.name(), BOOLEAN.name(), CHAR.name(), VOID.name(), VAR.name(), STATIC.name(),
                FIELD.name(), LET.name(), DO.name(), IF.name(), ELSE.name(), WHILE.name(), RETURN.name(), TRUE.name(), FALSE.name(), NULL.name(), THIS.name());
    }
}
