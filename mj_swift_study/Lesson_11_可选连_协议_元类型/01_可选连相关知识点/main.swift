//
//  main.swift
//  01_可选连相关知识点
//
//  Created by whj on 2024/3/3.
//

import Foundation

/**
 Optional Chaining : 可选连.
 ps : 视频11讲 29分开始:
 */
print("可选连相关知识点")

class Car {var price = 0}

class Dog {var weight = 0}

class Person {
    var name : String = ""
    var dog : Dog = Dog()
    var car : Car? = Car()

    func age() -> Int { 18 }
    func eat() {
        print("Person eat")
    }
    subscript(index:Int) -> Int { index }

    ///如果结果本来是可选项,不会进行再次包装.
    func age_1() ->Int? { 20 }

    /// ✅  public typealias Void = ()
    func drink() -> Void { /// 返回空元祖. 也就是无返回值.
       print("Person drink")
    }
}

var person: Person? = Person()
/// 什么东西 能接受正常的值和nil 那就是 Optional 类型的.
var age = person?.age()  /// person 不为 nil,那么就继续调用 age() ,如果为nil 那么age = nil.

/**
 回顾下标调用:
 */
var p1 = Person()
var index = p1[1]

///可选类型的下标呢?
var index_1 = person?[1] /// 任然可选.下标本质是方法.
var index_2 = person![2] /// 强制解包就是 解包后的类型


func getName() -> String {
    print("---getName-----")
    return  "Jack"
}
///如果person 为nil,不会调用 getName的.
person?.name = getName()
person = nil
person?.name = getName()

///如果结果本来是可选项,不会进行再次包装.
person = Person()
let result = person?.age_1() ///不会再次包装成 Int??


/**
 一个细节: 如果我们想知道 一个 可选类型的 对象 有没有调用成功 怎么知道呢?
 per1?.eat() 怎么知道调用成功?
 */
var per1: Person? = Person()
per1?.eat() ///怎么知道调用成功?
/// ✅: 其实 swift 函数没有返回值 其实就是返回一个 Void , 看 drink 方法 和 Void 的定义.
var res = per1?.eat() /// 注意看 返回的类型 ()? 也就是包装了空元祖的 可选项.
/// 那么就可以利用这个返回 可选项Optional<()> 特性去判断调用成功没有, 如果 可选项结果为nil , 那就是说明 per1 为 nil,那么eat就没调用.

///可选项绑定😊
if let v = per1?.eat(){
    print("调用eat成功")
} else {
    print("调用eat失败")
}

/// 因为用不到 可选绑定的结果.那么就可以省略 _
if let _ = per1?.eat(){
    print("调用eat成功")
} else {
    print("调用eat失败")
}

if let age {  ///插播 📢 可选绑定居然也可以这么写.
    print(age)
}

///还可以对 有返回值的也可以 ,还能拿到值 完美
if let a = person?.age() {
    print("调用 age() 成功, age是\(a)")
}else {
    print("调用 age() 失败")
}

/// 所以 gard let 可否可选连 调用 如下测试:
func testRes(person:Person?)  {

    /// age()有返回值
    guard let b =  person?.age() else {
        print("失败了----")
        //break  ///(108, 9) 'break' is only allowed inside a loop, if, do, or switch
        return
    }
    print("guard age()---成功往下走----")
    print(b)

    ///无返回值的
    guard let p = person?.eat() else {
        print("eat 失败 ")
        return
    }
    print("guard eat() ---成功往下走----")
    print(p)
}
testRes(person: person)

/// 多个? 可以链接在一起 -多个可选连
/// 多个可选链中 任何一个节点为nil ,那么整个链就会调用失败.
var  price = person?.car?.price
var  weight = person?.dog.weight


/// 关于字典  -- 字典的 value 是个 数组.
var scores = [
    "Jack" : [86,82,84] ,
    "Rose" : [79,94,81]
]

/// ps 字典的key 拿到一个值 是个可选的. 万一key 不存在 返回是 nil .
var value = scores["Jack"] /// 看到类型推断是可选类型的.
/// 想要进一步访问: 可选连. 因为是可选类型, 所以返回肯定也是可选.
var x = scores["Jack"]?[0]

/// 所以如果前面的可选连为空 那么赋值就不会成功.
scores["Rose"]?[2] = 100


/**
 细节:📢 ✅
 以前有值,我想赋一个值覆盖原来的值 . 如果没有值 就不管了.
 */
 var num1: Int? = 5
/// num2 = 10 /// 这样可以赋值呀,
num1? = 10  /// 为什么 ❓  使用 num1? 带问号赋值呢
/***
 解释: 如果num1? 发现 num1 为 nil ,那么 后面的赋值就不成功. 如果有值 我就覆盖了.
 */
print(num1) ///Optional(10)

var num2 :Int? = nil
num2? = 10
print(num2) /// nil

/// key是String. value 是函数
var dict : [String: (Int,Int) -> Int] = [
    /// PS : (+) 是编译器 特性.
    "sum" : (+),  /// 语法🍬 糖. (+),编译器就根据上下文知道是 两个Int 相加. 下面也是一样. 相当于编译器写了一个相加函数.
    "difference":(-)
]
var f = dict["sum"]
var v = f?(10, 20) ///因为 拿到的value 是可选类型的 ,所以要调用可选链.
print(f) /// Optional((Function))

var dictResult = dict["sum"]?(10,20) /// 可选连 判断 就会包装为 可选类型结果.






