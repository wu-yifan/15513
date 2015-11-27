@ mutex_unlock.S: mutex_unlock sycall wrapper
@
@ Authors: Pengcheng Sun <pengches@andrew.cmu.edu>
@          Yifan Wu <yw3@andrew.cmu.edu>
@ Date:    11/26/2015

#include <asm.h>

	.file "mutex_unlock.S"

FUNC(mutex_unlock)
	@ Add code here.  Put your name at the top.

    swi MUTEX_UNLOCK
    cmp r0, #0	             @check the return value of write
	bge .exit	             @if greater of equal than 0, exit normally with this return value

	stmfd sp!,{r6}
    ldr r6, =_errno          @if less than 0, load the address of errno into r6
    rsb r0,r0,#0			 @ get errno = -return
	str r0, [r6]             @ then load the error value into errno
	ldmfd sp!, {r6}          @ restore the value of r6
	mov r0, #-1	             @ exit with -1
.exit:
	mov pc,lr	
_errno:
	.word errno      @import the global variable errno