//
//  main.swift
//  06_创建指针_01
//
//  Created by whj on 2024/8/6.
//

import Foundation

/**
 之前学习的都是 已经知道一个变量来获取指针,
 那么现在 开始学习 分配一个新的堆空间,然后 指向这个堆空间.
 比如 malloc 申请多少堆空间字节
 */
 /// 申请堆空间的 16个字节. 相当于void *  , malloc 的需要自己管理内存
var ptr = malloc(16)
/// ps malloc 返回的类型是 Mutable 类型的,允许你该内存中的内容.

/// ⭐️⭐️⭐️⭐️⭐️ 存 往内存中放数据
ptr?.storeBytes(of: 11, as: Int.self) /// 往这个内存的前 8 个字节放入 11
/// 还可以通过偏移量来存数据, toByteOffset: 0 就是没偏移,就是上面的等价.
ptr?.storeBytes(of: 22, toByteOffset: 8, as: Int.self) ///toByteOffset: 8 偏移8个字节.

/// ⭐️⭐️⭐️⭐️⭐️ 取数据
print((ptr?.load(as: Int.self))!)  /// 取出 前8 个字节. --11
print((ptr?.load(fromByteOffset: 8, as: Int.self))!) /// 通过偏移来获取 后 8 个字节. --22


free(ptr) /// 需要自己释放内存用完后

