//
//  main.swift
//  计算属性知识点补充
//
//  Created by whj on 2024/2/20.
//

import Foundation

print("补充回顾计算属性")

struct Circle {
    // 半径:存储属性
    var radius: Double

    // 计算属性: 本质是方法 ,计算属性后面 有个 {}
    var diameter: Double { /// 直径 通过 半径计算获得
        set {
            print("set方法调用---")
            radius = newValue / 2
        }
        get {
            print("get方法调用---")
            return radius * 2
        }
    } //计算属性 这里有个 大括号 .
    
    //计算属性 本质上就是 方法,相当于下面的setter 和 getter 的方法
    /**
     func setDiameter(newValeu:Double) {
         self.radius = newValue / 2
     }
     func getDiameter() -> Double {
         return radius * 2
     }
     */
 

}

var c = Circle(radius: 10)
print(c.radius)
print(c.diameter)
c.diameter = 40
print(c.radius)

struct Point {
    var x:Int
    ///只读计算属性,只有 get 没有set .
    var y:Int {
        get {
            x * 2
        }
    }
}

struct Point2 {
    var x:Int
    ///只读计算属性,只能用var . 不能用let ,因为计算属性的值可能是发生变化的. 
    var y:Int {
       /// 如果是只读计算属性,那么也可以省略 get
       x * 2
    }
}
/**
 定义计算属性只能用 var , 不能用let
 */
