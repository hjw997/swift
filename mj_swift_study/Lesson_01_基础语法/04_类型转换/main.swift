//
//  main.swift
//  04_类型转换
//
//  Created by whj on 2024/3/13.
//

import Foundation

print("swift 类型转换")

/// 类型不同 不能直接 相加 , 不像 c 语言 会有隐式转换

let int1:UInt16 = 2_000
let int2: UInt8 = 1
//let int3 = int1 + int2   类型不同不能直接相加
let int3 = int1 + UInt16(int2) ///转换为相同类型后 才能 做运算操作.


/// 整数和浮点转换
let int = 3
let double = 0.14159
let pi = Double(3) + double
print(pi)

let intPi = Int(pi) /// 丢失精度. 小数被截取了.
print(intPi)

/// 字面量可以直接相加,因为数字字面量本身没有明确的类型.因为类型是给 常量 变量 用的. 如:
let result = 3 + 0.1415926
print(result)
