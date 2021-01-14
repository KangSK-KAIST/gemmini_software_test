CC:=gcc
CFLAGS:= -std=gnu99 -O2
IN_CPP_DIR:=src
OUT_O_DIR:=build

# tests = \
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

tests = matmul

builds=$(addprefix $(OUT_O_DIR)/,$(tests))

all: $(builds)

$(OUT_O_DIR)/%: $(IN_CPP_DIR)/%.c
	mkdir -p $(OUT_O_DIR)
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -rf $(OUT_O_DIR)