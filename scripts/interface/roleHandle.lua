local function handleZJStatusxx(plr, pack)
	local status = pack:ReadByte()
	if status == 1 then 
		local packet =  WorldPacket(opCodes.C2G_DAILY_TASK, 8)
		packet:WriteUShort(17)
		packet:WriteUShort(4)
		plr:SendPacket(packet)
	end
end
packetHandler[opCodes.G2C_DAILY_ZHUJIU_STATUS] = handleZJStatusxx

local function handleMapEnter(plr, pack)
	debug_log("--------------------------G2C_MAP_ENTER", log_type.info)
	local mapId = pack:ReadUInt()
	local x		= pack:ReadUShort()
	local y		= pack:ReadUShort()
	local worldBossMap = {4009101, 4009102, 4009103, 4009104, 4009105, 4009106}
	if mapId == 7001011 then	
		--退出新手战斗指引
		local packet = WorldPacket(opCodes.C2G_MAP_ENTER, 8)
		packet:WriteUInt(4001010)
		plr:SendPacket(packet)
		local str = "@aq xxx all"
		local packet = WorldPacket(opCodes.C2G_CHANNEL_SEND, 30)
		packet:WriteByte(3)
		packet:WriteString(str)
		plr:SendPacket(packet)
	else
		local x = utils.getRandomEx(22, 90);
		local y = utils.getRandomEx(20, 27);
		local packet = WorldPacket(opCodes.C2G_MOVE, 15)
		packet:WriteUShort(1)
		packet:WriteUShort(x)
		packet:WriteUShort(y)
		plr:SendPacket(packet)
	end
end
packetHandler[opCodes.G2C_MAP_ENTER] = handleMapEnter

local function handleHeroInfo(plr, pack)
	print("--------------------------G2C_HERO_INFO", log_type.info)
	local id =	pack:ReadUInt()	
	local name = pack:ReadString() --名字
	local level = pack:ReadUShort()
	if level < 60 then
		local str = "@aq xxx all"
		print(str)
		local packet = WorldPacket(opCodes.C2G_CHANNEL_SEND, 30)
		packet:WriteByte(3)
		packet:WriteString(str)
		plr:SendPacket(packet)
	end
end
packetHandler[opCodes.G2C_HERO_INFO] = handleHeroInfo


local function handleEndlessParty(plr, pack)
	local bStart = pack:ReadByte()	--开始结束标志
	local prize = pack:ReadByte()	--能否领取标志
	if 1 == bStart and 1 == prize then
		local retPack = WorldPacket(opCodes.C2G_ENDLESS_PARTY_GET_PRIZE, 10)
		plr:SendPacket(retPack)
	end
end
packetHandler[opCodes.G2C_ENDLESS_PARTY_INFO] = handleEndlessParty

local function handleItemUpdate(plr, pack)
	local cnt = pack:ReadUShort()
	local guid = pack:ReadUInt()
	local entryId = pack:ReadUInt()
	print(cnt, guid, entryId)
	io.read()
	local packet = WorldPacket(opCodes.C2G_ITEM_USE, 100)
	packet:WriteUInt(guid)
	packet:WriteUInt(0)
	packet:WriteUShort(1)
	plr:SendPacket(packet)  
end
packetHandler[opCodes.G2C_ITEM_UPDATE] = handleItemUpdate

--world boss
local function handleBossStart(plr, pack)
	local type = pack:ReadUInt()
	local pack = WorldPacket(opCodes.C2G_BOSS_ENTER, 10)
	plr:SendPacket(pack)  
end
packetHandler[opCodes.G2C_BOSS_START] = handleBossStart