//
//  main.swift
//  20_函数式编程
//
//  Created by whj on 2023/9/6.
//

import Foundation

/// MARK: Currying （柯里化）
func add(_ a: Int ,_ b: Int) -> Int {
    a + b
}
/// 本来是接受2个参数的加法 ，现在转为一个一个的接受
func add2(_ a: Int) -> (Int) -> Int {

    return {
        print("a = \(a), $0 = \($0)")
        return $0 + a
     }
}

var fn = add2(3)

fn(10)

/// 三个参数的 加法呢
func add3(_ v: Int) -> (Int) -> (Int) -> Int   {
    return { v2 in
        return {
            $0 + v + v2
         }
    }
}
var fn3 = add3(10)
var fn3_ = fn3(10)
var fn3result = fn3_(10)
var fn3result_ = add3(10)(10)(10)
print(fn3result,fn3result_)


/// MARK:  函数合成 (一函数执行结果作为下一个函数的参数）