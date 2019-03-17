#A�list is defined here
.data
my_array: .word 42,23, 16, 15, 8, 4 #I think you gave wrong namings to answer2 and answer1 templates. So I changed the arrays. 
.text
la $s0, my_array    	#based address of list loaded into $s0
addi $s1, $zero, 6 	#$s1 is set to the size of the list 

# Now you have the size and the base address of the list
# Continue to write your code here

addi $t1 , $zero, 1  		#Defining i for for loop i = 1

ForLoop:
	beq $t1, $s1, Exit	#for i in range (1,len(array)):
	mul $t2 , $t1 , 4  	#Getting index'th element from array.
    	add $t2 ,$s0 , $t2  
    	lw $t0, 0($t2)         	#Key = array[i]
    	addi $t3, $t1 , -1	#J = i-1
	j WhileLoop

WhileLoop:
	blt $t3,$zero, ForLoopExt #while j>=0
	mul $t4 , $t3 , 4  	
    	add $t4 ,$s0 , $t4  
    	lw $t5, 0($t4)
	blt $t5, $t0, ForLoopExt  #While key < array[j]
	addi $t6, $t3, 1	  #t6 = j + 1

	sll $t7,$t6,2		  #array[j+1] = array [j]
    	add $t7,$s0,$t7
    	sw $t5, 0($t7)
	
	addi $t3, $t3, -1  	  #j = j-1
	j WhileLoop	
	
ForLoopExt:
	addi $t3,$t3,1		  #j= j +1
	sll $t7,$t3,2		  #array[j+1] = key
    	add $t7,$s0,$t7
    	sw $t0, 0($t7)
    	
    	addi $t1,$t1,1    	  #i = i + 1
    	
	j ForLoop

Exit:	


