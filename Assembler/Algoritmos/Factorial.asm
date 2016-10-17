.text
    main:
        li  $a0, 4   
        jal fact   
        j   exit   
    fact:
        addi $sp, $sp, -8   
        sw   $ra, 4($sp)      
        sw   $a0, 0($sp)     
        li   $v0, 1           
        slt  $t0, $zero, $a0  
        beq  $t0, $zero, fact_return 
        addi $a0, $a0, -1   
        jal  fact            
        lw   $a0, 0($sp)     
        mul  $v0, $v0, $a0   
    fact_return:
        lw   $ra, 4($sp)      
        addi $sp, $sp, 8    
        jr   $ra              
    exit:
