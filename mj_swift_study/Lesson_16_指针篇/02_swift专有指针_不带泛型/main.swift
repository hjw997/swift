//
//  main.swift
//  02_swift专有指针_不带泛型
//
//  Created by whj on 2024/8/5.
//

/**
 不带泛型的指针的使用.
 */
import Foundation

var age = 10
func test1(_ ptr:UnsafeRawPointer) { /// const void *
    /// 因为ptr指针指向的不知道内存占用几个字节,所以要告诉它读取几个字节.
    // ptr.load(as: <#T##T.Type##T.Type#>)
    /// 告诉它取出来的是个Int 类型的. 
    let value = ptr.load(as: Int.self)
    print("test1 load-value =",value)
}

func test2(_ ptr: UnsafeMutableRawPointer) { /// void *
    /// 可以改的,因为不知道自己可以改多少个字节,要告诉它.
    /// 告诉它 将30 存储到指定的内存中,类型是Int类型的.
    /// ⭐️⭐️⭐️⭐️⭐️
    /// as 后告诉后什么类型后,前面的of 就的是什么类型的数据.
    ptr.storeBytes(of: 30, as: Int.self)
}
test1(&age)
test2(&age)
print(age)
/**打印结果:
test1 load-value = 10
30
 */
