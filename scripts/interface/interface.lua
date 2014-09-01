
function c_procPacket(plr, pack)
	local opcode = pack:GetOpcode()
	print("------------------------c_procPacket: ", opcode)
	--debug_log("------------------------c_procPacket: "..opcode, log_type.info)
	local handle = packetHandler[opcode]
	if handle and pack then
		handle(plr, pack)
	else
		debug_log("opcode, handle & pack is nil", log_type.info)
	end
end
