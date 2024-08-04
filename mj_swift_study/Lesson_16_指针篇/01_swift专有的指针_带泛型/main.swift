//
//  main.swift
//  01_swift专有的指针_带泛型
//
//  Created by whj on 2024/8/5.
//
/**
 swift中有专门的指针,这些都被指定为 "Unsafe"(不安全的), 常见的有以下4种类型:
 带泛型的:<Pointer> 泛型表示指向这种类型
 比如 UnsafePointer<Int> 指向的就是Int类型的指针,指向的空间就占4个字节.
     UnsafePointer<Double> 指向的就是 Double类型的指针,指向的内存就是8个字节.⭐️⭐️⭐️⭐️⭐️
 不带Mutable 就不能修改指向的内存.
 1.UnsafePointer<Pointer> 类似于 const Pointee * , const 修饰的指针就是不能通过指针修改指向的内存--只能读
 2.UnsafeMutablePointer<Pointer> 类似于  Pointee *

 不带泛型的普通的指针,
    void * 就是给一个内存去指,指向的内存占用多少字节呢? -- 不确定.
 3.UnsafeRawPointer          类似于 const void *
 4.UnsafeMutableRawPointer   类似于 void *
 */

import Foundation

var age = 10

/**
 - Parameter ptr: 泛型指针,指向 Int 类型的指针,可以通过指针修改内存数据.
 */
func test1(_ ptr: UnsafeMutablePointer<Int>) { /// 等价 int *
    print("test1 ptr:=",ptr)
    let x = ptr.pointee
    print("test1 未修改 = ptr.pointee=",x)
    ptr.pointee = 888
    print("test1 修改后 = ptr.pointee=",ptr.pointee)
}

/**
 - Parameter ptr: 指向Int类型的指针,不能通过指针修改内存.
 */
func test2(_ ptr: UnsafePointer<Int>) { /// 等价 const int *
    /// 如何间接访问内存的数据?⭐️⭐️⭐️⭐️⭐️  带泛型的直接这样 .pointee
    print("test2 ptr:=",ptr)
    /// ps:看 ptr.pointee 取出的就是 指针泛型的类型.
    let value = ptr.pointee
    /// ptr.pointee = 40 不可修改❌
    print("test2 ptr.pointee=",value)
}

/// inout 输入输出参数: 回顾一下
func test3(_ ptr:inout Int) {
    ///可以直接修改内存的内容.
    ptr = 30
}
/// 如何指针呢? 还是使用 &.
test2(&age)
test1(&age)

//test3(&age) //内部修改为了 30
print(age)
/** 打印结果
test2 ptr:= 0x0000000100008010
test2 ptr.pointee= 10
test1 ptr:= 0x0000000100008010
test1 未修改 = ptr.pointee= 10
test1 修改后 = ptr.pointee= 888
888
 */