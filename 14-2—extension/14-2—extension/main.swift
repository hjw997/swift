//
//  main.swift
//  14-2—extension
//
//  Created by whj on 2023/8/14.
//

import Foundation

struct  Person {
    var age : Int
    func run(_ v:Int) {print("func run",age,v)}
}

var fn1 = Person.run
var fn2 = fn1(Person(age: 10))
fn2(20)


autoreleasepool {
    let p = Person(age: 10)
    p.run(20)
}

//func sum(_ a:Int , _ b:Int) -> Int { a + b }
//
//var fn = sum
//fn(10, 20)

//protocol Runnable {
//    func run()
//}
//class Person {}
//
////遵守协议的扩展不允许加权限
//extension Person : Runnable {
//    func run() {
//
//    }
//}


//extension Int {
//    func repeats(task: () -> Void) {
//        for _ in 0..<self {
//            task()
//        }
//    }
//    //字面量是 没法用这个方法的 10.square()
//    mutating func square() -> Int {
//        self = self * self
//        return self
//    }
//
//    //在一个类型中嵌套另一个类型。
//    enum Kind {
//        case negative, zero, positive
//    }
//    // 扩展的只读属性。
//    var kind: Kind {
//        switch self {
//        case 0: return .zero
//        case let x where x > 0: return .positive
//        default:
//            return .negative
//        }
//    }
//    subscript(digitIndex:Int) -> Int  {
//        var decimalBase = 1
//        for _ in 0..<digitIndex { decimalBase * 10}
//        return (self/decimalBase) % 10
//    }
//
//}
//
//
//3.repeats {
//    print("3333")
//}
//var num = 10
//num.square()
//print(num)
//
//print(num.kind)
//
//
//protocol  TestProtocol {
//    func  test()
//}
//class TestPerson {
//    func test(){
//        print("TestPerson")
//    }
//}
//extension TestPerson : TestProtocol {
//}
//
//var p = TestPerson()
//p.test()
//
//func  isOdd(_ i:Int) -> Bool {
//    i % 2 != 0
//}

