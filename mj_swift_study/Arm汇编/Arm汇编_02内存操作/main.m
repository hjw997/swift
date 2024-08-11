//
//  main.m
//  Arm汇编_02内存操作
//
//  Created by whj on 2024/8/11.
//

#import <Foundation/Foundation.h>
#import "arm.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /// int a 占几个字节? 4个字节哦
        /// NSLog(@"size of a = %d", sizeof(a)); // size of a = 4
        int a = 10;
        NSLog(@"a的地址:%p",&a);
        test();
        
        NSLog(@"Hello, World!%d",a);
    }
    return 0;
}

/**
 * 内存操作有 一点 寻找内存地址 也就是 寻址方式. 找到内存,操作内存 . ⭐️⭐️⭐️⭐️⭐️
 */

/**
 load : 从内中装数据:
    ldr ldur
 */
