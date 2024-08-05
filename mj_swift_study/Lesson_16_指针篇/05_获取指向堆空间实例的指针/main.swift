//
//  main.swift
//  05_获取指向堆空间实例的指针
//
//  Created by whj on 2024/8/6.
//

import Foundation

/**
 获取 对空间实例 的指针.
 */


var age = 10
var  ptr_age = withUnsafePointer(to: &age) { $0 }
/// ptr_age.pointee  和 age 是等价的
ptr_age.pointee /// .pointee 的意思 Accesses the instance referenced by this pointer.
/// 也就是 通过指针的.pointee 访问指针指向的内存空间.⭐️⭐️⭐️⭐️⭐️
/// .pointee 等价于指向的东西.

print(ptr_age) /// 打印指针变量里面存储的内容. 是个指针,也就是 age 的地址.
/**
 0x0000000100008128  如果是全局区或者代码区的地址 那么 1后面一般 4个0 ,
                    堆空间是 100xxx 一般是2个0才是堆空间的.
 */


class Person{
    var age : Int
    init(age:Int){
        self.age = age
    }
}
var person = Person(age: 20)
let ptr_person = withUnsafePointer(to: &person) { $0 }
/// ptr_person.pointee 等价于 person  因为.pointee 等价于指向的东西.
ptr_person.pointee.age = 10
///等价于
person.age = 10
/**
 现在一个比较疑惑的问题是 ptr_person 是 person变量的地址值呢 还是 Person对象的堆空间地址值呢?
 */
print(ptr_person)
/**
 print(ptr_age) :    0x0000000100008178
 print(ptr_person)   0x0000000100008188 看出 ptr_person 也是个全局区地址.
 所以,ptr_person 存储的是 person 变量的地址. 并非 Person对象的地址.
 也就是说 ptr_person 指向的是 person 这个指针变量.而不是堆空间.⭐️⭐️⭐️⭐️⭐️
 PS:区分 age 和 person 两种不同类型,
        age 是值类型 10 直接存储到 age 的 8 个字节中.
        person 是引用类型.
 */

/// 所以综上 : ⭐️⭐️⭐️⭐️⭐️
/// withUnsafePointer(to: &xxx) { $0 } 返回的就是 xxx 变量的地址值.
///
///那么获取堆空间的地址呢? person对象的堆空间的地址呢?
///首先补充一个知识点: UnsafeMutableRawPointer(bitPattern: <#T##Int##Swift.Int#>)
var address = UnsafeMutableRawPointer(bitPattern: 0x0000000100008178)
/// 上面的构造方法 意思是 bitPattern 后面传入的地址 ,那么address 指向的就是 这个内存地址.
print(address) ///Optional(0x0000000100008178) 可选是因为是可失败初始化器.因为这个地址可能不存在.
/// 所以思路是:怎么拿到堆空间地址呢? 把堆空间的地址 用这个构造就好了.
/// 那么如何获取 person对象的地址值呢?

/// 在回顾一个基础知识 :
var age0 = 10
var ptr_age0 = withUnsafePointer(to: &age0) {
    UnsafeRawPointer($0) /// 相当于 const void *  指向一个内存空间.
}
/// 获取这个内存空间存储的东西 可以通过 ptr.load(as : 类型) 这个方法
let value = ptr_age0.load(as: Int.self) /// 取出这个指针指向的空间的内容. 10


/// 现在有了上面的基础知识 继续接着看 怎么获取 堆空间的对象的 地址:
var person0 = Person(age: 21)
let address_person0 = withUnsafePointer(to: &person0) {
    UnsafeRawPointer($0)
}
/// address_person0 现在 得到 person0 的地址,
print(address_person0)

/// 再从这个地址获取到里面存储的东西.--因为是地址 就是取8个字节.
let person0_ObjAddress = address_person0.load(as: UInt.self) ///拿到的是十进制的 ⭐️⭐️⭐️⭐️⭐️
print(person0_ObjAddress)
/// 所以 person0_ObjAddress 拿到的就是 person0 里面存储的值.就是堆空间的地址值.
let heapAddress = UnsafeMutableRawPointer(bitPattern: person0_ObjAddress)
print(heapAddress) ///Optional(0x0000600000205cc0)

/// 再用MJ老师的工具类验证下:
var address_p = Mems.ptr(ofRef: person0)
print("MJ老师工具校验 person0 堆空间的地址= ", address_p)/// 0x0000600000205cc0