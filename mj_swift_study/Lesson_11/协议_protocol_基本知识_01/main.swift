//
//  main.swift
//  协议_protocol_基本知识_01
//
//  Created by whj on 2024/2/20.
//

import Foundation

print("swift 中协议的基本知识学习")

/**
 swift 中的协议 可以用来定义方法, 属性, 下标  的 声明,
 协议可以被枚举, 结构体 , 类遵守,(多个协议之间用逗号隔开)
 
 */

protocol Drawable {
    func draw()
    
    //协议中的属性: 以下 x 和 y 是 协议中的属性
    /**
         协议中 对于 x 没有说是 计算属性,还是存储属性,  要求是可以读取 可以写
     */
    var x:Int { get set }
    var y:Int { get }
    
    subscript(index:Int) -> Int { get set}
}

