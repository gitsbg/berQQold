# makefile for Lua core library
ARCHITECTURE	=	$(shell uname -m)
ifeq ($(ARCHITECTURE), i386)
ARCHITECTURE	=	x86
else
ARCHITECTURE	=	x64
endif
FREEBSD_VERSION =	$(shell uname -v 2>&1 | cut -d' ' -f2 | cut -d'-' -f1)
BIN_DIR	=	../lib/FreeBSD_$(FREEBSD_VERSION)/$(ARCHITECTURE)
BIN_FILE	=	$(BIN_DIR)/liblua.a
$(shell if [ ! -d $(BIN_DIR) ]; then mkdir -p $(BIN_DIR); fi)


LUA= ..

include $(LUA)/config

OBJS=	\
	lapi.o \
	lcode.o \
	ldebug.o \
	ldo.o \
	ldump.o \
	lfunc.o \
	lgc.o \
	llex.o \
	lmem.o \
	lobject.o \
	lopcodes.o \
	lparser.o \
	lstate.o \
	lstring.o \
	ltable.o \
	ltests.o \
	ltm.o \
	lundump.o \
	lvm.o \
	lzio.o

SRCS=	\
	lapi.c \
	lcode.c \
	ldebug.c \
	ldo.c \
	ldump.c \
	lfunc.c \
	lgc.c \
	llex.c \
	lmem.c \
	lobject.c \
	lopcodes.c \
	lparser.c \
	lstate.c \
	lstring.c \
	ltable.c \
	ltests.c \
	ltm.c \
	lundump.c \
	lvm.c \
	lzio.c \
	lapi.h \
	lcode.h \
	ldebug.h \
	ldo.h \
	lfunc.h \
	lgc.h \
	llex.h \
	llimits.h \
	lmem.h \
	lobject.h \
	lopcodes.h \
	lparser.h \
	lstate.h \
	lstring.h \
	ltable.h \
	ltm.h \
	lundump.h \
	lvm.h \
	lzio.h


T= $(LIB)/liblua.a

all:	$T

berqq: clean_bin $(BIN_FILE)

berqq_c:	clean	$(BIN_FILE)

%.o: %.c
	@echo -e "\033[35mLibLua\033[0m\t\033[1m- Compiling...\033[0m\t\t\033[32m$<\033[0m"
	@$(CC) $(CFLAGS) $(INCDIR) -c $<

$(BIN_FILE): $(OBJS)
	@echo -e "\033[35mLibLua\t\033[0m\033[1m- Linking...\033[0m\t\t\033[32m$(BIN_FILE)\033[0m"
	@$(AR) $@ $(OBJS)
	@$(RANLIB) $@

$T:	$(OBJS)
	@$(AR) $@ $(OBJS)
	@$(RANLIB) $@

clean:
	@rm -f $(OBJS)
	@echo -e "\033[35mLibLua\t\033[0m\033[33m- Object files deleted...\033[0m"
	@rm -f  $(BIN_FILE)
	@echo -e "\033[35mLibLua\t\033[0m\033[33m- Binary file deleted...\033[0m"

clean_bin:
	@rm -f $(BIN_FILE)
	@echo -e "\033[35mLibLua\t\033[0m\033[33m- Binary file deleted...\033[0m"

co:
	co -q -f -M $(SRCS)

klean:	clean
	rm -f $(SRCS)