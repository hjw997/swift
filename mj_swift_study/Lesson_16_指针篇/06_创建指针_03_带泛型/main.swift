//
//  main.swift
//  06_创建指针_03_带泛型
//
//  Created by whj on 2024/8/6.
//

import Foundation


/// 带泛型 就知道 自己读多少了. 所以不用Raw
var ptr = UnsafeMutablePointer<Int>.allocate(capacity: 2)
print(ptr)
/// 这里的 capacity 是容量, 表示存 2 个Int类型的,也就是16字节.

/// 建议先初始化内存 ⭐️⭐️⭐️⭐️⭐️
/// ptr.initialize(to: 10) /// 初始化前8 个字节.
ptr.initialize(repeating: 10, count: 2) /// 连续初始化 2个int .每 8 个字节 用10 来初始化.

/// ptr.advanced(by: 8) 除了 用 advanced 来偏移. 还可以用 successor .
/// successor --后继
ptr.successor() /// 如果ptr 指向的是第一个Int ,那么后继就是指向下一个Int
print(ptr)
print(ptr.successor())

/// 如果在来个后继就是 再指向下一个Int,也就是这个指针跳8个字节.
ptr.successor().successor()
/// 比如 ptr 刚开始指向 0x0 , 那么 ptr.successor() 0x8   ptr.successor().successor() 再跳8个字节 就是 0x10

/// 所以一下就是 持续往下走初始化数据.
ptr.successor().initialize(to: 10)
ptr.successor().successor().initialize(to: 10)


/// 因为是泛型指针: 所以可以通过 .pointee 来获取.
print(ptr.pointee)
print((ptr+1).pointee) ///指针偏移 1 就是指向下一个Int.跟 C很类似.
print(ptr.successor().pointee)
/// 通过下标来获取.---跟C 一样. 编译器知道了指向的数据类型后就更灵活了
print(ptr[0])
print(ptr[1])

//// 存数据 ⭐️⭐️⭐️⭐️⭐️
ptr.pointee = 2;
ptr.advanced(by: 8).pointee = 3

print(ptr)

/// 释放:⭐️⭐️⭐️⭐️⭐️
ptr.deinitialize(count: 2)
///如果当初是使用 initialize来初始内存这里就要使用 deinitialize 来释放.
/// 下一节证明内存泄漏.
ptr.deallocate()



