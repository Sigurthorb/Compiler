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
brace = "{" | "}"
comma = ","
int = "int"
real = "real"
assign = "="
semicol = ";"
void = "void"
if = "if"
else = "else"
not = "!"

WS = [ \n\t\r]+

%%

{WS} { /* Ignore whitespace */ }

{comment} { /* Ignore multiline comments */ }

{id} {
		Token token = new Token(TokenCode.IDENTIFIER,  OpType.NONE, DataType.NONE, new SymbolTableEntry(yytext()));
		return token; }

{num} {
		Token token = new Token(TokenCode.NUMBER, OpType.NONE, DataType.NONE, new SymbolTableEntry(yytext()));
		return token; }

{incdecop} {
		OpType op = (yytext().equals("++") ? OpType.INC : OpType.DEC);
		Token token = new Token(TokenCode.INCDECOP, op, DataType.NONE, null);
		return token; }

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
		return token; }

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
		return token; }

{mulop} {
		String op = yytext();
		OpType opType = OpType.NONE;
                if (op.equals("*")) {
                    opType = OpType.MULT;
                } else if (op.equals("/")) {
                    opType = OpType.DIV;
                } else if (op.equals("&&")) {
                    opType = OpType.AND;
                }
		Token token = new Token(TokenCode.MULOP, opType, DataType.NONE, null);
		return token; }

{brace} {
            String op = yytext();
            TokenCode tokenCode = TokenCode.NONE;

            if(op.equals("{")){
                tokenCode = TokenCode.LBRACE;
            }else if(op.equals("}")){
                tokenCode = TokenCode.RBRACE;
            }

            Token token = new Token(tokenCode, OpType.NONE, DataType.NONE, null);

            return token;
        }

{comma} {
            Token token = new Token(TokenCode.COMMA, OpType.NONE, DataType.NONE, null);
            return token;
        }

{int} {
            Token token = new Token(TokenCode.INT, OpType.NONE, DataType.INT, null);
            return token;
      }

{real} {
            Token token = new Token(TokenCode.REAL, OpType.NONE, DataType.REAL, null);
            return token;
       }

{assign} {
            Token token = new Token(TokenCode.ASSIGNOP, OpType.ASSIGN, DataType.NONE, null);
            return token;
         }

{semicol} {

            return token;
          }

{void} {

            return token;
        }

{if} {

            return token;
     }

{else} {

            return token;
        }






















[^\ ]+ {
		Token token = new Token(TokenCode.ERR_ILL_CHAR, OpType.NONE, DataType.NONE, null);
		return token; }

