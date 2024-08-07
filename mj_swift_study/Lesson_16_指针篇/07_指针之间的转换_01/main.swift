//
//  main.swift
//  07_指针之间的转换_01
//
//  Created by whj on 2024/8/8.
//

import Foundation

/**
 指针之间的转换:
 为何要指针之间转换呢?
 */
var ptr = UnsafeMutableRawPointer.allocate(byteCount: 16, alignment: 1)
/// 上面的ptr 是个 原始指针.我们在获取数据操作的时候 就需要用 load
ptr.load(as: Int.self) /// 获取数据
ptr.storeBytes(of: 10, as: Int.self) ///存取
/// 再往后8 个字节时候 需要指针偏移 等等原因没有泛型的 .pointee 方便.
ptr.storeBytes(of: 20, toByteOffset: 8, as: Int.self)

/// 如果目前我知道 要将这16个字节当做Int来用 直接转为泛型指针 操作读写更方便 ⭐️⭐️⭐️⭐️⭐️
var ptr1 = UnsafeMutableRawPointer.allocate(byteCount: 16, alignment: 1)
/// 转为 泛型指针 .
/// 泛型指针(原始指针) 构造是没有的
//UnsafeMutablePointer()
///  反过来有.原始指针(泛型指针) 构造是有的.
// UnsafeMutableRawPointer(<#T##other: UnsafeMutablePointer<T>##Swift.UnsafeMutablePointer<T>#>)


/// assumingMemory 假象你的内存是什么样的  所以看到变为了泛型指针 ⭐️⭐️⭐️⭐️⭐️
let   ptr_int = ptr1.assumingMemoryBound(to: Int.self)
ptr_int.pointee = 20 /// 前 8 个字节
/// 后8 个字节
(ptr_int+1).pointee = 10
ptr_int.successor().pointee = 10 /// 也可以

/// 也可以中 C 语言数组的形式访问读写.
ptr_int[0] = 10 /// 给指针的前8 个字节 赋值为 11
ptr_int[1] = 11
print(ptr_int)

/// 注意 泛型指针偏移(+1就是偏移泛型类型存储的字节数)  和 原始指针偏移(+多少就是多少字节) 的区别 ⭐️⭐️⭐️⭐️⭐️
///
var ptr_3 = UnsafeMutableRawPointer.allocate(byteCount: 16, alignment: 1)
ptr_3.assumingMemoryBound(to:Int.self).pointee = 11 ///前8个字节
(ptr_3 + 8).assumingMemoryBound(to: Double.self).pointee = 12
print(ptr_3)

/// PS 内存记得释放 ⭐️⭐️⭐️⭐️⭐️
ptr.deallocate()
ptr_int.deallocate()
ptr_3.deallocate()
