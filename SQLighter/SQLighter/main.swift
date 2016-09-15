//
//  main.swift
//  SQLighter
//
//  Created by 徐 东 on 16/9/11.
//  Copyright © 2016年 Dean Xu Lab. All rights reserved.
//

import Foundation

let select = SimpleSelect()

select
    .select(["c1","c3"])
    .from("tbl_tags")
    .where_(id("a") == "x",
            id("b") < 1,
            id("c") != "ono",
            id("d").in_(["1","b","c","123"]))
    .orderBy([("c1", Order.ASC), ("c2", Order.DESC)])
    .offset(42)
    .limit(22)

print(select.assemble())
print(select.parameters())

let select2 = SimpleSelect()

select2
    .select(["c1","c3"])
    .from("tbl_tags")
    .where_(id("a") == "x",
        id("b") < 1,
        id("c") != "ono",
        id("d").in_(["1","b","c","123"]))
    .orderBy([("c1", Order.ASC), ("c2", Order.DESC)])
    .offset(42)
    .limit(22)

let un = union(select, lhs: select2)
print(un.assemble())

let insert = SimpleInsert()

insert
    .insert()
    .table("tbl_tags")
    .columns(["c1","c2"])
    .values([["x1","x2"],["y1","y2"]])

print(insert.assemble())

let update = SimpleUpdate()

update
    .update()
    .table("tbl_people")
    .set(["c1":"x1","c2":"x2"])
    .where_(id("a") == "x",
            (id("b") < "y"),
            or(),
            id("c") <> "ono",
            id("d").not().in_(["1","b","c","123"]))
print(update.assemble())


let delete = SimpleDelete()
delete
    .delete("tbl_medias")
    .where_(
            enclosed(
                id("a") == "x",
                and(),
                id("b") < "y"),
            or(),
            enclosed(
                id("c") <> "ono",
                and(),
                id("d").in_(["1","b","c","123"]))
    )

print(delete.assemble())
