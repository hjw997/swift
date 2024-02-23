//
//  main.swift
//  元类型
//
//  Created by whj on 2024/2/23.
//

import Foundation

print("元类型知识点:")
class Person {

}
let person = Person()

/**
 Person.self 是 Person 对象的 前 8 个字节,指向 元类型的指针.
 元类型中存储着 类的各种信息.
 Person.self 是   Person.Type 类型.
 */
let  p = Person.self

//可以获取到元类型:
var typeOfPerson = type(of: person)