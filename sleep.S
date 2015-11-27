@ sleep.S: sleep sycall wrapper
@
@ Authors: Pengcheng Sun <pengches@andrew.cmu.edu>
@          Yifan Wu <yw3@andrew.cmu.edu>
@ Date:    11/26/2015

#include <asm.h>

	.file "sleep.S"

FUNC(sleep)
	@ Add code here.  Put your names at the top.

swi SLEEP_SWI

mov pc,lr