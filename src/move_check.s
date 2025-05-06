.text
.globl move_check
#
#	a0 buffer address
#	a1 buffer length
#
#   a0 == 1 iff left move possible and would change something
#            else 0
#

move_check:

addi sp sp -4
sw a0 0(sp)
addi t0 a1 -1
addi t1 a1 -1
li t6 1

	loopleftside:
	blez t0 loop2same
	lw t2 0(a0)
	lhu t3 0(t2)
	beqz t3 0mila
	addi t0 t0 -1
	addi a0 a0 4
	j loopleftside

	0mila:
	beqz t0 loop2same
	addi a0 a0 4
	lw t2 0(a0)
	lhu t3 0(t2)
	bnez t3 movepossible
	addi t0 t0 -1
	j loopleftside


	loop2same:
	lw a0 0(sp)
	realloop2same:
	blez t1 notpossile
	lw a3 0(a0) 
	lhu a5 0(a3)
	addi a0 a0 4
	lw a4 0(a0) 
	lhu a6 0(a4)
	beqz a5 neeche
	beq a5 a6 movepossible
	neeche:
	addi t1 t1 -1  
	j realloop2same
	
	movepossible:
		li a0 1
		j returnm

	notpossile:
		li a0 0

	returnm:
	addi sp sp 4
		jr ra