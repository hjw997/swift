//
//  main.swift
//  利用协议实现前缀功能_03
//
//  Created by whj on 2024/2/20.
//

import Foundation

print("利用协议实现前缀功能-03-继续封装")

/**
 通过前面两个实战思路给 String 和 Person 扩展前缀属性和功能.
 代码有很多改进的点: 就是每个 类 都要去写 mj 扩展的方法,能不能写一个协议, 遵守协议就有这个功能呢?
 
 */

struct MJ<Base>{
    private  var base:Base
    init(_ base: Base) {
        self.base = base
    }
}

protocol MJCompitiable {}
