//
//  main.swift
//  02_协议_01
//
//  Created by whj on 2024/3/4.
//

import Foundation

print("swift 中协议的基本知识学习-语法")

/**
 swift 中的协议 可以用来定义 : 方法, 属性, 下标  的 声明.
 协议可以被 枚举, 结构体 , 类遵守,(多个协议之间用逗号隔开)

 */

protocol Drawable {
    ///方法
    func draw()

    ///协议中的属性: 以下 x 和 y 是 协议中的属性
    /**
         协议中 对于 x 没有说是 计算属性,还是存储属性,  要求是可以读取 可以写
     */
    var x:Int { get set }   /// 里面的 get set 仅仅是申明 ,意思是实现的时候好可读可写.
    var y:Int { get }      /// 实现时候 只要求只读就可以

    subscript(index:Int) -> Int { get set}

    /// 协议中申明属性和下标 只需要声明是要只读的还是可读可写

    ///- Todo:  协议 学透 , 各种语法, 还有 对协议的扩展相关的 点 一次学完

}

protocol Test1{}
protocol Test2{}
protocol Test3{}

///遵守多个协议 使用 , 号隔开.
class TestClass : Test1,Test2,Test3 {}

protocol Test4 {
    func test4(num:Int)
    ///协议中定义方法时,不能有默认参数值
    func test4_1(num:Int = 0) ///❌: Default argument not permitted in a protocol method
}

/// 默认情况下,协议中定义的内容必须全部都实现.
/// - Todo: 也有办法只实现部分内容,以后的课程会讲到? 扩展???











