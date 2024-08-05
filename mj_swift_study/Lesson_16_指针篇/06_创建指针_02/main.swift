//
//  main.swift
//  06_创建指针_02
//
//  Created by whj on 2024/8/6.
//

import Foundation

/**
 创建指针的第二种方式: allocate 和 dealloc .
 */

/// 分配16个字节的堆内存空间
/// PS ⭐️⭐️⭐️⭐️⭐️ 只有Mutable的才可以分配内存. 还有 RawPointer 是不知道自己指向的是什么类型数据,所以不知道要取多少字节. 但是如果带了泛型就知道了.
var ptr = UnsafeMutableRawPointer.allocate(byteCount: 16, alignment: 1)

/// 存数据 ⭐️⭐️⭐️⭐️⭐️
ptr.storeBytes(of: 10, as: Int.self)
ptr.advanced(by: 8) ///  ptr.advance(by:8) 在ptr 基础上偏移8 个字节后返回一个新的指针.
/// 所以这里可以连着调用:
ptr.advanced(by: 8).storeBytes(of: 20, as: Int.self)

/// 取数据 ⭐️⭐️⭐️⭐️⭐️
print(ptr.load(as: Int.self)) /// 取前8 个字节.
print(ptr.advanced(by: 8).load(as: Int.self))/// ptr 偏移 8 个字节取出后8个字节.

ptr.deallocate() /// 记得释放
