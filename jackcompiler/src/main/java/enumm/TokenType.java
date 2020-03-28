package enumm;

public enum TokenType {
    KEYWORD("keyword"), SYMBOL("symbol"), IDENTIFIER("identifier"), INT_CONST("integerConstant"), STRING_CONST("stringConstant");

    private String tagName;
    TokenType(String tagName){
        this.tagName = tagName;
    }

    public String getTagName(){
        return tagName;
    }
}
