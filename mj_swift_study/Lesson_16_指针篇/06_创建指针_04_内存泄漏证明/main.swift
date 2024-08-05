//
//  main.swift
//  06_创建指针_04_内存泄漏证明
//
//  Created by whj on 2024/8/6.
//

import Foundation

class Person {
    var age: Int
    var name:String
    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }
    deinit {
        print(name,"deinit")
    }
}

/// 分配能存储 3 个 对象的 内存.
var ptr = UnsafeMutablePointer<Person>.allocate(capacity: 3)

/// 指针偏移 已经学了很多种了 advance successor()
ptr.initialize(to: Person(age: 10, name: "Jack"))
(ptr+1).initialize(to: Person(age: 10, name: "Rose"))
ptr.successor().successor().initialize(to: Person(age: 10, name: "Kate"))
///ptr.advanced(by: 8).initialize(to: Person(age: 10, name: "Jack"))

/// 如果不反初始化 deinitialize , person就内存泄漏了
/// ptr.deinitialize(count: 1) //Jack deinit

/// ptr.deinitialize(count: 2)
/**
ptr.deinitialize(count: 2)
Jack deinit
Kate deinit
 */

ptr.deinitialize(count: 3) /// 当初初始化几个 就释放几个.
/** 三个对象才正确释放.
Jack deinit
Rose deinit
Kate deinit
 */

ptr.deallocate()



