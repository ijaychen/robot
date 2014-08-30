
function c_procPacket(plr, pack)
	local opcode = pack:GetOpcode()
	print("------------------------c_procPacket", opcode)
	local handle = packetHandler[opcode]
	if handle and pack then
		handle(plr, pack)
	else
		--print("opcode, handle & pack", opcode, handle, pack);
	end
end
