.start
		.text
			li $t0, 2							
			li $t1, 8							
			li $t3, 1
			beq $t1, $zero, CONDITIONZERO
			beq $t1, $t3, CONDITIONONE
			move $t2, $zero						
			move $s0, $t0						
		LOOP:
			addi $t2, $t2, 1			
			beq $t1, $t2, ENDCODE  		
			mul $s0, $s0, $t0			
			j LOOP						
		CONDITIONZERO:
			addi $s0, $zero, 1
		CONDITIONONE:
			move $s0, $t0
		ENDCODE:
.end
