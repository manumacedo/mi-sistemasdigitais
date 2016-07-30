
.start
  .pseg
  addu $s0,$t6,zero
  lui $s1,0x1001
  addi $s2,$s1,80
  addi $t0,zero,2
  addi $t5,zero,1
  sw $t0,0($s1)
  addi $s1,$s1,4
  loop1: addi $t0,$t0,1
  or $t1,$t0,zero
  loop2: addi $t1,$t1,-1
  slt $t4,$t5,$t1
  bne $t4,zero,skip
  sw $t0,0($s1)
  addi $s1,$s1,4
  beq $s1,$s2,exit
  j loop1
  skip: div $t0,$t1
  mfhi $t3
  bne $t3,zero,loop2
  j loop1
  exit: addu $t6, zero, $s0
  jr $t6
.end
