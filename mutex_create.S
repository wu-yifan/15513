@ mutex_create.S: mutex_create sycall wrapper
@
@ Authors: Pengcheng Sun <pengches@andrew.cmu.edu>
@          Yifan Wu <yw3@andrew.cmu.edu>
@ Date:    11/26/2015

#include <asm.h>

	.file "mutex_create.S"

FUNC(mutex_create)
	@ Add code here.  Put your name at the top.

	swi MUTEX_CREATE
	cmp r0,#0             @check the return value of read sys call
	bge .exit             @ if the return value is greater of equal than 0, means read terminated normally
    
	stmfd sp!, {r6}       
	ldr r6, =_errno	      @ load the address of errno into r6
	rsb r0,r0,#0 		  @ get error no = -return
	str r0, [r6]	      @ load the error number into errno
	ldmfd sp!, {r6}	      @ restore the value of r6
	mov r0, #-1	          @ exit with -1
.exit:  mov pc,lr

_errno:
	.word errno           @import the global variable errno from errno.h