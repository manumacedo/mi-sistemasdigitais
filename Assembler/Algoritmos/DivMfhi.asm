# Bloco 3: DIV, MFHI

.text
  lui $t0, 10
  lui $t1, 2
  lui $t2, 200
  div $t0, $t1
  mfhi $s2
  sw $s2, 16400
  addi $s1, $t1, 8
  div $t2, $s1
  mfhi $s4
  sw $s4, 16400
