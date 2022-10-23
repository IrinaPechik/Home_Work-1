	# -8[rbp] -> r12d - j
	# -4[rbp] -> r11d - k
	# -24[rbp] - arr
	# -28[rbp] - length
	# -40[rbp] - B
	.file	"task.c"
	.intel_syntax noprefix
	.text									# начало новой секции	
	.globl	Task
	.type	Task, @function
Task:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi				# запись rdi в arr на позиции -24
	mov	DWORD PTR -28[rbp], esi				# запись esi в arr на позиции -28
	mov	QWORD PTR -40[rbp], rdx				# запись rdx в B на позиции -40
	mov r12d, 0							# запись 0 в j в регистр r12d
	mov	DWORD PTR -8[rbp], 0				# запись 0 в j на позиции -8
	cmp	DWORD PTR -28[rbp], 1				# сравнение length и 1
	jne	.L2									# если не равно => .L2
	mov	rax, QWORD PTR -24[rbp]				# записываем в rax arr
	mov	edx, DWORD PTR [rax]				# кладем значение командной строки в rax
	mov	rax, QWORD PTR -40[rbp]				# записываем в rax B
	mov	DWORD PTR [rax], edx				# кладем rax в значение командной строки
	mov r12d, 1								# запись 1 в j в регистр r12d
	mov	DWORD PTR -8[rbp], 1				# записываем в j единицу
	jmp	.L3
.L2:
	mov	r11d, 0								# записываем в k ноль
	jmp	.L4									# идем в .L4
.L5:
	mov	eax, r11d 							# записываем в eax k в регистр r11d
	cdqe								
	lea	rdx, 0[0+rax*4]						# записываем в rdx смещение в байтах на k
	mov	rax, QWORD PTR -24[rbp]				# запись &arr[0] в rax
	add	rax, rdx
	mov	ecx, DWORD PTR [rax]				# кладем значение командной строки в rax
	mov	eax, r11d							# записываем в eax k в регистр r11d
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*4]						# записываем в rdx смещение в байтах на k
	mov	rax, QWORD PTR -24[rbp]				# запись &arr[0] в rax
	add	rax, rdx
	mov	edx, DWORD PTR [rax]				# кладем значение командной строки в rax
	mov eax, r12d							# запись j в eax в регистр r12d
	mov	eax, DWORD PTR -8[rbp]				# записываем в eax j на позициии -4
	cdqe
	lea	rsi, 0[0+rax*4]						# записываем в rsi смещение в байтах на k
	mov	rax, QWORD PTR -40[rbp]				# запись &B[0] в rax
	add	rax, rsi
	add	edx, ecx
	mov	DWORD PTR [rax], edx				# кладем rax в значение командной строк
	mov r12d, 1								# запись 1 в j в регистр r12d
	add	DWORD PTR -8[rbp], 1				# смещение j на 1 позицию
	add	r11d, 1								# смещение k на 1 позицию
.L4:
	mov	eax, DWORD PTR -28[rbp]             # записываем в eax length
	sub	eax, 1
	cmp	r11d, eax				# сравниваем k и eax
	jl	.L5
.L3:
	mov eax, r12d						# запись j в eax в регистр r12d
	mov	eax, DWORD PTR -8[rbp]				# записываем в eax j
	pop	rbp
	ret										# выход
	.size	Task, .-Task
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
