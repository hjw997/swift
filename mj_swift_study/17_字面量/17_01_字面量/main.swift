//
//  main.swift
//  17_01_字面量
//
//  Created by whj on 2024/8/9.
//

import Foundation

/**
 字面量 -Literal : 解释:
 adj. 字面意义的；完全按原文的；缺乏想象力的
 The literal meaning of a word is its original, basic meaning. ⭐️⭐️⭐️⭐️⭐️
 （意义）字面的，根本的
 The literal meaning of "television" is "seeing from a distance".
 television 的字面意思是“从远处看”。

 You will need to show more than just a literal understanding of the text.
 你需要显示自己对文本的理解没有仅仅停留在字面含义上。
 计算机属于解释:
    在计算机科学中，字面量（literal）是用于表达源代码中一个固定值的表示法（notation）
 */

var age = 10
var isRed = false
var name = "Jack"

/**
 为什么上面的这些 赋值后就知道自己的类型呢? 都是因为有 字面量协议 这么个东东
  常见字面量的默认类型 -看课件.

  源码中定义的: 如何跳入看申明:如下方式 --Xcode 看会有声明注释等.
 */
typealias  XXX = IntegerLiteralType /// 点进去-就可以看到申明更多.

/// 可以通过 typealias 修改字面量的默认值类型---如下:
typealias FloatLiteralType = Float
typealias IntegerLiteralType = UInt8

var age1: UInt8 = 10
var height = 1.68

var a:Int = 10
/// swift 自带的绝大部分 类型,都支持直接通过字面量进行初始化
/**
Bool
Int
Float
Double
String
Array
Dictionary
Set
Optional
 */




