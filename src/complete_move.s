.text
.globl complete_move


#
#	a0 buffer address
#	a1 buffer length
#
#	|----|----|----|----|		|----|----|----|----|
#	|  2 |  2 |  0 |  4 |  => 	|  4 |  4 |  0 |  0 |
#	|----|----|----|----|		|----|----|----|----|
#
#   BONUS: Return the number of merges in a0 and the
#          total base score of the merges in a1.

.import "move_left.s"
.import "merge.s"


complete_move:
addi sp sp -24
sw ra 0(sp)
addi t0 a1 0

loop6:
beqz t0 mid
sw a0 4(sp)
sw a1 8(sp)
sw t0 12(sp)

jal move_left
lw a0 4(sp)
lw a1 8(sp)
lw t0 12(sp)
addi t0 t0 -1
j loop6

mid:
jal merge
mv t2 a0
mv t3 a1
lw a0 4(sp)
lw a1 8(sp)
mv t0 a1

loop7:
beqz t0 enddone
sw a0 4(sp)
sw a1 8(sp)
sw t0 12(sp)
sw t2 16(sp)
sw t3 20(sp)


jal move_left
lw a0 4(sp)
lw a1 8(sp)
lw t0 12(sp)
lw t2 16(sp)
lw t3 20(sp)

addi t0 t0 -1
j loop7

enddone:
lw ra 0(sp)
mv a0 t2
mv a1 t3
addi sp sp 24

    jr ra
