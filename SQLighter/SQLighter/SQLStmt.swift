import Foundation

public class SQLStmt {
    
    private var childrenStmt: [SQLStmt]
    internal weak var parentStmt: SQLStmt?
    internal weak var leftStmt: SQLStmt?
    
    private let baseSQL: String
    private let baseParams: [AnyObject]
    
    public init(_ sql: String, params: [AnyObject]) {
        self.baseSQL = sql
        self.baseParams = params
        self.childrenStmt = []
    }
    
    public convenience init() {
        self.init("", params: [])
    }
    
    public func assemble() -> String {
        if self.childrenStmt.count == 0 {
            return self.baseSQL
        }
        let prefix = self.baseSQL.characters.count == 0 ? "" : self.baseSQL + " "
        let ret = prefix + ((self.childrenStmt.map { $0.assemble() }).joinWithSeparator(" "))
        return ret
    }
    
    public func parameters() -> [AnyObject] {
        return self.baseParams + self.childrenStmt.reduce([], combine: { $0 + $1.parameters() })
    }
    
    public func append(child: SQLStmt) -> Self {
        child.parentStmt = self
        child.leftStmt = self.childrenStmt.last
        self.childrenStmt.append(child)
        return self
    }
    
    public func append(pureSQL: String) -> Self {
        let pureSQL = SQLStmt(pureSQL, params: [])
        return self.append(pureSQL)
    }
    
    public func append(pureSQL: String, params: [AnyObject]) -> Self {
        let pureSQL = SQLStmt(pureSQL, params: params)
        return self.append(pureSQL)
    }
    
    internal func children() -> [SQLStmt] {
        return self.childrenStmt
    }
    
    public func parent() -> SQLStmt? {
        return self.parentStmt
    }
    
    public func left() -> SQLStmt? {
        return self.leftStmt
    }
}

public extension SQLStmt {
    
    func copy() -> SQLStmt {
        let copy = SQLStmt(self.baseSQL, params: self.baseParams)
        copy.childrenStmt = self.childrenStmt
        copy.parentStmt = self.parentStmt
        copy.leftStmt = self.leftStmt
        return copy
    }
}

