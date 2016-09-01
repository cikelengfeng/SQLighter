//: Playground - noun: a place where people can play

import UIKit

let select = SimpleSelect()

select.select(["c1","c3"]).from("tbl_tags").wherec().identifier("a").op("==").value("x").and().identifier("b").op("<").value("y").or().identifier("c").op("<>").value("ono").and().inSet(["1","b","c","123"]).orderBy([("c1", Order.ASC), ("c2", Order.DESC)]).offset(42).limit(22)

select.string()
select.parameters()

let insert = SimpleInsert()

insert.insert().table("tbl_tags").columns(["c1","c2"]).values([["x1","x2"],["y1","y2"]])

insert.string()
insert.parameters()

let update = SimpleUpdate()

update.update().table("tbl_people").set(["c1":"x1","c2":"x2"]).wherec().identifier("a").op("==").value("x").and().identifier("b").op("<").value("y").or().identifier("c").op("<>").value("ono").and().inSet(["1","b","c","123"])
update.string()
update.parameters()


let delete = SimpleDelete()
delete.delete("tbl_medias").wherec().enclosedExpr(SQLStmt().identifier("a").op("==").value("x").and().identifier("b").op("<").value("y")).or().enclosedExpr(SQLStmt().identifier("c").op("<>").value("ono").and().identifier("c4").not().inSet(["1","b","c","123"]))

delete.string()
delete.parameters()

