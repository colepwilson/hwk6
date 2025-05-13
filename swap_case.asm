# swap_case.asm program
# For CMPSC 64
#
# Data Area
.data
    buffer:         .space 100
    input_prompt:   .asciiz "Enter string:\n"
    output_prompt:  .asciiz "Output:\n"
    convention:     .asciiz "Convention Check\n"
    newline:        .asciiz "\n"

.text

#
# DO NOT MODIFY THE MAIN PROGRAM 
#       OR ANY OF THE CODE BELOW, WITH 1 EXCEPTION!!!
# YOU SHOULD ONLY MODIFY THE SwapCase FUNCTION 
#       AT THE BOTTOM OF THIS CODE
#
main:
    la $a0, input_prompt    # prompt user for string input
    li $v0, 4
    syscall

    li $v0, 8       # take in input
    la $a0, buffer
    li $a1, 100
    syscall
    move $s0, $a0   # save string to s0

    li $s1, 0
    li $s2, 0
    li $s3, 0
    li $s4, 0
    li $s5, 0
    li $s6, 0
    li $s7, 0

    move $a0, $s0
    jal SwapCase

    add $s1, $s1, $s2
    add $s1, $s1, $s3
    add $s1, $s1, $s4
    add $s1, $s1, $s5
    add $s1, $s1, $s6
    add $s1, $s1, $s7
    add $s0, $s0, $s1

    la $a0, output_prompt    # give Output prompt
    li $v0, 4
    syscall

    move $a0, $s0
    jal DispString

    j Exit

DispString:
    addi $a0, $a0, 0
    li $v0, 4
    syscall
    jr $ra

ConventionCheck:
    addi    $t0, $zero, -1
    addi    $t1, $zero, -1
    addi    $t2, $zero, -1
    addi    $t3, $zero, -1
    addi    $t4, $zero, -1
    addi    $t5, $zero, -1
    addi    $t6, $zero, -1
    addi    $t7, $zero, -1
    ori     $v0, $zero, 4
    la      $a0, convention
    syscall
    addi    $v0, $zero, -1
    addi    $v1, $zero, -1
    addi    $a0, $zero, -1
    addi    $a1, $zero, -1
    addi    $a2, $zero, -1
    addi    $a3, $zero, -1
    addi    $k0, $zero, -1
    addi    $k1, $zero, -1
    jr      $ra
    
Exit:
    li $v0, 10
    syscall

# COPYFROMHERE - DO NOT REMOVE THIS LINE

# YOU CAN ONLY MODIFY THIS FILE FROM THIS POINT ONWARDS:
SwapCase:
    #TODO: write your code here, $a0 stores the address of the string
    addi $sp, $sp, -12
    sw $s0, 0($sp)
    sw $s1, 4($sp)
    sw $ra, 8($sp)
    move $s0, $a0
    li $s1, 100
    add $s1, $s1, $a0

loop:
    bge $s0, $s1, return
    lbu $t0, 0($s0)
    beq $t0, $zero, return

    li $t1, 97
    li $t2, 122
    slt $t3, $t0, $t1
    slt $t4, $t2, $t0
    or $t5, $t3, $t4
    beq $t5, $zero, make_upper

    li $t1, 65
    li $t2, 90
    slt $t3, $t0, $t1
    slt $t4, $t2, $t0
    or $t5, $t3, $t4
    bne $t5, $zero, next_letter

    andi $t6, $t0, 0xFF
    addi $sp, $sp, -8
    sb $t6, 0($sp)
    sb $zero, 1($sp)

    addi $t0, $t0, 32
    sb $t0, 0($s0)

    li $v0, 4
    move $a0, $sp
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    lbu $t7, 0($s0)
    andi $t7, $t7, 0xFF
    sb $t7, 0($sp)
    sb $zero, 1($sp)
    li $v0, 4
    move $a0, $sp
    syscall
    li $v0, 4
    la $a0, newline
    syscall
    addi $sp, $sp, 8

    jal ConventionCheck

    j next_letter

make_upper:
    andi $t6, $t0, 0xFF
    addi $sp, $sp, -8
    sb $t6, 0($sp)
    sb $zero, 1($sp)

    addi $t0, $t0, -32
    sb $t0, 0($s0)

    li $v0, 4
    move $a0, $sp
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    lbu $t7, 0($s0)
    andi $t7, $t7, 0xFF
    sb $t7, 0($sp)
    sb $zero, 1($sp)
    li $v0, 4
    move $a0, $sp
    syscall
    li $v0, 4
    la $a0, newline
    syscall
    addi $sp, $sp, 8

    jal ConventionCheck

next_letter:
    addi $s0, $s0, 1
    j loop

return:
    lw $ra, 8($sp)
    lw $s0, 0($sp)
    lw $s1, 4($sp)
    addi $sp, $sp, 12
    # Do not remove the "jr $ra" line below!!!
    # It should be the last line in your function code!
    jr $ra
