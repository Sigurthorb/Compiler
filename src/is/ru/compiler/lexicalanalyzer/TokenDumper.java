package is.ru.compiler.lexicalanalyzer;


import java.io.*;

/**
 * Created by jakob on 2.9.2014.
 */
public class TokenDumper {
    public static void main(String [] args) throws IOException {
        Lexer lexer = new Lexer(new FileReader(args[0]));
        SymbolTable symbolTable = new SymbolTable();

        while (true) {
            Token t = lexer.yylex();

            System.out.print(t.getTokenCode().toString());
            if(t.getSymbolTableEntry() != null || t.getTokenCode() == TokenCode.RELOP ||t.getTokenCode() == TokenCode.ADDOP ||t.getTokenCode() == TokenCode.MULOP){
                if(t.getSymbolTableEntry() == null) {
                    System.out.print("(" + t.getSymbolTableEntry().getLexeme() + ") ");
                    symbolTable.addEntry(t.getSymbolTableEntry());
                }
                else
                {
                    System.out.print("(" + t.getOpType() + ") ");
                }
            }else{
                System.out.print(" ");
            }

            if (t.getTokenCode().equals(TokenCode.EOF))
                break;
        }
        int counter = 0;
        System.out.println();
        for(SymbolTableEntry temp : symbolTable.getEntryList()){
            System.out.println(counter + "  " + temp.getLexeme());
            counter++;
        }

    }
}
