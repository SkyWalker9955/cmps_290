.data 
     verticalSpace: '\n'
     result_1: .asciiz "The result of Step 1 is: "
     result_2: .asciiz "the result of Step 2 is: "
     h_value: .asciiz "Enter new value for 'h'\n"
     j_value: .asciiz "Enter new value for 'j'\n"
     
.text
#--------------------------------------------------
#function: f = g + (h - i) + j
#	   f = 20 + (14 - 6) + 22 
#---------------------------------
#	   g = 20
#	   h = 14
#	   i = 6 
#	   j = 22 

li $a0, 0 #f

#---------------------------------
li $t0, 14 #h
li $t1, 6  #i
li $t2, 20 #g
li $t3, 22 #j
#calculate
sub $s0, $t0, $t1
add $s1, $t2, $s0
add $s2, $s1, $t3

#prompt
li $v0, 4
la $a0, result_1
syscall

#print result
move $a0, $s2
li $v0, 1
syscall

#---------------------------------
#	h = 10 
#	j = 1
#---------------------------------

#print character
li $v0, 4
la $a0, verticalSpace
syscall

#prompt
li $v0, 4
la $a0, h_value
syscall

#take input
li  $v0, 5
syscall
#replace the value
move $t0, $v0

#prompt
li $v0, 4
la $a0, j_value
syscall

#take input
li  $v0, 5
syscall
#replace the value
move $t3, $v0
#calculate
sub $s0, $t0, $t1
add $s1, $t2, $s0
add $s2, $s1, $t3

#prompt
li $v0, 4
la $a0, result_2
syscall

#print result
move $a0, $s2
li $v0, 1
syscall

#---------------------------------

#exit
li  $v0, 10
syscall
