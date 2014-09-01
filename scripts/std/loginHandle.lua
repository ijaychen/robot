--[[
local function handleSmsgLoginUser(plr, pack)
	print("--------------------------SMSG_LOGIN_USER")
	local pack = WorldPacket(opCodes.C2L_ROLE_LIST, 10)
	plr:SendPacket(pack)
end
packetHandler[opCodes.SMSG_LOGIN_USER] = handleSmsgLoginUser

local function handleRoleList(plr, pack)
	local list = {}
	if 0 == count then
		local account = plr:GetAccountName()
		print(account)
		local info = csv.clientList[account]
		print(info)
		if not info then return end
		local packet = WorldPacket(opCodes.C2L_ROLE_CREATE)
		packet:WriteString(info.userName)
		print("-1")
		packet:WriteByte(info.career)
		print("-2")
		packet:WriteUInt(0)
		print("-3")
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

		local id = list[count].id
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
	local pack = WorldPacket(opCodes.CMSG_LOGIN, 100)
	pack:WriteString("l_chenjunji")
	pack:WriteString("qaz")
	pack:WriteString(key)
	pack:WriteString("2.2.0.0")
	plr:SendPacket(pack)
end
packetHandler[opCodes.L2C_ROLE_SELECT] = handleRoleSelect
--]]
