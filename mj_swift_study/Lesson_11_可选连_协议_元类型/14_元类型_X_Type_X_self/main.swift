//
//  main.swift
//  14_元类型_X_Type_X_self
//
//  Created by whj on 2024/3/8.
//


import Foundation

print("元类型知识点:")
class Person {

}
class Student : Person { }
let person = Person()

/**
 Person.self 是 Person 对象的 前 8 个字节,指向 元类型的指针.
 元类型中存储着 类的各种信息.
 Person.self 是   Person.Type 类型.

 X.self 是一个元类型(metadata) 的指针, metadata 存放着类型相关的信息
 X.self 属于 X.Type 类型.
 */
var  pType = Person.self

var stuType = Student.self

/// 如果存在继承关系 父类指针 可以指向子类对象
pType = Student.self

/**
 AnyObject 是任意类. 所以 AnyObject.Type 类型 可以是 任何元类型 X.self .
 */
var anyType : AnyObject.Type = Person.self
anyType = Student.self
class Dog { }
anyType = Dog.self


/**
 PS : AnObject 和 AnyObject.Type 是两回事
 就  像 Person 和 Person.Type 一样:
 */
func typeTest() {

    var p1: Person  = Person()
    var p2 : AnyObject = Person()

    var pType1:Person.Type = Person.self
    var pType2:AnyObject.Type = Person.self

}

/**
在 swift 中 定义的 AnyClass :

public typealias AnyObject
public typealias AnyClass = AnyObject.Type

 */

/// 所以 AnyClass 可以接受任何的元类型 (任何类对象)
var anyType1 : AnyClass = Person.self
anyType = Student.self
anyType = Dog.self



/**
 swift 自带的一个函数 可以获取到元类型(Metatype):
 public func type<T, Metatype>(of value: T) -> Metatype
 这个函数的作用:
 接收一个实例,返回这个实例的运行时的真实类型 是什么 .
 如果 传入一个Person对象实例,那么返回就是 Person.self
 补充: type(of: person) 并不是函数, 从汇编角度看并没有 call xxx函数 , 而是 拿到 对象的前8个字节 出来.
 那么对象的 前8 个字节不就是 元类型对象么.
 */
//  typeOfPerson 就是8 个字节 type(of:person) 底层实现,就是直接取出了 传入对象的 前8个字节.
var typeOfPerson = type(of: person)
print(typeOfPerson) //Person
// 所以:
print(Person.self == type(of: person)) //true


/**
 元类型的 一个应用场景:
 */
 class Animal {
     required init(){}
 }
//父类的required 初始化器,如果子类不写就继承过来了.
class Cat : Animal { }
class Sheep: Animal { }
class Fish: Animal { }

func create(_ clses: [Animal.Type]) -> [Animal] {
    var arr = [Animal]()
    for cls in clses {
        //Animal中必须是required 的初始化器 才能保证 所有子类 才能正常初始化.
        arr.append(cls.init()) ///⚠️ 使用 元类型 创建对象,必须是 required 的初始化器. 就像java反射 cls.newInstance() 调用无参构造一个道理
    }
    return arr
}
print(create([Cat.self,Sheep.self,Fish.self])) //[元类型.Cat, 元类型.Sheep, 元类型.Fish]


//应用场景2 纯swift 也就是没有继承 NSObject 的类,也是支持 runtime的 api
class Teacher{
    var age : Int = 0
}
/**
 class_getInstanceSize(<#T##cls: AnyClass?##Swift.AnyClass?#>)
 */
 /**
 class_getInstanceSize(AnyClass) 表示创建这个类型的对象,最少保证要占用多少个字节才能存放下这个对象
  */
print( class_getInstanceSize(Teacher.self)) //24 : 为何24 , 前8个是元类型指针,8 个是引用计数相关,8 个是 age 占用8 个字节.

/**
 swift 官方文档 说 如果没有继承自NSObject的类在swift中就自动变为基类.
 */

//swift 底层有个隐藏的基类 Swfit._SwiftObject ,新版本 变了: _TtCs12_SwiftObject
print(class_getSuperclass(Teacher.self)!)


/// 大写的Self是什么? 类似 OC中的 返回值 必须是当前类 的类型 instanceType
/// 用元类型创建对象,初始化器 必须是 required 的初始化器
/// required 是用在类中.

protocol Runnable {
    ///谁实现这个协议方法 就必须返回 当前类型.
    func testRun() -> Self

    func testRun(s:Self)
}
class GoodPerson : Runnable {
    required init(){}
    func testRun() -> Self {
        //return GoodPerson()  //不能直接这么写,因为 这么写写死了,子类 返回就 不是 子类了.
        /**
         动态的获取 当前自己的真实类型 想到 type(of) 拿到当前对象的 真实类对象
         但是 类对象 来创建对象,初始化器必须是 required init 的.
         */
        var res = type(of: self).init()
        return res
    }

    func testRun(s: GoodPerson) {

    }
}
class GoodStudent : GoodPerson {
    override func testRun(s: GoodPerson) {
        super.testRun(s: s)
        print("-----")
    }
}
var gp = GoodPerson()
print(gp.testRun())

gp.testRun(s: gp)


