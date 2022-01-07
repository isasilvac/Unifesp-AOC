.data 
	#area para dados na memoria principal
	msg: .asciiz "Insira a mensagem: "
	msg1: .asciiz "Numero total de caracteres: "
	msg3: .asciiz "Mensagem criptografada: "
	entrada: .space 1000	#variavel para armazenar a string
	nextLine: .asciiz   "\n"
.text 
	#area para instrucoes no programa
.globl main

main:
	li $v0, 4		#instrucao para impressao de String ou char
	la $a0, msg		#passando endereco da mensagem
	syscall
	
	li $v0, 8 		#instrucao para leitura de String
	la $a0, entrada		#passando endereco da variavel que armazenara a entrada
	la $a1, 1000		#indicando a qntde de caractere lido
	syscall

  	move $t1, $a0 		#movendo o vetor de string para um registrador temporario
  	
while:
	lb $t2, ($t1)		#carregando t2 com o conteudo do vetor na posicao t1, inicialmente 0
	beqz $t2, exit 		#condicional para sair do while quando for 0 na posicao t1 do vetor
	
	addi $t3,$t3,1		#incrementando t3 a cada iteracao para obter o tamanho da string
	
  	#aqui comeca a checagem das letras que serao criptografadas
  	beq $t2, 'o', letterO	#caso a letra seja 'o' va para o comando depois de letter0
	beq $t2, 'O', letterO	#o mesmo procedimento para todas as letras ou numeros abaixo
	
	beq $t2, 'i', letterI
	beq $t2, 'I', letterI
	
	beq $t2, 'z', letterZ
	beq $t2, 'Z', letterZ
	
	beq $t2, 'e', letterE
	beq $t2, 'E', letterE
	
	beq $t2, 'a', letterA
	beq $t2, 'A', letterA
		
	beq $t2, 's', letterS
	beq $t2, 'S', letterS
		
	beq $t2, 'g', letterG
	beq $t2, 'G', letterG
		
	beq $t2, 't', letterT
	beq $t2, 'T', letterT
		
	beq $t2, 'b', letterB
	beq $t2, 'B', letterB
	
	beq $t2, 'p', letterP
	beq $t2, 'P', letterP
		
	beq $t2, '0', number0
		
	beq $t2, '1', number1
		
	beq $t2, '2', number2
		
	beq $t2, '3', number3
		
	beq $t2, '4', number4
		
	beq $t2, '5', number5
		
	beq $t2, '6', number6
		
	beq $t2, '7', number7
		
	beq $t2, '8', number8
		
	beq $t2, '9', number9
	
	nextIndex:		#incrementando o indice do vetor de strings
	addi $t1,$t1,1				
	j while
	
	#aqui comeca a criptografia das letras
	letterO: 
  	li $t4, '0'		#carregando t4 com a letra ou numero que fara a criptografia
  	sb $t4, ($t1)		#substituindo no vetor de strings
  	j nextIndex		#saltando para o comando de pular o indice
  	
  	letterI: 		#o mesmo ocorre para todas as letras ou numeros abaixo
  	li $t4, '1'
  	sb $t4, ($t1)
  	j nextIndex
  	
  	letterZ:
  	li $t4, '2'
  	sb $t4, ($t1)
  	j nextIndex
		
	letterE: 
  	li $t4, '3'
  	sb $t4, ($t1)
  	j nextIndex
  	
  	letterA:
  	li $t4, '4'
  	sb $t4, ($t1)
  	j nextIndex
  	
  	letterS: 
  	li $t4, '5'
  	sb $t4, ($t1)
  	j nextIndex
  	
  	letterG: 
  	li $t4, '6'
  	sb $t4, ($t1)
  	j nextIndex
		
	  letterT:
  	li $t4, '7'
  	sb $t4, ($t1)
  	j nextIndex
  	
  	  letterB:
  	li $t4, '8'
  	sb $t4, ($t1)
  	j nextIndex
  	
  	letterP: 
  	li $t4, '9'
  	sb $t4, ($t1)
  	j nextIndex


	number0: 
  	li $t4, 'O'
  	sb $t4, ($t1)
  	j nextIndex
  	
	number1: 
  	li $t4, 'I'
  	sb $t4, ($t1)
  	j nextIndex
  	
	number2: 
  	li $t4, 'Z'
  	sb $t4, ($t1)
  	j nextIndex
  	
	number3: 
  	li $t4, 'E'
  	sb $t4, ($t1)
  	j nextIndex
  	
	number4: 
  	li $t4, 'A'
  	sb $t4, ($t1)
  	j nextIndex
  	
	number5: 
  	li $t4, 'S'
  	sb $t4, ($t1)
  	j nextIndex
  	
	number6: 
  	li $t4, 'G'
  	sb $t4, ($t1)
  	j nextIndex
  	
	number7: 
  	li $t4, 'T'
  	sb $t4, ($t1)
  	j nextIndex
  	
	number8: 
  	li $t4, 'B'
  	sb $t4, ($t1)
  	j nextIndex
  	
	number9: 
  	li $t4, 'P'
  	sb $t4, ($t1)
  	j nextIndex
  	
exit:				#saindo do laco while
	sub $t3,$t3,1		#decrementando 1 do registrador que guarda o tamanho da string
	
	li $v0, 4		#instrucao para impressao de String ou char
	la $a0, msg1		#passando o endereco da mensagem msg1
	syscall
			
	addi $v0, $0, 1		#instrucao para impressao de inteiro
	move $a0, $t3		#passando o valor do tamanho da string armazenado em t3 para t4
	syscall	
	
	li $v0, 4		#instrucao para impressao de string ou char
	la $a0, nextLine	#passando o endereco da variavel que armazena a quebra de linha
	syscall		
	
	li $v0, 4		#instrucao para impressao de string ou char
  	la $a0, msg3		#passando o endereco da mensagem msg3
  	syscall
  
  	li $v0, 4		#instrucao para impressao de string ou char
  	la $a0, entrada		#passando o endereco do vetor de string
  	syscall
	
	#fim da main
	#encerrando o programa
	li $v0, 10
 	syscall