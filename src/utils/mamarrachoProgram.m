jump(main)
rtn1:
mov_reg($fun, @fun)
mov_reg($arg, @arg)
mov_reg($r3, $arg)
load($r4, $fun, 2)
alloc($r4, 2)
mov_int($t, 2)
store($r4, 0, $t)
mov_int($t, 84)
store($r4, 1, $t)
load($r5, $r4, 1)
print_char($r5)
alloc($r6, 2)
mov_int($t, 2)
store($r6, 0, $t)
mov_int($t, 69)
store($r6, 1, $t)
load($r7, $r6, 1)
print_char($r7)
alloc($r8, 2)
mov_int($t, 2)
store($r8, 0, $t)
mov_int($t, 83)
store($r8, 1, $t)
load($r9, $r8, 1)
print_char($r9)
alloc($r10, 2)
mov_int($t, 2)
store($r10, 0, $t)
mov_int($t, 84)
store($r10, 1, $t)
load($r11, $r10, 1)
print_char($r11)
alloc($r12, 2)
mov_int($t, 2)
store($r12, 0, $t)
mov_int($t, 32)
store($r12, 1, $t)
load($r13, $r12, 1)
print_char($r13)
mov_reg($r14, $r2)
load($r15, $r14, 1)
print($r15)
alloc($r16, 2)
mov_int($t, 2)
store($r16, 0, $t)
mov_int($t, 10)
store($r16, 1, $t)
load($r17, $r16, 1)
print_char($r17)
alloc($r18, 2)
mov_int($t, 2)
store($r18, 0, $t)
mov_int($t, 9)
store($r18, 1, $t)
load($r19, $r18, 1)
print_char($r19)
mov_reg($r20, $r3)
load($r21, $r20, 1)
print($r21)
alloc($r21, 2)
mov_int($t, 2)
store($r21, 0, $t)
mov_int($t, 10)
store($r21, 1, $t)
load($r22, $r21, 1)
print_char($r22)
mov_reg($r19, $r21)
mov_reg($r17, $r19)
mov_reg($r15, $r17)
mov_reg($r13, $r15)
mov_reg($r11, $r13)
mov_reg($r9, $r11)
mov_reg($r7, $r9)
mov_reg($r5, $r7)
mov_reg($r3, $r5)
mov_reg(@res, $r3)
return()
rtn0:
mov_reg($fun, @fun)
mov_reg($arg, @arg)
mov_reg($r2, $arg)
alloc($r2, 3)
mov_int($t, 3)
store($r2, 0, $t)
mov_label($t, rtn1)
store($r2, 1, $t)
store($r2, 2, $r4)
mov_reg(@res, $r2)
return()
rtn3:
mov_reg($fun, @fun)
mov_reg($arg, @arg)
mov_reg($r7, $arg)
load($r8, $fun, 2)
mov_reg($r7, $r6)
mov_reg(@res, $r7)
return()
rtn2:
mov_reg($fun, @fun)
mov_reg($arg, @arg)
mov_reg($r6, $arg)
alloc($r6, 3)
mov_int($t, 3)
store($r6, 0, $t)
mov_label($t, rtn3)
store($r6, 1, $t)
store($r6, 2, $r8)
mov_reg(@res, $r6)
return()
rtn5:
mov_reg($fun, @fun)
mov_reg($arg, @arg)
mov_reg($r11, $arg)
mov_reg($r11, $r11)
mov_reg(@res, $r11)
return()
rtn4:
mov_reg($fun, @fun)
mov_reg($arg, @arg)
mov_reg($r10, $arg)
alloc($r10, 2)
mov_int($t, 3)
store($r10, 0, $t)
mov_label($t, rtn5)
store($r10, 1, $t)
mov_reg(@res, $r10)
return()
rtn8:
mov_reg($fun, @fun)
mov_reg($arg, @arg)
mov_reg($r15, $arg)
load($r16, $fun, 2)
load($r17, $fun, 3)
mov_reg($r16, $r15)
mov_reg($r19, $r14)
load($r20, @fun, 1)
mov_reg(@fun, $r18)
mov_reg(@arg, $r19)
icall($r20)
mov_reg($r17, @res)
mov_reg(@res, $r15)
return()
rtn7:
mov_reg($fun, @fun)
mov_reg($arg, @arg)
mov_reg($r14, $arg)
load($r18, $fun, 2)
alloc($r14, 4)
mov_int($t, 3)
store($r14, 0, $t)
mov_label($t, rtn8)
store($r14, 1, $t)
store($r14, 2, $r16)
store($r14, 3, $r17)
mov_reg(@res, $r14)
return()
rtn6:
mov_reg($fun, @fun)
mov_reg($arg, @arg)
mov_reg($r13, $arg)
alloc($r13, 3)
mov_int($t, 3)
store($r13, 0, $t)
mov_label($t, rtn7)
store($r13, 1, $t)
store($r13, 2, $r18)
mov_reg(@res, $r13)
return()
rtn10:
mov_reg($fun, @fun)
mov_reg($arg, @arg)
mov_reg($r21, $arg)
load($r22, $fun, 2)
mov_reg($r27, $r20)
mov_reg(@res, $r27)
return()
rtn9:
mov_reg($fun, @fun)
mov_reg($arg, @arg)
mov_reg($r20, $arg)
alloc($r26, 3)
mov_int($t, 3)
store($r26, 0, $t)
mov_label($t, rtn10)
store($r26, 1, $t)
store($r26, 2, $r22)
mov_reg(@res, $r26)
return()
rtn12:
mov_reg($fun, @fun)
mov_reg($arg, @arg)
mov_reg($r24, $arg)
mov_reg($r29, $r24)
mov_reg(@res, $r29)
return()
rtn11:
mov_reg($fun, @fun)
mov_reg($arg, @arg)
mov_reg($r23, $arg)
alloc($r28, 2)
mov_int($t, 3)
store($r28, 0, $t)
mov_label($t, rtn12)
store($r28, 1, $t)
mov_reg(@res, $r28)
return()
rtn15:
mov_reg($fun, @fun)
mov_reg($arg, @arg)
mov_reg($r27, $arg)
load($r28, $fun, 2)
load($r29, $fun, 3)
mov_reg($r43, $r27)
mov_reg($r46, $r26)
load($r47, @fun, 1)
mov_reg(@fun, $r45)
mov_reg(@arg, $r46)
icall($r47)
mov_reg($r44, @res)
mov_reg(@res, $r42)
return()
rtn14:
mov_reg($fun, @fun)
mov_reg($arg, @arg)
mov_reg($r26, $arg)
load($r30, $fun, 2)
alloc($r41, 4)
mov_int($t, 3)
store($r41, 0, $t)
mov_label($t, rtn15)
store($r41, 1, $t)
store($r41, 2, $r28)
store($r41, 3, $r29)
mov_reg(@res, $r41)
return()
rtn13:
mov_reg($fun, @fun)
mov_reg($arg, @arg)
mov_reg($r25, $arg)
alloc($r40, 3)
mov_int($t, 3)
store($r40, 0, $t)
mov_label($t, rtn14)
store($r40, 1, $t)
store($r40, 2, $r30)
mov_reg(@res, $r40)
return()
rtn17:
mov_reg($fun, @fun)
mov_reg($arg, @arg)
mov_reg($r32, $arg)
load($r33, $fun, 2)
mov_reg($r40, $r31)
mov_reg(@res, $r40)
return()
rtn16:
mov_reg($fun, @fun)
mov_reg($arg, @arg)
mov_reg($r31, $arg)
alloc($r39, 3)
mov_int($t, 3)
store($r39, 0, $t)
mov_label($t, rtn17)
store($r39, 1, $t)
store($r39, 2, $r33)
mov_reg(@res, $r39)
return()
rtn20:
mov_reg($fun, @fun)
mov_reg($arg, @arg)
mov_reg($r36, $arg)
load($r37, $fun, 2)
load($r38, $fun, 3)
mov_reg($r44, $r36)
mov_reg($r47, $r35)
load($r48, @fun, 1)
mov_reg(@fun, $r46)
mov_reg(@arg, $r47)
icall($r48)
mov_reg($r45, @res)
mov_reg(@res, $r43)
return()
rtn19:
mov_reg($fun, @fun)
mov_reg($arg, @arg)
mov_reg($r35, $arg)
load($r39, $fun, 2)
alloc($r42, 4)
mov_int($t, 3)
store($r42, 0, $t)
mov_label($t, rtn20)
store($r42, 1, $t)
store($r42, 2, $r37)
store($r42, 3, $r38)
mov_reg(@res, $r42)
return()
rtn18:
mov_reg($fun, @fun)
mov_reg($arg, @arg)
mov_reg($r34, $arg)
alloc($r41, 3)
mov_int($t, 3)
store($r41, 0, $t)
mov_label($t, rtn19)
store($r41, 1, $t)
store($r41, 2, $r39)
mov_reg(@res, $r41)
return()
rtn22:
mov_reg($fun, @fun)
mov_reg($arg, @arg)
mov_reg($r41, $arg)
mov_reg($r41, $r41)
mov_reg(@res, $r41)
return()
rtn21:
mov_reg($fun, @fun)
mov_reg($arg, @arg)
mov_reg($r40, $arg)
alloc($r40, 2)
mov_int($t, 3)
store($r40, 0, $t)
mov_label($t, rtn22)
store($r40, 1, $t)
mov_reg(@res, $r40)
return()
main:
alloc($r1, 2)
mov_int($t, 3)
store($r1, 0, $t)
mov_label($t, rtn0)
store($r1, 1, $t)
mov_reg($G_test, $r1)
alloc($r5, 2)
mov_int($t, 3)
store($r5, 0, $t)
mov_label($t, rtn2)
store($r5, 1, $t)
mov_reg($G_true, $r5)
alloc($r9, 2)
mov_int($t, 3)
store($r9, 0, $t)
mov_label($t, rtn4)
store($r9, 1, $t)
mov_reg($G_false, $r9)
alloc($r12, 2)
mov_int($t, 3)
store($r12, 0, $t)
mov_label($t, rtn6)
store($r12, 1, $t)
mov_reg($G_cond, $r12)
alloc($r22, 2)
mov_int($t, 1)
store($r22, 0, $t)
mov_int($t, 43)
store($r22, 1, $t)
alloc($r25, 2)
mov_int($t, 3)
store($r25, 0, $t)
mov_label($t, rtn9)
store($r25, 1, $t)
alloc($r24, 2)
mov_int($t, 1)
store($r24, 0, $t)
mov_int($t, 42)
store($r24, 1, $t)
mov_reg(@fun, $r25)
mov_reg(@arg, $r24)
load($t, $r25, 1)
icall($t)
mov_reg($r23, @res)
alloc($r24, 2)
mov_int($t, 1)
store($r24, 0, $t)
mov_int($t, 1)
store($r24, 1, $t)
load($r25, @fun, 1)
mov_reg(@fun, $r23)
mov_reg(@arg, $r24)
icall($r25)
mov_reg($r22, @res)
alloc($r24, 2)
mov_int($t, 1)
store($r24, 0, $t)
mov_int($t, 43)
store($r24, 1, $t)
alloc($r27, 2)
mov_int($t, 3)
store($r27, 0, $t)
mov_label($t, rtn11)
store($r27, 1, $t)
alloc($r26, 2)
mov_int($t, 1)
store($r26, 0, $t)
mov_int($t, 42)
store($r26, 1, $t)
mov_reg(@fun, $r27)
mov_reg(@arg, $r26)
load($t, $r27, 1)
icall($t)
mov_reg($r25, @res)
alloc($r26, 2)
mov_int($t, 1)
store($r26, 0, $t)
mov_int($t, 2)
store($r26, 1, $t)
load($r27, @fun, 1)
mov_reg(@fun, $r25)
mov_reg(@arg, $r26)
icall($r27)
mov_reg($r24, @res)
alloc($r26, 2)
mov_int($t, 1)
store($r26, 0, $t)
mov_int($t, 2)
store($r26, 1, $t)
alloc($r29, 2)
mov_int($t, 1)
store($r29, 0, $t)
mov_int($t, 1)
store($r29, 1, $t)
load($r30, @fun, 1)
mov_reg(@fun, $r28)
mov_reg(@arg, $r29)
icall($r30)
mov_reg($r27, @res)
alloc($r28, 2)
mov_int($t, 1)
store($r28, 0, $t)
mov_int($t, 3)
store($r28, 1, $t)
load($r29, @fun, 1)
mov_reg(@fun, $r27)
mov_reg(@arg, $r28)
icall($r29)
mov_reg($r26, @res)
alloc($r28, 2)
mov_int($t, 1)
store($r28, 0, $t)
mov_int($t, 2)
store($r28, 1, $t)
alloc($r31, 2)
mov_int($t, 1)
store($r31, 0, $t)
mov_int($t, 1)
store($r31, 1, $t)
load($r32, @fun, 1)
mov_reg(@fun, $r30)
mov_reg(@arg, $r31)
icall($r32)
mov_reg($r29, @res)
alloc($r30, 2)
mov_int($t, 1)
store($r30, 0, $t)
mov_int($t, 4)
store($r30, 1, $t)
load($r31, @fun, 1)
mov_reg(@fun, $r29)
mov_reg(@arg, $r30)
icall($r31)
mov_reg($r28, @res)
alloc($r30, 2)
mov_int($t, 1)
store($r30, 0, $t)
mov_int($t, 2)
store($r30, 1, $t)
alloc($r32, 2)
mov_int($t, 1)
store($r32, 0, $t)
mov_int($t, 1)
store($r32, 1, $t)
mov_reg($r35, $r5)
load($r36, @fun, 1)
mov_reg(@fun, $r34)
mov_reg(@arg, $r35)
icall($r36)
mov_reg($r33, @res)
alloc($r32, 2)
mov_int($t, 1)
store($r32, 0, $t)
mov_int($t, 5)
store($r32, 1, $t)
load($r33, @fun, 1)
mov_reg(@fun, $r31)
mov_reg(@arg, $r32)
icall($r33)
mov_reg($r30, @res)
alloc($r32, 2)
mov_int($t, 1)
store($r32, 0, $t)
mov_int($t, 2)
store($r32, 1, $t)
alloc($r34, 2)
mov_int($t, 1)
store($r34, 0, $t)
mov_int($t, 1)
store($r34, 1, $t)
mov_reg($r37, $r9)
load($r38, @fun, 1)
mov_reg(@fun, $r36)
mov_reg(@arg, $r37)
icall($r38)
mov_reg($r35, @res)
alloc($r34, 2)
mov_int($t, 1)
store($r34, 0, $t)
mov_int($t, 6)
store($r34, 1, $t)
load($r35, @fun, 1)
mov_reg(@fun, $r33)
mov_reg(@arg, $r34)
icall($r35)
mov_reg($r32, @res)
alloc($r34, 2)
mov_int($t, 1)
store($r34, 0, $t)
mov_int($t, 2)
store($r34, 1, $t)
alloc($r36, 2)
mov_int($t, 1)
store($r36, 0, $t)
mov_int($t, 1)
store($r36, 1, $t)
alloc($r39, 2)
mov_int($t, 3)
store($r39, 0, $t)
mov_label($t, rtn13)
store($r39, 1, $t)
alloc($r38, 2)
mov_int($t, 3)
store($r38, 0, $t)
mov_label($t, rtn16)
store($r38, 1, $t)
mov_reg(@fun, $r39)
mov_reg(@arg, $r38)
load($t, $r39, 1)
icall($t)
mov_reg($r37, @res)
alloc($r36, 2)
mov_int($t, 1)
store($r36, 0, $t)
mov_int($t, 7)
store($r36, 1, $t)
load($r37, @fun, 1)
mov_reg(@fun, $r35)
mov_reg(@arg, $r36)
icall($r37)
mov_reg($r34, @res)
alloc($r35, 2)
mov_int($t, 1)
store($r35, 0, $t)
mov_int($t, 2)
store($r35, 1, $t)
alloc($r37, 2)
mov_int($t, 1)
store($r37, 0, $t)
mov_int($t, 1)
store($r37, 1, $t)
alloc($r40, 2)
mov_int($t, 3)
store($r40, 0, $t)
mov_label($t, rtn18)
store($r40, 1, $t)
alloc($r39, 2)
mov_int($t, 3)
store($r39, 0, $t)
mov_label($t, rtn21)
store($r39, 1, $t)
mov_reg(@fun, $r40)
mov_reg(@arg, $r39)
load($t, $r40, 1)
icall($t)
mov_reg($r38, @res)
alloc($r37, 2)
mov_int($t, 1)
store($r37, 0, $t)
mov_int($t, 8)
store($r37, 1, $t)
load($r38, @fun, 1)
mov_reg(@fun, $r36)
mov_reg(@arg, $r37)
icall($r38)
mov_reg($r35, @res)
mov_reg($r31, $r33)
mov_reg($r29, $r31)
mov_reg($r27, $r29)
mov_reg($r25, $r27)
mov_reg($r23, $r25)
mov_reg($r21, $r23)
mov_reg($r19, $r21)
mov_reg($G_main, $r19)
