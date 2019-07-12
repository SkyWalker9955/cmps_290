.data 
	
	newLine: .asciiz "\n"

.text

	main:
		#declare i; and set $t1 to a value;
		addi $s0, $zero, 2			#   i = 2;
		addi $t0, $zero, 2097152	# $t1 = 2097152;
		
		#While loop 
		while:
			bgt $s0, $t0, else		#if $t0 = $t1, goto else
			#call the "print i" function
			jal print
			#increment i
			mul $s0, $s0, 2
			#jump to while to loop
			j while
			#-----------------	
		else:
			# End Program
			li $v0, 10
			syscall
		
	# "Print i" function;
	print: 
		#print i
		li $v0, 1
		move $a0, $s0
		syscall
		#--------------
		#print newLine
		li $v0, 4
		la $a0, newLine
		syscall
		#--------------
		#return to a caller
		jr $ra
