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
#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>

class Client
{
public:
	Client(lua_State * L) : m_pLuaState(L)
	{
		printf("Client: %p\n", this);
		m_ibuf = new CircularBuffer(0x10000);
		m_obuf = new CircularBuffer(0x10000);
	}

	~Client()
	{
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

	void ConnectServer(const char * serverAddr, int nPort)
	{
		m_socket = socket(AF_INET, SOCK_STREAM, 0);
		assert(-1 != m_socket);
		sockaddr_in saddr = {0};
		saddr.sin_port = htons(nPort);
		saddr.sin_family = AF_INET;
		saddr.sin_addr.s_addr = inet_addr(serverAddr);
		socklen_t len = sizeof(saddr);
		int res = connect(m_socket, (sockaddr*)&saddr, len);
		printf("connect result: %d\n", res);
		assert(0 == res);
		make_fd_nonblocking(m_socket);
		AddToDispatcher(EPOLLIN);

		WorldPacket pack1(15, 100);
		//pack1.WriteString("l_linchao");
		pack1.WriteString("l_chenjunji");
		pack1.WriteString("qaz");
		pack1.WriteString("123");
		SendPacket(pack1);

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
	
	void SendPacket(WorldPacket &pack)
	{
		printf("----------------SendPacket\n");
		pack.WriteHead();
		size_t len = pack.GetSize();
		m_obuf->Write((char*)pack.GetBuffer(), len);		
		ModifyIOEvent(EPOLLIN | EPOLLOUT);
	}
	
	void OnEventWriteable()
	{
		printf("-----------------event writeable\n");
		int length = m_obuf->GetLength();
		while(0 < length)
		{
			char * tmp = new char[length];
			m_obuf->Read(tmp, length);
			
			int res = send(m_socket, tmp, length, 0);
			for(int i = 0; i < length; ++i)
			{
				printf("%d ", tmp[i]);
			}
			printf("\n");
			length = m_obuf->GetLength();
			delete []tmp;
		}
		ModifyIOEvent(EPOLLIN);
	}
	
	void OnRecvPacket()
	{
		size_t length = m_ibuf->GetLength();
		size_t headSize = sizeof(m_pkHead); 
		while(headSize < length)
		{
			m_ibuf->SoftRead((char*)&m_pkHead.head, sizeof(m_pkHead));
			uint16_t size = ntohs(m_pkHead.head.size);
			printf("------OnRecvPacket--SoftRead------, buf length:%d, packet size:%d\n", length, size);
			if(length < size)
				break;
			uint16_t opCode = m_pkHead.head.opCode;			
			size += 2;
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
			res = recv(m_socket, buf, 1024, 0);
			if(res <= 0)
				break;
			m_ibuf->Write(buf, res);
			OnRecvPacket();
		}
	}
	
	void ProcPacket(WorldPacket & pack)
	{
		
		lua_getglobal(m_pLuaState, "c_procPacket");
		*(Client**)lua_newuserdata(m_pLuaState,sizeof(Client*)) = this;
		//从注册表中找到CTest元表并压入栈顶
		luaL_getmetatable(m_pLuaState, "Client");
		//将CTest元表作为用户数据的元表(由于对函数还不熟悉,开始理解成把userdata赋给CTest呢，哈哈)
		lua_setmetatable(m_pLuaState,-2);

		*(WorldPacket**)lua_newuserdata(m_pLuaState, sizeof(WorldPacket*)) = new WorldPacket(pack);
		luaL_getmetatable(m_pLuaState, "WorldPacket");
		lua_setmetatable(m_pLuaState, -2);
		lua_pcall(m_pLuaState, 2, 0, 0);
		/*
		uint16_t opcode = pack.GetOpcode();
		switch(opcode)
		{
			case 16:
			{
				printf("------proc packet:code:%d\n", opcode);
				WorldPacket retpack(28, 10);
				SendPacket(retpack);
			}
		}*/
	}
private:
	int m_socket;
	WorldPacket::PacketHead m_pkHead;
	CircularBuffer *m_ibuf;
	CircularBuffer *m_obuf;
	lua_State * m_pLuaState;
};

static int LuaFClient(lua_State* L)
{
	*(Client**)lua_newuserdata(L,sizeof(Client*)) = new Client(L);
	//从注册表中找到CTest元表并压入栈顶
	luaL_getmetatable(L, "Client");
	//将CTest元表作为用户数据的元表(由于对函数还不熟悉,开始理解成把userdata赋给CTest呢，哈哈)
	lua_setmetatable(L,-2);
	//该函数调用后栈里就是一个userdata了。
	return 0;	
}

static int LuaFSendPacket(lua_State * L)
{
	Client** pT = (Client**)lua_touserdata(L,1);
	WorldPacket** pV = (WorldPacket**)lua_touserdata(L,2);
	//打印成员变量的值
	(*pT)->SendPacket(**pV);
	return 0;
}

static int DestoryClient(lua_State* L)
{
	//释放对象
	delete *(Client**)lua_touserdata(L,1);
	return 0;
}
#endif
