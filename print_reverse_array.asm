# print_array.asm program
# For CMPSC 64
#
# Don't forget to:
#   make all arguments to any function go in $a0, $a1
#   make all returned values from functions go in $v0

.data
	array: # Write the definition here
	cout:  # Write the definition here

.text
printArr:
    # TODO: Write your function code here

main:  # DO NOT MODIFY THE MAIN SECTION
	li $v0, 4
	la $a0, cout
	syscall

	la $a0, array
	li $a1, 10

	jal printArr

	li $v0, 10
	syscall
	