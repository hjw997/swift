//
//  main.swift
//  06_协议_协议中定义初始化器init
//
//  Created by whj on 2024/3/4.
//

import Foundation

print("协议中定义初始化器---")

/**
 协议中 还可以定义初始化器 init
 非 final 类实现必须加上 required, 因为 final 修饰的类不可以被继承
 */
 protocol Drawable {
     init(x: Int, y: Int)
 }

///非 final修饰的 以后可以被继承-将来可能有子类
class Point: Drawable {
    required init(x: Int, y: Int) {
        print("非 final 类实现必须加上 required")
    }
}

/// final 修饰的就不能被继承 ,所以不用考虑子类的事了.
final class Size : Drawable{
    init(x: Int, y: Int) {
        print("子类----")
    }
}

/// 如果从协议实现的初始化器,刚好是重写了父类的指定初始化器.
/// 那么这个初始化必须同时加 required override.
protocol Livable {
    init(age:Int)
}
class Person {
    /// 刚好和协议中的一样.
    init(age: Int) {
    }
}

class Student: Person, Livable {
    var no : Int
    /// 初始化必须同时加 required override. 修饰符 不用管前后,  required 在前也可以.
    override required init(age: Int) {
        self.no = 10
        ///override 表示重写的是父类的, required 表示是协议中的.
        super.init(age: age)
    }
    //
//    required override init(age: Int) {
//        super.init(age: age)
//    }


    /// - Todo:  复习 看 初始化章节 的 required 修饰指定初始化器.

}


/// 指定初始化器 用required 修饰.  上面的复习:
class Person1 {
    /// 用 required 修饰指定初始化器,表明所有子类都必须实现该初始化器(通过继承 或者 重写实现)
    required init() {}
    init(age:Int) {}
}

class Student1 : Person1 {
    /// 如果子类重写了 required 初始化器,也必须加上 required, 不用加 override.
    required init() { ///此处的 required 表明就是重写了父类的 required指定初始化器了.
        super.init()
    }
}
