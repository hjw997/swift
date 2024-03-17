//
//  main.swift
//  02_可选项_强制解包
//
//  Created by whj on 2024/3/17.
//

import Foundation

print("对可选项强制解包 使用! ")

var age:Int? = nil
age = 10
//Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
//var a = age + 10
var a = age! + 10 /// 使用强制解包
print(a)

/// 强制解包及其不推荐. 如果可选项里面是nil 的时候那么 就会直接运行报错.
/// ❌: Fatal error: Unexpectedly found nil while unwrapping an Optional value
age = nil
var b = age! + 10 /// 此时就很危险. ❌
print(b)


/// 如何知道一个值是不是转换成功?
var number1 = Int("123")
var number2 = Int("abc") ///准换不了.
if number1 != nil {
    print(number1)
}


