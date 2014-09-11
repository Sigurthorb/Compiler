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
            if(t.getSymbolTableEntry() != null){
                System.out.print("(" + t.getSymbolTableEntry().toString() + ") ");
            }else{
                System.out.print(" ");
            }

            if(t.getSymbolTableEntry() != null){
                symbolTable.addEntry(t.getSymbolTableEntry());
            }

            if (t.getTokenCode().equals(TokenCode.EOF))
                break;
        }
        int counter = 0;
        for(SymbolTableEntry temp : symbolTable.getEntryList()){
            System.out.println(counter + "  " + temp.getLexeme());
            counter++;
        }

    }
}
