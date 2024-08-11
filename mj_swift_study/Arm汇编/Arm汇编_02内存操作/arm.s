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


//3.ldr指令,从内存中读取数据
//加了!表示: x1+0x4 作为操作数的地址, 从该地址读取4个字节 放到w0寄存器(x是读64位,8字节)
//          然后 x1 = x1+0x4
ldr w0,[x1,0x4]!

//2.ldr 指令 基地址寻址 (在基地址附近去读取内存数据)
//x1+0x4 的结果当做一个地址值,从这个地址开始取读取 4字节到 w0.(因为是w 32位寄存器,如果x是64位8字节)
ldr w0,[x1,#0x4]

///1. ldr 指令
;ldr 指令:从内存中读取数据 放到寄存器
;ldr x0,内存  从哪个内存中读取放到寄存器x0 中.
;ldr x0,[x1] 找到寄存器x1中存储的地址值对应的内存, 读取里面的数据到 x0
//为了能让 x1中寸一个真实的地址 我们先写个 变量 ,然后读取 a的地址,在寄存器操作:
ldr x0,[x1]
ret

