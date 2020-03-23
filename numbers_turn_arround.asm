# Odwrocenie kolejnosci cyfr 

.data
	buffer: 	.space 256
	digit_buffer: 	.space 256
.text
	main:
		la $a0, buffer
		li $a1, 256
		li $v0, 8
		syscall
		
		jal strlen
		
		move $t1, $a0
		add $t1, $t1, -1	# index correction
		la $t0, digit_buffer
		
	first_loop:
		lbu $t2, ($t1)
		ble $t2, ' ', next
		blt $t2, '0', other
		bgt $t2, '9', other
		sb $t2, ($t0)
		addiu $t0, $t0, 1		
	
	other:
		addiu $t1, $t1, -1
		j first_loop
	
	next:
		la $t1, digit_buffer
		la $t0, buffer
		
	second_loop:
		lbu $t2, ($t0)
		ble $t2, ' ', exit
		blt $t2, '0', else
		bgt $t2, '9', else
		lbu $t3, ($t1)
		sb $t3, ($t0)
		addiu $t1, $t1, 1
	
	else:
		addiu $t0, $t0, 1
		j second_loop

	exit:
		la $a0, buffer	
		li $v0, 4
		syscall
		
		li $v0, 10
		syscall
	
	strlen:
		for_loop:
			lbu $t1, ($a0)
			ble $t1, ' ', exit_loop
			addi $a0, $a0, 1
			j for_loop
		exit_loop:
			jr $ra