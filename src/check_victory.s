.text
.globl check_victory


#
#	a0 board address
#	a1 board length
#
#	a0 == 1 iff 2048 found
#

check_victory:
    li a2 2048
    loop:
    blez a1 notf
    lhu a3 0(a0)
    beq a3 a2 found
    addi a0 a0 2
    addi a1 a1 -1
    j loop
    
    found:
    li a0 1
    j return 
    
    notf:
    li a0 0

    return:
	jr ra
