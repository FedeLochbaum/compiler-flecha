jump(main)
main:
alloc($r1, 2)
mov_int($t, 1)
store($r1, 0, $t)
mov_int($t, 42)
store($r1, 1, $t)
mov_reg($G_foo, $r1)
mov_reg($r4, $r1)
load($r5, $r4, 1)
print($r5)
alloc($r6, 2)
mov_int($t, 2)
store($r6, 0, $t)
mov_int($t, 10)
store($r6, 1, $t)
load($r7, $r6, 1)
print_char($r7)
alloc($r8, 2)
mov_int($t, 1)
store($r8, 0, $t)
mov_int($t, 43)
store($r8, 1, $t)
mov_reg($r10, $r8)
load($r11, $r10, 1)
print($r11)
mov_reg($r7, $r9)
alloc($r10, 2)
mov_int($t, 2)
store($r10, 0, $t)
mov_int($t, 10)
store($r10, 1, $t)
load($r11, $r10, 1)
print_char($r11)
mov_reg($r12, $r1)
load($r13, $r12, 1)
print($r13)
alloc($r13, 2)
mov_int($t, 2)
store($r13, 0, $t)
mov_int($t, 10)
store($r13, 1, $t)
load($r14, $r13, 1)
print_char($r14)
mov_reg($r10, $r12)
mov_reg($r8, $r10)
mov_reg($r6, $r8)
mov_reg($r4, $r6)
mov_reg($r2, $r4)
mov_reg($G_main, $r2)
