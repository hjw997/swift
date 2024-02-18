//
//  main.swift
//  利用协议实现前缀_02
//
//  Created by whj on 2024/2/19.
//

import Foundation

/**
 继续封装 通用的前缀:
 */

struct MJ<Base>{
   private var base:Base
    init(_ base: Base) { //如果调用的是不想调用 base就用 _ 外部参数就可以省略
        self.base = base
    }
}

extension String {
    var mj:MJ<String> { MJ(self)}
}
extension MJ where Base == String {
    var numberCount : Int {
        10
    }
}

print("123varaaa".mj.numberCount)


