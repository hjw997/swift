//
//  main.m
//  01_判断类对象类型
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



int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        NSObject *object = [[NSObject alloc] init];

        /// 获取类对象
        Class objectClass = [NSObject class];
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
