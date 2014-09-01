/*************************************************************************
	> File Name: WorldPacket.h
	> Author: cjj
	> Created Time: 2014年08月23日 星期六 17时11分28秒
 ************************************************************************/
#ifndef WORLD_PACKET_H
#define WORLD_PACKET_H

#include "../include/global.h"
#include "../include/lua.hpp"
#include <iostream>
#include <stdio.h>

class WorldPacket
{
public:
	static const uint32_t HEAD_SIZE = 4;
	union PacketHead {
		char data[4];
		struct {
			uint16_t size;
			uint16_t opCode;
		} head;
	};
	
	WorldPacket(uint16_t opCode, uint16_t size)
	{
		m_pos = 0;
		m_storage.reserve(size);
		m_opCode = opCode;
		skipTo(HEAD_SIZE);
	}
	
	WorldPacket(const WorldPacket& pack) : m_storage(pack.m_storage)
	{
		m_pos = pack.m_pos;
		m_opCode = pack.m_opCode;
	}
	
	virtual ~WorldPacket()
	{
		//m_storage.clear();
	}

	uint16_t GetOpcode() const 
	{
		return m_opCode;
	}

	const uint8_t * GetBuffer() const 
	{
		return &m_storage[0];
	}
	
	void Resize(size_t newsize)
	{
		m_storage.resize(newsize);
		m_pos = 0;
	}
	
	uint16_t GetSize() const
	{
		return m_storage.size();
	}
	
	void WriteUShort(uint16_t val)
	{
		PutByte(reinterpret_cast<const uint8_t *>(&val), 2);
	}
	
	void WriteUInt(uint32_t val)
	{
		PutByte(reinterpret_cast<const uint8_t *>(&val), 4);
	}

	void WriteString(const char * src)
	{
		uint16_t len = strlen(src);
		PutByte(reinterpret_cast<const uint8_t *>(&len), 2);
		PutByte((uint8_t*)src, len);
		//uint8_t ch = 0;
		//PutByte((uint8_t*)&ch, sizeof(ch));
	}

	void WriteByte(int8_t val)
	{
		PutByte(reinterpret_cast<const uint8_t *>(&val), 1);
	}
	
	uint32_t ReadUShort()
	{
		uint16_t val;
		GetByte(reinterpret_cast<char*>(&val), 2);
		return val;
	}
	
	uint32_t ReadUInt()
	{
		uint32_t val;
		GetByte(reinterpret_cast<char*>(&val), 4);
		return val;
	}

	void ReadString(std::string &str)
	{
		uint16_t len;
		GetByte(reinterpret_cast<char *>(&len), 2);
		str.resize(len);
		char * dst = const_cast<char*>(str.c_str());
		GetByte(dst, len);
	}

	std::string ReadString()
	{
		std::string str;
		ReadString(str);
		return str;
	}

	int8_t ReadByte()
	{
		int8_t val;
		GetByte(reinterpret_cast<char*>(&val), 1);
		return val;
	}
	
	void skipTo(uint32_t pos)
	{
		m_pos = pos;
	}
	
	void WriteHead()
	{
		skipTo(0);
		if(m_storage.size() < HEAD_SIZE){
			m_storage.resize(HEAD_SIZE);
		}
		WriteUShort(htons(m_storage.size() - HEAD_SIZE + 2));
		WriteUShort(m_opCode);
	}
	void print()
	{
		printf("-----------------------------------pack");
		size_t size = m_storage.size();
		printf("size:%d\n", m_storage.size());	
		//skipTo(HEAD_SIZE);
		//for(int i = 0; i )
		printf("-----------------------------------pack");
	}
private:
	void PutByte(const uint8_t * src, size_t count)
	{
		if(m_pos + count >= m_storage.size())
		{
			m_storage.resize(m_pos + count);
		}
		memcpy(&m_storage[m_pos], src, count);
		m_pos += count;
	}

	void GetByte(char * dst, size_t count)
	{
		if(m_pos < HEAD_SIZE)
		{
			skipTo(HEAD_SIZE);
		}
		//assert(m_pos + count <= m_storage.size());
		if(m_pos + count <= m_storage.size())
		{
			char ch = 0;
			memcpy(dst, &ch, count);
		}
		memcpy(dst, &m_storage[m_pos], count);
		m_pos += count;
	}

private:
	std::vector<uint8_t> m_storage;
	size_t m_pos;
	uint16_t m_opCode;
};

//导出一个函数到Lua,用于创建C++类
static int CWorldPacket(lua_State* L)
{
	//取出构造函数参数
	uint16_t opCode = luaL_checkinteger(L, 1);//lua_tointeger(L,1);
	uint16_t size = luaL_checkinteger(L, 2);//lua_tointeger(L,2);
	*(WorldPacket**)lua_newuserdata(L,sizeof(WorldPacket*)) = new WorldPacket(opCode, size);
	//从注册表中找到WorldPacket元表并压入栈顶
	luaL_getmetatable(L, "WorldPacket");
	//将WorldPacket元表作为用户数据的元表
	lua_setmetatable(L,-2);
	//该函数调用后栈里就是一个userdata了。
	return 1;
}


static int CGetOpcode(lua_State * L)
{
	WorldPacket** pPack = (WorldPacket**)luaL_checkudata(L, 1, "WorldPacket");//(WorldPacket**)lua_touserdata(L, 1);
	uint16_t code = (*pPack)->GetOpcode();
	lua_pushnumber(L, code);
	return 1;
}

static int CWriteUInt(lua_State* L)
{
	WorldPacket** pPack = (WorldPacket**)luaL_checkudata(L, 1, "WorldPacket");
	uint32_t val = luaL_checknumber(L, 2);
	//printf("CWriteUInt:%ld\n", val);
	(*pPack)->WriteUInt(val);
	return 0;
}


static int CWriteString(lua_State* L)
{
	WorldPacket** pPack = (WorldPacket**)luaL_checkudata(L, 1, "WorldPacket");
	const char * str = luaL_checkstring(L, 2);
	printf("CWriteString:%s\n", str);
	(*pPack)->WriteString(str);
	return 0;
}

static int CWriteByte(lua_State* L)
{
	WorldPacket** pPack = (WorldPacket**)luaL_checkudata(L, 1, "WorldPacket");
	uint8_t val = luaL_checknumber(L, 2);
	printf("CWriteByte:%d\n", val);
	(*pPack)->WriteByte(val);
	return 0;	
}

static int CReadUInt(lua_State* L)
{
	WorldPacket** pPack = (WorldPacket**)luaL_checkudata(L, 1, "WorldPacket");
	uint32_t val = (*pPack)->ReadUInt();
	//printf("CReadUInt:%ld\n", val);
	lua_pushnumber(L, val);
	return 1;
}

static int CReadUShort(lua_State* L)
{
	WorldPacket** pPack = (WorldPacket**)luaL_checkudata(L, 1, "WorldPacket");
	uint32_t val = (*pPack)->ReadUShort();
	printf("ReadUShort:%d\n", val);
	lua_pushnumber(L, val);
	return 1;
}

static int CReadString(lua_State* L)
{
	WorldPacket** pPack = (WorldPacket**)luaL_checkudata(L, 1, "WorldPacket");
	std::string str = (*pPack)->ReadString();
	//printf("CReadString:%s\n", str.c_str());
	lua_pushstring(L, str.c_str());
	return 1;
}

static int CReadByte(lua_State* L)
{
	WorldPacket** pPack = (WorldPacket**)luaL_checkudata(L, 1, "WorldPacket");
	int8_t byte = (*pPack)->ReadByte();
	//printf("CReadByte:%d\n", byte);
	lua_pushnumber(L, byte);
	return 1;
}

static int CallPrint(lua_State* L)
{
	//这样才能给找到真正的对象
	WorldPacket** pPack = (WorldPacket**)luaL_checkudata(L, 1, "WorldPacket");
	//WorldPacket** pV = (WorldPacket**)lua_touserdata(L,2);
	//打印成员变量的值
	(*pPack)->print();
	return 0;
}

static int CGetSize(lua_State * L)
{
	WorldPacket** pPack = (WorldPacket**)luaL_checkudata(L, 1, "WorldPacket");
	int size = (*pPack)->GetSize();
	lua_pushnumber(L, size - 2);
	return 1;
}

static int DestoryPacket(lua_State* L)
{
	WorldPacket** pPack = (WorldPacket**)luaL_checkudata(L, 1, "WorldPacket");
	delete *pPack;
	//释放对象
	//delete *(WorldPacket**)luaL_checkudata(L, 1, "WorldPacket");
	return 0;
}
#endif

