# Wypisywanie najd³u¿szego ci¹gu cyfr znalezionego w ³añcuchu wejœciowym

.data
	buf: .space 256
	

.text
	main:
		la $a0, buf
		li $a1, 256
		li $v0, 8
		syscall
		
		la $s4, buf
		li $s0, 0 	# longest sequence
		li $s1, 0	# counter
		li $s2, 0 	# start index
		li $s3, 0	# end index
	for:
		lbu $t1, 0($s4)
		blt $t1, '0', else
		bgt $t1, '9', else
		addiu $s1, $s1, 1
		addiu $s4, $s4, 1
		j for
	else:
		ble $s1, $s0, end_else
		move $s0, $s1
		move $s3, $s4
		sub $s2, $s3, $s1
	end_else:
		li $s1, 0
		addiu $s4, $s4, 1
		beq $t1, $zero, end
		j for
	end:
		li $v0, 11	
	print_result:
		bge $s2, $s3, exit
		lbu $a0, ($s2)
		syscall
		addiu $s2, $s2, 1
		j print_result
	exit:
		li $v0, 10
		syscall		
		
			
		
		
