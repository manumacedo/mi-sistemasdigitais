
#Bloco 4: BEQ, BNE

.data

Array:  .word   14, 12, 13, 5, 9, 11, 3, 6, 7, 10, 2, 4, 8, 1

.text
    main:

        li $t0, 65536
        lw   $t2, 0 #14
        lw   $t3, 4 #12
        lw   $t4, 8 #13
        lw   $t6, 12 #5
        lw  $t7, 16 #9
        lw  $t8, 20 #11

        bne  $t2, $t3, SomaB  #14 != 12

    SomaB:
        addi $t3, $zero, 11  # 12+11
        sw   $t3, 0($t0)  #save 23
        addi $t6, t6, 8  # 5+8
        beq  $t4, $t6, SomaA # 13 == 13
        beq  $t7, $t8, SomaC

    SomaA:
        lw  $t8, 8 #13
        lw  $t7, 12 #5
        sub $t5, $t8, $t7  #11 - 9
        sw  $t5,0($t0)  #save 2
        beq $t8, $t4, SomaC

    SomaC:
        add  $t8, $t4, $t7  # 13  + 5
        sw $t8,  0($t0)  #save  18
