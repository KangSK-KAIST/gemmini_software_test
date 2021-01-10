tests = \
	mvin_mvout \
	mvin_mvout_stride \
	mvin_mvout_acc \
	mvin_mvout_acc_stride \
	matmul_os \
	matmul_ws \
	matmul \
	raw_hazard \
	aligned \
	padded \
	mvin_scale \
	conv \
	conv_with_pool \
	tiled_matmul_os \
	tiled_matmul_ws \
	tiled_matmul_cpu \
	tiled_matmul_option \
	template

CFLAGS := $(CFLAGS) \
	-DPREALLOCATE=1 \
	-DMULTITHREAD=1 \
	-std=gnu99 \
	-O2 \

tests_linux = $(tests:=-linux-native)

all: $(tests_linux)

%-linux-native: %.c
	gcc $(CFLAGS) $< $(LFLAGS) -o $@
