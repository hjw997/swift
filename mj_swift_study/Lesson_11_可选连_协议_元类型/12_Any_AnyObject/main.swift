//
//  main.swift
//  12_Any_AnyObject
//
//  Created by whj on 2024/3/8.
//
import Foundation
/**
 swift 中提供了2中特殊的类型 Any AnyObject
 Any : 可以代表任意类型(枚举,结构体,类,也包括函数类型)
 AnyObject : 可以代表任意 类 类型(在协议后面写上:AnyObject 代表只有类能遵守这个协议).
   PS:在协议后面写上: class 也代表只有类能遵守这个协议.
 */

print("Any 和 AnyObject 的讲解")

protocol Runnable { } //任何类型可以遵守

protocol Eatable : AnyObject {} //只有 类 类型的 才能遵守这个协议
class Person : Runnable , Eatable { //✅ 类类型可以遵守

}
struct Size : Runnable {//struct Size : Runnable , Eatable { //❌ Non-class type 'Size.Size' cannot conform to class protocol 'Eatable'
}

/**
 Any 是什么 ?
 AnyObject 是什么?
 两种特殊的类型
 */
class  Student {}
var stu : Any = 10
stu = "jack"
stu  = Student()


var stu2:AnyObject = Student()
//stu2:AnyObject = 10 //❌只能是任意的 类 类型
//stu2 = "jack"
stu2 = Person() //任意的类类型 OK ✅

/// Any 类型的数组,可以放任何类型的数据
var data0 = Array<Any>() //创建一个 能装 Any 类型的数组
var dict = [Int : Int ]()  //字典 语法糖形式
var data = [Any]() //语法糖形式
data.append(1)
data.append("jack")
data.append(3.14)
data.append({10}) // 装函数 也可以
var  x = {10}
