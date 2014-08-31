-- CSV�����ļ���ȡ

-- ˵����
-- CSV�ļ���һ��Ϊ��˵�����ڶ���Ϊ�������磺Id_n, Name_s, Money_f1, Commnet_c, 
-- ע��"_"ǰ��Ϊ����������Ϊ����������,�������_��������,��Ĭ��Ϊ��������
-- _n  ���֣���Ϊ0ֵ
-- _n1 ���֣���Ϊnilֵ
-- _s  �ַ�
-- _b  ���ֵ, 0Ϊ�٣�1Ϊ�棬��Ϊ��ֵ
-- _t  ��,������������{},��{1,2},{3,4}�൱��{{1,2},{3,4}}����Ϊ�ձ�{}
-- _t1 ��,����������{}����Ϊ�ձ�{}
-- _f1 ��ʽ������Ϊ1������������a,b,c˵�����磺3*a
-- _f2 ��ʽ������Ϊ1������������a,b,c˵�����磺3*a + 4/b
-- _f3 ��ʽ������Ϊ1������������a,b,c˵�����磺3*a + 4/b + c
-- _c  �������У�˵����
-- _kn ���ֹؼ����У�key��������Ϊ����,һ������������ؼ����У������ؼ������Ƕ�ף���ؼ������ӱ�
-- _ks �ַ����ؼ����У�key��������Ϊ�ַ���

-- ����ʹ�ã�
-- SkillCSV = readCSV("dbc\\csv\\skill.csv")
-- SkillCSV[id].id
-- SkillCSV[id].name
-- SkillCSV[id].Money(roleLevel, skillLevel) ������������ΪMoney_f2
-- �����ؼ������Ƕ��,��ؼ������ӱ���id,levelΪ�Ⱥ������ؼ����У�
-- SkillCSV[id][level] 

-- by xuning
-- 2010/4/9
local function genNumber(s)

	local val = tonumber(s)
	if val == nil then
		return 0
	else
		return val
	end
end

local function genNumberEx(s)
	local val = tonumber(s)
	return val
end

local function genString(s)
	return s
end

local function genTable(s)
	return assert(loadstring("return { " .. s .. " }"))()
end

local function genTableEx(s)
	return assert(loadstring("return" .. s .. ""))()
end

local function genFunction0(s)
	return assert(loadstring("return function() return " .. s .. " end"))()
end

local function genFunction1(s)
	return assert(loadstring("return function(a) return " .. s .. " end"))()
end

local function genFunction2(s)
	return assert(loadstring("return function(a,b) return " .. s .. " end"))()
end

local function genFunction3(s)
	return assert(loadstring("return function(a,b,c) return " .. s .. " end"))()
end

local function genBoolean(s)
	local val = tonumber(s)
	if val == nil or val == 0 then
		return false
	else
		return true
	end
end

local conv_map =
{
	n=genNumber,
	n1=genNumberEx,
	s=genString,
	t=genTable,
	t1=genTableEx,
	f0=genFunction0,
	f1=genFunction1,
	f2=genFunction2,
	f3=genFunction3,
	c=nil, --ignore the column
	b=genBoolean,
	kn=genNumber,
	ks=genString,
}

local function getFieldInfo(field)
	--print(field)
	local pos = string.find(field, '_')
	local isKey = false
	local name = nil
	local datatype = nil

	if pos then
		--name = string.sub(field, 1, pos - 1)
		--datatype = string.sub(field, pos + 1)
		local _, _, name, datatype = string.find(field, "(.+)_(%w+)")
 		--print(a, b,name,datatype)
 		--io.read()
		if string.sub(datatype, -1) == '\n' then
			datatype = string.sub(datatype, 1, #datatype - 1)
		end
		if string.sub(datatype, -1) == '\r' then
			datatype = string.sub(datatype, 1, #datatype - 1)
		end
		if datatype == "kn"	or datatype == "ks" then
			isKey = true
		end
		do return name, conv_map[datatype], isKey end
	else
		name = field
		if string.sub(name, -1) == '\n' then
			name = string.sub(name, 1, #name - 1)
		end
		if string.sub(name, -1) == '\r' then
			name = string.sub(name, 1, #name - 1)
		end
		do return name, conv_map["n"], isKey end
	end
end

local function fromCSV (s, head)
	s = s .. ',' -- ending comma
	local t = {} -- table to collect fields
	local fieldstart = 1
	local index = 1
	local val = nil
	local name = nil
	local conv_func = nil
	local key = nil
	local key1 = nil
	local isKey = false
	
	if string.sub(s, 1, 1) == "#"  and head ~= nil then
		return nil
	end
	
	repeat
		-- next field is quoted? (start with `"'?)
		if string.find(s, '^"', fieldstart) then		
			local a, c
			local i = fieldstart
			repeat
				-- find closing quote
				a, i, c = string.find(s, '"("?)', i+1)
			until c ~= '"' -- quote not followed by quote?
	
			if not i then error('unmatched "') end
			local f = string.sub(s, fieldstart+1, i-1)
			val = string.gsub(f, '""', '"')
			if head then
				name, conv_func, isKey = getFieldInfo(head[index])
				if conv_func then
					if isKey then
						if key then
							key1 = conv_func(val)
							t[name] = key1
						else
							key = conv_func(val)
							t[name] = key
						end
					else
						t[name] = conv_func(val)
					end

				end
				index = index + 1
			else
				table.insert(t, val)
			end
			fieldstart = string.find(s, ',', i) + 1
		else -- unquoted; find next comma
			local nexti = string.find(s, ',', fieldstart)
			val = string.sub(s, fieldstart,nexti-1)
			if head then
				name, conv_func, isKey = getFieldInfo(head[index])
				--print(name, conv_func, isKey,head[index])
				if conv_func then
					if isKey then
						if key then
							key1 = conv_func(val)
							t[name] = key1
						else
							key = conv_func(val)
							t[name] = key
						end
					else
						t[name] = conv_func(val)
					end
				end
				index = index + 1
			else
				table.insert(t, val)
			end
			fieldstart = nexti + 1
		end
	until fieldstart > string.len(s)
	return t, key, key1
end

function readCSV(file)
	return readCSVEx(file, 2, true)
end

function readCSVEx(file, start_line, table_head)
	local fp = assert(io.open (file))
	local csv = {}
	local count = 0
	local first_line = true
	local head = nil
	local row = nil
	local key = nil
	local key1 = nil
	local data = nil
	--print(file)
	for line in fp:lines() do
		count = count + 1
		if count >= start_line then --�ڶ��п�ʼ��
			if table_head then
				if first_line then
					head = fromCSV(line)
				else
					data, key, key1 = fromCSV(line, head)
					if data~= nil then
						if key then
							if key1 then
								if not csv[key] then
									csv[key] = {}
								end
								csv[key][key1] = data
							else
								csv[key] = data
							end
						else
							csv[#csv+1] = data
						end
					end
				end
			else
				csv[#csv+1] = fromCSV(line)
			end
			first_line = false
		end
	end  

	return csv
end

--[[
testCSV = readCSV("./scripts/csv/Hero.csv")
print(testCSV)
for key, value in pairs(testCSV) do
	print(key, " ", value)
end

for key, value in pairs(testCSV[2002009]) do
	print(key, " ",  value)
end
print(testCSV[2002009].name)
--]]