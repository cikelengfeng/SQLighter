//
//  Identifier.swift
//  SQLighter
//
//  Created by 徐 东 on 16/9/11.
//  Copyright © 2016年 Dean Xu Lab. All rights reserved.
//

import Foundation

public func id(id: String) -> SQLStmt {
    return SQLStmt("?", params: [id])
}

public func value(v: AnyObject) -> SQLStmt {
    return SQLStmt("?", params: [v])
}

public func enclosed(expressions: SQLStmt...) -> SQLStmt {
    let enclosed = SQLStmt("", params: [])
    enclosed.append("(", params: [])
    for expr in expressions {
        enclosed.append(expr)
    }
    return enclosed.append(")", params: [])
}

public func enclosed(expressions: [SQLStmt]) -> SQLStmt {
    let enclosed = SQLStmt("", params: [])
    enclosed.append("(", params: [])
    for expr in expressions {
        enclosed.append(expr)
    }
    return enclosed.append(")", params: [])
}

public func and() -> SQLStmt {
    let pureSQL = SQLStmt("AND", params: [])
    return pureSQL
}

public func or() -> SQLStmt {
    let pureSQL = SQLStmt("OR", params: [])
    return pureSQL
}

public func union(rhs: SQLStmt, lhs: SQLStmt) -> SQLStmt {
    let union = SQLStmt()
    union.append(enclosed([rhs]))
    union.append("UNION", params: [])
    union.append(enclosed([lhs]))
    return union
}
