	.file	"sign.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "cs1_log.csv\0"
.LC1:
	.ascii "DILITHIUM_CS1_LOG\0"
.LC2:
	.ascii "a\0"
.LC3:
	.ascii "%llu,%s,%u\0"
.LC4:
	.ascii ",%d\0"
	.text
	.p2align 4
	.def	dump_cs1_attempt;	.scl	3;	.type	32;	.endef
	.seh_proc	dump_cs1_attempt
dump_cs1_attempt:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	%rcx, %rbx
	leaq	.LC1(%rip), %rcx
	movl	%edx, %esi
	movq	%r8, %rbp
	call	getenv
	leaq	.LC0(%rip), %rdx
	testq	%rax, %rax
	cmovne	%rax, %rdx
	movq	%rdx, %rcx
	leaq	.LC2(%rip), %rdx
	call	fopen
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L1
	movl	%esi, 32(%rsp)
	movq	%rbx, %r9
	movq	%rax, %rcx
	movq	trace_id.0(%rip), %r8
	leaq	.LC3(%rip), %rdx
	leaq	1024(%rbp), %rsi
	addq	$5120, %rbp
	call	__mingw_fprintf
.L4:
	leaq	-1024(%rsi), %rbx
	.p2align 4
	.p2align 3
.L6:
	movl	(%rbx), %eax
	leaq	.LC4(%rip), %rdx
	movq	%rdi, %rcx
	cmpl	$4190208, %eax
	leal	-8380417(%rax), %r8d
	cmovle	%eax, %r8d
	addq	$4, %rbx
	call	__mingw_fprintf
	cmpq	%rsi, %rbx
	jne	.L6
	leaq	1024(%rbx), %rsi
	cmpq	%rbp, %rsi
	jne	.L4
	movq	%rdi, %rdx
	movl	$10, %ecx
	call	fputc
	addq	$1, trace_id.0(%rip)
	movq	%rdi, %rcx
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	jmp	fclose
.L1:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC6:
	.ascii "w\0"
.LC7:
	.ascii "s1_secret.csv\0"
.LC8:
	.ascii "vec,coeff,value\12\0"
.LC9:
	.ascii "%d,%d,%d\12\0"
	.text
	.p2align 4
	.globl	pqcrystals_dilithium2_ref_keypair
	.def	pqcrystals_dilithium2_ref_keypair;	.scl	2;	.type	32;	.endef
	.seh_proc	pqcrystals_dilithium2_ref_keypair
pqcrystals_dilithium2_ref_keypair:
	pushq	%r15
	.seh_pushreg	%r15
	movl	$37144, %eax
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	call	___chkstk_ms
	subq	%rax, %rsp
	.seh_stackalloc	37144
	.seh_endprologue
	leaq	144(%rsp), %rbp
	movq	%rcx, %rbx
	movq	%rdx, 37224(%rsp)
	movl	$32, %edx
	movq	%rbp, %rcx
	leaq	272(%rsp), %r12
	leaq	8464(%rsp), %r14
	call	randombytes
	movl	$1028, %eax
	movq	%rbp, %r8
	movq	%rbp, %rcx
	movl	$34, %r9d
	movl	$128, %edx
	movq	%r12, %rsi
	movw	%ax, 176(%rsp)
	call	pqcrystals_dilithium_fips202_ref_shake256
	movq	%rbp, %rdx
	leaq	20752(%rsp), %rcx
	leaq	4368(%rsp), %rdi
	call	pqcrystals_dilithium2_ref_polyvec_matrix_expand
	xorl	%r8d, %r8d
	leaq	176(%rsp), %rdx
	movq	%r12, %rcx
	call	pqcrystals_dilithium2_ref_polyvecl_uniform_eta
	movl	$4, %r8d
	leaq	176(%rsp), %rdx
	movq	%r14, %rcx
	call	pqcrystals_dilithium2_ref_polyveck_uniform_eta
	movl	$512, %ecx
	rep movsq
	leaq	4368(%rsp), %rcx
	leaq	16656(%rsp), %rdi
	call	pqcrystals_dilithium2_ref_polyvecl_ntt
	leaq	4368(%rsp), %r8
	leaq	20752(%rsp), %rdx
	leaq	12560(%rsp), %rcx
	call	pqcrystals_dilithium2_ref_polyvec_matrix_pointwise_montgomery
	leaq	12560(%rsp), %rcx
	call	pqcrystals_dilithium2_ref_polyveck_reduce
	leaq	12560(%rsp), %rcx
	call	pqcrystals_dilithium2_ref_polyveck_invntt_tomont
	movq	%r14, %r8
	leaq	12560(%rsp), %rdx
	leaq	12560(%rsp), %rcx
	call	pqcrystals_dilithium2_ref_polyveck_add
	leaq	12560(%rsp), %rcx
	call	pqcrystals_dilithium2_ref_polyveck_caddq
	leaq	12560(%rsp), %r8
	movq	%rdi, %rdx
	leaq	12560(%rsp), %rcx
	call	pqcrystals_dilithium2_ref_polyveck_power2round
	leaq	12560(%rsp), %r8
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	call	pqcrystals_dilithium2_ref_pack_pk
	leaq	80(%rsp), %rax
	movl	$1312, %r9d
	movq	%rbx, %r8
	movq	%rax, %rcx
	movl	$64, %edx
	movq	%rax, 72(%rsp)
	call	pqcrystals_dilithium_fips202_ref_shake256
	leaq	.LC6(%rip), %rdx
	leaq	.LC7(%rip), %rcx
	call	fopen
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L12
	movq	%rax, %r9
	movl	$16, %r8d
	movl	$1, %edx
	xorl	%ebx, %ebx
	leaq	.LC8(%rip), %rcx
	movq	%r12, %r13
	call	fwrite
.L13:
	xorl	%esi, %esi
	.p2align 4
	.p2align 3
.L14:
	movl	0(%r13,%rsi,4), %eax
	movl	%esi, %r9d
	movl	%ebx, %r8d
	movq	%r15, %rcx
	leaq	.LC9(%rip), %rdx
	addq	$1, %rsi
	movl	%eax, 32(%rsp)
	call	__mingw_fprintf
	cmpq	$256, %rsi
	jne	.L14
	addl	$1, %ebx
	addq	$1024, %r13
	cmpl	$4, %ebx
	jne	.L13
	movq	%r15, %rcx
	call	fclose
.L12:
	movq	%r14, 48(%rsp)
	movq	72(%rsp), %r8
	leaq	240(%rsp), %r9
	movq	%rbp, %rdx
	movq	%r12, 40(%rsp)
	movq	37224(%rsp), %rcx
	movq	%rdi, 32(%rsp)
	call	pqcrystals_dilithium2_ref_pack_sk
	xorl	%eax, %eax
	addq	$37144, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC10:
	.ascii "invalid\0"
.LC11:
	.ascii "valid\0"
	.text
	.p2align 4
	.globl	pqcrystals_dilithium2_ref_signature_internal
	.def	pqcrystals_dilithium2_ref_signature_internal;	.scl	2;	.type	32;	.endef
	.seh_proc	pqcrystals_dilithium2_ref_signature_internal
pqcrystals_dilithium2_ref_signature_internal:
	pushq	%r15
	.seh_pushreg	%r15
	movl	$54904, %eax
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	call	___chkstk_ms
	subq	%rax, %rsp
	.seh_stackalloc	54904
	.seh_endprologue
	movq	55032(%rsp), %rax
	movq	%rax, 48(%rsp)
	movq	%rcx, %r15
	movq	%r8, %rbx
	movq	%r9, %rsi
	leaq	22128(%rsp), %rax
	movq	%rdx, 54984(%rsp)
	leaq	1648(%rsp), %rdx
	movq	%rax, 40(%rsp)
	leaq	18032(%rsp), %r14
	leaq	464(%rsp), %rbp
	movq	%rdx, 32(%rsp)
	movq	%r14, %r9
	movq	%rbp, %r8
	leaq	368(%rsp), %rcx
	movq	%rdx, 104(%rsp)
	leaq	400(%rsp), %rdx
	leaq	30320(%rsp), %r13
	movq	%rax, 136(%rsp)
	movq	%r14, 144(%rsp)
	call	pqcrystals_dilithium2_ref_unpack_sk
	leaq	160(%rsp), %rcx
	call	pqcrystals_dilithium_fips202_ref_shake256_init
	movl	$64, %r8d
	leaq	400(%rsp), %rdx
	leaq	160(%rsp), %rcx
	call	pqcrystals_dilithium_fips202_ref_shake256_absorb
	movq	55016(%rsp), %r8
	movq	55008(%rsp), %rdx
	leaq	160(%rsp), %rcx
	call	pqcrystals_dilithium_fips202_ref_shake256_absorb
	movq	%rsi, %r8
	movq	%rbx, %rdx
	leaq	160(%rsp), %rcx
	call	pqcrystals_dilithium_fips202_ref_shake256_absorb
	leaq	496(%rsp), %rsi
	leaq	160(%rsp), %rcx
	call	pqcrystals_dilithium_fips202_ref_shake256_finalize
	leaq	160(%rsp), %r8
	movl	$64, %edx
	movq	%rsi, %rcx
	movq	%rsi, 112(%rsp)
	leaq	560(%rsp), %rbx
	call	pqcrystals_dilithium_fips202_ref_shake256_squeeze
	leaq	160(%rsp), %rcx
	call	pqcrystals_dilithium_fips202_ref_shake256_init
	movq	%rbp, %rdx
	movl	$32, %r8d
	leaq	160(%rsp), %rcx
	call	pqcrystals_dilithium_fips202_ref_shake256_absorb
	movq	55024(%rsp), %rdx
	movl	$32, %r8d
	leaq	160(%rsp), %rcx
	leaq	26224(%rsp), %rbp
	call	pqcrystals_dilithium_fips202_ref_shake256_absorb
	movq	%rsi, %rdx
	movl	$64, %r8d
	leaq	160(%rsp), %rcx
	call	pqcrystals_dilithium_fips202_ref_shake256_absorb
	leaq	160(%rsp), %rcx
	leaq	38512(%rsp), %rsi
	call	pqcrystals_dilithium_fips202_ref_shake256_finalize
	leaq	160(%rsp), %r8
	movq	%rbx, %rcx
	movl	$64, %edx
	movq	%rbx, 128(%rsp)
	call	pqcrystals_dilithium_fips202_ref_shake256_squeeze
	leaq	368(%rsp), %rdx
	movq	%rsi, %rcx
	movq	%rsi, 120(%rsp)
	call	pqcrystals_dilithium2_ref_polyvec_matrix_expand
	movq	104(%rsp), %rcx
	call	pqcrystals_dilithium2_ref_polyvecl_ntt
	movq	136(%rsp), %rcx
	call	pqcrystals_dilithium2_ref_polyveck_ntt
	movq	%r14, %rcx
	leaq	624(%rsp), %r14
	call	pqcrystals_dilithium2_ref_polyveck_ntt
	leaq	5744(%rsp), %rax
	leaq	9840(%rsp), %rdx
	xorl	%r8d, %r8d
	movq	%rax, 80(%rsp)
	leaq	13936(%rsp), %rax
	movq	%rdx, %rbx
	movq	%rax, 96(%rsp)
	leaq	34416(%rsp), %rax
	movq	%r15, 54976(%rsp)
	movq	%rax, %r15
	movq	%rax, 152(%rsp)
	movq	%rdx, 88(%rsp)
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L27:
	movq	96(%rsp), %r8
	movl	%esi, %edx
	leaq	.LC10(%rip), %rcx
	call	dump_cs1_attempt
.L23:
	movzwl	78(%rsp), %r8d
.L21:
	movq	80(%rsp), %rsi
	movq	128(%rsp), %rdx
	leal	1(%r8), %eax
	movw	%ax, 78(%rsp)
	movq	%rsi, %rcx
	call	pqcrystals_dilithium2_ref_polyvecl_uniform_gamma1
	movq	88(%rsp), %rdi
	movl	$512, %ecx
	movq	%rbx, 88(%rsp)
	rep movsq
	movq	%rbx, %rcx
	call	pqcrystals_dilithium2_ref_polyvecl_ntt
	movq	120(%rsp), %rdx
	movq	%rbx, %r8
	movq	%rbp, %rcx
	call	pqcrystals_dilithium2_ref_polyvec_matrix_pointwise_montgomery
	movq	%rbp, %rcx
	call	pqcrystals_dilithium2_ref_polyveck_reduce
	movq	%rbp, %rcx
	call	pqcrystals_dilithium2_ref_polyveck_invntt_tomont
	movq	%rbp, %rcx
	call	pqcrystals_dilithium2_ref_polyveck_caddq
	movq	%rbp, %r8
	movq	%r13, %rdx
	movq	%rbp, %rcx
	call	pqcrystals_dilithium2_ref_polyveck_decompose
	movq	54976(%rsp), %rcx
	movq	%rbp, %rdx
	call	pqcrystals_dilithium2_ref_polyveck_pack_w1
	leaq	160(%rsp), %rcx
	call	pqcrystals_dilithium_fips202_ref_shake256_init
	movq	112(%rsp), %rdx
	movl	$64, %r8d
	leaq	160(%rsp), %rcx
	call	pqcrystals_dilithium_fips202_ref_shake256_absorb
	movq	54976(%rsp), %rdx
	movl	$768, %r8d
	leaq	160(%rsp), %rcx
	call	pqcrystals_dilithium_fips202_ref_shake256_absorb
	leaq	160(%rsp), %rcx
	call	pqcrystals_dilithium_fips202_ref_shake256_finalize
	movq	54976(%rsp), %rcx
	movl	$32, %edx
	leaq	160(%rsp), %r8
	call	pqcrystals_dilithium_fips202_ref_shake256_squeeze
	movq	54976(%rsp), %rdx
	movq	%r14, %rcx
	call	pqcrystals_dilithium2_ref_poly_challenge
	movl	624(%rsp), %eax
	testl	%eax, %eax
	jne	.L22
	movl	$1, 624(%rsp)
.L22:
	movq	%r14, %rcx
	movq	%rbx, %rsi
	call	pqcrystals_dilithium2_ref_poly_ntt
	movq	104(%rsp), %r8
	movq	%r14, %rdx
	movq	%rbx, %rcx
	call	pqcrystals_dilithium2_ref_polyvecl_pointwise_poly_montgomery
	movq	%rbx, %rcx
	call	pqcrystals_dilithium2_ref_polyvecl_invntt_tomont
	movq	80(%rsp), %r8
	movq	%rbx, %rdx
	movq	96(%rsp), %rdi
	movl	$512, %ecx
	rep movsq
	movq	%rbx, %rcx
	call	pqcrystals_dilithium2_ref_polyvecl_add
	movq	%rbx, %rcx
	call	pqcrystals_dilithium2_ref_polyvecl_reduce
	movl	$130994, %edx
	movq	%rbx, %rcx
	call	pqcrystals_dilithium2_ref_polyvecl_chknorm
	movzwl	78(%rsp), %esi
	testl	%eax, %eax
	jne	.L23
	movq	136(%rsp), %r8
	movq	%r14, %rdx
	movq	%r15, %rcx
	subl	$1, %esi
	call	pqcrystals_dilithium2_ref_polyveck_pointwise_poly_montgomery
	movq	%r15, %rcx
	call	pqcrystals_dilithium2_ref_polyveck_invntt_tomont
	movq	%r15, %r8
	movq	%r13, %rdx
	movq	%r13, %rcx
	call	pqcrystals_dilithium2_ref_polyveck_sub
	movq	%r13, %rcx
	call	pqcrystals_dilithium2_ref_polyveck_reduce
	movl	$95154, %edx
	movq	%r13, %rcx
	call	pqcrystals_dilithium2_ref_polyveck_chknorm
	testl	%eax, %eax
	jne	.L27
	movq	144(%rsp), %r8
	movq	%r14, %rdx
	movq	%r15, %rcx
	call	pqcrystals_dilithium2_ref_polyveck_pointwise_poly_montgomery
	movq	%r15, %rcx
	call	pqcrystals_dilithium2_ref_polyveck_invntt_tomont
	movq	%r15, %rcx
	call	pqcrystals_dilithium2_ref_polyveck_reduce
	movl	$95232, %edx
	movq	%r15, %rcx
	call	pqcrystals_dilithium2_ref_polyveck_chknorm
	testl	%eax, %eax
	jne	.L27
	movq	%r15, %r8
	movq	%r13, %rdx
	movq	%r13, %rcx
	call	pqcrystals_dilithium2_ref_polyveck_add
	movq	%rbp, %r8
	movq	%r13, %rdx
	movq	%r15, %rcx
	call	pqcrystals_dilithium2_ref_polyveck_make_hint
	cmpl	$80, %eax
	ja	.L27
	movq	96(%rsp), %r8
	movl	%esi, %edx
	movq	54976(%rsp), %r15
	leaq	.LC11(%rip), %rcx
	call	dump_cs1_attempt
	movq	%rbx, %r8
	movq	%r15, %rdx
	movq	%r15, %rcx
	movq	152(%rsp), %r9
	call	pqcrystals_dilithium2_ref_pack_sig
	movq	54984(%rsp), %rax
	movq	$2420, (%rax)
	xorl	%eax, %eax
	addq	$54904, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.seh_endproc
	.p2align 4
	.globl	pqcrystals_dilithium2_ref_signature
	.def	pqcrystals_dilithium2_ref_signature;	.scl	2;	.type	32;	.endef
	.seh_proc	pqcrystals_dilithium2_ref_signature
pqcrystals_dilithium2_ref_signature:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$376, %rsp
	.seh_stackalloc	376
	.seh_endprologue
	movq	472(%rsp), %rbx
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	movq	%r8, %r13
	movq	%r9, %r12
	cmpq	$255, %rbx
	ja	.L31
	movb	$0, 96(%rsp)
	movb	%bl, 97(%rsp)
	testq	%rbx, %rbx
	je	.L30
	movq	464(%rsp), %rdx
	leaq	98(%rsp), %rcx
	movq	%rbx, %r8
	call	memcpy
.L30:
	leaq	64(%rsp), %rbp
	movl	$32, %edx
	addq	$2, %rbx
	movq	%rbp, %rcx
	call	randombytes
	movq	%rbp, 48(%rsp)
	movq	%r12, %r9
	movq	%r13, %r8
	movq	480(%rsp), %rax
	movq	%rbx, 40(%rsp)
	movq	%rdi, %rdx
	movq	%rsi, %rcx
	movq	%rax, 56(%rsp)
	leaq	96(%rsp), %rax
	movq	%rax, 32(%rsp)
	call	pqcrystals_dilithium2_ref_signature_internal
	xorl	%eax, %eax
.L28:
	addq	$376, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L31:
	movl	$-1, %eax
	jmp	.L28
	.seh_endproc
	.p2align 4
	.globl	pqcrystals_dilithium2_ref
	.def	pqcrystals_dilithium2_ref;	.scl	2;	.type	32;	.endef
	.seh_proc	pqcrystals_dilithium2_ref
pqcrystals_dilithium2_ref:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$72, %rsp
	.seh_stackalloc	72
	.seh_endprologue
	movq	%rcx, %r11
	movq	%rdx, %rsi
	movq	%r9, %rbx
	testq	%r9, %r9
	je	.L36
	movq	%r9, %r10
	xorl	%eax, %eax
	leaq	(%rcx,%r9), %rcx
	addq	%r9, %r8
	negq	%r10
	.p2align 5
	.p2align 4
	.p2align 3
.L37:
	movzbl	-1(%r8,%rax), %edx
	movb	%dl, 2419(%rcx,%rax)
	subq	$1, %rax
	cmpq	%rax, %r10
	jne	.L37
.L36:
	movq	%rbx, %r9
	leaq	2420(%r11), %r8
	movq	%rsi, %rdx
	movq	%r11, %rcx
	movq	144(%rsp), %rax
	movq	%rax, 48(%rsp)
	movq	136(%rsp), %rax
	movq	%rax, 40(%rsp)
	movq	128(%rsp), %rax
	movq	%rax, 32(%rsp)
	call	pqcrystals_dilithium2_ref_signature
	addq	%rbx, (%rsi)
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.p2align 4
	.globl	pqcrystals_dilithium2_ref_verify_internal
	.def	pqcrystals_dilithium2_ref_verify_internal;	.scl	2;	.type	32;	.endef
	.seh_proc	pqcrystals_dilithium2_ref_verify_internal
pqcrystals_dilithium2_ref_verify_internal:
	pushq	%r15
	.seh_pushreg	%r15
	movl	$34984, %eax
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	call	___chkstk_ms
	subq	%rax, %rsp
	.seh_stackalloc	34984
	.seh_endprologue
	movq	%r8, 35072(%rsp)
	movq	%rcx, %rsi
	movq	%r9, %r13
	cmpq	$2420, %rdx
	jne	.L43
	movq	35104(%rsp), %r8
	leaq	6304(%rsp), %rdx
	leaq	48(%rsp), %rcx
	leaq	2208(%rsp), %rbp
	leaq	80(%rsp), %rbx
	call	pqcrystals_dilithium2_ref_unpack_pk
	movq	%rsi, %r9
	movq	%rbp, %rdx
	movq	%rbx, %rcx
	leaq	14496(%rsp), %r8
	call	pqcrystals_dilithium2_ref_unpack_sig
	testl	%eax, %eax
	jne	.L43
	movl	$130994, %edx
	movq	%rbp, %rcx
	call	pqcrystals_dilithium2_ref_polyvecl_chknorm
	testl	%eax, %eax
	jne	.L43
	movl	$1312, %r9d
	movq	35104(%rsp), %r8
	movl	%eax, 44(%rsp)
	movl	$64, %edx
	leaq	144(%rsp), %rcx
	call	pqcrystals_dilithium_fips202_ref_shake256
	leaq	208(%rsp), %rcx
	call	pqcrystals_dilithium_fips202_ref_shake256_init
	movl	$64, %r8d
	leaq	144(%rsp), %rdx
	leaq	208(%rsp), %rcx
	call	pqcrystals_dilithium_fips202_ref_shake256_absorb
	movq	35096(%rsp), %r8
	movq	35088(%rsp), %rdx
	leaq	208(%rsp), %rcx
	call	pqcrystals_dilithium_fips202_ref_shake256_absorb
	movq	35072(%rsp), %rdx
	movq	%r13, %r8
	leaq	208(%rsp), %rcx
	call	pqcrystals_dilithium_fips202_ref_shake256_absorb
	leaq	208(%rsp), %rcx
	call	pqcrystals_dilithium_fips202_ref_shake256_finalize
	leaq	208(%rsp), %r8
	movl	$64, %edx
	leaq	144(%rsp), %rcx
	call	pqcrystals_dilithium_fips202_ref_shake256_squeeze
	movq	%rbx, %rdx
	leaq	1184(%rsp), %rcx
	call	pqcrystals_dilithium2_ref_poly_challenge
	leaq	18592(%rsp), %rax
	leaq	48(%rsp), %rdx
	movq	%rax, %rcx
	movq	%rax, 32(%rsp)
	call	pqcrystals_dilithium2_ref_polyvec_matrix_expand
	movq	%rbp, %rcx
	call	pqcrystals_dilithium2_ref_polyvecl_ntt
	movq	32(%rsp), %rdx
	movq	%rbp, %r8
	leaq	10400(%rsp), %rcx
	call	pqcrystals_dilithium2_ref_polyvec_matrix_pointwise_montgomery
	leaq	1184(%rsp), %rcx
	call	pqcrystals_dilithium2_ref_poly_ntt
	leaq	6304(%rsp), %rcx
	call	pqcrystals_dilithium2_ref_polyveck_shiftl
	leaq	6304(%rsp), %rcx
	call	pqcrystals_dilithium2_ref_polyveck_ntt
	leaq	6304(%rsp), %r8
	leaq	1184(%rsp), %rdx
	leaq	6304(%rsp), %rcx
	call	pqcrystals_dilithium2_ref_polyveck_pointwise_poly_montgomery
	leaq	6304(%rsp), %r8
	leaq	10400(%rsp), %rdx
	leaq	10400(%rsp), %rcx
	call	pqcrystals_dilithium2_ref_polyveck_sub
	leaq	10400(%rsp), %rcx
	call	pqcrystals_dilithium2_ref_polyveck_reduce
	leaq	10400(%rsp), %rcx
	call	pqcrystals_dilithium2_ref_polyveck_invntt_tomont
	leaq	10400(%rsp), %rcx
	call	pqcrystals_dilithium2_ref_polyveck_caddq
	leaq	14496(%rsp), %r8
	leaq	10400(%rsp), %rdx
	leaq	10400(%rsp), %rcx
	call	pqcrystals_dilithium2_ref_polyveck_use_hint
	leaq	10400(%rsp), %rdx
	leaq	416(%rsp), %rcx
	call	pqcrystals_dilithium2_ref_polyveck_pack_w1
	leaq	208(%rsp), %rcx
	call	pqcrystals_dilithium_fips202_ref_shake256_init
	movl	$64, %r8d
	leaq	144(%rsp), %rdx
	leaq	208(%rsp), %rcx
	call	pqcrystals_dilithium_fips202_ref_shake256_absorb
	movl	$768, %r8d
	leaq	416(%rsp), %rdx
	leaq	208(%rsp), %rcx
	call	pqcrystals_dilithium_fips202_ref_shake256_absorb
	leaq	208(%rsp), %rcx
	call	pqcrystals_dilithium_fips202_ref_shake256_finalize
	movl	$32, %edx
	leaq	112(%rsp), %rcx
	leaq	208(%rsp), %r8
	call	pqcrystals_dilithium_fips202_ref_shake256_squeeze
	leaq	112(%rsp), %rax
	movl	44(%rsp), %r10d
	movq	%rax, %rdx
	jmp	.L44
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L47:
	addq	$1, %rbx
	addq	$1, %rax
	cmpq	%rdx, %rbx
	je	.L42
.L44:
	movzbl	(%rax), %edi
	cmpb	%dil, (%rbx)
	je	.L47
.L43:
	movl	$-1, %r10d
.L42:
	movl	%r10d, %eax
	addq	$34984, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.seh_endproc
	.p2align 4
	.globl	pqcrystals_dilithium2_ref_verify
	.def	pqcrystals_dilithium2_ref_verify;	.scl	2;	.type	32;	.endef
	.seh_proc	pqcrystals_dilithium2_ref_verify
pqcrystals_dilithium2_ref_verify:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$344, %rsp
	.seh_stackalloc	344
	.seh_endprologue
	movq	424(%rsp), %rbx
	movq	%rcx, %rsi
	movq	%rdx, %rbp
	movq	%r8, %rdi
	cmpq	$255, %rbx
	ja	.L51
	movb	$0, 64(%rsp)
	movb	%bl, 65(%rsp)
	testq	%rbx, %rbx
	je	.L50
	movq	416(%rsp), %rdx
	leaq	66(%rsp), %rcx
	movq	%rbx, %r8
	movq	%r9, 408(%rsp)
	call	memcpy
	movq	408(%rsp), %r9
.L50:
	addq	$2, %rbx
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%rsi, %rcx
	movq	432(%rsp), %rax
	movq	%rbx, 40(%rsp)
	movq	%rax, 48(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, 32(%rsp)
	call	pqcrystals_dilithium2_ref_verify_internal
.L48:
	addq	$344, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L51:
	movl	$-1, %eax
	jmp	.L48
	.seh_endproc
	.p2align 4
	.globl	pqcrystals_dilithium2_ref_open
	.def	pqcrystals_dilithium2_ref_open;	.scl	2;	.type	32;	.endef
	.seh_proc	pqcrystals_dilithium2_ref_open
pqcrystals_dilithium2_ref_open:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%r9, %r11
	movq	%r8, %rcx
	cmpq	$2419, %r9
	ja	.L64
	movq	$0, (%rdx)
	testq	%r9, %r9
	je	.L62
.L60:
	movq	%r11, %r8
	xorl	%edx, %edx
	movq	%rbx, %rcx
	call	memset
.L62:
	movl	$-1, %eax
.L55:
	addq	$64, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L64:
	movq	128(%rsp), %rax
	leaq	-2420(%r9), %r9
	movq	%rdx, 88(%rsp)
	leaq	2420(%r8), %r8
	movq	%r9, (%rdx)
	movl	$2420, %edx
	movq	%rax, 48(%rsp)
	movq	120(%rsp), %rax
	movq	%r11, 104(%rsp)
	movq	%rax, 40(%rsp)
	movq	112(%rsp), %rax
	movq	%rcx, 96(%rsp)
	movq	%rax, 32(%rsp)
	call	pqcrystals_dilithium2_ref_verify
	movq	88(%rsp), %r10
	movq	104(%rsp), %r11
	testl	%eax, %eax
	jne	.L57
	cmpq	$0, (%r10)
	je	.L55
	movq	96(%rsp), %rcx
	xorl	%edx, %edx
	.p2align 5
	.p2align 4
	.p2align 3
.L59:
	movzbl	2420(%rcx,%rdx), %r8d
	movb	%r8b, (%rbx,%rdx)
	addq	$1, %rdx
	cmpq	(%r10), %rdx
	jb	.L59
	addq	$64, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L57:
	movq	$0, (%r10)
	jmp	.L60
	.seh_endproc
.lcomm trace_id.0,8,8
	.ident	"GCC: (Rev13, Built by MSYS2 project) 15.2.0"
	.def	getenv;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	randombytes;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium_fips202_ref_shake256;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyvec_matrix_expand;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyvecl_uniform_eta;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyveck_uniform_eta;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyvecl_ntt;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyvec_matrix_pointwise_montgomery;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyveck_reduce;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyveck_invntt_tomont;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyveck_add;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyveck_caddq;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyveck_power2round;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_pack_pk;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_pack_sk;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_unpack_sk;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium_fips202_ref_shake256_init;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium_fips202_ref_shake256_absorb;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium_fips202_ref_shake256_finalize;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium_fips202_ref_shake256_squeeze;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyveck_ntt;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyvecl_uniform_gamma1;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyveck_decompose;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyveck_pack_w1;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_poly_challenge;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_poly_ntt;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyvecl_pointwise_poly_montgomery;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyvecl_invntt_tomont;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyvecl_add;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyvecl_reduce;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyvecl_chknorm;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyveck_pointwise_poly_montgomery;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyveck_sub;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyveck_chknorm;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyveck_make_hint;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_pack_sig;	.scl	2;	.type	32;	.endef
	.def	memcpy;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_unpack_pk;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_unpack_sig;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyveck_shiftl;	.scl	2;	.type	32;	.endef
	.def	pqcrystals_dilithium2_ref_polyveck_use_hint;	.scl	2;	.type	32;	.endef
	.def	memset;	.scl	2;	.type	32;	.endef
