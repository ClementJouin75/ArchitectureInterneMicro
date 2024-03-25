li a0, 0x100        # a0 = 0x100
li a1, 0x00000000   # a1 = 0x00000000
li a2, 0x0000FF00   # a2 = 0x0000FF00
ecall

li a3, 0x00000000   # X = 0x00000000
li a4, 0x00000000       # Y = 0x00000000
li a7, 0x00000000   # X_OR = 0x00000000
li a5, 0x00000000   # X_max = 0x10100000
li a6, 0x0000FF00   # Y_max = 0x00001010



y_loop: 

    beq a2, a6, x_loop      # if  Y == Y_max then x_loop
    call ecallY
    addi  a2, a2, 1


j y_loop

x_loop:
    li a2, 0x00001111   # a1 = 0x00000000
    sub a1, a1, a2
    addi a3, a3, 1          # a3 = a3 + 1
    addi a7, a3, 0          # a7 = a3 + 0
    slli  a7, a7, 16         # a7 = a7 << 4
    or a1, a1, a7           # a7 = a7 | a3
    call ecallX
    li a2, 0x00000000   # a1 = 0x00000000
    beq a3, a5, exit        # if X == X_max then y_loop
j y_loop



ecallX: 
    li a0, 0x100        # a0 = 0x100
    addi a1, a1, 0   # a1 = 0x00000000
    li a2, 0x0000FF00   # a2 = 0x0000FF00
    ecall
ret 

ecallY:
    li a0, 0x100        # a0 = 0x100
    addi a1, a1, 1      # a1 = 0x00000000
    li a2, 0x0000FF00   # a2 = 0x0000FF00
    ecall
ret

exit:
j exit