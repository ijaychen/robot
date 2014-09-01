packetHandler = {}

opCodes = {
	LOGIN_MSG_CMD			= 0,
	GAME_MSG_ROLE_BEGIN		= 50,
	GAME_MSG_CHANNEL_BEGIN     = 1200,
}

--��¼
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

opCodes.G2C_HERO_INFO         = opCodes.GAME_MSG_ROLE_BEGIN + 1   -- Ӣ�۽�ɫ��Ϣ
opCodes.C2G_MAP_ENTER         = opCodes.GAME_MSG_ROLE_BEGIN + 2   -- �����ͼ
opCodes.G2C_MAP_ENTER         = opCodes.GAME_MSG_ROLE_BEGIN + 3   -- ��ת��ͼ
opCodes.C2G_MOVE              = opCodes.GAME_MSG_ROLE_BEGIN + 4   -- �ƶ�
opCodes.G2C_MOVE              = opCodes.GAME_MSG_ROLE_BEGIN + 5   -- �ƶ�����

opCodes.C2G_CHANNEL_SEND 			= opCodes.GAME_MSG_CHANNEL_BEGIN + 1	-- ����Ƶ����Ϣ
opCodes.G2C_CHANNEL_SEND 			= opCodes.GAME_MSG_CHANNEL_BEGIN + 2	-- ����Ƶ����Ϣ
opCodes.C2G_CHANNEL_PLAYER		=	opCodes.GAME_MSG_CHANNEL_BEGIN + 3	-- ����Ƶ����Ϣ
opCodes.G2C_CHANNEL_PLAYER		=	opCodes.GAME_MSG_CHANNEL_BEGIN + 4	-- ����Ƶ����Ϣ