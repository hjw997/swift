//
//  main.swift
//  05_协议_mutating
//
//  Created by whj on 2024/3/4.
//

import Foundation

print("mutating--")

/*** 回顾 : mutating 的作用:
   值类型的实例方法,想修改值类型的内存的话,也就是想修改成员的话,必须使用 mutating 表示可以修改.
 */

/**
 只有将协议中的实例方法 标记为 mutating
  > 才允许结构体,枚举的具体实现修改自生内存.
  > 类在实现方法是不用加 mutating, 枚举, 结构体 才需要加 mutating.
 */
protocol Drawable {
    /// 就是如果值类型需要在这个方法修改内存就要协议的方法申明加上.
    mutating func draw()
    mutating func animation()
}

class Size: Drawable {
    var width : Int = 0

    func draw() {
        width = 10
    }
    func animation() {
        print("动画----")
    }
}

struct Point : Drawable {
    var x: Int = 0

    mutating func draw() {
        x = 10
    }
    /// 如果不涉及修改值类型的内存的时候 可以不用 mutating.
    func animation() {
        print("struct ---animation")
    }
}