@ time.S: time sycall wrapper
@
@ Authors: Pengcheng Sun <pengches@andrew.cmu.edu>
@          Yifan Wu <yw3@andrew.cmu.edu>
@ Date:    11/26/2015

#include <asm.h>

	.file "time.S"

FUNC(time)
	@ Add code here.  Put your name at the top.

swi TIME_SWI

mov pc,lr