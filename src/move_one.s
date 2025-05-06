.text
.globl move_one

#
#	a0 buffer address
#	a1 buffer length
#
#	|----|----|----|----|----|		|----|----|----|----|----|
#	|  2 |  0 |  2 |  0 |  4 |	=> 	|  2 |  2 |  0 |  4 |  0 |
#	|----|----|----|----|----|		|----|----|----|----|----|
#
#	a0 1 iff something changed else 0

# a0 = base pointer to row[]
# a1 = number of elements
# Returns a0 = 1 if tile moved, else 0

move_one:
	li t3 1
	loop3:
    bge t3, a1, notchanged 
    lw a4, 0(a0)
	lhu t0 ,0(a4)
    beqz t0, isnextnonzero
    addi a0, a0, 4
    addi a1, a1, -1
    j loop3

	isnextnonzero:
	addi a0 a0 4
	lw t4 0(a0)
	lhu t6 0(t4)
	addi a0 a0 -4
	bnez t6 foundempty
    addi a0, a0, 4
    addi a1, a1, -1
	beqz t0, loop3

	foundempty:
	bge t3, a1, changedmo
	addi a0 a0 4
	lw a5 0(a0)
	lhu t1 0(a5)
	addi a0 a0 -4
	lw a6 0(a0)
	sh t1, 0(a6) # 
	addi a0 a0 4
	addi a1 a1 -1
	j foundempty
    

	changedmo:
	lw a5 0(a0)
	sh zero 0(a5)
	li a0 1
	j returnmo

	notchanged:
	li a0 0

	returnmo:
	jr ra
