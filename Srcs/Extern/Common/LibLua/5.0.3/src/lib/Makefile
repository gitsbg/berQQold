# makefile for Lua standard library
ARCHITECTURE	=	$(shell uname -m)
ifeq ($(ARCHITECTURE), i386)
ARCHITECTURE	=	x86
else
ARCHITECTURE	=	x64
endif
FREEBSD_VERSION =	$(shell uname -v 2>&1 | cut -d' ' -f2 | cut -d'-' -f1)
BIN_DIR = ../../lib/FreeBSD_$(FREEBSD_VERSION)/$(ARCHITECTURE)
BIN_FILE = $(BIN_DIR)/liblualib.a
$(shell if [ ! -d $(BIN_DIR) ]; then mkdir -p $(BIN_DIR); fi)


LUA= ../..

include $(LUA)/config

EXTRA_DEFS= $(POPEN) $(TMPNAM) $(DEGREES) $(LOADLIB)

OBJS= lauxlib.o lbaselib.o ldblib.o liolib.o lmathlib.o ltablib.o lstrlib.o loadlib.o
SRCS= lauxlib.c lbaselib.c ldblib.c liolib.c lmathlib.c ltablib.c lstrlib.c loadlib.c

T= $(LIB)/liblualib.a

all:	$T

berqq:	clean_bin $(BIN_FILE)

berqq_c:	clean $(BIN_FILE)

%.o: %.c
	@echo -e "\033[35mLibLuaLib\033[0m\t\033[1m- Compiling...\033[0m\t\t\033[32m$<\033[0m"
	@$(CC) $(CFLAGS) -c $<

$(BIN_FILE): $(OBJS)
	@echo -e "\033[35mLibLuaLib\t\033[0m\033[1m- Linking...\033[0m\t\t\033[32m$(BIN_FILE)\033[0m"
	@$(AR) $@ $(OBJS)
	@$(RANLIB) $@

$T:	$(OBJS)
	@$(AR) $@ $(OBJS)
	@$(RANLIB) $@

clean:
	@rm -f $(OBJS)
	@echo -e "\033[35mLibLuaLib\t\033[0m\033[33m- Object files deleted...\033[0m"
	@rm -f  $(BIN_FILE)
	@echo -e "\033[35mLibLuaLib\t\033[0m\033[33m- Binary file deleted...\033[0m"

clean_bin:
	@rm -f $(BIN_FILE)
	@echo -e "\033[35mLibLuaLib\t\033[0m\033[33m- Binary file deleted...\033[0m"

co:
	co -q -f -M $(SRCS)

klean:	clean
	rm -f $(SRCS)
