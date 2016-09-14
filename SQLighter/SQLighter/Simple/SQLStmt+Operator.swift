//
//  SQLStmt+Operator.swift
//  SQLighter
//
//  Created by 徐 东 on 16/9/14.
//  Copyright © 2016年 Dean Xu Lab. All rights reserved.
//

import Foundation

public extension SQLStmt {
    public func sql(expr: String, params: [AnyObject]) -> Self {
        let pureSQL = SQLStmt(expr, params: params)
        return self.append(pureSQL)
    }
    
    public func wherec(expressions: SQLStmtGroup...) -> Self {
        let pureSQL = SQLStmt("WHERE", params: [])
        self.append(pureSQL)
        for exprGroup in expressions {
            if exprGroup.statements().count == 0 {
                continue
            }
            if exprGroup.statements().count == 1 {
                self.append(exprGroup.statements()[0])
                continue
            }
            var enclosedExpr = [SQLStmt]()
            for (innerIndex, expr) in exprGroup.statements().enumerate() {
                if innerIndex != 0  && (!exprGroup.statements()[innerIndex - 1].assemble().containsString("OR"))  && (!expr.assemble().containsString("OR")) {
                    enclosedExpr.append(and())
                }
                enclosedExpr.append(expr)
            }
            self.append(enclosed(enclosedExpr))
            
        }
        return self
    }
    
    public func not() -> Self {
        let pureSQL = SQLStmt("NOT", params: [])
        return self.append(pureSQL)
    }
    
    public func inSet(params: [AnyObject]) -> Self {
        let keyword = SQLStmt("IN", params: [])
        self.append(keyword)
        let leftBracket = SQLStmt("(", params: [])
        self.append(leftBracket)
        let pureSQL = SQLStmt((params.map() {_ in "?"}).joinWithSeparator(" , "), params: params)
        self.append(pureSQL)
        let rightBracket = SQLStmt(")", params: [])
        return self.append(rightBracket)
    }
    
    public func like() -> Self {
        let pureSQL = SQLStmt("LIKE", params: [])
        return self.append(pureSQL)
    }
    
    public func glob() -> Self {
        let pureSQL = SQLStmt("GLOB", params: [])
        return self.append(pureSQL)
    }
    
    public func match() -> Self {
        let pureSQL = SQLStmt("MATCH", params: [])
        return self.append(pureSQL)
    }
    
    public func regex() -> Self {
        let pureSQL = SQLStmt("REGEXP", params: [])
        return self.append(pureSQL)
    }
}

