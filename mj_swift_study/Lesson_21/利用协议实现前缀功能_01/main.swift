//
//  main.swift
//  利用协议实现前缀功能_01
//
//  Created by whj on 2024/2/20.
//

import Foundation

print("利用协议实现前缀功能------1")


/**
 计算一个字符串中包含的数字
 */
var str = "1235abcdef1234"

/**
 实现方法 使用一个函数
 */
func numberCount(_ str:String) -> Int {
    var count = 0
    for c in str {
        if ("0"..."9").contains(c) {
           count += 1
        }
    }
    return count
}
///更加简化的swiftfy 的代码:
func numberCount1(_ str:String) -> Int {
    var count = 0
    
    /// 更加简化的代码:
    for c in str where ("0"..."9").contains(c) {
        count += 1
    }
    return count
}


print(numberCount(str))

/**
 我们还可以直接给字符串添加个计算属性
 */
extension String {
    //除了扩展方法还可以直接扩展一个计算属性:
    var numberCount: Int {
        var count = 0
        for c in self where ("0"..."9").contains(c) {
            count += 1
        }
        return count
    }
}

print(str.numberCount)

/**
 上面的扩展属性的方式,虽然已经很好用了, 但是这种随意扩展 有可能会把系统或者被的开发者扩展出的给覆盖了.
 可以使用更加优雅的方式:str.mj.numberCount这样的方式:
 1.先给字符串扩展一个mj属性.
 */

//基础的MJ包装对象,谁调用它就返回一个谁.
struct MJ<Base>{
    private var base:Base
    init(_ base:Base) {
        self.base = base
    }
}

extension String {
    //谁调用mj.就返回一个对象
    var mj:MJ<String> {MJ(self)}
}
/// 然后给MJ扩展功能,同时加个限制(where条件给谁加)
extension MJ where Base == String{
    var numberCount: Int {
        var count = 0
        //此时这个self就是base,因为上面mj.时候扩展出来一个
        for c in base where ("0"..."9").contains(c) {
            count += 1
        }
        return count
    }
}

print("123abc".mj.numberCount)

/**
 最基本思路:
 1.先制作一个基本的MJ<Base> 结构体类,就是前缀类型,哪个对象里面扩展前缀对象,哪个对象的 Base 包装的就是谁.
 2.给MJ类型扩展方法,同时基于Base做个限制.
 3.以后字符串调用 "xxx".mj 其实就是返回了前缀对象,然后调用前缀对象的扩展的方法.
  注意对前缀对象扩展时候加限制是不想其他的扩展中 调用乱七八糟的方法 更干净.
 */

class Person {}
extension Person {
    //给 Person 扩展前缀属性,计算属性
    var mj:MJ<Person> { MJ(self) }
}
///再针对Person 的 mj 扩展属性方法
extension MJ where Base:Person { //PS:Base:Person 意思是Person的子类或Person类, Base == Person 只能是Person类
    func eat() {
        print("Person的mj扩展eat()")
    }
}

var person = Person()
person.mj.eat()

/***
 类型.self  就是 类型.Type 类型的实例
 */
var p = Person.self
