package is.ru.compiler.lexicalanalyzer;

import com.sun.org.apache.xerces.internal.util.SymbolTable;

/**
 * Created by jakob on 2.9.2014.
 */
public class SymbolTableEntry {

    String lexeme;

    public SymbolTableEntry() {
    }

    public SymbolTableEntry(String lexeme) {
        this.lexeme = lexeme;
    }
}
