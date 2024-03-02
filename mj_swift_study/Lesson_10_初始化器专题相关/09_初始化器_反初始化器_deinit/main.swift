//
//  main.swift
//  09_初始化器_反初始化器_deinit
//
//  Created by whj on 2024/3/1.
//

import Foundation

print("deinit----")

/**
 反初始化器 deinit . 类似 C++ 的析构函数  , OC 中的 dealloc 方法.
 当 类 的实例对象释放内存时,就会调用实例对象的 deinit 方法.
 ps: 注意是类 . 枚举 结构体 是没有的.
 */

class Person {
    deinit {
      print("Person 对象销毁")
    }
}
class Student : Person {
    var no : Int = 0
    deinit {
       print("Student 对象释放")
    }
}

/// PS  stu 指向别的对象,这个内存才释放. 或者 这个对象在函数中.
var stu:Student? = Student()
print(stu?.no)
stu = nil

print("-------test---------")
func test() {
    var stu = Student()
    print(stu)
}
test()
/**
    Student 对象释放
    Person 对象销毁
 */

/**
  deinit 不接受任何参数,不能写小括号,不能自行调用(系统调用) 包括不能super.deinit() 这样去调用  .
  子类的deinit实现 执行完毕后会调用父类的 deinit.

  和初始化器 一样 都是先搞定自己的事情 再去 父类的的.
 */
