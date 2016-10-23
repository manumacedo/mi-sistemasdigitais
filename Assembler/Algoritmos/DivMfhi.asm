# Bloco 3: DIV, MFHI

.text
  li $t0, 65536
  lui $t0, 10
  lui $t1, 2
  lui $t2, 200
  div $t0, $t1 #10/2
  mfhi $s2
  sw $s2, 0($t0) #save 5
  addi $s1, $t1, 8 #8+2
  div $t2, $s1 #200/10
  mfhi $s4
  sw $s4, 0($t0) #20
