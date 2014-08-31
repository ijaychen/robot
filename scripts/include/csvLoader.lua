-- 默认加载路径
local defaultPath = "scripts/csv/"

-- 加载信息表字段定义
local fieldLoadInfo = 
{
	filepath	= 1,	-- csv文件路径名
	field		= 2,	-- csv表中的字段名
	func		= 3,	-- 加载后的回调方法
}

-- 加载列表
local csvLoadInfo=
{
	-- 文件名，csv表中的键名，访问使用csv.键名 如：csv.LivingSkill
	{"Hero.csv", "HeroCSV"},                      --地图配置表
	{"clientList.csv", "clientList"},
}




--------------------------------------------------------------------
-- 加载CSV文件列表-对外调用
--------------------------------------------------------------------
function c_loadCSVFiles()
	rawset(_G, "csv", {})
	loadCSVFileList(csvLoadInfo)
end

--------------------------------------------------------------------
-- 加载CSV文件列表-不对外调用
--------------------------------------------------------------------
function loadCSVFileList(loadList)
	local csvFilepath = nil
	local csvField = nil
	local csvFunc = nil
	for k, v in pairs(loadList) do
		csvFilepath = v[fieldLoadInfo.filepath]
		csvField = v[fieldLoadInfo.field]
		csvFunc = v[fieldLoadInfo.func]
		print(csvFilepath, csvField, csvFunc)
		local val = readCSV(defaultPath .. csvFilepath)
		csv[csvField] = val
		if csvFunc then csvFunc() end
	end
end



