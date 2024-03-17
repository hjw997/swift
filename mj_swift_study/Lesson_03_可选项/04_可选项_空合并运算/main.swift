//
//  main.swift
//  04_可选项_空合并运算
//
//  Created by whj on 2024/3/17.
//

import Foundation

print("空合并运算符--- ?? ")

/// 空合并运算符 ??  Nil-Coalescing Operator
/// a ?? b  返回的结果取决于b .是可选还是非可选取决于b .
/// 空合并 运算符 其实 是 运算符重载 ??
let a: Int? = 10
let b: Int = 5
let c = a ?? b

/*** ?? 这个运算符重载函数: 参数1 必须是可选, 参数2 类型 是 可选或者 非可选, 最后的结果 和 参数 2 的返回类型一致.
 public func ?? <T>(optional: T?, defaultValue: @autoclosure () throws -> T) rethrows -> T

 public func ?? <T>(optional: T?, defaultValue: @autoclosure () throws -> T?) rethrows -> T?


 */
