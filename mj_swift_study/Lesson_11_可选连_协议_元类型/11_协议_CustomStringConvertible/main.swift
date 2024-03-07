//
//  main.swift
//  11_协议_CustomStringConvertible
//
//  Created by whj on 2024/3/8.
//

import Foundation

print("Hello, World!")

/// 遵守 CustomStringConvertible 协议,都可以自定义实例的打印字符串.- description 只读属性
/// CustomDebugStringConvertible - debugDescription
class Person: CustomStringConvertible, CustomDebugStringConvertible {
    var age : Int
    var name: String

    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }

    var description: String {
        "Person(age: \(age), name: \(name))"
    }

    var debugDescription: String {
        "debug_Person(age: \(age), name: \(name))"
    }
}
var person = Person(age: 19, name: "Jack")
print(person) /// 打印的是 CustomStringConvertible协议的 description
debugPrint(person) ///debugPrint和 断点调试 po  打印的是 CustomDebugStringConvertible 协议的 debugDescription
