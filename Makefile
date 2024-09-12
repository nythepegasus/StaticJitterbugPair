.DEFAULT_GOAL := default

UNAME_S := $(shell uname -s)

CC := gcc
CFLAGS := -Iinclude/ -Llib/ -static
LDFLAGS := -lssl -lcrypto -lm -limobiledevice-1.0 -limobiledevice-glue-1.0 -lz -lzstd
OBJS := lib/libc.a lib/libimobiledevice-1.0.a lib/libimobiledevice-glue-1.0.a lib/libplist-2.0.a lib/libusbmuxd-2.0.a

ALL_TARGETS := build/jitterbugpair

ifeq ($(UNAME_S), Linux)
endif


default: $(ALL_TARGETS)

build/%: src/%.c
	@mkdir -p build
	$(CC) -o $@ $^ $(CFLAGS) $(OBJS) $(LDFLAGS)

clean:
	rm -fr build/

runnjitterbugpair: build/jitterbugpair
	@true

runn%:
	$<
	@echo

.PHONY: default run clean
