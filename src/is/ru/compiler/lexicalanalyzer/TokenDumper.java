package is.ru.compiler.lexicalanalyzer;
import jdk.nashorn.internal.parser.Lexer;

import java.io.*;

/**
 * Created by jakob on 2.9.2014.
 */
public class TokenDumper {
    public static void main(String [] args) throws IOException {
        Lexer lexer = new Lexer(new FileReader(args[0]));

        while (true) {
            Token t = lexer.yylex();
            System.out.print(t.getTokenCode().toString());
            // TODO: Print out relevant  data for token in paranthesis

            if (/* At the end of file */)
                break;
        }
        // TODO: Print out symbol table
    }
}
