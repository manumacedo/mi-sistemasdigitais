# Gera os n primeiros numeros primos e os salva em um array
# primes[0..n-1] = generate_primes(n)
#
# i = &array   , endereco de inicio do array
# j = i + 4*n  , endereco de fim do array
# k = 2
# *i = k
# i = i + 4
# LOOP1:
#   k = k + 1
#   l = k
#   LOOP2:
#       l = l - 1
#       if (l > 1) goto SKIP
#       *i = k                      # k eh primo e eh salvo no "array"
#       i = i + 4                   # i aponta para a proxima casa de "array"
#       if (i == j) goto EXIT       # se i == j, fim do array, pule para o fim do programa
#       goto LOOP1                  # volte para o LOOP1 para que o proximo numero seja testado
#       SKIP:
#           p = k%l
#           if (p != 0) goto LOOP2
#           goto LOOP1              # caso k nao seja primo volta para o LOOP1 incrementando-o
# EXIT:

.data
size: .word 20          # n = 20, tamanho do array
array: .space 80        # array = 4*n,  aloca 4*n words na memoria para o array de primos
.text
main:
la $s2, array           # carrega endereco de "array" em s2
la $s1, array           # carrega endereco de "array" em s1
la $s3, size            # carrega endereco de "size" em s3
lw $t5, 0($s3)          # carrega valor em "size" para t5
sll $t6, $t5, 2         # t6 = t5 * 4
add $s2, $s2, $t6       # s2 = s2 + t6, s2 agora possui o endereco do final de "array"

li $t0, 2               # t0 = 2
li $t5, 1               # t5 = 1
sw $t0,0($s1)           # valor valor de t0 em array[0]
addi $s1,$s1,4          # s1 = s1 + 4, agora possui endereco de array[1]

loop1: addi $t0,$t0,1   # t0 = t0 + 1
move $t1, $t0           # t1 = t0

loop2: addi $t1,$t1,-1  # t1 = t1 - 1
slt $t4,$t5,$t1         # if (t5 < t1) t4 = 1 else t4 = 0
bne $t4,$0,skip         # if (t4 != 0) goto skip
sw $t0,0($s1)           # salva t0 em array[s1/4]
addi $s1,$s1,4          # s1 = s1 + 4
beq $s1,$s2,exit        # if (s1 == s2) goto exit, se s1 possui endereco do final de "array", finalize
j loop1                 # goto loop1
skip: div $t0,$t1       # lo = t0/t1, hi = t0%t1
mfhi $t3                # t3 = hi
bne $t3,$0,loop2        # if (t3 != 0) goto loop2
j loop1                 # goto loop1

exit:
