//
//  main.swift
//  17_02_字面量协议
//
//  Created by whj on 2024/8/9.
//

import Foundation



/**
 Swift 自带的类型之所以 能够通过字面量初始化,是因为他们遵守了对应的协议 ⭐️⭐️⭐️⭐️⭐️

 */

///extension Bool : _ExpressibleByBuiltinBooleanLiteral, ExpressibleByBooleanLiteral { ...}

/**
 public protocol ExpressibleByBooleanLiteral {

    associatedtype BooleanLiteralType : _ExpressibleByBuiltinBooleanLiteral

    init(booleanLiteral value: Self.BooleanLiteralType)
}

 */
var b:Bool = false ///其实就是这个协议有个默认的 构造函数. 这么赋值 就等于调用了 协议的构造函数.

