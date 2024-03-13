//
//  main.swift
//  02_基础语法_常见数据类型
//
//  Created by whj on 2024/3/13.
//

import Foundation

print("Hello, World!")


/// swift 中的数据 分为 两大类.
/**
    值类型(value type) : 枚举类型 enum : Optional 自定义的枚举
                        结构体 struct : Bool Int Float Double Character , String ,Array , Dictionary , Set

 
    引用类型(reference type) : 类 class .
 */

/// Int 查看数据定义是结构体
var age : Int = 10

///  整数类型 Int8(1个字节) Int16(2个字节)  Int32(4字节)  Int64(8字节)  : 分别占用 一个字节8位的Int , 16 : 16位 2个字节的Int. 以此类推.
///  整数类型 无符号: UInt8 Uint16 , Uint32(4字节)  Uint64
/// PS  那么Int呢?
var a : Int = 10
/// 定义提示: Overview On 32-bit platforms, Int is the same size as Int32,
///          and on 64-bit platforms, Int is the same size as Int64.
///每个整数还有 最值 .
print(UInt8.max) /// 255
print(UInt16.min) /// 0
/// 这就是定义结构体的好处.可以有一些属性. 使用更丰富.
///
/// 所以使用不用考虑 用Int8 Int16 直接用 Int , 如果对内存有特殊要求的地方,比如我要一个字节 等 就可以使用 Int8 Int16 等这种.


/// 浮点类型 : Float Double 两种
/// Float:32位,精度只有6位;
/// Double 64位,精度至少15位

let letFloat : Float = 30.0 /// swift 中如果是 浮点就要写清楚类型.
//let f = 30.0f//swift 中没有浮点 用后缀f F
let letDouble  = 30.0 ///什么不写 默认是 Double 类型.
