//
//  main.swift
//  05_基数语法_元祖_tuple
//
//  Created by whj on 2024/3/13.
//

import Foundation

/**
 tuple : 元组  /ˈtuː.pl/ UK/ˈtjuːpəl/ US/ˈtuːpəl/
 a structure of data that has several parts
 （数据的）元组
 */

print("Hello, World!")

/// 元祖类型:
let http404Error = (404, "Not Found")

/// 访问成员
let res1 = http404Error.0
let res2 = http404Error.1

/// 可以把一个元祖 变量直接赋值给以个新的元祖.
let (Int, String) = http404Error
let a = http404Error
/// 可以给元祖元素命名,可以单独访问
let (statusCode,statusMessage) = http404Error
/// 单独访问,
print(statusCode)
print(statusMessage)


/// 不想接收的 _  可以忽略
let (code, _ ) = http404Error
print(code)

/// 定义元祖的时候 可以给里面的元素 加个标签
let http200Status = (statusCode:200,desc: "OK")
/// 访问是 除了可以用数字0 , 1 还可以用 标签名
print(http200Status.0,http200Status.1)
/// 标签名访问
print(http200Status.statusCode , http200Status.desc)
