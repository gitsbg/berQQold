// Basic features
// Enable or disable memory pooling for specific object types
//#define M2_USE_POOL
// Enable or disable heap allocation debugging
//#define DEBUG_ALLOC

#include "debug_allocator.h"

#include "../../LibTheCore/Srcs/stdafx.h"

#include "../../Common/singleton.h"
#include "../../Common/utils.h"
#include "../../Common/service.h"

#include <algorithm>
#include <math.h>
#include <list>
#include <map>
#include <set>
#include <queue>
#include <string>
#include <vector>

#ifdef __GNUC__
#include <float.h>
#include <unordered_map>
#include <unordered_set>
#define TR1_NS std::tr1
#else
#include <unordered_map>
#include <unordered_set>
#define TR1_NS boost
#define isdigit iswdigit
#define isspace iswspace
#endif

#include "typedef.h"
#include "locale.hpp"
#include "event.h"

#define PASSES_PER_SEC(sec) ((sec) * passes_per_sec)

#ifndef M_PI
#define M_PI    3.14159265358979323846 /* pi */
#endif
#ifndef M_PI_2
#define M_PI_2  1.57079632679489661923 /* pi/2 */
#endif

#define IN
#define OUT
