packetHandler = {}

opCodes = {
	LOGIN_MSG_CMD			= 0,
	CMSG_REGION_NOTICE		   = 9,
	SMSG_RESULT                = 40,
	GAME_MSG_ROLE_BEGIN        = 50,
	GAME_MSG_ROLE_COUNT        = 200,
	GAME_MSG_HERO_BEGIN        = 200,
	GAME_MSG_HERO_COUNT        = 300,
	GAME_MSG_PET_BEGIN         = 300,
	GAME_MSG_PET_COUNT         = 400,
	GAME_MSG_FIGHT_BEGIN       = 400,
	GAME_MSG_FIGHT_COUNT       = 600,
	GAME_MSG_TASK_BENGN        = 600,
	GAME_MSG_TASK_COUNT        = 800,
	GAME_MSG_ITEM_BEGIN        = 800,
	GAME_MSG_ITEM_COUNT        = 1000,
	GAME_MSG_TEAM_BEGIN        = 1000,
	GAME_MSG_TEAM_COUNT        = 1200,
	GAME_MSG_CHANNEL_BEGIN     = 1200,
	GAME_MSG_CHANNEL_COUNT     = 1400,
	GAME_MSG_SKILL_BEGIN       = 1400,
	GAME_MSG_SKILL_COUNT       = 1600,
	GAME_MSG_FACTION_BEGIN     = 1600,
	GAME_MSG_FACTION_COUNT     = 1800,
	GAME_MSG_MARRY_BEGIN       = 1800,
	GAME_MSG_MARRY_COUNT       = 2000,
	GAME_MSG_FRIEND_BEGIN      = 2000,
	GAME_MSG_FRIEND_COUNT      = 2200,
	GAME_MSG_PLAYER_TALK_BEGIN = 2200,
	GAME_MSG_PLAYER_TALK_COUNT = 2400,
	GAME_MSG_PLAYER_CARD_BEGIN = 2400,
	GAME_MSG_PLAYER_CARD_COUNT = 2600,
	GAME_MSG_BIWU_BEGIN        = 2800,
	GAME_MSG_BIWU_COUNT        = 3000,
	GAME_MSG_ROBMAP_BEGIN      = 3000,
	GAME_MSG_ROBMAP_COUNT      = 3200,
	GAME_MSG_VERIFY_BEGIN	   = 3200,
	GAME_MSG_VERIFY_COUNT	   = 3400,
	GAME_MSG_ACTIVITY_BEGIN	   = 3400,
	GAME_MSG_ACTIVITY_COUNT	   = 3600,
	GAME_MSG_SHOP_BEGIN        = 3600,
	GAME_MSG_SHOP_COUNT        = 3800,
	GAME_MSG_AUCTION_BEGIN     = 3800,
	GAME_MSG_AUCTION_COUNT     = 4000,
	GAME_MSG_SHOW_BEGIN		   = 4000,
	GAME_MSG_SHOW_COUNT		   = 4200,   
	GAME_MSG_MALL_BEGIN		   = 4200,
	GAME_MSG_MALL_COUNT		   = 4400,
	GAME_MSG_COMPETE_BEGIN	   = 4400,
	GAME_MSG_COMPETE_COUNT	   = 4600,
	GAME_MSG_HOUSE_BEGIN       = 4600,
	GAME_MSG_HOUSE_COUNT       = 4800,
	GAME_MSG_OFFICE_BEGIN      = 4800,
	GAME_MSG_OFFICE_COUNT      = 5000,
	
	GAME_MSG_LEITAI_BEGIN      = 5200,
	GAME_MSG_LEITAI_COUNT      = 5400,
	GAME_MSG_MENPAIDIZI_BEGIN  = 5400,
	GAME_MSG_MENPAIDIZI_COUNT  = 5600,
	GAME_MSG_SOUL_BEGIN        = 5600,
	GAME_MSG_SOUL_COUNT        = 5800,
	
	GAME_MSG_ARENA_BEGIN       = 5800, 						--������
	GAME_MSG_ARENA_COUNT       = 6000,
	
	GAME_MSG_GATE_BEGIN        = 6000,                      --�ؿ�
	GAME_MSG_GATE_COUNT        = 6200,
	
	GAME_MSG_BOSS_BEGIN        = 6200,                      --BOSSս
	GAME_MSG_BOSS_COUNT        = 6400, 
	
	GAME_MSG_FESTIVAL_BEGIN    = 6400,                      --���ջ
	GAME_MSG_FESTIVAL_COUNT    = 6600,
	
	GAME_MSG_MAZE_BEGIN        = 6600,                      --�Թ�� 
	GAME_MSG_MAZE_COUNT        = 6800,
	
	GAME_MSG_ACHIEVEMENT_BEGIN = 6800,                      --�ɾ�ϵͳ
	GAME_MSG_ACHIEVEMENT_COUNT = 7000,
	
	GAME_MSG_GLOBAL_BEGIN	   = 9000,
	GAME_MSG_GLOBAL_COUNT	   = 9500,
	GAME_MSG_COUNT             = 10000,
}

--��¼
opCodes.CMSG_PING					= opCodes.LOGIN_MSG_CMD + 1
opCodes.SMSG_PONG					= opCodes.LOGIN_MSG_CMD + 2
opCodes.CMSG_LOGIN					= opCodes.LOGIN_MSG_CMD + 11
opCodes.SMSG_LOGIN					= opCodes.LOGIN_MSG_CMD + 12
opCodes.CMSG_LOGOUT					= opCodes.LOGIN_MSG_CMD + 13
opCodes.CMSG_LOGIN_USER				= opCodes.LOGIN_MSG_CMD + 15
opCodes.SMSG_LOGIN_USER				= opCodes.LOGIN_MSG_CMD + 16
opCodes.C2L_ROLE_SELECT				= opCodes.LOGIN_MSG_CMD + 28
opCodes.L2C_ROLE_SELECT				= opCodes.LOGIN_MSG_CMD + 29
opCodes.C2L_ROLE_LIST				= opCodes.LOGIN_MSG_CMD + 30
opCodes.L2C_ROLE_LIST				= opCodes.LOGIN_MSG_CMD + 31
opCodes.C2L_ROLE_CREATE				= opCodes.LOGIN_MSG_CMD + 32
opCodes.L2C_ROLE_CREATE				= opCodes.LOGIN_MSG_CMD + 33

--����
opCodes.G2C_HERO_INFO         = opCodes.GAME_MSG_ROLE_BEGIN + 1   -- Ӣ�۽�ɫ��Ϣ
opCodes.C2G_MAP_ENTER         = opCodes.GAME_MSG_ROLE_BEGIN + 2   -- �����ͼ
opCodes.G2C_MAP_ENTER         = opCodes.GAME_MSG_ROLE_BEGIN + 3   -- ��ת��ͼ
opCodes.C2G_MOVE              = opCodes.GAME_MSG_ROLE_BEGIN + 4   -- �ƶ�
opCodes.G2C_MOVE              = opCodes.GAME_MSG_ROLE_BEGIN + 5   -- �ƶ�����
opCodes.G2C_OBJECT_CHANGE     = opCodes.GAME_MSG_ROLE_BEGIN + 6   -- �������α仯
opCodes.G2C_OBJECT_ADD        = opCodes.GAME_MSG_ROLE_BEGIN + 7   -- �������
opCodes.G2C_OBJECT_REMOVE     = opCodes.GAME_MSG_ROLE_BEGIN + 8   -- ������ʧ
opCodes.G2C_OBJECT_UPDATE     = opCodes.GAME_MSG_ROLE_BEGIN + 9   -- �������Ը���

opCodes.C2G_ROLE_MOONUP         = opCodes.GAME_MSG_ROLE_BEGIN + 10  -- �������
opCodes.C2G_ROLE_HERO_LEAVE     = opCodes.GAME_MSG_ROLE_BEGIN + 11  -- �佫���
opCodes.C2G_ROLE_HERO_CALL      = opCodes.GAME_MSG_ROLE_BEGIN + 12  -- �佫�ٻ�
opCodes.C2G_ROLE_HERO_RECRUIT   = opCodes.GAME_MSG_ROLE_BEGIN + 13  -- �佫��ļ
opCodes.C2G_ROLE_EXCHANGE_RUNE  = opCodes.GAME_MSG_ROLE_BEGIN + 14  -- �����һ�
opCodes.C2G_ROLE_SET_LINEUP     = opCodes.GAME_MSG_ROLE_BEGIN + 15  -- ��������
opCodes.C2G_ROLE_SET_DOWN       = opCodes.GAME_MSG_ROLE_BEGIN + 16  -- ����
opCodes.C2G_ROLE_SELECT_LINEUP  = opCodes.GAME_MSG_ROLE_BEGIN + 17  -- ѡ������
opCodes.C2G_ROLE_UPGRADE_LINEUP = opCodes.GAME_MSG_ROLE_BEGIN + 18  -- ��������
opCodes.C2G_ROLE_OPEN_LINEUP    = opCodes.GAME_MSG_ROLE_BEGIN + 19  -- ����������
opCodes.G2C_ROLE_RUNE_UPDATE	= opCodes.GAME_MSG_ROLE_BEGIN + 23  -- ��������
opCodes.G2C_ROLE_EXCHANGE_RUNE	= opCodes.GAME_MSG_ROLE_BEGIN + 24  -- �����һ��������
opCodes.G2C_ROLE_LINEUP_CHANGE  = opCodes.GAME_MSG_ROLE_BEGIN + 25  -- ���ͱ仯

opCodes.C2G_ROLE_GET_GINGER 	= opCodes.GAME_MSG_ROLE_BEGIN + 26  -- ���¾����㣬�ͻ���24:00ѯ�ʷ�����
opCodes.C2G_ROLE_APPLY_GINGER	= opCodes.GAME_MSG_ROLE_BEGIN + 27  -- �����Ч������
opCodes.C2G_ROLE_SUIT_CHANGE	= opCodes.GAME_MSG_ROLE_BEGIN + 28  -- ��ɫ��װ
opCodes.G2C_ROLE_SUIT_UPDATE	= opCodes.GAME_MSG_ROLE_BEGIN + 29	-- ��ɫ��װ�б����
opCodes.C2G_ROLE_PRACTICE       = opCodes.GAME_MSG_ROLE_BEGIN + 30	-- ��Ϊ��������

opCodes.C2G_ROLE_LINEUP_INFO    = opCodes.GAME_MSG_ROLE_BEGIN + 31  -- ��ѯ�������Ϣ 
opCodes.G2C_ROLE_LINEUP_INFO    = opCodes.GAME_MSG_ROLE_BEGIN + 32  -- �����������Ϣ

opCodes.C2G_ROLE_FIRST_LOGIN	=	opCodes.GAME_MSG_ROLE_BEGIN + 34	-- ��ɫ�ξ��󣬷���������ΧNPC
opCodes.C2G_ROLE_REFRESH_NPC	=	opCodes.GAME_MSG_ROLE_BEGIN + 35	-- ����NPC

opCodes.C2G_ROLE_SETTING		=	opCodes.GAME_MSG_ROLE_BEGIN + 38	-- ��������

opCodes.C2G_ROLE_TITLES_NEXT  = opCodes.GAME_MSG_ROLE_BEGIN + 39	-- ��ȡ�ѻ�õĳƺ��б�
opCodes.C2G_ROLE_TITLES_GET	  = opCodes.GAME_MSG_ROLE_BEGIN + 40  -- �ͻ��˷���Ҫ��Ҫ���ȡ�ƺ�(�������³ƺŽ��Ⱥ���صĳƺ���Ϣ)
opCodes.G2C_ROLE_TITLES_NEW		= opCodes.GAME_MSG_ROLE_BEGIN + 41  -- �����������»�ȡ����

opCodes.G2C_ROLE_HEALTH				= opCodes.GAME_MSG_ROLE_BEGIN + 42  -- ������Ϣ
opCodes.G2C_ROLE_TITLEINFO		= opCodes.GAME_MSG_ROLE_BEGIN + 43  -- �ƺ������Ϣ

opCodes.C2G_ROLE_RANK					=	opCodes.GAME_MSG_ROLE_BEGIN + 44  -- ����������Ϣ
opCodes.G2C_ROLE_RANK					=	opCodes.GAME_MSG_ROLE_BEGIN + 45  -- ����������Ϣ
opCodes.C2G_ROLE_RANK_PET			=	opCodes.GAME_MSG_ROLE_BEGIN + 46  -- �������г�����Ϣ
opCodes.G2C_ROLE_RANK_PET			=	opCodes.GAME_MSG_ROLE_BEGIN + 47  -- �������г�����Ϣ
opCodes.G2C_ROLE_RANK_REFRESH	=	opCodes.GAME_MSG_ROLE_BEGIN + 48	-- ���и���

opCodes.C2G_ROLE_MACHINE_INFO = opCodes.GAME_MSG_ROLE_BEGIN + 50	-- �ͻ��˻������MAC��ַ
opCodes.C2G_ROLE_CHANGE_NAME  = opCodes.GAME_MSG_ROLE_BEGIN + 51	-- ����
opCodes.C2G_ROLE_GET_LOGOUTEXP= opCodes.GAME_MSG_ROLE_BEGIN + 52	-- ��ȡ���߲���
opCodes.C2G_ROLE_ADD_VIPEXP   = opCodes.GAME_MSG_ROLE_BEGIN + 53    --����vip����
opCodes.C2G_ROLE_BUY_POWER    = opCodes.GAME_MSG_ROLE_BEGIN + 54    --Ԫ����������
opCodes.C2G_ROLE_VIP_INFO     = opCodes.GAME_MSG_ROLE_BEGIN + 55    --����VIP��Ϣ
opCodes.G2C_ROLE_VIP_INFO     = opCodes.GAME_MSG_ROLE_BEGIN + 56    --����VIP��Ϣ
opCodes.C2G_ROLE_VIP_FIRST_PAY     = opCodes.GAME_MSG_ROLE_BEGIN + 57    --������ȡ�׳����
opCodes.G2C_ROLE_VIP_FIRST_PAY     = opCodes.GAME_MSG_ROLE_BEGIN + 58    --֪ͨ���׳������ȡ
opCodes.C2G_ROLE_FIRST_DAY_LOGIN_PRIZE     = opCodes.GAME_MSG_ROLE_BEGIN + 59    --����ÿ���״ε�¼�������
opCodes.G2C_ROLE_FIRST_DAY_LOGIN_PRIZE     = opCodes.GAME_MSG_ROLE_BEGIN + 60    --����ÿ���״ε�¼�����������

opCodes.C2G_ROLE_CHECK        = opCodes.GAME_MSG_ROLE_BEGIN + 61  -- ��ɫ���
opCodes.G2C_ROLE_SETDOWN_EXP         = opCodes.GAME_MSG_ROLE_BEGIN + 62 -- ��ɫ��������֪ͨ
opCodes.G2C_ROLE_OFFLINE_SETDOWN_EXP = opCodes.GAME_MSG_ROLE_BEGIN + 63 -- ��ɫ���ߴ�������֪ͨ

opCodes.C2G_ROLE_ONLINE_PRIZE				 = opCodes.GAME_MSG_ROLE_BEGIN + 64 -- ��ȡ���߽���
opCodes.G2C_ROLE_ONLINE_PRIZE				 = opCodes.GAME_MSG_ROLE_BEGIN + 65 -- ��ȡ���߽������
opCodes.C2G_ROLE_LEVEL_PRIZE				 = opCodes.GAME_MSG_ROLE_BEGIN + 66 -- ��ȡ�ȼ����
opCodes.G2C_ROLE_LEVEL_PRIZE				 = opCodes.GAME_MSG_ROLE_BEGIN + 67 -- ��ȡ�ȼ�������
opCodes.G2C_ROLE_TEMP_PRIZE				 	 = opCodes.GAME_MSG_ROLE_BEGIN + 68 -- ����ʱ���
opCodes.C2G_ROLE_TEMP_PRIZE				 	 = opCodes.GAME_MSG_ROLE_BEGIN + 69 -- ����ʱ�������

opCodes.C2G_ROLE_BUY_FIGHT_CREDIT		=	opCodes.GAME_MSG_ROLE_BEGIN + 70 -- ����ս��
opCodes.G2C_ROLE_MIDNIGHT						=	opCodes.GAME_MSG_ROLE_BEGIN + 71 -- 12��ˢ��

--opCodes.C2G_ROLE_HERO_GROUP				=	opCodes.GAME_MSG_ROLE_BEGIN + 72 --������¼��Ϣ
--opCodes.G2C_ROLE_HERO_GROUP				=	opCodes.GAME_MSG_ROLE_BEGIN + 73 --���ͽ���¼��Ϣ
opCodes.G2C_ROLE_START_TIME				=	opCodes.GAME_MSG_ROLE_BEGIN + 74 --���Ϳ���ʱ��
opCodes.C2G_ROLE_HERO_RECRUIT_SCORE		=	opCodes.GAME_MSG_ROLE_BEGIN + 75 --�佫��ļ(����������)

opCodes.G2C_ADD_CURRENCY                =	opCodes.GAME_MSG_ROLE_BEGIN + 76 --��ֵ����Ԫ��
opCodes.C2G_CLIENT_ERROR_INFO			= 	opCodes.GAME_MSG_ROLE_BEGIN + 77 --�ͻ��˴�����Ϣ
opCodes.C2G_OTHER_PLAYER_VISIBLE		= 	opCodes.GAME_MSG_ROLE_BEGIN + 78 --��������Ƿ�ɼ�

opCodes.C2G_ROLE_CRAZY_BOX			    = opCodes.GAME_MSG_ROLE_BEGIN + 79 --������ȡ���ر���
opCodes.G2C_ROLE_CRAZY_BOX			    = opCodes.GAME_MSG_ROLE_BEGIN + 80 --֪ͨ�����ر�����ȡ

opCodes.C2G_ROLE_CARD3DAY			    = 	opCodes.GAME_MSG_ROLE_BEGIN + 81 --����鿨
opCodes.G2C_ROLE_CARD3DAY			    = 	opCodes.GAME_MSG_ROLE_BEGIN + 82 --���ͳ鿨��Ϣ
opCodes.C2G_ROLE_CARD3DAY_OPEN	        = 	opCodes.GAME_MSG_ROLE_BEGIN + 83 --�򿪳鿨�������������        

opCodes.G2C_ROLE_RECHARGE_PRIZE_TIME= opCodes.GAME_MSG_ROLE_BEGIN + 84 --��ֵ�������ʱ��
opCodes.C2G_ROLE_APPRAISE					=	opCodes.GAME_MSG_ROLE_BEGIN + 85 --����
opCodes.G2C_ROLE_APPRAISE					=	opCodes.GAME_MSG_ROLE_BEGIN + 86 --��������
opCodes.G2C_ROLE_APPRAISE_STAR		=	opCodes.GAME_MSG_ROLE_BEGIN + 87 --������

opCodes.C2G_APPLE_NOTICE					= opCodes.GAME_MSG_ROLE_BEGIN + 88 --ƻ����ʽ��֪ͨ
opCodes.G2C_APPLE_NOTICE          = opCodes.GAME_MSG_ROLE_BEGIN + 89 --ƻ����ʽ��֪ͨ����

opCodes.C2G_ROLE_CARD3DAY_RECORD  = opCodes.GAME_MSG_ROLE_BEGIN + 90 --�����н���¼
opCodes.G2C_ROLE_CARD3DAY_RECORD  = opCodes.GAME_MSG_ROLE_BEGIN + 91 --�����н���¼

opCodes.G2C_ROLE_INVITE_INFO			= opCodes.GAME_MSG_ROLE_BEGIN + 92 --������Ϣ

opCodes.C2G_ROLE_CURRENCY_3000_PRIZE     = opCodes.GAME_MSG_ROLE_BEGIN + 93    --������ȡ������¼��3000Ԫ������
opCodes.G2C_ROLE_CURRENCY_3000_PRIZE     = opCodes.GAME_MSG_ROLE_BEGIN + 94    --����������¼��3000Ԫ�������ṹ

opCodes.G2C_ROLE_BIND_PHONE	=	opCodes.GAME_MSG_ROLE_BEGIN + 95
opCodes.C2G_ROLE_BIND_PHONE	=	opCodes.GAME_MSG_ROLE_BEGIN + 96

opCodes.G2C_EXPEDITION_HORN_GIFT_INFO = opCodes.GAME_MSG_ROLE_BEGIN + 97 --���ͺŽ���Ϣ���ͻ���
opCodes.C2G_GET_EXPEDITION_HORN_GIFT = opCodes.GAME_MSG_ROLE_BEGIN + 98 --��ȡԶ���Žǽ���

opCodes.C2G_INVITE_CODE	=	 opCodes.GAME_MSG_ROLE_BEGIN + 99 --
opCodes.G2C_INVITE_CODE	=	 opCodes.GAME_MSG_ROLE_BEGIN + 100 --
opCodes.C2G_INVITE_FRIEND	=	opCodes.GAME_MSG_ROLE_BEGIN + 101 --
opCodes.G2C_INVITE_FRIEND	=	opCodes.GAME_MSG_ROLE_BEGIN + 102 --

--�ż�̽��ȫ���淨
opCodes.C2G_RUINS_DISCOVERY_INFO = opCodes.GAME_MSG_ROLE_BEGIN + 103 --�����ż�̽��������Ϣ
opCodes.G2C_RUINS_DISCOVERY_INFO = opCodes.GAME_MSG_ROLE_BEGIN + 104 
opCodes.C2G_RUINS_DISCOVERY_PRIZE_RECORD = opCodes.GAME_MSG_ROLE_BEGIN + 105 --�����ż�̽���н���¼
opCodes.G2C_RUINS_DISCOVERY_PRIZE_RECORD = opCodes.GAME_MSG_ROLE_BEGIN + 106 
opCodes.C2G_RUINS_DISCOVERY_STARTUP = opCodes.GAME_MSG_ROLE_BEGIN + 107 --����ħ����
opCodes.G2C_RUINS_DISCOVERY_PRIZE = opCodes.GAME_MSG_ROLE_BEGIN + 108 --��Ʒ��Ϣ

--�ż�̽�������淨
opCodes.C2G_RUINS_DISCOVERY_INFO_EX = opCodes.GAME_MSG_ROLE_BEGIN + 109 --�����ż�̽��������Ϣ
opCodes.G2C_RUINS_DISCOVERY_INFO_EX = opCodes.GAME_MSG_ROLE_BEGIN + 110 
opCodes.C2G_RUINS_DISCOVERY_STARTUP_EX = opCodes.GAME_MSG_ROLE_BEGIN + 111 --����ħ����
opCodes.G2C_RUINS_DISCOVERY_PRIZE_EX = opCodes.GAME_MSG_ROLE_BEGIN + 112 --��Ʒ��Ϣ

--���ϵͳ
opCodes.C2G_SOUL_AUGURY		    = opCodes.GAME_MSG_SOUL_BEGIN + 1  --ռ��
opCodes.G2C_SOUL_AUGURY         = opCodes.GAME_MSG_SOUL_BEGIN + 2  --ռ�����
opCodes.C2G_SOUL_COMPUTE        = opCodes.GAME_MSG_SOUL_BEGIN + 3  --����
opCodes.G2C_SOUL_COMPUTE        = opCodes.GAME_MSG_SOUL_BEGIN + 4  --������
opCodes.C2G_SOUL_ONE_AUGURY     = opCodes.GAME_MSG_SOUL_BEGIN + 5  --һ��ռ��
opCodes.G2C_SOUL_ONE_AUGURY     = opCodes.GAME_MSG_SOUL_BEGIN + 6  --����һ��ռ���ı�����Ϣ
opCodes.G2C_SOUL_ADD            = opCodes.GAME_MSG_SOUL_BEGIN + 7  --����һ�����
opCodes.C2G_SOUL_ONE_EAT        = opCodes.GAME_MSG_SOUL_BEGIN + 8  --����һ������
opCodes.G2C_SOUL_ONE_EAT        = opCodes.GAME_MSG_SOUL_BEGIN + 9  --����һ�����ɽ��
opCodes.C2G_SOUL_EQUPT_OPEN 	= opCodes.GAME_MSG_SOUL_BEGIN + 10 --�����װ�����
opCodes.G2C_SOUL_EQUPT_OPEN 	= opCodes.GAME_MSG_SOUL_BEGIN + 11 --���ش�װ��������
opCodes.C2G_SOUL_OPEN 			= opCodes.GAME_MSG_SOUL_BEGIN + 12 --������������Ϣ
opCodes.G2C_SOUL_OPEN 			= opCodes.GAME_MSG_SOUL_BEGIN + 13 --���ػ��������Ϣ
opCodes.C2G_SOUL_BUY            = opCodes.GAME_MSG_SOUL_BEGIN + 14 --��������
opCodes.C2G_SOUL_EXPAND         = opCodes.GAME_MSG_SOUL_BEGIN + 15 --������չ�������
opCodes.G2C_SOUL_EXPAND         = opCodes.GAME_MSG_SOUL_BEGIN + 16 --������չ�������
opCodes.C2G_SOUL_MOVE           = opCodes.GAME_MSG_SOUL_BEGIN + 17 --����ƶ�
opCodes.G2C_SOUL_MOVE           = opCodes.GAME_MSG_SOUL_BEGIN + 18 --���ػ���ƶ����
opCodes.G2C_SOUL_BUY            = opCodes.GAME_MSG_SOUL_BEGIN + 19 --���������������
opCodes.C2G_SOUL_COMPUTE_TEN    = opCodes.GAME_MSG_SOUL_BEGIN + 20  --ʮ������
opCodes.C2G_SOULMONEY_GET	    = opCodes.GAME_MSG_SOUL_BEGIN + 21  --�ͻ��������������
opCodes.G2C_SOULMONEY_GET	    = opCodes.GAME_MSG_SOUL_BEGIN + 22  --�����������������

--�佫
opCodes.G2C_HERO_LIST           = opCodes.GAME_MSG_HERO_BEGIN + 1 --�����佫�б�
opCodes.G2C_HERO_UPDATE         = opCodes.GAME_MSG_HERO_BEGIN + 2 --�佫���Ը���
opCodes.G2C_HERO_ADD            = opCodes.GAME_MSG_HERO_BEGIN + 3 --����һ���佫
opCodes.G2C_HERO_WAREHOUSE_LIST = opCodes.GAME_MSG_HERO_BEGIN + 4 --����ս���ϵ��佫
opCodes.G2C_ROLE_HERO_LEAVE     = opCodes.GAME_MSG_HERO_BEGIN + 5 --�佫��ӷ���
opCodes.G2C_ROLE_HERO_CALL		= opCodes.GAME_MSG_HERO_BEGIN + 6 --�佫�ٻط���

opCodes.C2G_HERO_TALENT_UP		=	opCodes.GAME_MSG_HERO_BEGIN + 11 --�佫����
opCodes.G2C_HERO_TALENT_UP		=	opCodes.GAME_MSG_HERO_BEGIN + 12 --�佫����
opCodes.C2G_HERO_TALENT_TRANS	=	opCodes.GAME_MSG_HERO_BEGIN + 13 --�佫����ת��

opCodes.C2G_HERO_STAR_TFR       = opCodes.GAME_MSG_HERO_BEGIN + 16 --�佫�ǽ�ת��
opCodes.G2C_HERO_STAR_TFR       = opCodes.GAME_MSG_HERO_BEGIN + 17 --�佫�ǽ�ת�Ʒ���
opCodes.C2G_HERO_STAR_UP        = opCodes.GAME_MSG_HERO_BEGIN + 18 --�佫�ǽ�����
opCodes.G2C_HERO_STAR_UP        = opCodes.GAME_MSG_HERO_BEGIN + 19 --�佫�ǽ��������� 
opCodes.C2G_HERO_GATE_ENTER			=	opCodes.GAME_MSG_HERO_BEGIN + 22 --��������Ӣ�۸���
opCodes.G2C_HERO_TOKEN_INFO			=	opCodes.GAME_MSG_HERO_BEGIN + 23 --Ӣ������������
opCodes.C2G_HERO_BUY_HONOR			=	opCodes.GAME_MSG_HERO_BEGIN + 24 --�����һ�����


--������ 
opCodes.C2G_ARENA_OPEN			= opCodes.GAME_MSG_ARENA_BEGIN + 1  --�򿪾���������
opCodes.G2C_ARENA_OPEN          = opCodes.GAME_MSG_ARENA_BEGIN + 2  --�򿪾��������淵����Ϣ 
opCodes.C2G_ARENA_COMBAT        = opCodes.GAME_MSG_ARENA_BEGIN + 3  --���󾺼�
opCodes.G2C_ARENA_COMBAT        = opCodes.GAME_MSG_ARENA_BEGIN + 4  --����ս������[��Ҫ�Ǹ�һЩ����]
opCodes.C2G_ARENA_PLAYER_INFO   = opCodes.GAME_MSG_ARENA_BEGIN + 5  --������ϸ��Ϣ
opCodes.G2C_ARENA_PLAYER_INFO   = opCodes.GAME_MSG_ARENA_BEGIN + 6  --������ϸ��Ϣ
opCodes.C2G_ARENA_OPEN_KO       = opCodes.GAME_MSG_ARENA_BEGIN + 7  --��Ӣ�۰�
opCodes.G2C_ARENA_OPEN_RANK     = opCodes.GAME_MSG_ARENA_BEGIN + 8  --���а񷵻���Ϣ
opCodes.G2C_ARENA_OPEN_SERIES   = opCodes.GAME_MSG_ARENA_BEGIN + 9  --��ʤ�񷵻���Ϣ
opCodes.C2G_ARENA_BUY           = opCodes.GAME_MSG_ARENA_BEGIN + 10 --���򾺼�����
opCodes.G2C_ARENA_BUY           = opCodes.GAME_MSG_ARENA_BEGIN + 11 --���򾺼���������
opCodes.C2G_ARENA_CLEAR_CD      = opCodes.GAME_MSG_ARENA_BEGIN + 12 --�������CD
opCodes.G2C_ARENA_CLEAR_CD      = opCodes.GAME_MSG_ARENA_BEGIN + 13 --�������CD���� 
opCodes.C2G_ARENA_NEAR          = opCodes.GAME_MSG_ARENA_BEGIN + 14 -->200�����Ľ�ɫ��ø�����������
opCodes.G2C_ARENA_NEAR          = opCodes.GAME_MSG_ARENA_BEGIN + 15 -->200�����Ľ�ɫ��ø����������ַ���
opCodes.C2G_ARENA_PRIZE_LIST	= opCodes.GAME_MSG_ARENA_BEGIN + 16 --���󾺼��������б�
opCodes.G2C_ARENA_PRIZE_LIST    = opCodes.GAME_MSG_ARENA_BEGIN + 17 --���ؾ����������б�
opCodes.C2G_ARENA_PRIZE         = opCodes.GAME_MSG_ARENA_BEGIN + 18 --��ȡ����������
opCodes.C2G_ARENA_ITEM_LIST		= opCodes.GAME_MSG_ARENA_BEGIN + 19 --���󾺼�����Ʒ�б�
opCodes.G2C_ARENA_ITEM_LIST     = opCodes.GAME_MSG_ARENA_BEGIN + 20 --���ؾ�������Ʒ�б�
opCodes.C2G_ARENA_ITEM_BUY      = opCodes.GAME_MSG_ARENA_BEGIN + 21 --���򾺼�����Ʒ

--ս�� 
opCodes.C2G_ARENA_SEG_OPEN			= opCodes.GAME_MSG_ARENA_BEGIN + 50  --��ս��
opCodes.G2C_ARENA_SEG_OPEN          = opCodes.GAME_MSG_ARENA_BEGIN + 51  --��ս�����淵����Ϣ
opCodes.C2G_ARENA_SEG_REFRESH	    = opCodes.GAME_MSG_ARENA_BEGIN + 52  --ˢ��ս����Ϣ
opCodes.C2G_ARENA_SEG_CLEAR_CD	    = opCodes.GAME_MSG_ARENA_BEGIN + 53  --�����ȴʱ��
opCodes.C2G_ARENA_SEG_PUT_HOLE      = opCodes.GAME_MSG_ARENA_BEGIN + 54  --�����ȴʱ��
opCodes.C2G_ARENA_SEG_COMBAT        = opCodes.GAME_MSG_ARENA_BEGIN + 55  --����ս��
opCodes.G2C_ARENA_SEG_COMBAT        = opCodes.GAME_MSG_ARENA_BEGIN + 56  --����ս�����ս��
opCodes.C2G_ARENA_SEG_COMBAT_MONSTER= opCodes.GAME_MSG_ARENA_BEGIN + 57  --����ս��
opCodes.C2G_ARENA_SEG_BUY	        = opCodes.GAME_MSG_ARENA_BEGIN + 58  --������ս����
opCodes.G2C_ARENA_SEG_STATE	        = opCodes.GAME_MSG_ARENA_BEGIN + 59  --ս��״̬λ

opCodes.C2G_ARENA_SEG_OUT_IN_HONOR  = opCodes.GAME_MSG_ARENA_BEGIN + 60  --ս������ת��


--�ؿ�
opCodes.G2C_GATE_INFO           = opCodes.GAME_MSG_GATE_BEGIN + 1   --�ؿ��;�Ӣ�����ĳ�ʼ����Ϣ
opCodes.C2G_GATE_MONUP_REWARD   = opCodes.GAME_MSG_GATE_BEGIN + 2   --��ȡɨ������
opCodes.G2C_GATE_PASS_PRIZE     = opCodes.GAME_MSG_GATE_BEGIN + 3   --ͨ�ؽ���֪ͨ(���о��飬��Ʒ��ͭǮ���ǳ�)
opCodes.C2G_GATE_START_GATE     = opCodes.GAME_MSG_GATE_BEGIN + 4   --��ʼ�ؿ�ɨ��
opCodes.C2G_GATE_START_COPY     = opCodes.GAME_MSG_GATE_BEGIN + 5   --��ʼ��Ӣ����ɨ��
opCodes.C2G_GATE_RESET          = opCodes.GAME_MSG_GATE_BEGIN + 6   --���þ�Ӣ����
opCodes.G2C_GATE_REBISH         = opCodes.GAME_MSG_GATE_BEGIN + 7   --ˢ�¾�Ӣ����
opCodes.C2G_GATE_OVER_MONUP     = opCodes.GAME_MSG_GATE_BEGIN + 8   --ȡ��ɨ��
opCodes.G2C_GATE_MONUP_RESULT   = opCodes.GAME_MSG_GATE_BEGIN + 9   --ɨ��һ��ս��������֪ͨ
opCodes.G2C_GATE_PROCESS        = opCodes.GAME_MSG_GATE_BEGIN + 10  --֪ͨ�ͻ��˹ؿ����߾�Ӣ��������
opCodes.C2G_GATE_ONCE_MORE      = opCodes.GAME_MSG_GATE_BEGIN + 11  --�ٴ�һ��
opCodes.C2G_GATE_MONUP_RUSH     = opCodes.GAME_MSG_GATE_BEGIN + 12  --����ɨ��
opCodes.C2G_GATE_START_ACTIVITY = opCodes.GAME_MSG_GATE_BEGIN + 13  --��ʼͭȸ��ɫɨ��
opCodes.C2G_GATE_GOOD_PRIZE     = opCodes.GAME_MSG_GATE_BEGIN + 14  --��ȡ����ͨ�ؽ���
opCodes.G2C_GATE_GOOD_PRIZE     = opCodes.GAME_MSG_GATE_BEGIN + 15  --��ȡ����ͨ�ط���
opCodes.C2G_GATE_STAR_PRIZE     = opCodes.GAME_MSG_GATE_BEGIN + 16  --��ȡ�ǳ�����
opCodes.G2C_GATE_STAR_PRIZE     = opCodes.GAME_MSG_GATE_BEGIN + 17  --��ȡ�ǳ���������


--����BOSS
opCodes.C2G_BOSS_ENTER          = opCodes.GAME_MSG_BOSS_BEGIN + 1   --��ҿ�ʼ�μ�BOSSս
opCodes.G2C_BOSS_RANK           = opCodes.GAME_MSG_BOSS_BEGIN + 2   --�����˺����а�
opCodes.C2G_BOSS_INSPIRE        = opCodes.GAME_MSG_BOSS_BEGIN + 3   --ʹ��ս�����
opCodes.C2G_BOSS_SET_SPWAN      = opCodes.GAME_MSG_BOSS_BEGIN + 4   --BOSSս�����Զ�����
opCodes.C2G_BOSS_COMBAT         = opCodes.GAME_MSG_BOSS_BEGIN + 5   --��ʼ��BOSSս��
opCodes.G2C_BOSS_START          = opCodes.GAME_MSG_BOSS_BEGIN + 6   --����boss���ʼ
opCodes.G2C_BOSS_MAP_INFO       = opCodes.GAME_MSG_BOSS_BEGIN + 7   --����boss��������Ϣ
opCodes.G2C_BOSS_DAMAGE_RANK    = opCodes.GAME_MSG_BOSS_BEGIN + 8   --�˺�����
opCodes.G2C_BOSS_PRIZE          = opCodes.GAME_MSG_BOSS_BEGIN + 9   --����boss����
opCodes.G2C_BOSS_HP_CHANGE      = opCodes.GAME_MSG_BOSS_BEGIN + 10  --bossѪ���ı�֪ͨ
opCodes.G2C_BOSS_END            = opCodes.GAME_MSG_BOSS_BEGIN + 11  --����boss�����
opCodes.C2G_BOSS_OPEN_UI        = opCodes.GAME_MSG_BOSS_BEGIN + 12  --������bossUI
opCodes.G2C_BOSS_OPEN_UI		= opCodes.GAME_MSG_BOSS_BEGIN + 13  --��UI������Ϣ
opCodes.C2G_BOSS_LEAVE          = opCodes.GAME_MSG_BOSS_BEGIN + 14  --�뿪boss��ͼ
opCodes.G2C_BOSS_COMBAT_END     = opCodes.GAME_MSG_BOSS_BEGIN + 15  --һ��bossս������
opCodes.G2C_BOSS_INSPIRE        = opCodes.GAME_MSG_BOSS_BEGIN + 16  --ʹ��ս�۹��践��
opCodes.G2C_BOSS_SET_SPWAN      = opCodes.GAME_MSG_BOSS_BEGIN + 17  --�����Զ������
opCodes.C2G_BOSS_SPWAN          = opCodes.GAME_MSG_BOSS_BEGIN + 18  --Ԫ������
opCodes.G2C_BOSS_SUBSTITUTE     = opCodes.GAME_MSG_BOSS_BEGIN + 19	--����
opCodes.C2G_BOSS_SUBSTITUTE     = opCodes.GAME_MSG_BOSS_BEGIN + 20	--����
opCodes.G2C_BOSS_ENTER          = opCodes.GAME_MSG_BOSS_BEGIN + 21  --������ҿ�ʼ�μ�BOSSս״̬��Ϣ
opCodes.G2C_BOSS_COUNT          = opCodes.GAME_MSG_BOSS_BEGIN + 22  --���ظ������
opCodes.C2G_BOSS_MONSTER        = opCodes.GAME_MSG_BOSS_BEGIN + 23  --�����ս����BOSSС��

--pet
opCodes.G2C_PET_LIST            = opCodes.GAME_MSG_PET_BEGIN + 1  -- ���ͳ����б���Ϣ
opCodes.C2G_PET_FIGHT           = opCodes.GAME_MSG_PET_BEGIN + 2  -- ���ò�ս
opCodes.C2G_PET_FREE            = opCodes.GAME_MSG_PET_BEGIN + 3  -- ���÷���
opCodes.C2G_PET_FOLLOW          = opCodes.GAME_MSG_PET_BEGIN + 4  -- ���ø���
opCodes.C2G_PET_BINDROLE        = opCodes.GAME_MSG_PET_BEGIN + 5  -- ����ר��
opCodes.C2G_PET_USEITEM         = opCodes.GAME_MSG_PET_BEGIN + 6  -- ʹ����Ʒ
opCodes.C2G_PET_EQUIP           = opCodes.GAME_MSG_PET_BEGIN + 7  -- ʹ��װ��
opCodes.C2G_PET_NEWNAME         = opCodes.GAME_MSG_PET_BEGIN + 8  -- ����
opCodes.C2G_PET_POTENTIAL       = opCodes.GAME_MSG_PET_BEGIN + 9  -- ����Ǳ����
opCodes.G2C_PET_UPDATE          = opCodes.GAME_MSG_PET_BEGIN + 10 -- �������Ը���
opCodes.C2G_PET_ADD             = opCodes.GAME_MSG_PET_BEGIN + 11 -- ����һֻ����
opCodes.G2C_PET_ADD             = opCodes.GAME_MSG_PET_BEGIN + 12 -- �ӳ���
opCodes.G2C_PET_FREE            = opCodes.GAME_MSG_PET_BEGIN + 13 -- ����һֻ����
opCodes.C2G_PET_UNBIND          = opCodes.GAME_MSG_PET_BEGIN + 14 -- �����
opCodes.C2G_PET_CHILD           = opCodes.GAME_MSG_PET_BEGIN + 15 -- ���ﻹͯ
opCodes.C2G_PET_TALENT_CARD     = opCodes.GAME_MSG_PET_BEGIN + 16 -- ���ʿ�����
opCodes.C2G_PET_FIX_TALENT_CARD = opCodes.GAME_MSG_PET_BEGIN + 17 -- ������������
opCodes.C2G_PET_SKILL_CARD      = opCodes.GAME_MSG_PET_BEGIN + 18 -- �ؼ�������
opCodes.C2G_PET_FIX_SKILL_CARD  = opCodes.GAME_MSG_PET_BEGIN + 19 -- �����ؼ�����
opCodes.C2G_PET_TRAINING        = opCodes.GAME_MSG_PET_BEGIN + 20 -- ��������
opCodes.C2G_PET_COMPOUND        = opCodes.GAME_MSG_PET_BEGIN + 21 -- ����ϳ�
opCodes.C2G_PET_ADVANCE         = opCodes.GAME_MSG_PET_BEGIN + 22 -- �������
opCodes.C2G_PET_STRENGTHEN      = opCodes.GAME_MSG_PET_BEGIN + 23 -- ����ǿ��
opCodes.C2G_PET_SOUL_CARD       = opCodes.GAME_MSG_PET_BEGIN + 24 -- ���ﻯ��
opCodes.C2G_PET_FIX_SOUL_CARD   = opCodes.GAME_MSG_PET_BEGIN + 25 -- ����
opCodes.C2G_PET_CANCEL_UNBIND   = opCodes.GAME_MSG_PET_BEGIN + 26 -- ȡ��������
opCodes.C2G_PET_SUREUNBIND      = opCodes.GAME_MSG_PET_BEGIN + 27 -- ȷ�Ͻ��
opCodes.G2C_PET_SOUL_ABILITY    = opCodes.GAME_MSG_PET_BEGIN + 28 -- ��������
opCodes.C2G_PET_EXP_CARD        = opCodes.GAME_MSG_PET_BEGIN + 29 -- ����
opCodes.C2G_PET_DICTIONARY      = opCodes.GAME_MSG_PET_BEGIN + 30 -- ͼ����½
opCodes.G2C_PET_DICTIONARY_UPDATE    = opCodes.GAME_MSG_PET_BEGIN + 31 -- ͼ������
opCodes.C2G_PET_MAKE_APPEAR_ITEM     = opCodes.GAME_MSG_PET_BEGIN + 32 -- ��������ҩˮ
opCodes.C2G_PET_HOLY_UPGRADE         = opCodes.GAME_MSG_PET_BEGIN + 33 -- ���޽���
opCodes.C2G_PET_HOLY_UPGRADE_NEED    = opCodes.GAME_MSG_PET_BEGIN + 34 -- �������޽���
opCodes.G2C_PET_HOLY_UPGRADE_NEED    = opCodes.GAME_MSG_PET_BEGIN + 35 -- �������޽���
opCodes.G2C_PET_UPDATE_JINGQI        = opCodes.GAME_MSG_PET_BEGIN + 36 -- ���¾���ֵ
opCodes.C2G_PET_TO_JINGQI            = opCodes.GAME_MSG_PET_BEGIN + 37 -- ������ﻻ����
opCodes.C2G_PET_REMOVE_SKILL         = opCodes.GAME_MSG_PET_BEGIN + 38 -- ����ϴ����
opCodes.C2G_PET_FENG_YIN             = opCodes.GAME_MSG_PET_BEGIN + 39 -- �����ӡ
opCodes.C2G_PET_UN_FENG_YIN          = opCodes.GAME_MSG_PET_BEGIN + 40 -- ��������ӡ
opCodes.C2G_PET_SKILL_COMBIN         = opCodes.GAME_MSG_PET_BEGIN + 41 -- ���＼�ܺϳ�

--fight
--opCodes.C2G_FIGHT_MONSTER           = opCodes.GAME_MSG_FIGHT_BEGIN + 1 --�������׹�ս��
opCodes.C2G_FIGHT_SKILL             = opCodes.GAME_MSG_FIGHT_BEGIN + 2 --����ս��ָ��
opCodes.C2G_FIGHT_AUTO              = opCodes.GAME_MSG_FIGHT_BEGIN + 3 --���ã�ȡ���Զ�ս��
opCodes.G2C_FIGHT_AUTO              = opCodes.GAME_MSG_FIGHT_BEGIN + 4 --����
opCodes.G2C_FIGHT_QTE_TYPE          = opCodes.GAME_MSG_FIGHT_BEGIN + 5 --�����������͵�QTE
opCodes.C2G_FIGHT_QTE               = opCodes.GAME_MSG_FIGHT_BEGIN + 6 --����QTEЧ��

opCodes.C2G_FIGHT_ESCAPE            = opCodes.GAME_MSG_FIGHT_BEGIN + 7 --����

opCodes.C2G_FIGHT_HS_SKILL					=	opCodes.GAME_MSG_FIGHT_BEGIN + 8 --Ӣ���޵м���
opCodes.G2C_FIGHT_HS_SKILL					=	opCodes.GAME_MSG_FIGHT_BEGIN + 9 --Ӣ���޵м���
opCodes.C2G_FIGHT_HS_REVIVE					=	opCodes.GAME_MSG_FIGHT_BEGIN + 10 --Ӣ���޵и���
opCodes.G2C_FIGHT_HS_REVIVE					=	opCodes.GAME_MSG_FIGHT_BEGIN + 11 --Ӣ���޵и���

opCodes.G2C_FIGHT_UPDATE_CD                 = opCodes.GAME_MSG_FIGHT_BEGIN + 12 --ÿ�غϿ�ʼ��ʱ��ˢ��CD

opCodes.C2G_FIGHT_INTERCHANGE               = opCodes.GAME_MSG_FIGHT_BEGIN + 13 --��ҷ����д� 
opCodes.G2C_FIGHT_INTERCHANGE               = opCodes.GAME_MSG_FIGHT_BEGIN + 14 --֪ͨ������д�����
opCodes.C2G_FIGHT_ACK_INTERCHANGE           = opCodes.GAME_MSG_FIGHT_BEGIN + 15 --ȷ���д�
opCodes.G2C_FIGHT_INTERCHANGE_RESULT        = opCodes.GAME_MSG_FIGHT_BEGIN + 16 --�д���֪ͨ


opCodes.C2G_FIGHT_MONSTER           = opCodes.GAME_MSG_FIGHT_BEGIN + 20 --�������׹�ս��
opCodes.C2G_FIGHT_TEST     			= opCodes.GAME_MSG_FIGHT_BEGIN + 20  -- ����ս��
opCodes.G2C_FIGHT_BEGIN    			= opCodes.GAME_MSG_FIGHT_BEGIN + 21  -- ս����ʼ
opCodes.G2C_FIGHT_ADD      			= opCodes.GAME_MSG_FIGHT_BEGIN + 24  -- ս����Ա
opCodes.G2C_FIGHT_BOUT     			= opCodes.GAME_MSG_FIGHT_BEGIN + 25  -- �غϿ�ʼ
opCodes.C2G_FIGHT_CMD      			= opCodes.GAME_MSG_FIGHT_BEGIN + 26  -- ս��ָ��
opCodes.G2C_FIGHT_RESULT   			= opCodes.GAME_MSG_FIGHT_BEGIN + 27  -- ս�����
opCodes.C2G_FIGHT_DRAWDONE 			= opCodes.GAME_MSG_FIGHT_BEGIN + 28  -- �غϽ����ͻ��˷���
opCodes.G2C_FIGHT_END      			= opCodes.GAME_MSG_FIGHT_BEGIN + 29  -- ս������
opCodes.G2C_FIGHT_REBEGIN  			= opCodes.GAME_MSG_FIGHT_BEGIN + 30  -- ս������
opCodes.C2G_FIGHT_FPK      			= opCodes.GAME_MSG_FIGHT_BEGIN + 31 -- ǿ��pkս
opCodes.G2C_FIGHT_STATUS   			= opCodes.GAME_MSG_FIGHT_BEGIN + 32 -- ս��״̬
opCodes.C2G_FIGHT_PK			 	= opCodes.GAME_MSG_FIGHT_BEGIN + 33 -- pk����
opCodes.G2C_FIGHT_PK_REQUEST 		= opCodes.GAME_MSG_FIGHT_BEGIN + 34 -- �յ����˵�pk����
opCodes.C2G_FIGHT_PK_ACCEPT			= opCodes.GAME_MSG_FIGHT_BEGIN + 35 -- ͬ��pk����
opCodes.C2G_FIGHT_PK_REJECT			= opCodes.GAME_MSG_FIGHT_BEGIN + 36 -- �ܾ�pk����
opCodes.G2C_FIGHT_PK_REJECT			= opCodes.GAME_MSG_FIGHT_BEGIN + 37 -- �ܾ�pk����
opCodes.G2C_FIGHT_REMOVE				=	opCodes.GAME_MSG_FIGHT_BEGIN + 38 -- ����ս����Ա
opCodes.G2C_FIGHT_FPK						=	opCodes.GAME_MSG_FIGHT_BEGIN + 39 -- �յ����˵�ǿ��PK
opCodes.C2G_FIGHT_FPK_START			=	opCodes.GAME_MSG_FIGHT_BEGIN + 40 -- ǿ��PK��ʼ
opCodes.C2G_FIGHT_DIRECT				=	opCodes.GAME_MSG_FIGHT_BEGIN + 41	-- ָ��
opCodes.G2C_FIGHT_DIRECT				= opCodes.GAME_MSG_FIGHT_BEGIN + 42 -- 
opCodes.C2G_FIGHT_DIRECT_DEL		=	opCodes.GAME_MSG_FIGHT_BEGIN + 43	-- ȡ��ָ��
opCodes.G2C_FIGHT_DIRECT_DEL		= opCodes.GAME_MSG_FIGHT_BEGIN + 44 -- 
opCodes.G2C_FIGHT_BOSS_ITEM			= opCodes.GAME_MSG_FIGHT_BEGIN + 45 -- ͷĿսѡ����
opCodes.C2G_FIGHT_BOSS_ITEM			= opCodes.GAME_MSG_FIGHT_BEGIN + 46 -- 
opCodes.C2G_FIGHT_BOSS					=	opCodes.GAME_MSG_FIGHT_BEGIN + 47 -- ��սͷĿ
opCodes.G2C_FIGHT_ITEM_SELECT 	= opCodes.GAME_MSG_FIGHT_BEGIN + 48 -- ���䱻ѡ��
opCodes.G2C_FIGHT_READY					=	opCodes.GAME_MSG_FIGHT_BEGIN + 48	-- ���ֱ�־
opCodes.C2G_FIGHT_BOSS_DRAWDONE = opCodes.GAME_MSG_FIGHT_BEGIN + 49 -- �ͻ��˿�����������
opCodes.G2C_FIGHT_BOSS_ITEM_GET = opCodes.GAME_MSG_FIGHT_BEGIN + 50 -- ����Ʒ�ı�����
opCodes.C2G_FIGHT_NPC						= opCodes.GAME_MSG_FIGHT_BEGIN + 51 -- ����ս��
opCodes.C2G_FIGHT_WATCH					= opCodes.GAME_MSG_FIGHT_BEGIN + 52 -- �����ս
opCodes.C2G_FIGHT_WATCH_DEL			= opCodes.GAME_MSG_FIGHT_BEGIN + 53 -- �����˳�ս��
opCodes.G2C_FIGHT_OB_BEGIN      = opCodes.GAME_MSG_FIGHT_BEGIN + 54 -- �����ս
opCodes.C2G_FIGHT_FPK_BY_ID			=	opCodes.GAME_MSG_FIGHT_BEGIN + 55	-- ͨ��ID׷��
opCodes.C2G_FIGHT_FPK_BY_NAME		= opCodes.GAME_MSG_FIGHT_BEGIN + 56	-- ͨ�������׷��
opCodes.C2G_FIGHT_BOSS_SERIAL   = opCodes.GAME_MSG_FIGHT_BEGIN + 57 -- �ͻ�������ͷĿϵ����Ϣ
opCodes.G2C_FIGHT_BOSS_SERIAL   = opCodes.GAME_MSG_FIGHT_BEGIN + 58 -- ����������ͷĿϵ����Ϣ
opCodes.G2C_FIGHT_BOSS_WAIT			= opCodes.GAME_MSG_FIGHT_BEGIN + 59 -- �ȴ���һ��
opCodes.C2G_FIGHT_BOSS_RECORD		=	opCodes.GAME_MSG_FIGHT_BEGIN + 60	-- ��ѯͷĿͨ�ؼ�¼
opCodes.G2C_FIGHT_BOSS_RECORD		=	opCodes.GAME_MSG_FIGHT_BEGIN + 61	-- ����ͷĿͨ�ؼ�¼
opCodes.C2G_FIGHT_BOSS_VIEW			=	opCodes.GAME_MSG_FIGHT_BEGIN + 62 -- �ۿ�ͷĿͨ�ؼ�¼
opCodes.G2C_FIGHT_BOSS_VIEW			=	opCodes.GAME_MSG_FIGHT_BEGIN + 63 -- ����ͷĿͨ�ؼ�¼
opCodes.C2G_FIGHT_BOSS_VIEW_END	=	opCodes.GAME_MSG_FIGHT_BEGIN + 60 -- �����ۿ�ͷĿͨ�ؼ�¼
opCodes.G2C_FIGHT_BOSS_DIFFICULT= opCodes.GAME_MSG_FIGHT_BEGIN + 65 -- �ѶȽ���
opCodes.C2G_FIGHT_BOSS_COMBATS 	= opCodes.GAME_MSG_FIGHT_BEGIN + 66 -- ��ǰ��ͷĿս
opCodes.G2C_FIGHT_BOSS_COMBATS	=	opCodes.GAME_MSG_FIGHT_BEGIN + 67 -- ���ص�ǰ��ͷĿս
opCodes.C2G_FIGHT_BOSS_OBSERVE	=	opCodes.GAME_MSG_FIGHT_BEGIN + 68 -- ͷĿս��ս
opCodes.C2G_FIGHT_ESCAPE				=	opCodes.GAME_MSG_FIGHT_BEGIN + 69 -- ս��������
opCodes.G2C_FIGHT_BOSS					=	opCodes.GAME_MSG_FIGHT_BEGIN + 70 -- ��սͷĿ
opCodes.C2G_FIGHT_BOSS_ACCEPT		=	opCodes.GAME_MSG_FIGHT_BEGIN + 71 -- ͬ����սBOSS
--]]

--task
opCodes.G2C_TASK_LIST					= opCodes.GAME_MSG_TASK_BENGN + 1	--�����б�
opCodes.G2C_TASK_NEW					=	opCodes.GAME_MSG_TASK_BENGN + 2	--�ɽ������б�
opCodes.G2C_TASK_UPDATE				=	opCodes.GAME_MSG_TASK_BENGN + 3	--�������
opCodes.C2G_TASK_APPLY				= opCodes.GAME_MSG_TASK_BENGN + 4	--��������
opCodes.C2G_TASK_COMMIT				=	opCodes.GAME_MSG_TASK_BENGN + 5 --�ύ����
opCodes.C2G_TASK_CANCEL				= opCodes.GAME_MSG_TASK_BENGN + 6 --��������
opCodes.G2C_TASK_ADD					=	opCodes.GAME_MSG_TASK_BENGN + 7 --��������
opCodes.G2C_TASK_SUCCEED			= opCodes.GAME_MSG_TASK_BENGN + 8 --�������
opCodes.G2C_TASK_REMOVE				= opCodes.GAME_MSG_TASK_BENGN + 9 --ɾ������
opCodes.C2G_TASK_XUANSHANG		=	opCodes.GAME_MSG_TASK_BENGN + 10--���������
opCodes.G2C_TASK_XUANSHANG		=	opCodes.GAME_MSG_TASK_BENGN + 11--��������
opCodes.C2G_TASK_APPLY_XS			=	opCodes.GAME_MSG_TASK_BENGN + 12--������������
opCodes.C2G_TASK_REFRESH			=	opCodes.GAME_MSG_TASK_BENGN + 13--ˢ����������
opCodes.C2G_TASK_XS_BOX				=	opCodes.GAME_MSG_TASK_BENGN + 14--����������
opCodes.G2C_TASK_DANQI_COUNT	=	opCodes.GAME_MSG_TASK_BENGN + 15--�����������
opCodes.G2C_TASK_XS_COUNT			=	opCodes.GAME_MSG_TASK_BENGN + 16--�����������

-------------------------------------------item--begin-----------------------------------------------------
--��ʼ����:2013��1��6��
--�޸�����:2013��1��6��
--����:aq
--˵��:�޸İ汾
-----------------------------------------------------------------------------------------------------------
opCodes.G2C_ITEM_LIST             = opCodes.GAME_MSG_ITEM_BEGIN + 1  -- ��Ʒ�б�
opCodes.G2C_ITEM_UPDATE           = opCodes.GAME_MSG_ITEM_BEGIN + 2  -- ��Ʒ����
opCodes.G2C_ITEM_DROP             = opCodes.GAME_MSG_ITEM_BEGIN + 3  -- ��Ʒ����
opCodes.C2G_ITEM_PILE             = opCodes.GAME_MSG_ITEM_BEGIN + 4  -- ��Ʒ�ѵ�
opCodes.C2G_ITEM_MOVE             = opCodes.GAME_MSG_ITEM_BEGIN + 5  -- ��Ʒ�ƶ�\�滻
opCodes.C2G_ITEM_USE              = opCodes.GAME_MSG_ITEM_BEGIN	+ 6  -- ��Ʒʹ��
opCodes.C2G_ITEM_SELL             = opCodes.GAME_MSG_ITEM_BEGIN	+ 7  -- ��Ʒ����
opCodes.C2G_ITEM_BUY              = opCodes.GAME_MSG_ITEM_BEGIN + 8	 -- ������Ʒ
opCodes.C2G_ITEM_BUY_BACK         = opCodes.GAME_MSG_ITEM_BEGIN + 9  -- ��������NPC����Ʒ
opCodes.C2G_ITEM_PACKET_RESET	  =	opCodes.GAME_MSG_ITEM_BEGIN + 10 -- ��������
opCodes.C2G_ITEM_SELL_LIST        = opCodes.GAME_MSG_ITEM_BEGIN + 11 -- ��Ʒ�����б�
opCodes.G2C_ITEM_SELL_LIST        = opCodes.GAME_MSG_ITEM_BEGIN + 12 -- ��Ʒ�����б�
opCodes.G2C_ITEM_UPDATEBUYBACKLIST = opCodes.GAME_MSG_ITEM_BEGIN + 13 -- ����ɾ����Ʒ�б���ͻ���

opCodes.C2G_ITEM_WAREHOUSE_ADD	  	=	opCodes.GAME_MSG_ITEM_BEGIN + 30 -- �ֿ������Ʒ(id, pos)
opCodes.C2G_ITEM_WAREHOUSE_GET	  	=	opCodes.GAME_MSG_ITEM_BEGIN + 31 -- �ֿ�ȡ����Ʒ(id, pos)
opCodes.C2G_ITEM_WAREHOUSE_MOVE = opCodes.GAME_MSG_ITEM_BEGIN + 32 -- �ֿ���Ʒ�ƶ�\�滻(id, pos)
opCodes.C2G_ITEM_WAREHOUSE_PILE	  	=	opCodes.GAME_MSG_ITEM_BEGIN + 33 --�ֿ���Ʒ�ѵ�
opCodes.C2G_ITEM_WAREHOUSE_RESET  	=	opCodes.GAME_MSG_ITEM_BEGIN + 34 --�ֿ���Ʒ����
opCodes.C2G_ITEM_ADDPACK  			=	opCodes.GAME_MSG_ITEM_BEGIN + 35 --����/�ֿ���Ӹ���

opCodes.C2G_ITEM_EQUIP_GETOFF     = opCodes.GAME_MSG_ITEM_BEGIN + 50 -- ����װ��
opCodes.C2G_ITEM_EQUIP_STRENGTHEN = opCodes.GAME_MSG_ITEM_BEGIN + 51 -- װ��ǿ��
opCodes.C2G_ITEM_EQUIP_EMBED      = opCodes.GAME_MSG_ITEM_BEGIN + 52 -- װ����Ƕ
opCodes.C2G_ITEM_EQUIP_LEVELUP    = opCodes.GAME_MSG_ITEM_BEGIN + 53 -- װ������
opCodes.C2G_ITEM_STONE_COMPOUND   = opCodes.GAME_MSG_ITEM_BEGIN + 54 -- ��ʯ�ϳ�
opCodes.C2G_ITEM_EQUIP_TAKEOUT   = opCodes.GAME_MSG_ITEM_BEGIN + 55  -- ��ʯ����
opCodes.C2G_ITEM_EQUIP_ADDSOCKET   = opCodes.GAME_MSG_ITEM_BEGIN + 56  -- װ�������
opCodes.C2G_ITEM_EQUIP_STONE_COMPOUND = opCodes.GAME_MSG_ITEM_BEGIN + 57  -- װ���ϵı�ʯ�ϳ�
opCodes.C2G_ITEM_BUY_EQUIP = opCodes.GAME_MSG_ITEM_BEGIN + 58 --���򲢴���װ��

opCodes.C2G_ITEM_LOAD_SHOP		  = opCodes.GAME_MSG_ITEM_BEGIN + 61 --  �����̵���Ʒ�б�
opCodes.G2C_ITEM_LOAD_SHOP		  = opCodes.GAME_MSG_ITEM_BEGIN + 62 --  �����̵���Ʒ�б�
--opCodes.G2C_ITEM_CURRENCY		  	= opCodes.GAME_MSG_ITEM_BEGIN + 65 --  ����Ԫ��
opCodes.G2C_ITEM_STUDY_RECIPELIST	  = opCodes.GAME_MSG_ITEM_BEGIN + 70 --  ��¼��ʱ�����Ѿ�ѧϰ�䷽�б�
opCodes.G2C_ITEM_STUDY_RECIPE		  = opCodes.GAME_MSG_ITEM_BEGIN + 71 --  ����ѧϰ�䷽
--opCodes.C2G_ITEM_CURRENCY		  	= opCodes.GAME_MSG_ITEM_BEGIN + 93 -- ˢ��Ԫ��
opCodes.C2G_ITEM_LOAD_SHOP_EX		= opCodes.GAME_MSG_ITEM_BEGIN + 72 --  �����̵���Ʒ�б�
opCodes.G2C_ITEM_LOAD_SHOP_EX		= opCodes.GAME_MSG_ITEM_BEGIN + 73 --  �����̵���Ʒ�б�
opCodes.C2G_ITEM_BUY_EX 			= opCodes.GAME_MSG_ITEM_BEGIN + 74 --  �����ۿ���Ʒ
opCodes.G2C_ITEM_SHOP_OPEN_CLOSE    = opCodes.GAME_MSG_ITEM_BEGIN + 75 --  ֪ͨ�ͻ����̵��ۿۻʱ����


opCodes.C2G_ITEM_SUPERWEAPON_OPEN		  = opCodes.GAME_MSG_ITEM_BEGIN + 81 	--���������
opCodes.G2C_ITEM_SUPERWEAPON_OPEN		  = opCodes.GAME_MSG_ITEM_BEGIN + 82 	--���������������
opCodes.C2G_ITEM_SUPERWEAPON_CASTING	  = opCodes.GAME_MSG_ITEM_BEGIN + 83 	--�������
opCodes.G2C_ITEM_SUPERWEAPON_CASTING	  = opCodes.GAME_MSG_ITEM_BEGIN + 84 	--���������������
opCodes.C2G_ITEM_SUPERWEAPON_RESTORE	  = opCodes.GAME_MSG_ITEM_BEGIN + 85 	--��ԭ���
opCodes.G2C_ITEM_SUPERWEAPON_RESTORE	  = opCodes.GAME_MSG_ITEM_BEGIN + 86 	--���ػ�ԭ�������
opCodes.C2G_ITEM_SUPERWEAPON_LEVELUP	  = opCodes.GAME_MSG_ITEM_BEGIN + 87 	--�������
opCodes.G2C_ITEM_SUPERWEAPON_LEVELUP	  = opCodes.GAME_MSG_ITEM_BEGIN + 88 	--���������������
opCodes.C2G_ITEM_SUPERWEAPON_OPEN_SUB	  = opCodes.GAME_MSG_ITEM_BEGIN + 89 	--������ӽ���
opCodes.G2C_ITEM_SUPERWEAPON_OPEN_SUB	  = opCodes.GAME_MSG_ITEM_BEGIN + 90 	--��������ӽ�������
opCodes.C2G_ITEM_SUPERWEAPON_GETHEROSOUL  = opCodes.GAME_MSG_ITEM_BEGIN + 91 	--��ȡ����
opCodes.G2C_ITEM_SUPERWEAPON_GETHEROSOUL  = opCodes.GAME_MSG_ITEM_BEGIN + 92 	--������ȡ��������
opCodes.C2G_ITEM_SUPERWEAPON_BUYHEROSOUL  = opCodes.GAME_MSG_ITEM_BEGIN + 93 	--���򽫻�
opCodes.G2C_ITEM_SUPERWEAPON_BUYHEROSOUL  = opCodes.GAME_MSG_ITEM_BEGIN + 94 	--���ع��򽫻�����
opCodes.C2G_ITEM_SUPERWEAPON_OPEN_HERO	  = opCodes.GAME_MSG_ITEM_BEGIN + 95 	--������佫����
opCodes.G2C_ITEM_SUPERWEAPON_OPEN_HERO	  = opCodes.GAME_MSG_ITEM_BEGIN + 96 	--��������佫��������

opCodes.C2G_ITEM_BLACK_NPC_SHOP_LOAD	  = opCodes.GAME_MSG_ITEM_BEGIN + 100 	--������������̵���Ϣ
opCodes.G2C_ITEM_BLACK_NPC_SHOP_LOAD	  = opCodes.GAME_MSG_ITEM_BEGIN + 101 	--���غ��������̵���Ϣ
opCodes.C2G_ITEM_BLACK_NPC_SHOP_BUY	  	  = opCodes.GAME_MSG_ITEM_BEGIN + 102 	--������������̵���Ʒ
opCodes.G2C_ITEM_BLACK_NPC_SHOP_SEND	  = opCodes.GAME_MSG_ITEM_BEGIN + 103 	--�����̵���Ϣˢ��

-------------------------------------------item--end-----------------------------------------------------
---------------------------------------------------------------------------------------------------------


--team
opCodes.C2G_TEAM_INVITE           = opCodes.GAME_MSG_TEAM_BEGIN + 1  -- �����������
opCodes.G2C_TEAM_INVITE           = opCodes.GAME_MSG_TEAM_BEGIN + 2  -- �յ��������
opCodes.C2G_TEAM_REPLY_INVITE     = opCodes.GAME_MSG_TEAM_BEGIN + 3  -- ����/�ܾ�����
opCodes.C2G_TEAM_APPLY            = opCodes.GAME_MSG_TEAM_BEGIN + 4  -- �����������
opCodes.G2C_TEAM_APPLY            = opCodes.GAME_MSG_TEAM_BEGIN + 5  -- �յ��������
opCodes.C2G_TEAM_REPLY_APPLY      = opCodes.GAME_MSG_TEAM_BEGIN + 6  -- ����/�ܾ����
opCodes.C2G_TEAM_CAPTAIN          = opCodes.GAME_MSG_TEAM_BEGIN + 7  -- �����ӳ�
opCodes.C2G_TEAM_KICK             = opCodes.GAME_MSG_TEAM_BEGIN + 8  -- �������
opCodes.C2G_TEAM_RANK             = opCodes.GAME_MSG_TEAM_BEGIN + 9  -- ���Ķ�Աλ��
opCodes.C2G_TEAM_LEAVE            = opCodes.GAME_MSG_TEAM_BEGIN + 10 -- �˳�����
opCodes.C2G_TEAM_DISBAND          = opCodes.GAME_MSG_TEAM_BEGIN + 11 -- ��ɢ����
opCodes.C2G_TEAM_AWAY             = opCodes.GAME_MSG_TEAM_BEGIN + 12 -- ����
opCodes.C2G_TEAM_BACK             = opCodes.GAME_MSG_TEAM_BEGIN + 13 -- ���
opCodes.C2G_TEAM_LINEUP_SET       = opCodes.GAME_MSG_TEAM_BEGIN + 14 -- ��������
opCodes.C2G_TEAM_CLEAR_APPLY      = opCodes.GAME_MSG_TEAM_BEGIN + 15 -- ��������б�
opCodes.G2C_TEAM_CREATE           = opCodes.GAME_MSG_TEAM_BEGIN + 16 -- ��������
opCodes.G2C_TEAM_ADD              = opCodes.GAME_MSG_TEAM_BEGIN + 17 -- �����Ա
opCodes.G2C_TEAM_AWAY             = opCodes.GAME_MSG_TEAM_BEGIN + 18 -- ����
opCodes.G2C_TEAM_BACK             = opCodes.GAME_MSG_TEAM_BEGIN + 19 -- ���
opCodes.G2C_TEAM_LEAVE            = opCodes.GAME_MSG_TEAM_BEGIN + 20 -- �˳�
opCodes.G2C_TEAM_DISBAND          = opCodes.GAME_MSG_TEAM_BEGIN + 21 -- ��ɢ����
opCodes.G2C_TEAM_RANK             = opCodes.GAME_MSG_TEAM_BEGIN + 22 -- ���¶�������
opCodes.G2C_TEAM_CAPTAIN          = opCodes.GAME_MSG_TEAM_BEGIN + 23 -- �����ӳ�
opCodes.C2G_TEAM_CREATE           = opCodes.GAME_MSG_TEAM_BEGIN	+ 24 -- ��������
opCodes.G2C_TEAM_UPDATE           = opCodes.GAME_MSG_TEAM_BEGIN + 26 -- ���������Ϣ
opCodes.G2C_TEAM_DISAPPEAR        = opCodes.GAME_MSG_TEAM_BEGIN + 27 -- ������ʧ��Ϣ
opCodes.G2C_TEAM_APPLY_LIST       = opCodes.GAME_MSG_TEAM_BEGIN + 28 -- �����б�
opCodes.G2C_TEAM_LINEUP_SET       = opCodes.GAME_MSG_TEAM_BEGIN + 29 -- �������͸ı�
opCodes.G2C_TEAM_CAPTAIN_POS      = opCodes.GAME_MSG_TEAM_BEGIN + 30 -- ��ȡ�ӳ�����
opCodes.C2G_TEAM_GET_HPMP         = opCodes.GAME_MSG_TEAM_BEGIN + 31 -- ��ȡ��Ա��Ѫֵ
opCodes.G2C_TEAM_GET_HPMP         = opCodes.GAME_MSG_TEAM_BEGIN + 32 -- ��ȡ��Ա��Ѫֵ
opCodes.G2C_TEAM_TEAMMATE_HPMP    = opCodes.GAME_MSG_TEAM_BEGIN + 33 -- �õ�������Ա����Ѫֵ
opCodes.G2C_TEAM_TEAMMATE_MAPID   = opCodes.GAME_MSG_TEAM_BEGIN + 34 -- ���¶�ԱmapId
opCodes.G2C_TEAM_TEAMMATE_POS     = opCodes.GAME_MSG_TEAM_BEGIN + 35 -- ���¶�Աλ��
opCodes.C2G_TEAM_AUTO_MAKE        = opCodes.GAME_MSG_TEAM_BEGIN + 36 -- �Զ����
opCodes.C2G_TEAM_TEST             = opCodes.GAME_MSG_TEAM_BEGIN + 50 -- ���԰�ť

-- channel 
opCodes.C2G_CHANNEL_SEND 			= opCodes.GAME_MSG_CHANNEL_BEGIN + 1	-- ����Ƶ����Ϣ
opCodes.G2C_CHANNEL_SEND 			= opCodes.GAME_MSG_CHANNEL_BEGIN + 2	-- ����Ƶ����Ϣ
opCodes.C2G_CHANNEL_PLAYER		=	opCodes.GAME_MSG_CHANNEL_BEGIN + 3	-- ����Ƶ����Ϣ
opCodes.G2C_CHANNEL_PLAYER		=	opCodes.GAME_MSG_CHANNEL_BEGIN + 4	-- ����Ƶ����Ϣ
opCodes.G2C_CHANNEL_SYSTEM		=	opCodes.GAME_MSG_CHANNEL_BEGIN + 5	-- ϵͳ����
opCodes.G2C_CHANNEL_CLIENT		=	opCodes.GAME_MSG_CHANNEL_BEGIN + 6	-- �ͷ���Ϣ

--skill
opCodes.G2C_SKILL_LEARN             = opCodes.GAME_MSG_SKILL_BEGIN + 1 --��������֪ͨ�ͻ���ѧ�����ĸ�����
opCodes.C2G_SKILL_UPGRADE           = opCodes.GAME_MSG_SKILL_BEGIN + 2 --��������
opCodes.G2C_SKILL_UPGRADE           = opCodes.GAME_MSG_SKILL_BEGIN + 3 --������������
opCodes.G2C_UPDATE_LIVEBUFF         = opCodes.GAME_MSG_SKILL_BEGIN + 4 --��������buff
opCodes.G2C_REMOVE_LIVEBUFF         = opCodes.GAME_MSG_SKILL_BEGIN + 5 --�Ƴ�����buff



-------------------------------------------faction--begin-----------------------------------------------------
--��ʼ����:2013��1��6��
--�޸�����:2013��1��6��
--����:aq
--˵��:�޸İ汾
-----------------------------------------------------------------------------------------------------------
opCodes.C2G_FACTION_CREATE          = opCodes.GAME_MSG_FACTION_BEGIN + 1        --���ɴ���
opCodes.C2G_FACTION_NOTICE_REFRESH  = opCodes.GAME_MSG_FACTION_BEGIN + 2        --ˢ�¹�������
opCodes.G2C_FACTION_NOTICE_REFRESH  = opCodes.GAME_MSG_FACTION_BEGIN + 3        --���ع�������
opCodes.C2G_FACTION_INFO_REFRESH    = opCodes.GAME_MSG_FACTION_BEGIN + 4        --ˢ�°�����Ϣ
opCodes.G2C_FACTION_INFO_REFRESH    = opCodes.GAME_MSG_FACTION_BEGIN + 5        --���ذ�����Ϣ
opCodes.C2G_FACTION_MEMBER_REFRESH  = opCodes.GAME_MSG_FACTION_BEGIN + 6        --ˢ�³�Ա����
opCodes.G2C_FACTION_MEMBER_REFRESH  = opCodes.GAME_MSG_FACTION_BEGIN + 7        --���س�Ա����
opCodes.C2G_FACTION_INFO            = opCodes.GAME_MSG_FACTION_BEGIN + 8        --��ѯ���а����Ϣ
opCodes.G2C_FACTION_INFO            = opCodes.GAME_MSG_FACTION_BEGIN + 9        --�������а����Ϣ
opCodes.C2G_FACTION_SINGLE_INFO     = opCodes.GAME_MSG_FACTION_BEGIN + 10       --��ѯ�������ɵ���Ϣ
opCodes.G2C_FACTION_SINGLE_INFO     = opCodes.GAME_MSG_FACTION_BEGIN + 11       --���ذ��ɵĲ�ѯ��Ϣ
opCodes.C2G_FACTION_LEAVE           = opCodes.GAME_MSG_FACTION_BEGIN + 12       --�����뿪����
opCodes.C2G_FACTION_APPLY           = opCodes.GAME_MSG_FACTION_BEGIN + 13       --����������
opCodes.C2G_FACTION_APPLY_INFO      = opCodes.GAME_MSG_FACTION_BEGIN+ 14        --���������б�
opCodes.G2C_FACTION_APPLY_INFO      = opCodes.GAME_MSG_FACTION_BEGIN+ 15        --���������б�
opCodes.C2G_FACTION_CHECK           = opCodes.GAME_MSG_FACTION_BEGIN + 16       --�����������
opCodes.G2C_FACTION_SELF_UPDATE     = opCodes.GAME_MSG_FACTION_BEGIN + 17       --���������Ϣ����
opCodes.G2C_FACTION_UPDATE          = opCodes.GAME_MSG_FACTION_BEGIN + 18       --������Ϣ����
opCodes.C2G_FACTION_POST            = opCodes.GAME_MSG_FACTION_BEGIN + 19       --����ְλ
opCodes.C2G_FACTION_FIRE            = opCodes.GAME_MSG_FACTION_BEGIN + 20       --�������
opCodes.G2C_FACTION_FIRE            = opCodes.GAME_MSG_FACTION_BEGIN + 21       --����ɹ�����
opCodes.C2G_FACTION_NOTE            = opCodes.GAME_MSG_FACTION_BEGIN + 22       --������ɼ�¼
opCodes.G2C_FACTION_NOTE            = opCodes.GAME_MSG_FACTION_BEGIN + 23       --���ذ��ɼ�¼
opCodes.C2G_FACTION_NOTICE          = opCodes.GAME_MSG_FACTION_BEGIN + 24       --�޸Ĺ�������
opCodes.G2C_FACTION_NOTICE          = opCodes.GAME_MSG_FACTION_BEGIN + 25       --ˢ�¹�����Ϣ
opCodes.G2C_FACTION_DEL_APPLY       = opCodes.GAME_MSG_FACTION_BEGIN + 26       --ɾ��������Ϣ
opCodes.G2C_FACTION_TIPS            = opCodes.GAME_MSG_FACTION_BEGIN + 27       --����Ƶ����ʾ��Ϣ
opCodes.G2C_FACTION_DESTROY_FACTION = opCodes.GAME_MSG_FACTION_BEGIN + 28       --��ɢ����
opCodes.G2C_FACTION_SINGLE_MEMBER_REFRESH  = opCodes.GAME_MSG_FACTION_BEGIN + 29 --ˢ�µ�����Ա����
opCodes.C2G_FACTION_SINGLE_MEMBER_REFRESH  = opCodes.GAME_MSG_FACTION_BEGIN + 30 --���ص�����Ա����
opCodes.C2G_FACTION_ME				= opCodes.GAME_MSG_FACTION_BEGIN + 31	   -- ������֤�Ƿ����Լ�����
opCodes.G2C_FACTION_ME				= opCodes.GAME_MSG_FACTION_BEGIN + 32	   -- ������֤�Ƿ����Լ�����
opCodes.C2G_FACTION_CHANGE_LOGO		=	opCodes.GAME_MSG_FACTION_BEGIN + 33	   -- �޸İ��ɱ�־
opCodes.C2G_FACTION_CLEAR_APPLY		=	opCodes.GAME_MSG_FACTION_BEGIN + 34	   -- ��������б�
opCodes.G2C_FACTION_CLEAR_APPLY		=	opCodes.GAME_MSG_FACTION_BEGIN + 35	   -- ������������б�
opCodes.C2G_FACTION_CHANGE_NAME		=	opCodes.GAME_MSG_FACTION_BEGIN + 36	   -- ����
opCodes.C2G_FACTION_MEMBER_TASK     = opCodes.GAME_MSG_FACTION_BEGIN + 37      --��ȡ��Ա��ɰ�����������
opCodes.G2C_FACTION_MEMBER_TASK     = opCodes.GAME_MSG_FACTION_BEGIN + 38      --��ȡ��Ա��ɰ�����������
opCodes.C2G_FACTION_MONEY_TREE_WATER= opCodes.GAME_MSG_FACTION_BEGIN + 39      --���ҡǮ��
opCodes.G2C_FACTION_MONEY_TREE_WATER= opCodes.GAME_MSG_FACTION_BEGIN + 40      --���ع�ȳɹ�
opCodes.C2G_FACTION_MONEY_TREE_ROCK = opCodes.GAME_MSG_FACTION_BEGIN + 41      --ҡǮ��ҡǮ
opCodes.G2C_FACTION_MONEY_TREE_ROCK	= opCodes.GAME_MSG_FACTION_BEGIN + 42	   --֪ͨ�ͻ���ҡǮ������ҡǮ��
opCodes.C2G_FACTION_NIMBUSNOTICE    = opCodes.GAME_MSG_FACTION_BEGIN + 43      --��������ֵ��Ӽ�¼
opCodes.G2C_FACTION_NIMBUSNOTICE    = opCodes.GAME_MSG_FACTION_BEGIN + 44 	   --��������ֵ��¼
opCodes.G2C_FACTION_MEMBER_DEL      = opCodes.GAME_MSG_FACTION_BEGIN+ 45       --��Ա�˳�������
opCodes.C2G_FACTION_TOGETHER_LIST   = opCodes.GAME_MSG_FACTION_BEGIN+ 46       --������԰�����б�
opCodes.G2C_FACTION_TOGETHER_LIST   = opCodes.GAME_MSG_FACTION_BEGIN+ 47       --������԰�����б�
opCodes.C2G_FACTION_TOGETHER_JOIN   = opCodes.GAME_MSG_FACTION_BEGIN+ 48       --���������԰����
opCodes.G2C_FACTION_TOGETHER_SUCCESS= opCodes.GAME_MSG_FACTION_BEGIN+ 49       --��԰����ɹ�
opCodes.C2G_FACTION_TOGETHER_CALL   = opCodes.GAME_MSG_FACTION_BEGIN+ 50       --��԰����ȫ���ٻ�
opCodes.G2C_FACTION_TOGETHER_CALL   = opCodes.GAME_MSG_FACTION_BEGIN+ 51       --֪ͨȫ������԰�����ٻ�
opCodes.C2G_FACTION_RESET_NAME      = opCodes.GAME_MSG_FACTION_BEGIN+ 52       --�޸İ�������
opCodes.C2G_FACTION_FAST_INVATE		= opCodes.GAME_MSG_FACTION_BEGIN+ 53       --���ٷ���������Ϣ      
opCodes.G2C_FACTION_INVATE_COUNT	= opCodes.GAME_MSG_FACTION_BEGIN+ 54		--�������������Ϣ
-------------------------------------faction--end-------------------------------------------------------

-------------------------------------------compete--begin-----------------------------------------------
--��ʼ����:2013��3��1��
--�޸�����:2013��4��2��
--����:aq
--˵��:�޸İ汾
--------------------------------------------------------------------------------------------------------
opCodes.C2G_COMPETE_WAR_APPLY              = opCodes.GAME_MSG_COMPETE_BEGIN + 21 --����
opCodes.C2G_COMPETE_WAR_APPLY_INFO         = opCodes.GAME_MSG_COMPETE_BEGIN + 22 --�ͻ�����������Ϣ
opCodes.G2C_COMPETE_WAR_APPLY_INFO         = opCodes.GAME_MSG_COMPETE_BEGIN + 23 --���ر�����Ϣ���ͻ���
opCodes.C2G_COMPETE_WAR_PLAYER_INFO		   = opCodes.GAME_MSG_COMPETE_BEGIN + 24 --�����ս�����Ϣ 
opCodes.G2C_COMPETE_WAR_PLAYER_INFO		   = opCodes.GAME_MSG_COMPETE_BEGIN + 25 --���ذ�ս�����Ϣ
opCodes.C2G_COMPETE_WAR_FACTION_INFO       = opCodes.GAME_MSG_COMPETE_BEGIN + 26 --�����ս���ɻ�����Ϣ 
opCodes.G2C_COMPETE_WAR_FACTION_INFO       = opCodes.GAME_MSG_COMPETE_BEGIN + 27 --���ذ�ս���ɻ�����Ϣ 
opCodes.C2G_COMPETE_WAR_ENTER              = opCodes.GAME_MSG_COMPETE_BEGIN + 28 --����
opCodes.C2G_COMPETE_WAR_LEAVE              = opCodes.GAME_MSG_COMPETE_BEGIN + 29 --�˳�
opCodes.C2G_COMPETE_WAR_GET_PRIZE          = opCodes.GAME_MSG_COMPETE_BEGIN + 30 --��ȡ����
opCodes.G2C_COMPETE_WAR_PRIZE_NOTICE       = opCodes.GAME_MSG_COMPETE_BEGIN + 31 --֪ͨ�н�����ȡ
opCodes.G2C_COMPETE_WAR_GET_PRIZE          = opCodes.GAME_MSG_COMPETE_BEGIN + 32 --���ذ�ս������Ϣ

opCodes.G2C_COMPETE_WAR_APPLY_SUCCESS      = opCodes.GAME_MSG_COMPETE_BEGIN + 35 --�����ɹ�
opCodes.G2C_COMPETE_WAR_STATE              = opCodes.GAME_MSG_COMPETE_BEGIN + 36 --��ս�����׶η���
opCodes.G2C_COMPETE_WAR_BTN_STATE          = opCodes.GAME_MSG_COMPETE_BEGIN + 37 --��ս���˸�����ť״̬

opCodes.G2C_COMPETE_WAR_PLAYER_SCORE       = opCodes.GAME_MSG_COMPETE_BEGIN + 38 --��ս����ÿ��ս����õĻ���

--��ս��������
opCodes.C2G_FACTION_CITY_ENTER             = opCodes.GAME_MSG_COMPETE_BEGIN + 50 --�������ֽ���
opCodes.C2G_FACTION_CITY_LEAVE             = opCodes.GAME_MSG_COMPETE_BEGIN + 51 --���������˳�
opCodes.C2G_FACTION_CITY_NEIGHBOR_INFO     = opCodes.GAME_MSG_COMPETE_BEGIN + 52 --�������ڰ�����Ϣ
opCodes.G2C_FACTION_CITY_NEIGHBOR_INFO     = opCodes.GAME_MSG_COMPETE_BEGIN + 53 --�������ڰ�����Ϣ
opCodes.C2G_FACTION_CITY_GOTO_LIFE         = opCodes.GAME_MSG_COMPETE_BEGIN + 54 --�������ڵİ���
opCodes.C2G_FACTION_CITY_GOTO_MONSTER      = opCodes.GAME_MSG_COMPETE_BEGIN + 55 --���͵������ͼ
opCodes.C2G_FACTION_CITY_FIGHT_MONSTER     = opCodes.GAME_MSG_COMPETE_BEGIN + 56 --�������﷢��ս��
opCodes.C2G_FACTION_CITY_FIGHT_PLAYER      = opCodes.GAME_MSG_COMPETE_BEGIN + 57 --�������ҷ���ս��
opCodes.G2C_FACTION_CITY_PRIZE             = opCodes.GAME_MSG_COMPETE_BEGIN + 58 --����ս����־
opCodes.G2C_FACTION_CITY_STATE             = opCodes.GAME_MSG_COMPETE_BEGIN + 59 --���ͻ��˷�������������������߰�ť״̬
opCodes.C2G_FACTION_CITY_ADD_BUFF          = opCodes.GAME_MSG_COMPETE_BEGIN + 60 --�����������ֹ���
opCodes.C2G_FACTION_CITY_ADD_BUFF_ALL      = opCodes.GAME_MSG_COMPETE_BEGIN + 61 --�����������ֹ���(���)
opCodes.G2C_FACTION_CITY_ADD_BUFF          = opCodes.GAME_MSG_COMPETE_BEGIN + 62 --�����������ֹ���
opCodes.C2G_FACTION_CITY_LIFE              = opCodes.GAME_MSG_COMPETE_BEGIN + 63 --5Ԫ����������
opCodes.C2G_FACTION_CITY_ENTER_LIFE        = opCodes.GAME_MSG_COMPETE_BEGIN + 64 --�ڱ�İ��ɷ��ظ����
opCodes.G2C_FACTION_CITY_MAP_IN_OUT        = opCodes.GAME_MSG_COMPETE_BEGIN + 65 --���ƿͻ��˵Ľ���
opCodes.G2C_FACTION_CITY_WAIT_TIME         = opCodes.GAME_MSG_COMPETE_BEGIN + 66 --����ʱ��

--marry
opCodes.C2G_MARRY_CREATE                = opCodes.GAME_MSG_MARRY_BEGIN + 1 --�������
opCodes.G2C_MARRY_CREATE                = opCodes.GAME_MSG_MARRY_BEGIN + 2 --��������
opCodes.C2G_MARRY_CANCEL                = opCodes.GAME_MSG_MARRY_BEGIN + 3 --���
opCodes.G2C_MARRY_CANCEL                = opCodes.GAME_MSG_MARRY_BEGIN + 4 --��鷵��
opCodes.C2G_MARRY_SECTION               = opCodes.GAME_MSG_MARRY_BEGIN + 5 --֪ͨ��������ʼ���Ŷ���
opCodes.G2C_MARRY_LOGIN                 = opCodes.GAME_MSG_MARRY_BEGIN + 6 --֪ͨ�ϰ�����
opCodes.G2C_MARRY_LOGOUT                = opCodes.GAME_MSG_MARRY_BEGIN + 7 --֪ͨ�ϰ�����
opCodes.C2G_MARRY_SWEET                 = opCodes.GAME_MSG_MARRY_BEGIN + 8 --֪ͨ���������ǹ�
opCodes.G2C_MARRY_INFO                  = opCodes.GAME_MSG_MARRY_BEGIN + 9 --������߷��ͽ����Ϣ
opCodes.C2G_MARRY_NORMAL_APPLY          = opCodes.GAME_MSG_MARRY_BEGIN + 10 --������ͨ���
opCodes.C2G_MARRY_SPECIAL_APPLY         = opCodes.GAME_MSG_MARRY_BEGIN + 11 --����������
opCodes.G2C_MARRY_FIREWORKS             = opCodes.GAME_MSG_MARRY_BEGIN + 12 --�����̻�
opCodes.G2C_MARRY_WEDDING               = opCodes.GAME_MSG_MARRY_BEGIN + 13 --���Ű���
opCodes.G2C_MARRY_UPDATE                = opCodes.GAME_MSG_MARRY_BEGIN + 14 --���״̬����
opCodes.C2G_MARRY_TRAVEL_INFO           = opCodes.GAME_MSG_MARRY_BEGIN + 15 --��ȡ���������Ϣ
opCodes.G2C_MARRY_TRAVEL_INFO           = opCodes.GAME_MSG_MARRY_BEGIN + 16 --��ȡ���������Ϣ

--friend
opCodes.C2G_APPLY_FRIEND_ADD            = opCodes.GAME_MSG_FRIEND_BEGIN + 1 --��Ӻ���--
opCodes.G2C_APPLY_FRIEND_ADD            = opCodes.GAME_MSG_FRIEND_BEGIN + 2
opCodes.C2G_FRIEND_DEL                  = opCodes.GAME_MSG_FRIEND_BEGIN + 3 --ɾ������
opCodes.G2C_FRIEND_DEL                  = opCodes.GAME_MSG_FRIEND_BEGIN + 4 
opCodes.C2G_FRIEND_LIST                 = opCodes.GAME_MSG_FRIEND_BEGIN + 5 --�����б�
opCodes.G2C_FRIEND_LIST                 = opCodes.GAME_MSG_FRIEND_BEGIN + 6
opCodes.C2G_NOTICE_FRIEND               = opCodes.GAME_MSG_FRIEND_BEGIN + 7 --֪ͨ�Է��Ƿ�Ҫ����Լ�Ϊ����
opCodes.G2C_NOTICE_FRIEND               = opCodes.GAME_MSG_FRIEND_BEGIN + 8

opCodes.C2G_ADD_FLOWER 	                = opCodes.GAME_MSG_FRIEND_BEGIN + 9 --��������ͻ���
opCodes.G2C_ADD_FLOWER 	                = opCodes.GAME_MSG_FRIEND_BEGIN + 10 --���ͻ������ҵ���Ϣ����
opCodes.C2G_FLOWER_INFO					= opCodes.GAME_MSG_FRIEND_BEGIN + 11 --���󻨶���Ϣ
opCodes.G2C_FLOWER_INFO					= opCodes.GAME_MSG_FRIEND_BEGIN + 12 --���ػ�����Ϣ
opCodes.G2C_BROADCAST_FLOWER			= opCodes.GAME_MSG_FRIEND_BEGIN + 13 --ȫ�����߹㲥������Ϣ
opCodes.C2G_FRIEND_PLAYERLIST			= opCodes.GAME_MSG_FRIEND_BEGIN + 14 --���󸽽������Ϣ
opCodes.G2C_FRIEND_PLAYERLIST			= opCodes.GAME_MSG_FRIEND_BEGIN + 15 --���ظ��������Ϣ

--talk and IM
opCodes.C2G_PLAYER_TALK                 = opCodes.GAME_MSG_PLAYER_TALK_BEGIN + 1 --���֮������
opCodes.G2C_PLAYER_TALK                 = opCodes.GAME_MSG_PLAYER_TALK_BEGIN + 2 --���췢��
opCodes.C2G_PLAYER_IM                   = opCodes.GAME_MSG_PLAYER_TALK_BEGIN + 3 --�������ߺ��IM��Ϣ
opCodes.G2C_PLAYER_IM                   = opCodes.GAME_MSG_PLAYER_TALK_BEGIN + 4 --�������ߺ��IM��Ϣ
opCodes.G2C_PLAYER_SYSTEM_MSG           = opCodes.GAME_MSG_PLAYER_TALK_BEGIN + 5 --����ϵͳ��Ϣ
opCodes.G2C_IM_COUNT                    = opCodes.GAME_MSG_PLAYER_TALK_BEGIN + 6 --����IM����

--card
opCodes.C2G_PLAYER_SET_CARD             = opCodes.GAME_MSG_PLAYER_CARD_BEGIN + 1 --������Ƭ��Ϣ
opCodes.G2C_PLAYER_SET_CARD             = opCodes.GAME_MSG_PLAYER_CARD_BEGIN + 2 --���÷���
opCodes.C2G_PLAYER_GET_CARD             = opCodes.GAME_MSG_PLAYER_CARD_BEGIN + 3 --��ȡ�����Ƭ��Ϣ
opCodes.G2C_PLAYER_GET_CARD             = opCodes.GAME_MSG_PLAYER_CARD_BEGIN + 4 --��Ƭ��Ϣ����
opCodes.C2G_PLAYER_SET_CARD_LOG         = opCodes.GAME_MSG_PLAYER_CARD_BEGIN + 5 --����Ƭ���ý���
opCodes.G2C_PLAYER_SET_CARD_LOG         = opCodes.GAME_MSG_PLAYER_CARD_BEGIN + 6 --������Ƭ���ý���

--bi wu
opCodes.C2G_BIWU_APPLY                = opCodes.GAME_MSG_BIWU_BEGIN + 1 -- �μӱ�����
opCodes.C2G_BIWU_ENTER 				  = opCodes.GAME_MSG_BIWU_BEGIN + 2 -- ���������
opCodes.C2G_BIWU_LEAVE                = opCodes.GAME_MSG_BIWU_BEGIN + 3 -- �˳�������
opCodes.C2G_BIWU_GET_PRIZE            = opCodes.GAME_MSG_BIWU_BEGIN + 4 -- ��ȡ����
opCodes.G2C_BIWU_GET_PRIZE            = opCodes.GAME_MSG_BIWU_BEGIN + 5 -- ���ؽ�����ȡ
opCodes.C2G_BIWU_GET_INFO             = opCodes.GAME_MSG_BIWU_BEGIN + 6 -- �������ɼ�
opCodes.G2C_BIWU_GET_INFO             = opCodes.GAME_MSG_BIWU_BEGIN + 7 -- ���ؽ���ɼ�
opCodes.C2G_BIWU_GET_16_OLD_INFO      = opCodes.GAME_MSG_BIWU_BEGIN + 8 -- �����16����ɼ�
opCodes.G2C_BIWU_GET_16_OLD_INFO      = opCodes.GAME_MSG_BIWU_BEGIN + 9 -- ���ؾ�16����ɼ�
opCodes.G2C_BIWU_STATE                = opCodes.GAME_MSG_BIWU_BEGIN + 10 -- ������״̬
opCodes.G2C_BIWU_ROUND_INFO           = opCodes.GAME_MSG_BIWU_BEGIN + 11 -- ������ÿ��ս���Ľ�����Ϣ
opCodes.C2G_BIWU_GET_16_FIGHT_INFO    = opCodes.GAME_MSG_BIWU_BEGIN + 12 -- ����ս���ɼ�
opCodes.G2C_BIWU_GET_16_FIGHT_INFO    = opCodes.GAME_MSG_BIWU_BEGIN + 13 -- ����ս���ɼ�
opCodes.C2G_BIWU_READY_GO             = opCodes.GAME_MSG_BIWU_BEGIN + 14 -- ս��׼��
opCodes.G2C_BIWU_BTN_STATE			  = opCodes.GAME_MSG_BIWU_BEGIN + 15 -- ������FB����״̬

--rob map
opCodes.C2G_ROBMAP_ENTER              = opCodes.GAME_MSG_ROBMAP_BEGIN + 1 --�������֮��
opCodes.C2G_ROBMAP_PICK               = opCodes.GAME_MSG_ROBMAP_BEGIN + 2 --ʰȡ��������
opCodes.G2C_ROBMAP_INFO               = opCodes.GAME_MSG_ROBMAP_BEGIN + 3 --����/�˳�������Ϣ
opCodes.G2C_ROBMAP_GATE_COMBAT        = opCodes.GAME_MSG_ROBMAP_BEGIN + 4 --�Ƿ���������ս

-- verify
opCodes.G2C_VERIFY_CODE								=	opCodes.GAME_MSG_VERIFY_BEGIN	+ 1 --��֤��ͼƬ	ushort,binary,ushort
opCodes.C2G_VERIFY_CODE								=	opCodes.GAME_MSG_VERIFY_BEGIN	+ 2 --�ύ��֤��	string
opCodes.C2G_VERIFY_CODE_CHANGE 				=	opCodes.GAME_MSG_VERIFY_BEGIN	+ 3 --������֤��	
opCodes.G2C_VERIFY_LOGOUT							=	opCodes.GAME_MSG_VERIFY_BEGIN	+ 4 --��������		

--activity
opCodes.C2G_DAILY_TASK								= opCodes.GAME_MSG_ACTIVITY_BEGIN + 1 --�򵥵��ճ��
opCodes.C2G_DAILY_TASK_PRIZE					= opCodes.GAME_MSG_ACTIVITY_BEGIN + 2 --����ճ����ȡ����
opCodes.G2C_DAILY_TASK								=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 3 --�ճ����������
opCodes.G2C_DAILY_TASK_UPDATE					=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 4 --�ճ���ĸ���
opCodes.G2C_DAILY_SHUDAO_DATA					=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 5 --�������������
opCodes.G2C_DAILY_SHUDAO_UPDATE				=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 6 --��������ĸ���
opCodes.G2C_DAILY_SHUDAO_CAR					=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 7 --�������ˢ������
opCodes.G2C_DAILY_LZD									=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 8 --¡�жԵ���
opCodes.C2G_DAILY_SHOOT								=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 9 --ԯ�����
opCodes.G2C_DAILY_SHOOT								=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 10--ԯ����ꪵ�����(����/����)
opCodes.G2C_DAILY_SHOOT_RESULT				=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 11--ԯ����ꪵĽ��
opCodes.G2C_DAILY_SHOOT_RECORD				=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 12--ԯ����ꪵĵý���¼
opCodes.G2C_DAILY_LZD_FAC_RANK				=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 13--����¡�ж�����
opCodes.G2C_DAILY_LZD_FAC_SCORE				=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 14--����¡�жԵ÷�
opCodes.G2C_DAILY_LZD_FAC							=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 15--����¡�жԵ���
opCodes.G2C_DAILY_TQ_LEVEL						=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 16--�޾���Ԩ
opCodes.C2G_DAILY_MONEY_TREE          = opCodes.GAME_MSG_ACTIVITY_BEGIN + 17--����ҡǮ��ҡǮ(��)
opCodes.G2C_DAILY_MONEY_TREE          = opCodes.GAME_MSG_ACTIVITY_BEGIN + 18--����ҡǮ��ҡǮ(��)
opCodes.G2C_DAILY_HS_DATA							=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 19--Ӣ���޵�
opCodes.G2C_DAILY_QUESTION						=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 20--����۵�
opCodes.G2C_DAILY_ZHUJIU_ANSWER				=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 21--����۵�
opCodes.G2C_DAILY_ZHUJIU_STATUS				=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 22--����۵���/��
opCodes.G2C_DAILY_ZHUJIU_INFO					=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 23--����۵�
opCodes.G2C_DAILY_JZ_INFO							=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 27--���ݷ��
opCodes.G2C_DAILY_JZ_SCORE						=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 28--���ݷ��
opCodes.G2C_DAILY_JZ_PLAYER						=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 29--���ݷ��
opCodes.G2C_DAILY_JZ_PLAYER_UPDATE		=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 30--���ݷ��
opCodes.G2C_DAILY_JZ_UPDATE						=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 31--���ݷ��
opCodes.G2C_DAILY_JZ_PLAYER_REMOVE		=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 32--���ݷ��
opCodes.C2G_DAILY_JZ_SKILL						=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 33--���ݷ��
opCodes.G2C_DAILY_JZ_OPEN							=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 34--���ݷ��
opCodes.G2C_DAILY_JZ_SKILL						=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 35--���ݷ��
opCodes.C2G_DAILY_MONEY_TREE_BOX      = opCodes.GAME_MSG_ACTIVITY_BEGIN + 36--����ҡǮ������(��)
opCodes.G2C_DAILY_TASK_FORBID					=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 37--�ճ��-�ر�
opCodes.C2G_DAILY_USE_CARD						=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 38--ʹ�������
opCodes.G2C_DAILY_NEWBIE_CARD					=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 39--���������
opCodes.C2G_DAILY_DOWNLOAD_PRIZE			=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 40--��ȡ�����������Ľ���
opCodes.G2C_DAILY_EMPEROR_INFO				=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 41--������Ϣ
opCodes.G2C_DAILY_EMPEROR_RESULT			=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 42--����

opCodes.C2G_ACTIVE_QUERY_DATA			   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 43--��Ӫ���������
opCodes.G2C_ACTIVE_QUERY_DATA			   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 44--��Ӫ���������
opCodes.G2C_ACTIVITY_EX_OPEN_CLOSE_LIST    = opCodes.GAME_MSG_ACTIVITY_BEGIN + 45 -- ֪ͨ�ͻ��˻״̬λ�б�
opCodes.G2C_ACTIVITY_EX_OPEN_CLOSE         = opCodes.GAME_MSG_ACTIVITY_BEGIN + 46 -- ֪ͨ�ͻ��˻״̬λ
opCodes.C2G_ACTIVITY_EX_ONE_TIME_HG_INFO   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 47 -- �ͻ�������һʱ������Ϣ
opCodes.G2C_ACTIVITY_EX_ONE_TIME_HG_INFO   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 48 -- ����������һʱ������Ϣ
opCodes.C2G_ACTIVITY_EX_ONE_TIME_HG_PRIZE  = opCodes.GAME_MSG_ACTIVITY_BEGIN + 49 -- �ͻ��������ȡһʱ��������
opCodes.G2C_ACTIVITY_EX_ONE_TIME_HG_PRIZE  = opCodes.GAME_MSG_ACTIVITY_BEGIN + 50 -- �ͻ��������ȡһʱ��������
opCodes.C2G_ACTIVITY_EX_STONE_DAY_INFO     = opCodes.GAME_MSG_ACTIVITY_BEGIN + 51 -- �ͻ�������ʯ�������Ϣ
opCodes.G2C_ACTIVITY_EX_STONE_DAY_INFO     = opCodes.GAME_MSG_ACTIVITY_BEGIN + 52 -- ���������ر�ʯ�������Ϣ
opCodes.C2G_ACTIVITY_EX_STONE_DAY_PRIZE    = opCodes.GAME_MSG_ACTIVITY_BEGIN + 53 -- �ͻ��������ȡ��ʯ���������
opCodes.C2G_ACTIVITY_EX_ACT_ONLINE_PRIZE   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 54 	   -- �ͻ�����������������ȡ��Ϣ
opCodes.C2G_ACTIVITY_EX_ACT_ONLINE_PRIZE_PRIZE  = opCodes.GAME_MSG_ACTIVITY_BEGIN + 55 -- �ͻ��������ȡ������������
opCodes.G2C_ACTIVITY_EX_ACT_ONLINE_PRIZE_PRIZE  = opCodes.GAME_MSG_ACTIVITY_BEGIN + 56 -- ���������ػ�ȡ������������
opCodes.C2G_ACTIVE_GET_PRIZE					=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 57--��ȡ����
opCodes.G2C_ACTIVE_RECORD							=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 58--������¼
opCodes.G2C_ACTIVE_DATA_RECHARGE_FEEDBACK	=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 59--��ֵ�ٻ�������
opCodes.G2C_ACTIVE_DATA_RECHARGE_SINGLE		=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 60--���ʳ�ֵ��������
opCodes.C2G_ACTIVITY_EX_ACT_ONLINE_RECORD   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 61 	   -- �ͻ���֪ͨ��������������¼
opCodes.C2G_ACTIVITY_EX_SOUL_DAY_INFO     = opCodes.GAME_MSG_ACTIVITY_BEGIN + 62 -- �ͻ����������������Ϣ
opCodes.G2C_ACTIVITY_EX_SOUL_DAY_INFO     = opCodes.GAME_MSG_ACTIVITY_BEGIN + 63 -- ���������ػ���������Ϣ
opCodes.C2G_ACTIVITY_EX_SOUL_DAY_PRIZE    = opCodes.GAME_MSG_ACTIVITY_BEGIN + 64 -- �ͻ��������ȡ������������

opCodes.C2G_ACTIVITY_EX_LOAD_CRAZY_ITEM   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 65 --  �������̵���Ʒ�б�
opCodes.G2C_ACTIVITY_EX_LOAD_CRAZY_ITEM	  = opCodes.GAME_MSG_ACTIVITY_BEGIN + 66 --  ���ط���̵���Ʒ�б�
opCodes.C2G_ACTIVITY_EX_BUY_CRAZY_ITEM	  = opCodes.GAME_MSG_ACTIVITY_BEGIN + 67 --  �������ۿ���Ʒ
opCodes.G2C_ACTIVITY_EX_ACT_ONLINE_LOGIN   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 68 -- ��¼ʱ��ȡ����������Ϣ
opCodes.G2C_ACTIVE_DATA_RECHARGE_REBATE		= opCodes.GAME_MSG_ACTIVITY_BEGIN + 69--��ֵ����
opCodes.G2C_ACTIVE_DATA_RECHARGE_AMOUNT		= opCodes.GAME_MSG_ACTIVITY_BEGIN + 70--��ֵ����
opCodes.C2G_ACTIVITY_EX_BOSS_RANK_INFO   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 71 -- ����BOSS������Ϣ
opCodes.G2C_ACTIVITY_EX_BOSS_RANK_INFO   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 72 -- ����BOSS������Ϣ
opCodes.C2G_ACTIVITY_EX_BOSS_RANK   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 73-- ��ȡBOSS���н���
opCodes.G2C_ACTIVITY_EX_BOSS_RANK   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 74-- ��ȡBOSS���н���

opCodes.C2G_ACTIVITY_EX_MONEY_TREE_INFO   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 75-- �ͻ������������Ϣ
opCodes.G2C_ACTIVITY_EX_MONEY_TREE_INFO   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 76-- ���ز�����Ϣ
opCodes.C2G_ACTIVITY_EX_ROCK_MONEY_TREE   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 77-- �ͻ����������ҡǮ

opCodes.C2G_ACTIVITY_EX_ACT_LOGIN_PRIZE   	   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 78 -- �ͻ��������¼������ȡ��Ϣ
opCodes.C2G_ACTIVITY_EX_ACT_LOGIN_PRIZE_PRIZE  = opCodes.GAME_MSG_ACTIVITY_BEGIN + 79 -- �ͻ��������ȡ��¼��������
opCodes.G2C_ACTIVITY_EX_ACT_LOGIN_PRIZE_PRIZE  = opCodes.GAME_MSG_ACTIVITY_BEGIN + 80 -- ���������ػ�ȡ��¼��������

opCodes.C2G_ACTIVITY_EX_RANK_INFO  					= opCodes.GAME_MSG_ACTIVITY_BEGIN + 81 --��ѯ����а�
opCodes.G2C_ACTIVITY_EX_RANK_INFO  					= opCodes.GAME_MSG_ACTIVITY_BEGIN + 82 --����а���Ϣ
opCodes.G2C_ACTIVITY_EX_DATA_RECHARGE_RANK	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 83 --��ֵ���а�
opCodes.G2C_ACTIVITY_EX_DATA_CURRENCY_RANK	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 84 --�������а�
opCodes.G2C_ACTIVITY_EX_LOAD_CRAZY_ITEM_SINGLE = opCodes.GAME_MSG_ACTIVITY_BEGIN + 85 --���ط���̵���Ʒ�б�(����)

opCodes.G2C_ACTIVITY_EX_DATA_DAILY_PRIZE		= opCodes.GAME_MSG_ACTIVITY_BEGIN + 86 -- �ճ�����

opCodes.C2G_ACTIVITY_EX_ACT_FAST_COME   	 	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 87 -- �ͻ��������ȵ�������ȡ��Ϣ
opCodes.C2G_ACTIVITY_EX_ACT_FAST_COME_PRIZE  	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 88 -- �ͻ��������ȡ�ȵ���������
opCodes.G2C_ACTIVITY_EX_ACT_FAST_COME_PRIZE  	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 89 -- ���������ػ�ȡ�ȵ���������
opCodes.G2C_ACTIVITY_EX_ACT_FAST_COME_LOGIN     = opCodes.GAME_MSG_ACTIVITY_BEGIN + 90 -- �������ṩ�ȵ�������Ϣ(��¼ʱ)

opCodes.G2C_ACTIVITY_EX_DATA_YEAR_MONSTER		=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 91 --��������
opCodes.G2C_ACTIVITY_EX_DATA_MONSTER_APPEAR	=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 92 --���޳���
opCodes.C2G_ACTIVITY_EX_DATA_MONSTER_FIGHT	=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 93 --����ս��

opCodes.C2G_ACTIVITY_EX_ACT_BIG_HAPPY   	 	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 94 -- �ͻ����������͸�齱
opCodes.G2C_ACTIVITY_EX_ACT_BIG_HAPPY   	 	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 95 -- ���������ش���͸�齱
opCodes.C2G_ACTIVITY_EX_ACT_BIG_HAPPY_PRIZE  	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 96 -- �ͻ����������͸������Ϣ
opCodes.G2C_ACTIVITY_EX_ACT_BIG_HAPPY_PRIZE  	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 97 -- ���������ش���͸������Ϣ
opCodes.C2G_ACTIVITY_EX_ACT_BIG_HAPPY_PRIZERECORD  	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 98 -- �ͻ����������͸�󽱼�¼
opCodes.G2C_ACTIVITY_EX_ACT_BIG_HAPPY_PRIZERECORD  	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 99 -- ���������ش���͸�󽱼�¼
opCodes.C2G_ACTIVITY_EX_ACT_BIG_HAPPY_TEN		  	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 100 -- �ͻ�������10�δ���͸�齱
opCodes.G2C_ACTIVITY_EX_ACT_BIG_HAPPY_TEN		  	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 101 -- ����������10�δ���͸�齱

opCodes.G2C_DAILY_JZ_BUFF							=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 102 --����buff
opCodes.G2C_DAILY_GIFT_CARD_RECORD		= opCodes.GAME_MSG_ACTIVITY_BEGIN + 103--�������¼
opCodes.C2G_DAILY_GIFT_CARD_PRIZE			=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 104--��ȡ���������

opCodes.G2C_ENDLESS_PARTY_STATUS			= opCodes.GAME_MSG_ACTIVITY_BEGIN + 105	--֪ͨ�ͻ����޾�����ϯ�״̬
opCodes.C2G_ENDLESS_PARTY_GET_PRIZE		= opCodes.GAME_MSG_ACTIVITY_BEGIN + 106	--�޾�����ϯ��ȡ����
opCodes.C2G_ENDLESS_PARTY_INFO			= opCodes.GAME_MSG_ACTIVITY_BEGIN + 107	--�����޾�����ϯ���Ϣ
opCodes.G2C_ENDLESS_PARTY_INFO			= opCodes.GAME_MSG_ACTIVITY_BEGIN + 108	--�����޾�����ϯ���Ϣ


opCodes.G2C_ACTIVITY_EX_DARKLY_DOOR_INFO	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 109	--���غڰ�֮����Ϣ
opCodes.C2G_ACTIVITY_EX_DARKLY_DOOR_INFO	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 110	--����ڰ�֮����Ϣ
opCodes.G2C_ACTIVITY_EX_DARKLY_DOOR_PRIZE	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 111	--�ڰ�֮���н���Ϣ
opCodes.C2G_ACTIVITY_EX_DARKLY_DOOR_PRIZE	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 112	--�ڰ�֮���н���Ϣ
opCodes.G2C_ACTIVITY_EX_CRAZY_ITEM_REFRESH	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 113 --����������Ʒˢ��
--Festival 
opCodes.C2G_MIDAUTUMN_LOGIN_PRIZE			=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 1--����֮��¼�콱
opCodes.G2C_MIDAUTUMN_LOGIN_PRIZE			=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 2--����
opCodes.C2G_MIDAUTUMN_LOTTERY				=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 3 --����֮�齱
opCodes.G2C_MIDAUTUMN_LOTTERY				=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 4 --����֮�齱
opCodes.C2G_MIDAUTUMN_LOTTERY_OPEN			=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 5 --����֮�齱�����
opCodes.G2C_MIDAUTUMN_LOTTERY_OPEN			=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 6 --����֮�齱�����
opCodes.G2C_MIDAUTUMN_HERO_TOGETHER			=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 7 --����֮�佫��Բ
opCodes.G2C_MIDAUTUMN_LOTTERY_PACKET_FULL	=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 8 --����֮�齱������
opCodes.C2G_MIDAUTUMN_PRIZE_RECORD			=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 9 --����֮�󽱼�¼
opCodes.G2C_MIDAUTUMN_PRIZE_RECORD			=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 10 --����֮�󽱼�¼

opCodes.G2C_FESTIVAL_OPEN			=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 21		--�����
opCodes.G2C_FESTIVAL_CLOSE		=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 22		--�����
opCodes.C2G_FESTIVAL_LOTTERY	=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 23		--��齱
opCodes.G2C_FESTIVAL_LOTTERY	=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 24		--��齱���
opCodes.C2G_FESTIVAL_PRIZE		= opCodes.GAME_MSG_FESTIVAL_BEGIN + 25		--���¼�콱
opCodes.G2C_FESTIVAL_PRIZE		=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 26		--���¼�콱
opCodes.C2G_FESTIVAL_DAILY		=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 27		--��ճ��ͷ�
opCodes.G2C_FESTIVAL_DAILY		=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 28		--��ճ��ͷ�
opCodes.C2G_FESTIVAL_RECORD		=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 29		--��󽱼�¼
opCodes.G2C_FESTIVAL_RECORD		=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 30		--��󽱼�¼


--maze
opCodes.G2C_MAZE_OPEN           		= opCodes.GAME_MSG_MAZE_BEGIN + 1             --�Թ������
opCodes.G2C_MAZE_CLOSE          		= opCodes.GAME_MSG_MAZE_BEGIN + 2             --�Թ������  
opCodes.C2G_MAZE_ENTER          		= opCodes.GAME_MSG_MAZE_BEGIN + 3             --�����Թ�
opCodes.C2G_MAZE_ENTER_LEVEL   		 	= opCodes.GAME_MSG_MAZE_BEGIN + 4             --�����Թ���һ�� 
opCodes.C2G_MAZE_MONSTER_COMBAT 		= opCodes.GAME_MSG_MAZE_BEGIN + 5             --�������Թ��ڵĹ����ս��
opCodes.C2G_MAZE_PLAYER_COMBAT  		= opCodes.GAME_MSG_MAZE_BEGIN + 6             --�������Թ��ڵ���ҵ�ս��
opCodes.C2G_MAZE_INFO           		= opCodes.GAME_MSG_MAZE_BEGIN + 7             --����Թ���Ϣ 
opCodes.G2C_MAZE_INFO           		= opCodes.GAME_MSG_MAZE_BEGIN + 8             --�Թ���Ϣ
opCodes.G2C_MAZE_MONSTER_STATE  		= opCodes.GAME_MSG_MAZE_BEGIN + 9             --ս���Թ�����֪ͨ 
opCodes.C2G_MAZE_RELIVE         		= opCodes.GAME_MSG_MAZE_BEGIN + 10            --������󸴻�
opCodes.G2C_MAZE_ENTER_LEVEL   		 	= opCodes.GAME_MSG_MAZE_BEGIN + 11            --�����Թ���һ�㷵��
opCodes.G2C_MAZE_DAMAGE_RANK    		= opCodes.GAME_MSG_MAZE_BEGIN + 12            --�˺�������Ϣ
opCodes.G2C_MAZE_PLAYER_STATE   		= opCodes.GAME_MSG_MAZE_BEGIN + 13            --ս���Թ����֪ͨ
opCodes.C2G_MAZE_SET_FACTION    		= opCodes.GAME_MSG_MAZE_BEGIN + 14            --�����Ƿ���Դ�ͬ�������
opCodes.G2C_MAZE_SET_FACTION    		= opCodes.GAME_MSG_MAZE_BEGIN + 15            --�����Ƿ���Դ�ͬ������
opCodes.C2G_MAZE_SEARCH_MONSTER_COMBAT  = opCodes.GAME_MSG_MAZE_BEGIN + 16            --�����Թ��ڹ���ս��
  
--Shop
opCodes.C2G_MALL_BUY									= opCodes.GAME_MSG_MALL_BEGIN + 1 --����
opCodes.G2C_MALL_BUY									= opCodes.GAME_MSG_MALL_BEGIN + 2 --����
opCodes.C2G_MALL_SELL									= opCodes.GAME_MSG_MALL_BEGIN + 3 --����
opCodes.G2C_MALL_SELL									= opCodes.GAME_MSG_MALL_BEGIN + 4 --����
opCodes.C2G_MALL_LIST									= opCodes.GAME_MSG_MALL_BEGIN + 5 --�б�
opCodes.G2C_MALL_LIST									= opCodes.GAME_MSG_MALL_BEGIN + 6 --�б�
opCodes.C2G_MALL_MYLIST								= opCodes.GAME_MSG_MALL_BEGIN + 7 --�ҵĽ���
opCodes.G2C_MALL_MYLIST								= opCodes.GAME_MSG_MALL_BEGIN + 8 --�ҵĽ���
opCodes.C2G_MALL_OFFLIST							= opCodes.GAME_MSG_MALL_BEGIN + 9 --����
opCodes.G2C_MALL_OFFLIST							= opCodes.GAME_MSG_MALL_BEGIN + 10 --����
opCodes.C2G_MALL_GET									= opCodes.GAME_MSG_MALL_BEGIN + 11 --��ȡ
opCodes.G2C_MALL_GET									= opCodes.GAME_MSG_MALL_BEGIN + 12 --��ȡ
opCodes.C2G_MALL_PURSE								= opCodes.GAME_MSG_MALL_BEGIN + 13 --ȡǮ��
opCodes.G2C_MALL_PURSE								= opCodes.GAME_MSG_MALL_BEGIN + 14 --ȡǮ��

opCodes.C2G_SHOP_GET_HISTORY          =	opCodes.GAME_MSG_SHOP_BEGIN + 1 --������ʷ��¼
opCodes.G2C_SHOP_GET_HISTORY	 				=	opCodes.GAME_MSG_SHOP_BEGIN + 2 --������ʷ��¼
opCodes.C2G_SHOP_BUY_CURRENCY_MSG			=	opCodes.GAME_MSG_SHOP_BEGIN + 3 --��ȡ/����Ԫ������Ϣ
opCodes.C2G_SHOP_SELL_CURRENCY_MSG		=	opCodes.GAME_MSG_SHOP_BEGIN + 4 --��ȡ/����Ԫ��������Ϣ
opCodes.G2C_SHOP_BUY_CURRENCY_MSG			=	opCodes.GAME_MSG_SHOP_BEGIN + 5 --Ԫ������Ϣ
opCodes.G2C_SHOP_SELL_CURRENCY_MSG		=	opCodes.GAME_MSG_SHOP_BEGIN + 6 --Ԫ��������Ϣ
opCodes.C2G_SHOP_BUY_CURRENCY					= opCodes.GAME_MSG_SHOP_BEGIN + 7 --��������Ԫ��
opCodes.C2G_SHOP_SELL_CURRENCY				= opCodes.GAME_MSG_SHOP_BEGIN + 8 --Ԫ����������
opCodes.C2G_SHOP_MONEY_ORDER					= opCodes.GAME_MSG_SHOP_BEGIN + 9 --��������
opCodes.C2G_SHOP_CURRENCY_ORDER				= opCodes.GAME_MSG_SHOP_BEGIN + 10--����Ԫ��
opCodes.C2G_SHOP_TRADE_RECORD					= opCodes.GAME_MSG_SHOP_BEGIN + 11--���м�¼

--auction
opCodes.C2G_AUCTION_GET_INFO          = opCodes.GAME_MSG_AUCTION_BEGIN + 1 -- ��ȡ������Ϣ
opCodes.G2C_AUCTION_GET_INFO          = opCodes.GAME_MSG_AUCTION_BEGIN + 2 -- ��ȡ������Ϣ
opCodes.C2G_AUCTION_ACTION            = opCodes.GAME_MSG_AUCTION_BEGIN + 3 -- ����
opCodes.C2G_AUCTION_GET_GOODS_INFO    = opCodes.GAME_MSG_AUCTION_BEGIN + 4 -- �鿴������Ʒ/�ݴ�����
opCodes.G2C_AUCTION_GET_GOODS_INFO    = opCodes.GAME_MSG_AUCTION_BEGIN + 5 -- ���ز鿴������Ʒ
opCodes.C2G_AUCTION_GET_GOODS         = opCodes.GAME_MSG_AUCTION_BEGIN + 6 -- ��ȡ��Ʒ
opCodes.C2G_AUCTION_GET_MONEY         = opCodes.GAME_MSG_AUCTION_BEGIN + 7 -- ȡ������
opCodes.G2C_AUCTION_GET_PLAYER_PRIZE  = opCodes.GAME_MSG_AUCTION_BEGIN + 8 -- �鿴�Լ��ĳ���
opCodes.G2C_AUCTION_GET_MONEY_INFO    = opCodes.GAME_MSG_AUCTION_BEGIN + 9 -- ���ز鿴�ݴ�����

--Show
opCodes.C2G_SHOW_LIST					        =	opCodes.GAME_MSG_SHOW_BEGIN + 1 --��ȡ�������б�	
opCodes.G2C_SHOW_LIST					        =	opCodes.GAME_MSG_SHOW_BEGIN + 2 --��ȡ�������б�
opCodes.C2G_SHOW_SAVE         				= opCodes.GAME_MSG_SHOW_BEGIN + 3 --���������
opCodes.G2C_SHOW_SAVE         				= opCodes.GAME_MSG_SHOW_BEGIN + 4 --���������
opCodes.C2G_WARDROBE_LIST							=	opCodes.GAME_MSG_SHOW_BEGIN + 5 --��ȡ�¹��б�
opCodes.G2C_WARDROBE_LIST							=	opCodes.GAME_MSG_SHOW_BEGIN + 6 --��ȡ�¹��б�
opCodes.G2C_SHOWITEM_LOAD_SHOP				=	opCodes.GAME_MSG_SHOW_BEGIN + 7 --��ȡ��Ʒ�б�
opCodes.C2G_SHOWITEM_LOAD_SHOP				=	opCodes.GAME_MSG_SHOW_BEGIN + 8 --��ȡ��Ʒ�б�
opCodes.C2G_SHOW_BUY									=	opCodes.GAME_MSG_SHOW_BEGIN + 9 --������Ʒ
opCodes.G2C_SHOW_BUY							    =	opCodes.GAME_MSG_SHOW_BEGIN + 10 --������Ʒ
opCodes.C2G_SHOW_GIFT							    =	opCodes.GAME_MSG_SHOW_BEGIN + 11 --����
opCodes.G2C_SHOW_GIFT									=	opCodes.GAME_MSG_SHOW_BEGIN + 12 --����

--house
opCodes.C2G_ENTER_HOUSE               = opCodes.GAME_MSG_HOUSE_BEGIN + 1  --�鿴��Ҽ�԰��Ϣ,role_id,index
opCodes.G2C_HOUSE_INFO                = opCodes.GAME_MSG_HOUSE_BEGIN + 2  --���ؼ�԰��Ϣ
opCodes.C2G_HOUSE_NAME                = opCodes.GAME_MSG_HOUSE_BEGIN + 3  --��԰����
opCodes.C2G_USE_FURNITURE             = opCodes.GAME_MSG_HOUSE_BEGIN + 4  --ʹ�ü�԰�Ҿ�:��԰id,�Ҿ�entry,����args
opCodes.C2G_CHANGE_FURNITURE          = opCodes.GAME_MSG_HOUSE_BEGIN + 5  --�ڷżҾ�
opCodes.C2G_DEL_FURNITURE             = opCodes.GAME_MSG_HOUSE_BEGIN + 6  --ɾ���Ҿ�
opCodes.C2G_HOUSE_LIST                = opCodes.GAME_MSG_HOUSE_BEGIN + 7  --���������԰��Ϣ     
opCodes.G2C_HOUSE_LIST                = opCodes.GAME_MSG_HOUSE_BEGIN + 8  --���������԰�б�
opCodes.G2C_COOL_DOWN_INFO            = opCodes.GAME_MSG_HOUSE_BEGIN + 9  --���ؼҾ���ȴ��Ϣ

--��־
opCodes.C2G_APPLY_HOMEPAGE            = opCodes.GAME_MSG_HOUSE_BEGIN + 10 --�鿴�Լ���־��ҳ
opCodes.G2C_APPLY_HOMEPAGE            = opCodes.GAME_MSG_HOUSE_BEGIN + 11 --������ҳ��Ϣ������3���֣�����3��
opCodes.C2G_DIARY_LIST                = opCodes.GAME_MSG_HOUSE_BEGIN + 12 --�鿴�����־�б�:role_id(uint)
opCodes.G2C_DIARY_LIST                = opCodes.GAME_MSG_HOUSE_BEGIN + 13 --���������־�б�:count,{id,title,time}
opCodes.C2G_NEW_DIARY                 = opCodes.GAME_MSG_HOUSE_BEGIN + 14 --��������־:title,text
opCodes.C2G_UPDATE_DIARY              = opCodes.GAME_MSG_HOUSE_BEGIN + 15 --�޸���־:title,text
opCodes.C2G_DELETE_DIARY              = opCodes.GAME_MSG_HOUSE_BEGIN + 16 --ɾ����־:��־id
opCodes.C2G_APPLY_DIARY               = opCodes.GAME_MSG_HOUSE_BEGIN + 17 --�鿴��־����:��־id
opCodes.G2C_APPLY_DIARY               = opCodes.GAME_MSG_HOUSE_BEGIN + 18 --������־����:��־id��title,time,text,count,{role_id,role_name,type,time,txt,comment_id}
opCodes.C2G_COMMENT_DIARY             = opCodes.GAME_MSG_HOUSE_BEGIN + 19 --������־:��־id,��������
opCodes.C2G_DELETE_COMMENT            = opCodes.GAME_MSG_HOUSE_BEGIN + 20 --ɾ������:����id
opCodes.C2G_REPLY_COMMENT             = opCodes.GAME_MSG_HOUSE_BEGIN + 21 --�ظ�����:����id���ظ�����

--��ְ
opCodes.C2G_APPLY_VIRTUE     					= opCodes.GAME_MSG_OFFICE_BEGIN + 1  --�鿴���˵�����Ϣ
opCodes.G2C_APPLY_VIRTUE     					= opCodes.GAME_MSG_OFFICE_BEGIN + 2  --���ظ��˵�����Ϣ
opCodes.C2G_DONATE_MONEY     					= opCodes.GAME_MSG_OFFICE_BEGIN + 3  --��Ǯ
opCodes.G2C_DONATE_MONEY     					= opCodes.GAME_MSG_OFFICE_BEGIN + 4  --���ؾ�Ǯ���
opCodes.C2G_DONATE_ITEM     					= opCodes.GAME_MSG_OFFICE_BEGIN + 5  --����
opCodes.G2C_DONATE_ITEM     					= opCodes.GAME_MSG_OFFICE_BEGIN + 6  --���ؾ�����
opCodes.C2G_DONATE_ITEM_LIST     			= opCodes.GAME_MSG_OFFICE_BEGIN + 7  --�����б�
opCodes.G2C_DONATE_ITEM_LIST    			= opCodes.GAME_MSG_OFFICE_BEGIN + 8  --���ؾ���
opCodes.C2G_VIRTUE_RANK    						= opCodes.GAME_MSG_OFFICE_BEGIN + 9  --��������
opCodes.G2C_VIRTUE_RANK    						= opCodes.GAME_MSG_OFFICE_BEGIN + 10  --���ص�������
opCodes.C2G_APPLY_VOTE    						= opCodes.GAME_MSG_OFFICE_BEGIN + 11  --�鿴����ѡƱ��Ϣ
opCodes.G2C_APPLY_VOTE    						= opCodes.GAME_MSG_OFFICE_BEGIN + 12  --���ظ���ѡƱ��Ϣ
opCodes.C2G_VOTE_PRICE    						= opCodes.GAME_MSG_OFFICE_BEGIN + 13  --����ѡƱ������
opCodes.G2C_VOTE_PRICE    						= opCodes.GAME_MSG_OFFICE_BEGIN + 14  --����ѡƱ���������ý��
opCodes.C2G_VOTE_MONEY    						= opCodes.GAME_MSG_OFFICE_BEGIN + 15  --����ѡƱ������
opCodes.G2C_VOTE_MONEY    						= opCodes.GAME_MSG_OFFICE_BEGIN + 16  --����ѡƱ���������ý��
opCodes.C2G_VOTE_RANK    							= opCodes.GAME_MSG_OFFICE_BEGIN + 17  --ѡƱ����
opCodes.G2C_VOTE_RANK    							= opCodes.GAME_MSG_OFFICE_BEGIN + 18  --����ѡƱ����
opCodes.C2G_APPLY_FLAG    						= opCodes.GAME_MSG_OFFICE_BEGIN + 19  --��������
opCodes.G2C_APPLY_FLAG    						= opCodes.GAME_MSG_OFFICE_BEGIN + 20  --�����������Ľ��
opCodes.C2G_SET_FLAG    							= opCodes.GAME_MSG_OFFICE_BEGIN + 21  --��������
opCodes.G2C_SET_FLAG    							= opCodes.GAME_MSG_OFFICE_BEGIN + 22  --�����������Ľ��
opCodes.C2G_REMOVE_FLAG    						= opCodes.GAME_MSG_OFFICE_BEGIN + 23  --�������
opCodes.G2C_REMOVE_FLAG    						= opCodes.GAME_MSG_OFFICE_BEGIN + 24  --���ز�����Ľ��
opCodes.C2G_VOTE_SET    							= opCodes.GAME_MSG_OFFICE_BEGIN + 25  --������ѡƱ����
opCodes.G2C_VOTE_SET    							= opCodes.GAME_MSG_OFFICE_BEGIN + 26  --���ؽ��
opCodes.C2G_VOTE_SELECT    						= opCodes.GAME_MSG_OFFICE_BEGIN + 27  --��ͶƱ����
opCodes.G2C_VOTE_SELECT    						= opCodes.GAME_MSG_OFFICE_BEGIN + 28  --���ش򿪽��
opCodes.C2G_VOTE_GETBACK    					= opCodes.GAME_MSG_OFFICE_BEGIN + 29  --�˻�ѡ�ٽ�
opCodes.G2C_VOTE_GETBACK    					= opCodes.GAME_MSG_OFFICE_BEGIN + 30  --�����˻����
opCodes.C2G_VOTE_ELECT    						= opCodes.GAME_MSG_OFFICE_BEGIN + 31  --ͶƱ
opCodes.G2C_VOTE_ELECT    						= opCodes.GAME_MSG_OFFICE_BEGIN + 32  --����ͶƱ
opCodes.C2G_VOTE_FLAG    							= opCodes.GAME_MSG_OFFICE_BEGIN + 33  --ͶƱ������
opCodes.G2C_VOTE_FLAG    							= opCodes.GAME_MSG_OFFICE_BEGIN + 34  --����ͶƱ������
opCodes.C2G_APPLY_MONEY_LEFT					= opCodes.GAME_MSG_OFFICE_BEGIN + 35  --��ѯʣ��ѡ�ٽ�
opCodes.G2C_APPLY_MONEY_LEFT					= opCodes.GAME_MSG_OFFICE_BEGIN + 36  --����ʣ��ѡ�ٽ�

--��̨
opCodes.C2G_LEITAI_ENTER              = opCodes.GAME_MSG_LEITAI_BEGIN + 1 --����
opCodes.C2G_LEITAI_LEAVE              = opCodes.GAME_MSG_LEITAI_BEGIN + 2 --�뿪
opCodes.C2G_LEITAI_PK                 = opCodes.GAME_MSG_LEITAI_BEGIN + 3 --����pk
opCodes.C2G_LEITAI_TEAM_LIST          = opCodes.GAME_MSG_LEITAI_BEGIN + 4 --������̨��
opCodes.G2C_LEITAI_TEAM_LIST          = opCodes.GAME_MSG_LEITAI_BEGIN + 5 --������̨��
opCodes.C2G_LEITAI_AUTO_PK            = opCodes.GAME_MSG_LEITAI_BEGIN + 6 --�Զ�ƥ��
opCodes.G2C_LEITAI_INFO               = opCodes.GAME_MSG_LEITAI_BEGIN + 7 --״̬����

--������ϯ����
opCodes.C2G_MENPAIDIZI_APPLY          = opCodes.GAME_MSG_MENPAIDIZI_BEGIN + 1 --����
opCodes.C2G_MENPAIDIZI_LEAVE          = opCodes.GAME_MSG_MENPAIDIZI_BEGIN + 2 --�뿪
opCodes.C2G_MENPAIDIZI_CHANGE         = opCodes.GAME_MSG_MENPAIDIZI_BEGIN + 3 --�ı�����
opCodes.G2C_MENPAIDIZI_ROOM_INFO      = opCodes.GAME_MSG_MENPAIDIZI_BEGIN + 4 --
opCodes.C2G_MENPAIDIZI_GET_RANK       = opCodes.GAME_MSG_MENPAIDIZI_BEGIN + 5 --������Ϣ
opCodes.G2C_MENPAIDIZI_GET_RANK       = opCodes.GAME_MSG_MENPAIDIZI_BEGIN + 6 --������Ϣ
opCodes.G2C_MENPAIDIZI_SET_CLOCK      = opCodes.GAME_MSG_MENPAIDIZI_BEGIN + 7 --����ʱ
opCodes.C2G_MENPAIDIZI_RANK           = opCodes.GAME_MSG_MENPAIDIZI_BEGIN + 8 --������Ϣ
opCodes.G2C_MENPAIDIZI_RANK           = opCodes.GAME_MSG_MENPAIDIZI_BEGIN + 9 --������Ϣ
opCodes.C2G_MENPAIDIZI_PRIZE          = opCodes.GAME_MSG_MENPAIDIZI_BEGIN + 10--��ȡ����

-- global
opCodes.G2C_GLOBAL_SERVERLEVEL		  = opCodes.GAME_MSG_GLOBAL_BEGIN + 1 -- ���������ȼ���Ϣ

--�ɾ�ϵͳ
opCodes.C2G_ROLE_A_GROUP			  = opCodes.GAME_MSG_ACHIEVEMENT_BEGIN + 1 --����ɾ���Ϣ
opCodes.G2C_ROLE_A_GROUP	    	  = opCodes.GAME_MSG_ACHIEVEMENT_BEGIN + 2 --���ͳɾ���Ϣ

opCodes.G2C_ROLE_A_GROUP_SHOP_INFO	  = opCodes.GAME_MSG_ACHIEVEMENT_BEGIN + 3 --���ͳɾ��̵���Ϣ
opCodes.C2G_ROLE_A_GROUP_SHOP_INFO	  = opCodes.GAME_MSG_ACHIEVEMENT_BEGIN + 4 --����ɾ��̵���Ϣ
opCodes.C2G_ROLE_A_GROUP_R_SHOP_INFO  = opCodes.GAME_MSG_ACHIEVEMENT_BEGIN + 5 --����ˢ�³ɾ��̵�

opCodes.C2G_ROLE_A_GROUP_BUY_SHOP     = opCodes.GAME_MSG_ACHIEVEMENT_BEGIN + 6 --����ɾ��̵�
opCodes.G2C_ROLE_A_GROUP_BUY_SHOP     = opCodes.GAME_MSG_ACHIEVEMENT_BEGIN + 7 --���سɾ��̵�

opCodes.G2C_ROLE_A_GROUP_SET          = opCodes.GAME_MSG_ACHIEVEMENT_BEGIN + 8 --�ɾ��̵��ռ���Ʒ
opCodes.G2C_ROLE_A_GROUP_SET_SINGLE   = opCodes.GAME_MSG_ACHIEVEMENT_BEGIN + 9 --�ɾ��̵��ռ���Ʒ(����)


