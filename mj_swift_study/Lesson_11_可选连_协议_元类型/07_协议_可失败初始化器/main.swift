//
//  main.swift
//  07_协议_可失败初始化器
//
//  Created by whj on 2024/3/6.
//

import Foundation

print("协议的可失败初始化器")
/*** 协议中可失败初始化器:
 协议中的init? , init!,可以用init  init? init! 去实现.
 协议中的 init , 可以用 init 和 init! 去实现.(继承重写是不可以的)
 */
protocol Livable {
    init()
    init?(age: Int)
    init!(no:Int)
}
class Person: Livable {
    //required init() {}
    required init!(){}
    /**
     之前我们在学习 可失败初始化器的时候说过:
     可以用一个非可失败初始化器重写一个可失败初始化器,
     反过来不行.
     用一个可失败初始化器,重写一个非可失败初始化器 这样是不行的❌
     但是 协议中是可以的✅.如上 init!() 可失败去重写了不可失败初始化器init().
     */


    required init?(age: Int) {}

//    required init!(no: Int) {
//        if (no == 0) {
//            return nil
//        }
//    }
    required init?(no: Int) {
        if (no == 0) {
            return nil
        }
    }
    ///required init(no: Int) { }

}
/// 可失败初始化器 init! 调用任然会是 返回可选类型对象,怎么隐式解包了? 看下面复习.
let person = Person(no: 0)
print(person) /// 打印结果为 nil
let person1 = Person() ///返回可选类型.


/**
 非可失败初始化器 init! 复习:
 */
///  🔗  ✅   非可失败初始化器调用 可失败初始化器-init!   需要进行解包.
class Person5 {

    var name : String

    /// 可失败初始化器 使用隐式解包 init! : 👆 的问题
    init!(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
    /// 非可失败初始化器.
    convenience init() { /// 要求返回不为nil 的对象, 所以这里 init!  这个会隐式解包.
        ///🔗  ✅  所谓的隐式解包 这里就不用 ! 来解包了. 危险⚠️ 也会 nil 闪退.
        self.init(name: "") /// ❌: hread 1: Fatal error: Unexpectedly found nil while unwrapping an Optional value
    }
}