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
EXTERN_DIR		=	../../../Extern
BIN_DIR 		=	../../../../Server/Share/Bin
BIN		= $(BIN_DIR)/GAME
SRC_DIR	=	../Srcs
OBJ_DIR = Objs
#------------------------------------------------------------------------------
$(shell if [ ! -d $(BIN_DIR) ]; then mkdir -p $(BIN_DIR); fi)
$(shell if [ ! -d $(OBJ_DIR) ]; then mkdir -p $(OBJ_DIR); fi)
#------------------------------------------------------------------------------
FLAGS	=	-g
FLAGS	+=	-ggdb
FLAGS	+=	-DNDEBUG
FLAGS	+=	-w
FLAGS	+=	-Wall
FLAGS	+=	-mtune=i686
FLAGS	+=	-m64
FLAGS	+=	-O2
FLAGS	+=	-pipe
FLAGS	+=	-fexceptions
FLAGS	+=	-D_THREAD_SAFE
FLAGS	+=	-fstack-protector-all
FLAGS	+=	-std=c++2a
#--Standart Libs---------------------------------------------------------------
LIBS	=	-pthread
LIBS	+=	-lm
LIBS	+=	-lmd
LIBS	+=	-lz
#--Boost-----------------------------------------------------------------------
INC_DIR	+=	-I$(EXTERN_DIR)/Common/Boost_1.81.0
#--CryptoPP--------------------------------------------------------------------
INC_DIR	+=	-I$(EXTERN_DIR)/Common/CryptoPP_8.7.0
LIB_DIR +=	-L$(EXTERN_DIR)/Common/CryptoPP_8.7.0/cryptopp
LIBS += -lcryptopp
#--DevIL-----------------------------------------------------------------------
INC_DIR += -I$(EXTERN_DIR)/Common/DevIL_1.8.0/Include
LIB_DIR += -L$(EXTERN_DIR)/Common/DevIL_1.8.0/Lib/FreeBSD_$(FREEBSD_VERSION)/$(ARCHITECTURE)
LIBS += -lIL -lpng -ltiff -lmng -llcms -ljpeg
#--Lua-----------------------------------------------------------------------
INC_DIR	+=	-I$(EXTERN_DIR)/Common/LibLua/5.0.3/include
LIB_DIR	+=	-L$(EXTERN_DIR)/Common/LibLua/5.0.3/lib/FreeBSD_$(FREEBSD_VERSION)/$(ARCHITECTURE)
LIBS	+=	-llua -llualib
#--MySQL-----------------------------------------------------------------------
INC_DIR	+=	-I$(EXTERN_DIR)/FreeBSD_$(FREEBSD_VERSION)/$(ARCHITECTURE)/MySQL_5.6.51/Include
LIB_DIR	+=	-L$(EXTERN_DIR)/FreeBSD_$(FREEBSD_VERSION)/$(ARCHITECTURE)/MySQL_5.6.51/Lib
LIBS += -lmysqlclient
#--LibTheCore------------------------------------------------------------------
INC_DIR	+=	-I../../LibTheCore/Srcs
LIB_DIR	+=	-L../../LibTheCore/Proj/lib/FreeBSD_$(FREEBSD_VERSION)/$(ARCHITECTURE)
LIBS	+=	-lthecore
#--LibPoly---------------------------------------------------------------------
INC_DIR	+=	-I../../LibPoly/Srcs
LIB_DIR	+=	-L../../LibPoly/Proj/lib/FreeBSD_$(FREEBSD_VERSION)/$(ARCHITECTURE)
LIBS	+=	-lpoly
#--LibSQL----------------------------------------------------------------------
INC_DIR	+=	-I../../LibSQL/Srcs
LIB_DIR	+=	-L../../LibSQL/Proj/lib/FreeBSD_$(FREEBSD_VERSION)/$(ARCHITECTURE)
LIBS	+=	-lsql
#--LibGame---------------------------------------------------------------------
INC_DIR	+=	-I../../LibGame/Srcs
LIB_DIR	+=	-L../../LibGame/Proj/lib/FreeBSD_$(FREEBSD_VERSION)/$(ARCHITECTURE)
LIBS	+=	-lgame
#------------------------------------------------------------------------------
C_SRCS	= minilzo.c

SRCS	=	\
			BattleArena.cpp				\
			FSM.cpp						\
			MarkConvert.cpp				\
			MarkImage.cpp				\
			MarkManager.cpp				\
			OXEvent.cpp					\
			TrafficProfiler.cpp			\
			ani.cpp						\
			arena.cpp					\
			banword.cpp					\
			battle.cpp					\
			blend_item.cpp				\
			block_country.cpp			\
			buffer_manager.cpp			\
			building.cpp				\
			castle.cpp					\
			char.cpp					\
			char_affect.cpp				\
			char_battle.cpp				\
			char_change_empire.cpp		\
			char_horse.cpp				\
			char_item.cpp				\
			char_manager.cpp			\
			char_quickslot.cpp			\
			char_resist.cpp				\
			char_skill.cpp				\
			char_state.cpp				\
			PetSystem.cpp				\
			cmd.cpp						\
			cmd_emotion.cpp				\
			cmd_general.cpp				\
			cmd_gm.cpp					\
			cmd_oxevent.cpp				\
			config.cpp					\
			constants.cpp				\
			crc32.cpp					\
			cube.cpp					\
			db.cpp						\
			desc.cpp					\
			desc_client.cpp				\
			desc_manager.cpp			\
			desc_p2p.cpp				\
			dev_log.cpp					\
			dungeon.cpp					\
			empire_text_convert.cpp		\
			entity.cpp					\
			entity_view.cpp				\
			event.cpp					\
			event_queue.cpp				\
			exchange.cpp				\
			file_loader.cpp				\
			fishing.cpp					\
			gm.cpp						\
			guild.cpp					\
			guild_manager.cpp			\
			guild_war.cpp				\
			horse_rider.cpp				\
			horsename_manager.cpp		\
			input.cpp					\
			input_auth.cpp				\
			input_db.cpp				\
			input_login.cpp				\
			input_main.cpp				\
			input_p2p.cpp				\
			input_teen.cpp				\
			input_udp.cpp				\
			ip_ban.cpp					\
			item.cpp					\
			item_addon.cpp				\
			item_attribute.cpp			\
			item_manager.cpp			\
			item_manager_idrange.cpp	\
			locale.cpp					\
			locale_service.cpp			\
			log.cpp						\
			login_data.cpp				\
			lzo_manager.cpp				\
			marriage.cpp				\
			matrix_card.cpp				\
			messenger_manager.cpp		\
			mining.cpp					\
			mob_manager.cpp				\
			monarch.cpp					\
			motion.cpp					\
			over9refine.cpp				\
			p2p.cpp						\
			packet_info.cpp				\
			party.cpp					\
			passpod.cpp					\
			pcbang.cpp					\
			polymorph.cpp				\
			priv_manager.cpp			\
			pvp.cpp						\
			questevent.cpp				\
			questlua.cpp				\
			questlua_affect.cpp			\
			questlua_arena.cpp			\
			questlua_ba.cpp				\
			questlua_building.cpp		\
			questlua_danceevent.cpp		\
			questlua_dungeon.cpp		\
			questlua_forked.cpp			\
			questlua_game.cpp			\
			questlua_global.cpp			\
			questlua_guild.cpp			\
			questlua_horse.cpp			\
			questlua_pet.cpp			\
			questlua_item.cpp			\
			questlua_marriage.cpp		\
			questlua_mgmt.cpp			\
			questlua_monarch.cpp		\
			questlua_npc.cpp			\
			questlua_oxevent.cpp		\
			questlua_party.cpp			\
			questlua_pc.cpp				\
			questlua_quest.cpp			\
			questlua_target.cpp			\
			questmanager.cpp			\
			questnpc.cpp				\
			questpc.cpp					\
			refine.cpp					\
			regen.cpp					\
			safebox.cpp					\
			sectree.cpp					\
			sectree_manager.cpp			\
			sequence.cpp				\
			shop.cpp					\
			skill.cpp					\
			start_position.cpp			\
			target.cpp					\
			text_file_loader.cpp		\
			trigger.cpp					\
			utils.cpp					\
			vector.cpp					\
			war_map.cpp					\
			wedding.cpp					\
			xmas_event.cpp				\
			panama.cpp					\
			threeway_war.cpp			\
			map_location.cpp			\
			auth_brazil.cpp				\
			BlueDragon.cpp				\
			BlueDragon_Binder.cpp		\
			DragonLair.cpp				\
			questlua_dragonlair.cpp		\
			skill_power.cpp				\
			affect.cpp					\
			SpeedServer.cpp				\
			questlua_speedserver.cpp	\
			auction_manager.cpp			\
			FileMonitor_FreeBSD.cpp		\
			ClientPackageCryptInfo.cpp	\
			cipher.cpp					\
			buff_on_attributes.cpp		\
			dragon_soul_table.cpp		\
			DragonSoul.cpp				\
			group_text_parse_tree.cpp	\
			char_dragonsoul.cpp			\
			questlua_dragonsoul.cpp		\
			shop_manager.cpp			\
			shopEx.cpp					\
			item_manager_read_tables.cpp \
			main.cpp
#------------------------------------------------------------------------------
OBJS	=	$(SRCS:%.cpp=$(OBJ_DIR)/%.o)
C_OBJS	=	$(C_SRCS:%.c=$(OBJ_DIR)/%.o)
#------------------------------------------------------------------------------
SRC		=	$(SRCS:%.cpp=$(SRC_DIR)/%.cpp)
C_SRC	=	$(C_SRCS:%.c=$(SRC_DIR)/%.c)
#------------------------------------------------------------------------------
default:
	@clear
	@echo -e "\033[35mGame\033[0m\t\033[31m- Invalid usage !!!\033[0m"
	@echo -e ""
#------------------------------------------------------------------------------
berqq:	clean_bin dep $(BIN)
#------------------------------------------------------------------------------
berqq_c:	clean dep $(BIN)
#------------------------------------------------------------------------------

$(BIN): $(OBJS) $(C_OBJS)
	@echo -e "\033[35mGame\t\033[0m\033[32m- Linking...\033[0m\t\t\033[32m$(BIN)\033[0m"
	@$(CXX) $(FLAGS) $(LIB_DIR) $(OBJS) $(C_OBJS) $(LIBS) -o $(BIN)
#------------------------------------------------------------------------------
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@echo -e "\033[35mGame\033[0m\t\033[1m- Compiling...\033[0m\t\t\033[32m$(<F)\033[0m"
	@$(CXX) $(FLAGS) $(INC_DIR) -c $< -o $@

$(OBJ_DIR)/minilzo.o: $(SRC_DIR)/minilzo.c
	@echo -e "\033[35mGame\033[0m\t\033[1m- Compiling...\033[0m\t\t\033[32m$(<F)\033[0m"
	@$(CXX) $(FLAGS) $(INC_DIR) -c $< -o $@
#------------------------------------------------------------------------------
clean:
	@rm -f $(OBJ_DIR)/*.o
	@echo -e "\033[35mGame\t\033[0m\033[33m- Object files deleted...\033[0m"
	@rm -f $(BIN)
	@echo -e "\033[35mGame\t\033[0m\033[33m- Binary file deleted...\033[0m"
	@sleep 3
#------------------------------------------------------------------------------
clean_bin:
	@rm -f $(BIN)
	@echo -e "\033[35mGame\t\033[0m\033[33m- Binary file deleted...\033[0m"
	@sleep 3
#------------------------------------------------------------------------------
dep:
	@touch Depend
	@makedepend -fDepend $(INC_DIR) -I/usr/include/c++/3.3 -I/usr/include/c++/4.2 -p$(OBJ_DIR)/ $(SRC_DIR)/$(SRCS) $(SRC_DIR)/$(C_SRCS) 2> /dev/null > Depend
	@echo -e "\033[35mGame\t\033[0m\033[33m- Dependencies updated...\033[0m"
#------------------------------------------------------------------------------
sinclude Depend