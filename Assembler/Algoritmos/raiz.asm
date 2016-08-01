.start
	.pseg
		li $t1, 36 					 ;registrador com o valor para verificar a raiz quadrada
		li $s1, 0
	ISQRT:
		mul	$t0, $s1, 2          	 ;$t0 = s1 * 2
		add $t0, $t0, 1              ;$t0 = t0 +1
		sub	$t1, $t1, $t0        	 ;$s0 = S0 - t0
		add $s1, $s1, 1		     	 ;$s1 = s1 + 1
		beq $t1, $zero, exit	     ;if($s0 = 0)
		slt	$t0, $t1, $zero	     	 ;if ($s0 < $zero)
		beq $t0, 1, exit	         ;if ($t0 = 1)
		j ISQRT
		exit:
.end
