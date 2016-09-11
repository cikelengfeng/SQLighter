//
//  main.swift
//  SQLighter
//
//  Created by 徐 东 on 16/9/11.
//  Copyright © 2016年 Dean Xu Lab. All rights reserved.
//

import Foundation

let select = SimpleSelect()

select.select(["c1","c3"]).from("tbl_tags").wherec().identifier("a").op("==").value("x").and().identifier("b").op("<").value("y").or().identifier("c").op("<>").value("ono").and().inSet(["1","b","c","123"]).orderBy([("c1", Order.ASC), ("c2", Order.DESC)]).offset(42).limit(22)

print(select.assemble())

let insert = SimpleInsert()

insert.insert().table("tbl_tags").columns(["c1","c2"]).values([["x1","x2"],["y1","y2"]])

print(insert.assemble())

let update = SimpleUpdate()

update.update().table("tbl_people").set(["c1":"x1","c2":"x2"]).wherec().identifier("a").op("==").value("x").and().identifier("b").op("<").value("y").or().identifier("c").op("<>").value("ono").and().inSet(["1","b","c","123"])
print(update.assemble())


let delete = SimpleDelete()
delete.delete("tbl_medias").wherec().enclosedExpr(ID("a").op("==").value("x").and().identifier("b").op("<").value("y")).or().enclosedExpr(ID("c").op("<>").value("ono").and().identifier("c4").not().inSet(["1","b","c","123"]))

print(delete.assemble())

let identifier = ID("column")
let a = identifier || Value("value")
print(a.assemble())

print(identifier.assemble())
