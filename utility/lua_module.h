#ifndef LUA_MODULE_H
#define LUA_MODULE_H
#include <string.h>
#include "../include/lua.hpp"


typedef int (*luaFunc)(lua_State *);
class LuaRegister
{
public:
	LuaRegister(lua_State * &luaState){
		m_pLuaState = luaState;
	}
	virtual ~LuaRegister()
	{
		if(m_pObjName)
			delete m_pObjName;
	}
	
	void SetObjName(const char * objName)
	{
		int len = strlen(objName);
		m_pObjName = new char[len];
		strcpy(m_pObjName, objName);
	}
	
	void RegCObjConstruct(luaFunc func)
	{
		lua_pushcfunction(m_pLuaState,func);
		lua_setglobal(m_pLuaState, m_pObjName);		
		luaL_newmetatable(m_pLuaState, m_pObjName);
		lua_pushstring(m_pLuaState,"__index");
		lua_pushvalue(m_pLuaState,-2);
		lua_settable(m_pLuaState,-3);
		lua_pop(m_pLuaState,1);
	}
	
	void RegCObjDesConstruct(luaFunc func)
	{
		luaL_newmetatable(m_pLuaState, m_pObjName);
		lua_pushstring(m_pLuaState,"__gc");
		lua_pushcfunction(m_pLuaState,func);
		lua_settable(m_pLuaState,-3);
		lua_pop(m_pLuaState,1);
	}
	
	void RegMemFunction(const char * nameForLua, luaFunc func)
	{
		luaL_newmetatable(m_pLuaState, m_pObjName);
		lua_pushstring(m_pLuaState, nameForLua);
		lua_pushcfunction(m_pLuaState,func);
		lua_settable(m_pLuaState,-3);
		lua_pop(m_pLuaState,1);
	}
private:
	lua_State * m_pLuaState;
	char * m_pObjName;
};

#endif
