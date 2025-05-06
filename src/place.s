.text
.globl place

# 	a0 board address
# 	a1 board length
#	a2 field number to place into
#	a3 number to place
#
#	a0 == 0 iff place succesfull else 1
#

place:
 loop1:
    blez a2 checkempty
    addi a2 a2 -1
    addi a0 a0 2
    j loop1

    checkempty:
    lhu a4 0(a0)
    beqz a4 fill
    j not_placed

    fill:
    sh a3 0(a0)

    placed:
	li a0 0
    j returnp

    not_placed:
    li a0 1

    returnp:
    jr ra
