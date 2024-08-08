//
//  main.swift
//  07_指针转换_03_补充
//
//  Created by whj on 2024/8/8.
//

import Foundation

/**
 对 unsafeBitCast 的一个补充:
 另一个用法: 获取堆空间对象的地址
 */

class Person {}

/// 这里其实 person 就是一个指针变量.编译器特性 提示是 Person 类型
var person = Person()

/// 方法1 : 这里拿到的是 指向 person的指针.--包装为 非泛型的是因为 非泛型的有个 .load 方法.
var ptr_person = withUnsafePointer(to: &person) {UnsafeRawPointer($0)}

/// 那么把指向的 内存空间 的内容读取出来不就是 person 中存储的 Person对象的堆空间地址么?
var address_obj_person = ptr_person.load(as: UInt.self) /// 10进制的

/// 拿到 Person对象堆空间的地址.--这样的构造优点绕. ⭐️⭐️
var person_heap_address = UnsafeRawPointer(bitPattern: address_obj_person)

print(address_obj_person)    /// 105553116299264
print(person_heap_address)  /// Optional(0x0000600000008000)

/**
 方式二:⭐️⭐️⭐️⭐️⭐️ unsafeBitCast 的妙用:
  直接把 person 指针中的二进制 拿出来.
 */
var personHeapAddress = unsafeBitCast(person, to: UnsafeRawPointer.self)
print(personHeapAddress) /// 0x0000600000008000

/** 打印结果:
105553116299264
Optional(0x0000600000008000)
0x0000600000008000
 */


/**
 总结: 有了这些获取指针的知识 就可以窥探更多的内容. 比如元类型指针 Person.self 这指针 等等.
 */