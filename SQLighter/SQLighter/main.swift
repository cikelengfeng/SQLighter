//
//  main.swift
//  SQLighter
//
//  Created by 徐 东 on 16/9/11.
//  Copyright © 2016年 Dean Xu Lab. All rights reserved.
//

import Foundation

let select = SQLStmt()
                .select("*")
                .from("tbl_tags")
                .where_(
                        [User.name.like("3"),
                        OR,
                        User.id.not().in_("x", 1, 3)],
                        [User.creationDate == "x",
                        User.id < 1],
                        OR,
                        [ID("c") != "ono",
                        OR,
                        ID("d").in_(paramArr: ["1","b","c","123"])])
                .orderBy(("c1", Order.ASC), ("c2", Order.DESC))
                .offset(42)
                .limit(22)

print(select.assemble())
print(select.parameters())

let select2 = SQLStmt()
                .select("c1","c3")
                .from("tbl_tags")
                .where_(
                        ID("a") == "x",
                        ID("b") < 1,
                        ID("c") != "ono",
                        ID("d").in_("1","b","c", 123))
                .orderBy(orderArr: [("c1", Order.ASC), ("c2", Order.DESC)])
                .offset(42)
                .limit(22)

let un = UNION(select, rhs: select2)
print(un.assemble())
print(un.parameters())

let insert = SQLStmt()
    .insert()
    .table("tbl_tags")
    .columns(["c1","c2"])
    .values([["x1","x2"],["y1","y2"]])

print(insert.assemble())
print(insert.parameters())

let update = SQLStmt()
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


let delete = SQLStmt()
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
