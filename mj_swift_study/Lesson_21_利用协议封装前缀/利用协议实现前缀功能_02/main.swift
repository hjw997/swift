//
//  main.swift
//  利用协议实现前缀功能_02
//
//  Created by whj on 2024/2/20.
//

import Foundation

print("利用协议实现前缀功能---2")


/**
 继续封装 通用的前缀:
 */

struct MJ<Base> {
    private var base: Base

    init(_ base: Base) { //如果调用的是不想调用 base就用 _ 外部参数就可以省略
        self.base = base
    }
}

extension String {
    var mj: MJ<String> {
        MJ(self)
    }
}

extension MJ where Base == String {
    var numberCount: Int {
        var count = 0
        //此时这个self就是base,因为上面mj.时候扩展出来一个
        for c in base where ("0"..."9").contains(c) {
            count += 1
        }
        return count
    }
}

class Person {
    var name:String

    init(_ name: String) {
        self.name = name
    }

}
//给Person扩展一个前缀
extension Person {
    var mj:MJ<Person> { MJ(self)}
}
//给MJ添加属性方法,但是要只针对Person做限制
extension MJ where Base: Person {
    func speak() {
        //MJ内部能拿到Base,base 就是谁调用.mj 就是谁 .
        print("\(base.name) 在说话")
    }

    var job : String {
        "\(base.name) is Google Engineer"
    }
}

var person = Person("adam")
person.mj.speak()
print(person.mj.job)



print("123varaaa".mj.numberCount)


