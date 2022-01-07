.data
	#area para dados da memoria principal
	msgmes: .asciiz "Entre com o mes (MM): "
	minvalido: .asciiz "\nMes invalido.\n"
	msgdia: .asciiz "Entre com o dia (DD): "
	dinvalido: .asciiz "\nDia invalido.\n"
	msgano: .asciiz "Entre com o ano (AAAA): "
	ainvalido: .asciiz "\nAno invalido.\n"
	saida: .asciiz "Data Atual: "
	barra: .byte '/' 
	quebra: .asciiz "\n"

.text 
.globl main
main:
	#area para instrucoes do programa
	#esse programa monta uma data com as informacoes inseridas
	
	mes:
	li $v0,4 #instrucao para impressao de string
	la $a0,msgmes #indicar o endereco que esta a mensagem
	syscall #imprimir
	
	li $v0,5 #leitura de inteiros
	syscall
	
	move $t1,$v0 #colocando o valor de int em t1
	li $t2,12
	li $t3,1
	
	bge $t1, $t3, f1
	li $v0,4 #instrucao para impressao de string
	la $a0,minvalido #indicar o endereco que esta a mensagem
	syscall #imprimir
	j mes
	
	f1:
	ble $t1,$t2, f2
	li $v0,4 #instrucao para impressao de string
	la $a0,minvalido #indicar o endereco que esta a mensagem
	syscall #imprimir
	j mes
	
	f2:
	dia:
	li $v0,4 #instrucao para impressao de string
	la $a0,msgdia #indicar o endereco que esta a mensagem
	syscall #imprimir
	
	li $t2,31
	
	li $v0,5 #leitura de inteiros
	syscall
	move $t4,$v0 #colocando o valor de int em t4
	
	bge $t4, $t3, f3
	li $v0,4 #instrucao para impressao de string
	la $a0,dinvalido #indicar o endereco que esta a mensagem
	syscall #imprimir
	j dia
	
	f3:
	ble $t4,$t2, f4
	li $v0,4 #instrucao para impressao de string
	la $a0,dinvalido #indicar o endereco que esta a mensagem
	syscall #imprimir
	j dia
	
	f4:
	ano:
	li $v0,4 #instrucao para impressao de string
	la $a0,msgano #indicar o endereco que esta a mensagem
	syscall #imprimir
	
	li $v0,5 #leitura de inteiros
	syscall
	
	move $t6,$v0 #colocando o valor de int em t2
	
	li $t3,1980
	li $t2,2050
	
	bge $t6, $t3, f5
	li $v0,4 #instrucao para impressao de string
	la $a0,ainvalido #indicar o endereco que esta a mensagem
	syscall #imprimir
	j ano
	
	f5:
	ble $t6,$t2, f6
	li $v0,4 #instrucao para impressao de string
	la $a0,ainvalido #indicar o endereco que esta a mensagem
	syscall #imprimir
	j ano
	
	f6:
	li $v0,4 #imprimir char
	la $a0,quebra
	syscall
	
	li $v0,4 #instrucao para impressao de string
	la $a0,saida #indicar o endereco que esta a mensagem
	syscall #imprimir
	
	li $v0,1 #imprimir inteiros
	move $a0,$t1
	syscall
	
	li $v0,4 #imprimir char
	la $a0,barra
	syscall
	
	li $v0,1 #imprimir inteiros
	move $a0,$t4
	syscall
	
	li $v0,4 #imprimir char
	la $a0,barra
	syscall
	
	li $v0,1 #imprimir inteiros
	move $a0,$t6
	syscall
	
	li $v0,10
	
	
	
