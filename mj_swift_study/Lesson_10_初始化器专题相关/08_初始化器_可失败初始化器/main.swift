//
//  main.swift
//  08_初始化器_可失败初始化器
//
//  Created by whj on 2024/3/1.
//

import Foundation

print("08-可失败初始化器")

/**
 类, 结构体,枚举,都可以使用 init? 定义可失败初始化器.
 什么是可失败初始化器? 调用 初始化方法,返回对象可能为空.
 */
 class Person {
     var name : String
     init?(name: String) {
         if name.isEmpty {
             return nil /// 正常的初始化器 是不能返回 空的. 
         }
         self.name = name
     }
 }

var p1 = Person(name: "")
var p2 = Person(name: "jack")
/// 从类型推断看 是个 Optional<Person> 的可选项类型.
print(p1) //nil
print(p2) //Optional(_8_初始化器_可失败初始化器.Person)

///之前接触的可失败初始化器:
var num = Int("123") //var num: Int?
/// 调用的就是一个可失败初始化器.
print(num) ///打印结果: Optional(123)


enum Answer : Int {
    case wrong, right
    //   0       1
}
/// 本来rawValue 只有 0 和 1  我瞎传入 100 . 就是个可失败的.
var an = Answer(rawValue: 100)
print(an)

/// 注意点:
/// 不允许同时定义参数标签,参数个数,参数类型相同的可失败初始化器 和 非可失败初始化器.
class Person1 {
    var name : String
    init?(name: String) {
        if name.isEmpty {
            return nil /// 正常的初始化器 是不能返回 空的.
        }
        self.name = name
    }
    /// 也就是不构成重载, ❌
//    init(name: String) {
//        self.name = name
//    }
}

print("----init!-----")
/// 可以用 init! 定义隐式解包的可失败初始化器.
class Person2 {
    var name : String
    /// 可以用 init! 定义隐式解包的可失败初始化器.
    /// 隐式解包是啥意思看下面下面👇
    init!(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}
var p1_1 = Person1(name: "")
var p1_2 = Person1(name: "rose")

var p2_1 = Person2(name: "")
var p2_2  = Person2(name: "jack")
/// 虽然是隐式解包,任然是可选类型
print(p2_1) /// nil
print(p2_2) /// Optional(_8_初始化器_可失败初始化器.Person2)
/// 暂时看 init! 和 init? 好像没区别,调用后都是 可选类型对象,也就是可能为 nil .
/***先知道 使用init! 和 init? 都可以定义可失败初始化器****/


///  🔗  ✅  可失败初始化器,可以调用非可失败初始化器,非可失败初始化器调用可失败初始化器需要进行解包.
class Person3 {
    var name : String
    ///使用init! 和 init? 都可以定义可失败初始化器
//    init?(name: String) {
//        self.init() ///❌主线不能相互调用.
//        if name.isEmpty {
//            return nil
//        }
//        self.name = name
//    }
    ///  没有便捷convenience 的时候报错: ❌ Designated initializer for 'Person3' cannot delegate (with 'self.init'); did you mean this to be a convenience initializer?
    convenience init?(name: String) {
        /// 可失败初始化器,包括 成功 或者 失败 两种.
        /// 🔗  ✅
        self.init() ///便捷初始化器中第一句需要调用 自己的指定初始化器
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
    /// 自己的指定初始化器.
    init() {
      self.name = ""
    }
}
var p3_1 = Person3() /// 有两个初始化器.


///  🔗  ✅   非可失败初始化器调用 可失败初始化器-init?  需要进行解包. ----不解包 就 矛盾. 解包就可能闪退.
class Person4 {
    
    var name : String

    /// 可失败初始化器
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
    /// 非可失败初始化器.
    convenience init() { //要求返回一个不为nil 的对象,所以要求解包.
        ///🔗  ✅  需要解包 加 ! 这样子, 但是这种强制解包风险大. 可能直接闪退.
        self.init(name: "")! ///❌: hread 1: Fatal error: Unexpectedly found nil while unwrapping an Optional value
    }
}

//var p4_1 = Person4()
//print(p4_1)

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

//var p5_1 = Person5()
//print(p5_1)


/// 如果初始化器 调用一个可失败的初始化器导致初始化失败,那么整个初始化过程都失败,并且之后的代码都停止执行.
class Person6 {

    var name : String
    /// 可失败
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
    /// 非可失败初始化器.
    convenience init?() {
        print("初始化执行前----")
        self.init(name: "") /// 比如这里调用失败了 , 后面的 代码都停止执行了.
        print("初始化执行后-成功----")
        self.name = "jack"
        //...后续初始化代码
    }
}
var p6_1 = Person6()


/// 可以用一个 非可失败初始化器 重写一个 可失败初始器 ,但反过来不可以.
class Person7 {
    var name : String

    /// 可失败初始化器
    init!(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}
class Student7 : Person7 {
    var no : Int

    override init(name:String){
        no = 0 //先初始化要自己的存储属性,再调用super的主线.
        super.init(name: name)
    }
}
//var stu7_1 = Student7(name: "") ///传空 任然会 Fatal Error .
var stu7_2 = Student7(name: "Rose")
print(stu7_2)


/// 反过来: 父类是非可失败,子类重写为 可失败 是不可以的.
class Person8 {
    var name : String

    /// 可失败初始化器
    init(name: String) {
        self.name = name
    }
}
class Student8 : Person8 {
    var no : Int

    override init?(name:String){ //❌ (221, 14) Failable initializer 'init(name:)' cannot override a non-failable initializer
        no = 0 //先初始化要自己的存储属性,再调用super的主线.
        super.init(name: name)
    }
}
