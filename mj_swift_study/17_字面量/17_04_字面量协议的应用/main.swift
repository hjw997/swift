//
//  main.swift
//  17_04_字面量协议的应用
//
//  Created by whj on 2024/8/9.
//

import Foundation

/// 假设有个点:
struct Point {
    var x = 0.0
    var y = 0.0
}

/// 想通过数组 和 字典的方式 字面量形式去创建:
// var p: Point = [10.5, 20.5]

/// 实现字面量协议 数组 和 字典构造的

extension Point: ExpressibleByArrayLiteral , ExpressibleByDictionaryLiteral {
    /// 可变参数 ...
    init(arrayLiteral elements: Double...){
        guard elements.count > 0 else { return }
        self.x = elements[0]
        guard elements.count > 1 else { return }
        self.y = elements[0]
    }

    /// 字典的可变参数: (String, Double)...
    init(dictionaryLiteral elements: (String, Double)...) {
        for(key,value) in elements {
            if key == "x" { self.x = value}
            else if key == "y" {self.y = value}
        }
    }
}
/// 如果这里不写类型 会被编辑器 当做是 Double 的数组类型
var p:Point = [10.5,20.5]
print(p)

p = ["x":100.5,"y":0.8]
print(p)

/**
Point(x: 10.5, y: 10.5)
Point(x: 100.5, y: 0.8)
 */
