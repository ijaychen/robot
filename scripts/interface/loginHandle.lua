
local function handleSmsgLoginUser(plr, pack)
	print("--------------------------SMSG_LOGIN_USER")
	local pack = WorldPacket(opCodes.C2L_ROLE_LIST, 10)
	plr:SendPacket(pack)
end
packetHandler[opCodes.SMSG_LOGIN_USER] = handleSmsgLoginUser

local function handleRoleList(plr, pack)
	local list = {}
	local count = pack:ReadUShort()
	if 0 == count then
		local account = plr:GetAccountName()
		print(account)
		local info = csv.clientList[account]
		print(info)
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

		local id = list[i].id
		local pack = WorldPacket(opCodes.C2L_ROLE_SELECT, 30)
		pack:WriteUInt(id)
		plr:SendPacket(pack)
	end
end
packetHandler[opCodes.L2C_ROLE_LIST] = handleRoleList


local function handleRoleSelect(plr, pack)
	local result = pack:ReadUShort()
	local ip = pack:ReadString()
	local port = pack:ReadUShort()
	local key = pack:ReadString()
	print(result, ip, port, key)
	print("--------------------------L2C_ROLE_SELECT")
	if 0 ~= result then debug_log("c2l role select faild", "error") return end
	local accountName = plr:GetAccountName()
	local packet = WorldPacket(opCodes.CMSG_LOGIN, 100)
	packet:WriteString(g_serverName)
	packet:WriteString(accountName)
	packet:WriteString(key)
	packet:WriteString("2.2.0.0")
	plr:SendPacket(packet)
end
packetHandler[opCodes.L2C_ROLE_SELECT] = handleRoleSelect

local function handleRoleCreate(plr, pack)
	print("--------------------------L2C_ROLE_CREATE")
	local ret =	pack:ReadUShort()
	if 0 == ret then
		local pack = WorldPacket(opCodes.C2L_ROLE_LIST, 10)
		plr:SendPacket(pack)
	else
		--debug_log("l2c role create faild","error")
	end
end
packetHandler[opCodes.L2C_ROLE_CREATE] = handleRoleSelect