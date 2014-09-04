
function c_procPacket(plr, pack)
	local opcode = pack:GetOpcode()
	local plrName = plr:GetAccountName()
	
	--debug_log("------------c_procPacket: "..plrName.."opCode:"..opcode, log_info)
	--debug_log("------------------------c_procPacket: "..opcode, log_type.info)
	local handle = packetHandler[opcode]
	if handle and pack then
		handle(plr, pack)
	else
		debug_log("opcode, handle & pack is nil", log_type.info)
	end
end

function c_move(plr)
	--local x = 88
	--local y = 25
	local x = utils.getRandomEx(5, 95);
	local y = utils.getRandomEx(20, 27);
	local packet = WorldPacket(opCodes.C2G_MOVE, 15)
	packet:WriteUShort(1)
	packet:WriteUShort(x)
	packet:WriteUShort(y)
	plr:SendPacket(packet)
	local fightpack = WorldPacket(opCodes.C2G_FIGHT_MONSTER,10)
	plr:SendPacket(fightpack)
end
