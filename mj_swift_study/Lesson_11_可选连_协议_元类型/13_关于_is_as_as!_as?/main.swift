//
//  main.swift
//  13_关于_is_as_as!_as?
//
//  Created by whj on 2024/3/8.
//

import Foundation

print("查看本 target 下的文件夹下的 ppt截图")

/// is 用来判断 是否是 某种类型
/// as 用来做强制类型转换
///
/// as!  和 as? 都表示强制转换可能失败
/// as! 强制转换可能失败, 然后有一个隐式的强制解包.
/// as? 强制转换可能失败, 不会强制解包.


protocol Runnable {
    func  run()
}
class Person { }
class Student : Person , Runnable {
    func run() {
        print("Student run")
    }

    func study() {
        print("Student study")
    }
}
/// is 判断是否是某种类型
do {
    var stu:Any  = 10
    print(stu is Int)

    stu = "jack"
    print(stu is String)

    stu = Student()
    print(stu is Student)
    print(stu is Person)
    print(stu is Runnable)

}

/// 关于as
var stu : Any = 10
///❌ 'Any' is not convertible to 'Student'
///stu as Student

(stu as? Student)?.study()
/// as? 表示强制转换可能成功,也可能失败. 所以返回是可选类型.
let res = (stu as? Student)
res?.study()

/// as! 强制转换可能失败,但是转换后有一个隐式的强制解包
let res1 = (stu as! Student)
(stu as! Student).study()
/// 上面的等价==如下: 转换后有个强制解包.
(stu as? Student)!.study()
/// PS 只要是 强制解包都会有风险.
/// 比如 强制转换失败 为nil,你还要强制解包.那肯定会: fatal Error

/// as! 和 as? 表示不能 100% 转换成功
/// as 表示可以 100% 转换成功.
var data = [Any]()
data.append(Int("123")) ///⚠️:Expression implicitly coerced from 'Int?' to 'Any'
/// 确定 100% 可以转换的 ,也正好消除 编译器警告
data.append(Int("123") as Any)
print(data.count)

/// 确定 100% 转换成功.
var d = 10 as Double
print(d)
