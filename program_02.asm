.data
	 space: .asciiz "	"
   newLine: .asciiz "\n"

.text
	main:
		addi $t0, $t0, 16
		addi $s0, $s0, 0 
		addi $t1, $t1, 65536
		addi $t2, $t2, 1
		
		#Loop 1st row 
		while:
			beq $t0, $s0, line2
			jal printNum
			subi $t0, $t0, 1
			
			j while
		
		
		#Loop 2nd row
		line2:
		li $v0, 4
		la $a0, newLine
		syscall
		
		again:
			beq $t1, $t2, exit
			jal printRow2
			srl $t1, $t1, 1
			
			j again
		
		exit:
			#End Program 
			li $v0, 10
			syscall
		
	printNum: 
		li $v0, 1
		subi $a0, $t0, 1
		syscall
		
		li $v0, 4
		la $a0, space
		syscall
		
		jr $ra
		
	printRow2:
		li $v0, 1
		srl $a0, $t1, 1
		syscall 
		
		li $v0, 4
		la $a0, space 
		syscall 
		
		jr $ra
