CC		=	clang++-devel
#------------------------------------------------------------------------------
ARCHITECTURE	=	$(shell uname -m)
ifeq ($(ARCHITECTURE), i386)
ARCHITECTURE	=	x86
else
ARCHITECTURE	=	x64
endif
FREEBSD_VERSION	=	$(shell uname -v 2>&1 | cut -d' ' -f2 | cut -d'-' -f1)
#------------------------------------------------------------------------------
BIN_DIR = ./lib/FreeBSD_$(FREEBSD_VERSION)/$(ARCHITECTURE)
BIN		= $(BIN_DIR)/libpoly.a
SRC_DIR	=	../Srcs
OBJ_DIR = Objs
#------------------------------------------------------------------------------
$(shell if [ ! -d $(BIN_DIR) ]; then mkdir -p $(BIN_DIR); fi)
$(shell if [ ! -d $(OBJ_DIR) ]; then mkdir -p $(OBJ_DIR); fi)
#------------------------------------------------------------------------------
FLAGS = -w
FLAGS += -Wall
FLAGS += -O2
FLAGS += -pipe
FLAGS += -m32
FLAGS += -mtune=i686
FLAGS += -fstack-protector
FLAGS += -std=c++2a
FLAGS += -fno-exceptions -fno-rtti
FLAGS += -D_GLIBCXX_USE_CXX11_ABI=1
#------------------------------------------------------------------------------
SRCS	=	\
			Base.cc		\
			Poly.cc		\
			SymTable.cc	\
			Symbol.cc
#------------------------------------------------------------------------------
OBJS = $(SRCS:%.cc=$(OBJ_DIR)/%.o)
#------------------------------------------------------------------------------
SRCS_DIR	=	$(SRCS:%.cc=$(SRC_DIR)/%.cc)
#------------------------------------------------------------------------------
default:
	@clear
	@echo -e "\033[35mLibPoly\033[0m\t\033[31mInvalid usage !!!\033[0m"
	@echo -e ""
#------------------------------------------------------------------------------
berqq:	clean_bin dep $(BIN)
#------------------------------------------------------------------------------
berqq_c:	clean dep $(BIN)
#------------------------------------------------------------------------------
clean_bin:
	@sleep 3
	@rm -f $(BIN)
	@echo -e "\033[35mLibPoly\t\033[0m\033[33m- Binary file deleted...\033[0m"
#------------------------------------------------------------------------------
clean:
	@sleep 3
	@rm -f $(OBJ_DIR)/*.o
	@echo -e "\033[35mLibPoly\t\033[0m\033[33m- Object files deleted...\033[0m"
	@rm -f $(BIN)
	@echo -e "\033[35mLibPoly\t\033[0m\033[33m- Binary file deleted...\033[0m"
#------------------------------------------------------------------------------
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cc
	@echo -e "\033[35mLibPoly\033[0m\t\033[1m- Compiling...\033[0m\t\t\033[32m$(<F)\033[0m"
	@$(CC) $(FLAGS) -c $< -o $@
#------------------------------------------------------------------------------
$(BIN): $(OBJS)
	@echo -e "\033[35mLibPoly\t\033[0m\033[1m- Linking...\033[0m\t\t\033[32m$(BIN)\033[0m"
	@ar cru $(BIN) $(OBJS)
	@ranlib $(BIN)
	@chmod 700 $(BIN)
#------------------------------------------------------------------------------
dep:
	@$(CC) $(FLAGS) -MM $(SRC_DIR)/*.cc > Depend
	@echo -e "\033[35mLibPoly\t\033[0m\033[33m- Dependencies updated...\033[0m"
#------------------------------------------------------------------------------

sinclude Depend