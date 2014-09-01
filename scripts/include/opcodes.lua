packetHandler = {}

opCodes = {
	LOGIN_MSG_CMD			= 0,
	GAME_MSG_ROLE_BEGIN		= 50,
	GAME_MSG_CHANNEL_BEGIN     = 1200,
}

--登录
opCodes.CMSG_LOGIN					= opCodes.LOGIN_MSG_CMD + 11
opCodes.SMSG_LOGIN					= opCodes.LOGIN_MSG_CMD + 12
opCodes.CMSG_LOGIN_USER				= opCodes.LOGIN_MSG_CMD + 15
opCodes.SMSG_LOGIN_USER				= opCodes.LOGIN_MSG_CMD + 16
opCodes.C2L_ROLE_SELECT				= opCodes.LOGIN_MSG_CMD + 28
opCodes.L2C_ROLE_SELECT				= opCodes.LOGIN_MSG_CMD + 29
opCodes.C2L_ROLE_LIST				= opCodes.LOGIN_MSG_CMD + 30
opCodes.L2C_ROLE_LIST				= opCodes.LOGIN_MSG_CMD + 31
opCodes.C2L_ROLE_CREATE				= opCodes.LOGIN_MSG_CMD + 32
opCodes.L2C_ROLE_CREATE				= opCodes.LOGIN_MSG_CMD + 33

opCodes.G2C_HERO_INFO         = opCodes.GAME_MSG_ROLE_BEGIN + 1   -- 英雄角色信息
opCodes.C2G_MAP_ENTER         = opCodes.GAME_MSG_ROLE_BEGIN + 2   -- 进入地图
opCodes.G2C_MAP_ENTER         = opCodes.GAME_MSG_ROLE_BEGIN + 3   -- 跳转地图
opCodes.C2G_MOVE              = opCodes.GAME_MSG_ROLE_BEGIN + 4   -- 移动
opCodes.G2C_MOVE              = opCodes.GAME_MSG_ROLE_BEGIN + 5   -- 移动数据

opCodes.C2G_CHANNEL_SEND 			= opCodes.GAME_MSG_CHANNEL_BEGIN + 1	-- 发送频道消息
opCodes.G2C_CHANNEL_SEND 			= opCodes.GAME_MSG_CHANNEL_BEGIN + 2	-- 接收频道信息
opCodes.C2G_CHANNEL_PLAYER		=	opCodes.GAME_MSG_CHANNEL_BEGIN + 3	-- 接收频道信息
opCodes.G2C_CHANNEL_PLAYER		=	opCodes.GAME_MSG_CHANNEL_BEGIN + 4	-- 接收频道信息