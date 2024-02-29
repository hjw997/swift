//
//  main.swift
//  07_初始化器_属性观察器
//
//  Created by whj on 2024/3/1.
//

import Foundation

print("07_初始化器_属性观察器")
/***
 父类的属性在它自己的初始化器中赋值不会触发属性观察器,但在子类的初始化器中赋值会触发属性观察器.
 */
 class Person {
     var age: Int {
         willSet {
             print("willSet",newValue)
         }
         didSet {
             print("didSet",oldValue,age)
         }
     }
     init() {
         self.age = 0
     }
 }

var p = Person()

class Student : Person {
    override init() {
        super.init()
        print("after---")
        /// 子类的初始化器中赋值,会触发属性观察器.
        self.age = 1
    }
}

var stu = Student()
