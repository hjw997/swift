//
//  main.swift
//  02_初始化器_便捷初始化器
//
//  Created by whj on 2024/2/26.
//

import Foundation

print("初始化器相互调用规则")

class Size {
    var height:Int
    var width:Int
    //指定初始化器( 主要初始化流程) 原则就是对象创建后,成员属性要初始化.
    init(width:Int , height:Int){
        self.height = height
        self.width = width
        // ... 其他初始化代码
    }
    ///然后可以给外界提供几个便捷的初始化器,来创建对象.
    /**
      1.便捷初始化器,必须从相同的类里调用另一个初始化器.
      2.便捷初始化器最终必须调用一个指定初始化
     */
    convenience init(width:Int) {
        self.init(width: width, height: 0)
    }
    convenience init(height:Int) {
        self.init(width: 0, height: height)
    }
    convenience init() {
        self.init(width: 0, height: 0)
    }
}
var s1 = Size(width: 10, height: 20)
var s2 = Size(width: 0)
var s3 = Size(height: 10)
var s4 = Size()

/***
 便捷初始化器 只能 横向 调用 (被自己类中的其他便捷初始化器调用)

 */