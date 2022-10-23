	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Input length (0 < length <= %d): "
.LC1:
	.string	"%d"
.LC2:
	.string	"Incorrect length = %d\n"
.LC3:
	.string	"Enter the value of A[%d]: "
.LC4:
	.string	"New array: "
.LC5:
	.string	"%d "
.LC6:
	.string	"r"
.LC7:
	.string	"input.txt"
.LC8:
	.string	"w"
.LC9:
	.string	"output.txt"
	.align 8
.LC10:
	.string	"New array in file 'output.txt'"
	.align 8
.LC11:
	.string	"Randomized length of array A = %d \n"
	.align 8
.LC12:
	.string	"Randomized values of array A: "
.LC13:
	.string	"\n%f \320\274\320\270\320\273\320\273\320\270\321\201\320\265\320\272\321\203\320\275\320\264\n"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 240
	mov	DWORD PTR -228[rbp], edi
	mov	QWORD PTR -240[rbp], rsi
	cmp	DWORD PTR -228[rbp], 2
	jne	.L2
	mov	rax, QWORD PTR -240[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 1
	jne	.L2
	mov	rax, QWORD PTR -240[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -212[rbp], eax
	mov	esi, 20
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, -212[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -212[rbp]
	test	eax, eax
	jle	.L3
	mov	eax, DWORD PTR -212[rbp]
	cmp	eax, 20
	jle	.L4
.L3:
	mov	eax, DWORD PTR -212[rbp]
	mov	esi, eax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L29
.L4:
	mov	DWORD PTR -4[rbp], 0
	jmp	.L6
.L7:
	mov	eax, DWORD PTR -4[rbp]
	mov	esi, eax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, -128[rbp]
	add	rax, rdx
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	DWORD PTR -4[rbp], 1
.L6:
	mov	eax, DWORD PTR -212[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L7
	mov	ecx, DWORD PTR -212[rbp]
	lea	rdx, -208[rbp]
	lea	rax, -128[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	Task@PLT
	mov	DWORD PTR -16[rbp], eax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -8[rbp], 0
	jmp	.L8
.L9:
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	mov	eax, DWORD PTR -208[rbp+rax*4]
	mov	esi, eax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -8[rbp], 1
.L8:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -16[rbp]
	jl	.L9
	mov	edi, 10
	call	putchar@PLT
	jmp	.L10
.L2:
	cmp	DWORD PTR -228[rbp], 3
	jne	.L11
	mov	rax, QWORD PTR -240[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 2
	jne	.L11
	mov	rax, QWORD PTR -240[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -212[rbp], eax
	mov	eax, DWORD PTR -212[rbp]
	test	eax, eax
	jle	.L12
	mov	eax, DWORD PTR -212[rbp]
	cmp	eax, 20
	jle	.L13
.L12:
	mov	eax, DWORD PTR -212[rbp]
	mov	esi, eax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L29
.L13:
	lea	rax, .LC6[rip]
	mov	rsi, rax
	lea	rax, .LC7[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L14
.L15:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, -128[rbp]
	add	rdx, rax
	mov	rax, QWORD PTR -24[rbp]
	lea	rcx, .LC1[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	DWORD PTR -4[rbp], 1
.L14:
	mov	eax, DWORD PTR -212[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L15
	mov	ecx, DWORD PTR -212[rbp]
	lea	rdx, -208[rbp]
	lea	rax, -128[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	Task@PLT
	mov	DWORD PTR -16[rbp], eax
	lea	rax, .LC8[rip]
	mov	rsi, rax
	lea	rax, .LC9[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L16
.L17:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	edx, DWORD PTR -208[rbp+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	lea	rcx, .LC5[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	DWORD PTR -4[rbp], 1
.L16:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -16[rbp]
	jl	.L17
	lea	rax, .LC10[rip]
	mov	rdi, rax
	call	puts@PLT
	jmp	.L10
.L11:
	cmp	DWORD PTR -228[rbp], 2
	jne	.L10
	mov	rax, QWORD PTR -240[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 3
	jne	.L10
	mov	rax, QWORD PTR -240[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -212[rbp], eax
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	DWORD PTR -212[rbp], 0
	jmp	.L18
.L19:
	call	rand@PLT
	mov	DWORD PTR -212[rbp], eax
.L18:
	mov	eax, DWORD PTR -212[rbp]
	test	eax, eax
	jle	.L19
	mov	eax, DWORD PTR -212[rbp]
	cmp	eax, 20
	jg	.L19
	mov	DWORD PTR -4[rbp], 0
	jmp	.L20
.L22:
	call	rand@PLT
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	mov	DWORD PTR -128[rbp+rdx*4], eax
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	eax, DWORD PTR -128[rbp+rax*4]
	and	eax, 3
	test	eax, eax
	jne	.L21
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	edx, DWORD PTR -128[rbp+rax*4]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	DWORD PTR -128[rbp+rax*4], edx
.L21:
	add	DWORD PTR -4[rbp], 1
.L20:
	mov	eax, DWORD PTR -212[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L22
	mov	eax, DWORD PTR -212[rbp]
	mov	esi, eax
	lea	rax, .LC11[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, .LC12[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L23
.L24:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	eax, DWORD PTR -128[rbp+rax*4]
	mov	esi, eax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -4[rbp], 1
.L23:
	mov	eax, DWORD PTR -212[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L24
	mov	edi, 10
	call	putchar@PLT
	mov	ecx, DWORD PTR -212[rbp]
	lea	rdx, -208[rbp]
	lea	rax, -128[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	Task@PLT
	mov	DWORD PTR -16[rbp], eax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -12[rbp], 0
	jmp	.L25
.L26:
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	mov	eax, DWORD PTR -208[rbp+rax*4]
	mov	esi, eax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -12[rbp], 1
.L25:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR -16[rbp]
	jl	.L26
	mov	edi, 10
	call	putchar@PLT
.L10:
	call	clock@PLT
	mov	QWORD PTR -40[rbp], rax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L27
.L28:
	mov	ecx, DWORD PTR -212[rbp]
	lea	rdx, -208[rbp]
	lea	rax, -128[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	Task@PLT
	mov	DWORD PTR -16[rbp], eax
	add	DWORD PTR -4[rbp], 1
.L27:
	cmp	DWORD PTR -4[rbp], 1999999
	jle	.L28
	call	clock@PLT
	mov	QWORD PTR -48[rbp], rax
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	difftime@PLT
	movq	rax, xmm0
	movq	xmm0, rax
	lea	rax, .LC13[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
.L29:
	leave
	ret
