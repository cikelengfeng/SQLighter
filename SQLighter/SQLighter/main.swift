//
//  main.swift
//  SQLighter
//
//  Created by 徐 东 on 16/9/11.
//  Copyright © 2016年 Dean Xu Lab. All rights reserved.
//

import Foundation

let select = SimpleSelect()
                .select(columnArr: ["c1","c3"])
                .from("tbl_tags")
                .where_(
                        [ID("1").like("3"),
                            OR,
                            ID("2").glob([
                                ID("a") == "x",
                                ID("b") < 1])],
                        [ID("a") == "x",
                            ID("b") < 1],
                        OR,
                        [ID("c") != "ono",
                            OR,
                            ID("d").in_(paramArr: ["1","b","c","123"])])
                .orderBy([("c1", Order.ASC), ("c2", Order.DESC)])
                .offset(42)
                .limit(22)

print(select.assemble())
print(select.parameters())

let select2 = SimpleSelect()
                .select("c1","c3")
                .from("tbl_tags")
                .where_(
                        ID("a") == "x",
                        ID("b") < 1,
                        ID("c") != "ono",
                        ID("d").in_(paramArr: ["1","b","c","123"]))
                .orderBy([("c1", Order.ASC), ("c2", Order.DESC)])
                .offset(42)
                .limit(22)

let un = UNION(select, lhs: select2)
print(un.assemble())
print(un.parameters())

let insert = SimpleInsert()

insert
    .insert()
    .table("tbl_tags")
    .columns(["c1","c2"])
    .values([["x1","x2"],["y1","y2"]])

print(insert.assemble())
print(insert.parameters())

let update = SimpleUpdate()

update
    .update()
    .table("tbl_people")
    .set(["c1":"x1","c2":"x2"])
    .where_(
            ID("a") == "x",
            ID("b") < "y",
            OR,
            ID("c") <> "ono",
            ID("d").not().in_("1","b","c","123"))
print(update.assemble())
print(update.parameters())


let delete = SimpleDelete()
delete
    .delete()
    .from("tbl_medias")
    .where_(
            [[ID("a") == "x",
            ID("x").not().in_("x1","x2")],
            [ID("b") < "y",ID("y") & "y1"]],
            OR,
            ID("c") <> "ono",
            ID("d").in_("1","b","c","123")
    )

print(delete.assemble())
print(delete.parameters())
