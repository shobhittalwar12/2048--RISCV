	.data
	.globl main

board:
	.half 0,0,0,0,0,0,0,0
	.half 2,0,2,4,0,4,0,8
	.half 0,0,0,0,0,0,0,0
	.half 0,0,0,0,0,0,0,0
    .half 0,0,0,0,0,0,0,0
	.half 0,0,0,0,0,0,0,0
	.half 0,0,0,0,0,0,0,0
	.half 0,0,0,0,0,0,0,0

buf:

	.word 0,0,0,0,0,0,0,0

	
	.text

.import "../../src/place.s"
.import "../../src/complete_move.s"
.import "../../src/check_victory.s"
.import "../../src/printboard.s"

.import "../test_utils.s"

main:
	la t0 board
	la t1 buf
    addi t0 t0 16

   	sw t0 0(t1)
	addi t0 t0 2
	sw t0 4(t1)
	addi t0 t0 2
	sw t0 8(t1)
	addi t0 t0 2
	sw t0 12(t1)
	addi t0 t0 2
	sw t0 16(t1)
	addi t0 t0 2
	sw t0 20(t1)
	addi t0 t0 2
	sw t0 24(t1)	
	addi t0 t0 2
	sw t0 28(t1)
	addi t0 t0 2

    la a0 buf
    li a1 8
    jal complete_move
    la a0 board
    li a1 64
 	jal print_board_test
	li	a0 10
	ecall
