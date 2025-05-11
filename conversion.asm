# conversion.asm program
# For CMPSC 64
#
# Don't forget to:
#   make all arguments to any function go in $a0, $a1, $a2
#   make all returned values from functions go in $v0

.text
conv:
    # TODO: Write your function code here

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