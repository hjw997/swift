//
//  main.swift
//  03_指针的应用示例
//
//  Created by whj on 2024/8/5.
//

import Foundation

/// swift 中如果要使用 OC的 系统类,要导入 Foundation
let arr = NSArray(objects: 11,22,33,44)
/// OC   -> BOOL *
/// swift ->  UnsafeMutablePointer<ObjBool>
arr.enumerateObjects { element, index, pointer in
    //print(element,index)
    /** 成功打印:
        11 0
        22 1
        33 2
        44 3
     */

    /// *stop = YES
    if index == 2 {
        pointer.pointee = true
    }

    /// PS:误区 ⭐️⭐️⭐️⭐️⭐️ 不要以为 *stop 以后后面代码就不执行了.整个这一次的 block 代码块还是要执行完毕的.

}

/// swift 中如果想拿到 索引和value的循环 ⭐️⭐️⭐️⭐️⭐️ 推荐使用 arr.enumerated() 放到元祖返回
for (idx,element) in arr.enumerated() {
    print(idx,element)
    /**
        0 11
        1 22
        2 33
        3 44
     */
     /// 如果停止遍历:
     if idx == 2 { break } ///条件满足后就退出这个for循环了代码阅读性更好.⭐️⭐️⭐️⭐️⭐️
     print("后续代码----")
}


