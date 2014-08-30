/*************************************************************************
	> File Name: utility/config.h
	> Author: cjj
	> Created Time: Fri 29 Aug 2014 05:33:22 PM CST
 ************************************************************************/
#ifndef CONFIG_H
#define CONFIG_H

#include <string.h>
#include "log.h"

class Config
{
public:
	Config(lua_State * L, const char * config_file = "./config.lua") 
		: m_pLuaState(L)
	{
		if(luaL_loadfile(L, config_file) || lua_pcall(L, 0,0,0))
		{
			debug_log(lua_tostring(L, -1), "ERROR");
			assert(false);
		}
	}

	const char * GetServerName(){
		lua_getglobal(m_pLuaState, "g_serverName");
		strcpy(m_serverName, lua_tostring(m_pLuaState, 1));
		lua_pop(m_pLuaState, 1);
		return m_serverName;
	}

	int GetServerPort()
	{
		lua_getglobal(m_pLuaState, "g_serverPort");
		m_serverPort = lua_tonumber(m_pLuaState, 1);
		lua_pop(m_pLuaState, 1);
		return m_serverPort;
	}

	size_t GetMaxClient()
	{
		lua_getglobal(m_pLuaState, "g_maxClient");
		m_maxClient = lua_tonumber(m_pLuaState, 1);
		lua_pop(m_pLuaState, 1);
		return m_maxClient;
	}

private:
	lua_State * m_pLuaState;
	char m_serverName[256];
	int m_serverPort;
	size_t m_maxClient;
};

#endif
