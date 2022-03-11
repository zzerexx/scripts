local required = {
	"isfolder",
	"makefolder",
	"isfile",
	"writefile",
	"readfile",
	"delfile",
	"listfiles"
}
local missing = {}
for _,v in next, required do
	if not getgenv()[v] then
		table.insert(missing, v)
	end
end
if #missing > 0 then
	local a = Instance.new("Message", workspace)
	a.Text = "-- Config Manager --\nYour exploit does not have the following functions:\n"..table.concat(missing, "\n").."\n\n(this means you need a better exploit)"
	task.wait(10)
	a:Destroy()
	return
end

local http = game:GetService("HttpService")
local months = {[1] = "January", [2] = "February", [3] = "March", [4] = "April", [5] = "May", [6] = "June", [7] = "July", [8] = "August", [9] = "September", [10] = "October", [11] = "November", [12] = "December"}
function Encode(a)
	return http:JSONEncode(a)
end
function Decode(a)
	return http:JSONDecode(a)
end
function GetDate()
	local a = os.date("*t")
	local month = months[a.month]
	local day = a.day
	local year = a.year
	local hour = (a.hour < 10 and "0"..a.hour) or a.hour
	local minute = (a.min < 10 and "0"..a.min) or a.min
	local second = (a.sec < 10 and "0"..a.sec) or a.sec
	
	return string.format("%s %s, %s | %s:%s:%s", month, day, year, hour, minute, second)
end
function ToTable(a) -- converts data types to tables
	local t = typeof(a)
	local b = {}
	if t == "Color3" then
		b.Values = {
			[1] = a.R,
			[2] = a.G,
			[3] = a.B
		}
	elseif t == "Vector2" then
		b.Values = {
			[1] = a.X,
			[2] = a.Y
		}
	elseif t == "Vector3" then
		b.Values = {
			[1] = a.X,
			[2] = a.Y,
			[3] = a.Z
		}
	elseif t == "CFrame" then
		local pos, xv, yv, zv = a.Position, a.XVector, a.YVector, a.ZVector
		b.Values = {
			[1] = pos.X,
			[2] = pos.Y,
			[3] = pos.Z,

			[4] = xv.X,
			[5] = yv.X,
			[6] = zv.X,

			[7] = xv.Y,
			[8] = yv.Y,
			[9] = zv.Y,

			[10] = xv.Z,
			[11] = yv.Z,
			[12] = zv.Z
		}
	elseif t == "UDim" then
		b.Values = {
			[1] = a.Scale,
			[2] = a.Offset
		}
	elseif t == "UDim2" then
		b.Values = {
			[1] = a.X.Scale,
			[2] = a.X.Offset,
			[3] = a.Y.Scale,
			[4] = a.Y.Offset
		}
	elseif t == "BrickColor" then
		b.Values = {
			[1] = a.Name
		}
	end
	b.__ValueTable = t
	return b
end
local new = {
	Color3 = Color3.new,
	Vector2 = Vector2.new,
	Vector3 = Vector3.new,
	CFrame = CFrame.new,
	UDim = UDim.new,
	UDim2 = UDim2.new,
	BrickColor = BrickColor.new
}
function ToValue(a) -- converts tables to data types
	return new[a.__ValueTable](unpack(a.Values))
end
function CloneTable(a) -- clones a table so it doesnt fuck up the original table during conversion
	local t = {}
	for i,v in next, a do
		if typeof(v) == "table" then
			v = CloneTable(v)
		end
		t[i] = v
	end
	return t
end
function ConvertData(a) -- recursively converts data types to tables (encoding)
	for i,v in next, a do
		if typeof(v) == "table" then
			a[i] = ConvertData(v)
		elseif new[typeof(v)] ~= nil then
			a[i] = ToTable(v)
		end
	end
	return a
end
function ConvertTables(a) -- recursively converts tables to data types (decoding)
	for i,v in next, a do
		if typeof(v) == "table" then
			if v.__ValueTable ~= nil then
				a[i] = ToValue(v)
			else
				a[i] = ConvertTables(v)
			end
		end
	end
	return a
end

local Initialized = false
local Folder = ""

function Exists(a)
	return isfile(Folder..a..".json")
end
function Read(a)
	return ConvertTables(Decode(readfile(Folder..a..".json")))
end
function Write(a, data)
	writefile(Folder..a..".json", Encode(ConvertData(CloneTable(data))))
end

function Init(a, d, c)
	assert(not Initialized, "Config Manager has already been initialized")
	assert(typeof(a) == "string", "bad argument #1 to 'Init' (string expected, got "..typeof(a)..")")
	assert(a:gsub(" ","") ~= "", "bad argument #1 to 'Init' (string is empty)")
	assert(typeof(d) == "table", "bad argument #2 to 'Init' (table expected, got "..typeof(d)..")")

	if not isfolder(a) then
		makefolder(a)
		Folder = a.."\\"
	end
	Folder = a.."\\"

	if not Exists("Default") then
		Write("Default", {Saved = GetDate(), Data = d})
	end

	local file = Read("Default")
	Initialized = true
	if typeof(c) == "function" then
		c(file)
	end
	return file
end
function Load(a, c)
	assert(Initialized, "Config Manager has not been initialized")
	if Exists(a) then
		local file = Read(a)
		if typeof(c) == "function" then
			c(file)
		end
		return file
	end
end
function Save(a, t)
	assert(Initialized, "Config Manager has not been initialized")
	Write(a, {Saved = GetDate(), Data = t})
end
function Get()
	assert(Initialized, "Config Manager has not been initialized")
	local flen = Folder:len()
	local t = {}
	for _,v in next, listfiles(Folder) do
		table.insert(t, v:sub(flen + 1, -6))
	end
	table.sort(t, function(a, b)
		return a < b
	end)
	return t
end
function SetDefault(a)
	assert(Initialized, "Config Manager has not been initialized")
	if Exists(a) then
		Write("Default", Read(a))
	end
end
function Delete(a)
	assert(Initialized, "Config Manager has not been initialized")
	if Exists(a) then
		delfile(Folder..a..".json")
	end
end
function Valid(a)
	return Exists(a)
end

return {
	Init = Init,
	Load = Load,
	Save = Save,
	Get = Get,
	SetDefault = SetDefault,
	Delete = Delete,
	Valid = Valid
}

--[[
	Init
	<table> Init(<string> Name, <table> Default, <function?> Callback)
	Initializes Config Manager. Loads and returns the default config.
	If a Callback is specified, it calls that function with the default config as a parameter.

	Load
	<table> Load(<string> Config, <function?> Callback)
	Loads and returns the specified Config.
	If a Callback is specified, it calls that function with the specified Config as a parameter.

	Save
	<void> Save(<string> Config, <table> Data)
	Creates a new config with Data.

	Get
	<table> Get(<void>)
	Returns an array of all of your configs.

	Set Default
	<void> SetDefault(<string> Config)
	Sets the specified Config to the default config.

	Delete
	<void> Delete(<string> Config)
	Deletes the specified Config.

	Valid
	<bool> Valid(<string> Config)
	Returns true if the specified Config exists.
]]
