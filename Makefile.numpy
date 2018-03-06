PY34=1
PY35=1
VPATH=./src/:./examples
SLIB=libdarknet_numpy.so
ALIB=libdarknet_numpy.a
OBJDIR=./obj_numpy/

CC=gcc
AR=ar
ARFLAGS=rcs
OPTS=-Ofast
LDFLAGS= -lm -pthread
COMMON= -Iinclude/ -Isrc/

CFLAGS=-Wall -Wno-unknown-pragmas -Wfatal-errors -fPIC

ifeq ($(PY34), 1)
COMMON+= -I/usr/include/python3.4m -I/usr/include/python3.4m/numpy
endif

ifeq ($(PY35), 1)
COMMON+= -I/usr/include/python3.5m -I/usr/include/python3.5m/numpy
endif

CFLAGS+=$(OPTS)

OBJ=image_numpy.o

OBJS = $(addprefix $(OBJDIR), $(OBJ))
DEPS = $(wildcard src/*.h) Makefile.numpy include/darknet.h

all: objdir $(SLIB) $(ALIB)

$(ALIB): $(OBJS)
	$(AR) $(ARFLAGS) $@ $^

$(SLIB): $(OBJS)
	$(CC) $(CFLAGS) -shared $^ -o $@ $(LDFLAGS)

$(OBJDIR)%.o: %.c $(DEPS)
	echo "debug $<"
	echo "debug $@"
	$(CC) $(COMMON) $(CFLAGS) -c $< -o $@

objdir:
	echo "debug make $(OBJDIR)"
	mkdir -p $(OBJDIR)

.PHONY: clean

clean:
	rm -rf $(OBJS) $(SLIB) $(ALIB)
