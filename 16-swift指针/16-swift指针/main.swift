//
//  main.swift
//  16-swift指针
//
//  Created by whj on 2023/8/29.
//

import Foundation

///  查看 内存结构：Int 10  和 Double 10.0
var age = 10
var age2 = Double(age)

var agePtr = withUnsafePointer(to: &age) { UnsafeRawPointer($0) }
var age2Ptr =  withUnsafePointer(to: &age2) { UnsafeRawPointer($0) }

print(agePtr)
print(age2Ptr)
///// 指针的转换：
//var ptr = UnsafeMutableRawPointer.allocate(byteCount: 16, alignment: 1)
//
//
//ptr.assumingMemoryBound(to: Int.self).pointee = 11
//
///// 给后8个字节赋值
//(ptr+8).assumingMemoryBound(to: Double.self).pointee = 22.0
//
///// 转为泛型指针，假象 指针是什么类型：
//var ptr2 = ptr.assumingMemoryBound(to: Int.self)
//
///// 转为泛型后就知道怎么操作了。可以使用 pointee 了。
//ptr2.pointee = 5 //给 前8个字节赋值。
//
///// 通过 指针 ＋ 方式 ，偏移指针
//(ptr2+1).pointee = 10
//
///// 通过数组下标，注意下标直接操作。不用pointee 了
//var p3 = ptr2[1]
//ptr2[1] = 15
//
//print(ptr)



//var ptr = UnsafeMutablePointer<Int>.allocate(capacity: 2)
////ptr.pointee = 10 // 初始化 前8 个字节。
////ptr.initialize(repeating: 10, count: 2) //初始化连续的 2 个 8字节，用值 10 。
//ptr.initialize(to: 10) //单个初始化 8 个字节。
//ptr.successor().initialize(to: 11)
//print(ptr)
//class Person {
//    var age:Int
//    init(age:Int){
//        self.age = age
//    }
//}
//var person = Person(age: 20)
//
////ptr 就是个指针。void * 类型
//var ptr = withUnsafePointer(to: &person) { UnsafeRawPointer($0) }
//
//var address = ptr.load(as: UInt.self)
//print(address)
//var rawPointer = UnsafeMutableRawPointer(bitPattern: address)
//print(rawPointer)

/**打印结果：
 105553158567552
 Optional(0x0000600002857680)
 */


func testCode(){
    //var age = 10
//
///// 获取变量的指针：获取指向 age 的指针 有两个函数：
//// withUnsafePointer(to: &age, <#T##body: (UnsafePointer<T>) throws -> Result##(Swift.UnsafePointer<T>) throws -> Result#>)
/////  body  这个block回调看起来 不知是什么。
/////  暂时先用 $0
//var ptr = withUnsafePointer(to: &age) { $0 }
//print("ptr is :",ptr)
///// 看出ptr 是个 指针。
//print(ptr.pointee)
//
////想要b修改 使用 MutablePointer
//var ptr2 = withUnsafeMutablePointer(to: &age) { $0 }
//print("ptr2 is :",ptr2)
//ptr2.pointee = 30
//print(ptr2.pointee)
//
//
//
//
//
//// $0 是什么? pointer 参数就是 指向 age的 指针，给到闭包表达式，闭包表达式返回什么，那么函数就返回什么。
//var prt3 = withUnsafePointer(to: &age) { (pointer: UnsafePointer<Int>) -> UnsafePointer<Int> in
//   return  pointer
//}
//
////模仿底层怎么写？内部调用闭包，参数1to 传给闭包body(to)。闭包返回什么，那么函数就返回什么类型
//func withUnsafePointer<T,Result>(to: UnsafePointer<T>, body:(UnsafePointer<T>)-> Result)  -> Result {
//    return body(to)
//}

//class  Person {
//    var name = "h"
//    var age = 5
//}
//var person = Person()
//var ptrPerson = withUnsafePointer(to: &person) { $0 }
//print("ptrPerson 指针：",ptrPerson) //拿到Person对象的指针。 0x00000001000081e0


///  如何获取 UnsafeRawPointer 也就是 void *
    var age = 20

    var ptr = withUnsafePointer(to: &age) {
        print($0)
        return UnsafeRawPointer($0)
    }

    print(ptr)

    //UnsafeMutableRawPointer(bi)



//UnsafeMutableRawPointer(bitPattern: <#T##Int##Swift.Int#>)

//var arr = NSArray(objects: 11, 22, 33, 44)
//
//arr.enumerateObjects { element, index, stop in
//    print(element,index,stop) /// stop 是 swift 中的指针 UnsafeMutablePointer ，所以可以修改。
//    if index == 2 {
//        stop.pointee = true
//    }
//}



}