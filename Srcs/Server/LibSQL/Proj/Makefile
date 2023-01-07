CXX		=	clang++-devel
#------------------------------------------------------------------------------
ARCHITECTURE	=	$(shell uname -m)
ifeq ($(ARCHITECTURE), i386)
ARCHITECTURE	=	x86
else
ARCHITECTURE	=	x64
endif
FREEBSD_VERSION	=	$(shell uname -v 2>&1 | cut -d' ' -f2 | cut -d'-' -f1)
#------------------------------------------------------------------------------
BIN_DIR =	./lib/FreeBSD_$(FREEBSD_VERSION)/$(ARCHITECTURE)
BIN		=	$(BIN_DIR)/libsql.a
SRC_DIR	=	../Srcs
OBJ_DIR =	Objs
#------------------------------------------------------------------------------
$(shell if [ ! -d $(BIN_DIR) ]; then mkdir -p $(BIN_DIR); fi)
$(shell if [ ! -d $(OBJ_DIR) ]; then mkdir -p $(OBJ_DIR); fi)
#------------------------------------------------------------------------------
FLAGS	=	-w
FLAGS	+=	-Wall
FLAGS	+=	-O2
FLAGS	+=	-pipe
FLAGS	+=	-D_GLIBCXX_USE_CXX11_ABI=1
FLAGS	+=	-D_THREAD_SAFE
FLAGS	+=	-m32
FLAGS	+=	-mtune=i686
FLAGS	+=	-fno-exceptions
FLAGS	+=	-std=c++2a
#------------------------------------------------------------------------------
INC_DIR = -I../../../Extern/FreeBSD_$(FREEBSD_VERSION)/$(ARCHITECTURE)/MySQL_5.6.51/Include
#------------------------------------------------------------------------------
SRCS	=		\
			AsyncSQL.cpp	\
			Semaphore.cpp	\
			Tellwait.cpp	\
			Statement.cpp
#------------------------------------------------------------------------------
OBJS		=	$(SRCS:%.cpp=$(OBJ_DIR)/%.o)
#------------------------------------------------------------------------------
SRCS_DIR	=	$(SRCS:%.cpp=$(SRC_DIR)/%.cpp)
#------------------------------------------------------------------------------
default:
	@clear
	@echo -e "\033[35mLibSQL\033[0m\t\033[31m- Invalid usage !!!\033[0m"
	@echo -e ""
#------------------------------------------------------------------------------
berqq:	clean_bin dep $(BIN)
#------------------------------------------------------------------------------
berqq_c:	clean dep $(BIN)
#------------------------------------------------------------------------------
clean:
	@rm -f $(OBJ_DIR)/*.o
	@sleep 2
	@echo -e "\033[35mLibSQL\t\033[0m\033[33m- Object files deleted...\033[0m"
	@rm -f $(BIN)
	@sleep 3
	@echo -e "\033[35mLibSQL\t\033[0m\033[33m- Binary file deleted...\033[0m"
#------------------------------------------------------------------------------
clean_bin:
	@rm -f $(BIN)
	@sleep 2
	@echo -e "\033[35mLibSQL\t\033[0m\033[33m- Binary file deleted...\033[0m"
#------------------------------------------------------------------------------
$(BIN):	$(OBJS)
	@echo -e "\033[35mLibSQL\t\033[0m\033[32m- Linking...\033[0m\t\t\033[32m$(BIN)\033[0m"
	@ar cru $(BIN) $(OBJS)
	@ranlib $(BIN)
	@chmod 700 $(BIN)
#------------------------------------------------------------------------------
$(OBJ_DIR)/%.o:	$(SRC_DIR)/%.cpp
	@echo -e "\033[35mLibSQL\033[0m\t\033[1mCompiling...\033[0m\t\t\033[32m$(<F)\033[0m"
	@$(CXX) $(FLAGS) $(INC_DIR) -c $< -o $@
#------------------------------------------------------------------------------
dep:
	@$(CXX) $(FLAGS) $(INC_DIR) -MM $(SRC_DIR)/*.cpp > Depend
	@sleep 2
	@echo -e "\033[35mLibSQL\t\033[0m\033[33m- Dependencies updated...\033[0m"
#------------------------------------------------------------------------------
sinclude Depend