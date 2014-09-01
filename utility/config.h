/*************************************************************************
	> File Name: utility/config.h
	> Author: cjj
	> Created Time: Fri 29 Aug 2014 05:33:22 PM CST
 ************************************************************************/
#ifndef CONFIG_H
#define CONFIG_H

#include <string>
#include <string.h>

extern lua_State * L; 

class Config
{
public:
	static Config * GetInstance(const char * config_file = "./config.lua")
	{
		static Config _instance(L, config_file);
		return &_instance;
	}
	const char * GetServerAddr()
	{
		lua_getglobal(m_pLuaState, "g_serverAddr");
		strcpy(m_serverAddr, lua_tostring(m_pLuaState, 1));
		lua_pop(m_pLuaState, 1);
		return m_serverAddr;
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
	
	int GetLogLevel()
	{
		lua_getglobal(m_pLuaState, "log_level");
		int level = lua_tonumber(m_pLuaState, 1);
		lua_pop(m_pLuaState, 1);
		return level;
	}
private:
	Config(lua_State * L, const char * config_file) 
		: m_pLuaState(L)
	{
		if(luaL_loadfile(L, config_file) || lua_pcall(L, 0,0,0))
		{
			printf("%s\n",lua_tostring(L, -1));
			assert(false);
		}
	}
private:
	lua_State * m_pLuaState;
	char m_serverAddr[256];
	char m_serverName[256];
	int m_serverPort;
	size_t m_maxClient;
};

#endif
