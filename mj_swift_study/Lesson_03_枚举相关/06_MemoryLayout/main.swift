//
//  main.swift
//  06_MemoryLayout
//
//  Created by whj on 2024/3/10.
//

import Foundation

print("内存布局查看")

/**
 MemoryLayout 获取数据的占用的内存大小.  C语言 sizeof()
 */
let age = 10
print(MemoryLayout<Int>.size) //8字节 占用真真大小
print(MemoryLayout<Int>.stride) //8 实际分配.
print(MemoryLayout<Int>.alignment) //对齐系数.8
print("---------1--------")

/// 查看某个变量 的大小: age变量的大小
print(MemoryLayout.size(ofValue: age))
print(MemoryLayout.stride(ofValue: age))
print(MemoryLayout.alignment(ofValue: age))

print("---------2--------")
enum Password { /// 起名用大写驼峰
    case number(Int,Int,Int,Int) /// 枚举成员用小写.
    case other
}

/// 关联值是要保存到枚举的成员值中的.
var pwd = Password.number(4, 5, 6, 7)
pwd = .other

print(MemoryLayout.size(ofValue: pwd))
print(MemoryLayout.stride(ofValue: pwd))
print(MemoryLayout.alignment(ofValue: pwd))


print(MemoryLayout<Password>.size) ///33  实际用到的空间大小 32 + 1
print(MemoryLayout<Password>.stride) ///40 系统分配的空间大小. stride :跨度
/// 对齐系数: 变量的内存地址必须被对齐系数整除.
/// 参考: https://www.youtube.com/watch?v=x3MoFpSuia0
print(MemoryLayout<Password>.alignment) /// 8




