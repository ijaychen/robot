#include "./utility/lua_module.h"
#include "client.h"
#include "./utility/get_lua_file.h"
#include "./event/dispatcher.h"
#include "./utility/config.h"
#include "./utility/log.h"
#include "init.h"
#include <unistd.h>
#include <signal.h>
#include <stdlib.h>

void exit_signal_handle(int sig);

lua_State * L; 
Client ** cln = 0;
int max_client = 0;

int main()
{
	L = init_lua_state();
	//读取配置文件(一定要放在所有加载文件之前)
	Config * g_config = Config::GetInstance();
	//加载scripts目录下所以lua文件
	load_lua_scripts(L);
	//加载scripts/csv目录下所有csv文件
	load_csv_by_lua(L);
	//注册ctrl+c信号处理函数
	signal(SIGINT, exit_signal_handle);
	//init_robot_by_lua(L);
	//const char * server_addr = g_config->GetServerAddr();
	const char * server_name = g_config->GetServerName();
	int server_port = g_config->GetServerPort();
	max_client = g_config->GetMaxClient();
	char msg[256] = {0};
	sprintf(msg, "server name:%s, port:%d\tclient count:%d\n", server_name, server_port, max_client);
	debug_log(msg);
	cln = new Client*[max_client];
	for(int i = 0; i < max_client; ++i)
	{
		char clnName[128] = {0};
		sprintf(clnName, "qaz%d", i);
		cln[i] = new Client(L, clnName, "1");
		cln[i]->ConnectServer("127.0.0.1", server_port, server_name);
	}
	g_dispatcher->Dispatch();
	return 0;
}





void exit_signal_handle(int sig)
{
	for(int i = 0; i < max_client; ++i)
	{
		if(cln[i])
		{
			delete cln[i];
		}
	}
	printf("ctrl + c; curTime:%d\n", time(NULL));
	lua_close(L);
	exit(0);
}
