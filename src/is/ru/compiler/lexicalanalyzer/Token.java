package is.ru.compiler.lexicalanalyzer;

import is.ru.compiler.lexicalanalyzer.enums.*;

/**
 * Created by jakob on 2.9.2014.
 */
public class Token {
    public TokenCode tokenCode;
    public OpType opType;
    public DataType dataType;
    public SymbolTableEntry symbolTableEntry;

    public Token() {
    }

    public Token(TokenCode tokenCode) {
        this.tokenCode = tokenCode;
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
