//
//  main.swift
//  01_枚举的内存布局
//
//  Created by whj on 2024/3/10.
//

import Foundation

/**
 枚举的内存布局
 */
//enum TestEnum {
//    case test1 , test2, test3
//}

//enum TestEnum : Int {
//    /// rawValue 不和枚举成员存一起的 .
//    case test1 = 1 , test2 = 2, test3 = 3
//}

/// 关联值
enum TestEnum  {
    case test1(Int,Int,Int)
    case test2(Int,Int)
    case test3(Int)
    case test4(Bool)
    case test5
}

print(MemoryLayout<TestEnum>.size) //25 实际大小
print(MemoryLayout<TestEnum>.stride) //系统分配 32
print(MemoryLayout<TestEnum>.alignment) // 内存对齐系数 8

var t = TestEnum.test1(1, 2, 3)
print(Mems.ptr(ofVal: &t)) /// 获取变量的内存地址
t = .test2(5, 6)
t = .test3(7)
t = .test4(true)
t = .test5

print(t)

/// 小端模式: 高高低低
/// 读的时候高地址放高地址,低地址放地字节
/// 所以读出第一个字节表示是:
///     高字节   <----    低字节
/// 0x  00 00 00 00   00 00 00 01
///    01 00 00 00   00 00 00 00 |  02 00 00 00   00 00 00 00 |  03 00 00 00   00 00 00 00  |  00 | 00 00 00   00 00 00 00