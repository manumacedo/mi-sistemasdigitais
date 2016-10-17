.text
		li $t1, 36 					 #registrador com o valor para verificar a raiz quadrada
		li $s1, 0
	ISQRT:
		li   $t4, 2
		mul  $t0, $s1, $t4        #$t0 = s1 * 2
		addi $t0, $t0, 1          #$t0 = t0 +1
		sub	 $t1, $t1, $t0        #$s0 = S0 - t0
		addi $s1, $s1, 1		  #$s1 = s1 + 1			
		beq  $t1, $zero, EXIT	  #if($s0 = 0)
		j ISQRT
	EXIT:
		
