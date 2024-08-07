//
//  main.swift
//  07_指针之间的转换_02
//
//  Created by whj on 2024/8/8.
//

import Foundation


/**
 指针转换 : unsafeBitCast 直接把二进制拷贝过来.
 */
var ptr = UnsafeMutableRawPointer.allocate(byteCount: 16, alignment: 1)
ptr.assumingMemoryBound(to: Int.self).pointee = 10
(ptr+8).assumingMemoryBound(to: Double.self).pointee = 22.0

/// 参数1:要转换谁 , 参数2 : 转为什么类型指针
var ptr_x = unsafeBitCast(ptr, to: UnsafeMutablePointer<Int>.self)
/// 所以不管你怎么转换 指针就是存储的是内存地址而已 . ⭐️⭐️⭐️⭐️⭐️ 所以为什么叫忽略类型的转换

print(unsafeBitCast(ptr, to: UnsafeMutablePointer<Int>.self).pointee)
print(unsafeBitCast(ptr+8, to: UnsafeMutablePointer<Double>.self).pointee)

/** ⭐️⭐️⭐️⭐️⭐️ ⭐️⭐️⭐️⭐️⭐️
 unsafeBitCast : 原理: 忽略数据类型的强制转换,不会因为数据类型的变化而改变原来的内存数据:
 */

/// 什么叫改变内存数据格式:
var age = 10
var age2 = Double(age)

/// 首先获取下变量的指针 因为如果直接看内存是看不了的.
var ptr_age = withUnsafePointer(to: &age) { $0 }

var ptr_age2 = withUnsafePointer(to: &age2) { $0 }
/**
 通过获取指针 ViewMemory 看到 age age2 内存结构: 都是存储的是10 但是内存中二进制是不一样的. ⭐️⭐️⭐️⭐️⭐️

 0a 00 00 00   00 00 00 00  -> 大端模式 高高低低: 00 00 00 00   00 00 00 0a

 浮点数 10.0 内存的存储格式是:
 00 00 00 00   00 00 24 40 ->  40 24 00 00   00 00 00 00
 从上看出 这种转换 是改变了内存的存储数据格式. 因为 Double类型的浮点数 有 Double 类型的存储方式(什么科学计数等等)
 搜索:浮点数的存储  ⭐️⭐️⭐️⭐️⭐️
 */
print(age,age2)
print(ptr_age,ptr_age2)

/// unsafeBitCast 是忽略底层的数据格式的方式的.

var age3 = 10
var age4 = unsafeBitCast(age3, to: Double.self)

var ptr_age3 = withUnsafePointer(to: &age3) { $0 }
var ptr_age4 = withUnsafePointer(to: &age4) { $0 }
/**
 看到: age3 age4 内存数据:
 0a 00 00 00   00 00 00 00   0a 00 00 00   00 00 00 00
 */

/// 但是打印出 age3 和 age4 是不同的数据值
print("age3 = ",age3)
print("age4 = ",age4)
/**
    age3 =  10
    age4 =  5e-323   ⭐️⭐️⭐️⭐️⭐️
   ps 因为数据格式的不一样 所以这里就表示出的值 不一样了. 虽然内存数据是一样的.
 */








ptr.deallocate()
