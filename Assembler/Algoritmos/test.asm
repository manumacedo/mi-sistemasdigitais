.text
LOOP:
addu $s0,$t6, $t5
addi $s0,$t6, 2
jal 2
jal 4
mul $s0, $s0, $t0
j LOOP
