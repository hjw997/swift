//
//  main.swift
//  04_初始化器_重写
//
//  Created by whj on 2024/2/27.
//

import Foundation

print("初始化器 涉及重写 ")

class Person {
    var age: Int

    init(age: Int) {
        self.age = age
    }

    /**
     父类的便捷初始化器 子类是调用不了的 , 只能自己类内部调用
     */
    convenience init() {
        self.init(age: 0)
    }
}
class Student : Person {
    var score : Int

    /// 重写要加 override
    override init(age: Int) {
        ///调用父类的指定初始化器前要先初始化自己
        self.score = 0
        super.init(age: age)
    }
}
class Student2 : Person {
    var score : Int

    init(age: Int, score: Int) {
        self.score = score
        super.init(age: age)
    }

    /// 父类的指定初始化器 可以重写为 便捷初始化器
    convenience override init(age: Int) {
        /// 便捷初始化器 可以调用自己的其他初始化器 但是最终要调用自己的指定初始器
        self.init(age: age, score: 0)
        ///定制自己的内容....
    }
}

///如果子类写了一个匹配 父类的便捷初始化器 的初始化器,不用override .
class Student3 : Person {
    ///  子类初始化器 恰巧 有个和父类便捷初始化器 同名的 , 是构成不了重写的.
    ///  因为 便捷初始化器是横向的,(也就是子类无法调用父类的便捷初始化器)
    init() {
       super.init(age: 10)
    }
}

