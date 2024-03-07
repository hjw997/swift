//
//  main.swift
//  08_协议_协议可以继承
//
//  Created by whj on 2024/3/7.
//

import Foundation

print("协议可以继承")

protocol Runnable {
    func run()
}

/// 一个协议可以去继承另一个协议 (或者说遵守另一个协议)
protocol Livable : Runnable {
    func breath()
}

class Person : Livable {
    /// 实现方法都要去实现.
    func breath() { }

    func run() { }
}

