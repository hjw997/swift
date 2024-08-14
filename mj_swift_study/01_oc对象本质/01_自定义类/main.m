//
//  main.m
//  01_自定义类
//
//  Created by whj on 2024/8/14.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Student : NSObject {
@public
    int _no;
    int _age;
}
@end

@implementation Student

@end

/// 生成 CPP文件看看:
/// xcrun -sdk iphoneos  clang  -arch arm64 -rewrite-objc main.m -o main-arm64.cpp
/// 查找 Student 的实现类:
//struct Student_IMPL {
//    struct NSObject_IMPL NSObject_IVARS;
//    int _no;
//    int _age;
//};
//struct NSObject_IMPL {
//    Class isa;
//};
///Student 这个类 等价于 下面的结构体
struct Student_IMPL {
    Class isa;
    int _no;
    int _age;
};

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        Student *student = [[Student alloc] init];
        student->_age = 10;
        student->_no = 4;
        /// 将OC 指针 转为C语言指针 看看 看看如果 oc 对象 能赋值给 结构体指针.说明 OC 对象就是结构体.
        struct Student_IMPL *stuImpl = (__bridge struct Student_IMPL *) student;
        /// 通过APPCode 查看 内存结构
        NSLog(@"_no=%d _age=%d", stuImpl->_no, stuImpl->_age);
        NSLog(@"_no=%d _age=%d", stuImpl->_no, stuImpl->_age);


        /// 另一个方面验证 OC 对象的 本质是结构体.
        /// 获取实例对象占用内存的大小:
        /// 获取某个类的实例对象的大小:
        size_t nsobjectObjSize = class_getInstanceSize([NSObject class]);
        size_t stuObjSize = class_getInstanceSize([Student class]);
        NSLog(@"%zd %zd", nsobjectObjSize, stuObjSize); /// 8 16

        /// 创建的对象只存储对象的成员值.

    }
    return 0;
}
