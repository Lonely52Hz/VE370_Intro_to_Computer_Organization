# VE370 2020FA RC Week 3
# Class exercise: fib
# Author: Li Shi

# Important note: 
#   This program is written in Linux, and executed by
#     1. spim -bare
#     2. (spim) read "fib.s"
#     3. (spim) run
#   You may need to modify this program to execute in PCSpim.

.text

main:
  addi  $a0,  $0,   8
  jal   fib                 # Call fib(8)
  add   $t0,  $t0,  $0      # Delay
  add   $t0,  $t0,  $0      # Delay
  addi  $a0,  $v0,  0       # Print fib(8)
  addi  $v0,  $0,   1       
  syscall
  addi  $v0,  $0,   10      # System call 10 (exit)
  syscall                   # Exit

fib:
  addi  $sp,  $sp,  -12     # Allocate the stack frame
  sw    $ra,  8($sp)
  sw    $a0,  4($sp)
  sw    $s0,  0($sp)        # We will use $s0 later
  slti  $t0,  $a0,  3       # Test for n < 3
  beq   $t0,  $0,   elseBlock
  addi  $v0,  $0,   1       # return 1 
  addi  $sp,  $sp,  12 
  jr    $ra
  add   $t0,  $t0,  $0      # Delay

elseBlock:
  addi  $a0,  $a0,  -1
  jal   fib                 # fib(n-1)
  add   $t0,  $t0,  $0      # Delay
  add   $t0,  $t0,  $0      # Delay
  addi  $s0,  $v0,  0       # Q: What is $s0 used for?
  addi  $a0,  $a0,  -1
  jal   fib                 # fib(n-2)
  add   $t0,  $t0,  $0      # Delay
  add   $t0,  $t0,  $0      # Delay
  add   $v0,  $v0,  $s0     # return fib(n-1)+fib(n-2)
  lw    $s0,  0($sp)
  add   $t0,  $t0,  $0      # Delay
  add   $t0,  $t0,  $0      # Delay
  lw    $a0,  4($sp)
  add   $t0,  $t0,  $0      # Delay
  add   $t0,  $t0,  $0      # Delay
  lw    $ra,  8($sp)    
  add   $t0,  $t0,  $0      # Delay
  add   $t0,  $t0,  $0      # Delay
  addi  $sp,  $sp,  12      # Pop the stack
  add   $t0,  $t0,  $0      # Delay
  add   $t0,  $t0,  $0      # Delay
  jr    $ra
  add   $t0,  $t0,  $0      # Delay