-- Ĭ�ϼ���·��
local defaultPath = "scripts/csv/"

-- ������Ϣ���ֶζ���
local fieldLoadInfo = 
{
	filepath	= 1,	-- csv�ļ�·����
	field		= 2,	-- csv���е��ֶ���
	func		= 3,	-- ���غ�Ļص�����
}

-- �����б�
local csvLoadInfo=
{
	-- �ļ�����csv���еļ���������ʹ��csv.���� �磺csv.LivingSkill
	{"Hero.csv", "HeroCSV"},                      --��ͼ���ñ�
	{"clientList.csv", "clientList"},
}




--------------------------------------------------------------------
-- ����CSV�ļ��б�-�������
--------------------------------------------------------------------
function c_loadCSVFiles()
	rawset(_G, "csv", {})
	loadCSVFileList(csvLoadInfo)
end

--------------------------------------------------------------------
-- ����CSV�ļ��б�-���������
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



