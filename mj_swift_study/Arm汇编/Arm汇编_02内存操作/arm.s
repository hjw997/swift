//
//  arm.s
//  Arm汇编_02内存操作
//
//  Created by whj on 2024/8/11.
//

.text
.global _test


_test:
//下面这种是操作寄存器:
;mov x1,#0x8
///我们软件开发不能局限操作寄存器 ,如何操作内存呢?

;ldr 指令:从内存中读取数据 放到寄存器
;ldr x0,内存  从哪个内存中读取放到寄存器x0 中.
;ldr x0,[x1] 找到寄存器x1中存储的地址值对应的内存, 读取里面的数据到 x0
//为了能让 x1中寸一个真实的地址 我们先写个 变量 ,然后读取 a的地址,在寄存器操作:
ldr x0,[x1]
ret

