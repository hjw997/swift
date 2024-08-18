//
//  main.m
//  02_isa的细节
//
//  Created by whj on 2024/8/18.
//


#import <Foundation/Foundation.h>
#import <objc/runtime.h>


@interface Person : NSObject <NSCopying> {
@public
    int _age;
}
@property(nonatomic, assign) int height;

- (void)personMethod; /// 实例方法放-类对象

+ (void)personClassMethod;
@end

@implementation Person
- (void)personMethod {
}

+ (void)personClassMethod {
}
@end

/**
 源码下载地址:
 https://github.com/apple-oss-distributions/objc4/tags
 ISA_MASK 搜索:

 */

struct mj_objc_object {
    Class  isa ;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        NSObject *object = [[NSObject alloc] init];

        /// 获取类对象
        Class objectClass = [NSObject class];

        /**
         * Class 类对象是无法直接访问 isa 指针的
         * 可以点到 Class  查看 Class 的具体类型:
         * typedef struct objc_class *Class;
         * struct objc_object {
                    Class _Nonnull isa  OBJC_ISA_AVAILABILITY;
                };
           我们可以自己定义个 一样的结构体 强制转换拿出里面的值

         */

        struct mj_objc_object * mjObjectClass = ( __bridge  struct mj_objc_object *) objectClass;

        /// 可否拿到 通过 自己与运算 ?? 自己试试--还是 要用lldb 看课件:
        NSLog(@"0x%x", (unsigned int) (( unsigned  long) (mjObjectClass->isa) & 0x0000000ffffffff8ULL));

        /// runtime API 获取类对象.
        Class objectClass1 = object_getClass(object);



        /// 获取类对象的 元类对象
        Class objectMetaClass = object_getClass(objectClass);
        NSLog(@"是否是元类对象: %d %d",
                class_isMetaClass(objectClass),
                class_isMetaClass(objectMetaClass)
        );

        NSLog(@"%p %p %p",
                object,
                objectClass,
                objectClass1
        );



    }
    return 0;
}

/**
 lldb :
p object->isa
    
p(long)(object->isa)
 
 p/x p(long)(object->isa)
 */
