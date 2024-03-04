//
//  main.swift
//  03_协议_协议中的属性
//
//  Created by whj on 2024/3/4.
//

import Foundation

print("协议中的属性")

protocol Drawable {
    func draw()
    
    /// 协议中的属性: 以下 x 和 y 是 协议中的属性
    /**
         协议中 对于 x 没有说是 计算属性,还是存储属性,  要求是 可以读取 可以写
     */
    var x:Int { get set }
    /// 协议的定义属性时必须用 var 关键字. 就算申明的是 只读,但是将来实现 也有可能使用存储属性实现.
    var y:Int { get } ///只要求只读
    
    subscript(index:Int) -> Int { get set } /// 要求可读可写.
}

/// 属性 的实现方式1:
class Person : Drawable {
    func draw() {
        print("draw func")
    }

    var x: Int = 0  /// 使用存储属性 满足可读,可写

    let y: Int = 0  /// 只读 存储属性, 协议申明中 只要求了只读 . let 就是只读,以后不能改.

    subscript(index: Int) -> Int {
        get {
            index
        }
        set {
            //print(newValue)
        }
    }
}

class Person1 : Drawable {
    func draw() {
        <#code#>
    }

    /// 使用计算属性: 实现了 get set 方法:-满足条件.
    var x: Int {
        get { 0 }
        set { }
    }

    /// PS:  只读计算属性,只能用var . 不能用let ,因为计算属性的值可能是发生变化的.
    /**
         定义 计算属性只能用 var , 不能用let
    */
    var y: Int  { 0 } /// 满足 最少 get的条件. 只读计算属性

    subscript(index: Int) -> Int {
        get {
            0
        }
        set {
            <#code#>
        }
    }
}

/// 总结:协议中的属性 没有 要求将来时 存储属性 还是 计算属性, 只要满足 可读 可写 就好.

/// 协议的定义属性时必须用 var 关键字.
///
/// 实现协议的属性权限要不小于协议中定义的属性权限. 比如 申明中 用了 get ,实现可以可读可写 也仅可读.
/// >>>  协议中定义 get set  , 实现用 var存储属性(可读可写)  或 get set 计算属性 去实现.
/// >>>  协议中定义的是 get , 实现: 用任何属性(计算属性,存储属性) 都可以去实现.