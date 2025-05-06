.text
.globl merge

#
#	a0 buffer address
#	a1 buffer length
#
#	|----|----|----|----|		|----|----|----|----|
#	|  2 |  2 |  0 |  4 |  => 	|  4 |  0 |  0 |  4 |
#	|----|----|----|----|		|----|----|----|----|
#
#   BONUS: Return the number of merges in a0 and the
#          total base score of the merges in a1.

merge:
    addi t2 a1 -1
    li t3 0
    li t4 0
    
    loop5: 
    beqz t2 ended
    lw a2 0(a0)
    lhu t0 0(a2)
    addi a0 a0 4
    lw a3 0(a0)
    lhu t1 0(a3)
    beq  t0, t1 ifequal
    addi t2 t2 -1
    j loop5
    
    
    ifequal:
    addi t2 t2 -1
    beqz t0 loop5
    add t0 t0 t1
    add t3 t3 t0
    addi t4 t4 1
    sh t0 0(a2)
    li t1 0
    sh t1 0(a3)
    j loop5


    ended:
    mv a0 t4
    mv a1 t3
    jr ra
