//
//  main.swift
//  10_协议_CaseIterable
//
//  Created by whj on 2024/3/7.
//

import Foundation

print("CaseIterable---枚举可遍历")

enum Season : CaseIterable {
    case spring , summer , autumn , winter
}

/// 类型 只读计算属性.
var allSeasons = Season.allCases
print(allSeasons)
/// 等价于 [Season.spring,Season.summer,Season.autumn,Season.winter]
/// 帮你把 枚举成员值 放到数组中.

for season in allSeasons {
    print(season)
}

