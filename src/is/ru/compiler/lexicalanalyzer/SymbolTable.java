package is.ru.compiler.lexicalanalyzer;

import java.util.ArrayList;
import java.util.List;

/**
 * <p></p>
 *
 * @author jakob
 *         Created on 10.9.2014.
 */
public class SymbolTable {
    private List<SymbolTableEntry> entries;

    public SymbolTable(){
        this.entries = new ArrayList<SymbolTableEntry>();
    }

    public void addEntry(SymbolTableEntry temp){
        if(temp != null) {
            if (!entries.contains(temp)) {
                entries.add(temp);
            }
        }
    }

    public List<SymbolTableEntry> getEntryList(){
        return entries;
    }




}
