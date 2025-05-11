# conversion.asm program
# For CMPSC 64
#
# Don't forget to:
#   make all arguments to any function go in $a0, $a1, $a2
#   make all returned values from functions go in $v0

.text
conv:
    li $v0, 0                   # int z
    li $t0, 0                   # int i
    li $t1, 2

for:
    bge $t0, $a2, return
    sll $t2, $a1, 2             # placeholder for 4 * y
    sub $v0, $v0, $a0
    add $v0, $v0, $t2

    blt $a0, $t1, here
    sub $a1, $a1, $a0

here:
    addi $a0, $a0, 1
    addi $t0, $t0, 1
    j for

return:
    jr $ra

main:  # DO NOT MODIFY THE MAIN SECTION
    li $a0, 5
    li $a1, 7
    li $a2, 7

    jal conv

    move $a0, $v0
    li $v0, 1
    syscall

    li $v0, 10
    syscall