	//registers used:
		//r1: yes
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.0
	.global	_main
_main:
	stdec	r6
						// allocreg r1

						//helloworld.c, line 9
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l3,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//helloworld.c, line 9
						//call
						//pcreltotemp
	.lipcrel	_puts
	add	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1

						//helloworld.c, line 10
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	-1
	mr	r0
	ldinc	r6
	mr	r7

	.section	.rodata.1
l3:
	.byte	72
	.byte	101
	.byte	108
	.byte	108
	.byte	111
	.byte	32
	.byte	119
	.byte	111
	.byte	114
	.byte	108
	.byte	100
	.byte	33
	.byte	10
	.byte	0
