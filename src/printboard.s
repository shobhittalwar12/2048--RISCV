.data
newl: .asciiz "\n"
pipe:    .asciiz "|"
dande: .asciiz "-----------------------------"
boundary: .asciiz "|      |      |      |      |"
singlespcae: .asciiz " "
teenespcae: .asciiz "   "
doespcae: .asciiz "  "



.globl printboard

#
#a0 Address of the first field of the board
#
#	-----------------------------
#	|      |      |      |      |
#	| 2048 |  128 |    8 | 1024 |
#	|      |      |      |      |
#	-----------------------------
#	|      |      |      |      |
#	| 1024 |   64 |    4 |    8 |
#	|      |      |      |      |
#	-----------------------------
#	|      |      |      |      |
#	|  512 |   32 |  512 |  128 |
#	|      |      |      |      |
#	-----------------------------
#	|      |      |      |      |
#	|  256 |   16 | 2048 | 1024 |
#	|      |      |      |      |
#	-----------------------------
#
.text
printboard:
li t0 4
addi sp sp -4

li t4 10
li t5 100
li t6 1000


logic:

beqz t0 ending
sw a0 0(sp)

la a1 dande #top dande
li a0 4
ecall

la a1 newl
li a0 4
ecall

la a1 boundary  #top pipe
li a0 4
ecall

la a1 newl
li a0 4
ecall

#innerline logic
la a1 pipe #beech ki line
li a0 4
ecall


li t1 4
innerline:
beqz t1 continue

la a1 singlespcae 
li a0 4
ecall

lw a0 0(sp)
lhu t2 0(a0)

#4th digit
blt t2, t4, ekword
blt t2, t5, doword
blt t2, t6, teenword
mv a1 t2
li a0 1
ecall
j idharaja

ekword:
la a1 teenespcae
li a0 4
ecall
mv a1 t2
li a0 1
ecall
j idharaja

doword:
la a1 doespcae
li a0 4
ecall
mv a1 t2
li a0 1
ecall
j idharaja

teenword:
la a1 singlespcae
li a0 4
ecall
mv a1 t2
li a0 1
ecall


idharaja:
la a1 singlespcae 
li a0 4
ecall

la a1 pipe #beech ki line
li a0 4
ecall

lw a0 0(sp)
addi a0 a0 2
sw a0 0(sp)
addi t1 t1 -1
j innerline



continue:
la a1 newl
li a0 4
ecall

la a1 boundary #bottom pipe
li a0 4

ecall
la a1 newl
li a0 4
ecall

lw a0 0(sp)
addi t0 t0 -1
j logic


ending:
la a1 dande
li a0 4
ecall
la a1 newl
li a0 4
ecall

addi sp sp 4
    jr ra


