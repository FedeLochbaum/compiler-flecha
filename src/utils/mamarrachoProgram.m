alloc($r1, 2)
mov_int($t, 1)
store($r1, 0, $t)
mov_int($t, 42)
store($r1, 1, $t)
alloc($r2, 4)
mov_int($t, 3)
store($r2, 0, $t)
mov_label($t, rtn_1)
store($r2, 1, $t)
load($r2, $r1, 1)
print($r2)
mov_reg($G_main, $r1)
