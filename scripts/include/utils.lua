utils = 
{
}

--设置随机数种子
math.randomseed(tostring(os.time()):reverse():sub(1,6))

--nil to default val, number is 0, string is "", table is {}
function utils.N2I(val)
	if val then return val end
	return 0
end

function utils.N2S(val)
	if val then return val end
	return ''
end

function utils.N2T(val)
	if val then return val end
	return ""
end

function utils.N2B(val)
	if val then return val end
	return false
end

function utils.probability(val)
	return external.randDouble() < val
	-- return math.random() < val
end

--list = {{w1, w1+w2, ..., 100}, {i1, i2, ...}}
function utils.getWeightItem(list)
	local rate = math.random(100)
	for i = 1, #list[1] do
		if rate <= list[1][i] then
			return list[2][i]
		end
	end
end

--tbl = {{...,weight=xx, },{..., weight=xx}}
function utils.getWeightItem2(tbl)
	if not tbl.weight then
		local weight = 0
		for k, v in ipairs(tbl) do
			weight = v.weight + weight
			v.weight = weight
		end
		tbl.weight = weight
	end
	
	local r = math.random(tbl.weight)
	for k, v in ipairs(tbl) do
		if r <= v.weight then
			return v
		end
	end
end

--传递一个数然作范围[0,val]，然后返回一个随机数
function utils.getRandomEx(val1,val2)
	if not val2 then val1,val2 = 0,val1 end
	if val1 > val2 then val1,val2 = val2,val1 end
	local rand = math.random(val1,val2)
	return rand
end

--X%的概率，命中则返回true，否则返回false。一百以内
function utils.isPercent(val)	
	local rand = math.random(1,100)
	if rand <= val and rand >=1 then return true else return false end
end

--X%的概率，命中则返回true，否则返回false。一千以内
function utils.isPercent1000(val)	
	local rand = math.random(1,1000)
	if rand <= val and rand >=1 then return true else return false end
end

--随机取得table中的一个值,table必须是数组
function utils.getRandom(t)
	local len = #t
	local rand = external.randUInt(len - 1) + 1
	
	return t[rand]
end

--随机取得table中的n个值,n必须小于数组大小
function utils.getRandoms(t, n)
	local len = #t
	if n > len then 
		return nil
	elseif n == len then
		return t
	end
		
	local tmp = {}
	local ret = {}
	local rand = 0
	for i = 1, n do
		repeat 
			rand = external.randUInt(len - 1) + 1
		until not tmp[rand]
		table.insert(ret, t[rand])
		tmp[rand] = 1
	end
	return ret
end

--从1-n随机取得k个不同的下标
function utils.getRandomIndex(n, k)
	if k > n then return end
	local tmp = {}
	local ret = {}
	local rand = 0
	for i = 1, k do
		repeat
			rand = external.randUInt(n - 1) + 1
		until not tmp[rand]
		table.insert(ret, rand)
		tmp[rand] = 1
	end
	
	return ret
end

--按权重列表得到随机目标，权重列表如:{60},{30,40,30},返回权重列表命中索引，>0 命中的索引, =0未命中
function utils.probByWeight(weightList,total)
	if not total then total = 100 end	
	local rand = math.random(total)	
	local lastVal = 0
	for i = 1, #weightList do
		if rand >= lastVal and  rand <= lastVal + weightList[i] then
			return i
		end
		lastVal = lastVal + weightList[i]
	end	
	return 0
end

--按权重返回key和value
--@权重表{[i]=100, [j]=200, [k]=30,...}
function utils.probWeght(weightList)
	-- 求总权重
	local work = false
	local sumWeight = 0
	for k, v in pairs(weightList) do
		sumWeight = sumWeight + v
		work = true
	end
	if not work or sumWeight <= 1 then return nil end
	
	-- 每次减去当前遍历的权值
	local rand = math.random(sumWeight)
	for k, v in pairs(weightList) do
		if rand <= v then 
			return k, v
		else
			rand = rand - v 
		end
	end
end

--------------------------------------------------------------------------------
--@按权重返回key和value
--@weightList ={
--	[key1] = {[index1]=100,[index2]=200...},
--	[key2] = {[index1]=100,[index2]=200...},
--}
--------------------------------------------------------------------------------
function utils.probWeghtEx(weightList, index)
	-- 求总权重
	local work = false
	local sumWeight = 0
	for k, v in pairs(weightList) do
		sumWeight = sumWeight + v[index]
		work = true
	end
	if not work or sumWeight <= 1 then return nil end
	
	-- 每次减去当前遍历的权值
	local rand = math.random(sumWeight)
	for k, v in pairs(weightList) do
		if rand <= v[index] then 
			return k, v
		else
			rand = rand - v[index]
		end
	end
end

--------------------------------------------------------------------------------
--返回表项值最大的key
--list = {
--	[key1] = {[index1] = value1, [index2] = value2, ...}
--	[key2] = {[index1] = value1, [index2] = value2, ...}
--}
--------------------------------------------------------------------------------
function utils.getMaxToken(list, index)
	local value
	local key
	for k, v in pairs(list) do
		if value then
			if value < v[index] then
				value = v[index]
				key = k
			end
			
		else
			value = v[index]
			key = k
		end
	end
	return key
end

--全局方法，在表t中找到值val返回true，否则false
function int(val, t) 
	for k, v in pairs(t) do
		if val == v then
			return true
		end
	end

	return false
end

--返回表的元素个数
function sizet(t)
	local count = 0
	for k, v in pairs(t) do
		count = count + 1
	end
	return count
end

--分割字符串
function splitString(fullString, separator)
	local startIndex = 1
	local splitIndex = 1
	local splitArray = {}
	
	if not fullString or not separator or string.len(fullString) == 0 then return splitArray end
	
	while true do
	   local lastIndex = string.find(fullString, separator, startIndex)
	   if not lastIndex then
	    splitArray[splitIndex] = string.sub(fullString, startIndex, string.len(fullString))
	    break
	   end
	   splitArray[splitIndex] = string.sub(fullString, startIndex, lastIndex - 1)
	   startIndex = lastIndex + string.len(separator)
	   splitIndex = splitIndex + 1
	end
	return splitArray
end

-- 当前时间字符串格式
function getTimeString()
	return (os.date("%Y-%m-%d %X", os.time()))
end

-- 返回两个时间之间间隔的天数
-- t1 到 t2 间隔的天数 t2 > t1
function utils.getDiffDay(t1, t2)
	local timeT1 = os.date("*t", t1)
	local timeT2 = os.date("*t", t2)
	
	local days = 0
	for i = timeT1.year, timeT2.year - 1 do
		if i/4 == 0 and i/100 == 0 and i/400 == 0 then
			days = days + 366
		elseif i/100 ~= 0 and i/4 == 0 then
			days = days + 366
		else
			days = days + 365
		end
	end
	
	return days + timeT2.yday - timeT1.yday
end

-- 将时间字符串转成秒数,格式：xxxx-xx-xx xx:xx:xx
function utils.getTimeFromString(str)
	local _, _, y, m, d, h, min, s = string.find(str, "(%d+)-(%d+)-(%d+) ?(%d*):?(%d*):?(%d*)")
	local time = {}
	time.year		= tonumber(y) or 0
	time.month	= tonumber(m) or 0
	time.day		=	tonumber(d) or 0
	time.hour		=	tonumber(h) or 0
	time.min		=	tonumber(min) or 0
	time.sec		=	tonumber(s) or 0
	
	return os.time(time)
end

-- 获取今天是星期几(星期天返回0)
function utils.getWeekDay()
	local today = os.date("*t")
	return today.wday - 1
end

--获取指定时间的os.time()
function utils.getUnixTimeByDate(hour, min, sec)
	local today = os.date("*t")
	today.hour = hour or today.hour
	today.min = min or today.min
	today.sec = sec or today.sec
	return os.time(today)
end

-- 取得今天凌晨的秒数
function utils.getToday()
	local today = os.date("*t")
	today.hour = 0
	today.min  = 0
	today.sec  = 0
	local today = os.time(today)
	return today
end

-- 取得这个星期一凌晨的秒数
function utils.getWeek()
	local today = os.date("*t")
	local day = (today.wday + 5)%7
	today.hour = 0
	today.min = 0
	today.sec = 0
	local today = os.time(today)
	return today - day*24*60*60
end

-- 取得下个星期一凌晨的秒数
function utils.getNextWeek()
	return utils.getWeek() + 604800
end

-- 取得明天凌晨的秒数
function utils.getTomorrow()
	local t = utils.getToday()
	return t + 86400
end

-- 取得当前时间到明天凌晨的秒数
function utils.nowToTomorrow()
	return utils.getTomorrow() - os.time()
end

-- 取得当前时间到今天凌晨的秒数(今天已经逝去的时间)
function utils.nowToToday()
	return os.time() - utils.getToday()
end

-- 取得当前时间到星期天凌晨的秒数(这个星期已经过去的时间)
function utils.nowToWeek()
	return os.time() - utils.getWeek()
end

-- 获取当前小时的秒数
function utils.getHourTime()
	local today = os.date("*t")
	today.min = 0
	today.sec = 0
	local hour = os.time(today)
	return hour
end

-- 获取下一小时的秒数
function utils.getNextHourTime(n)
	n = n or 1
	local today = os.date("*t")
	today.hour = today.hour + n
	today.min = 0
	today.sec = 0
	local hour = os.time(today)
	return hour
end

--取得周一凌晨秒数
function utils.getNextWeekTime()
	--local now = os.date("*t")
	--now.hour = 0
	--now.min = 0
	--now.sec = 0
	--now.day = now.day + 9 - now.wday
	--
	--return os.time(now)
	return utils.getNextWeek()
end

--取得下个周几的具体时间秒数
function utils.getWeekTime(week, hour, min)
  local today = os.date("*t")
  local day = (week + 1 - today.wday) % 7
	today.hour = hour
	today.min = min or 0
	today.sec = 0
	local today = os.time(today)
	return today + day*24*60*60
end

----------------------------------------------------------------
--检查是否在时间段内(一个星期)
--@lua_table sTime 开始时间 {wday=wday, hour=hour, min=min}
--@lua_table eTime 结束时间
-----------------------------------------------------------------
function utils.inTimeBlock(sTime, eTime)
	sTime.hour = sTime.hour or 0
	sTime.min  = sTime.min or 0
	
	eTime.hour = eTime.hour or 0
	eTime.min  = eTime.min or 0
	
	local startTime = (sTime.wday*24 + sTime.hour)*60 + sTime.min
	local endTime   = (eTime.wday*24 + eTime.hour)*60 + eTime.min
	
	local today = os.date("*t")
	local nowTime = ((today.wday-1)*24 + today.hour)*60 + today.min
	local weekTime = 7*24*60
	if (nowTime - startTime)%weekTime < (endTime - startTime)%weekTime then
		return true
	end
	return false
end

-- 检查数据合法性
-- lua: boolean nil table number string
function notDataType(data, dtype)
	if type(data) == dtype then
		return false
	else
		debug_log(">>>>>>>>>>>>>>>>> data type error <<<<<<<<<<<<<<<<<<<<<")
		return true
	end
end

--判断点是否在菱形里面
function utils.checkInRect(pos, rect)
	local x = pos.x
	local y = pos.y
	local count = 0
		
	rect[5] = rect[1]
	for i = 1, 4 do
		local p1 = rect[i]
		local p2 = rect[i+1]
		
		local x0 = p1.x - (y - p1.y) * (p1.x - p2.x) / (p2.y - p1.y)
		if x0 == x then
			return true
		end
		
		if x0 < x then
			if x0 == p1.x and p1.y < p2.y then
				count = count + 1
			elseif x0 == p2.x and p2.y < p1.y then
				count = count + 1
			else
				local minx = p1.x < p2.x and p1.x or p2.x
				local maxx = p1.x > p2.x and p1.x or p2.x
						
				if x0 > minx and x0 < maxx then
					count = count + 1
				end
			end
		end
	end
	
	return count == 1
end

--判断地图ID是否合法
function utils.isValidMapId(id)
	return id > 0 and id < 65536
end

--------------------------------------------------------------------------------
--获取今天是这年的第几个星期
--------------------------------------------------------------------------------
function utils.getWhatWeeks()
	local t=os.date("*t")
	local what = math.floor(t.yday/7)
	return what
end

function utils.getWhatWeeksEx()
	local oldYear=os.date("*t")
	oldYear.month = 1
	oldYear.day = 1
	oldYear.hour = 0
	oldYear.min = 0
	oldYear.sec = 0
	oldYear.isdst = false	
	oldYear = os.date("*t",os.time(oldYear))
	local newYear=os.date("*t")
	local tDay = newYear.yday + oldYear.wday - 1
	local week = (tDay - tDay%7)/7
	return week
end

--是否单周
function utils.isSingleWeek()
	return (utils.getWhatWeeks()%2 == 0 and true or false)
end

--获取竞技场刷新积分时间
--wday = {1日、2一、3二、4三、5四、6五、7六} 取其中一个数字
function utils.arenaNextWeekDay(wday)
	local date = os.date("*t")
	date.day = date.day + wday - date.wday + 7
	date.hour = 0
	date.min = 0
	date.sec = 0
	date = os.time(date)
	return date
end

function utils.arenaNext2WeekDay(wday)
	local date = os.date("*t")
	date.day = date.day + wday - date.wday + 14
	date.hour = 0
	date.min = 0
	date.sec = 0
	date = os.time(date)
	return date
end

--是否竞技场积分清零通知日
function utils.isArenaDay()
	local date = os.date("*t")
	if date.wday == 1 or date.wday == 6 or date.wday == 7 then
		return true 
	else
		return false
	end
end

--------------------------------------------------------------------------------
--返回队伍列表、否则返回 {plr}
--------------------------------------------------------------------------------
function utils.getTeamList(plr, isAll)
	local team = plr:getTeam()
	if plr:isTeamBack() then
		if isAll then
			return team.posPlayer
		else
			return team.members
		end
	else
		return {plr}
	end
end

--------------------------------------------------------------------------------
--判断两个是否同一队伍
--------------------------------------------------------------------------------
function utils.sameTeam(plr1, plr2)
	local team1 = plr1:getTeam()
	local team2 = plr2:getTeam()
	if team1 and team2 and team1==team2 then
		if team1:getStatus(plr1)==teamStatus.BACK and team2:getStatus(plr2)==teamStatus.BACK then
			return true
		end
	end
	return false
end