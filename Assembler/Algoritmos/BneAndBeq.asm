
Bloco 4: BEQ, BNE

BEQ r3 , r4, r5

.data

Array:  .word   14, 12, 13, 5, 9, 11, 3, 6, 7, 10, 2, 4, 8, 1

.text

    main:
        lw   $t2, 0 #14
        lw   $t3, 4 #12
        lw   $t4, 8 #13
        lw   $t6, 12 #5
        lw  $t7, 16 #9
        lw  $t8, 20 #11

        bne  $t2, $t3, SomaB

    SomaB:
        addi $t3, $zero, 11
        addi $t6, t6, 8
        sw   $t3, 16400
        beq  $t4, $t6, SomaA
        beq  $t7, $t8, SomaC

    SomaA:
        lw  $t8, 8 #13
        lw  $t7, 12 #5
        slt $t5, $t8, $t7
        sw  $t5, 16400
        beq $t8, $t4, SomaC

    SomaC:
        add  $t8, $t4, $t7  # 13  + 5
        sw $t8, 16400
