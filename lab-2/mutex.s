	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0
	.equ successful, 0
	.equ unsuccessful, 1

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
        @ INSERT CODE BELOW

        ldr r2, =locked    @ To load locked value
.L1:
		ldrex r1, [r0]     @ LDREX from [r0]
		cmp r1, #locked    @ compare to unlocked value
		beq .L1
		strex r1, r2, [r0]
		cmp r1, #successful
		bne .L1

        @ END CODE INSERT
		bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW
	ldr r1, =unlocked
	str r1, [r0]
        
    @ END CODE INSERT
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
