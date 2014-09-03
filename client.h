#ifndef CLIENT_H
#define CLIENT_H

#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <sys/epoll.h>
#include <assert.h>
#include "./utility/world_packet.h"
#include "./utility/circular_buffer.h"
#include "./event/dispatcher.h"
#include "./event/timer.h"
#include "./utility/log.h"
#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <errno.h>

class Client
{
public:
	Client(lua_State * L, const char * accountName = "", const char * passwd = "")
		: m_pLuaState(L)
	{
		strcpy(m_accountName, accountName);
		strcpy(m_passwd, passwd);
		m_ibuf = new CircularBuffer(0x10000);
		m_obuf = new CircularBuffer(0x10000);
	}

	virtual ~Client()
	{
		printf("~Client:%p\n", this);
		if(m_ibuf)
			delete m_ibuf;
		if(m_obuf)
			delete m_obuf;
	}
	// 设置fd为非阻塞模式
	void make_fd_nonblocking(int fd)
	{
		int opts = fcntl(fd, F_GETFL);
		assert(opts != -1);

		opts = opts | O_NONBLOCK;
		int rc = 0;
		rc = fcntl(fd, F_SETFL, opts);
		assert(rc != -1);
	}

	void ConnectServer(const char * serverAddr, int nPort, const char * serverName)
	{
		m_socket = socket(AF_INET, SOCK_STREAM, 0);
		assert(-1 != m_socket);
		sockaddr_in saddr = {0};
		saddr.sin_port = htons(nPort);
		saddr.sin_family = AF_INET;
		saddr.sin_addr.s_addr = inet_addr(serverAddr);
		socklen_t len = sizeof(saddr);
		int res = connect(m_socket, (sockaddr*)&saddr, len);
		printf("connect result: %d, client:%s\n", res, m_accountName);
		//assert(0 == res);
		make_fd_nonblocking(m_socket);
		AddToDispatcher(EPOLLIN);
		SendLoginPacket(serverName);
	}


	void SendLoginPacket(const char * serverName)
	{
		WorldPacket pack(15, 100);
		pack.WriteString(serverName);
		pack.WriteString(m_accountName);
		pack.WriteString(m_passwd);
		SendPacket(pack);
		
	}
	
	void SendPingPacket()
	{
		WorldPacket pack(1, 30);
		pack.WriteUInt(1);
		pack.WriteUInt(0);
		SendPacket(pack);
		lua_getglobal(m_pLuaState, "c_move");
		*(Client**)lua_newuserdata(m_pLuaState,sizeof(Client*)) = this;
		luaL_getmetatable(m_pLuaState, "Client");
		lua_setmetatable(m_pLuaState,-2);

		if(lua_pcall(m_pLuaState, 1, 0, 0)){
			printf("%s\n", lua_tostring(m_pLuaState, -1));
		}
	}
	
	void SetPingTimer()
	{
		TimerManager * g_TimerManager = TimerManager::GetInstance();
		Timer * timer = new Timer(5, this, &Client::SendPingPacket);
		g_TimerManager->InsertTimer(timer);
		printf("------------=============>>>SetPingTimer\n");
	}
	
	void AddToDispatcher(int evt)
	{
		Dispatcher::GetInstance()->AddIofd(m_socket, this);
		int epfd = Dispatcher::GetInstance()->GetDispatchfd();
		epoll_event ee;
		ee.events = EPOLLET | evt;
		ee.data.ptr = this;
		int r = epoll_ctl(epfd, EPOLL_CTL_ADD, m_socket, &ee);
		assert(r == 0);
	}
	
	
	void ModifyIOEvent(int evt)
	{	
		//Dispatcher::GetInstance()->AddIofd(m_socket, this);
		int epfd = Dispatcher::GetInstance()->GetDispatchfd();
		epoll_event ee;
		ee.events = EPOLLET | evt;
		ee.data.ptr = this;
		int r = epoll_ctl(epfd, EPOLL_CTL_MOD, m_socket, &ee);
		assert(r == 0);
	}
	
	void SendPacket(WorldPacket pack)
	{
		pack.WriteHead();
		size_t len = pack.GetSize();
		m_obuf->Write((char*)pack.GetBuffer(), len);		
		ModifyIOEvent(EPOLLIN | EPOLLOUT);
	}
	
	void OnEventWriteable()
	{
		int length = m_obuf->GetLength();
		while(0 < length)
		{
			char * tmp = new char[length];
			m_obuf->Read(tmp, length);
			
			int res = send(m_socket, tmp, length, 0);
			/*printf("---------------------send packet: res\n", res);
			for(int i = 0; i < length; ++i)
			{
				printf("%d ", tmp[i]);
			}
			printf("\n");
			*/
			length = m_obuf->GetLength();
			delete []tmp;
		}
		ModifyIOEvent(EPOLLIN);
	}
	
	void OnRecvPacket()
	{
		size_t length = m_ibuf->GetLength();
		size_t headSize = sizeof(m_pkHead); 
		char msg[256] = {0};
		sprintf(msg, "length:%d, headSize:%d\n", length, headSize);
		debug_log(msg, log_info);
		while(headSize <= length)
		{
			m_ibuf->SoftRead((char*)&m_pkHead.head, sizeof(m_pkHead));
			uint16_t size = ntohs(m_pkHead.head.size) + 2;
			char msg[256] = {0};
			sprintf(msg, "------OnRecvPacket--SoftRead------, buf length:%d, packet size:%d\n", length, size);			
			debug_log(msg, log_info);
			if(length < size)
				break;
			uint16_t opCode = m_pkHead.head.opCode;			
			WorldPacket pkin(opCode, size);
			pkin.Resize(size);
			if(m_ibuf->Read((char*)pkin.GetBuffer(), size))
			{
				ProcPacket(pkin);
			}
			length = m_ibuf->GetLength();
		}
	}
	
	void OnEventReadable()
	{
		int res;
		while(true)
		{
			char buf[1024] = {0};
			char msg[128] = {0};
			res = recv(m_socket, buf, 1024, 0);
			sprintf(msg, "------------------recv res:%d!", res);
			debug_log(msg, log_info);
			if(res < 0){
				if (errno == EAGAIN || errno == EWOULDBLOCK){
					debug_log("recv msg finish", log_info);
                    ; // 没有更多数据了
                }
				else{
					sprintf(msg, "recv msg error,errno:%d!", errno);
					debug_log(msg, log_error);
				}
				break;
			}
			if(0 == res)
			{
				printf("server disconnected! user:%s\n", GetAccountName());
				break;
			}
			m_ibuf->Write(buf, res);
			OnRecvPacket();
		}
	}
	
	void ProcPacket(WorldPacket & pack)
	{
		lua_getglobal(m_pLuaState, "c_procPacket");
		*(Client**)lua_newuserdata(m_pLuaState,sizeof(Client*)) = this;
		luaL_getmetatable(m_pLuaState, "Client");
		lua_setmetatable(m_pLuaState,-2);

		*(WorldPacket**)lua_newuserdata(m_pLuaState, sizeof(WorldPacket*)) = new WorldPacket(pack);
		luaL_getmetatable(m_pLuaState, "WorldPacket");
		lua_setmetatable(m_pLuaState, -2);
		if(lua_pcall(m_pLuaState, 2, 0, 0)){
			printf("%s\n", lua_tostring(m_pLuaState, -1));
		}
	}
	const char * GetAccountName() const 
	{
		return m_accountName;
	}
private:
	int m_socket;
	WorldPacket::PacketHead m_pkHead;
	CircularBuffer *m_ibuf;
	CircularBuffer *m_obuf;
	lua_State * m_pLuaState;
	char m_accountName[256];
	char m_passwd[256];
};

static int LuaFClient(lua_State* L)
{
	const char * name = luaL_checkstring(L, 1);
	const char * passwd = luaL_checkstring(L, 2);
	*(Client**)lua_newuserdata(L,sizeof(Client*)) = new Client(L, name, passwd);
	luaL_getmetatable(L, "Client");
	lua_setmetatable(L,-2);

	return 0;	
}

static int LuaFSendPacket(lua_State * L)
{
	Client** pClient = (Client**)luaL_checkudata(L, 1, "Client");
	WorldPacket** pPack = (WorldPacket**)luaL_checkudata(L, 2, "WorldPacket");
	(*pClient)->SendPacket(**pPack);
	return 0;
}

static int LuaFConnectServer(lua_State * L)
{
	Client** pClient = (Client**)luaL_checkudata(L, 1, "Client");
	const char * ip = luaL_checkstring(L, 2);
	int port = luaL_checknumber(L, 3);
	const char * serverName = luaL_checkstring(L, 4);
	char msg[128] = {0};
	sprintf(msg, "serverIp:%s, port:%d", ip, port);
	debug_log(msg);
	debug_log(serverName);
	(*pClient)->ConnectServer(ip, port, serverName);
	return 1;
}

static int LuaFSetPingTimer(lua_State * L)
{
	Client** pClient = (Client**)luaL_checkudata(L, 1, "Client");
	(*pClient)->SetPingTimer();
}

static int LuaFGetAccountName(lua_State * L)
{
	Client** pClient = (Client**)luaL_checkudata(L, 1, "Client");
	lua_pushstring(L, (*pClient)->GetAccountName());
	return 1;
}

static int DestoryClient(lua_State* L)
{
	debug_log("-------------->>>>>>>>>>>>>>>>DestoryClient");
	delete *(Client**)lua_touserdata(L,1);
	return 0;
}
#endif
