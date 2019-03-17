#A�list is defined here
.data
my_array: .word 6, 17, 11, 16, 4, 7 #I think you gave wrong namings to answer2 and answer1 templates. So I changed the arrays.
.text
la $s0, my_array    	# based address of list loaded into $s0
addi $s1, $zero, 6 	#$s1 is set to the size of the list 

# Now you have the size and the base address of the list
# Continue to write your code here

addi $t0,$zero,0    		#index = 0

ForLoop:
	beq $t0, $s1, Exit	#For i in range (0,len(array)):
	mul $t1 , $t0 , 4  	#Getting index'th element from array.
    	add $t1 ,$s0 , $t1  
    	lw $a2, 0($t1)
	

    	jal is_prime      	# Call procedure
    	add $t2,$zero,$v0   	# Take the return value from $v0
    	
    	sll $t1,$t0,2		#Writing the returned value
    	add $t1,$s0,$t1
    	sw $t2, 0($t1)
    	
    	addi $t0,$t0,1		#index = index + 1
    	j ForLoop
    	
is_prime:
	addi $s3,$zero 2   	#is_prime's i = 2
    	j L0
    	L0:
    		beq $s3, $a2, L2
    		div $t7, $a2, $s3   	#Division with x/i
		mfhi $t4                #Getting the remainder
		beq $t4, $zero, L1	#Checking the remainder = 0
    		addi $s3, $s3, 1 	#i = i + 1
    		j L0	
    	L1:
    		addi $v0 , $zero ,0	#return output 0
    		jr $ra
    	L2:
    		addi $v0 , $zero ,1	#return output 1
    		jr $ra
	
Exit: