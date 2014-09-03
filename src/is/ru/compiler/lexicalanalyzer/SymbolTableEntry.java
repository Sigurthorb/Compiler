package is.ru.compiler.lexicalanalyzer;

import com.sun.org.apache.xerces.internal.util.SymbolTable;

/**
 * Created by jakob on 2.9.2014.
 */
public class SymbolTableEntry {

    public SymbolTable mySymbolTable;

    public SymbolTableEntry() {
        mySymbolTable = new SymbolTable();
    }

    public SymbolTableEntry(SymbolTable mySymbolTable) {
        this.mySymbolTable = mySymbolTable;
    }
}
