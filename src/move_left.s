.text
.globl move_left

#
#	a0 buffer address
#	a1 buffer length
#
#	|----|----|----|----|		|----|----|----|----|
#	|  0 |  2 |  0 |  4 |	=> 	|  2 |  4 |  0 |  0 |
#	|----|----|----|----|		|----|----|----|----|
#

.import "move_one.s"

move_left:
    addi sp sp -16
    sw ra 8(sp)
    addi t0 a1 0

    loop4:
    blez t0 returnml
    sw a1 0(sp)
    sw a0 4(sp)
    sw t0 12(sp)
    jal move_one
    lw a1 0(sp)
    lw a0 4(sp)
    lw t0 12(sp)
    addi t0 t0 -1
    j loop4

    returnml:
    lw ra 8(sp)
    addi sp sp 16
    jr ra
