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
	
	GAME_MSG_ARENA_BEGIN       = 5800, 						--竞技场
	GAME_MSG_ARENA_COUNT       = 6000,
	
	GAME_MSG_GATE_BEGIN        = 6000,                      --关卡
	GAME_MSG_GATE_COUNT        = 6200,
	
	GAME_MSG_BOSS_BEGIN        = 6200,                      --BOSS战
	GAME_MSG_BOSS_COUNT        = 6400, 
	
	GAME_MSG_FESTIVAL_BEGIN    = 6400,                      --节日活动
	GAME_MSG_FESTIVAL_COUNT    = 6600,
	
	GAME_MSG_MAZE_BEGIN        = 6600,                      --迷宫活动 
	GAME_MSG_MAZE_COUNT        = 6800,
	
	GAME_MSG_ACHIEVEMENT_BEGIN = 6800,                      --成就系统
	GAME_MSG_ACHIEVEMENT_COUNT = 7000,
	
	GAME_MSG_GLOBAL_BEGIN	   = 9000,
	GAME_MSG_GLOBAL_COUNT	   = 9500,
	GAME_MSG_COUNT             = 10000,
}

--登录
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

--主角
opCodes.G2C_HERO_INFO         = opCodes.GAME_MSG_ROLE_BEGIN + 1   -- 英雄角色信息
opCodes.C2G_MAP_ENTER         = opCodes.GAME_MSG_ROLE_BEGIN + 2   -- 进入地图
opCodes.G2C_MAP_ENTER         = opCodes.GAME_MSG_ROLE_BEGIN + 3   -- 跳转地图
opCodes.C2G_MOVE              = opCodes.GAME_MSG_ROLE_BEGIN + 4   -- 移动
opCodes.G2C_MOVE              = opCodes.GAME_MSG_ROLE_BEGIN + 5   -- 移动数据
opCodes.G2C_OBJECT_CHANGE     = opCodes.GAME_MSG_ROLE_BEGIN + 6   -- 对象外形变化
opCodes.G2C_OBJECT_ADD        = opCodes.GAME_MSG_ROLE_BEGIN + 7   -- 对象出现
opCodes.G2C_OBJECT_REMOVE     = opCodes.GAME_MSG_ROLE_BEGIN + 8   -- 对象消失
opCodes.G2C_OBJECT_UPDATE     = opCodes.GAME_MSG_ROLE_BEGIN + 9   -- 对象属性更新

opCodes.C2G_ROLE_MOONUP         = opCodes.GAME_MSG_ROLE_BEGIN + 10  -- 皓月升级
opCodes.C2G_ROLE_HERO_LEAVE     = opCodes.GAME_MSG_ROLE_BEGIN + 11  -- 武将离队
opCodes.C2G_ROLE_HERO_CALL      = opCodes.GAME_MSG_ROLE_BEGIN + 12  -- 武将召回
opCodes.C2G_ROLE_HERO_RECRUIT   = opCodes.GAME_MSG_ROLE_BEGIN + 13  -- 武将招募
opCodes.C2G_ROLE_EXCHANGE_RUNE  = opCodes.GAME_MSG_ROLE_BEGIN + 14  -- 虎符兑换
opCodes.C2G_ROLE_SET_LINEUP     = opCodes.GAME_MSG_ROLE_BEGIN + 15  -- 设置阵型
opCodes.C2G_ROLE_SET_DOWN       = opCodes.GAME_MSG_ROLE_BEGIN + 16  -- 打坐
opCodes.C2G_ROLE_SELECT_LINEUP  = opCodes.GAME_MSG_ROLE_BEGIN + 17  -- 选择阵型
opCodes.C2G_ROLE_UPGRADE_LINEUP = opCodes.GAME_MSG_ROLE_BEGIN + 18  -- 阵型升级
opCodes.C2G_ROLE_OPEN_LINEUP    = opCodes.GAME_MSG_ROLE_BEGIN + 19  -- 开启新阵型
opCodes.G2C_ROLE_RUNE_UPDATE	= opCodes.GAME_MSG_ROLE_BEGIN + 23  -- 虎符更新
opCodes.G2C_ROLE_EXCHANGE_RUNE	= opCodes.GAME_MSG_ROLE_BEGIN + 24  -- 虎符兑换结果返回
opCodes.G2C_ROLE_LINEUP_CHANGE  = opCodes.GAME_MSG_ROLE_BEGIN + 25  -- 阵型变化

opCodes.C2G_ROLE_GET_GINGER 	= opCodes.GAME_MSG_ROLE_BEGIN + 26  -- 更新精力点，客户端24:00询问服务器
opCodes.C2G_ROLE_APPLY_GINGER	= opCodes.GAME_MSG_ROLE_BEGIN + 27  -- 申请高效精力点
opCodes.C2G_ROLE_SUIT_CHANGE	= opCodes.GAME_MSG_ROLE_BEGIN + 28  -- 角色换装
opCodes.G2C_ROLE_SUIT_UPDATE	= opCodes.GAME_MSG_ROLE_BEGIN + 29	-- 角色着装列表更新
opCodes.C2G_ROLE_PRACTICE       = opCodes.GAME_MSG_ROLE_BEGIN + 30	-- 修为修炼方向

opCodes.C2G_ROLE_LINEUP_INFO    = opCodes.GAME_MSG_ROLE_BEGIN + 31  -- 查询玩家阵法信息 
opCodes.G2C_ROLE_LINEUP_INFO    = opCodes.GAME_MSG_ROLE_BEGIN + 32  -- 返回玩家阵法信息

opCodes.C2G_ROLE_FIRST_LOGIN	=	opCodes.GAME_MSG_ROLE_BEGIN + 34	-- 角色梦镜后，发送任务及周围NPC
opCodes.C2G_ROLE_REFRESH_NPC	=	opCodes.GAME_MSG_ROLE_BEGIN + 35	-- 更新NPC

opCodes.C2G_ROLE_SETTING		=	opCodes.GAME_MSG_ROLE_BEGIN + 38	-- 个人设置

opCodes.C2G_ROLE_TITLES_NEXT  = opCodes.GAME_MSG_ROLE_BEGIN + 39	-- 获取已获得的称号列表。
opCodes.C2G_ROLE_TITLES_GET	  = opCodes.GAME_MSG_ROLE_BEGIN + 40  -- 客户端符合要求，要求获取称号(包含更新称号进度和相关的称号信息)
opCodes.G2C_ROLE_TITLES_NEW		= opCodes.GAME_MSG_ROLE_BEGIN + 41  -- 服务器发送新获取到的

opCodes.G2C_ROLE_HEALTH				= opCodes.GAME_MSG_ROLE_BEGIN + 42  -- 健康信息
opCodes.G2C_ROLE_TITLEINFO		= opCodes.GAME_MSG_ROLE_BEGIN + 43  -- 称号相关信息

opCodes.C2G_ROLE_RANK					=	opCodes.GAME_MSG_ROLE_BEGIN + 44  -- 请求排行信息
opCodes.G2C_ROLE_RANK					=	opCodes.GAME_MSG_ROLE_BEGIN + 45  -- 请求排行信息
opCodes.C2G_ROLE_RANK_PET			=	opCodes.GAME_MSG_ROLE_BEGIN + 46  -- 请求排行宠物信息
opCodes.G2C_ROLE_RANK_PET			=	opCodes.GAME_MSG_ROLE_BEGIN + 47  -- 请求排行宠物信息
opCodes.G2C_ROLE_RANK_REFRESH	=	opCodes.GAME_MSG_ROLE_BEGIN + 48	-- 排行更新

opCodes.C2G_ROLE_MACHINE_INFO = opCodes.GAME_MSG_ROLE_BEGIN + 50	-- 客户端机器码和MAC地址
opCodes.C2G_ROLE_CHANGE_NAME  = opCodes.GAME_MSG_ROLE_BEGIN + 51	-- 改名
opCodes.C2G_ROLE_GET_LOGOUTEXP= opCodes.GAME_MSG_ROLE_BEGIN + 52	-- 领取离线补偿
opCodes.C2G_ROLE_ADD_VIPEXP   = opCodes.GAME_MSG_ROLE_BEGIN + 53    --增加vip经验
opCodes.C2G_ROLE_BUY_POWER    = opCodes.GAME_MSG_ROLE_BEGIN + 54    --元宝购买体力
opCodes.C2G_ROLE_VIP_INFO     = opCodes.GAME_MSG_ROLE_BEGIN + 55    --请求VIP信息
opCodes.G2C_ROLE_VIP_INFO     = opCodes.GAME_MSG_ROLE_BEGIN + 56    --返回VIP信息
opCodes.C2G_ROLE_VIP_FIRST_PAY     = opCodes.GAME_MSG_ROLE_BEGIN + 57    --请求领取首充礼包
opCodes.G2C_ROLE_VIP_FIRST_PAY     = opCodes.GAME_MSG_ROLE_BEGIN + 58    --通知有首充礼包领取
opCodes.C2G_ROLE_FIRST_DAY_LOGIN_PRIZE     = opCodes.GAME_MSG_ROLE_BEGIN + 59    --请求每天首次登录礼包奖励
opCodes.G2C_ROLE_FIRST_DAY_LOGIN_PRIZE     = opCodes.GAME_MSG_ROLE_BEGIN + 60    --发送每天首次登录礼包奖励机构

opCodes.C2G_ROLE_CHECK        = opCodes.GAME_MSG_ROLE_BEGIN + 61  -- 角色检查
opCodes.G2C_ROLE_SETDOWN_EXP         = opCodes.GAME_MSG_ROLE_BEGIN + 62 -- 角色打坐经验通知
opCodes.G2C_ROLE_OFFLINE_SETDOWN_EXP = opCodes.GAME_MSG_ROLE_BEGIN + 63 -- 角色离线打坐经验通知

opCodes.C2G_ROLE_ONLINE_PRIZE				 = opCodes.GAME_MSG_ROLE_BEGIN + 64 -- 领取在线奖励
opCodes.G2C_ROLE_ONLINE_PRIZE				 = opCodes.GAME_MSG_ROLE_BEGIN + 65 -- 领取在线奖励结果
opCodes.C2G_ROLE_LEVEL_PRIZE				 = opCodes.GAME_MSG_ROLE_BEGIN + 66 -- 领取等级礼包
opCodes.G2C_ROLE_LEVEL_PRIZE				 = opCodes.GAME_MSG_ROLE_BEGIN + 67 -- 领取等级礼包结果
opCodes.G2C_ROLE_TEMP_PRIZE				 	 = opCodes.GAME_MSG_ROLE_BEGIN + 68 -- 有临时礼包
opCodes.C2G_ROLE_TEMP_PRIZE				 	 = opCodes.GAME_MSG_ROLE_BEGIN + 69 -- 领临时礼包奖励

opCodes.C2G_ROLE_BUY_FIGHT_CREDIT		=	opCodes.GAME_MSG_ROLE_BEGIN + 70 -- 购买战功
opCodes.G2C_ROLE_MIDNIGHT						=	opCodes.GAME_MSG_ROLE_BEGIN + 71 -- 12点刷新

--opCodes.C2G_ROLE_HERO_GROUP				=	opCodes.GAME_MSG_ROLE_BEGIN + 72 --请求将星录信息
--opCodes.G2C_ROLE_HERO_GROUP				=	opCodes.GAME_MSG_ROLE_BEGIN + 73 --发送将星录信息
opCodes.G2C_ROLE_START_TIME				=	opCodes.GAME_MSG_ROLE_BEGIN + 74 --发送开服时间
opCodes.C2G_ROLE_HERO_RECRUIT_SCORE		=	opCodes.GAME_MSG_ROLE_BEGIN + 75 --武将招募(竞技场积分)

opCodes.G2C_ADD_CURRENCY                =	opCodes.GAME_MSG_ROLE_BEGIN + 76 --充值多少元宝
opCodes.C2G_CLIENT_ERROR_INFO			= 	opCodes.GAME_MSG_ROLE_BEGIN + 77 --客户端错误信息
opCodes.C2G_OTHER_PLAYER_VISIBLE		= 	opCodes.GAME_MSG_ROLE_BEGIN + 78 --其他玩家是否可见

opCodes.C2G_ROLE_CRAZY_BOX			    = opCodes.GAME_MSG_ROLE_BEGIN + 79 --请求领取神秘宝箱
opCodes.G2C_ROLE_CRAZY_BOX			    = opCodes.GAME_MSG_ROLE_BEGIN + 80 --通知有神秘宝箱领取

opCodes.C2G_ROLE_CARD3DAY			    = 	opCodes.GAME_MSG_ROLE_BEGIN + 81 --请求抽卡
opCodes.G2C_ROLE_CARD3DAY			    = 	opCodes.GAME_MSG_ROLE_BEGIN + 82 --发送抽卡信息
opCodes.C2G_ROLE_CARD3DAY_OPEN	        = 	opCodes.GAME_MSG_ROLE_BEGIN + 83 --打开抽卡界面请求的数据        

opCodes.G2C_ROLE_RECHARGE_PRIZE_TIME= opCodes.GAME_MSG_ROLE_BEGIN + 84 --充值回馈活动的时间
opCodes.C2G_ROLE_APPRAISE					=	opCodes.GAME_MSG_ROLE_BEGIN + 85 --评价
opCodes.G2C_ROLE_APPRAISE					=	opCodes.GAME_MSG_ROLE_BEGIN + 86 --提醒评价
opCodes.G2C_ROLE_APPRAISE_STAR		=	opCodes.GAME_MSG_ROLE_BEGIN + 87 --评价数

opCodes.C2G_APPLE_NOTICE					= opCodes.GAME_MSG_ROLE_BEGIN + 88 --苹果正式版通知
opCodes.G2C_APPLE_NOTICE          = opCodes.GAME_MSG_ROLE_BEGIN + 89 --苹果正式版通知返回

opCodes.C2G_ROLE_CARD3DAY_RECORD  = opCodes.GAME_MSG_ROLE_BEGIN + 90 --请求中奖记录
opCodes.G2C_ROLE_CARD3DAY_RECORD  = opCodes.GAME_MSG_ROLE_BEGIN + 91 --返回中奖记录

opCodes.G2C_ROLE_INVITE_INFO			= opCodes.GAME_MSG_ROLE_BEGIN + 92 --邀请信息

opCodes.C2G_ROLE_CURRENCY_3000_PRIZE     = opCodes.GAME_MSG_ROLE_BEGIN + 93    --请求领取连续登录送3000元宝奖励
opCodes.G2C_ROLE_CURRENCY_3000_PRIZE     = opCodes.GAME_MSG_ROLE_BEGIN + 94    --发送连续登录送3000元宝奖励结构

opCodes.G2C_ROLE_BIND_PHONE	=	opCodes.GAME_MSG_ROLE_BEGIN + 95
opCodes.C2G_ROLE_BIND_PHONE	=	opCodes.GAME_MSG_ROLE_BEGIN + 96

opCodes.G2C_EXPEDITION_HORN_GIFT_INFO = opCodes.GAME_MSG_ROLE_BEGIN + 97 --发送号角信息到客户端
opCodes.C2G_GET_EXPEDITION_HORN_GIFT = opCodes.GAME_MSG_ROLE_BEGIN + 98 --领取远征号角奖励

opCodes.C2G_INVITE_CODE	=	 opCodes.GAME_MSG_ROLE_BEGIN + 99 --
opCodes.G2C_INVITE_CODE	=	 opCodes.GAME_MSG_ROLE_BEGIN + 100 --
opCodes.C2G_INVITE_FRIEND	=	opCodes.GAME_MSG_ROLE_BEGIN + 101 --
opCodes.G2C_INVITE_FRIEND	=	opCodes.GAME_MSG_ROLE_BEGIN + 102 --

--遗迹探宝全服玩法
opCodes.C2G_RUINS_DISCOVERY_INFO = opCodes.GAME_MSG_ROLE_BEGIN + 103 --请求遗迹探宝界面信息
opCodes.G2C_RUINS_DISCOVERY_INFO = opCodes.GAME_MSG_ROLE_BEGIN + 104 
opCodes.C2G_RUINS_DISCOVERY_PRIZE_RECORD = opCodes.GAME_MSG_ROLE_BEGIN + 105 --请求遗迹探宝中奖纪录
opCodes.G2C_RUINS_DISCOVERY_PRIZE_RECORD = opCodes.GAME_MSG_ROLE_BEGIN + 106 
opCodes.C2G_RUINS_DISCOVERY_STARTUP = opCodes.GAME_MSG_ROLE_BEGIN + 107 --开启魔法罩
opCodes.G2C_RUINS_DISCOVERY_PRIZE = opCodes.GAME_MSG_ROLE_BEGIN + 108 --奖品信息

--遗迹探宝个人玩法
opCodes.C2G_RUINS_DISCOVERY_INFO_EX = opCodes.GAME_MSG_ROLE_BEGIN + 109 --请求遗迹探宝界面信息
opCodes.G2C_RUINS_DISCOVERY_INFO_EX = opCodes.GAME_MSG_ROLE_BEGIN + 110 
opCodes.C2G_RUINS_DISCOVERY_STARTUP_EX = opCodes.GAME_MSG_ROLE_BEGIN + 111 --开启魔法罩
opCodes.G2C_RUINS_DISCOVERY_PRIZE_EX = opCodes.GAME_MSG_ROLE_BEGIN + 112 --奖品信息

--魂符系统
opCodes.C2G_SOUL_AUGURY		    = opCodes.GAME_MSG_SOUL_BEGIN + 1  --占卜
opCodes.G2C_SOUL_AUGURY         = opCodes.GAME_MSG_SOUL_BEGIN + 2  --占卜结果
opCodes.C2G_SOUL_COMPUTE        = opCodes.GAME_MSG_SOUL_BEGIN + 3  --神算
opCodes.G2C_SOUL_COMPUTE        = opCodes.GAME_MSG_SOUL_BEGIN + 4  --神算结果
opCodes.C2G_SOUL_ONE_AUGURY     = opCodes.GAME_MSG_SOUL_BEGIN + 5  --一键占卜
opCodes.G2C_SOUL_ONE_AUGURY     = opCodes.GAME_MSG_SOUL_BEGIN + 6  --返回一键占卜的背包信息
opCodes.G2C_SOUL_ADD            = opCodes.GAME_MSG_SOUL_BEGIN + 7  --增加一个魂符
opCodes.C2G_SOUL_ONE_EAT        = opCodes.GAME_MSG_SOUL_BEGIN + 8  --请求一键吞噬
opCodes.G2C_SOUL_ONE_EAT        = opCodes.GAME_MSG_SOUL_BEGIN + 9  --返回一键吞噬结果
opCodes.C2G_SOUL_EQUPT_OPEN 	= opCodes.GAME_MSG_SOUL_BEGIN + 10 --请求打开装备魂符
opCodes.G2C_SOUL_EQUPT_OPEN 	= opCodes.GAME_MSG_SOUL_BEGIN + 11 --返回打开装备魂符结果
opCodes.C2G_SOUL_OPEN 			= opCodes.GAME_MSG_SOUL_BEGIN + 12 --请求魂符界面信息
opCodes.G2C_SOUL_OPEN 			= opCodes.GAME_MSG_SOUL_BEGIN + 13 --返回魂符界面信息
opCodes.C2G_SOUL_BUY            = opCodes.GAME_MSG_SOUL_BEGIN + 14 --请求购买魂符
opCodes.C2G_SOUL_EXPAND         = opCodes.GAME_MSG_SOUL_BEGIN + 15 --请求扩展魂符背包
opCodes.G2C_SOUL_EXPAND         = opCodes.GAME_MSG_SOUL_BEGIN + 16 --返回扩展魂符背包
opCodes.C2G_SOUL_MOVE           = opCodes.GAME_MSG_SOUL_BEGIN + 17 --魂符移动
opCodes.G2C_SOUL_MOVE           = opCodes.GAME_MSG_SOUL_BEGIN + 18 --返回魂符移动结果
opCodes.G2C_SOUL_BUY            = opCodes.GAME_MSG_SOUL_BEGIN + 19 --返回请求购买魂符结果
opCodes.C2G_SOUL_COMPUTE_TEN    = opCodes.GAME_MSG_SOUL_BEGIN + 20  --十次神算
opCodes.C2G_SOULMONEY_GET	    = opCodes.GAME_MSG_SOUL_BEGIN + 21  --客户端请求灵符数量
opCodes.G2C_SOULMONEY_GET	    = opCodes.GAME_MSG_SOUL_BEGIN + 22  --服务器返回灵符数量

--武将
opCodes.G2C_HERO_LIST           = opCodes.GAME_MSG_HERO_BEGIN + 1 --发送武将列表
opCodes.G2C_HERO_UPDATE         = opCodes.GAME_MSG_HERO_BEGIN + 2 --武将属性更新
opCodes.G2C_HERO_ADD            = opCodes.GAME_MSG_HERO_BEGIN + 3 --增加一个武将
opCodes.G2C_HERO_WAREHOUSE_LIST = opCodes.GAME_MSG_HERO_BEGIN + 4 --发送战场上的武将
opCodes.G2C_ROLE_HERO_LEAVE     = opCodes.GAME_MSG_HERO_BEGIN + 5 --武将离队返回
opCodes.G2C_ROLE_HERO_CALL		= opCodes.GAME_MSG_HERO_BEGIN + 6 --武将召回返回

opCodes.C2G_HERO_TALENT_UP		=	opCodes.GAME_MSG_HERO_BEGIN + 11 --武将资质
opCodes.G2C_HERO_TALENT_UP		=	opCodes.GAME_MSG_HERO_BEGIN + 12 --武将资质
opCodes.C2G_HERO_TALENT_TRANS	=	opCodes.GAME_MSG_HERO_BEGIN + 13 --武将资质转换

opCodes.C2G_HERO_STAR_TFR       = opCodes.GAME_MSG_HERO_BEGIN + 16 --武将星阶转移
opCodes.G2C_HERO_STAR_TFR       = opCodes.GAME_MSG_HERO_BEGIN + 17 --武将星阶转移返回
opCodes.C2G_HERO_STAR_UP        = opCodes.GAME_MSG_HERO_BEGIN + 18 --武将星阶提升
opCodes.G2C_HERO_STAR_UP        = opCodes.GAME_MSG_HERO_BEGIN + 19 --武将星阶提升返回 
opCodes.C2G_HERO_GATE_ENTER			=	opCodes.GAME_MSG_HERO_BEGIN + 22 --进入神秘英雄副本
opCodes.G2C_HERO_TOKEN_INFO			=	opCodes.GAME_MSG_HERO_BEGIN + 23 --英雄征召令数据
opCodes.C2G_HERO_BUY_HONOR			=	opCodes.GAME_MSG_HERO_BEGIN + 24 --荣誉兑换声望


--竞技场 
opCodes.C2G_ARENA_OPEN			= opCodes.GAME_MSG_ARENA_BEGIN + 1  --打开竞技场界面
opCodes.G2C_ARENA_OPEN          = opCodes.GAME_MSG_ARENA_BEGIN + 2  --打开竞技场界面返回信息 
opCodes.C2G_ARENA_COMBAT        = opCodes.GAME_MSG_ARENA_BEGIN + 3  --请求竞技
opCodes.G2C_ARENA_COMBAT        = opCodes.GAME_MSG_ARENA_BEGIN + 4  --竞技战斗反馈[主要是给一些奖励]
opCodes.C2G_ARENA_PLAYER_INFO   = opCodes.GAME_MSG_ARENA_BEGIN + 5  --请求详细信息
opCodes.G2C_ARENA_PLAYER_INFO   = opCodes.GAME_MSG_ARENA_BEGIN + 6  --返回详细信息
opCodes.C2G_ARENA_OPEN_KO       = opCodes.GAME_MSG_ARENA_BEGIN + 7  --打开英雄榜
opCodes.G2C_ARENA_OPEN_RANK     = opCodes.GAME_MSG_ARENA_BEGIN + 8  --排行榜返回信息
opCodes.G2C_ARENA_OPEN_SERIES   = opCodes.GAME_MSG_ARENA_BEGIN + 9  --连胜榜返回信息
opCodes.C2G_ARENA_BUY           = opCodes.GAME_MSG_ARENA_BEGIN + 10 --购买竞技次数
opCodes.G2C_ARENA_BUY           = opCodes.GAME_MSG_ARENA_BEGIN + 11 --购买竞技次数反馈
opCodes.C2G_ARENA_CLEAR_CD      = opCodes.GAME_MSG_ARENA_BEGIN + 12 --清除竞技CD
opCodes.G2C_ARENA_CLEAR_CD      = opCodes.GAME_MSG_ARENA_BEGIN + 13 --清楚竞技CD反馈 
opCodes.C2G_ARENA_NEAR          = opCodes.GAME_MSG_ARENA_BEGIN + 14 -->200排名的角色获得附近最弱对手
opCodes.G2C_ARENA_NEAR          = opCodes.GAME_MSG_ARENA_BEGIN + 15 -->200排名的角色获得附近最弱对手返回
opCodes.C2G_ARENA_PRIZE_LIST	= opCodes.GAME_MSG_ARENA_BEGIN + 16 --请求竞技场奖励列表
opCodes.G2C_ARENA_PRIZE_LIST    = opCodes.GAME_MSG_ARENA_BEGIN + 17 --返回竞技场奖励列表
opCodes.C2G_ARENA_PRIZE         = opCodes.GAME_MSG_ARENA_BEGIN + 18 --领取竞技场奖励
opCodes.C2G_ARENA_ITEM_LIST		= opCodes.GAME_MSG_ARENA_BEGIN + 19 --请求竞技场物品列表
opCodes.G2C_ARENA_ITEM_LIST     = opCodes.GAME_MSG_ARENA_BEGIN + 20 --返回竞技场物品列表
opCodes.C2G_ARENA_ITEM_BUY      = opCodes.GAME_MSG_ARENA_BEGIN + 21 --购买竞技场物品

--战场 
opCodes.C2G_ARENA_SEG_OPEN			= opCodes.GAME_MSG_ARENA_BEGIN + 50  --打开战场
opCodes.G2C_ARENA_SEG_OPEN          = opCodes.GAME_MSG_ARENA_BEGIN + 51  --打开战场界面返回信息
opCodes.C2G_ARENA_SEG_REFRESH	    = opCodes.GAME_MSG_ARENA_BEGIN + 52  --刷新战场信息
opCodes.C2G_ARENA_SEG_CLEAR_CD	    = opCodes.GAME_MSG_ARENA_BEGIN + 53  --清楚冷却时间
opCodes.C2G_ARENA_SEG_PUT_HOLE      = opCodes.GAME_MSG_ARENA_BEGIN + 54  --清楚冷却时间
opCodes.C2G_ARENA_SEG_COMBAT        = opCodes.GAME_MSG_ARENA_BEGIN + 55  --请求战斗
opCodes.G2C_ARENA_SEG_COMBAT        = opCodes.GAME_MSG_ARENA_BEGIN + 56  --返回战斗结果战斗
opCodes.C2G_ARENA_SEG_COMBAT_MONSTER= opCodes.GAME_MSG_ARENA_BEGIN + 57  --请求战斗
opCodes.C2G_ARENA_SEG_BUY	        = opCodes.GAME_MSG_ARENA_BEGIN + 58  --购买挑战次数
opCodes.G2C_ARENA_SEG_STATE	        = opCodes.GAME_MSG_ARENA_BEGIN + 59  --战场状态位

opCodes.C2G_ARENA_SEG_OUT_IN_HONOR  = opCodes.GAME_MSG_ARENA_BEGIN + 60  --战场声望转换


--关卡
opCodes.G2C_GATE_INFO           = opCodes.GAME_MSG_GATE_BEGIN + 1   --关卡和精英副本的初始化信息
opCodes.C2G_GATE_MONUP_REWARD   = opCodes.GAME_MSG_GATE_BEGIN + 2   --领取扫荡奖励
opCodes.G2C_GATE_PASS_PRIZE     = opCodes.GAME_MSG_GATE_BEGIN + 3   --通关奖励通知(所有经验，物品，铜钱，星辰)
opCodes.C2G_GATE_START_GATE     = opCodes.GAME_MSG_GATE_BEGIN + 4   --开始关卡扫荡
opCodes.C2G_GATE_START_COPY     = opCodes.GAME_MSG_GATE_BEGIN + 5   --开始精英副本扫荡
opCodes.C2G_GATE_RESET          = opCodes.GAME_MSG_GATE_BEGIN + 6   --重置精英副本
opCodes.G2C_GATE_REBISH         = opCodes.GAME_MSG_GATE_BEGIN + 7   --刷新精英副本
opCodes.C2G_GATE_OVER_MONUP     = opCodes.GAME_MSG_GATE_BEGIN + 8   --取消扫荡
opCodes.G2C_GATE_MONUP_RESULT   = opCodes.GAME_MSG_GATE_BEGIN + 9   --扫荡一场战斗结束的通知
opCodes.G2C_GATE_PROCESS        = opCodes.GAME_MSG_GATE_BEGIN + 10  --通知客户端关卡或者精英副本开启
opCodes.C2G_GATE_ONCE_MORE      = opCodes.GAME_MSG_GATE_BEGIN + 11  --再打一次
opCodes.C2G_GATE_MONUP_RUSH     = opCodes.GAME_MSG_GATE_BEGIN + 12  --加速扫荡
opCodes.C2G_GATE_START_ACTIVITY = opCodes.GAME_MSG_GATE_BEGIN + 13  --开始铜雀春色扫荡
opCodes.C2G_GATE_GOOD_PRIZE     = opCodes.GAME_MSG_GATE_BEGIN + 14  --领取超神通关奖励
opCodes.G2C_GATE_GOOD_PRIZE     = opCodes.GAME_MSG_GATE_BEGIN + 15  --领取超神通关反馈
opCodes.C2G_GATE_STAR_PRIZE     = opCodes.GAME_MSG_GATE_BEGIN + 16  --领取星辰奖励
opCodes.G2C_GATE_STAR_PRIZE     = opCodes.GAME_MSG_GATE_BEGIN + 17  --领取星辰奖励反馈


--世界BOSS
opCodes.C2G_BOSS_ENTER          = opCodes.GAME_MSG_BOSS_BEGIN + 1   --玩家开始参加BOSS战
opCodes.G2C_BOSS_RANK           = opCodes.GAME_MSG_BOSS_BEGIN + 2   --更新伤害排行榜
opCodes.C2G_BOSS_INSPIRE        = opCodes.GAME_MSG_BOSS_BEGIN + 3   --使用战意鼓舞
opCodes.C2G_BOSS_SET_SPWAN      = opCodes.GAME_MSG_BOSS_BEGIN + 4   --BOSS战设置自动复活
opCodes.C2G_BOSS_COMBAT         = opCodes.GAME_MSG_BOSS_BEGIN + 5   --开始和BOSS战斗
opCodes.G2C_BOSS_START          = opCodes.GAME_MSG_BOSS_BEGIN + 6   --世界boss活动开始
opCodes.G2C_BOSS_MAP_INFO       = opCodes.GAME_MSG_BOSS_BEGIN + 7   --世界boss场景的信息
opCodes.G2C_BOSS_DAMAGE_RANK    = opCodes.GAME_MSG_BOSS_BEGIN + 8   --伤害排行
opCodes.G2C_BOSS_PRIZE          = opCodes.GAME_MSG_BOSS_BEGIN + 9   --世界boss奖励
opCodes.G2C_BOSS_HP_CHANGE      = opCodes.GAME_MSG_BOSS_BEGIN + 10  --boss血量改变通知
opCodes.G2C_BOSS_END            = opCodes.GAME_MSG_BOSS_BEGIN + 11  --世界boss活动结束
opCodes.C2G_BOSS_OPEN_UI        = opCodes.GAME_MSG_BOSS_BEGIN + 12  --打开世界bossUI
opCodes.G2C_BOSS_OPEN_UI		= opCodes.GAME_MSG_BOSS_BEGIN + 13  --打开UI返回信息
opCodes.C2G_BOSS_LEAVE          = opCodes.GAME_MSG_BOSS_BEGIN + 14  --离开boss地图
opCodes.G2C_BOSS_COMBAT_END     = opCodes.GAME_MSG_BOSS_BEGIN + 15  --一场boss战斗结束
opCodes.G2C_BOSS_INSPIRE        = opCodes.GAME_MSG_BOSS_BEGIN + 16  --使用战役鼓舞返回
opCodes.G2C_BOSS_SET_SPWAN      = opCodes.GAME_MSG_BOSS_BEGIN + 17  --设置自动复活返回
opCodes.C2G_BOSS_SPWAN          = opCodes.GAME_MSG_BOSS_BEGIN + 18  --元宝复活
opCodes.G2C_BOSS_SUBSTITUTE     = opCodes.GAME_MSG_BOSS_BEGIN + 19	--替身
opCodes.C2G_BOSS_SUBSTITUTE     = opCodes.GAME_MSG_BOSS_BEGIN + 20	--替身
opCodes.G2C_BOSS_ENTER          = opCodes.GAME_MSG_BOSS_BEGIN + 21  --返回玩家开始参加BOSS战状态信息
opCodes.G2C_BOSS_COUNT          = opCodes.GAME_MSG_BOSS_BEGIN + 22  --返回复活次数
opCodes.C2G_BOSS_MONSTER        = opCodes.GAME_MSG_BOSS_BEGIN + 23  --玩家挑战世界BOSS小怪

--pet
opCodes.G2C_PET_LIST            = opCodes.GAME_MSG_PET_BEGIN + 1  -- 发送宠物列表信息
opCodes.C2G_PET_FIGHT           = opCodes.GAME_MSG_PET_BEGIN + 2  -- 设置参战
opCodes.C2G_PET_FREE            = opCodes.GAME_MSG_PET_BEGIN + 3  -- 设置放生
opCodes.C2G_PET_FOLLOW          = opCodes.GAME_MSG_PET_BEGIN + 4  -- 设置跟随
opCodes.C2G_PET_BINDROLE        = opCodes.GAME_MSG_PET_BEGIN + 5  -- 设置专有
opCodes.C2G_PET_USEITEM         = opCodes.GAME_MSG_PET_BEGIN + 6  -- 使用物品
opCodes.C2G_PET_EQUIP           = opCodes.GAME_MSG_PET_BEGIN + 7  -- 使用装备
opCodes.C2G_PET_NEWNAME         = opCodes.GAME_MSG_PET_BEGIN + 8  -- 改名
opCodes.C2G_PET_POTENTIAL       = opCodes.GAME_MSG_PET_BEGIN + 9  -- 分配潜力点
opCodes.G2C_PET_UPDATE          = opCodes.GAME_MSG_PET_BEGIN + 10 -- 对象属性更新
opCodes.C2G_PET_ADD             = opCodes.GAME_MSG_PET_BEGIN + 11 -- 加入一只宠物
opCodes.G2C_PET_ADD             = opCodes.GAME_MSG_PET_BEGIN + 12 -- 加宠物
opCodes.G2C_PET_FREE            = opCodes.GAME_MSG_PET_BEGIN + 13 -- 放生一只宠物
opCodes.C2G_PET_UNBIND          = opCodes.GAME_MSG_PET_BEGIN + 14 -- 解除绑定
opCodes.C2G_PET_CHILD           = opCodes.GAME_MSG_PET_BEGIN + 15 -- 宠物还童
opCodes.C2G_PET_TALENT_CARD     = opCodes.GAME_MSG_PET_BEGIN + 16 -- 资质卡炼化
opCodes.C2G_PET_FIX_TALENT_CARD = opCodes.GAME_MSG_PET_BEGIN + 17 -- 宠物资质炼化
opCodes.C2G_PET_SKILL_CARD      = opCodes.GAME_MSG_PET_BEGIN + 18 -- 秘技卡炼化
opCodes.C2G_PET_FIX_SKILL_CARD  = opCodes.GAME_MSG_PET_BEGIN + 19 -- 宠物秘技炼化
opCodes.C2G_PET_TRAINING        = opCodes.GAME_MSG_PET_BEGIN + 20 -- 宠物修炼
opCodes.C2G_PET_COMPOUND        = opCodes.GAME_MSG_PET_BEGIN + 21 -- 宠物合成
opCodes.C2G_PET_ADVANCE         = opCodes.GAME_MSG_PET_BEGIN + 22 -- 宠物进阶
opCodes.C2G_PET_STRENGTHEN      = opCodes.GAME_MSG_PET_BEGIN + 23 -- 宠物强化
opCodes.C2G_PET_SOUL_CARD       = opCodes.GAME_MSG_PET_BEGIN + 24 -- 宠物化魂
opCodes.C2G_PET_FIX_SOUL_CARD   = opCodes.GAME_MSG_PET_BEGIN + 25 -- 附魂
opCodes.C2G_PET_CANCEL_UNBIND   = opCodes.GAME_MSG_PET_BEGIN + 26 -- 取消宠物解绑
opCodes.C2G_PET_SUREUNBIND      = opCodes.GAME_MSG_PET_BEGIN + 27 -- 确认解绑
opCodes.G2C_PET_SOUL_ABILITY    = opCodes.GAME_MSG_PET_BEGIN + 28 -- 附魂属性
opCodes.C2G_PET_EXP_CARD        = opCodes.GAME_MSG_PET_BEGIN + 29 -- 化丹
opCodes.C2G_PET_DICTIONARY      = opCodes.GAME_MSG_PET_BEGIN + 30 -- 图鉴登陆
opCodes.G2C_PET_DICTIONARY_UPDATE    = opCodes.GAME_MSG_PET_BEGIN + 31 -- 图鉴更新
opCodes.C2G_PET_MAKE_APPEAR_ITEM     = opCodes.GAME_MSG_PET_BEGIN + 32 -- 制作变身药水
opCodes.C2G_PET_HOLY_UPGRADE         = opCodes.GAME_MSG_PET_BEGIN + 33 -- 神兽进修
opCodes.C2G_PET_HOLY_UPGRADE_NEED    = opCodes.GAME_MSG_PET_BEGIN + 34 -- 请求神兽进修
opCodes.G2C_PET_HOLY_UPGRADE_NEED    = opCodes.GAME_MSG_PET_BEGIN + 35 -- 返回神兽进修
opCodes.G2C_PET_UPDATE_JINGQI        = opCodes.GAME_MSG_PET_BEGIN + 36 -- 更新精气值
opCodes.C2G_PET_TO_JINGQI            = opCodes.GAME_MSG_PET_BEGIN + 37 -- 给予宠物换精气
opCodes.C2G_PET_REMOVE_SKILL         = opCodes.GAME_MSG_PET_BEGIN + 38 -- 宠物洗技能
opCodes.C2G_PET_FENG_YIN             = opCodes.GAME_MSG_PET_BEGIN + 39 -- 宠物封印
opCodes.C2G_PET_UN_FENG_YIN          = opCodes.GAME_MSG_PET_BEGIN + 40 -- 宠物解除封印
opCodes.C2G_PET_SKILL_COMBIN         = opCodes.GAME_MSG_PET_BEGIN + 41 -- 宠物技能合成

--fight
--opCodes.C2G_FIGHT_MONSTER           = opCodes.GAME_MSG_FIGHT_BEGIN + 1 --触发明雷怪战斗
opCodes.C2G_FIGHT_SKILL             = opCodes.GAME_MSG_FIGHT_BEGIN + 2 --设置战斗指令
opCodes.C2G_FIGHT_AUTO              = opCodes.GAME_MSG_FIGHT_BEGIN + 3 --设置，取消自动战斗
opCodes.G2C_FIGHT_AUTO              = opCodes.GAME_MSG_FIGHT_BEGIN + 4 --设置
opCodes.G2C_FIGHT_QTE_TYPE          = opCodes.GAME_MSG_FIGHT_BEGIN + 5 --触发了哪类型的QTE
opCodes.C2G_FIGHT_QTE               = opCodes.GAME_MSG_FIGHT_BEGIN + 6 --设置QTE效果

opCodes.C2G_FIGHT_ESCAPE            = opCodes.GAME_MSG_FIGHT_BEGIN + 7 --撤离

opCodes.C2G_FIGHT_HS_SKILL					=	opCodes.GAME_MSG_FIGHT_BEGIN + 8 --英雄无敌技能
opCodes.G2C_FIGHT_HS_SKILL					=	opCodes.GAME_MSG_FIGHT_BEGIN + 9 --英雄无敌技能
opCodes.C2G_FIGHT_HS_REVIVE					=	opCodes.GAME_MSG_FIGHT_BEGIN + 10 --英雄无敌复活
opCodes.G2C_FIGHT_HS_REVIVE					=	opCodes.GAME_MSG_FIGHT_BEGIN + 11 --英雄无敌复活

opCodes.G2C_FIGHT_UPDATE_CD                 = opCodes.GAME_MSG_FIGHT_BEGIN + 12 --每回合开始的时候刷新CD

opCodes.C2G_FIGHT_INTERCHANGE               = opCodes.GAME_MSG_FIGHT_BEGIN + 13 --玩家发起切磋 
opCodes.G2C_FIGHT_INTERCHANGE               = opCodes.GAME_MSG_FIGHT_BEGIN + 14 --通知玩家有切磋请求
opCodes.C2G_FIGHT_ACK_INTERCHANGE           = opCodes.GAME_MSG_FIGHT_BEGIN + 15 --确认切磋
opCodes.G2C_FIGHT_INTERCHANGE_RESULT        = opCodes.GAME_MSG_FIGHT_BEGIN + 16 --切磋结果通知


opCodes.C2G_FIGHT_MONSTER           = opCodes.GAME_MSG_FIGHT_BEGIN + 20 --触发明雷怪战斗
opCodes.C2G_FIGHT_TEST     			= opCodes.GAME_MSG_FIGHT_BEGIN + 20  -- 触发战斗
opCodes.G2C_FIGHT_BEGIN    			= opCodes.GAME_MSG_FIGHT_BEGIN + 21  -- 战斗开始
opCodes.G2C_FIGHT_ADD      			= opCodes.GAME_MSG_FIGHT_BEGIN + 24  -- 战斗成员
opCodes.G2C_FIGHT_BOUT     			= opCodes.GAME_MSG_FIGHT_BEGIN + 25  -- 回合开始
opCodes.C2G_FIGHT_CMD      			= opCodes.GAME_MSG_FIGHT_BEGIN + 26  -- 战斗指令
opCodes.G2C_FIGHT_RESULT   			= opCodes.GAME_MSG_FIGHT_BEGIN + 27  -- 战斗结果
opCodes.C2G_FIGHT_DRAWDONE 			= opCodes.GAME_MSG_FIGHT_BEGIN + 28  -- 回合结束客户端反馈
opCodes.G2C_FIGHT_END      			= opCodes.GAME_MSG_FIGHT_BEGIN + 29  -- 战斗结束
opCodes.G2C_FIGHT_REBEGIN  			= opCodes.GAME_MSG_FIGHT_BEGIN + 30  -- 战斗重连
opCodes.C2G_FIGHT_FPK      			= opCodes.GAME_MSG_FIGHT_BEGIN + 31 -- 强制pk战
opCodes.G2C_FIGHT_STATUS   			= opCodes.GAME_MSG_FIGHT_BEGIN + 32 -- 战斗状态
opCodes.C2G_FIGHT_PK			 	= opCodes.GAME_MSG_FIGHT_BEGIN + 33 -- pk请求
opCodes.G2C_FIGHT_PK_REQUEST 		= opCodes.GAME_MSG_FIGHT_BEGIN + 34 -- 收到别人的pk请求
opCodes.C2G_FIGHT_PK_ACCEPT			= opCodes.GAME_MSG_FIGHT_BEGIN + 35 -- 同意pk请求
opCodes.C2G_FIGHT_PK_REJECT			= opCodes.GAME_MSG_FIGHT_BEGIN + 36 -- 拒绝pk请求
opCodes.G2C_FIGHT_PK_REJECT			= opCodes.GAME_MSG_FIGHT_BEGIN + 37 -- 拒绝pk请求
opCodes.G2C_FIGHT_REMOVE				=	opCodes.GAME_MSG_FIGHT_BEGIN + 38 -- 减少战斗成员
opCodes.G2C_FIGHT_FPK						=	opCodes.GAME_MSG_FIGHT_BEGIN + 39 -- 收到别人的强制PK
opCodes.C2G_FIGHT_FPK_START			=	opCodes.GAME_MSG_FIGHT_BEGIN + 40 -- 强制PK开始
opCodes.C2G_FIGHT_DIRECT				=	opCodes.GAME_MSG_FIGHT_BEGIN + 41	-- 指挥
opCodes.G2C_FIGHT_DIRECT				= opCodes.GAME_MSG_FIGHT_BEGIN + 42 -- 
opCodes.C2G_FIGHT_DIRECT_DEL		=	opCodes.GAME_MSG_FIGHT_BEGIN + 43	-- 取消指挥
opCodes.G2C_FIGHT_DIRECT_DEL		= opCodes.GAME_MSG_FIGHT_BEGIN + 44 -- 
opCodes.G2C_FIGHT_BOSS_ITEM			= opCodes.GAME_MSG_FIGHT_BEGIN + 45 -- 头目战选择宝箱
opCodes.C2G_FIGHT_BOSS_ITEM			= opCodes.GAME_MSG_FIGHT_BEGIN + 46 -- 
opCodes.C2G_FIGHT_BOSS					=	opCodes.GAME_MSG_FIGHT_BEGIN + 47 -- 挑战头目
opCodes.G2C_FIGHT_ITEM_SELECT 	= opCodes.GAME_MSG_FIGHT_BEGIN + 48 -- 宝箱被选择
opCodes.G2C_FIGHT_READY					=	opCodes.GAME_MSG_FIGHT_BEGIN + 48	-- 出手标志
opCodes.C2G_FIGHT_BOSS_DRAWDONE = opCodes.GAME_MSG_FIGHT_BEGIN + 49 -- 客户端开宝箱表演完毕
opCodes.G2C_FIGHT_BOSS_ITEM_GET = opCodes.GAME_MSG_FIGHT_BEGIN + 50 -- 有物品的宝箱编号
opCodes.C2G_FIGHT_NPC						= opCodes.GAME_MSG_FIGHT_BEGIN + 51 -- 明雷战斗
opCodes.C2G_FIGHT_WATCH					= opCodes.GAME_MSG_FIGHT_BEGIN + 52 -- 请求观战
opCodes.C2G_FIGHT_WATCH_DEL			= opCodes.GAME_MSG_FIGHT_BEGIN + 53 -- 请求退出战斗
opCodes.G2C_FIGHT_OB_BEGIN      = opCodes.GAME_MSG_FIGHT_BEGIN + 54 -- 进入观战
opCodes.C2G_FIGHT_FPK_BY_ID			=	opCodes.GAME_MSG_FIGHT_BEGIN + 55	-- 通过ID追捕
opCodes.C2G_FIGHT_FPK_BY_NAME		= opCodes.GAME_MSG_FIGHT_BEGIN + 56	-- 通过玩家名追捕
opCodes.C2G_FIGHT_BOSS_SERIAL   = opCodes.GAME_MSG_FIGHT_BEGIN + 57 -- 客户端请求头目系列信息
opCodes.G2C_FIGHT_BOSS_SERIAL   = opCodes.GAME_MSG_FIGHT_BEGIN + 58 -- 服务器返回头目系列信息
opCodes.G2C_FIGHT_BOSS_WAIT			= opCodes.GAME_MSG_FIGHT_BEGIN + 59 -- 等待下一场
opCodes.C2G_FIGHT_BOSS_RECORD		=	opCodes.GAME_MSG_FIGHT_BEGIN + 60	-- 查询头目通关记录
opCodes.G2C_FIGHT_BOSS_RECORD		=	opCodes.GAME_MSG_FIGHT_BEGIN + 61	-- 返回头目通关记录
opCodes.C2G_FIGHT_BOSS_VIEW			=	opCodes.GAME_MSG_FIGHT_BEGIN + 62 -- 观看头目通关记录
opCodes.G2C_FIGHT_BOSS_VIEW			=	opCodes.GAME_MSG_FIGHT_BEGIN + 63 -- 返回头目通关记录
opCodes.C2G_FIGHT_BOSS_VIEW_END	=	opCodes.GAME_MSG_FIGHT_BEGIN + 60 -- 结束观看头目通关记录
opCodes.G2C_FIGHT_BOSS_DIFFICULT= opCodes.GAME_MSG_FIGHT_BEGIN + 65 -- 难度解锁
opCodes.C2G_FIGHT_BOSS_COMBATS 	= opCodes.GAME_MSG_FIGHT_BEGIN + 66 -- 当前的头目战
opCodes.G2C_FIGHT_BOSS_COMBATS	=	opCodes.GAME_MSG_FIGHT_BEGIN + 67 -- 返回当前的头目战
opCodes.C2G_FIGHT_BOSS_OBSERVE	=	opCodes.GAME_MSG_FIGHT_BEGIN + 68 -- 头目战观战
opCodes.C2G_FIGHT_ESCAPE				=	opCodes.GAME_MSG_FIGHT_BEGIN + 69 -- 战斗中逃跑
opCodes.G2C_FIGHT_BOSS					=	opCodes.GAME_MSG_FIGHT_BEGIN + 70 -- 挑战头目
opCodes.C2G_FIGHT_BOSS_ACCEPT		=	opCodes.GAME_MSG_FIGHT_BEGIN + 71 -- 同意挑战BOSS
--]]

--task
opCodes.G2C_TASK_LIST					= opCodes.GAME_MSG_TASK_BENGN + 1	--任务列表
opCodes.G2C_TASK_NEW					=	opCodes.GAME_MSG_TASK_BENGN + 2	--可接任务列表
opCodes.G2C_TASK_UPDATE				=	opCodes.GAME_MSG_TASK_BENGN + 3	--任务更新
opCodes.C2G_TASK_APPLY				= opCodes.GAME_MSG_TASK_BENGN + 4	--请求任务
opCodes.C2G_TASK_COMMIT				=	opCodes.GAME_MSG_TASK_BENGN + 5 --提交任务
opCodes.C2G_TASK_CANCEL				= opCodes.GAME_MSG_TASK_BENGN + 6 --放弃任务
opCodes.G2C_TASK_ADD					=	opCodes.GAME_MSG_TASK_BENGN + 7 --接受任务
opCodes.G2C_TASK_SUCCEED			= opCodes.GAME_MSG_TASK_BENGN + 8 --任务完成
opCodes.G2C_TASK_REMOVE				= opCodes.GAME_MSG_TASK_BENGN + 9 --删除任务
opCodes.C2G_TASK_XUANSHANG		=	opCodes.GAME_MSG_TASK_BENGN + 10--打开悬赏面板
opCodes.G2C_TASK_XUANSHANG		=	opCodes.GAME_MSG_TASK_BENGN + 11--悬赏任务
opCodes.C2G_TASK_APPLY_XS			=	opCodes.GAME_MSG_TASK_BENGN + 12--申请悬赏任务
opCodes.C2G_TASK_REFRESH			=	opCodes.GAME_MSG_TASK_BENGN + 13--刷新悬赏任务
opCodes.C2G_TASK_XS_BOX				=	opCodes.GAME_MSG_TASK_BENGN + 14--悬赏任务宝箱
opCodes.G2C_TASK_DANQI_COUNT	=	opCodes.GAME_MSG_TASK_BENGN + 15--单骑任务次数
opCodes.G2C_TASK_XS_COUNT			=	opCodes.GAME_MSG_TASK_BENGN + 16--悬赏任务次数

-------------------------------------------item--begin-----------------------------------------------------
--初始日期:2013年1月6日
--修改日期:2013年1月6日
--作者:aq
--说明:修改版本
-----------------------------------------------------------------------------------------------------------
opCodes.G2C_ITEM_LIST             = opCodes.GAME_MSG_ITEM_BEGIN + 1  -- 物品列表
opCodes.G2C_ITEM_UPDATE           = opCodes.GAME_MSG_ITEM_BEGIN + 2  -- 物品更新
opCodes.G2C_ITEM_DROP             = opCodes.GAME_MSG_ITEM_BEGIN + 3  -- 物品丢弃
opCodes.C2G_ITEM_PILE             = opCodes.GAME_MSG_ITEM_BEGIN + 4  -- 物品堆叠
opCodes.C2G_ITEM_MOVE             = opCodes.GAME_MSG_ITEM_BEGIN + 5  -- 物品移动\替换
opCodes.C2G_ITEM_USE              = opCodes.GAME_MSG_ITEM_BEGIN	+ 6  -- 物品使用
opCodes.C2G_ITEM_SELL             = opCodes.GAME_MSG_ITEM_BEGIN	+ 7  -- 物品出售
opCodes.C2G_ITEM_BUY              = opCodes.GAME_MSG_ITEM_BEGIN + 8	 -- 买入物品
opCodes.C2G_ITEM_BUY_BACK         = opCodes.GAME_MSG_ITEM_BEGIN + 9  -- 购回卖给NPC的物品
opCodes.C2G_ITEM_PACKET_RESET	  =	opCodes.GAME_MSG_ITEM_BEGIN + 10 -- 背包整理
opCodes.C2G_ITEM_SELL_LIST        = opCodes.GAME_MSG_ITEM_BEGIN + 11 -- 物品买卖列表
opCodes.G2C_ITEM_SELL_LIST        = opCodes.GAME_MSG_ITEM_BEGIN + 12 -- 物品买卖列表
opCodes.G2C_ITEM_UPDATEBUYBACKLIST = opCodes.GAME_MSG_ITEM_BEGIN + 13 -- 发送删除物品列表给客户端

opCodes.C2G_ITEM_WAREHOUSE_ADD	  	=	opCodes.GAME_MSG_ITEM_BEGIN + 30 -- 仓库存入物品(id, pos)
opCodes.C2G_ITEM_WAREHOUSE_GET	  	=	opCodes.GAME_MSG_ITEM_BEGIN + 31 -- 仓库取出物品(id, pos)
opCodes.C2G_ITEM_WAREHOUSE_MOVE = opCodes.GAME_MSG_ITEM_BEGIN + 32 -- 仓库物品移动\替换(id, pos)
opCodes.C2G_ITEM_WAREHOUSE_PILE	  	=	opCodes.GAME_MSG_ITEM_BEGIN + 33 --仓库物品堆叠
opCodes.C2G_ITEM_WAREHOUSE_RESET  	=	opCodes.GAME_MSG_ITEM_BEGIN + 34 --仓库物品整理
opCodes.C2G_ITEM_ADDPACK  			=	opCodes.GAME_MSG_ITEM_BEGIN + 35 --背包/仓库添加格子

opCodes.C2G_ITEM_EQUIP_GETOFF     = opCodes.GAME_MSG_ITEM_BEGIN + 50 -- 脱下装备
opCodes.C2G_ITEM_EQUIP_STRENGTHEN = opCodes.GAME_MSG_ITEM_BEGIN + 51 -- 装备强化
opCodes.C2G_ITEM_EQUIP_EMBED      = opCodes.GAME_MSG_ITEM_BEGIN + 52 -- 装备镶嵌
opCodes.C2G_ITEM_EQUIP_LEVELUP    = opCodes.GAME_MSG_ITEM_BEGIN + 53 -- 装备晋级
opCodes.C2G_ITEM_STONE_COMPOUND   = opCodes.GAME_MSG_ITEM_BEGIN + 54 -- 宝石合成
opCodes.C2G_ITEM_EQUIP_TAKEOUT   = opCodes.GAME_MSG_ITEM_BEGIN + 55  -- 宝石拆下
opCodes.C2G_ITEM_EQUIP_ADDSOCKET   = opCodes.GAME_MSG_ITEM_BEGIN + 56  -- 装备开插槽
opCodes.C2G_ITEM_EQUIP_STONE_COMPOUND = opCodes.GAME_MSG_ITEM_BEGIN + 57  -- 装备上的宝石合成
opCodes.C2G_ITEM_BUY_EQUIP = opCodes.GAME_MSG_ITEM_BEGIN + 58 --购买并穿上装备

opCodes.C2G_ITEM_LOAD_SHOP		  = opCodes.GAME_MSG_ITEM_BEGIN + 61 --  请求商店商品列表
opCodes.G2C_ITEM_LOAD_SHOP		  = opCodes.GAME_MSG_ITEM_BEGIN + 62 --  返回商店商品列表
--opCodes.G2C_ITEM_CURRENCY		  	= opCodes.GAME_MSG_ITEM_BEGIN + 65 --  更新元宝
opCodes.G2C_ITEM_STUDY_RECIPELIST	  = opCodes.GAME_MSG_ITEM_BEGIN + 70 --  登录的时候发送已经学习配方列表
opCodes.G2C_ITEM_STUDY_RECIPE		  = opCodes.GAME_MSG_ITEM_BEGIN + 71 --  发送学习配方
--opCodes.C2G_ITEM_CURRENCY		  	= opCodes.GAME_MSG_ITEM_BEGIN + 93 -- 刷新元宝
opCodes.C2G_ITEM_LOAD_SHOP_EX		= opCodes.GAME_MSG_ITEM_BEGIN + 72 --  请求商店商品列表
opCodes.G2C_ITEM_LOAD_SHOP_EX		= opCodes.GAME_MSG_ITEM_BEGIN + 73 --  返回商店商品列表
opCodes.C2G_ITEM_BUY_EX 			= opCodes.GAME_MSG_ITEM_BEGIN + 74 --  买入折扣物品
opCodes.G2C_ITEM_SHOP_OPEN_CLOSE    = opCodes.GAME_MSG_ITEM_BEGIN + 75 --  通知客户端商店折扣活动时候开启


opCodes.C2G_ITEM_SUPERWEAPON_OPEN		  = opCodes.GAME_MSG_ITEM_BEGIN + 81 	--打开神兵界面
opCodes.G2C_ITEM_SUPERWEAPON_OPEN		  = opCodes.GAME_MSG_ITEM_BEGIN + 82 	--返回神兵界面请求
opCodes.C2G_ITEM_SUPERWEAPON_CASTING	  = opCodes.GAME_MSG_ITEM_BEGIN + 83 	--铸造神兵
opCodes.G2C_ITEM_SUPERWEAPON_CASTING	  = opCodes.GAME_MSG_ITEM_BEGIN + 84 	--返回铸造神兵请求
opCodes.C2G_ITEM_SUPERWEAPON_RESTORE	  = opCodes.GAME_MSG_ITEM_BEGIN + 85 	--还原神兵
opCodes.G2C_ITEM_SUPERWEAPON_RESTORE	  = opCodes.GAME_MSG_ITEM_BEGIN + 86 	--返回还原神兵请求
opCodes.C2G_ITEM_SUPERWEAPON_LEVELUP	  = opCodes.GAME_MSG_ITEM_BEGIN + 87 	--升级神兵
opCodes.G2C_ITEM_SUPERWEAPON_LEVELUP	  = opCodes.GAME_MSG_ITEM_BEGIN + 88 	--返回升级神兵请求
opCodes.C2G_ITEM_SUPERWEAPON_OPEN_SUB	  = opCodes.GAME_MSG_ITEM_BEGIN + 89 	--打开神兵子界面
opCodes.G2C_ITEM_SUPERWEAPON_OPEN_SUB	  = opCodes.GAME_MSG_ITEM_BEGIN + 90 	--返回神兵子界面请求
opCodes.C2G_ITEM_SUPERWEAPON_GETHEROSOUL  = opCodes.GAME_MSG_ITEM_BEGIN + 91 	--领取将魂
opCodes.G2C_ITEM_SUPERWEAPON_GETHEROSOUL  = opCodes.GAME_MSG_ITEM_BEGIN + 92 	--返回领取将魂请求
opCodes.C2G_ITEM_SUPERWEAPON_BUYHEROSOUL  = opCodes.GAME_MSG_ITEM_BEGIN + 93 	--购买将魂
opCodes.G2C_ITEM_SUPERWEAPON_BUYHEROSOUL  = opCodes.GAME_MSG_ITEM_BEGIN + 94 	--返回购买将魂请求
opCodes.C2G_ITEM_SUPERWEAPON_OPEN_HERO	  = opCodes.GAME_MSG_ITEM_BEGIN + 95 	--打开神兵武将界面
opCodes.G2C_ITEM_SUPERWEAPON_OPEN_HERO	  = opCodes.GAME_MSG_ITEM_BEGIN + 96 	--返回神兵武将界面请求

opCodes.C2G_ITEM_BLACK_NPC_SHOP_LOAD	  = opCodes.GAME_MSG_ITEM_BEGIN + 100 	--请求黑市商人商店信息
opCodes.G2C_ITEM_BLACK_NPC_SHOP_LOAD	  = opCodes.GAME_MSG_ITEM_BEGIN + 101 	--返回黑市商人商店信息
opCodes.C2G_ITEM_BLACK_NPC_SHOP_BUY	  	  = opCodes.GAME_MSG_ITEM_BEGIN + 102 	--购买黑市商人商店物品
opCodes.G2C_ITEM_BLACK_NPC_SHOP_SEND	  = opCodes.GAME_MSG_ITEM_BEGIN + 103 	--单个商店信息刷新

-------------------------------------------item--end-----------------------------------------------------
---------------------------------------------------------------------------------------------------------


--team
opCodes.C2G_TEAM_INVITE           = opCodes.GAME_MSG_TEAM_BEGIN + 1  -- 发送邀请组队
opCodes.G2C_TEAM_INVITE           = opCodes.GAME_MSG_TEAM_BEGIN + 2  -- 收到邀请组队
opCodes.C2G_TEAM_REPLY_INVITE     = opCodes.GAME_MSG_TEAM_BEGIN + 3  -- 接受/拒绝邀请
opCodes.C2G_TEAM_APPLY            = opCodes.GAME_MSG_TEAM_BEGIN + 4  -- 发送申请入队
opCodes.G2C_TEAM_APPLY            = opCodes.GAME_MSG_TEAM_BEGIN + 5  -- 收到申请入队
opCodes.C2G_TEAM_REPLY_APPLY      = opCodes.GAME_MSG_TEAM_BEGIN + 6  -- 接受/拒绝入队
opCodes.C2G_TEAM_CAPTAIN          = opCodes.GAME_MSG_TEAM_BEGIN + 7  -- 提升队长
opCodes.C2G_TEAM_KICK             = opCodes.GAME_MSG_TEAM_BEGIN + 8  -- 请离队伍
opCodes.C2G_TEAM_RANK             = opCodes.GAME_MSG_TEAM_BEGIN + 9  -- 更改队员位置
opCodes.C2G_TEAM_LEAVE            = opCodes.GAME_MSG_TEAM_BEGIN + 10 -- 退出队伍
opCodes.C2G_TEAM_DISBAND          = opCodes.GAME_MSG_TEAM_BEGIN + 11 -- 解散队伍
opCodes.C2G_TEAM_AWAY             = opCodes.GAME_MSG_TEAM_BEGIN + 12 -- 暂离
opCodes.C2G_TEAM_BACK             = opCodes.GAME_MSG_TEAM_BEGIN + 13 -- 归队
opCodes.C2G_TEAM_LINEUP_SET       = opCodes.GAME_MSG_TEAM_BEGIN + 14 -- 设置阵型
opCodes.C2G_TEAM_CLEAR_APPLY      = opCodes.GAME_MSG_TEAM_BEGIN + 15 -- 清空申请列表
opCodes.G2C_TEAM_CREATE           = opCodes.GAME_MSG_TEAM_BEGIN + 16 -- 创建队伍
opCodes.G2C_TEAM_ADD              = opCodes.GAME_MSG_TEAM_BEGIN + 17 -- 加入队员
opCodes.G2C_TEAM_AWAY             = opCodes.GAME_MSG_TEAM_BEGIN + 18 -- 暂离
opCodes.G2C_TEAM_BACK             = opCodes.GAME_MSG_TEAM_BEGIN + 19 -- 归队
opCodes.G2C_TEAM_LEAVE            = opCodes.GAME_MSG_TEAM_BEGIN + 20 -- 退出
opCodes.G2C_TEAM_DISBAND          = opCodes.GAME_MSG_TEAM_BEGIN + 21 -- 解散队伍
opCodes.G2C_TEAM_RANK             = opCodes.GAME_MSG_TEAM_BEGIN + 22 -- 更新队伍排序
opCodes.G2C_TEAM_CAPTAIN          = opCodes.GAME_MSG_TEAM_BEGIN + 23 -- 更换队长
opCodes.C2G_TEAM_CREATE           = opCodes.GAME_MSG_TEAM_BEGIN	+ 24 -- 创建队伍
opCodes.G2C_TEAM_UPDATE           = opCodes.GAME_MSG_TEAM_BEGIN + 26 -- 队伍更新信息
opCodes.G2C_TEAM_DISAPPEAR        = opCodes.GAME_MSG_TEAM_BEGIN + 27 -- 队伍消失信息
opCodes.G2C_TEAM_APPLY_LIST       = opCodes.GAME_MSG_TEAM_BEGIN + 28 -- 申请列表
opCodes.G2C_TEAM_LINEUP_SET       = opCodes.GAME_MSG_TEAM_BEGIN + 29 -- 队伍阵型改变
opCodes.G2C_TEAM_CAPTAIN_POS      = opCodes.GAME_MSG_TEAM_BEGIN + 30 -- 获取队长坐标
opCodes.C2G_TEAM_GET_HPMP         = opCodes.GAME_MSG_TEAM_BEGIN + 31 -- 获取队员气血值
opCodes.G2C_TEAM_GET_HPMP         = opCodes.GAME_MSG_TEAM_BEGIN + 32 -- 获取队员气血值
opCodes.G2C_TEAM_TEAMMATE_HPMP    = opCodes.GAME_MSG_TEAM_BEGIN + 33 -- 得到其他队员的气血值
opCodes.G2C_TEAM_TEAMMATE_MAPID   = opCodes.GAME_MSG_TEAM_BEGIN + 34 -- 更新队员mapId
opCodes.G2C_TEAM_TEAMMATE_POS     = opCodes.GAME_MSG_TEAM_BEGIN + 35 -- 更新队员位置
opCodes.C2G_TEAM_AUTO_MAKE        = opCodes.GAME_MSG_TEAM_BEGIN + 36 -- 自动组队
opCodes.C2G_TEAM_TEST             = opCodes.GAME_MSG_TEAM_BEGIN + 50 -- 测试按钮

-- channel 
opCodes.C2G_CHANNEL_SEND 			= opCodes.GAME_MSG_CHANNEL_BEGIN + 1	-- 发送频道消息
opCodes.G2C_CHANNEL_SEND 			= opCodes.GAME_MSG_CHANNEL_BEGIN + 2	-- 接收频道信息
opCodes.C2G_CHANNEL_PLAYER		=	opCodes.GAME_MSG_CHANNEL_BEGIN + 3	-- 接收频道信息
opCodes.G2C_CHANNEL_PLAYER		=	opCodes.GAME_MSG_CHANNEL_BEGIN + 4	-- 接收频道信息
opCodes.G2C_CHANNEL_SYSTEM		=	opCodes.GAME_MSG_CHANNEL_BEGIN + 5	-- 系统公告
opCodes.G2C_CHANNEL_CLIENT		=	opCodes.GAME_MSG_CHANNEL_BEGIN + 6	-- 客服信息

--skill
opCodes.G2C_SKILL_LEARN             = opCodes.GAME_MSG_SKILL_BEGIN + 1 --主角升级通知客户端学会了哪个技能
opCodes.C2G_SKILL_UPGRADE           = opCodes.GAME_MSG_SKILL_BEGIN + 2 --技能升级
opCodes.G2C_SKILL_UPGRADE           = opCodes.GAME_MSG_SKILL_BEGIN + 3 --技能升级返回
opCodes.G2C_UPDATE_LIVEBUFF         = opCodes.GAME_MSG_SKILL_BEGIN + 4 --更新生活buff
opCodes.G2C_REMOVE_LIVEBUFF         = opCodes.GAME_MSG_SKILL_BEGIN + 5 --移除生活buff



-------------------------------------------faction--begin-----------------------------------------------------
--初始日期:2013年1月6日
--修改日期:2013年1月6日
--作者:aq
--说明:修改版本
-----------------------------------------------------------------------------------------------------------
opCodes.C2G_FACTION_CREATE          = opCodes.GAME_MSG_FACTION_BEGIN + 1        --帮派创建
opCodes.C2G_FACTION_NOTICE_REFRESH  = opCodes.GAME_MSG_FACTION_BEGIN + 2        --刷新公告内容
opCodes.G2C_FACTION_NOTICE_REFRESH  = opCodes.GAME_MSG_FACTION_BEGIN + 3        --返回公告内容
opCodes.C2G_FACTION_INFO_REFRESH    = opCodes.GAME_MSG_FACTION_BEGIN + 4        --刷新帮派信息
opCodes.G2C_FACTION_INFO_REFRESH    = opCodes.GAME_MSG_FACTION_BEGIN + 5        --返回帮派信息
opCodes.C2G_FACTION_MEMBER_REFRESH  = opCodes.GAME_MSG_FACTION_BEGIN + 6        --刷新成员数据
opCodes.G2C_FACTION_MEMBER_REFRESH  = opCodes.GAME_MSG_FACTION_BEGIN + 7        --返回成员数据
opCodes.C2G_FACTION_INFO            = opCodes.GAME_MSG_FACTION_BEGIN + 8        --查询所有帮会信息
opCodes.G2C_FACTION_INFO            = opCodes.GAME_MSG_FACTION_BEGIN + 9        --返回所有帮会信息
opCodes.C2G_FACTION_SINGLE_INFO     = opCodes.GAME_MSG_FACTION_BEGIN + 10       --查询单个帮派的信息
opCodes.G2C_FACTION_SINGLE_INFO     = opCodes.GAME_MSG_FACTION_BEGIN + 11       --返回帮派的查询信息
opCodes.C2G_FACTION_LEAVE           = opCodes.GAME_MSG_FACTION_BEGIN + 12       --主动离开帮派
opCodes.C2G_FACTION_APPLY           = opCodes.GAME_MSG_FACTION_BEGIN + 13       --申请进入帮派
opCodes.C2G_FACTION_APPLY_INFO      = opCodes.GAME_MSG_FACTION_BEGIN+ 14        --请求申请列表
opCodes.G2C_FACTION_APPLY_INFO      = opCodes.GAME_MSG_FACTION_BEGIN+ 15        --返回申请列表
opCodes.C2G_FACTION_CHECK           = opCodes.GAME_MSG_FACTION_BEGIN + 16       --帮派审核申请
opCodes.G2C_FACTION_SELF_UPDATE     = opCodes.GAME_MSG_FACTION_BEGIN + 17       --自身帮派信息更新
opCodes.G2C_FACTION_UPDATE          = opCodes.GAME_MSG_FACTION_BEGIN + 18       --帮派信息更新
opCodes.C2G_FACTION_POST            = opCodes.GAME_MSG_FACTION_BEGIN + 19       --设置职位
opCodes.C2G_FACTION_FIRE            = opCodes.GAME_MSG_FACTION_BEGIN + 20       --请离帮派
opCodes.G2C_FACTION_FIRE            = opCodes.GAME_MSG_FACTION_BEGIN + 21       --请离成功返回
opCodes.C2G_FACTION_NOTE            = opCodes.GAME_MSG_FACTION_BEGIN + 22       --请求帮派记录
opCodes.G2C_FACTION_NOTE            = opCodes.GAME_MSG_FACTION_BEGIN + 23       --返回帮派记录
opCodes.C2G_FACTION_NOTICE          = opCodes.GAME_MSG_FACTION_BEGIN + 24       --修改公告内容
opCodes.G2C_FACTION_NOTICE          = opCodes.GAME_MSG_FACTION_BEGIN + 25       --刷新公告信息
opCodes.G2C_FACTION_DEL_APPLY       = opCodes.GAME_MSG_FACTION_BEGIN + 26       --删除申请信息
opCodes.G2C_FACTION_TIPS            = opCodes.GAME_MSG_FACTION_BEGIN + 27       --帮派频道提示信息
opCodes.G2C_FACTION_DESTROY_FACTION = opCodes.GAME_MSG_FACTION_BEGIN + 28       --解散帮派
opCodes.G2C_FACTION_SINGLE_MEMBER_REFRESH  = opCodes.GAME_MSG_FACTION_BEGIN + 29 --刷新单个成员数据
opCodes.C2G_FACTION_SINGLE_MEMBER_REFRESH  = opCodes.GAME_MSG_FACTION_BEGIN + 30 --返回单个成员数据
opCodes.C2G_FACTION_ME				= opCodes.GAME_MSG_FACTION_BEGIN + 31	   -- 请求验证是否在自己帮派
opCodes.G2C_FACTION_ME				= opCodes.GAME_MSG_FACTION_BEGIN + 32	   -- 返回验证是否在自己帮派
opCodes.C2G_FACTION_CHANGE_LOGO		=	opCodes.GAME_MSG_FACTION_BEGIN + 33	   -- 修改帮派标志
opCodes.C2G_FACTION_CLEAR_APPLY		=	opCodes.GAME_MSG_FACTION_BEGIN + 34	   -- 清空申请列表
opCodes.G2C_FACTION_CLEAR_APPLY		=	opCodes.GAME_MSG_FACTION_BEGIN + 35	   -- 返回清空申请列表
opCodes.C2G_FACTION_CHANGE_NAME		=	opCodes.GAME_MSG_FACTION_BEGIN + 36	   -- 改名
opCodes.C2G_FACTION_MEMBER_TASK     = opCodes.GAME_MSG_FACTION_BEGIN + 37      --获取成员完成帮派任务数量
opCodes.G2C_FACTION_MEMBER_TASK     = opCodes.GAME_MSG_FACTION_BEGIN + 38      --获取成员完成帮派任务数量
opCodes.C2G_FACTION_MONEY_TREE_WATER= opCodes.GAME_MSG_FACTION_BEGIN + 39      --灌溉摇钱树
opCodes.G2C_FACTION_MONEY_TREE_WATER= opCodes.GAME_MSG_FACTION_BEGIN + 40      --返回灌溉成功
opCodes.C2G_FACTION_MONEY_TREE_ROCK = opCodes.GAME_MSG_FACTION_BEGIN + 41      --摇钱树摇钱
opCodes.G2C_FACTION_MONEY_TREE_ROCK	= opCodes.GAME_MSG_FACTION_BEGIN + 42	   --通知客户端摇钱树可以摇钱了
opCodes.C2G_FACTION_NIMBUSNOTICE    = opCodes.GAME_MSG_FACTION_BEGIN + 43      --请求灵气值添加记录
opCodes.G2C_FACTION_NIMBUSNOTICE    = opCodes.GAME_MSG_FACTION_BEGIN + 44 	   --返回灵气值记录
opCodes.G2C_FACTION_MEMBER_DEL      = opCodes.GAME_MSG_FACTION_BEGIN+ 45       --成员退出，开除
opCodes.C2G_FACTION_TOGETHER_LIST   = opCodes.GAME_MSG_FACTION_BEGIN+ 46       --请求桃园聚义列表
opCodes.G2C_FACTION_TOGETHER_LIST   = opCodes.GAME_MSG_FACTION_BEGIN+ 47       --返回桃园聚义列表
opCodes.C2G_FACTION_TOGETHER_JOIN   = opCodes.GAME_MSG_FACTION_BEGIN+ 48       --请求加入桃园聚义
opCodes.G2C_FACTION_TOGETHER_SUCCESS= opCodes.GAME_MSG_FACTION_BEGIN+ 49       --桃园聚义成功
opCodes.C2G_FACTION_TOGETHER_CALL   = opCodes.GAME_MSG_FACTION_BEGIN+ 50       --桃园聚义全帮召唤
opCodes.G2C_FACTION_TOGETHER_CALL   = opCodes.GAME_MSG_FACTION_BEGIN+ 51       --通知全帮有桃园聚义召唤
opCodes.C2G_FACTION_RESET_NAME      = opCodes.GAME_MSG_FACTION_BEGIN+ 52       --修改帮派名字
opCodes.C2G_FACTION_FAST_INVATE		= opCodes.GAME_MSG_FACTION_BEGIN+ 53       --快速发送邀请信息      
opCodes.G2C_FACTION_INVATE_COUNT	= opCodes.GAME_MSG_FACTION_BEGIN+ 54		--快速邀请次数信息
-------------------------------------faction--end-------------------------------------------------------

-------------------------------------------compete--begin-----------------------------------------------
--初始日期:2013年3月1日
--修改日期:2013年4月2日
--作者:aq
--说明:修改版本
--------------------------------------------------------------------------------------------------------
opCodes.C2G_COMPETE_WAR_APPLY              = opCodes.GAME_MSG_COMPETE_BEGIN + 21 --报名
opCodes.C2G_COMPETE_WAR_APPLY_INFO         = opCodes.GAME_MSG_COMPETE_BEGIN + 22 --客户端请求报名信息
opCodes.G2C_COMPETE_WAR_APPLY_INFO         = opCodes.GAME_MSG_COMPETE_BEGIN + 23 --返回报名信息给客户端
opCodes.C2G_COMPETE_WAR_PLAYER_INFO		   = opCodes.GAME_MSG_COMPETE_BEGIN + 24 --请求帮战玩家信息 
opCodes.G2C_COMPETE_WAR_PLAYER_INFO		   = opCodes.GAME_MSG_COMPETE_BEGIN + 25 --返回帮战玩家信息
opCodes.C2G_COMPETE_WAR_FACTION_INFO       = opCodes.GAME_MSG_COMPETE_BEGIN + 26 --请求帮战帮派积分信息 
opCodes.G2C_COMPETE_WAR_FACTION_INFO       = opCodes.GAME_MSG_COMPETE_BEGIN + 27 --返回帮战帮派积分信息 
opCodes.C2G_COMPETE_WAR_ENTER              = opCodes.GAME_MSG_COMPETE_BEGIN + 28 --进场
opCodes.C2G_COMPETE_WAR_LEAVE              = opCodes.GAME_MSG_COMPETE_BEGIN + 29 --退场
opCodes.C2G_COMPETE_WAR_GET_PRIZE          = opCodes.GAME_MSG_COMPETE_BEGIN + 30 --领取奖励
opCodes.G2C_COMPETE_WAR_PRIZE_NOTICE       = opCodes.GAME_MSG_COMPETE_BEGIN + 31 --通知有奖励领取
opCodes.G2C_COMPETE_WAR_GET_PRIZE          = opCodes.GAME_MSG_COMPETE_BEGIN + 32 --返回帮战奖励信息

opCodes.G2C_COMPETE_WAR_APPLY_SUCCESS      = opCodes.GAME_MSG_COMPETE_BEGIN + 35 --报名成功
opCodes.G2C_COMPETE_WAR_STATE              = opCodes.GAME_MSG_COMPETE_BEGIN + 36 --帮战所处阶段返回
opCodes.G2C_COMPETE_WAR_BTN_STATE          = opCodes.GAME_MSG_COMPETE_BEGIN + 37 --帮战个人副本按钮状态

opCodes.G2C_COMPETE_WAR_PLAYER_SCORE       = opCodes.GAME_MSG_COMPETE_BEGIN + 38 --帮战个人每场战斗获得的积分

--帮战南蛮入侵
opCodes.C2G_FACTION_CITY_ENTER             = opCodes.GAME_MSG_COMPETE_BEGIN + 50 --南蛮入侵进场
opCodes.C2G_FACTION_CITY_LEAVE             = opCodes.GAME_MSG_COMPETE_BEGIN + 51 --南蛮入侵退场
opCodes.C2G_FACTION_CITY_NEIGHBOR_INFO     = opCodes.GAME_MSG_COMPETE_BEGIN + 52 --请求相邻帮派信息
opCodes.G2C_FACTION_CITY_NEIGHBOR_INFO     = opCodes.GAME_MSG_COMPETE_BEGIN + 53 --返回相邻帮派信息
opCodes.C2G_FACTION_CITY_GOTO_LIFE         = opCodes.GAME_MSG_COMPETE_BEGIN + 54 --入侵相邻的帮派
opCodes.C2G_FACTION_CITY_GOTO_MONSTER      = opCodes.GAME_MSG_COMPETE_BEGIN + 55 --传送到怪物地图
opCodes.C2G_FACTION_CITY_FIGHT_MONSTER     = opCodes.GAME_MSG_COMPETE_BEGIN + 56 --玩家向怪物发起战斗
opCodes.C2G_FACTION_CITY_FIGHT_PLAYER      = opCodes.GAME_MSG_COMPETE_BEGIN + 57 --玩家向玩家发起战斗
opCodes.G2C_FACTION_CITY_PRIZE             = opCodes.GAME_MSG_COMPETE_BEGIN + 58 --发送战斗标志
opCodes.G2C_FACTION_CITY_STATE             = opCodes.GAME_MSG_COMPETE_BEGIN + 59 --给客户端发送南蛮入侵主界面左边按钮状态
opCodes.C2G_FACTION_CITY_ADD_BUFF          = opCodes.GAME_MSG_COMPETE_BEGIN + 60 --请求南蛮入侵鼓舞
opCodes.C2G_FACTION_CITY_ADD_BUFF_ALL      = opCodes.GAME_MSG_COMPETE_BEGIN + 61 --请求南蛮入侵鼓舞(大鼓)
opCodes.G2C_FACTION_CITY_ADD_BUFF          = opCodes.GAME_MSG_COMPETE_BEGIN + 62 --返回南蛮入侵鼓舞
opCodes.C2G_FACTION_CITY_LIFE              = opCodes.GAME_MSG_COMPETE_BEGIN + 63 --5元宝立即复活
opCodes.C2G_FACTION_CITY_ENTER_LIFE        = opCodes.GAME_MSG_COMPETE_BEGIN + 64 --在别的帮派返回复活点
opCodes.G2C_FACTION_CITY_MAP_IN_OUT        = opCodes.GAME_MSG_COMPETE_BEGIN + 65 --控制客户端的界面
opCodes.G2C_FACTION_CITY_WAIT_TIME         = opCodes.GAME_MSG_COMPETE_BEGIN + 66 --复活时间

--marry
opCodes.C2G_MARRY_CREATE                = opCodes.GAME_MSG_MARRY_BEGIN + 1 --创建结婚
opCodes.G2C_MARRY_CREATE                = opCodes.GAME_MSG_MARRY_BEGIN + 2 --创建返回
opCodes.C2G_MARRY_CANCEL                = opCodes.GAME_MSG_MARRY_BEGIN + 3 --离婚
opCodes.G2C_MARRY_CANCEL                = opCodes.GAME_MSG_MARRY_BEGIN + 4 --离婚返回
opCodes.C2G_MARRY_SECTION               = opCodes.GAME_MSG_MARRY_BEGIN + 5 --通知服务器开始播放动画
opCodes.G2C_MARRY_LOGIN                 = opCodes.GAME_MSG_MARRY_BEGIN + 6 --通知老伴上线
opCodes.G2C_MARRY_LOGOUT                = opCodes.GAME_MSG_MARRY_BEGIN + 7 --通知老伴下线
opCodes.C2G_MARRY_SWEET                 = opCodes.GAME_MSG_MARRY_BEGIN + 8 --通知服务器掉糖果
opCodes.G2C_MARRY_INFO                  = opCodes.GAME_MSG_MARRY_BEGIN + 9 --玩家上线发送结婚信息
opCodes.C2G_MARRY_NORMAL_APPLY          = opCodes.GAME_MSG_MARRY_BEGIN + 10 --申请普通结婚
opCodes.C2G_MARRY_SPECIAL_APPLY         = opCodes.GAME_MSG_MARRY_BEGIN + 11 --申请豪华结婚
opCodes.G2C_MARRY_FIREWORKS             = opCodes.GAME_MSG_MARRY_BEGIN + 12 --播放烟花
opCodes.G2C_MARRY_WEDDING               = opCodes.GAME_MSG_MARRY_BEGIN + 13 --播放拜堂
opCodes.G2C_MARRY_UPDATE                = opCodes.GAME_MSG_MARRY_BEGIN + 14 --结婚状态更新
opCodes.C2G_MARRY_TRAVEL_INFO           = opCodes.GAME_MSG_MARRY_BEGIN + 15 --获取结婚游行信息
opCodes.G2C_MARRY_TRAVEL_INFO           = opCodes.GAME_MSG_MARRY_BEGIN + 16 --获取结婚游行信息

--friend
opCodes.C2G_APPLY_FRIEND_ADD            = opCodes.GAME_MSG_FRIEND_BEGIN + 1 --添加好友--
opCodes.G2C_APPLY_FRIEND_ADD            = opCodes.GAME_MSG_FRIEND_BEGIN + 2
opCodes.C2G_FRIEND_DEL                  = opCodes.GAME_MSG_FRIEND_BEGIN + 3 --删除好友
opCodes.G2C_FRIEND_DEL                  = opCodes.GAME_MSG_FRIEND_BEGIN + 4 
opCodes.C2G_FRIEND_LIST                 = opCodes.GAME_MSG_FRIEND_BEGIN + 5 --发送列表
opCodes.G2C_FRIEND_LIST                 = opCodes.GAME_MSG_FRIEND_BEGIN + 6
opCodes.C2G_NOTICE_FRIEND               = opCodes.GAME_MSG_FRIEND_BEGIN + 7 --通知对方是否要添加自己为好友
opCodes.G2C_NOTICE_FRIEND               = opCodes.GAME_MSG_FRIEND_BEGIN + 8

opCodes.C2G_ADD_FLOWER 	                = opCodes.GAME_MSG_FRIEND_BEGIN + 9 --给玩家赠送花朵
opCodes.G2C_ADD_FLOWER 	                = opCodes.GAME_MSG_FRIEND_BEGIN + 10 --赠送花朵给玩家的信息返回
opCodes.C2G_FLOWER_INFO					= opCodes.GAME_MSG_FRIEND_BEGIN + 11 --请求花朵信息
opCodes.G2C_FLOWER_INFO					= opCodes.GAME_MSG_FRIEND_BEGIN + 12 --返回花朵信息
opCodes.G2C_BROADCAST_FLOWER			= opCodes.GAME_MSG_FRIEND_BEGIN + 13 --全服在线广播花朵信息
opCodes.C2G_FRIEND_PLAYERLIST			= opCodes.GAME_MSG_FRIEND_BEGIN + 14 --请求附近玩家信息
opCodes.G2C_FRIEND_PLAYERLIST			= opCodes.GAME_MSG_FRIEND_BEGIN + 15 --返回附近玩家信息

--talk and IM
opCodes.C2G_PLAYER_TALK                 = opCodes.GAME_MSG_PLAYER_TALK_BEGIN + 1 --玩家之间聊天
opCodes.G2C_PLAYER_TALK                 = opCodes.GAME_MSG_PLAYER_TALK_BEGIN + 2 --聊天发送
opCodes.C2G_PLAYER_IM                   = opCodes.GAME_MSG_PLAYER_TALK_BEGIN + 3 --请求下线后的IM信息
opCodes.G2C_PLAYER_IM                   = opCodes.GAME_MSG_PLAYER_TALK_BEGIN + 4 --返回下线后的IM信息
opCodes.G2C_PLAYER_SYSTEM_MSG           = opCodes.GAME_MSG_PLAYER_TALK_BEGIN + 5 --发送系统消息
opCodes.G2C_IM_COUNT                    = opCodes.GAME_MSG_PLAYER_TALK_BEGIN + 6 --发送IM数量

--card
opCodes.C2G_PLAYER_SET_CARD             = opCodes.GAME_MSG_PLAYER_CARD_BEGIN + 1 --设置名片信息
opCodes.G2C_PLAYER_SET_CARD             = opCodes.GAME_MSG_PLAYER_CARD_BEGIN + 2 --设置返回
opCodes.C2G_PLAYER_GET_CARD             = opCodes.GAME_MSG_PLAYER_CARD_BEGIN + 3 --获取玩家名片信息
opCodes.G2C_PLAYER_GET_CARD             = opCodes.GAME_MSG_PLAYER_CARD_BEGIN + 4 --名片信息返回
opCodes.C2G_PLAYER_SET_CARD_LOG         = opCodes.GAME_MSG_PLAYER_CARD_BEGIN + 5 --打开名片设置界面
opCodes.G2C_PLAYER_SET_CARD_LOG         = opCodes.GAME_MSG_PLAYER_CARD_BEGIN + 6 --返回名片设置界面

--bi wu
opCodes.C2G_BIWU_APPLY                = opCodes.GAME_MSG_BIWU_BEGIN + 1 -- 参加比武大会
opCodes.C2G_BIWU_ENTER 				  = opCodes.GAME_MSG_BIWU_BEGIN + 2 -- 进入比武大会
opCodes.C2G_BIWU_LEAVE                = opCodes.GAME_MSG_BIWU_BEGIN + 3 -- 退出比武大会
opCodes.C2G_BIWU_GET_PRIZE            = opCodes.GAME_MSG_BIWU_BEGIN + 4 -- 领取奖励
opCodes.G2C_BIWU_GET_PRIZE            = opCodes.GAME_MSG_BIWU_BEGIN + 5 -- 返回奖励领取
opCodes.C2G_BIWU_GET_INFO             = opCodes.GAME_MSG_BIWU_BEGIN + 6 -- 请求界面成绩
opCodes.G2C_BIWU_GET_INFO             = opCodes.GAME_MSG_BIWU_BEGIN + 7 -- 返回界面成绩
opCodes.C2G_BIWU_GET_16_OLD_INFO      = opCodes.GAME_MSG_BIWU_BEGIN + 8 -- 请求旧16界面成绩
opCodes.G2C_BIWU_GET_16_OLD_INFO      = opCodes.GAME_MSG_BIWU_BEGIN + 9 -- 返回旧16界面成绩
opCodes.G2C_BIWU_STATE                = opCodes.GAME_MSG_BIWU_BEGIN + 10 -- 比武大会状态
opCodes.G2C_BIWU_ROUND_INFO           = opCodes.GAME_MSG_BIWU_BEGIN + 11 -- 比武大会每场战斗的界面信息
opCodes.C2G_BIWU_GET_16_FIGHT_INFO    = opCodes.GAME_MSG_BIWU_BEGIN + 12 -- 请求战况成绩
opCodes.G2C_BIWU_GET_16_FIGHT_INFO    = opCodes.GAME_MSG_BIWU_BEGIN + 13 -- 返回战况成绩
opCodes.C2G_BIWU_READY_GO             = opCodes.GAME_MSG_BIWU_BEGIN + 14 -- 战斗准备
opCodes.G2C_BIWU_BTN_STATE			  = opCodes.GAME_MSG_BIWU_BEGIN + 15 -- 比武大会FB界面状态

--rob map
opCodes.C2G_ROBMAP_ENTER              = opCodes.GAME_MSG_ROBMAP_BEGIN + 1 --进入混乱之地
opCodes.C2G_ROBMAP_PICK               = opCodes.GAME_MSG_ROBMAP_BEGIN + 2 --拾取灵气宝珠
opCodes.G2C_ROBMAP_INFO               = opCodes.GAME_MSG_ROBMAP_BEGIN + 3 --进入/退出房间信息
opCodes.G2C_ROBMAP_GATE_COMBAT        = opCodes.GAME_MSG_ROBMAP_BEGIN + 4 --是否与守卫对战

-- verify
opCodes.G2C_VERIFY_CODE								=	opCodes.GAME_MSG_VERIFY_BEGIN	+ 1 --验证码图片	ushort,binary,ushort
opCodes.C2G_VERIFY_CODE								=	opCodes.GAME_MSG_VERIFY_BEGIN	+ 2 --提交验证码	string
opCodes.C2G_VERIFY_CODE_CHANGE 				=	opCodes.GAME_MSG_VERIFY_BEGIN	+ 3 --更换验证码	
opCodes.G2C_VERIFY_LOGOUT							=	opCodes.GAME_MSG_VERIFY_BEGIN	+ 4 --被踢下线		

--activity
opCodes.C2G_DAILY_TASK								= opCodes.GAME_MSG_ACTIVITY_BEGIN + 1 --简单的日常活动
opCodes.C2G_DAILY_TASK_PRIZE					= opCodes.GAME_MSG_ACTIVITY_BEGIN + 2 --完成日常活动领取奖励
opCodes.G2C_DAILY_TASK								=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 3 --日常活动的完成情况
opCodes.G2C_DAILY_TASK_UPDATE					=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 4 --日常活动的更新
opCodes.G2C_DAILY_SHUDAO_DATA					=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 5 --蜀道运粮的数据
opCodes.G2C_DAILY_SHUDAO_UPDATE				=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 6 --蜀道运粮的更新
opCodes.G2C_DAILY_SHUDAO_CAR					=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 7 --蜀道运粮刷新粮车
opCodes.G2C_DAILY_LZD									=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 8 --隆中对的牌
opCodes.C2G_DAILY_SHOOT								=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 9 --辕门射戟
opCodes.G2C_DAILY_SHOOT								=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 10--辕门射戟的数据(奖金/次数)
opCodes.G2C_DAILY_SHOOT_RESULT				=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 11--辕门射戟的结果
opCodes.G2C_DAILY_SHOOT_RECORD				=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 12--辕门射戟的得奖记录
opCodes.G2C_DAILY_LZD_FAC_RANK				=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 13--帮派隆中对排行
opCodes.G2C_DAILY_LZD_FAC_SCORE				=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 14--帮派隆中对得分
opCodes.G2C_DAILY_LZD_FAC							=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 15--帮派隆中对的牌
opCodes.G2C_DAILY_TQ_LEVEL						=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 16--无尽深渊
opCodes.C2G_DAILY_MONEY_TREE          = opCodes.GAME_MSG_ACTIVITY_BEGIN + 17--请求摇钱树摇钱(大)
opCodes.G2C_DAILY_MONEY_TREE          = opCodes.GAME_MSG_ACTIVITY_BEGIN + 18--返回摇钱树摇钱(大)
opCodes.G2C_DAILY_HS_DATA							=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 19--英雄无敌
opCodes.G2C_DAILY_QUESTION						=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 20--煮酒论道
opCodes.G2C_DAILY_ZHUJIU_ANSWER				=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 21--煮酒论道
opCodes.G2C_DAILY_ZHUJIU_STATUS				=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 22--煮酒论道开/关
opCodes.G2C_DAILY_ZHUJIU_INFO					=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 23--煮酒论道
opCodes.G2C_DAILY_JZ_INFO							=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 27--荆州烽火
opCodes.G2C_DAILY_JZ_SCORE						=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 28--荆州烽火
opCodes.G2C_DAILY_JZ_PLAYER						=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 29--荆州烽火
opCodes.G2C_DAILY_JZ_PLAYER_UPDATE		=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 30--荆州烽火
opCodes.G2C_DAILY_JZ_UPDATE						=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 31--荆州烽火
opCodes.G2C_DAILY_JZ_PLAYER_REMOVE		=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 32--荆州烽火
opCodes.C2G_DAILY_JZ_SKILL						=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 33--荆州烽火
opCodes.G2C_DAILY_JZ_OPEN							=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 34--荆州烽火
opCodes.G2C_DAILY_JZ_SKILL						=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 35--荆州烽火
opCodes.C2G_DAILY_MONEY_TREE_BOX      = opCodes.GAME_MSG_ACTIVITY_BEGIN + 36--请求摇钱树宝箱(大)
opCodes.G2C_DAILY_TASK_FORBID					=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 37--日常活动-关闭
opCodes.C2G_DAILY_USE_CARD						=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 38--使用礼包卡
opCodes.G2C_DAILY_NEWBIE_CARD					=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 39--礼包卡内容
opCodes.C2G_DAILY_DOWNLOAD_PRIZE			=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 40--领取下载完整包的奖励
opCodes.G2C_DAILY_EMPEROR_INFO				=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 41--君主信息
opCodes.G2C_DAILY_EMPEROR_RESULT			=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 42--返回

opCodes.C2G_ACTIVE_QUERY_DATA			   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 43--运营活动请求数据
opCodes.G2C_ACTIVE_QUERY_DATA			   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 44--运营活动请求数据
opCodes.G2C_ACTIVITY_EX_OPEN_CLOSE_LIST    = opCodes.GAME_MSG_ACTIVITY_BEGIN + 45 -- 通知客户端活动状态位列表
opCodes.G2C_ACTIVITY_EX_OPEN_CLOSE         = opCodes.GAME_MSG_ACTIVITY_BEGIN + 46 -- 通知客户端活动状态位
opCodes.C2G_ACTIVITY_EX_ONE_TIME_HG_INFO   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 47 -- 客户端请求一时瑜亮活动信息
opCodes.G2C_ACTIVITY_EX_ONE_TIME_HG_INFO   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 48 -- 服务器返回一时瑜亮活动信息
opCodes.C2G_ACTIVITY_EX_ONE_TIME_HG_PRIZE  = opCodes.GAME_MSG_ACTIVITY_BEGIN + 49 -- 客户端请求获取一时瑜亮活动奖励
opCodes.G2C_ACTIVITY_EX_ONE_TIME_HG_PRIZE  = opCodes.GAME_MSG_ACTIVITY_BEGIN + 50 -- 客户端请求获取一时瑜亮活动奖励
opCodes.C2G_ACTIVITY_EX_STONE_DAY_INFO     = opCodes.GAME_MSG_ACTIVITY_BEGIN + 51 -- 客户端请求宝石共鸣活动信息
opCodes.G2C_ACTIVITY_EX_STONE_DAY_INFO     = opCodes.GAME_MSG_ACTIVITY_BEGIN + 52 -- 服务器返回宝石共鸣活动信息
opCodes.C2G_ACTIVITY_EX_STONE_DAY_PRIZE    = opCodes.GAME_MSG_ACTIVITY_BEGIN + 53 -- 客户端请求获取宝石共鸣活动奖励
opCodes.C2G_ACTIVITY_EX_ACT_ONLINE_PRIZE   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 54 	   -- 客户端请求在线有礼活动领取信息
opCodes.C2G_ACTIVITY_EX_ACT_ONLINE_PRIZE_PRIZE  = opCodes.GAME_MSG_ACTIVITY_BEGIN + 55 -- 客户端请求获取在线有礼活动奖励
opCodes.G2C_ACTIVITY_EX_ACT_ONLINE_PRIZE_PRIZE  = opCodes.GAME_MSG_ACTIVITY_BEGIN + 56 -- 服务器返回获取在线有礼活动奖励
opCodes.C2G_ACTIVE_GET_PRIZE					=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 57--领取奖励
opCodes.G2C_ACTIVE_RECORD							=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 58--奖励记录
opCodes.G2C_ACTIVE_DATA_RECHARGE_FEEDBACK	=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 59--充值再回馈数据
opCodes.G2C_ACTIVE_DATA_RECHARGE_SINGLE		=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 60--单笔充值奖励数据
opCodes.C2G_ACTIVITY_EX_ACT_ONLINE_RECORD   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 61 	   -- 客户端通知在线有礼活动奖励记录
opCodes.C2G_ACTIVITY_EX_SOUL_DAY_INFO     = opCodes.GAME_MSG_ACTIVITY_BEGIN + 62 -- 客户端请求魂符共鸣活动信息
opCodes.G2C_ACTIVITY_EX_SOUL_DAY_INFO     = opCodes.GAME_MSG_ACTIVITY_BEGIN + 63 -- 服务器返回魂符共鸣活动信息
opCodes.C2G_ACTIVITY_EX_SOUL_DAY_PRIZE    = opCodes.GAME_MSG_ACTIVITY_BEGIN + 64 -- 客户端请求获取魂符共鸣活动奖励

opCodes.C2G_ACTIVITY_EX_LOAD_CRAZY_ITEM   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 65 --  请求疯狂商店商品列表
opCodes.G2C_ACTIVITY_EX_LOAD_CRAZY_ITEM	  = opCodes.GAME_MSG_ACTIVITY_BEGIN + 66 --  返回疯狂商店商品列表
opCodes.C2G_ACTIVITY_EX_BUY_CRAZY_ITEM	  = opCodes.GAME_MSG_ACTIVITY_BEGIN + 67 --  买入疯狂折扣物品
opCodes.G2C_ACTIVITY_EX_ACT_ONLINE_LOGIN   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 68 -- 登录时获取在线有礼活动信息
opCodes.G2C_ACTIVE_DATA_RECHARGE_REBATE		= opCodes.GAME_MSG_ACTIVITY_BEGIN + 69--充值返利
opCodes.G2C_ACTIVE_DATA_RECHARGE_AMOUNT		= opCodes.GAME_MSG_ACTIVITY_BEGIN + 70--充值返利
opCodes.C2G_ACTIVITY_EX_BOSS_RANK_INFO   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 71 -- 请求BOSS排行信息
opCodes.G2C_ACTIVITY_EX_BOSS_RANK_INFO   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 72 -- 请求BOSS排行信息
opCodes.C2G_ACTIVITY_EX_BOSS_RANK   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 73-- 获取BOSS排行奖励
opCodes.G2C_ACTIVITY_EX_BOSS_RANK   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 74-- 获取BOSS排行奖励

opCodes.C2G_ACTIVITY_EX_MONEY_TREE_INFO   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 75-- 客户端请求财神到信息
opCodes.G2C_ACTIVITY_EX_MONEY_TREE_INFO   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 76-- 返回财神到信息
opCodes.C2G_ACTIVITY_EX_ROCK_MONEY_TREE   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 77-- 客户端请求财神到摇钱

opCodes.C2G_ACTIVITY_EX_ACT_LOGIN_PRIZE   	   = opCodes.GAME_MSG_ACTIVITY_BEGIN + 78 -- 客户端请求登录有礼活动领取信息
opCodes.C2G_ACTIVITY_EX_ACT_LOGIN_PRIZE_PRIZE  = opCodes.GAME_MSG_ACTIVITY_BEGIN + 79 -- 客户端请求获取登录有礼活动奖励
opCodes.G2C_ACTIVITY_EX_ACT_LOGIN_PRIZE_PRIZE  = opCodes.GAME_MSG_ACTIVITY_BEGIN + 80 -- 服务器返回获取登录有礼活动奖励

opCodes.C2G_ACTIVITY_EX_RANK_INFO  					= opCodes.GAME_MSG_ACTIVITY_BEGIN + 81 --查询活动排行榜
opCodes.G2C_ACTIVITY_EX_RANK_INFO  					= opCodes.GAME_MSG_ACTIVITY_BEGIN + 82 --活动排行榜信息
opCodes.G2C_ACTIVITY_EX_DATA_RECHARGE_RANK	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 83 --充值排行榜
opCodes.G2C_ACTIVITY_EX_DATA_CURRENCY_RANK	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 84 --消费排行榜
opCodes.G2C_ACTIVITY_EX_LOAD_CRAZY_ITEM_SINGLE = opCodes.GAME_MSG_ACTIVITY_BEGIN + 85 --返回疯狂商店商品列表(单个)

opCodes.G2C_ACTIVITY_EX_DATA_DAILY_PRIZE		= opCodes.GAME_MSG_ACTIVITY_BEGIN + 86 -- 日常有礼

opCodes.C2G_ACTIVITY_EX_ACT_FAST_COME   	 	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 87 -- 客户端请求先到有礼活动领取信息
opCodes.C2G_ACTIVITY_EX_ACT_FAST_COME_PRIZE  	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 88 -- 客户端请求获取先到有礼活动奖励
opCodes.G2C_ACTIVITY_EX_ACT_FAST_COME_PRIZE  	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 89 -- 服务器返回获取先到有礼活动奖励
opCodes.G2C_ACTIVITY_EX_ACT_FAST_COME_LOGIN     = opCodes.GAME_MSG_ACTIVITY_BEGIN + 90 -- 服务器提供先到有礼活动信息(登录时)

opCodes.G2C_ACTIVITY_EX_DATA_YEAR_MONSTER		=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 91 --年兽数据
opCodes.G2C_ACTIVITY_EX_DATA_MONSTER_APPEAR	=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 92 --年兽出现
opCodes.C2G_ACTIVITY_EX_DATA_MONSTER_FIGHT	=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 93 --年兽战斗

opCodes.C2G_ACTIVITY_EX_ACT_BIG_HAPPY   	 	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 94 -- 客户端请求大乐透抽奖
opCodes.G2C_ACTIVITY_EX_ACT_BIG_HAPPY   	 	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 95 -- 服务器返回大乐透抽奖
opCodes.C2G_ACTIVITY_EX_ACT_BIG_HAPPY_PRIZE  	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 96 -- 客户端请求大乐透奖励信息
opCodes.G2C_ACTIVITY_EX_ACT_BIG_HAPPY_PRIZE  	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 97 -- 服务器返回大乐透奖励信息
opCodes.C2G_ACTIVITY_EX_ACT_BIG_HAPPY_PRIZERECORD  	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 98 -- 客户端请求大乐透大奖纪录
opCodes.G2C_ACTIVITY_EX_ACT_BIG_HAPPY_PRIZERECORD  	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 99 -- 服务器返回大乐透大奖纪录
opCodes.C2G_ACTIVITY_EX_ACT_BIG_HAPPY_TEN		  	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 100 -- 客户端请求10次大乐透抽奖
opCodes.G2C_ACTIVITY_EX_ACT_BIG_HAPPY_TEN		  	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 101 -- 服务器返回10次大乐透抽奖

opCodes.G2C_DAILY_JZ_BUFF							=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 102 --荆州buff
opCodes.G2C_DAILY_GIFT_CARD_RECORD		= opCodes.GAME_MSG_ACTIVITY_BEGIN + 103--礼包卡记录
opCodes.C2G_DAILY_GIFT_CARD_PRIZE			=	opCodes.GAME_MSG_ACTIVITY_BEGIN + 104--领取礼包卡奖励

opCodes.G2C_ENDLESS_PARTY_STATUS			= opCodes.GAME_MSG_ACTIVITY_BEGIN + 105	--通知客户端无尽的宴席活动状态
opCodes.C2G_ENDLESS_PARTY_GET_PRIZE		= opCodes.GAME_MSG_ACTIVITY_BEGIN + 106	--无尽的宴席领取奖励
opCodes.C2G_ENDLESS_PARTY_INFO			= opCodes.GAME_MSG_ACTIVITY_BEGIN + 107	--请求无尽的宴席活动信息
opCodes.G2C_ENDLESS_PARTY_INFO			= opCodes.GAME_MSG_ACTIVITY_BEGIN + 108	--返回无尽的宴席活动信息


opCodes.G2C_ACTIVITY_EX_DARKLY_DOOR_INFO	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 109	--返回黑暗之门信息
opCodes.C2G_ACTIVITY_EX_DARKLY_DOOR_INFO	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 110	--请求黑暗之门信息
opCodes.G2C_ACTIVITY_EX_DARKLY_DOOR_PRIZE	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 111	--黑暗之门中奖信息
opCodes.C2G_ACTIVITY_EX_DARKLY_DOOR_PRIZE	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 112	--黑暗之门中奖信息
opCodes.G2C_ACTIVITY_EX_CRAZY_ITEM_REFRESH	= opCodes.GAME_MSG_ACTIVITY_BEGIN + 113 --疯狂抢购活动物品刷新
--Festival 
opCodes.C2G_MIDAUTUMN_LOGIN_PRIZE			=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 1--中秋活动之登录领奖
opCodes.G2C_MIDAUTUMN_LOGIN_PRIZE			=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 2--中秋活动
opCodes.C2G_MIDAUTUMN_LOTTERY				=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 3 --中秋活动之抽奖
opCodes.G2C_MIDAUTUMN_LOTTERY				=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 4 --中秋活动之抽奖
opCodes.C2G_MIDAUTUMN_LOTTERY_OPEN			=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 5 --中秋活动之抽奖界面打开
opCodes.G2C_MIDAUTUMN_LOTTERY_OPEN			=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 6 --中秋活动之抽奖界面打开
opCodes.G2C_MIDAUTUMN_HERO_TOGETHER			=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 7 --中秋活动之武将团圆
opCodes.G2C_MIDAUTUMN_LOTTERY_PACKET_FULL	=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 8 --中秋活动之抽奖背包满
opCodes.C2G_MIDAUTUMN_PRIZE_RECORD			=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 9 --中秋活动之大奖纪录
opCodes.G2C_MIDAUTUMN_PRIZE_RECORD			=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 10 --中秋活动之大奖纪录

opCodes.G2C_FESTIVAL_OPEN			=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 21		--活动开启
opCodes.G2C_FESTIVAL_CLOSE		=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 22		--活动结束
opCodes.C2G_FESTIVAL_LOTTERY	=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 23		--活动抽奖
opCodes.G2C_FESTIVAL_LOTTERY	=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 24		--活动抽奖结果
opCodes.C2G_FESTIVAL_PRIZE		= opCodes.GAME_MSG_FESTIVAL_BEGIN + 25		--活动登录领奖
opCodes.G2C_FESTIVAL_PRIZE		=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 26		--活动登录领奖
opCodes.C2G_FESTIVAL_DAILY		=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 27		--活动日常送符
opCodes.G2C_FESTIVAL_DAILY		=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 28		--活动日常送符
opCodes.C2G_FESTIVAL_RECORD		=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 29		--活动大奖记录
opCodes.G2C_FESTIVAL_RECORD		=	opCodes.GAME_MSG_FESTIVAL_BEGIN + 30		--活动大奖记录


--maze
opCodes.G2C_MAZE_OPEN           		= opCodes.GAME_MSG_MAZE_BEGIN + 1             --迷宫活动开启
opCodes.G2C_MAZE_CLOSE          		= opCodes.GAME_MSG_MAZE_BEGIN + 2             --迷宫活动结束  
opCodes.C2G_MAZE_ENTER          		= opCodes.GAME_MSG_MAZE_BEGIN + 3             --进入迷宫
opCodes.C2G_MAZE_ENTER_LEVEL   		 	= opCodes.GAME_MSG_MAZE_BEGIN + 4             --进入迷宫下一层 
opCodes.C2G_MAZE_MONSTER_COMBAT 		= opCodes.GAME_MSG_MAZE_BEGIN + 5             --开启和迷宫内的怪物的战斗
opCodes.C2G_MAZE_PLAYER_COMBAT  		= opCodes.GAME_MSG_MAZE_BEGIN + 6             --开启和迷宫内的玩家的战斗
opCodes.C2G_MAZE_INFO           		= opCodes.GAME_MSG_MAZE_BEGIN + 7             --获得迷宫信息 
opCodes.G2C_MAZE_INFO           		= opCodes.GAME_MSG_MAZE_BEGIN + 8             --迷宫信息
opCodes.G2C_MAZE_MONSTER_STATE  		= opCodes.GAME_MSG_MAZE_BEGIN + 9             --战斗迷宫怪物通知 
opCodes.C2G_MAZE_RELIVE         		= opCodes.GAME_MSG_MAZE_BEGIN + 10            --玩家请求复活
opCodes.G2C_MAZE_ENTER_LEVEL   		 	= opCodes.GAME_MSG_MAZE_BEGIN + 11            --进入迷宫下一层返回
opCodes.G2C_MAZE_DAMAGE_RANK    		= opCodes.GAME_MSG_MAZE_BEGIN + 12            --伤害排行信息
opCodes.G2C_MAZE_PLAYER_STATE   		= opCodes.GAME_MSG_MAZE_BEGIN + 13            --战斗迷宫玩家通知
opCodes.C2G_MAZE_SET_FACTION    		= opCodes.GAME_MSG_MAZE_BEGIN + 14            --设置是否可以打同帮会的玩家
opCodes.G2C_MAZE_SET_FACTION    		= opCodes.GAME_MSG_MAZE_BEGIN + 15            --返回是否可以打同帮会玩家
opCodes.C2G_MAZE_SEARCH_MONSTER_COMBAT  = opCodes.GAME_MSG_MAZE_BEGIN + 16            --搜索迷宫内怪物战斗
  
--Shop
opCodes.C2G_MALL_BUY									= opCodes.GAME_MSG_MALL_BEGIN + 1 --购买
opCodes.G2C_MALL_BUY									= opCodes.GAME_MSG_MALL_BEGIN + 2 --购买
opCodes.C2G_MALL_SELL									= opCodes.GAME_MSG_MALL_BEGIN + 3 --出售
opCodes.G2C_MALL_SELL									= opCodes.GAME_MSG_MALL_BEGIN + 4 --出售
opCodes.C2G_MALL_LIST									= opCodes.GAME_MSG_MALL_BEGIN + 5 --列表
opCodes.G2C_MALL_LIST									= opCodes.GAME_MSG_MALL_BEGIN + 6 --列表
opCodes.C2G_MALL_MYLIST								= opCodes.GAME_MSG_MALL_BEGIN + 7 --我的交易
opCodes.G2C_MALL_MYLIST								= opCodes.GAME_MSG_MALL_BEGIN + 8 --我的交易
opCodes.C2G_MALL_OFFLIST							= opCodes.GAME_MSG_MALL_BEGIN + 9 --撤销
opCodes.G2C_MALL_OFFLIST							= opCodes.GAME_MSG_MALL_BEGIN + 10 --撤销
opCodes.C2G_MALL_GET									= opCodes.GAME_MSG_MALL_BEGIN + 11 --领取
opCodes.G2C_MALL_GET									= opCodes.GAME_MSG_MALL_BEGIN + 12 --领取
opCodes.C2G_MALL_PURSE								= opCodes.GAME_MSG_MALL_BEGIN + 13 --取钱包
opCodes.G2C_MALL_PURSE								= opCodes.GAME_MSG_MALL_BEGIN + 14 --取钱包

opCodes.C2G_SHOP_GET_HISTORY          =	opCodes.GAME_MSG_SHOP_BEGIN + 1 --购买历史记录
opCodes.G2C_SHOP_GET_HISTORY	 				=	opCodes.GAME_MSG_SHOP_BEGIN + 2 --购买历史记录
opCodes.C2G_SHOP_BUY_CURRENCY_MSG			=	opCodes.GAME_MSG_SHOP_BEGIN + 3 --获取/更新元宝求购信息
opCodes.C2G_SHOP_SELL_CURRENCY_MSG		=	opCodes.GAME_MSG_SHOP_BEGIN + 4 --获取/更新元宝售卖信息
opCodes.G2C_SHOP_BUY_CURRENCY_MSG			=	opCodes.GAME_MSG_SHOP_BEGIN + 5 --元宝求购信息
opCodes.G2C_SHOP_SELL_CURRENCY_MSG		=	opCodes.GAME_MSG_SHOP_BEGIN + 6 --元宝售卖信息
opCodes.C2G_SHOP_BUY_CURRENCY					= opCodes.GAME_MSG_SHOP_BEGIN + 7 --现银购买元宝
opCodes.C2G_SHOP_SELL_CURRENCY				= opCodes.GAME_MSG_SHOP_BEGIN + 8 --元宝购买现银
opCodes.C2G_SHOP_MONEY_ORDER					= opCodes.GAME_MSG_SHOP_BEGIN + 9 --寄售现银
opCodes.C2G_SHOP_CURRENCY_ORDER				= opCodes.GAME_MSG_SHOP_BEGIN + 10--寄售元宝
opCodes.C2G_SHOP_TRADE_RECORD					= opCodes.GAME_MSG_SHOP_BEGIN + 11--所有记录

--auction
opCodes.C2G_AUCTION_GET_INFO          = opCodes.GAME_MSG_AUCTION_BEGIN + 1 -- 获取拍卖信息
opCodes.G2C_AUCTION_GET_INFO          = opCodes.GAME_MSG_AUCTION_BEGIN + 2 -- 获取拍卖信息
opCodes.C2G_AUCTION_ACTION            = opCodes.GAME_MSG_AUCTION_BEGIN + 3 -- 出价
opCodes.C2G_AUCTION_GET_GOODS_INFO    = opCodes.GAME_MSG_AUCTION_BEGIN + 4 -- 查看所拍物品/暂存现银
opCodes.G2C_AUCTION_GET_GOODS_INFO    = opCodes.GAME_MSG_AUCTION_BEGIN + 5 -- 返回查看所拍物品
opCodes.C2G_AUCTION_GET_GOODS         = opCodes.GAME_MSG_AUCTION_BEGIN + 6 -- 领取物品
opCodes.C2G_AUCTION_GET_MONEY         = opCodes.GAME_MSG_AUCTION_BEGIN + 7 -- 取回现银
opCodes.G2C_AUCTION_GET_PLAYER_PRIZE  = opCodes.GAME_MSG_AUCTION_BEGIN + 8 -- 查看自己的出价
opCodes.G2C_AUCTION_GET_MONEY_INFO    = opCodes.GAME_MSG_AUCTION_BEGIN + 9 -- 返回查看暂存现银

--Show
opCodes.C2G_SHOW_LIST					        =	opCodes.GAME_MSG_SHOW_BEGIN + 1 --获取个人秀列表	
opCodes.G2C_SHOW_LIST					        =	opCodes.GAME_MSG_SHOW_BEGIN + 2 --获取个人秀列表
opCodes.C2G_SHOW_SAVE         				= opCodes.GAME_MSG_SHOW_BEGIN + 3 --保存个人秀
opCodes.G2C_SHOW_SAVE         				= opCodes.GAME_MSG_SHOW_BEGIN + 4 --保存个人秀
opCodes.C2G_WARDROBE_LIST							=	opCodes.GAME_MSG_SHOW_BEGIN + 5 --获取衣柜列表
opCodes.G2C_WARDROBE_LIST							=	opCodes.GAME_MSG_SHOW_BEGIN + 6 --获取衣柜列表
opCodes.G2C_SHOWITEM_LOAD_SHOP				=	opCodes.GAME_MSG_SHOW_BEGIN + 7 --获取物品列表
opCodes.C2G_SHOWITEM_LOAD_SHOP				=	opCodes.GAME_MSG_SHOW_BEGIN + 8 --获取物品列表
opCodes.C2G_SHOW_BUY									=	opCodes.GAME_MSG_SHOW_BEGIN + 9 --购买物品
opCodes.G2C_SHOW_BUY							    =	opCodes.GAME_MSG_SHOW_BEGIN + 10 --购买物品
opCodes.C2G_SHOW_GIFT							    =	opCodes.GAME_MSG_SHOW_BEGIN + 11 --赠送
opCodes.G2C_SHOW_GIFT									=	opCodes.GAME_MSG_SHOW_BEGIN + 12 --赠送

--house
opCodes.C2G_ENTER_HOUSE               = opCodes.GAME_MSG_HOUSE_BEGIN + 1  --查看玩家家园信息,role_id,index
opCodes.G2C_HOUSE_INFO                = opCodes.GAME_MSG_HOUSE_BEGIN + 2  --返回家园信息
opCodes.C2G_HOUSE_NAME                = opCodes.GAME_MSG_HOUSE_BEGIN + 3  --家园改名
opCodes.C2G_USE_FURNITURE             = opCodes.GAME_MSG_HOUSE_BEGIN + 4  --使用家园家具:家园id,家具entry,参数args
opCodes.C2G_CHANGE_FURNITURE          = opCodes.GAME_MSG_HOUSE_BEGIN + 5  --摆放家具
opCodes.C2G_DEL_FURNITURE             = opCodes.GAME_MSG_HOUSE_BEGIN + 6  --删除家具
opCodes.C2G_HOUSE_LIST                = opCodes.GAME_MSG_HOUSE_BEGIN + 7  --请求随机家园信息     
opCodes.G2C_HOUSE_LIST                = opCodes.GAME_MSG_HOUSE_BEGIN + 8  --返回随机家园列表
opCodes.G2C_COOL_DOWN_INFO            = opCodes.GAME_MSG_HOUSE_BEGIN + 9  --返回家具冷却信息

--日志
opCodes.C2G_APPLY_HOMEPAGE            = opCodes.GAME_MSG_HOUSE_BEGIN + 10 --查看自己日志首页
opCodes.G2C_APPLY_HOMEPAGE            = opCodes.GAME_MSG_HOUSE_BEGIN + 11 --返回首页信息，包括3部分，发送3次
opCodes.C2G_DIARY_LIST                = opCodes.GAME_MSG_HOUSE_BEGIN + 12 --查看玩家日志列表:role_id(uint)
opCodes.G2C_DIARY_LIST                = opCodes.GAME_MSG_HOUSE_BEGIN + 13 --返回玩家日志列表:count,{id,title,time}
opCodes.C2G_NEW_DIARY                 = opCodes.GAME_MSG_HOUSE_BEGIN + 14 --发表新日志:title,text
opCodes.C2G_UPDATE_DIARY              = opCodes.GAME_MSG_HOUSE_BEGIN + 15 --修改日志:title,text
opCodes.C2G_DELETE_DIARY              = opCodes.GAME_MSG_HOUSE_BEGIN + 16 --删除日志:日志id
opCodes.C2G_APPLY_DIARY               = opCodes.GAME_MSG_HOUSE_BEGIN + 17 --查看日志内容:日志id
opCodes.G2C_APPLY_DIARY               = opCodes.GAME_MSG_HOUSE_BEGIN + 18 --返回日志内容:日志id，title,time,text,count,{role_id,role_name,type,time,txt,comment_id}
opCodes.C2G_COMMENT_DIARY             = opCodes.GAME_MSG_HOUSE_BEGIN + 19 --评论日志:日志id,评论内容
opCodes.C2G_DELETE_COMMENT            = opCodes.GAME_MSG_HOUSE_BEGIN + 20 --删除评论:评论id
opCodes.C2G_REPLY_COMMENT             = opCodes.GAME_MSG_HOUSE_BEGIN + 21 --回复评论:评论id，回复内容

--官职
opCodes.C2G_APPLY_VIRTUE     					= opCodes.GAME_MSG_OFFICE_BEGIN + 1  --查看个人德行信息
opCodes.G2C_APPLY_VIRTUE     					= opCodes.GAME_MSG_OFFICE_BEGIN + 2  --返回个人德行信息
opCodes.C2G_DONATE_MONEY     					= opCodes.GAME_MSG_OFFICE_BEGIN + 3  --捐钱
opCodes.G2C_DONATE_MONEY     					= opCodes.GAME_MSG_OFFICE_BEGIN + 4  --返回捐钱结果
opCodes.C2G_DONATE_ITEM     					= opCodes.GAME_MSG_OFFICE_BEGIN + 5  --捐物
opCodes.G2C_DONATE_ITEM     					= opCodes.GAME_MSG_OFFICE_BEGIN + 6  --返回捐物结果
opCodes.C2G_DONATE_ITEM_LIST     			= opCodes.GAME_MSG_OFFICE_BEGIN + 7  --捐物列表
opCodes.G2C_DONATE_ITEM_LIST    			= opCodes.GAME_MSG_OFFICE_BEGIN + 8  --返回捐物
opCodes.C2G_VIRTUE_RANK    						= opCodes.GAME_MSG_OFFICE_BEGIN + 9  --德行排行
opCodes.G2C_VIRTUE_RANK    						= opCodes.GAME_MSG_OFFICE_BEGIN + 10  --返回德行排行
opCodes.C2G_APPLY_VOTE    						= opCodes.GAME_MSG_OFFICE_BEGIN + 11  --查看个人选票信息
opCodes.G2C_APPLY_VOTE    						= opCodes.GAME_MSG_OFFICE_BEGIN + 12  --返回个人选票信息
opCodes.C2G_VOTE_PRICE    						= opCodes.GAME_MSG_OFFICE_BEGIN + 13  --设置选票回馈金
opCodes.G2C_VOTE_PRICE    						= opCodes.GAME_MSG_OFFICE_BEGIN + 14  --返回选票回馈金设置结果
opCodes.C2G_VOTE_MONEY    						= opCodes.GAME_MSG_OFFICE_BEGIN + 15  --设置选票储备金
opCodes.G2C_VOTE_MONEY    						= opCodes.GAME_MSG_OFFICE_BEGIN + 16  --返回选票储备金设置结果
opCodes.C2G_VOTE_RANK    							= opCodes.GAME_MSG_OFFICE_BEGIN + 17  --选票排行
opCodes.G2C_VOTE_RANK    							= opCodes.GAME_MSG_OFFICE_BEGIN + 18  --返回选票排行
opCodes.C2G_APPLY_FLAG    						= opCodes.GAME_MSG_OFFICE_BEGIN + 19  --申请旗帜
opCodes.G2C_APPLY_FLAG    						= opCodes.GAME_MSG_OFFICE_BEGIN + 20  --返回申请旗帜结果
opCodes.C2G_SET_FLAG    							= opCodes.GAME_MSG_OFFICE_BEGIN + 21  --设置旗帜
opCodes.G2C_SET_FLAG    							= opCodes.GAME_MSG_OFFICE_BEGIN + 22  --返回设置旗帜结果
opCodes.C2G_REMOVE_FLAG    						= opCodes.GAME_MSG_OFFICE_BEGIN + 23  --拆除旗帜
opCodes.G2C_REMOVE_FLAG    						= opCodes.GAME_MSG_OFFICE_BEGIN + 24  --返回拆除旗帜结果
opCodes.C2G_VOTE_SET    							= opCodes.GAME_MSG_OFFICE_BEGIN + 25  --打开设置选票界面
opCodes.G2C_VOTE_SET    							= opCodes.GAME_MSG_OFFICE_BEGIN + 26  --返回结果
opCodes.C2G_VOTE_SELECT    						= opCodes.GAME_MSG_OFFICE_BEGIN + 27  --打开投票界面
opCodes.G2C_VOTE_SELECT    						= opCodes.GAME_MSG_OFFICE_BEGIN + 28  --返回打开结果
opCodes.C2G_VOTE_GETBACK    					= opCodes.GAME_MSG_OFFICE_BEGIN + 29  --退还选举金
opCodes.G2C_VOTE_GETBACK    					= opCodes.GAME_MSG_OFFICE_BEGIN + 30  --返回退还结果
opCodes.C2G_VOTE_ELECT    						= opCodes.GAME_MSG_OFFICE_BEGIN + 31  --投票
opCodes.G2C_VOTE_ELECT    						= opCodes.GAME_MSG_OFFICE_BEGIN + 32  --返回投票
opCodes.C2G_VOTE_FLAG    							= opCodes.GAME_MSG_OFFICE_BEGIN + 33  --投票反馈金
opCodes.G2C_VOTE_FLAG    							= opCodes.GAME_MSG_OFFICE_BEGIN + 34  --返回投票反馈金
opCodes.C2G_APPLY_MONEY_LEFT					= opCodes.GAME_MSG_OFFICE_BEGIN + 35  --查询剩余选举金
opCodes.G2C_APPLY_MONEY_LEFT					= opCodes.GAME_MSG_OFFICE_BEGIN + 36  --返回剩余选举金

--擂台
opCodes.C2G_LEITAI_ENTER              = opCodes.GAME_MSG_LEITAI_BEGIN + 1 --报名
opCodes.C2G_LEITAI_LEAVE              = opCodes.GAME_MSG_LEITAI_BEGIN + 2 --离开
opCodes.C2G_LEITAI_PK                 = opCodes.GAME_MSG_LEITAI_BEGIN + 3 --请求pk
opCodes.C2G_LEITAI_TEAM_LIST          = opCodes.GAME_MSG_LEITAI_BEGIN + 4 --请求擂台榜
opCodes.G2C_LEITAI_TEAM_LIST          = opCodes.GAME_MSG_LEITAI_BEGIN + 5 --请求擂台榜
opCodes.C2G_LEITAI_AUTO_PK            = opCodes.GAME_MSG_LEITAI_BEGIN + 6 --自动匹配
opCodes.G2C_LEITAI_INFO               = opCodes.GAME_MSG_LEITAI_BEGIN + 7 --状态控制

--门派首席弟子
opCodes.C2G_MENPAIDIZI_APPLY          = opCodes.GAME_MSG_MENPAIDIZI_BEGIN + 1 --申请
opCodes.C2G_MENPAIDIZI_LEAVE          = opCodes.GAME_MSG_MENPAIDIZI_BEGIN + 2 --离开
opCodes.C2G_MENPAIDIZI_CHANGE         = opCodes.GAME_MSG_MENPAIDIZI_BEGIN + 3 --改变形象
opCodes.G2C_MENPAIDIZI_ROOM_INFO      = opCodes.GAME_MSG_MENPAIDIZI_BEGIN + 4 --
opCodes.C2G_MENPAIDIZI_GET_RANK       = opCodes.GAME_MSG_MENPAIDIZI_BEGIN + 5 --排名信息
opCodes.G2C_MENPAIDIZI_GET_RANK       = opCodes.GAME_MSG_MENPAIDIZI_BEGIN + 6 --排名信息
opCodes.G2C_MENPAIDIZI_SET_CLOCK      = opCodes.GAME_MSG_MENPAIDIZI_BEGIN + 7 --倒计时
opCodes.C2G_MENPAIDIZI_RANK           = opCodes.GAME_MSG_MENPAIDIZI_BEGIN + 8 --排名信息
opCodes.G2C_MENPAIDIZI_RANK           = opCodes.GAME_MSG_MENPAIDIZI_BEGIN + 9 --排名信息
opCodes.C2G_MENPAIDIZI_PRIZE          = opCodes.GAME_MSG_MENPAIDIZI_BEGIN + 10--领取奖励

-- global
opCodes.G2C_GLOBAL_SERVERLEVEL		  = opCodes.GAME_MSG_GLOBAL_BEGIN + 1 -- 服务器卡等级信息

--成就系统
opCodes.C2G_ROLE_A_GROUP			  = opCodes.GAME_MSG_ACHIEVEMENT_BEGIN + 1 --请求成就信息
opCodes.G2C_ROLE_A_GROUP	    	  = opCodes.GAME_MSG_ACHIEVEMENT_BEGIN + 2 --发送成就信息

opCodes.G2C_ROLE_A_GROUP_SHOP_INFO	  = opCodes.GAME_MSG_ACHIEVEMENT_BEGIN + 3 --发送成就商店信息
opCodes.C2G_ROLE_A_GROUP_SHOP_INFO	  = opCodes.GAME_MSG_ACHIEVEMENT_BEGIN + 4 --请求成就商店信息
opCodes.C2G_ROLE_A_GROUP_R_SHOP_INFO  = opCodes.GAME_MSG_ACHIEVEMENT_BEGIN + 5 --请求刷新成就商店

opCodes.C2G_ROLE_A_GROUP_BUY_SHOP     = opCodes.GAME_MSG_ACHIEVEMENT_BEGIN + 6 --购买成就商店
opCodes.G2C_ROLE_A_GROUP_BUY_SHOP     = opCodes.GAME_MSG_ACHIEVEMENT_BEGIN + 7 --返回成就商店

opCodes.G2C_ROLE_A_GROUP_SET          = opCodes.GAME_MSG_ACHIEVEMENT_BEGIN + 8 --成就商店收集物品
opCodes.G2C_ROLE_A_GROUP_SET_SINGLE   = opCodes.GAME_MSG_ACHIEVEMENT_BEGIN + 9 --成就商店收集物品(单个)


