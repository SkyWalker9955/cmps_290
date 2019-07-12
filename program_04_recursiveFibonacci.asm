.data
prompt: .asciiz "Enter term number for the Fibonacci sequence you want the number of: "
prompt2: .asciiz "The Fibonacci value is: "
message: .asciiz "The Fibonacci value is: "
#-----------------------------------------------
.text
 
# prompt
li $v0, 4
la $a0, prompt
syscall

# read input
li $v0, 5
syscall

beq $v0, 0, equalToZero

# call fib.
move $a0, $v0
jal fibonacci
move $a1, $v0 # save return value to a1

# prompt2
li $v0, 4
la $a0, prompt2
syscall

# print result
li $v0, 1
move $a0, $a1
syscall

# END PROGRAM
li $v0, 10
syscall

#----------------------------------------------------

#fibonacci funct (int n)
fibonacci:

# Allocate Stack
addi $sp, $sp, -12
sw   $ra, 8($sp)
sw   $s0, 4($sp)
sw   $s1, 0($sp)

move $s0, $a0
li   $v0, 1 

ble  $s0, 0x2, fibFinish # condition
addi $a0, $s0, -1 # (n-1)
jal  fibonacci

move $s1, $v0 # store (n-1) to s1
addi $a0, $s0, -2 # (n-2)
jal  fibonacci
add  $v0, $s1, $v0 # f(n-1)+f(n-2)


fibFinish:
# Restore Stack
lw $ra, 8($sp)
lw $s0, 4($sp)
lw $s1, 0($sp)
addi $sp, $sp, 12

jr $ra
## End fibonacci

equalToZero:
li $v0, 4
la $a0, message
syscall
