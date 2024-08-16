//
//  main.m
//  03_更复杂的继承关系
//
//  Created by whj on 2024/8/16.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Person : NSObject
{
@public
    int _age;
}
@end

@implementation Person
@end


@interface Student : Person
{
@public
    int _no;
}
@end

@implementation Student
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Person * person = [[Person alloc]init];
        person->_age = 4;
        Student *student = [[Student alloc] init];
        student->_age = 10;
        student->_no = 5;
        NSLog(@"person=%@, student = %@",
                person,
                student
        );

        NSLog(@"%zd %zd %zd",
                class_getInstanceSize([NSObject class]), /// 8
                class_getInstanceSize([Person class]),  /// 16
                class_getInstanceSize([Student class])  /// 16
               );
    }
    return 0;
}
