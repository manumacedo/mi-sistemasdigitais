.text
		 	li  $t0, 2							;Registrador com a base
			li  $t1, 8							;Registrador com o expoente
			li  $t3, 1
			move $t2, $zero						;Registrador contador de iterações
			move $s0, $t0						;registrador de resultado
		LOOP:
			addi $t2, $t2, 1			;incremento do contador
			beq $t1, $t2, ENDCODE  		;condição para finalizar ou nao o codigo
			mul $s0, $s0, $t0			;multiplicacao do numero base pelo resultado até então
			j LOOP						;jump para repetir o laço
		CONDITIONZERO:
			addi $s0, $zero, 1
			j ENDCODE
		CONDITIONONE:
			move $s0, $t0
			j ENDCODE
		ENDCODE:
