# Calcula o fibonacci de n
# Resultado final vai estar salvo em v0
# v0 = fib(n)
.text
main:
    li $a0, 10                      # n = 10 ,  coloque o valor de n desejado nesta linha
    jal fib                         # fib(n)
    j exit                          # pula para o fim do programa
   
fib:
    li $t1, 1                       # t1 = 1
    slt     $t2, $t1, $a0           # if (t1 < n) t2 = 1 else t2 = 0
    bne     $t2, $zero, fib_recurse # if (t2 != 0) goto fib_recuse
    move    $v0, $a0                # v0 = n
    jr  $ra                         # goto endereco de retorno
 
fib_recurse:
    addi $sp, $sp, -12              # libera 3 espacos na pilha
    sw $ra,0($sp)                   # salva endereco de retorno na pilha
    sw  $a0, 4($sp)                 # salva n na pilha
 
    addi     $a0, $a0, -1           # n = n - 1
    jal     fib                     # fib(n-1)
    lw      $a0,4($sp)              # carrega n da pilha
    sw  $v0, 8($sp)                 # salva o resultado de fib(n-1) na pilha
   
    addi $a0, $a0, -2               # n = n - 2
    jal fib                         # fib(n-2)
 
    lw  $t0, 8($sp)                 # carrega o resultado de fib(n-1) da pilha
    add $v0, $t0, $v0               # soma o resultado de fib(n-2) com fib(n-1) e guarda o resultado em v0
 
    lw  $ra, 0($sp)                 # carrega o endereco de retorno da pilha
    addi $sp, $sp, 12               # restaura o ponteiro da pilha
    jr  $ra                         # goto endereco de retorno
 
exit: