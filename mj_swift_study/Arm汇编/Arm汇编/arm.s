

// 之前的x86汇编 segment xxx   segment stack 等. arm 中 直接 .开头
// 申明一一个代码段,说明以后的代码放到代码段  .text 代码段
.text
.global _test,_add,_sub


;test 函数的实现
_test:
// 汇编注释 可以用 ; 分号, xcode 中用 // 也可以
;mov 指令
;mov x0,#0x8
;mov x1,x0


;add 指令
mov x0,#0x1
mov x1,#0x2
// x2 = x0 + x1
add x2,x0,x1

;sub指令
mov x0,#0x5
mov x1,#0x2
// x2 = x0,x1
sub x2,x0,x1
ret //这里如果没有 ret 就会把下面的都当做一起执行了




// add函数:
// 有个问题 add的参数汇编中在哪里? - 寄存器中 x0 - x7,更多的放到堆栈
_add:
// x0 = x0 + x1,把传入的两个数相加后放到 x0 返回.
add x0,x0,x1
//函数返回值 结果放哪里? x0 通常用来存放 函数的返回值.(x86 模拟器的 ax 返回值)
ret

//sub函数
_sub:
sub x0,x0,x1

ret

