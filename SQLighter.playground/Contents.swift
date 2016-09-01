//: Playground - noun: a place where people can play

import UIKit

let select = SimpleSelect()

select.select(["c1","c3"]).from("tbl_tags").inWhere().expr("a == ?", params: ["x"]).and().expr("b < ?", params: ["y"]).or().expr("c <> ?", params: ["ono"]).and().inSet(["1","b","c","123"]).orderBy([("c1", Order.ASC), ("c2", Order.DESC)]).offset(42).limit(22).pureSQL("xxxxxxxxxxxxx", params: [])

select.string()
select.parameters()

let insert = SimpleInsert()

insert.insert().table("tbl_tags").columns(["c1","c2"]).values([["x1","x2"],["y1","y2"]])

insert.string()
insert.parameters()

let update = SimpleUpdate()

update.update().table("tbl_people").set(["c1":"x1","c2":"x2"]).inWhere().expr("a == ?", params: ["x"]).and().expr("b < ?", params: ["y"]).or().expr("c <> ?", params: ["ono"]).and().not().inSet(["1","b","c","123"])

update.string()
update.parameters()


let delete = SimpleDelete()

delete.deleteFrom("tbl_medias").inWhere().expr("a == ?", params: ["x"]).and().expr("b < ?", params: ["y"]).or().expr("c <> ?", params: ["ono"]).and().not().inSet(["1","b","c","123"])

delete.string()
delete.parameters()

