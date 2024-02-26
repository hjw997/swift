//
//  main.swift
//  01_初始化器_init
//
//  Created by whj on 2024/2/26.
//

import Foundation

/**
 初始化器: 从第10讲 汇编分析多态原理的 45分钟开始.
 */

print("swift")
print("swift中类的初始化器")


/**
 swift 中的的初始化器:
 1 . 指定初始化器  designated initializer
 UK/ˈdez.ɪɡ.neɪt/ US/ˈdez.ɪɡ.neɪt/
 to choose someone officially to do a particular job
  指定初始化器:
  init(构造参数){
  }
  init(){} //编译器自动生成的无参的构造

   一个类最少有一个指定初始化器. (原则就是为了安全)

 2.便捷初始化器 convenience initializer
    convenience init(xxx) {}
    便捷初始化器可以提供多给给外界.
 */

class Size {

    var width:Int = 0
    var height:Int = 0
    //编译器自动生成的默认初始化器就是指定初始化器.
    /**
     类偏向少量的指定初始化器,一个类通常只有一个指定初始化器.
     */
    init(){}

    //自己定义了 指定初始化器 后 编译器就不会再自动生成无参的指定初始化器了.
//    init(width:Int,height:Int) {
//        self.width = width
//        self.height = height
//    }

    convenience init(width:Int,height:Int) {
        //生成的便捷初始器 不会影响指定初始化器
        //便捷初始化器 第一句要先调用 指定初始化器.
        self.init()
        self.width = width
        self.height = height
    }

}
var s = Size(width: <#T##Int##Swift.Int#>, height: <#T##Int##Swift.Int#>)
