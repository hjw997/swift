//
//  main.swift
//  09_协议_协议的组合
//
//  Created by whj on 2024/3/7.
//

import Foundation

print("协议的组合 协议A & 协议B ")

protocol Livable { }
protocol Runnable { }
class Person { }

/// 接收 Person 或 Person的子类.
func fn0(p: Person) {

}
/// 接收遵守Livable协议的实例
func fn1(obj:Livable) {

}

/// 接收 同时遵守Livable Runnable 协议的实例
func fn2(obj:Livable & Runnable) { ///✅:Livable & Runnable 叫协议的组合.

}

/// 接收 同时遵守 Livable, Runnable 协议,并且是 Person或者其子类的实例.
func fn3(ojb: Livable & Person  & Runnable) { ///组合没先后顺序要求.
    ///PS:协议的组合,可以包含1个类 类型(最多一个) , 注意是类类型,结构体枚举不可以.
}

/// 继承的类要放在第一个位置.后面的协议可以多个.
class Student: Person, Livable, Runnable {

}
var stu = Student()
fn3(ojb: stu)

///还可以把组合的类重定义一个
typealias RealPerson = Person & Livable & Runnable

func fn4(obj: RealPerson) {

}