//
//  main.swift
//  17_03_字面量协议的应用
//
//  Created by whj on 2024/8/9.
//

import Foundation

///假设我现在想 通过一个 布尔值 来 初始化一个 Int 类型的值

extension Int : ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = value == true ? 1 : 0
    }
}
var num : Int = true /// 这里就是回去调用 上面协议的 init 方法.
print(num) /// 1

/// 通过一个字符串来初始化 Int  之前是 Int("123")  ---> 通过 var:Int = "123"

extension Int: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String

    public init(stringLiteral value: String) {
        let v = Int(value)
        self = v ?? 0
    }
}
var age1:Int = "12"
print(age1) /// 12


/// 那么 我们能否 通过给一个字面量来初始化一个 对象呢?

class Student : ExpressibleByIntegerLiteral,ExpressibleByFloatLiteral,ExpressibleByStringLiteral, CustomStringConvertible {
    var description:String {"name = \(name),score = \(score)"}

    required init(integerLiteral value: Int) {
        self.score = Double(value)
    }

    required init(floatLiteral value: Double) {
        self.score = value
    }

    var name = ""
    var score:Double = 0

    required init(stringLiteral value: String) {
        self.name = value
    }
}
/// 可以通过 字面量来初始化对象 ⭐️⭐️⭐️⭐️⭐️
var stu: Student = 90
stu = 80.5
print(stu)
stu = "jack"
print(stu)
/**
 name = ,score = 80.5
 name = jack,score = 0.0
 */




