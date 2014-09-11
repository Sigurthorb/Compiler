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
optional_fraction = ("." {digits})?
optional_exponent = ("E"("+"|"-")? {digits})?
num = {digits} {optional_fraction} {optional_exponent}
incdecop = "++" | "--"
relop = "==" | "!=" | "<" | ">" | "<=" | ">="  // more or less
addop = "+" | "-" | "||"
mulop = "*" | "/" | "%" | "&&" 
comment = "/*" (.*) "*/"

WS = [ \n\t\r]+

%%

{WS} { /* Ignore whitespace */ }

{comment} { /* Ignore multiline comments */ }

{id} {		System.out.println("id: '" + yytext() + "'"); 
		Token token = new Token(TokenCode.IDENTIFIER,  OpType.NONE, DataType.NONE, new SymbolTableEntry(yytext()));
		return token; }

{num} { 	System.out.println("num: ’" + yytext() + "’"); 
		Token token = new Token(TokenCode.NUMBER, OpType.NONE, DataType.NONE, new SymbolTableEntry(yytext()));
		return token; }

{incdecop} {	System.out.println("incdecop: ’" + yytext() + "’"); 
		OpType op = (yytext() == "++" ? OpType.INC : OpType.DEC);
		Token token = new Token(TokenCode.INCDECOP, op, DataType.NONE, null);
		return token; }

{relop} {	System.out.println("relop: ’" + yytext() + "’"); 
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
		return token; }

{addop} {	System.out.println("addop: ’" + yytext() + "’"); 
		String op = yytext();
		OpType opType = OpType.NONE;
		if (op.equals("+")) {
			opType = OpType.PLUS;
		} else if (op.equals("-")) {
			opType = OpType.MINUS;
		} else if (op.equals("||")) {
			opType = OpType.OR;
		}
		Token token = new Token(TokenCode.RELOP, opType, DataType.NONE, null);
		return token; }

{mulop} {	System.out.println("mulop: ’" + yytext() + "’"); 
		String op = yytext();
		OpType opType = OpType.NONE;
                if (op.equals("*")) {
                    opType = OpType.MULT;
                } else if (op.equals("/")) {
                    opType = OpType.DIV;
                } else if (op.equals("&&")) {
                    opType = OpType.AND;
                }
		Token token = new Token(TokenCode.RELOP, opType, DataType.NONE, null);
		return token; }

[^\ ]+ { 	System.out.println("Unknown sequence: ’" + yytext() + "’"); 
		Token token = new Token(TokenCode.ERR_ILL_CHAR, OpType.NONE, DataType.NONE, null);
		return token; }

