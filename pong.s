	.file	"pong.c"
.lcomm difficulty,4,4
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "%c\0"
.LC1:
	.ascii "Player 1: %d     Player 2: %d\0"
	.align 8
.LC2:
	.ascii "Left score: %d            Right score: %d\0"
	.align 8
.LC3:
	.ascii "Left score: %d          Right score: %d\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$168, %rsp
	.seh_stackalloc	168
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	call	__main
	movb	$124, -5(%rbp)
	leaq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	ftime
	movb	$111, -6(%rbp)
	movb	$32, -7(%rbp)
	movl	$1, -12(%rbp)
	movl	$190, -16(%rbp)
	movl	$16, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 24(%rbp)
	movl	24(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	$16, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 20(%rbp)
	movl	20(%rbp), %eax
	movl	%eax, -24(%rbp)
	movb	$106, -25(%rbp)
	movl	$17, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 16(%rbp)
	movl	$16, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 12(%rbp)
	movl	16(%rbp), %eax
	movl	%eax, 8(%rbp)
	movzwl	-56(%rbp), %eax
	movzwl	%ax, %eax
	movl	%eax, -32(%rbp)
	movl	-32(%rbp), %eax
	movl	%eax, -36(%rbp)
	movl	12(%rbp), %eax
	movl	%eax, 4(%rbp)
	movl	$0, 0(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, %ecx
	call	time
	movl	%eax, %ecx
	call	srand
	call	rand
	movl	%eax, -40(%rbp)
	call	initGame
	movsbl	-6(%rbp), %edx
	movsbl	-5(%rbp), %eax
	movl	20(%rbp), %r8d
	movl	24(%rbp), %ecx
	movl	%r8d, %r9d
	movl	%ecx, %r8d
	movl	%eax, %ecx
	call	generateGame
	call	ncwrap_stdscr
	movq	%rax, %rcx
	call	wrefresh
	movl	-40(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L2
	addl	$1, 16(%rbp)
	jmp	.L3
.L2:
	subl	$1, 16(%rbp)
.L3:
	movsbl	-6(%rbp), %ecx
	movl	16(%rbp), %edx
	movl	12(%rbp), %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	call	ncwrap_stdscr
	movq	%rax, %rcx
	call	wrefresh
.L47:
	movl	$17, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, %ecx
	movl	0(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%eax, 32(%rsp)
	movl	%edx, %r9d
	leaq	.LC1(%rip), %r8
	movl	%ecx, %edx
	movl	$1, %ecx
	call	mvprintw
	leaq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	ftime
	movzwl	-56(%rbp), %eax
	movzwl	%ax, %eax
	movl	%eax, -32(%rbp)
	call	ncwrap_stdscr
	movl	$0, %edx
	movq	%rax, %rcx
	call	wtimeout
	call	ncwrap_stdscr
	movq	%rax, %rcx
	call	wgetch
	movb	%al, -25(%rbp)
	call	ncwrap_stdscr
	movq	%rax, %rcx
	call	wrefresh
	cmpb	$119, -25(%rbp)
	jne	.L4
	cmpl	$4, 24(%rbp)
	jle	.L4
	movl	24(%rbp), %eax
	movl	%eax, -20(%rbp)
	subl	$1, 24(%rbp)
	movsbl	-7(%rbp), %r9d
	movsbl	-5(%rbp), %eax
	movl	-20(%rbp), %r8d
	movl	24(%rbp), %edx
	movl	-12(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movl	%eax, %ecx
	call	drawPaddle
.L4:
	cmpb	$115, -25(%rbp)
	jne	.L5
	movl	$16, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	subl	$3, %eax
	cmpl	24(%rbp), %eax
	jle	.L5
	movl	24(%rbp), %eax
	movl	%eax, -20(%rbp)
	addl	$1, 24(%rbp)
	movsbl	-7(%rbp), %r9d
	movsbl	-5(%rbp), %eax
	movl	-20(%rbp), %r8d
	movl	24(%rbp), %edx
	movl	-12(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movl	%eax, %ecx
	call	drawPaddle
.L5:
	cmpb	$108, -25(%rbp)
	jne	.L6
	movl	$16, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	subl	$3, %eax
	cmpl	20(%rbp), %eax
	jle	.L6
	movl	20(%rbp), %eax
	movl	%eax, -24(%rbp)
	addl	$1, 20(%rbp)
	movsbl	-7(%rbp), %r9d
	movsbl	-5(%rbp), %eax
	movl	-24(%rbp), %r8d
	movl	20(%rbp), %edx
	movl	-16(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movl	%eax, %ecx
	call	drawPaddle
.L6:
	cmpb	$111, -25(%rbp)
	jne	.L7
	cmpl	$4, 20(%rbp)
	jle	.L7
	movl	20(%rbp), %eax
	movl	%eax, -24(%rbp)
	subl	$1, 20(%rbp)
	movsbl	-7(%rbp), %r9d
	movsbl	-5(%rbp), %eax
	movl	-24(%rbp), %r8d
	movl	20(%rbp), %edx
	movl	-16(%rbp), %ecx
	movl	%ecx, 32(%rsp)
	movl	%eax, %ecx
	call	drawPaddle
.L7:
	movl	-16(%rbp), %eax
	subl	$1, %eax
	cmpl	16(%rbp), %eax
	jne	.L8
	movl	12(%rbp), %eax
	cmpl	20(%rbp), %eax
	jne	.L9
	movsbl	-7(%rbp), %ecx
	movl	16(%rbp), %edx
	movl	12(%rbp), %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	movl	16(%rbp), %eax
	movl	%eax, 8(%rbp)
	subl	$1, 16(%rbp)
	jmp	.L8
.L9:
	movl	20(%rbp), %eax
	subl	$1, %eax
	cmpl	12(%rbp), %eax
	je	.L10
	movl	20(%rbp), %eax
	subl	$2, %eax
	cmpl	12(%rbp), %eax
	je	.L10
	movl	20(%rbp), %eax
	subl	$3, %eax
	cmpl	12(%rbp), %eax
	je	.L10
	movl	20(%rbp), %eax
	subl	$4, %eax
	cmpl	12(%rbp), %eax
	jne	.L11
.L10:
	movsbl	-7(%rbp), %ecx
	movl	16(%rbp), %edx
	movl	12(%rbp), %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	movl	16(%rbp), %eax
	movl	%eax, 8(%rbp)
	movl	12(%rbp), %eax
	movl	%eax, 4(%rbp)
	subl	$1, 16(%rbp)
	subl	$1, 12(%rbp)
	jmp	.L8
.L11:
	movl	20(%rbp), %eax
	addl	$1, %eax
	cmpl	12(%rbp), %eax
	je	.L12
	movl	20(%rbp), %eax
	addl	$2, %eax
	cmpl	12(%rbp), %eax
	je	.L12
	movl	20(%rbp), %eax
	addl	$3, %eax
	cmpl	12(%rbp), %eax
	je	.L12
	movl	20(%rbp), %eax
	addl	$4, %eax
	cmpl	12(%rbp), %eax
	jne	.L13
.L12:
	movsbl	-7(%rbp), %ecx
	movl	16(%rbp), %edx
	movl	12(%rbp), %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	movl	16(%rbp), %eax
	movl	%eax, 8(%rbp)
	movl	12(%rbp), %eax
	movl	%eax, 4(%rbp)
	subl	$1, 16(%rbp)
	addl	$1, 12(%rbp)
	jmp	.L8
.L13:
	addl	$1, 0(%rbp)
	call	ncwrap_stdscr
	movq	%rax, %rcx
	call	werase
	movl	$17, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, %ebx
	movl	$16, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, %ecx
	movl	0(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%eax, 32(%rsp)
	movl	%edx, %r9d
	leaq	.LC2(%rip), %r8
	movl	%ebx, %edx
	call	mvprintw
	call	ncwrap_stdscr
	movq	%rax, %rcx
	call	wrefresh
	movl	$1500, %ecx
	call	delay
	call	ncwrap_stdscr
	movq	%rax, %rcx
	call	werase
	movl	24(%rbp), %eax
	subl	$3, %eax
	movl	%eax, 28(%rbp)
	jmp	.L14
.L15:
	movsbl	-7(%rbp), %edx
	movl	28(%rbp), %eax
	movl	%edx, %r9d
	leaq	.LC0(%rip), %r8
	movl	$1, %edx
	movl	%eax, %ecx
	call	mvprintw
	addl	$1, 28(%rbp)
.L14:
	movl	24(%rbp), %eax
	addl	$3, %eax
	cmpl	28(%rbp), %eax
	jge	.L15
	movl	20(%rbp), %eax
	subl	$3, %eax
	movl	%eax, 28(%rbp)
	jmp	.L16
.L17:
	movsbl	-7(%rbp), %ebx
	movl	$17, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	movl	28(%rbp), %eax
	movl	%ebx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	addl	$1, 28(%rbp)
.L16:
	movl	20(%rbp), %eax
	addl	$3, %eax
	cmpl	28(%rbp), %eax
	jge	.L17
	movsbl	-7(%rbp), %ecx
	movl	16(%rbp), %edx
	movl	12(%rbp), %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	movl	$17, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 16(%rbp)
	movl	$16, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 12(%rbp)
	movl	$16, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 24(%rbp)
	movl	$16, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 20(%rbp)
	movl	24(%rbp), %eax
	subl	$3, %eax
	movl	%eax, 28(%rbp)
	jmp	.L18
.L19:
	movsbl	-5(%rbp), %edx
	movl	28(%rbp), %eax
	movl	%edx, %r9d
	leaq	.LC0(%rip), %r8
	movl	$1, %edx
	movl	%eax, %ecx
	call	mvprintw
	addl	$1, 28(%rbp)
.L18:
	movl	24(%rbp), %eax
	addl	$3, %eax
	cmpl	28(%rbp), %eax
	jge	.L19
	movl	20(%rbp), %eax
	subl	$3, %eax
	movl	%eax, 28(%rbp)
	jmp	.L20
.L21:
	movsbl	-5(%rbp), %ebx
	movl	$17, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	movl	28(%rbp), %eax
	movl	%ebx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	addl	$1, 28(%rbp)
.L20:
	movl	20(%rbp), %eax
	addl	$3, %eax
	cmpl	28(%rbp), %eax
	jge	.L21
	movl	-40(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L22
	addl	$1, 16(%rbp)
	jmp	.L8
.L22:
	subl	$1, 16(%rbp)
.L8:
	movl	-12(%rbp), %eax
	addl	$1, %eax
	cmpl	16(%rbp), %eax
	jne	.L23
	movl	12(%rbp), %eax
	cmpl	24(%rbp), %eax
	jne	.L24
	movsbl	-7(%rbp), %ecx
	movl	16(%rbp), %edx
	movl	12(%rbp), %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	movl	16(%rbp), %eax
	movl	%eax, 8(%rbp)
	addl	$1, 16(%rbp)
	jmp	.L23
.L24:
	movl	24(%rbp), %eax
	subl	$1, %eax
	cmpl	12(%rbp), %eax
	je	.L25
	movl	24(%rbp), %eax
	subl	$2, %eax
	cmpl	12(%rbp), %eax
	je	.L25
	movl	24(%rbp), %eax
	subl	$3, %eax
	cmpl	12(%rbp), %eax
	je	.L25
	movl	24(%rbp), %eax
	subl	$4, %eax
	cmpl	12(%rbp), %eax
	jne	.L26
.L25:
	movsbl	-7(%rbp), %ecx
	movl	16(%rbp), %edx
	movl	12(%rbp), %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	movl	16(%rbp), %eax
	movl	%eax, 8(%rbp)
	movl	12(%rbp), %eax
	movl	%eax, 4(%rbp)
	addl	$1, 16(%rbp)
	subl	$1, 12(%rbp)
	jmp	.L23
.L26:
	movl	24(%rbp), %eax
	addl	$1, %eax
	cmpl	12(%rbp), %eax
	je	.L27
	movl	24(%rbp), %eax
	addl	$2, %eax
	cmpl	12(%rbp), %eax
	je	.L27
	movl	24(%rbp), %eax
	addl	$3, %eax
	cmpl	12(%rbp), %eax
	je	.L27
	movl	24(%rbp), %eax
	addl	$4, %eax
	cmpl	12(%rbp), %eax
	jne	.L28
.L27:
	movsbl	-7(%rbp), %ecx
	movl	16(%rbp), %edx
	movl	12(%rbp), %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	movl	16(%rbp), %eax
	movl	%eax, 8(%rbp)
	movl	12(%rbp), %eax
	movl	%eax, 4(%rbp)
	addl	$1, 16(%rbp)
	addl	$1, 12(%rbp)
	jmp	.L23
.L28:
	addl	$1, -4(%rbp)
	call	ncwrap_stdscr
	movq	%rax, %rcx
	call	werase
	movl	$17, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, %ebx
	movl	$16, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, %ecx
	movl	0(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%eax, 32(%rsp)
	movl	%edx, %r9d
	leaq	.LC3(%rip), %r8
	movl	%ebx, %edx
	call	mvprintw
	call	ncwrap_stdscr
	movq	%rax, %rcx
	call	wrefresh
	movl	$1500, %ecx
	call	delay
	call	ncwrap_stdscr
	movq	%rax, %rcx
	call	werase
	movl	24(%rbp), %eax
	subl	$3, %eax
	movl	%eax, 28(%rbp)
	jmp	.L29
.L30:
	movsbl	-7(%rbp), %edx
	movl	28(%rbp), %eax
	movl	%edx, %r9d
	leaq	.LC0(%rip), %r8
	movl	$1, %edx
	movl	%eax, %ecx
	call	mvprintw
	addl	$1, 28(%rbp)
.L29:
	movl	24(%rbp), %eax
	addl	$3, %eax
	cmpl	28(%rbp), %eax
	jge	.L30
	movl	20(%rbp), %eax
	subl	$3, %eax
	movl	%eax, 28(%rbp)
	jmp	.L31
.L32:
	movsbl	-7(%rbp), %ebx
	movl	$17, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	movl	28(%rbp), %eax
	movl	%ebx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	addl	$1, 28(%rbp)
.L31:
	movl	20(%rbp), %eax
	addl	$3, %eax
	cmpl	28(%rbp), %eax
	jge	.L32
	movsbl	-7(%rbp), %ecx
	movl	16(%rbp), %edx
	movl	12(%rbp), %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	movl	$17, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 16(%rbp)
	movl	$16, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 12(%rbp)
	movl	$16, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 24(%rbp)
	movl	$16, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, 20(%rbp)
	movl	24(%rbp), %eax
	subl	$3, %eax
	movl	%eax, 28(%rbp)
	jmp	.L33
.L34:
	movsbl	-5(%rbp), %edx
	movl	28(%rbp), %eax
	movl	%edx, %r9d
	leaq	.LC0(%rip), %r8
	movl	$1, %edx
	movl	%eax, %ecx
	call	mvprintw
	addl	$1, 28(%rbp)
.L33:
	movl	24(%rbp), %eax
	addl	$3, %eax
	cmpl	28(%rbp), %eax
	jge	.L34
	movl	20(%rbp), %eax
	subl	$3, %eax
	movl	%eax, 28(%rbp)
	jmp	.L35
.L36:
	movsbl	-5(%rbp), %ebx
	movl	$17, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	movl	28(%rbp), %eax
	movl	%ebx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	addl	$1, 28(%rbp)
.L35:
	movl	20(%rbp), %eax
	addl	$3, %eax
	cmpl	28(%rbp), %eax
	jge	.L36
	movl	-40(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L37
	addl	$1, 16(%rbp)
	jmp	.L23
.L37:
	subl	$1, 16(%rbp)
.L23:
	movl	difficulty(%rip), %eax
	movl	%eax, %ecx
	call	delay
	cmpl	$1, 12(%rbp)
	jne	.L38
	movsbl	-7(%rbp), %ecx
	movl	16(%rbp), %edx
	movl	12(%rbp), %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	movl	12(%rbp), %eax
	movl	%eax, 4(%rbp)
	addl	$1, 12(%rbp)
	movl	16(%rbp), %eax
	cmpl	8(%rbp), %eax
	jle	.L39
	movl	16(%rbp), %eax
	movl	%eax, 8(%rbp)
	addl	$1, 16(%rbp)
	jmp	.L38
.L39:
	subl	$1, 16(%rbp)
.L38:
	movl	$16, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	subl	$1, %eax
	cmpl	12(%rbp), %eax
	jne	.L40
	movsbl	-7(%rbp), %ecx
	movl	16(%rbp), %edx
	movl	12(%rbp), %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	movl	12(%rbp), %eax
	movl	%eax, 4(%rbp)
	subl	$1, 12(%rbp)
	movl	16(%rbp), %eax
	cmpl	8(%rbp), %eax
	jle	.L41
	movl	16(%rbp), %eax
	movl	%eax, 8(%rbp)
	addl	$1, 16(%rbp)
	jmp	.L40
.L41:
	subl	$1, 16(%rbp)
.L40:
	movl	16(%rbp), %eax
	cmpl	8(%rbp), %eax
	jle	.L42
	movl	16(%rbp), %eax
	movl	%eax, 8(%rbp)
	addl	$1, 16(%rbp)
	jmp	.L43
.L42:
	movl	16(%rbp), %eax
	cmpl	8(%rbp), %eax
	jge	.L43
	movl	16(%rbp), %eax
	movl	%eax, 8(%rbp)
	subl	$1, 16(%rbp)
.L43:
	movl	12(%rbp), %eax
	cmpl	4(%rbp), %eax
	jle	.L44
	movl	12(%rbp), %eax
	movl	%eax, 4(%rbp)
	addl	$1, 12(%rbp)
	jmp	.L45
.L44:
	movl	12(%rbp), %eax
	cmpl	4(%rbp), %eax
	jge	.L45
	movl	12(%rbp), %eax
	movl	%eax, 4(%rbp)
	subl	$1, 12(%rbp)
.L45:
	call	ncwrap_stdscr
	movq	%rax, %rcx
	call	wrefresh
	movsbl	-7(%rbp), %ecx
	movl	8(%rbp), %edx
	movl	4(%rbp), %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	movsbl	-7(%rbp), %ecx
	movl	8(%rbp), %eax
	leal	-1(%rax), %edx
	movl	4(%rbp), %eax
	subl	$1, %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	movsbl	-7(%rbp), %ecx
	movl	8(%rbp), %eax
	leal	1(%rax), %edx
	movl	4(%rbp), %eax
	addl	$1, %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	movsbl	-7(%rbp), %ecx
	movl	8(%rbp), %eax
	leal	1(%rax), %edx
	movl	4(%rbp), %eax
	subl	$1, %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	movsbl	-7(%rbp), %ecx
	movl	8(%rbp), %eax
	leal	-1(%rax), %edx
	movl	4(%rbp), %eax
	addl	$1, %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	movsbl	-7(%rbp), %ecx
	movl	8(%rbp), %eax
	leal	-1(%rax), %edx
	movl	4(%rbp), %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	movsbl	-7(%rbp), %ecx
	movl	8(%rbp), %eax
	leal	1(%rax), %edx
	movl	4(%rbp), %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	movsbl	-7(%rbp), %edx
	movl	4(%rbp), %eax
	leal	1(%rax), %ecx
	movl	8(%rbp), %eax
	movl	%edx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %edx
	call	mvprintw
	movsbl	-7(%rbp), %edx
	movl	4(%rbp), %eax
	leal	-1(%rax), %ecx
	movl	8(%rbp), %eax
	movl	%edx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %edx
	call	mvprintw
	cmpl	$9, 0(%rbp)
	jg	.L46
	cmpl	$9, -4(%rbp)
	jg	.L46
	movsbl	-7(%rbp), %ebx
	movl	$17, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	addl	$25, %eax
	movl	%ebx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %edx
	movl	$1, %ecx
	call	mvprintw
.L46:
	movsbl	-6(%rbp), %ecx
	movl	16(%rbp), %edx
	movl	12(%rbp), %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	call	ncwrap_stdscr
	movq	%rax, %rcx
	call	wrefresh
	leaq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	ftime
	movzwl	-56(%rbp), %eax
	movzwl	%ax, %eax
	movl	%eax, -36(%rbp)
	jmp	.L47
	.seh_endproc
	.globl	generateGame
	.def	generateGame;	.scl	2;	.type	32;	.endef
	.seh_proc	generateGame
generateGame:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%edx, %eax
	movl	%r8d, 48(%rbp)
	movl	%r9d, 56(%rbp)
	movb	%cl, 32(%rbp)
	movb	%al, 40(%rbp)
	movl	48(%rbp), %eax
	subl	$3, %eax
	movl	%eax, -4(%rbp)
	jmp	.L49
.L50:
	movsbl	32(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%edx, %r9d
	leaq	.LC0(%rip), %r8
	movl	$1, %edx
	movl	%eax, %ecx
	call	mvprintw
	addl	$1, -4(%rbp)
.L49:
	movl	48(%rbp), %eax
	addl	$3, %eax
	cmpl	-4(%rbp), %eax
	jge	.L50
	movl	56(%rbp), %eax
	subl	$3, %eax
	movl	%eax, -4(%rbp)
	jmp	.L51
.L52:
	movsbl	32(%rbp), %ebx
	movl	$17, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	movl	%ebx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	addl	$1, -4(%rbp)
.L51:
	movl	56(%rbp), %eax
	addl	$3, %eax
	cmpl	-4(%rbp), %eax
	jge	.L52
	movsbl	40(%rbp), %ebx
	movl	$17, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, %esi
	movl	$16, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%ebx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%esi, %edx
	movl	%eax, %ecx
	call	mvprintw
	call	ncwrap_stdscr
	movq	%rax, %rcx
	call	wrefresh
	nop
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.seh_endproc
	.globl	drawPaddle
	.def	drawPaddle;	.scl	2;	.type	32;	.endef
	.seh_proc	drawPaddle
drawPaddle:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, %eax
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	%r9d, %edx
	movb	%al, 16(%rbp)
	movb	%dl, 40(%rbp)
	movl	24(%rbp), %eax
	subl	$3, %eax
	movl	%eax, -4(%rbp)
	jmp	.L54
.L55:
	movsbl	40(%rbp), %ecx
	movl	48(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-4(%rbp), %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	addl	$1, -4(%rbp)
.L54:
	movl	24(%rbp), %eax
	addl	$3, %eax
	cmpl	-4(%rbp), %eax
	jge	.L55
	movl	32(%rbp), %eax
	subl	$3, %eax
	movl	%eax, -4(%rbp)
	jmp	.L56
.L57:
	movsbl	40(%rbp), %ecx
	movl	48(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-4(%rbp), %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	addl	$1, -4(%rbp)
.L56:
	movl	32(%rbp), %eax
	addl	$3, %eax
	cmpl	-4(%rbp), %eax
	jge	.L57
	movl	24(%rbp), %eax
	subl	$3, %eax
	movl	%eax, -4(%rbp)
	jmp	.L58
.L59:
	movsbl	40(%rbp), %ecx
	movl	48(%rbp), %eax
	leal	1(%rax), %edx
	movl	-4(%rbp), %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	addl	$1, -4(%rbp)
.L58:
	movl	24(%rbp), %eax
	addl	$3, %eax
	cmpl	-4(%rbp), %eax
	jge	.L59
	movl	32(%rbp), %eax
	subl	$3, %eax
	movl	%eax, -4(%rbp)
	jmp	.L60
.L61:
	movsbl	40(%rbp), %ecx
	movl	48(%rbp), %eax
	leal	1(%rax), %edx
	movl	-4(%rbp), %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	addl	$1, -4(%rbp)
.L60:
	movl	32(%rbp), %eax
	addl	$3, %eax
	cmpl	-4(%rbp), %eax
	jge	.L61
	movl	32(%rbp), %eax
	subl	$3, %eax
	movl	%eax, -4(%rbp)
	jmp	.L62
.L63:
	movsbl	40(%rbp), %ecx
	movl	48(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	addl	$1, -4(%rbp)
.L62:
	movl	32(%rbp), %eax
	addl	$3, %eax
	cmpl	-4(%rbp), %eax
	jge	.L63
	movl	24(%rbp), %eax
	subl	$3, %eax
	movl	%eax, -4(%rbp)
	jmp	.L64
.L65:
	movsbl	16(%rbp), %ecx
	movl	48(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%ecx, %r9d
	leaq	.LC0(%rip), %r8
	movl	%eax, %ecx
	call	mvprintw
	addl	$1, -4(%rbp)
.L64:
	movl	24(%rbp), %eax
	addl	$3, %eax
	cmpl	-4(%rbp), %eax
	jge	.L65
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "Ready to play? Press 'y' to continue\0"
	.align 8
.LC5:
	.ascii "Input a difficulty level from 0 to 100:  \0"
.LC6:
	.ascii "%d\0"
	.align 8
.LC7:
	.ascii "Use W/S to control left paddle and O/L to control right paddle.  HAVE FUN!\0"
	.text
	.def	initGame;	.scl	3;	.type	32;	.endef
	.seh_proc	initGame
initGame:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$72, %rsp
	.seh_stackalloc	72
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	call	initscr
	call	ncwrap_stdscr
	movq	%rax, %rcx
	call	wrefresh
	call	ncwrap_stdscr
	movq	%rax, %rcx
	call	werase
	call	noecho
	movl	$17, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, %ebx
	movl	$16, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leaq	.LC4(%rip), %r8
	movl	%ebx, %edx
	movl	%eax, %ecx
	call	mvprintw
	nop
.L67:
	call	ncwrap_stdscr
	movq	%rax, %rcx
	call	wgetch
	cmpl	$121, %eax
	jne	.L67
	movl	$17, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, %ebx
	movl	$16, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leaq	.LC5(%rip), %r8
	movl	%ebx, %edx
	movl	%eax, %ecx
	call	mvprintw
	call	ncwrap_stdscr
	movq	%rax, %rcx
	call	wrefresh
	movl	$1000, %ecx
	call	delay
	movb	$0, -65(%rbp)
	movl	$0, -72(%rbp)
	call	echo
	leaq	difficulty(%rip), %rdx
	leaq	.LC6(%rip), %rcx
	call	scanw
	call	noecho
	movl	difficulty(%rip), %eax
	movl	$100, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, difficulty(%rip)
	call	ncwrap_stdscr
	movq	%rax, %rcx
	call	werase
	movl	$17, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, %ebx
	movl	$16, %ecx
	movq	__imp_GetSystemMetrics(%rip), %rax
	call	*%rax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leaq	.LC7(%rip), %r8
	movl	%ebx, %edx
	movl	%eax, %ecx
	call	mvprintw
	call	ncwrap_stdscr
	movq	%rax, %rcx
	call	wrefresh
	movl	$1000, %ecx
	call	delay
	call	ncwrap_stdscr
	movq	%rax, %rcx
	call	werase
	nop
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.globl	delay
	.def	delay;	.scl	2;	.type	32;	.endef
	.seh_proc	delay
delay:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	16(%rbp), %eax
	cltq
	movq	%rax, -16(%rbp)
	call	clock
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L69
.L70:
	call	clock
	movq	%rax, -8(%rbp)
.L69:
	movq	-8(%rbp), %rax
	subq	-24(%rbp), %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	cmpq	%rax, %rdx
	jb	.L70
	nop
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC8:
	.ascii "tmb.time     = %ld (seconds)\12\0"
	.align 8
.LC9:
	.ascii "tmb.millitm  = %d (mlliseconds)\12\0"
	.text
	.globl	thing
	.def	thing;	.scl	2;	.type	32;	.endef
	.seh_proc	thing
thing:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	leaq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	ftime
	movq	-16(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC8(%rip), %rcx
	call	printf
	movzwl	-8(%rbp), %eax
	movzwl	%ax, %eax
	movl	%eax, %edx
	leaq	.LC9(%rip), %rcx
	call	printf
	movl	$0, %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 5.4.0"
	.def	ftime;	.scl	2;	.type	32;	.endef
	.def	time;	.scl	2;	.type	32;	.endef
	.def	srand;	.scl	2;	.type	32;	.endef
	.def	rand;	.scl	2;	.type	32;	.endef
	.def	ncwrap_stdscr;	.scl	2;	.type	32;	.endef
	.def	wrefresh;	.scl	2;	.type	32;	.endef
	.def	mvprintw;	.scl	2;	.type	32;	.endef
	.def	wtimeout;	.scl	2;	.type	32;	.endef
	.def	wgetch;	.scl	2;	.type	32;	.endef
	.def	werase;	.scl	2;	.type	32;	.endef
	.def	initscr;	.scl	2;	.type	32;	.endef
	.def	noecho;	.scl	2;	.type	32;	.endef
	.def	echo;	.scl	2;	.type	32;	.endef
	.def	scanw;	.scl	2;	.type	32;	.endef
	.def	clock;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
