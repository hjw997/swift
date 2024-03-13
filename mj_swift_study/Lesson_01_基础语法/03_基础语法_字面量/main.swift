//
//  main.swift
//  03_基础语法_字面量
//
//  Created by whj on 2024/3/13.
//

import Foundation

print("swift 字面量 ")

/// 布尔 字面量是 true 和 false
let bool = true ///取反 是 false.

/// 字符串 "" 双引号
let string = "Jack"

/// 字符类型 可存储ASCII字符 , Unicode 字符)
/// 也是用了 双引号 "" , 所以要写清楚 类型 Character, 不写就是String.
let character : Character = "d"


/// 整数的字面量
let  intDecimal = 17 /// 十进制
let  intBinary = 0b1001 /// 二进制形式
let  intOctal = 0o21  /// 八进制 ps 是第二个是 字母 o, 不是0
let  intHex = 0x11 /// 十六进制 0x
print(intOctal) /// 打印出来是10进制.
print(intBinary) /// 9

/// 浮点数字面量
let  doubleDecimal = 125.0 /// 十进制 等价于1.25e2 表示 1.25 x 10^2次方 .
let  doubleDecimal_1 = 1.25e-2 /// 十进制  0.0125, 1.25e-2 也就是 1.25 x 10^-2 次方.
let  doubleHexaadecimal_1 = 0xFp2 /// 十六进制 意味着 15 x 2 ^ 2 , 相当于 十进制 60.0
/// 十六进制最大 就是 F , p是power 缩写 p2 就是2的平方.  所以 0xFp2 , 就是 15 x 2^2
print(doubleDecimal_1)

/// 整数 和 浮点 数 为了阅读遍历 可以增加 下划线增强可读性
let aa = 100_0000 ///100万 ///中国人是以 4个 0 为一组.
let bb = 1_000_000.000_000_1 /// 如英语中3个零 一组

/// 浮点数前面可以追加零,保持几位 看自己
let cc = 000123.456
print(cc)

/// 数组的字面量
let array = [1, 2, 3, 4, 5]


/// 字典
let dict = ["age": 18, "height": 168, "weight": 120]






