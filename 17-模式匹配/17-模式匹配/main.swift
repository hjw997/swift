//
//  main.swift
//  17-模式匹配
//
//  Created by whj on 2023/9/1.
//
//

import Foundation

print("Hello, World!")

var age = 2
/// 需求判断 age 在 0-9

/// 原来的写法：
if age >= 0 && age <= 9 {
    print("age in [0,9]")
}

/// 枚举 Case 模式：
if case 0...9 = age {
    print("case: [0,9]")
}





extension Int : ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        if value == true {self = 1 } else {self = 0}
    }
    public typealias BooleanLiteralType = Bool

}

var num: Int = true
print(num)






