.data
my_array: .word 4, 8, 15, 16, 23, 42
.text
addi $s1, $zero, 6 	# Len(list) 
la $s0, my_array    	# Loading the list

srl $s2, $s1, 1		#Divide len/2
sll $s3,$s2,1		#Mul the solution x 2

addi $t0 , $zero,-1	#Setting index as -1 (So in the first increment it will became 0)
addi $s4,$s2,1 		#Making len(list)/2 + 1 for odd solutions.
addi $s5,$s2,-1		#For loop's limit


beq $s1,$s3, Loop_for_even	#Checking the array for its odd or even.
j Loop_for_odd			#If false jump for odd one.

Loop_for_odd:			
	beq $t0,$s5,Exit
	addi $t1,$zero,0 	#Reset the variables each time
	addi $t3,$zero,0	
	addi $t0, $t0,1		#Incrementing i by 1
	sll $t1,$t0,2		#Getting first replacement element
    	add $t1,$s0,$t1		
    	add $t2,$s4,$t0		
    	sll $t3,$t2,2		#Getting second replacement element.
    	add $t3,$s0,$t3
    	lw $t4, 0($t3)		#Loading the first and second elements for their places to be swapped.
    	lw $t5, 0($t1)
    	sw $t4, 0($t1)		#Storing
    	sw $t5, 0($t3)
    	j Loop_for_odd
Loop_for_even:			#Same operations for odd one but this time we dont keep middle element fixed.
	beq $t0,$s5,Exit
	addi $t1,$zero,0
	addi $t3,$zero,0
	addi $t0, $t0,1
	sll $t1,$t0,2	
    	add $t1,$s0,$t1	
    	add $t2,$s2,$t0
    	sll $t3,$t2,2
    	add $t3,$s0,$t3
    	lw $t4, 0($t3)
    	lw $t5, 0($t1)
    	sw $t4, 0($t1)
    	sw $t5, 0($t3)
    	j Loop_for_even
Exit: