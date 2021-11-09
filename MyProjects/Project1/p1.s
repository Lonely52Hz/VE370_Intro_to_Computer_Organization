.text
.globl __start
__start:
    addi $sp, $sp, -160                      # adjust stack for 40 items

    addi $s0, $0, 40                         # int size = 40
    add $s1, $0, $0                          # int hotDay = 0
    add $s2, $0, $0                          # int coldDay = 0
    add $s3, $0, $0                          # int comfortDay = 0
    add $s4, $0, $sp                         # int tempArray[size]
    
    addi $t0, $0, 16                       
    sw $t0, 0($s4)                           # tempArray[0] = 16
    addi $t0, $0, 7
    sw $t0, 4($s4)                           # tempArray[1] = 7
    addi $t0, $0, 21
    sw $t0, 8($s4)                           # tempArray[2] = 21
    addi $t0, $0, 6                       
    sw $t0, 12($s4)                          # tempArray[3] = 6
    addi $t0, $0, 5
    sw $t0, 16($s4)                          # tempArray[4] = 5
    addi $t0, $0, 29
    sw $t0, 20($s4)                          # tempArray[5] = 29
    addi $t0, $0, -2                       
    sw $t0, 24($s4)                          # tempArray[6] = -2
    addi $t0, $0, 37
    sw $t0, 28($s4)                          # tempArray[7] = 37
    addi $t0, $0, 8
    sw $t0, 32($s4)                          # tempArray[8] = 8
    addi $t0, $0, -1                       
    sw $t0, 36($s4)                          # tempArray[9] = -1
    addi $t0, $0, 7
    sw $t0, 40($s4)                          # tempArray[10] = 7
    addi $t0, $0, 11
    sw $t0, 44($s4)                          # tempArray[11] = 11
    addi $t0, $0, 35                       
    sw $t0, 48($s4)                          # tempArray[12] = 35
    addi $t0, $0, 39
    sw $t0, 52($s4)                          # tempArray[13] = 39
    addi $t0, $0, 1
    sw $t0, 56($s4)                          # tempArray[14] = 1
    addi $t0, $0, 30                       
    sw $t0, 60($s4)                          # tempArray[15] = 30
    addi $t0, $0, -10
    sw $t0, 64($s4)                          # tempArray[16] = -10
    addi $t0, $0, 39
    sw $t0, 68($s4)                          # tempArray[17] = 39
    addi $t0, $0, -7                       
    sw $t0, 72($s4)                          # tempArray[18] = -7
    addi $t0, $0, -15
    sw $t0, 76($s4)                          # tempArray[19] = -15
    addi $t0, $0, 34
    sw $t0, 80($s4)                          # tempArray[20] = 34
    addi $t0, $0, 29
    sw $t0, 84($s4)                          # tempArray[21] = 29
    addi $t0, $0, 38                       
    sw $t0, 88($s4)                          # tempArray[22] = 38
    addi $t0, $0, 6
    sw $t0, 92($s4)                          # tempArray[23] = 6
    addi $t0, $0, 29
    sw $t0, 96($s4)                          # tempArray[24] = 29
    addi $t0, $0, -4                       
    sw $t0, 100($s4)                         # tempArray[25] = -4
    addi $t0, $0, 28
    sw $t0, 104($s4)                         # tempArray[26] = 28
    addi $t0, $0, 29
    sw $t0, 108($s4)                         # tempArray[27] = 29
    addi $t0, $0, -11                       
    sw $t0, 112($s4)                         # tempArray[28] = -11
    addi $t0, $0, -5
    sw $t0, 116($s4)                         # tempArray[29] = -5
    addi $t0, $0, 6
    sw $t0, 120($s4)                         # tempArray[30] = 6
    addi $t0, $0, 19
    sw $t0, 124($s4)                         # tempArray[31] = 19
    addi $t0, $0, -4                       
    sw $t0, 128($s4)                         # tempArray[32] = -4
    addi $t0, $0, 23
    sw $t0, 132($s4)                         # tempArray[33] = 23
    addi $t0, $0, -15
    sw $t0, 136($s4)                         # tempArray[34] = -15
    addi $t0, $0, -1                       
    sw $t0, 140($s4)                         # tempArray[35] = -1
    addi $t0, $0, 9
    sw $t0, 144($s4)                         # tempArray[36] = 9
    addi $t0, $0, 37
    sw $t0, 148($s4)                         # tempArray[37] = 37
    addi $t0, $0, -9                       
    sw $t0, 152($s4)                         # tempArray[38] = -9
    addi $t0, $0, 24
    sw $t0, 156($s4)                         # tempArray[39] = 24

    add $a0, $s4, $0                         # argument: tempArry
    add $a1, $s0, $0                         # argument: size
    addi $a2, $0, 1                          # argument: 1
    jal countArray                           # jump to coutArray
    add $t0, $0, $0                          # delay

    add $a0, $s4, $0                         # argument: tempArry
    add $a1, $s0, $0                         # argument: size
    addi $a2, $0, -1                         # argument: -1
    jal countArray                           # jump to coutArray
    add $t0, $0, $0                          # delay

    add $a0, $s4, $0                         # argument: tempArry
    add $a1, $s0, $0                         # argument: size
    addi $a2, $0, 0                          # argument: 0
    jal countArray                           # jump to coutArray
    add $t0, $0, $0                          # delay

    addi $sp, $sp, 160                       # recovery stack for 40 items
    addiu $v0, $0, 10                        # prepare to exit
    syscall                                  # exit

countArray:
    addi $sp, $sp, -36                       # adjust stack for 9 items
    sw $ra, 32($sp)                          # store $ra
    sw $s4, 28($sp)                          # store $s4
    sw $s3, 24($sp)                          # store $s3
    sw $s2, 20($sp)                          # store $s2
    sw $s1, 16($sp)                          # store $s1
    sw $s0, 12($sp)                          # store $s0
    sw $a2, 8($sp)                           # store $a2
    sw $a1, 4($sp)                           # store $a1
    sw $a0, 0($sp)                           # store $a0

    addi $t1, $a1, -1                        # int i = numElements - 1
    add $t2, $0, $0                          # int cnt =0
    addi $t4, $0, 1                          # $t4 = 1
    addi $t5, $0, -1                         # $t5 = -1

ForLoop:
    slt $t3, $t1, $0                         # if $t1(i) < 0, $t3 = 1
    bne $t3, $0, ExitForLoop                 # if $t3 != 0, jump to exit
    add $t0, $0, $0                          # delay
    beq $t4, $a2, Hot                        # if $t4 == $a2 == 1, jump to Hot
    add $t0, $0, $0                          # delay
    beq $t5, $a2, Cold                       # if $t5 == $a2 == -1, jump to Cold
    add $t0, $0, $0                          # delay
    j Comfort                                # Otherwise, jump to Comfort
    add $t0, $0, $0                          # delay
    
Hot:
    addi $sp, $sp, -4                        # adjust stack for 1 items
    sw $a0, 0($sp)                           # store $a0
    sll $t6, $t1, 2                          # $t1 * 4
    add $t6, $t6, $a0                        # $a0 + $t1 * 4
    lw $t6, 0($t6)                           # load value
    addi $t7, $0, 30
    slt $t8, $t6, $t7                        # if $t6 < 30, $t8 = 1
    bne $t8, $0, HotOtherwise                # if $t8 != 0, jump to HotOtherwise
    add $t0, $0, $0                          # delay
    addi $t2, $t2, 1                         # cnt++
    addi $t1, $t1, -1                        # i--
    lw $a0, 0($sp)                           # load $a0
    addi $sp, $sp, 4                         # recover stack for 1 items
    j ForLoop                                # jump to ForLoop
    add $t0, $0, $0                          # delay

HotOtherwise:
    addi $t2, $t2, 0                         # cnt + 0
    addi $t1, $t1, -1                        # i--
    lw $a0, 0($sp)                           # load $a0
    addi $sp, $sp, 4                         # recover stack for 1 items
    j ForLoop                                # jump to ForLoop
    add $t0, $0, $0                          # delay

Cold:
    addi $sp, $sp, -4                        # adjust stack for 1 items
    sw $a0, 0($sp)                           # store $a0
    sll $t6, $t1, 2                          # $t1 * 4
    add $t6, $t6, $a0                        # $a0 + $t1 * 4
    lw $t6, 0($t6)                           # load value
    addi $t7, $0, 5                          # $t7 = 5
    slt $t8, $t7, $t6                        # if $t7 < $t6, $t8 = 1
    bne $t8, $0, ColdOtherwise               # if $t8 != 0, jump to ColdOtherwise
    add $t0, $0, $0                          # delay
    addi $t2, $t2, 1                         # cnt++
    addi $t1, $t1, -1                        # i--
    lw $a0, 0($sp)                           # load $a0
    addi $sp, $sp, 4                         # recover stack for 1 items
    j ForLoop                                # jump to ForLoop
    add $t0, $0, $0                          # delay

ColdOtherwise:
    addi $t2, $t2, 0                         # cnt + 0
    addi $t1, $t1, -1                        # i--
    lw $a0, 0($sp)                           # load $a0
    addi $sp, $sp, 4                         # recover stack for 1 items
    j ForLoop                                # jump to ForLoop
    add $t0, $0, $0                          # delay

Comfort: 
    addi $sp, $sp, -4                        # adjust stack for 1 items
    sw $a0, 0($sp)                           # store $a0
    sll $t6, $t1, 2                          # $t1 * 4
    add $t6, $t6, $a0                        # $a0 + $t1 * 4
    lw $t6, 0($t6)                           # load value
    addi $t7, $0, 30                         # $t7 = 30
    slt $t8, $t6, $t7                        # if $t6 < 30, $t8 = 1
    bne $t8, $0, Judge                       # if $t8 != 0, jump to Judge
    add $t0, $0, $0                          # delay
    addi $t2, $t2, 0                         # cnt + 0
    addi $t1, $t1, -1                        # i--
    lw $a0, 0($sp)                           # load $a0
    addi $sp, $sp, 4                         # recover stack for 1 items
    j ForLoop                                # jump to ForLoop
    add $t0, $0, $0                          # delay

Judge:
    addi $t1, $t1, -1                        # i--
    addi $t7, $0, 5                          # $t7 = 5
    slt $t8, $t7, $t6                        # if $t7(5) < $t6, $t8 = 1
    lw $a0, 0($sp)                           # load $a0
    addi $sp, $sp, 4                         # recover stack for 1 items
    beq $t8, $0, ForLoop                     # if $t8 == 0 (x <= 5), jump to ForLoop
    add $t0, $0, $0                          # delay
    addi $t2, $t2, 1                         # cnt++
    j ForLoop                                # jump to ForLoop
    add $t0, $0, $0                          #delay

ExitForLoop:
    add $v1, $t2, $0                         # return cnt
    lw $a0, 0($sp)                           # load $a0
    lw $a1, 4($sp)                           # load $a1
    lw $a2, 8($sp)                           # load $a2
    lw $s0, 12($sp)                          # load $s0
    lw $s1, 16($sp)                          # load $s1
    lw $s2, 20($sp)                          # load $s2
    lw $s3, 24($sp)                          # load $s3
    lw $s4, 28($sp)                          # load $s4
    lw $ra, 32($sp)                          # load $ra
    addi $sp, $sp, 36                        # recover stack for 9 items
    jr $ra                                   # return
    add $t0, $0, $0                          # delay