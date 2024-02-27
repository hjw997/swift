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
        ///self.test() ///❌: self' used in method call 'test' before all stored properties are initialized
        /**
            var fn = { /// ❌'self' captured by a closure before all members were initialized
                    self.age
                }
        */


        self.age = age
        /*********第一阶段完成 :一直到最顶层的存储属性都初始化完了, 初始化了所有的存储属性 ✅ **********/
        ///可以使用self ✅
        self.test()
        var fn = {
            self.test()
        }
    }

    convenience init() { ///便捷初始化器必须从相同的类里调用一个初始化器.
        self.init(age: 0)
    }

    func test() { }
}

class Student : Person {
    var score:Int

    ///有继承关系时候的规则:
    /// 1.指定初始化器必须从它的直系父类调用指定初始化器.
    init(age: Int, score: Int) {
        /// 先要搞定自己的初始化值
        self.score = score

        super.init(age: age) /// 1.指定初始化器必须从它的直系父类调用指定初始化器.
        /*********第一阶段完成 : 调用完父类的指定初始化器以后  ✅ **********/
        ///父类初始化完毕后 可以做自己的其他初始化工作
        /// .... 其他个性化初始化代码
    }

    convenience init() {

        ///super.init() //不可以调用父类的便捷初始化器.
        /// 2.便捷初始化器必须从相同的类中调用另一个初始化器.
        /// 3.便捷初始化器 最终必须调用一个指定初始化器. (第一行就必须调用) 调用完才能使用self.
        ///  self.score = 0 //❌ 此时self 还没初始好.
        self.init(age: 0, score: 0)
        /*********第一阶段完成 : 便捷初始化器 调用完自己的指定初始化器 **********/
        ///可以使用self(访问,修改它的属性,调用它的实例方法等)
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


/***
 两段式初始化:
 第一阶段.初始化所有的存储属性. 从下往上 ( 从子类到父类 )
    此时 self 都是不安全的 只有 第一段完成后 才能 使用self 调用 self.xxx()
 第二阶段:设置新的存储属性值.(从顶部往下)
    初始化器此时可以使用self(访问,修改它的属性,调用它的实例方法等)
 */


