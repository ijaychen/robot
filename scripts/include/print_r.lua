function print_r(sth)
	if type(sth) ~= "table" then
		print(sth)
		return
	end

	local cache = {  [sth]="<self>" }

	local space, deep = string.rep(' ', 2), 0
	local function _dump(pkey, t)

		for k,v in pairs(t) do
			local key
			if type(k)=='number' then
				key = string.format("[%s]", k)
			else
				key= tostring(k)
			end

			if cache[v] then
				print(string.format("%s%s=%s,",	string.rep(space, deep + 1),key,cache[v])) --print.
			elseif type(v) == "table" then
				deep = deep + 2
				cache[v]= string.format("%s.%s",pkey,key)
				print(string.format("%s%s=\n%s{", string.rep(space, deep - 1), key, string.rep(space, deep))) --print.
				_dump(string.format("%s.%s",pkey,key), v)
				print(string.format("%s},",string.rep(space, deep)))
				deep = deep - 2
			else
				if type(v) == 'string' then
					print(string.format("%s%s='%s',",	string.rep(space, deep + 1),key,v)) --print.
				else
					print(string.format("%s%s=%s,",	string.rep(space, deep + 1),key,tostring(v))) --print.
				end
			end
		end
	end

	print(string.format("{"))
	_dump("<self>", sth)
	print(string.format("}"))
end


