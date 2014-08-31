
function sizet(t)
	local count = 0
	for k, v in pairs(t) do
		count = count + 1
	end
	return count
end

local array = { 1, 2, 3, 4, 5, 6, 7, 8, 9}
for idx, value in ipairs(array) do
	if(sizet(array) > 4) then
		print("----------------break------------------")
		break
	end
	print("---------------------OK----------------")
end

