#ifndef __INC_METiN_II_DBSERV_STDAFX_H__
#define __INC_METiN_II_DBSERV_STDAFX_H__

#include "../../LibTheCore/Srcs/stdafx.h"

#ifndef __WIN32__
#include <semaphore.h>
#else
#define isdigit iswdigit
#define isspace iswspace
#endif

#include "../../Common/length.h"
#include "../../Common/tables.h"
#include "../../Common/singleton.h"
#include "../../Common/utils.h"
#include "../../Common/stl.h"
#include "../../Common/service.h"

#endif
