//
//  main.m
//  00_NSObject占用几个字节说起
//
//  Created by whj on 2024/8/14.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject
{
    int _age;
    int _no;
}
@end

@implementation Person

@end

/// OC 的对象,类主要是基于C\C++ 的数据结构 - 结构体来实现的.

/// clang -rewrite-objc main.m -o main.cpp  // 没有指定架构-生成 3.6M
/// 指定架构:
/// xcrun -sdk iphoneos  clang  -arch arm64 -rewrite-objc main.m -o main-arm64.cpp
/// 生成的文件 有 3万多行.
/// 搜索找到 NSObject :

/// Class 是个指针
/// typedef struct objc_class *Class;
/**
 * 我们可以使用typedef关键字为各种数据类型定义一个新名字(别名)。
    typedef int Integer;
    typedef unsigned int UInterger;

typedef struct objc_class *Class;
struct objc_object {
    Class _Nonnull isa __attribute__((deprecated));
};
 */

/// 一个 NSObject 的实现.就是个结构体-里面就存储这个一个指向结构体的指针. 
struct NSObject_IMPL {
    /// 指向一个结构体的指针. 一个指针,占用8个字节. ⭐️⭐️⭐️⭐️⭐️
    Class isa;
};

/**
 * 结构体 复习:
 * https://www.cnblogs.com/mjios/archive/2013/03/24/2977910.html
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSObject * obj = [[NSObject alloc] init];

        NSLog(@"hello---world -%p",obj);
    }
    return 0;
}
