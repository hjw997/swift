//
//  main.m
//  02_对象内存窥探技巧
//
//  Created by whj on 2024/8/14.
//

#import <Foundation/Foundation.h>


@interface Student : NSObject {
@public
    int _no;
    int _age;
}
@end

@implementation Student

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student *stu = [[Student alloc] init];
        stu->_no = 4;
        stu->_age = 5;
        NSLog(@"%p",stu);
        
    }
    return 0;
}
