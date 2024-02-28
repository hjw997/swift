//
//  main.swift
//  05_初始化器_自动继承
//
//  Created by whj on 2024/2/27.
//

import Foundation

print("自动继承")

/**
 如果子类没有定义 任何 指定初始化器,它会自动继承父类所有的指定初始化器.
 */

class Person {
    var age: Int
    var name: String

    /**
       指定初始化器
     */
    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }

    /**
     指定初始化器
     */
    init(age: Int) {
        self.age = age
        self.name = " -- "
    }

    /**
     便捷初始化器
     */
    convenience init() {
        print("Person----便捷初始化器init()")
        self.init(age: 10)
    }
    /**
      便捷初始化器
     */
    convenience init(name:String) {
        ///调用初始化器时候要self.init的方式调用
        ///init(age:10)
        self.init(age: 10)  ///便捷初始化器中最终一定要走主线.(也就是指定初始化器)
    }

}
/// 自动继承
class Student : Person {
   /** 自动继承规则:
     1. 如果子类没有自定义任何的指定初始化器,他会自动继承父类所有的指定初始化器.
     2. 如果子类提供了父类所有的指定初始化器的实现(要么通过方式1继承,要么重写)
        >> 那么子类自动继承所有的父类便捷初始化器.
    */
}

///下面的stu 为何??? 会打印:   print("Person----便捷初始化器init()") 第二个规则.
let stu = Student()
let stu1 = Student(name: "apple") ///第二个规则.

///再比如自己 自定义一个指定初始化器 那么就不会自动继承父类的所有指定初始化器和便捷初始化器
class Student2 : Person {
    init(no:Float) {
        ///自己的指定初始化器一定要调用 父类的 某个指定初始器.
        super.init(age: 0)
    }
    ///也没有重写全部的父类的指定初始化器,那么便捷初始化器也是没有继承下来的.
}
///然后发现 Student2 只有自己的指定初始化器了,不会自动继承
let  stu2 = Student2(no: 10.0) //swift 基本数据类型 Float 30.0

///3 .重写了父类的所有指定初始化器
class Student3 : Person {
    override init(age: Int) {
        super.init(age: age)
    }

    override init(age: Int, name: String) {
        super.init(age: age, name: name)
    }
}
///重写了父类的所有指定初始化器, 规则2. 那么便捷初始化器也可以用.
let stu3 = Student3()


/// 如果把父类的指定初始化器重写为自己的便捷初始化器
class Student4 : Person {

    init(no:Int){
        super.init(age: 0)
    }

    /**
     规则 2. 如果子类提供了父类所有的指定初始化器的实现
            这个实现可以是:(要么通过方式1继承,要么重写(重写就包括可以写为 指定初始化器 和 便捷初始化器 )
        >> 那么子类自动继承所有的父类便捷初始化器.
     */

    /// 子类以便捷的形式提供父类所有指定初始化器. 也满足上面的规则. ---> 那么子类自动继承所有的父类便捷初始化器.
    convenience override init(age: Int) {
       self.init(no: 100)
    }
    convenience override  init(age: Int, name: String) {
        self.init(age: 101)
    }
    ///PS: 在重写的章节中学习了 子类是可以重写父类的指定初始化器为自己的便捷初始化器.
}
let stu4 = Student4(name: "") //所以 Student4 所有的父类的便捷初始化器也会继承.

/// 就算子类添加了更多的便捷初始化器,上面的规则任然适用.
class Student5 : Person {
   /// 就算子类添加了更多的便捷初始化器,自己不定义任何 指定初始化器 ,那么就会自动继承 父类的所有指定初始化器.
   convenience init(no:Int){
       self.init()
   }
    /// 只自定义 便捷初始化器,不影响规则.
}

let stu5 = Student5()



class Person1 {
    var age: Int
    var name: String

    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }
    init() {
        self.age = 0
        self.name = ""
    }
    convenience init(name:String) {
        ///调用初始化器时候要self.init的方式调用
        self.init()
    }
}

class Student6 : Person1 {
    var no : Int = 0

    /// 只要没有提供父类的所有的指定初始化器,就不满足规则2
    override init() { /// 因为自己有自己的主线了. 就不在有父类继承下来的主线.
        super.init()
    }

    convenience init(no:Int){
        self.init()
    }


}
let stu6 = Student6() /// 此时就不能继承父类的指定和所有便捷了.



