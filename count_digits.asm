# Podac liczbe cyfr wystêpujacych w ciagu znakowym

	.data
prompt: .asciiz "Przykladowy ciag znakow: "
result: .asciiz "\nIlosc cyfr: " 
test: 	.asciiz "2ad67-2190da"

	.text
main:
	la $s0, test
	la $s1, prompt
	li $s2, 0	# licznik
	
	la $a0, prompt
	li $v0, 4
	syscall		
	
	la $a0, test
	syscall
forloop:
	lbu $t0, ($s0)
	addiu $s0, $s0, 1
	beqz $t0, fin
	bltu $t0, '0', forloop
	bgtu $t0, '9', forloop
	addiu $s2, $s2, 1
	j forloop
fin:
	la $a0, result
	li $v0, 4
	syscall

	move $a0, $s2
	li $v0, 1
	syscall
exit:
	li $v0, 10
	syscall
	