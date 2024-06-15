.data
  	result: .asciiz "O valor do termo"
  	r: .asciiz "O valor da razao aurea de"
  	breakLine: .asciiz "\n"
  	igual: .asciiz "="
  	branco: .asciiz " "
  
.text
.globl main

	fimPrograma:
    		li $v0, 10 
    		syscall

  	impInt: 
    		li $v0, 1
    		syscall
    		jr $ra

  	impFloat: 
    		li $v0, 2
    		mov.s $f12, $f0 			
    		syscall
    		jr $ra

  	impString: 
    		li $v0, 4
    		syscall
    		jr $ra

  	impressaoFibonacci:
    					
    		addi $sp, $sp, -4
    		sw $ra, 0($sp)
    
    		move $t0, $a0

    		la $a0, result 			
    		jal impString
    		la $a0, branco
    	
    		jal impString
    		move $a0, $t0
    		jal impInt
    	
    		la $a0, branco
    		jal impString
    		la $a0, igual
    	
    		jal impString
    		la $a0, branco
    		jal impString
    	
    		move $a0, $a1
    		jal impInt
    		la $a0, breakLine
    		jal impString

    		lw $ra, 0($sp) 			
    		addi $sp, $sp, 4
    		jr $ra

  	razaoAurea:
    			
    		addi $sp, $sp, -4
    		sw $ra, 0($sp)

    		move $t0, $a0

    		la $a0, r 
    		jal impString
    	   
    		la $a0, branco
    		jal impString
    		move $a0, $t0
    	
    		jal impInt
    		la $a0, branco
    	
    		jal impString
    		move $a0, $a1
    	
    		jal impInt
    		la $a0, branco
    	
    		jal impString
    		la $a0, igual
    	
   		jal impString
    		la $a0, branco
    	
    		jal impString
    		jal impFloat

    		lw $ra, 0($sp) 			
    		addi $sp, $sp, 4
    		jr $ra

  	fibonacci:
    		li $t0, 2 				
    		li $t1, 1 				
    		li $t2, 1 				
    		ble $a0, $zero, zero
    	fibonacci_loop:
      		beq $a0, $t0, end_loop
      		add $t3, $t1, $t2
      		move $t1, $t2
      		move $t2, $t3
      		addi $t0, $t0, 1
      	j fibonacci_loop
    			end_loop:
      		move $v0, $t3 			
      	j pos_zero

    	zero:
      		move $v0, $zero 			
    			pos_zero:
    	jr $ra 

  r_aurea:
    	beq $a1,$zero, return_aurea

    	mtc1  $a0, $f1
    	cvt.s.w $f1, $f1 			
    	mtc1 $a1, $f2
    	cvt.s.w $f2, $f2

    	div.s  $f0, $f2, $f1 		
    		j end_return_aurea

    
    return_aurea:
      	move $v0, $zero 			
    end_return_aurea:
	jr $ra


main: 
  	li $a0, 12
  	jal fibonacci
  	move $s0, $v0
  	
  	li $a0, 30
  	jal fibonacci
  	move $s1, $v0 	
   
  	li $a0, 41
  	jal fibonacci
  	move $s2, $v0 	

  	li $a0, 40
  	jal fibonacci
  	move $s3, $v0 	

  	move $a0, $s3
  	move $a1, $s2
  	jal r_aurea 		

  	li $a0, 12
  	move $a1, $s0
  	jal impressaoFibonacci
  	
  	li $a0, 30
  	move $a1, $s1
  	jal impressaoFibonacci 		

  	li $a0, 41
  	move $a1, $s2
  	jal impressaoFibonacci 		

  	li $a0, 40
  	move $a1, $s3
  	jal impressaoFibonacci 		

  
  	li $a0, 40
  	li $a1, 41
  	jal razaoAurea 			

  	jal fimPrograma

  
