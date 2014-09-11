package is.ru.compiler.lexicalanalyzer;
%%

%class Lexer
%unicode
%type Token

%line
%column
%standalone
// %debug

%eof{
	System.out.println();
%eof}

%eofval{
		Token token = new Token(TokenCode.EOF, OpType.NONE, DataType.NONE, null);
		return token;
%eofval}

letter = [a-z] | [A-Z]
digit = [0-9]

id = {letter} ({letter} |{digit})*
digits = {digit}+
longerror = (\w\b 32,)
optional_fraction = ("." {digits})?
optional_exponent = ("E"("+"|"-")? {digits})?
num = {digits} {optional_fraction} {optional_exponent}
incdecop = "++" | "--"
relop = "==" | "!=" | "<" | ">" | "<=" | ">="  // more or less
addop = "+" | "-" | "||"
mulop = "*" | "/" | "%" | "&&"
brace = "{" | "}"
bracket = "[" | "]"
comma = ","
assign = "="
semicol = ";"
paren = "(" | ")"
not = "!"

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WS = {LineTerminator} | [ \t\f]

/* comments */
comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}

TraditionalComment   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
// Comment can be the last line of the file, without line terminator.
EndOfLineComment     = "//" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/**" {CommentContent} "*"+ "/"
CommentContent       = ( [^*] | \*+ [^/*] )*

%%

{WS} { /* Ignore whitespace */ }

{comment} { /* Ignore multiline comments */ }

{id} {
	Token token = null;
	String op = yytext();

	if(op.equals("int"))
		token = new Token(TokenCode.INT, OpType.NONE, DataType.INT, null);
	else if(op.equals("real"))
		token = new Token(TokenCode.REAL, OpType.NONE, DataType.REAL, null);
	else if(op.equals("void"))
		token = new Token(TokenCode.VOID, OpType.NONE, DataType.NONE, null);
	else if(op.equals("if"))
		token = new Token(TokenCode.IF, OpType.NONE, DataType.NONE, null);
	else if(op.equals("else"))
		token = new Token(TokenCode.ELSE, OpType.NONE, DataType.NONE, null);
	else if(op.equals("class"))
        token = new Token(TokenCode.CLASS, OpType.NONE, DataType.NONE, null);
    else if(op.equals("for"))
        token = new Token(TokenCode.FOR, OpType.NONE, DataType.NONE, null);
    else if(op.equals("return"))
        token = new Token(TokenCode.RETURN, OpType.NONE, DataType.NONE, null);
    else if(op.equals("break"))
        token = new Token(TokenCode.BREAK, OpType.NONE, DataType.NONE, null);
    else if(op.equals("continue"))
            token = new Token(TokenCode.CONTINUE, OpType.NONE, DataType.NONE, null);
	else
		token = new Token(TokenCode.IDENTIFIER, OpType.NONE, DataType.ID, new SymbolTableEntry(yytext()));

	return token;
}

{num} {
	Token token = new Token(TokenCode.NUMBER, OpType.NONE, DataType.NONE, new SymbolTableEntry(yytext()));
	return token;
}

{incdecop} {
	OpType op = (yytext() == "++" ? OpType.INC : OpType.DEC);
	Token token = new Token(TokenCode.INCDECOP, op, DataType.NONE, null);
	return token;
}

{relop} {
	String op = yytext();
	OpType opType = OpType.NONE;
        if (op.equals("==")) {
            opType = OpType.EQUAL;

        } else if (op.equals("!=")) {
            opType = OpType.NOT_EQUAL;

        } else if (op.equals("<")) {
            opType = OpType.LT;

        } else if (op.equals(">")) {
            opType = OpType.GT;

        } else if (op.equals(">=")) {
            opType = OpType.GTE;

        } else if (op.equals("<=")) {
            opType = OpType.LTE;
        }
	Token token = new Token(TokenCode.RELOP, opType, DataType.NONE, null);
	return token;
}

{addop} {
	String op = yytext();
	OpType opType = OpType.NONE;
	if (op.equals("+")) {
		opType = OpType.PLUS;
	} else if (op.equals("-")) {
		opType = OpType.MINUS;
	} else if (op.equals("||")) {
		opType = OpType.OR;
	}
	Token token = new Token(TokenCode.ADDOP, opType, DataType.NONE, null);
	return token;
}

{mulop} {
	String op = yytext();
	OpType opType = OpType.NONE;
            if (op.equals("*")) {
                opType = OpType.MULT;
            } else if (op.equals("/")) {
                opType = OpType.DIV;
            } else if (op.equals("&&")) {
                opType = OpType.AND;
            } else if (op.equals("%" {
                opType = OpType.MOD;
            }
	Token token = new Token(TokenCode.MULOP, opType, DataType.NONE, null);
	return token;
}

{brace} {
    String op = yytext();
    TokenCode tokenCode = null;

    if(op.equals("{")){
        tokenCode = TokenCode.LBRACE;
    }else if(op.equals("}")){
        tokenCode = TokenCode.RBRACE;
    }

    Token token = new Token(tokenCode, OpType.NONE, DataType.NONE, null);

    return token;
}

{bracket} {
    String op = yytext();
    TokenCode tokenCode = null;

    if(op.equals("[")){
        tokenCode = TokenCode.LBRACKET;
    }else if(op.equals("]")){
        tokenCode = TokenCode.RBRACKET;
    }

    Token token = new Token(tokenCode, OpType.NONE, DataType.NONE, null);

    return token;
}

{paren} {
    String op = yytext();
    TokenCode tokenCode = null;

    if(op.equals("(")){
        tokenCode = TokenCode.LPAREN;
    }else if(op.equals(")")){
        tokenCode = TokenCode.RPAREN;
    }

    Token token = new Token(tokenCode, OpType.NONE, DataType.NONE, null);

    return token;
}

{comma} {
    Token token = new Token(TokenCode.COMMA, OpType.NONE, DataType.NONE, null);
    return token;
}

{assign} {
    Token token = new Token(TokenCode.ASSIGNOP, OpType.ASSIGN, DataType.NONE, null);
    return token;
}

{semicol} {
	Token token = new Token(TokenCode.SEMICOLON, OpType.NONE, DataType.NONE, null);
	return token;
}

{not} {
    Token token = new Token(TokenCode.NOT,OpType.NONE, DataType.NONE, null);
    return token;
}

{longerror} {
	Token token = new Token(TokenCode.ERR_LONG_ID, OpType.NONE, DataType.NONE, null);
	return token;
}

[^] {
		Token token = new Token(TokenCode.ERR_ILL_CHAR, OpType.NONE, DataType.NONE, null);
		return token; }

