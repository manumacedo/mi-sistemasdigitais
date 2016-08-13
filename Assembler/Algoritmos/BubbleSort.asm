.data
    Array:  .word   14, 12, 13, 5, 9, 11, 3, 6, 7, 10, 2, 4, 8, 1
            
.text

    main:
        la  $t0, Array              # Copia a base do Array para t0
        addi $t0, $t0, 56           # Copia em t0 tamanho maximo do array     
    loopExterno:                    
        add $t1, $zero, $zero       # $t1 guarda uma flag para determinar quando a lista foi ordenada
        la  $a0, Array              # modifica $a0 com a base do endereço do vetor
    loopInterno:                    
        lw  $t2, 0($a0)             # coloca em $t2 o elemento atual do vetor
        lw  $t3, 4($a0)             # coloca em $t3 o prox elemento do vetor
        slt $t5, $t2, $t3           # $t5 recebe o valor 1 caso $t2 < $t3
        bne $t5, $zero, continue    # se $t5 = 1, faça o swap
        addi $t1, $zero, 1          # flag para determinar que temos que checar novamente
        sw  $t2, 4($a0)             # guarda o maior valor na posição
        sw  $t3, 0($a0)             # guarada o menor valor na posição
    continue:
        addi $a0, $a0, 4            # avança para a proxima posição do vetor
        bne  $a0, $t0, loopInterno    # se $a0 != $t0, vai para loop interno
        bne  $t1, $zero, loopExterno    # $t1 == 1, é necessário mais uma verificação , va para loop externo
