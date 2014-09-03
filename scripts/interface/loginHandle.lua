
local function handleSmsgLoginUser(plr, pack)
	debug_log("--------------------------SMSG_LOGIN_USER", log_type.info)
	local pack = WorldPacket(opCodes.C2L_ROLE_LIST, 10)
	plr:SendPacket(pack)
end
packetHandler[opCodes.SMSG_LOGIN_USER] = handleSmsgLoginUser

local function handleRoleList(plr, pack)
	debug_log("---------handleRoleList---------", log_type.info)
	local list = {}
	local count = 0
	local size = pack:GetSize()
	if size > 2 then
		count = pack:ReadUShort()
	end
	if 0 == count then
		local account = plr:GetAccountName()
		local info = csv.clientList[account]
		if not info then return end
		local packet = WorldPacket(opCodes.C2L_ROLE_CREATE, 50)
		packet:WriteString(info.userName)
		packet:WriteByte(info.career)
		packet:WriteUInt(0)
		plr:SendPacket(packet)
	else
		for i = 1,count do
			local role		=	{}
			role.id 			= pack:ReadUInt()
			role.name			=	pack:ReadString()
			role.machine	=	pack:ReadString()
			role.account	=	pack:ReadString()
			role.prof			=	pack:ReadByte()
			role.lv				=	pack:ReadUShort()
			role.activite	= pack:ReadUInt()
			list[i] = role
		end
		local id = list[1].id
		local pack = WorldPacket(opCodes.C2L_ROLE_SELECT, 30)
		pack:WriteUInt(id)
		plr:SendPacket(pack)
	end
end
packetHandler[opCodes.L2C_ROLE_LIST] = handleRoleList


local function handleRoleSelect(plr, pack)
	debug_log("--------------------------L2C_ROLE_SELECT", log_type.info)
	local result = pack:ReadUShort()
	local ip = pack:ReadString()
	local port = pack:ReadUShort()
	local key = pack:ReadString()
	if 0 ~= result then debug_log("c2l role select faild", log_type.err) return end
	local accountName = plr:GetAccountName()
	local packet = WorldPacket(opCodes.CMSG_LOGIN, 100)
	packet:WriteString(g_serverName)
	packet:WriteString(accountName)
	packet:WriteString(key)
	packet:WriteString("2.2.0.0")
	plr:SendPacket(packet)
end
packetHandler[opCodes.L2C_ROLE_SELECT] = handleRoleSelect

local function handleSMsgLogin(plr, pack)
	debug_log("--------------------------SMSG_LOGIN", log_type.info)
	local ret		=	pack:ReadUShort()
	local time	=	pack:ReadUInt()
	if 0 == ret then
		plr:SetPingTimer()
		--变身卡测试
		--[[
		local entryId = utils.getRandomEx(600001, 600030)
		local str = "@give a item "..entryId.." 1"
		print(str)
		io.read()
		local packet = WorldPacket(opCodes.C2G_CHANNEL_SEND, 30)
		packet:WriteByte(3)
		packet:WriteString(str)
		plr:SendPacket(packet)
		--]]
	end
end
packetHandler[opCodes.SMSG_LOGIN] = handleSMsgLogin

local function handleRoleCreate(plr, pack)
	debug_log("--------------------------L2C_ROLE_CREATE", log_type.info)
	local ret =	pack:ReadUShort()
	if 0 == ret then
		local pack = WorldPacket(opCodes.C2L_ROLE_LIST, 10)
		plr:SendPacket(pack)
	else
		debug_log("l2c role create faild", log_type.err)
	end
end
packetHandler[opCodes.L2C_ROLE_CREATE] = handleRoleCreate

--[[
local function handlePong(plr, pack)
	local index = pack:ReadUInt()
	print("game pong",index)
end	
packetHandler[opCodes.SMSG_PONG] = handlePong
--]]
