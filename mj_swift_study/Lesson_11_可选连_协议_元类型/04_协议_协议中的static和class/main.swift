//
//  main.swift
//  04_协议_协议中的static和class
//
//  Created by whj on 2024/3/4.
//

import Foundation

print("协议中的static 和 class")

/**
 属性章节:ppt-08
 类型属性: 只能通过类型去访问.
 > 存储类型属性(Stored Type Property) :整个程序运行过程中,就只有 1 份内存(类似于全局变量)
 > 计算类型属性
 可以通过 static 定义类型属性.
 如果是类,也可以用关键字 class
 */
 struct Car {
     /// 不同于 存储实例属性, 你必须给 存储类型属性 设定初始值.
     /// 因为类型没有像实例那样的 init初始化器来初始化存储属性.
     static var count : Int = 0
     /// 存储类型属性 默认是 lazy,会在第一次使用的时候才会初始化.
     /// 就算被多个线程同时访问,保证只会初始化一次.

     init() {
         Car.count += 1
     }
 }

/// - Todo: 属性章节  -- 复习一下 类型属性 相关的知识点.
///

/// 为何保证通用,协议中必须用 static 定义类型方法,类型属性,类型下标 - class 只用在类中
protocol Drawable {
    /// 通用使用 static . 因为协议 是 可以被结构体 和 枚举 遵守. class 只用在类中
    /// 将来实现的时候 是 class 还是 static 看你用途.
    static func draw()
}
class Person1 : Drawable {

    /// 实现使用 class 表示允许子类重写这个类型方法.
    class func draw() {
        print("Person1-draw")
    }
}

class Person2 : Drawable {

    /// 使用static 表示不允许子类重写类型方法
    static func draw() {
        print("Person1-draw")
    }

}