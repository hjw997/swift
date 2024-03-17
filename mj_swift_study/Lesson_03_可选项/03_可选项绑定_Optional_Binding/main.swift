//
//  main.swift
//  03_可选项绑定_Optional_Binding
//
//  Created by whj on 2024/3/17.
//

import Foundation

print("可选项绑定--Optional-Binding")

/// 可以使用 可选绑定Optional-Binding  来判断 可选项是否包含值.
/// 如果包含就自动解包,把值赋给一个临时的常量(let) 或者变量(var) ,并返回true,否则返回false
var a = 10
var age:Int? = nil

if let number = Int("123") {
    /// number 的作用域 就只能在这大括号里面
    /// number 是强制解包之后的Int值.
    print("字符串转换整数成功:\(number)")
} else  {
    print("可选项绑定失败---字符串转Int 失败. ")
}

enum Season:Int {
    /// PS:这种在枚举后面申明类型(Season:Int)  然后枚举的成员这里 = 赋值 是原始值.
    case spring = 1 /// 如果是单行,这里不用 逗号 分开.
    case summer
    case autumn
    case winter
}
/// 枚举使用原始值rawValue 初始化的时候可能会失败.所以是可选的类型.
let s1 = Season(rawValue: 10)

/// 只要是可选项 都可以 使用 可选项绑定.
if let season = Season(rawValue: 6) {
    switch season {
    case .spring:
        print("春天")
    case .summer:
        print("夏天")
    case .autumn:
        print("秋天")
    case .winter:
        print("冬天")
    }
} else {
    print("可选绑定失败,没有这个值")
}



/// 两段等价代码:--可选绑定和多个条件同时满足的写法用 逗号 分开.




/// while 循环中使用可选项绑定.