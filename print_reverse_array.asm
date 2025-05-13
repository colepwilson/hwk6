# print_array.asm program
# For CMPSC 64
#
# Don't forget to:
#   make all arguments to any function go in $a0, $a1
#   make all returned values from functions go in $v0

.data
array:      .word 1 2 3 4 5 6 7 8 9 10
cout:       .asciiz "The contents of the array are:\n"
newline:    .asciiz "\n"

.text
printArr:
    # TODO: Write your function code here
    move $t0, $a0
    addi $t1, $a1, -1

for:
    blt $t1, $zero, return
    sll $t2, $t1, 2
    add $t3, $t0, $t2

    lw $a0, 0($t3)
    li $v0, 1
    syscall

    la $a0, newline
    li $v0, 4
    syscall

    addi $t1, $t1, -1
    j for

return:
    jr $ra

main:  # DO NOT MODIFY THE MAIN SECTION
	li $v0, 4
	la $a0, cout
	syscall

	la $a0, array
	li $a1, 10

	jal printArr

	li $v0, 10
	syscall
	