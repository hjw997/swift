//
//  main.m
//  04_oc对象的分类
//
//  Created by whj on 2024/8/16.
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


int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSObject *object1 = [[NSObject alloc] init];
        NSObject *object2 = [[NSObject alloc] init];
        NSLog(@"%p %p", object1, object2); // 0x600001468040 0x600001468060

        ///Class 对象 --每个类在内存中有且只有一个 class 对象.
        Class cls1 = [object1 class];
        Class cls2 = [object2 class];
        Class objCls = [NSObject class];
        /// runtime API 获取对象的类对象:
        Class cls_1 = object_getClass(object1);
        Class cls_2 = object_getClass(object2);

        NSLog(@"%@ %@ %@ %@ %@",
                cls1,
                cls2,
                objCls ,
                cls_1,
                cls_2
        );


        /// PS:元类对象(meta-class) 和 类对象(class) 都是属于类对象. 所以都是 Class 类型的.
        // object_getClass(类对象) 还是同样的API 如果是类对象 那么就是 元类对象获取到的
        /// 获取元类对象的正确姿势: ⭐️⭐️⭐️⭐️⭐️
        Class objMetaClass = object_getClass([NSObject class]);

        Class c =  [[NSObject class] class]; ///这种无论多少次class 只会得到类对象 (class 对象)


        /// 当调用类方法时,通过 class 类对象找到 isa 找到 meta-class 最后调用 类方法.
        [Person personClassMethod];

    }
    return 0;
}

/**
 * 实例对象 instance 对象
* meta-data : 元数据: 描述数据的数据.
 * meta-class 类对象 描述类信息的数据
*/