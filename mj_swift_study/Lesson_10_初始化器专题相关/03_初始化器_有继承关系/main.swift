//
//  main.swift
//  03_初始化器_有继承关系
//
//  Created by whj on 2024/2/26.
//

import Foundation

print("有继承的初始化器 ")

class Person {
    var age: Int

    init(age: Int) {
        self.age = age
    }

    convenience init() { ///便捷初始化器必须从相同的类里调用一个初始化器.
        self.init(age: 0)
    }
}

class Student : Person {
    var score:Int

    ///有继承关系时候的规则:
    /// 1.指定初始化器必须从它的直系父类调用指定初始化器.
    ///
    ///
    ///
    init(age: Int, score: Int) {
        /// 先要搞定自己的初始化值
        self.score = score

        super.init(age: age) /// 1.指定初始化器必须从它的直系父类调用指定初始化器.
        ///父类初始化完毕后 可以做自己的其他初始化工作
        /// .... 其他初始化代码
    }

    convenience init() {

        ///super.init() //不可以调用父类的便捷初始化器.
        /// 2.便捷初始化器必须从相同的类中调用另一个初始化器.
        /// 3.便捷初始化器 最终必须调用一个指定初始化器. (第一行就必须调用) 调用完才能使用self.
        ///  self.score = 0 //❌ 此时self 还没初始好.
        self.init(age: 0, score: 0)

        self.score = 0

    }

    init(score:Int){
        ///指定初始化器不能调用自己的另一个指定初始化器, 一个主流程 不能包含另一个主流程
        //self.init(age: 0, score: score)

        ///指定初始化器,必须从它的直系父类调用指定的初始化器.
        self.score = score  ///  但是要先初始化自己.
        super.init(age: 0)  ///  直系父类的指定
    }
}



