//
//  main.swift
//  06_初始化器_required
//
//  Created by whj on 2024/2/28.
//

import Foundation

/**
 用 required 修饰 指定初始化器 ,表明其所有子类都必须实现该初始化器(通过继承 或者 重写实现)
 ps:只针对 指定初始化器. 便捷初始化器不考虑.
 */

class Person {
    /// 要求我以后的子类,都必须有这个指定初始化器,加 required 修饰.
    required init() {

    }
    init(age:Int){ }

}
class Student1 : Person {
    /// 如果子类没有自定义任何指定初始化器,它会自动继承父类所有的 指定初始化器.
}

var stu1 = Student1() /// 发现继承了父类的所有指定初始化器.

class Student2 : Person {
    /// 如果自定义了指定初始化器,那么父类的指定初始化器就不能自动继承了. 有自己主线了.
    init(no:Int) {
       super.init()
    }

    /// 因为自己有了指定初始器, 此时父类中指定的 required 的指定初始化器 子类必须实现.
    /// 如果子类重写了 required 初始化器,也必须加上required,因为是重写 可以不用加 override .
    required override init() {
        //fatalError("init() has not been implemented")
        super.init()
    }

}

/// required 的使用场景: 子类中也必须要有 某个指定的初始化器,那么就加 required 修饰.



