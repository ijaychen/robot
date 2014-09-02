/*************************************************************************
	> File Name: init.h
	> Author: cjj
	> Created Time: 2014年08月30日 星期六 23时51分39秒
 ************************************************************************/
#ifndef INIT_H
#define INIT_H

static lua_State * init_lua_state()
{
	lua_State * L = luaL_newstate();
	luaL_openlibs(L);
	
	lua_pushcfunction(L, CDebug_Log);
	lua_setglobal(L, "debug_log");
	LuaRegister luaReg(L);
	
	luaReg.SetObjName("WorldPacket");
	luaReg.RegCObjConstruct(CWorldPacket);
	luaReg.RegCObjDesConstruct(DestoryPacket);
	luaReg.RegMemFunction("GetOpcode", CGetOpcode);
	luaReg.RegMemFunction("WriteString", CWriteString);
	luaReg.RegMemFunction("WriteUInt", CWriteUInt);
	luaReg.RegMemFunction("WriteUShort", CWriteUShort);	
	luaReg.RegMemFunction("WriteByte", CWriteByte);
	luaReg.RegMemFunction("ReadString", CReadString);
	luaReg.RegMemFunction("ReadUInt", CReadUInt);
	luaReg.RegMemFunction("ReadUShort", CReadUShort);
	luaReg.RegMemFunction("ReadByte", CReadByte);
	luaReg.RegMemFunction("Print", CallPrint);
	luaReg.RegMemFunction("GetSize", CGetSize);
	
	
	luaReg.SetObjName("Client");
	luaReg.RegCObjConstruct(LuaFClient);
	//luaReg.RegCObjDesConstruct(DestoryClient);
	luaReg.RegMemFunction("SendPacket", LuaFSendPacket);
	luaReg.RegMemFunction("ConnectServer", LuaFConnectServer);
	luaReg.RegMemFunction("GetAccountName", LuaFGetAccountName);
	luaReg.RegMemFunction("SetPingTimer", LuaFSetPingTimer);
	
	return L;
}

static void load_lua_scripts(lua_State * L)
{
	std::vector<std::string> filename;
	get_lua_file(filename, "./scripts");
	std::vector<std::string>::iterator iter = filename.begin();
	debug_log("----------lua file list---------------\n");
	for(iter; iter != filename.end(); ++iter)
	{
		if(luaL_loadfile(L, (*iter).c_str()) || lua_pcall(L, 0, 0, 0))
		{
			printf("%s\n", lua_tostring(L, -1)); 
			return;
		}
		debug_log((*iter).c_str());
	}
	debug_log("----------lua file list---------------\n");
}

static void load_csv_by_lua(lua_State * L)
{
	lua_getglobal(L, "c_loadCSVFiles");
	if(lua_pcall(L, 0, 0, 0))
	{
		printf("%s\n", lua_tostring(L, -1)); 
	}
}

static void init_robot_by_lua(lua_State * L)
{
	/*lua_getglobal(L, "c_initRobot");
	if(lua_pcall(L, 0, 0, 0))
	{
		debug_log(lua_tostring(L, -1), log_error); 
	}	*/
}


#endif
