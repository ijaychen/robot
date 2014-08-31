/*************************************************************************
	> File Name: utility/log.h
	> Author: cjj
	> Created Time: 2014年08月30日 星期六 09时16分40秒
 ************************************************************************/
#ifndef LOG_H
#define LOG_H

#include <stdio.h>
#include "../include/lua.hpp"
#include "config.h"

enum log_type
{
	log_none = 0,
	log_info,
	log_warning,
	log_error,
};

static void debug_log(const char * msg, int type = log_info) //const char * debug_level = "INFO")
{
	Config * config = Config::GetInstance();
	int logLevel = config->GetLogLevel();
	if(0 == logLevel) 
		return;	
	if(logLevel > type)
		return;
	char debug_level[32] = {0};
	switch(type)
	{
	case log_info:
		strcpy(debug_level, "INFO");
		break;
	case log_warning:
		strcpy(debug_level, "WARNING");
		break;
	case log_error:
		strcpy(debug_level, "ERROR");
		break;
	default:
		return;
		break;
	}
	printf("%s:\t%s\n", debug_level, msg);
}

//注册到lua中
static int CDebug_Log(lua_State * L)
{
	const char * msg = luaL_checkstring(L, 1);
	int level = luaL_checknumber(L, 2);
	debug_log(msg, level);
	return 0;
}
#endif
