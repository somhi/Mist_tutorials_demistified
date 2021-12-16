	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.0
	.global	_user_io_sd_get_status
_user_io_sd_get_status:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type a
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r5
						// allocreg r4
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	-44
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r2

						//../DeMiSTify/firmware/diskimg.c, line 17
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 162 with 1
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 1
	.liconst	16
	ldidx	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	0
						// (save temp)store type 3
	st	r0
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 18
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	22
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 18
						//call
						//pcreltotemp
	.lipcrel	_spi_uio_cmd_cont
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1

						//../DeMiSTify/firmware/diskimg.c, line 19
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	255
						// (save temp)store type 3
	st	r4
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 19
						//FIXME convert
						// (convert - reducing type 503 to 101
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r4
						//Saving to reg r1
						// (save temp)isreg
	mr	r1
						//save_temp done
						// matchobj comparing flags 1 with 608
	.liconst	255
	and	r1

						//../DeMiSTify/firmware/diskimg.c, line 20
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r5)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 4a type 101
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r5
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 20
						// (bitwise/arithmetic) 	//ops: 6, 0, 2
						// (obj to r1) flags 42 type 3
						// matchobj comparing flags 66 with 74
						// reg r5 - only match against tmp
	//mt
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	240
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/diskimg.c, line 20
						// Q1 disposable
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	96
	cmp	r1
						// freereg r1

						//../DeMiSTify/firmware/diskimg.c, line 20
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l4
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 20
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 20
						// (bitwise/arithmetic) 	//ops: 5, 0, 1
						// (obj to r0) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r4
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 608
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
						// matchobj comparing flags 1 with 608
	.liconst	3
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x503, flags 0x22
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 1
						// deref
						// var FIXME - deref?
						// reg - auto
						// matchobj comparing flags 1 with 1
	.liconst	16
	ldidx	r6
	exg	r0
	st	r0
						// WARNING - Object is disposable, not bothering to undo exg - check correctness
						// freereg r1
l4: # 

						//../DeMiSTify/firmware/diskimg.c, line 21
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// const
	.liconst	255
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 21
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 260 type 103
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r4
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 22
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 103
						// matchobj comparing flags 66 with 608
						// reg r2 - only match against tmp
	//mt
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	shl	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/diskimg.c, line 22
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 22
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 5, 2, 3
						// (obj to r2) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r4
	mr	r2
						// (obj to tmp) flags 4a type 503
						// matchobj comparing flags 74 with 608
						// reg r1 - only match against tmp
	mt	r1
	or	r2
						// (save result) // isreg
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 23
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 103
						// matchobj comparing flags 66 with 74
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	shl	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/diskimg.c, line 23
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 23
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 5, 2, 3
						// (obj to r2) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r4
	mr	r2
						// (obj to tmp) flags 4a type 503
						// matchobj comparing flags 74 with 608
						// reg r1 - only match against tmp
	mt	r1
	or	r2
						// (save result) // isreg
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 24
						// (bitwise/arithmetic) 	//ops: 3, 0, 2
						// (obj to r1) flags 42 type 103
						// matchobj comparing flags 66 with 74
						// reg r2 - only match against tmp
	mt	r2
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	shl	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/diskimg.c, line 24
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	255
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 24
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 5, 2, 3
						// (obj to r2) flags 260 type 503
						// matchobj comparing flags 608 with 1
						// deref 
	ld	r4
	mr	r2
						// (obj to tmp) flags 4a type 503
						// matchobj comparing flags 74 with 608
						// reg r1 - only match against tmp
	mt	r1
	or	r2
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/diskimg.c, line 25
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 74
						// deref
						// const to r0
						// matchobj comparing flags 1 with 74
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	32
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 27
						// (test)
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
				// flags 42
	and	r3

						//../DeMiSTify/firmware/diskimg.c, line 27
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l6
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 27
						// Q1 disposable
						// Z disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 66
						// matchobj comparing flags 66 with 1
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)store type 3
	st	r3
						//save_temp done
l6: # 

						//../DeMiSTify/firmware/diskimg.c, line 29
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 42 type 3
						// reg r5 - only match against tmp
	mt	r5
	mr	r0
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
						// freereg r5
	ldinc	r6
	mr	r5

	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: no
		//r2: no
		//r3: no
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.1
	.global	_user_io_sd_set_config
_user_io_sd_set_config:
	stdec	r6
	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.2
	.global	_diskimg_poll
_diskimg_poll:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	exg	r6
	.liconst	-8
	add	r6
						// allocreg r4
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 43
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags e2 type a
						// matchobj comparing flags 226 with 1
						// (prepobj tmp)
 						// reg r6 - no need to prep
	mt	r6
	stdec	r6
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 43
						// (address)
						// (prepobj tmp)
 						// var, auto|reg
	.liconst	8
	addt	r6
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 43
						//call
						//pcreltotemp
	.lipcrel	_user_io_sd_get_status
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/diskimg.c, line 43
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r3

						//../DeMiSTify/firmware/diskimg.c, line 46
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to r0) flags 62 type 103
						// matchobj comparing flags 98 with 66
						// deref 
	ld	r6
	mr	r0
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	4
	cmp	r0

						//../DeMiSTify/firmware/diskimg.c, line 46
	cond	GE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l21
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 51
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						// (obj to r2) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	240
	and	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/diskimg.c, line 51
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	80
	cmp	r2

						//../DeMiSTify/firmware/diskimg.c, line 51
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l13
		add	r7

						//../DeMiSTify/firmware/diskimg.c, line 51
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	96
	cmp	r2

						//../DeMiSTify/firmware/diskimg.c, line 51
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l21
		add	r7
						// freereg r1
l13: # 
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 54
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	and	r1
						// (save result) // isreg
						// freereg r1

						//../DeMiSTify/firmware/diskimg.c, line 54
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l17
		add	r7
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 56
						//call
						//pcreltotemp
	.lipcrel	_user_io_sd_set_config
	add	r7
						// Flow control - popping 0 + 0 bytes
l17: # 

						//../DeMiSTify/firmware/diskimg.c, line 60
						// (bitwise/arithmetic) 	//ops: 4, 0, 5
						// (obj to r4) flags 42 type 3
						// reg r3 - only match against tmp
	mt	r3
	mr	r4
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	3
	and	r4
						// (save result) // isreg

						//../DeMiSTify/firmware/diskimg.c, line 60
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	2
	cmp	r4

						//../DeMiSTify/firmware/diskimg.c, line 60
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l19
		add	r7
						// freereg r1
						// freereg r2
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 61
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	9
	shl	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/diskimg.c, line 61
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	stdec	r6
						// freereg r1
						// allocreg r2

						//../DeMiSTify/firmware/diskimg.c, line 61
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type 103
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	4
						//sizemod based on type 0x103
	ldidx	r6
	mr	r2
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	20
	mul	r2
						// (save result) // isreg
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 61
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 3, 2
						// (obj to r1) flags 82 type a
						// (prepobj r1)
 						// extern (offset 0)
	.liabs	_diskimg
						// extern pe is varadr
	mr	r1
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// reg r2 - only match against tmp
	mt	r2
	add	r1
						// (save result) // isreg
						// freereg r2

						//../DeMiSTify/firmware/diskimg.c, line 61
						//call
						//pcreltotemp
	.lipcrel	_FileSeek
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 62
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	24
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 62
						//call
						//pcreltotemp
	.lipcrel	_spi_uio_cmd_cont
	add	r7
						// Deferred popping of 0 bytes (4 in total)
						// freereg r1

						//../DeMiSTify/firmware/diskimg.c, line 63
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	512
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 63
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 63
						//call
						//pcreltotemp
	.lipcrel	_spi_read
	add	r7
						// Deferred popping of 4 bytes (8 in total)
						// freereg r1

						//../DeMiSTify/firmware/diskimg.c, line 64
						// (a/p assign)
						// (prepobj r0)
 						// deref
						// const to r0
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	32
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 65
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	stdec	r6
						// allocreg r2

						//../DeMiSTify/firmware/diskimg.c, line 65
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 1
	.liconst	12
						//sizemod based on type 0x103
	ldidx	r6
	mr	r2
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 1
	.liconst	20
	mul	r2
						// (save result) // isreg
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 65
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 3, 2
						// (obj to r1) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj r1)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_diskimg
						// extern pe is varadr
	mr	r1
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	add	r1
						// (save result) // isreg
						// freereg r2

						//../DeMiSTify/firmware/diskimg.c, line 65
						//call
						//pcreltotemp
	.lipcrel	_FileWriteSector
	add	r7
						// Flow control - popping 4 + 8 bytes
						// matchobj comparing flags 1 with 1
	.liconst	12
	add	r6
						// freereg r1
l19: # 
						// allocreg r2
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 69
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	cmp	r4

						//../DeMiSTify/firmware/diskimg.c, line 69
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l21
		add	r7
						// freereg r1
						// freereg r2
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 71
						// (bitwise/arithmetic) 	//ops: 0, 0, 2
						// (obj to r1) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
	mr	r1
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	9
	shl	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/diskimg.c, line 71
						// Q1 disposable
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	stdec	r6
						// freereg r1
						// allocreg r2

						//../DeMiSTify/firmware/diskimg.c, line 71
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type 103
						// matchobj comparing flags 2 with 74
						// var, auto|reg
						// matchobj comparing flags 1 with 74
	.liconst	4
						//sizemod based on type 0x103
	ldidx	r6
	mr	r2
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	20
	mul	r2
						// (save result) // isreg
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 71
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 3, 2
						// (obj to r1) flags 82 type a
						// (prepobj r1)
 						// extern (offset 0)
	.liabs	_diskimg
						// extern pe is varadr
	mr	r1
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// reg r2 - only match against tmp
	mt	r2
	add	r1
						// (save result) // isreg
						// freereg r2

						//../DeMiSTify/firmware/diskimg.c, line 71
						//call
						//pcreltotemp
	.lipcrel	_FileSeek
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1

						//../DeMiSTify/firmware/diskimg.c, line 74
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
	stdec	r6
						// allocreg r2

						//../DeMiSTify/firmware/diskimg.c, line 74
						// (bitwise/arithmetic) 	//ops: 0, 0, 3
						// (obj to r2) flags 2 type 103
						// matchobj comparing flags 2 with 130
						// var, auto|reg
						// matchobj comparing flags 1 with 130
	.liconst	8
						//sizemod based on type 0x103
	ldidx	r6
	mr	r2
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	20
	mul	r2
						// (save result) // isreg
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 74
						// Q2 disposable
						// (bitwise/arithmetic) 	//ops: 0, 3, 2
						// (obj to r1) flags 82 type a
						// (prepobj r1)
 						// extern (offset 0)
	.liabs	_diskimg
						// extern pe is varadr
	mr	r1
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// reg r2 - only match against tmp
	mt	r2
	add	r1
						// (save result) // isreg
						// freereg r2

						//../DeMiSTify/firmware/diskimg.c, line 74
						//call
						//pcreltotemp
	.lipcrel	_FileReadSector
	add	r7
						// Deferred popping of 4 bytes (8 in total)
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 75
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	23
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 75
						//call
						//pcreltotemp
	.lipcrel	_spi_uio_cmd_cont
	add	r7
						// Deferred popping of 0 bytes (8 in total)
						// freereg r1

						//../DeMiSTify/firmware/diskimg.c, line 76
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	512
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 76
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_sector_buffer
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 76
						//call
						//pcreltotemp
	.lipcrel	_spi_write
	add	r7
						// Flow control - popping 4 + 8 bytes
	.liconst	12
	add	r6
						// freereg r1

						//../DeMiSTify/firmware/diskimg.c, line 77
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	32
						// (save temp)store type 3
	st	r0
						//save_temp done
l21: # 
						// allocreg r2
						// allocreg r1
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
	.liconst	-8
	sub	r6
	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.3
	.global	_diskimg_mount
_diskimg_mount:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
	.liconst	-4
	add	r6
						// allocreg r5
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 40 type a
						// matchobj comparing flags 64 with 1
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r5
						//save_temp done
						// freereg r1
						// allocreg r4
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 1000a
						// matchobj comparing flags 1 with 64
						// const
						// matchobj comparing flags 1 with 64
	.liconst	-44
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 88
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r0)
 						// reg r6 - no need to prep
						// (obj to tmp) flags 2 type 101
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
	.liconst	20
	ldidx	r6
						// (save temp)store type 3
	st	r6
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 88
						// (compare) (q1 signed) (q2 signed)
						// (obj to r0) flags 62 type 3
						// matchobj comparing flags 98 with 2
						// deref 
	//nop
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 98
						// const
						// matchobj comparing flags 1 with 98
	.liconst	3
	sgn
	cmp	r0

						//../DeMiSTify/firmware/diskimg.c, line 88
	cond	SGT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l22
		add	r7
						// freereg r1

						//../DeMiSTify/firmware/diskimg.c, line 90
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 1
						// reg r5 - only match against tmp
	mt	r5
	stdec	r6
						// allocreg r3

						//../DeMiSTify/firmware/diskimg.c, line 90
						// (bitwise/arithmetic) 	//ops: 0, 0, 4
						// (obj to r3) flags 2 type 3
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
	mr	r3
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	20
	mul	r3
						// (save result) // isreg

						//../DeMiSTify/firmware/diskimg.c, line 90
						// (bitwise/arithmetic) 	//ops: 0, 4, 4
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_diskimg
						// extern pe is varadr
	add	r3
						// (save result) // isreg
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 90
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 90
						//call
						//pcreltotemp
	.lipcrel	_FileOpen
	add	r7
						// Deferred popping of 4 bytes (4 in total)
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 91
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						//Special case - addt
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type a
						// const
	.liconst	8
	addt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r3

						//../DeMiSTify/firmware/diskimg.c, line 91
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 3
						// matchobj comparing flags 106 with 74
						// deref 
	ld	r1
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 93
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 106
						// deref
						// const to r0
						// matchobj comparing flags 1 with 106
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	545
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 94
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	29
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 96
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	255
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x260
	mt	r0
	st	r4
						// allocreg r2

						//../DeMiSTify/firmware/diskimg.c, line 96
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						// (obj to r2) flags 4a type 3
						// matchobj comparing flags 74 with 608
						// matchobj comparing flags 74 with 608
						// reg r1 - only match against tmp
	mt	r1
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 608
	.liconst	8
	sgn
	shr	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/diskimg.c, line 96
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 0, 1
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 608
						// reg r2 - only match against tmp
	mt	r2
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	255
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x260
	mt	r0
	st	r4
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/diskimg.c, line 96
						// (bitwise/arithmetic) 	//ops: 2, 0, 3
						// (obj to r2) flags 4a type 3
						// matchobj comparing flags 74 with 608
						// matchobj comparing flags 74 with 608
						// reg r1 - only match against tmp
	mt	r1
	mr	r2
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 608
	.liconst	16
	sgn
	shr	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/diskimg.c, line 96
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 0, 1
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 1
						// matchobj comparing flags 74 with 608
						// reg r2 - only match against tmp
	mt	r2
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	255
	and	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x260
	mt	r0
	st	r4
						// freereg r2

						//../DeMiSTify/firmware/diskimg.c, line 96
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 2, 0, 1
						// (obj to r0) flags 4a type 3
						// matchobj comparing flags 74 with 608
						// matchobj comparing flags 74 with 608
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
						// matchobj comparing flags 1 with 74
	.liconst	24
	sgn
	shr	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x260
	mt	r0
	st	r4
						// freereg r1

						//../DeMiSTify/firmware/diskimg.c, line 97
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 608
						// matchobj comparing flags 1 with 608
						// const
						// matchobj comparing flags 1 with 608
						// matchobj comparing flags 1 with 608
	.liconst	0
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 97
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 97
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 97
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 98
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 98
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 98
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 98
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 99
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 99
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 99
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 99
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1

			// required value found in tmp
						// (save temp)store type 3
	st	r4
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 100
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 161 with 1
						// matchobj comparing flags 161 with 608
						// deref
						// const to r0
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 608
	.liconst	-48
	mr	r0
						// (obj to tmp) flags 1 type 503
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	32
						// (save temp)store type 3
	st	r0
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 103
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 1
						// var, auto|reg
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	4
						//sizemod based on type 0x3
	ldidx	r6
	stdec	r6
						// allocreg r1

						//../DeMiSTify/firmware/diskimg.c, line 103
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 1
	.liconst	28
						// (save temp)isreg
	mr	r1
						//save_temp done

						//../DeMiSTify/firmware/diskimg.c, line 103
						//call
						//pcreltotemp
	.lipcrel	_spi_uio_cmd8
	add	r7
						// Flow control - popping 4 + 4 bytes
						// matchobj comparing flags 1 with 1
	.liconst	8
	add	r6
						// freereg r1
l22: # 
						// allocreg r1
						// freereg r1
						// freereg r4
						// freereg r5
	.liconst	-4
	sub	r6
	ldinc	r6
	mr	r5

	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	.section	.bss.4
	.align	4
	.global	_diskimg
	.comm	_diskimg,80
