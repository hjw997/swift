//
//  main.swift
//  01_基础语法_变量常量
//
//  Created by whj on 2024/3/13.
//

import Foundation

print("swift--基础语法")

/// var 定义变量, let 定义常量.编译器能自动推断类型.
let a = 10
let b = 20
var c = a + b
c += 30
print(c)

/// let 定的 常量只能赋值一次 .
/// 它的值不要求在编译时期确定,但使用之前必须赋值一次.
let age1 = 20
let age2 : Int
//print(age2)
age2 = 30
print(age2)

/// 无论常量还是变量在初始化之前,都不能使用
let age4:Int
var height:Int
//print(age4)
//print(height)

///标识符 ( 常量名,变量名,函数名 ) 几乎可以使用任何字符
func 🐂🍺() {
  print("🐂🍺")
}
🐂🍺()

let 💀 = "ET"
let 🥛 = "milk"

/// 标识符 不能以数字开头,  不能包含空白字符,制表符,箭头等特殊字符.
