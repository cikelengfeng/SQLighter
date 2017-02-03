//
//  SQL.swift
//  SQLighter
//
//  Created by 徐 东 on 2017/2/3.
//  Copyright © 2017年 Dean Xu Lab. All rights reserved.
//

import Foundation

public class SQLBuilder<Context: SQL> {
    let context: Context
    
    open func exit() -> Context {
        return context
    }
    
    init(context: Context) {
        self.context = context
    }
}

open class SQL {
    
    let plainSQL: String
    let parameters: [FMDBConvertable]
    
    
    init(plainSQL: String, parameters: [FMDBConvertable]) {
        self.plainSQL = plainSQL
        self.parameters = parameters
    }
}

class SQLStatment: SQL {

    var insertBuilder: InsertStatmentBuilder?
    
    func insert() -> InsertStatmentBuilder {
        self.insertBuilder = InsertStatmentBuilder(context: self)
        return self.insertBuilder!
    }
}

class InsertStatmentBuilder: SQLBuilder<SQL> {

    func complete() -> InsertStatment {
        return InsertStatment(plainSQL: "INSERT", parameters: [])
    }
}

class InsertStatment: SQL {
    func test() -> TestStatmentBuilder {
        return TestStatmentBuilder(context: self)
    }
}

class TestStatmentBuilder: SQLBuilder<SQL> {
    
}
