# Zamien liczby na ich dopelnienia do 9 ( 1->8, 2->7 itd.)

.data
	buf: .space 256

.text
	main:
		la $a0, buf
		li $a1, 256
		li $v0, 8
		syscall

		la $t0, buf
		li $t2, 105
	for:
		lbu $t1, 0($t0)
		beq $t1, $zero, exit
		blt $t1, '0', else
		bgt $t1, '9', else
		sub $t3, $t2, $t1
		sb  $t3, ($t0)
	else:
		addiu $t0, $t0, 1
		j for
	exit:
		la $a0, buf
		li $v0, 4
		syscall
		
		li $v0, 10
		syscall  
