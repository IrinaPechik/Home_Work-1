	# -212[rbp] - argc
	# -224[rbp] - argv
	# -196[rbp] - size_a
	# -192[rbp] - B
	# -112[rbp] - A
	# -24[rbp] - input
	# -4[rbp] - i
	# -16[rbp] - size_b
	# -32[rbp] - output
	# -8[rbp] - локальная i
	# -12[rbp] - локальная-локальная i
	
	.file	"main.c"
	.intel_syntax noprefix
	.text											# начинаем новую секцию 
	.section	.rodata								# .rodata, куда кладём:
	.align 8
.LC0:
	.string	"Input length (0 < length <= %d): "		# .LC0: "Input length (0 < length <= %d): "
.LC1:
	.string	"%d"									# .LC1: "%d"
.LC2:
	.string	"Incorrect length = %d\n"				# .LC2: "Incorrect length = %d\n"
.LC3:
	.string	"Enter the value of A[%d]: "			# .LC3: "Enter the value of A[%d]: "
.LC4:
	.string	"New array: "							# .LC4: "New array: "
.LC5:
	.string	"%d "									# .LC5: "%d "
.LC6:
	.string	"r"										# .LC6: "r"
.LC7:
	.string	"input.txt"								# .LC7: "input.txt"
.LC8:
	.string	"w"										# .LC8: "w"
.LC9:
	.string	"output.txt"							# .LC9: "output.txt"
	.align 8
.LC10:
	.string	"New array in file 'output.txt'"		# .LC10: "New array in file 'output.txt'"
	.align 8
.LC11:
	.string	"Randomized length of array A = %d \n"	# .LC11: "Randomized length of array A = %d \n"
	.align 8
.LC12:
	.string	"Randomized values of array A: "		# .LC12: "Randomized values of array A: "
	.text											# Начало новой секции
	.globl	main
	.type	main, @function
main:
	push	rbp										# / Сохраняем rbp на стек
	mov	rbp, rsp									# | rbp := rsp
	sub	rsp, 224									# \ rsp -= 224
	mov	DWORD PTR -212[rbp], edi 					# edi - первый аргумент - argc, записали его на стек, отступая от rbp на -212 (стек растёт вниз)
	mov	QWORD PTR -224[rbp], rsi					# rsi - второй аргумент - argv, записали его на стек, отступая от rbp на -224 (стек растёт вниз)

	cmp	DWORD PTR -212[rbp], 2						# сравнение argс с 2
	jne	.L2											# jump if not equal => .L2
	mov	rax, QWORD PTR -224[rbp]                    # записываем в eax на позиции -224 argv[1]
	add	rax, 8										# сам argv[1] лежит на позиции -216
	mov	rax, QWORD PTR [rax]						# значение, полученное из командной строки, записываем в  rax
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 1										# сравниваем с 1 eax
	jne	.L2											# jump if not equal => .L2
											
	mov	rax, QWORD PTR -224[rbp]					# записываем в eax на позиции -224 argv[1]
	add	rax, 8										# сам argv[1] лежит на позиции -216
	mov	rax, QWORD PTR [rax]						# значение, полученное из командной строки, записываем в  rax
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -196[rbp], eax					# rbp[-196] = eax, запись в size_a eax, на -196 позиции
	
	mov	esi, 20
	lea	rax, .LC0[rip]								
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT

	lea	rax, -196[rbp]								# rax := &(size_a) 
	mov	rsi, rax									# rsi := rax (2-й аргумент)
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT						# ввод пользователя

	mov	eax, DWORD PTR -196[rbp]					# записываем в eax, позиция которого -196, size_a
	test	eax, eax
	jle	.L3
	mov	eax, DWORD PTR -196[rbp]					# записываем в eax, позиция которого -196, size_a
	cmp	eax, 20										# сравнения size_a с максимальным возможным значением 20
	jle	.L4
.L3:
	mov	eax, DWORD PTR -196[rbp]					# записываем в eax, позиция которого -196, size_a
	mov	esi, eax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L27
.L4:
	mov	DWORD PTR -4[rbp], 0
	jmp	.L6
.L7:
	mov	eax, DWORD PTR -4[rbp]						# записываем i в eax, позиция которого -4
	mov	esi, eax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT

	mov	eax, DWORD PTR -4[rbp]						# записываем в eax на позиции -4 i
	cdqe
	lea	rdx, 0[0+rax*4]							    # байтовое смещение на i в rdx
	lea	rax, -112[rbp]								# запись  в rax &A[0]
	add	rax, rdx
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	DWORD PTR -4[rbp], 1					   # смещаем на 1 позицию i
.L6:
	mov	eax, DWORD PTR -196[rbp]				# запись в eax size_a на позиции -196
	cmp	DWORD PTR -4[rbp], eax					# сравнение size_a и i
	jl	.L7
	mov	ecx, DWORD PTR -196[rbp]				# передаём task size_a на позиции -196
	lea	rdx, -192[rbp]							# передаём task &В на позиции -192
	lea	rax, -112[rbp]							# передаём task &A на позиции -112
	mov	esi, ecx
	mov	rdi, rax
	call	Task@PLT
	mov	DWORD PTR -16[rbp], eax					# запись в size_b из eax на позиции -16
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -8[rbp], 0					# присваивание 0 локальной i с позицией -8
	jmp	.L8
.L9:
	mov	eax, DWORD PTR -8[rbp]					# записываем в eax локальной i с позицией -8
	cdqe
	mov	eax, DWORD PTR -192[rbp+rax*4]			# записываем  в eax B на позиции -192 смещения в байтах на локальную i
	mov	esi, eax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -8[rbp], 1					# присваивание 1 локальной i с позицией -8
.L8:
	mov	eax, DWORD PTR -8[rbp]					# записываем в eax локальную i с позицией -8
	cmp	eax, DWORD PTR -16[rbp]					# сравнение локально i с size_b
	jl	.L9
	mov	edi, 10
	call	putchar@PLT
	jmp	.L10
.L2:
	cmp	DWORD PTR -212[rbp], 3								# сравнение argс c 3
	jne	.L11												# jump if not equal => .L11
	mov	rax, QWORD PTR -224[rbp]							# запись в eax rgv[1], расположенной на -224 позиции
	add	rax, 8
	mov	rax, QWORD PTR [rax]								# значение, полученное из командной строки, записываем в  rax
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 2												# сравнение argv[1] c 2
	jne	.L11												# jump if not equal => .L11
	
	mov	rax, QWORD PTR -224[rbp]							# запись в eax rgv[1], расположенной на -224 позиции
	add	rax, 16
	mov	rax, QWORD PTR [rax]								# значение, полученное из командной строки, записываем в  rax
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -196[rbp], eax							# запись в size_a eax, расположенной на позиции -196
	
	mov	eax, DWORD PTR -196[rbp]							# запись локальной i в eax на позиции -196
	test	eax, eax
	jle	.L12
	mov	eax, DWORD PTR -196[rbp]
	cmp	eax, 20
	jle	.L13
.L12:
	mov	eax, DWORD PTR -196[rbp]							 # запись локальной i в eax на позиции -196
	mov	esi, eax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L27
.L13:
	lea	rax, .LC6[rip]
	mov	rsi, rax
	lea	rax, .LC7[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax							# запись в input rax на позиции -24
	mov	DWORD PTR -4[rbp], 0							# запись в i 0 на позиции -4
	jmp	.L14
.L15:
	mov	eax, DWORD PTR -4[rbp]							# запись в eax на позиции -4 локальной i 
	cdqe
	lea	rdx, 0[0+rax*4]									# запись смещения в байтах в rdx на i
	lea	rax, -112[rbp]									# запись &A[0] в rax
	add	rdx, rax
	mov	rax, QWORD PTR -24[rbp]							# запись в rax на позиции -24 input
	lea	rcx, .LC1[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	DWORD PTR -4[rbp], 1							# запись в i на позиции -4 единицы
.L14:
	mov	eax, DWORD PTR -196[rbp]						 # запись size_a в eax на позиции -292
	cmp	DWORD PTR -4[rbp], eax							 # запись в i на позиции -4 eax 
	jl	.L15
	mov	ecx, DWORD PTR -196[rbp]						  # передача task size_a на позиции -196
	lea	rdx, -192[rbp]									  # передача task &B на позиции -192
	lea	rax, -112[rbp]									  # передача task &A на позиции -112
	mov	esi, ecx
	mov	rdi, rax
	call	Task@PLT
	mov	DWORD PTR -16[rbp], eax                            # запись в size_b eax на позиции -16
	lea	rax, .LC8[rip]
	mov	rsi, rax
	lea	rax, .LC9[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax								# запись в output rax на позиции -32
	mov	DWORD PTR -4[rbp], 0								# запись в i на позиции -4 нуля
	jmp	.L16
.L17:
	mov	eax, DWORD PTR -4[rbp]								# запись локальной i в eax на позиции -4
	cdqe
	mov	edx, DWORD PTR -192[rbp+rax*4]						# запись в B на позиции -192 смещения в байтах на локальную i в eax
	mov	rax, QWORD PTR -32[rbp]								# запись в rax output на -32 позиции
	lea	rcx, .LC5[rip]							
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	DWORD PTR -4[rbp], 1								 # запись 1 в i на позиции -4
.L16:
	mov	eax, DWORD PTR -4[rbp]								 # запись в eax на позиции -4 локальной i
	cmp	eax, DWORD PTR -16[rbp]								 # сравнение в eax  size_b на позиции -16 с i
	jl	.L17
	lea	rax, .LC10[rip]
	mov	rdi, rax
	call	puts@PLT
	jmp	.L10
.L11:
	cmp	DWORD PTR -212[rbp], 2									# сравнение argc c 2
	jne	.L10													# jump if not equal => .L10
	mov	rax, QWORD PTR -224[rbp]								# запись в eax rgv[1], расположенной на -224 позиции
	add	rax, 8													
	mov	rax, QWORD PTR [rax]									# значение, полученное из командной строки, записываем в  rax
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 3
	jne	.L10
	mov	rax, QWORD PTR -224[rbp]								# запись в eax rgv[1], расположенной на -224 позиции
	add	rax, 8
	mov	rax, QWORD PTR [rax]									# значение, полученное из командной строки, записываем в  rax
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -196[rbp], eax								# запись в size_a eax, расположенной на позиции -196
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	DWORD PTR -196[rbp], 0									# присваиваем size_a, расположенной на - 196 позициии 0
	jmp	.L18
.L19:
	call	rand@PLT
	mov	DWORD PTR -196[rbp], eax					# запись eax в size_a на позиции -196
.L18:
	mov	eax, DWORD PTR -196[rbp]					# запись в eax size_a на -196 позиции
	test	eax, eax
	jle	.L19
	mov	eax, DWORD PTR -196[rbp]					# запись size_a в eax на -196 позиции 
	cmp	eax, 20
	jg	.L19
	mov	DWORD PTR -4[rbp], 0						# присваивание 0 i на -4 позиции
	jmp	.L20
.L22:
	call	rand@PLT
	mov	edx, DWORD PTR -4[rbp]			# запись в edx на позиции -4 локальной i
	movsx	rdx, edx
	mov	DWORD PTR -112[rbp+rdx*4], eax		# запись в eax в A на позиции -112 смещения в байтах на локальную i
	mov	eax, DWORD PTR -4[rbp]				# запись i в eax на позиции -4
	cdqe
	mov	eax, DWORD PTR -112[rbp+rax*4]		# запись eax в A на позиции -112 смещая в байтах на локальную i
	and	eax, 3
	test	eax, eax
	jne	.L21
	mov	eax, DWORD PTR -4[rbp]				# запись  в eax локальной i на позиции -4
	cdqe
	mov	edx, DWORD PTR -112[rbp+rax*4]		# запись eax в A на позиции -112 смещения в байтах на локальную i
	mov	eax, DWORD PTR -4[rbp]				# запись в eax локальной i на позиции -4
	cdqe
	mov	DWORD PTR -112[rbp+rax*4], edx
.L21:
	add	DWORD PTR -4[rbp], 1            # запись 1 в i на позиции -4
.L20:
	mov	eax, DWORD PTR -196[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L22
	mov	eax, DWORD PTR -196[rbp]
	mov	esi, eax
	lea	rax, .LC11[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, .LC12[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -4[rbp], 0			# присваивание нуля i на позиции -4 
	jmp	.L23
.L24:
	mov	eax, DWORD PTR -4[rbp]         # запись i в eax на позиции -4
	cdqe
	mov	eax, DWORD PTR -112[rbp+rax*4]
	mov	esi, eax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -4[rbp], 1			   # присваивание единички i на позиции -4
.L23:
	mov	eax, DWORD PTR -196[rbp]		   # запись в eax size_a на позиции -196
	cmp	DWORD PTR -4[rbp], eax			   # сравнивнение size_a и i
	jl	.L24
	mov	edi, 10
	call	putchar@PLT
	mov	ecx, DWORD PTR -196[rbp]  		   # запись в ecx size_a на позиции -196
	lea	rdx, -192[rbp]					   # передача task &B на позиции -192
	lea	rax, -112[rbp]					   # передача task &A на позиции -112
	mov	esi, ecx
	mov	rdi, rax
	call	Task@PLT
	mov	DWORD PTR -16[rbp], eax             # запись в size_b eax на позиции -16
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -12[rbp], 0				# запись 0 в локальную-локальную i на позиции -12
	jmp	.L25
.L26:
	mov	eax, DWORD PTR -12[rbp]				# запись локальной-локальной i на позиции -12
	cdqe
	mov	eax, DWORD PTR -192[rbp+rax*4]      # запись eax в B на позиции -192 смещения в байтах на локальную i
	mov	esi, eax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -12[rbp], 1				# запись 1 в  локальную-локальную i на позиции -12
.L25:
	mov	eax, DWORD PTR -12[rbp]             # запись локальной-локальной i на позиции -12
	cmp	eax, DWORD PTR -16[rbp]             # сравнение size_b в eax на позиции -16 с i
	jl	.L26
	mov	edi, 10
	call	putchar@PLT
.L10:
	mov	eax, 0								# return 0
.L27:
	leave									# /Выход из функции
	ret										# \
