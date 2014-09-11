package is.ru.compiler.lexicalanalyzer;

/**
 * Created by jakob on 2.9.2014.
 */
public class Token {
    private TokenCode tokenCode;
    private OpType opType;
    private DataType dataType;
    private SymbolTableEntry symbolTableEntry;

    public Token() {
    }

    public Token(TokenCode tokenCode, OpType opType, DataType dataType, SymbolTableEntry symbolTableEntry) {
        this.tokenCode = tokenCode;
        this.opType = opType;
        this.dataType = dataType;
        this.symbolTableEntry = symbolTableEntry;
    }

    public TokenCode getTokenCode() {
        return tokenCode;
    }

    public void setTokenCode(TokenCode tokenCode) {
        this.tokenCode = tokenCode;
    }

    public OpType getOpType() {
        return opType;
    }

    public void setOpType(OpType opType) {
        this.opType = opType;
    }

    public DataType getDataType() {
        return dataType;
    }

    public void setDataType(DataType dataType) {
        this.dataType = dataType;
    }

    public SymbolTableEntry getSymbolTableEntry() {
        return symbolTableEntry;
    }

    public void setSymbolTableEntry(SymbolTableEntry symbolTableEntry) {
        this.symbolTableEntry = symbolTableEntry;
    }
}
