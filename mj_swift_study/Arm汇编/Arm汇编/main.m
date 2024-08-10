//
//  main.m
//  Arm汇编
//
//  Created by whj on 2024/8/9.
//

#import <Foundation/Foundation.h>
#import "arm.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //test();
       
        int res1 = add(11, 10);
        int res2 = sub(10, 11);
        
        NSLog(@"%d",res1);
        NSLog(@"%d",res2);
    }
    return 0;
}
