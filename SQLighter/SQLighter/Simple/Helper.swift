//
//  Identifier.swift
//  SQLighter
//
//  Created by 徐 东 on 16/9/11.
//  Copyright © 2016年 Dean Xu Lab. All rights reserved.
//

import Foundation

public let OR = OR_()
public let AND = AND_()

public func ID(_ id: String) -> SQLStmt {
    return SQLStmt().id(id)
}

public func VALUE(_ v: AnyObject) -> SQLStmt {
    return SQLStmt().value(v)
}


public func ENCLOSED(_ expressions: [SQLStmt]) -> SQLStmt {
    var enclosed = SQLStmt()
    enclosed = enclosed.append("(")
    for expr in expressions {
        enclosed = enclosed.append(expr)
    }
    return enclosed.append(")")
}

public func ENCLOSED(_ expressions: SQLStmt...) -> SQLStmt {
    return ENCLOSED(expressions)
}

public func ENCLOSED(_ sql: String, params: [AnyObject]) -> SQLStmt {
    return ENCLOSED(SQLStmt(sql, params: params))
}

public func ENCLOSED(_ sql: String) -> SQLStmt {
    return ENCLOSED(sql, params: [])
}

public func AND_() -> SQLStmt {
    let pureSQL = SQLStmt("AND")
    return pureSQL
}

public func AND_(_ lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt {
    let and = SQLStmt()
    return and.append(lhs).append(AND).append(rhs)
}

public func OR_() -> SQLStmt {
    let pureSQL = SQLStmt("OR")
    return pureSQL
}

public func OR_(_ lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt {
    let or = SQLStmt()
    return or.append(lhs).append(OR).append(rhs)
}

public func UNION(_ lhs: SQLStmt, rhs: SQLStmt) -> SQLStmt {
    let union = SQLStmt()
    return union.append(ENCLOSED([lhs])).append("UNION").append(ENCLOSED([rhs]))
}

internal func AND_JOINED(_ sqls: [SQLStmt]) -> [SQLStmt] {
    var ret = [SQLStmt]()
    for (index, sql) in sqls.enumerated() {
        if index != 0  && (!sqls[index - 1].assemble().hasSuffix("OR"))  && (!sql.assemble().hasSuffix("OR")) {
            ret.append(AND)
        }
        ret.append(sql)
    }
    return ret
}
