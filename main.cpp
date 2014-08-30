#include "./utility/lua_module.h"
#include "client.h"
#include "./utility/get_lua_file.h"
#include "./event/dispatcher.h"
#include "./utility/config.h"

extern char g_serverName[];

static lua_State * initLuaState()
{
	lua_State * L = luaL_newstate();
	luaL_openlibs(L);
	LuaRegister luaReg(L);
	
	luaReg.SetObjName("WorldPacket");
	luaReg.RegCObjConstruct(CWorldPacket);
	luaReg.RegCObjDesConstruct(DestoryPacket);
	luaReg.RegMemFunction("GetOpcode", CGetOpcode);
	luaReg.RegMemFunction("WriteString", CWriteString);
	luaReg.RegMemFunction("WriteUInt", CWriteUInt);
	luaReg.RegMemFunction("WriteByte", CWriteByte);
	luaReg.RegMemFunction("ReadString", CReadString);
	luaReg.RegMemFunction("ReadUInt", CReadUInt);
	luaReg.RegMemFunction("ReadUShort", CReadUShort);
	luaReg.RegMemFunction("ReadByte", CReadByte);
	luaReg.RegMemFunction("Print", CallPrint);
	
	luaReg.SetObjName("Client");
	luaReg.RegCObjConstruct(LuaFClient);
	luaReg.RegCObjDesConstruct(DestoryClient);
	luaReg.RegMemFunction("SendPacket", LuaFSendPacket);
	
	return L;
}

static void loadLuaScripts(lua_State * L)
{
	std::vector<std::string> filename;
	get_lua_file(filename, "./scripts");
	std::vector<std::string>::iterator iter = filename.begin();
	printf("----------lua file list---------------\n");
	for(iter; iter != filename.end(); ++iter)
	{
		if(luaL_loadfile(L, (*iter).c_str()) || lua_pcall(L, 0, 0, 0))
		{
			printf("lua load file error\n");
			return;
		}
		printf("%s\n", (*iter).c_str());
	}
	printf("----------lua file list---------------\n");
}

int main()
{
	lua_State * L  = initLuaState();
	loadLuaScripts(L);
	Config config(L);
	const char * server_name = config.GetServerName();
	int server_port = config.GetServerPort();
	int max_client = config.GetMaxClient();
	printf("server name:%s, port:%d\n", server_name, server_port);
	printf("max client count:%d\n", max_client);
	Client cln(L);
	//cln.ConnectServer("127.0.0.1", 6739);
	//cln.ConnectServer("127.0.0.1", 12736);
	//g_dispatcher->Dispatch();
	lua_close(L);
	return 0;
}
