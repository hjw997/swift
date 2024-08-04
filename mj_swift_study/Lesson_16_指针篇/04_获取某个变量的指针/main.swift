//
//  main.swift
//  04_获取某个变量的指针
//
//  Created by whj on 2024/8/5.
//

import Foundation

/**
 场景: 如果我们在swift开发中有时候确实想要获取一个变量的指针,怎么办?

 */
var age  = 10
/// var ptr:UnsafePointer<Int> = &age //&age这种方式获取指针只能在函数传参中(前面几节已经讲过)
/// public func withUnsafePointer<T, Result>(
///  to value: T, //想要获取的变量的 指针 &方式传入.
/// _ body: (UnsafePointer<T>) throws -> Result)
/// rethrows -> Result    Result是函数返回值类型,也就是body 的闭包中返回的.
let ptr0 = withUnsafePointer(to: &age) { (pointer: UnsafePointer<Int>) -> UnsafePointer<Int> in
    /// 如果闭包表达式是单一表达式 return是可以省略的.
    return pointer
}

print(ptr0) /// 0x0000000100008008

/// 那么通过前面的章节学习 这个获取变量指针的方法大概原理是什么呢?其实可以自己写出
func withunsafePointer<Type, Result>(
        to ptr: UnsafePointer<Type>,
        _ body: (UnsafePointer<Type>) -> Result
        ) -> Result {
            /// 其实就是把 外面传的 &变量 获取的指针 通过闭包再传出去. ⭐️⭐️⭐️⭐️⭐️
            return body(ptr)
}
/// 闭包表达式如果是单一的 return 可以省略 直接使用 $0 ⭐️⭐️⭐️⭐️⭐️
let ptr01 = withunsafePointer(to: &age) { $0 }
print(ptr01)

func withunsafePointer1<Type>(to ptr: UnsafePointer<Type>) -> UnsafePointer<Type> {
    /// 其实就是把 外面传的 &变量 获取的指针 再传出去
    return ptr
}
let ptr1 = withunsafePointer1(to: &age)
print(ptr1)
print(ptr1.pointee) ///访问指针指向的内存数据


///上面获取是 不可修改内容的指针.
/// =========================================
let ptr_ = withUnsafeMutablePointer(to: &age) { $0 }

/// 获取可变的: RawPointer 闭包中就自己可以构建了.
let ptr2 = withUnsafeMutablePointer(to: &age) {
    (pointer: UnsafeMutablePointer<Int>) -> UnsafeMutablePointer<Int> in
        return pointer
}
ptr2.pointee = 50 /// 可以修改
let ptr3 = withUnsafeMutablePointer(to: &age) {
    UnsafeMutableRawPointer($0)
}
ptr3.storeBytes(of: 90, as: Int.self) //// 修改指针指向内存的值.

withUnsafePointer(to: age) { (pointer: UnsafePointer<Int>) -> UnsafePointer<Int> in
    return pointer
}

/// UnsafeRawPointer 构造器 可以用一个泛型指针 :
/// public init<T>(_ other: UnsafePointer<T>) 那么$0 就是个泛型指针.
let p4 = withUnsafePointer(to: &age) {
//    let dalloor = $0  //$0  是 UnsafePointer<Int> 类型.
//    print(dalloor)
    return UnsafeRawPointer($0) ///包装成RawPointer 返回.
}