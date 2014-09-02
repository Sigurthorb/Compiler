package is.ru.compiler.lexicalanalyzer;

/**
 * Created by jakob on 2.9.2014.
 */
public enum TokenCode {
    IDENTIFIER, NUMBER, INCDECOP, RELOP, MULOP, ADDOP,
    ASSIGNOP,
    CLASS, VOID, IF, ELSE, FOR, RETURN, BREAK, CONTINUE,
    LBRACE, RBRACE, LBRACKET, RBRACKET, LPAREN, RPAREN,
    SEMICOLON, COMMA, NOT, INT, REAL,
    EOF, ERR_ILL_CHAR, ERR_LONG_ID

}
