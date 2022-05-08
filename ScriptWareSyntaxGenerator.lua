local white = Color3.new(1, 1, 1)
local syntax = {
	Syntax_Comment = white, -- comment like this
	Syntax_Number = white, -- 1 2 3
	Syntax_String = white, -- "string"
	Syntax_Character = white, -- 'string'
	Syntax_Operator = white, -- + - * / = [] {} () <> , . (pretty much all punctuation)
	Syntax_Keywords = white, -- local if then else elseif end do not and or
	Syntax_Globals = white, -- _G print (lua globals)
	Syntax_Functions = white, -- 
	Syntax_Enums = white, -- KeyCode UserInputType (all enums)
	Syntax_Logic = white, -- import mousemoverel (sw functions)
	Syntax_Metamethods = white, -- true false nil (booleans)
	Syntax_SWFunctions = white, -- __index __newindex (metamethods)
	Syntax_Custom = white -- continue
}
local examples = {
	Syntax_Comment = "-- this is a comment",
	Syntax_Number = "1 2 3 4 5 6 7 8 9 0",
	Syntax_String = "\"this is a string\"",
	Syntax_Character = "",
	Syntax_Operator = "+ - * / % ^ # = ~ < > ( ) { } [ ] ; : , .",
	Syntax_Keywords = "and end in repeat break local return do for then else function not elseif if or until while",
	Syntax_Globals = "print _G tostring assert error getfenv next pairs loadstring pcall\n... and alot more",
	Syntax_Functions = "HttpGet HttpGetAsync",
	Syntax_Enums = "KeyCode ActionType Font UserInputType etc\npretty much any enum",
	Syntax_Logic = "import getrawmetatable mousemoverel setupvalue etc\nany scriptware function",
	Syntax_Metamethods = "true false nil",
	Syntax_SWFunctions = "__index __newindex __namecall __add __sub etc\nany metamethod",
	Syntax_Custom = "continue"
}

local http = game:GetService("HttpService")
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/MaterialLuaRemake.lua"))()
local UI = Material.Load({
    Title = "scriptware theme syntax generator",
    Style = 3,
	SizeX = 550
})

local page = UI.new("Syntax")

local ui = {}
local function picker(name, key)
	local a = page.ColorPicker({
		Text = name,
		Callback = function(value)
			if typeof(key) == "table" then
				for _,v in next, key do
					syntax[v] = value
				end
			else
				syntax[key] = value
			end
		end,
		Def = white,
		Menu = {
			Example = function()
				UI.Banner("<font size='14'><font face='Code'>"..examples[typeof(key) == "table" and key[1] or key].."</font></font>")
			end
		}
	})
	if typeof(key) == "table" then
		for _,v in next, key do
			ui[v] = a
		end
	else
		ui[key] = a
	end
end

picker("Comments", "Syntax_Comment")
picker("Numbers", "Syntax_Number")
picker("Strings", {"Syntax_String", "Syntax_Character"})
picker("Operators", "Syntax_Operator")
picker("Keywords", "Syntax_Keywords")
picker("Lua Globals", "Syntax_Globals")
picker("Functions", "Syntax_Functions")
picker("Enums", "Syntax_Enums")
picker("Script-Ware Functions", "Syntax_Logic")
picker("Booleans", "Syntax_Metamethods")
picker("Metamethods", "Syntax_SWFunctions")
picker("Custom", "Syntax_Custom")

local code = [[GLOBloadstring_GLOBOP(_OPDEFgame_DEFOP:_OPFUNCHttpGet_FUNCOP(_OPSTR"https://google.com"_STROP))()_OP
KWlocal_KW DEFlol_DEF OP= {_OPSTR"string"_STROP,_OP CHAR'string'_CHAROP}_OP
KWlocal_KW DEFtotal_DEF OP=_OP NUMB500_NUMB OP+_OP NUMB500_NUMB
KWlocal_KW DEFenum_DEF OP=_OP ENUMKeycode_ENUM

KWfunction_KW DEFfoo_DEFOP()_OP
	KWif_KW BOOLtrue_BOOL KWand not_KW BOOLnil_BOOL KWthen_KW
		KWfor_KW DEFi_DEF OP=_OP NUMB1_NUMBOP,_OP NUMB10_NUMB KWdo_KW
			KWif_KW DEFi_DEF OP== (_OPNUMB5_NUMB KWor_KW NUMB10_NUMBOP)_OP KWthen_KW
				CUSTcontinue_CUST
			KWend
		end
	elseif_KW BOOLfalse_BOOL KWthen
		return_KW BOOLnil_BOOLOP,_OP GLOB_G_GLOB
	KWend
end_KW

COMM-- Comment_COMM

KWlocal_KW DEFFE_DEF OP=_OP SWgetrawmetatable_SWOP(_OPDEFgame_DEFOP)._OPMETA__index_METAOP(_OPDEFworkspace_DEFOP,_OP STR"FilteringEnabled"_STROP)_OP
GLOBprint_GLOBOP(_OPDEFFE_DEFOP)_OP

SWimport_SWOP(_OPNUMB1208_NUMBOP)_OP]]
--[[loadstring(game:HttpGet("https://google.com"))()
local lol = {"string", 'string'}
local total = 500 + 500
local enum = KeyCode

function foo()
	if true and not nil then
		for i = 1, 10 do
			if i == (5 or 10) then
				continue
			end
		end
	elseif false then
		return nil, _G
	end
end

-- Comment

local FE = getrawmetatable(game).__index(workspace, "FilteringEnabled")
print(FE)

import(1208)]]
page.Label({
	Text = "Syntax Preview",
	Center = true,
	Transparent = true
})
local l = page.Label({
	Text = "",
	Font = "Code"
})

local default = white
local function color(a)
	local r = math.floor(a.R * 255)
	local g = math.floor(a.G * 255)
	local b = math.floor(a.B * 255)
	return string.format("rgb(%s,%s,%s)", r, g, b)
end
local function fc(a)
	return "<font color='"..color(syntax["Syntax_"..a]).."'>"
end
local function preview()
	local a = code

	a = a:gsub("\t", "    ")

	a = a:gsub("_COMM", "</font>")
	a = a:gsub("COMM", fc("Comment"))

	a = a:gsub("_NUMB", "</font>")
	a = a:gsub("NUMB", fc("Number"))

	a = a:gsub("_STR", "</font>")
	a = a:gsub("STR", fc("String"))

	a = a:gsub("_CHAR", "</font>")
	a = a:gsub("CHAR", fc("Character"))

	a = a:gsub("_OP", "</font>")
	a = a:gsub("OP", fc("Operator"))

	a = a:gsub("_KW", "</font>")
	a = a:gsub("KW", fc("Keywords"))

	a = a:gsub("_GLOB", "</font>")
	a = a:gsub("GLOB", fc("Globals"))

	a = a:gsub("_FUNC", "</font>")
	a = a:gsub("FUNC", fc("Functions"))

	a = a:gsub("_ENUM", "</font>")
	a = a:gsub("ENUM", fc("Enums"))
	
	a = a:gsub("_SW", "</font>")
	a = a:gsub("SW", fc("Logic"))

	a = a:gsub("_BOOL", "</font>")
	a = a:gsub("BOOL", fc("Metamethods"))

	a = a:gsub("_META", "</font>")
	a = a:gsub("META", fc("SWFunctions"))

	a = a:gsub("_CUST", "</font>")
	a = a:gsub("CUST", fc("Custom"))

	a = a:gsub("_DEF", "</font>")
	a = a:gsub("DEF", "<font color='"..color(default).."'>")

	l:SetText(a)
end
preview()
page.Button({
	Text = "Refresh Preview",
	Callback = preview
})
page.ColorPicker({
	Text = "Preview Background Color",
	Callback = function(value)
		l.Object.BackgroundColor3 = value
	end,
	Def = Color3.fromRGB(50, 50, 50)
})
page.ColorPicker({
	Text = "Preview Text Color",
	Callback = function(value)
		default = value
		preview()
	end,
	Def = white
})

page.Button({
	Text = "Copy Syntax JSON",
	Callback = function()
		local t = {}
		for i,v in next, syntax do
			t[i] = string.format("%s, %s, %s", math.floor(v.R * 255), math.floor(v.G * 255), math.floor(v.B * 255))
		end
		local json = http:JSONEncode(t)
		json = json:gsub("%{", "{\n") -- Add new lines after the opening curly bracket
		json = json:gsub("%}", "\n}") -- Add new lines before the closing curly bracket
		json = json:gsub('"(Syntax_)', '\t"Syntax_') -- Add indents before every key
		json = json:gsub(":", ": ") -- Add a space after every colon
		json = json:gsub('("),', '",\n') -- Add new lines after every key
		setclipboard(json)
		UI.Banner("Copied to your clipboard!")
	end
})

page.TextBox({
	Text = "Paste your entire theme JSON here to load it",
	Callback = function(value)
		if value:gsub(" ", "") == "" then return end
		local suc, theme = pcall(function()
			return http:JSONDecode(value:gsub("[\n\t]", ""))
		end)
		if not suc then
			UI.Banner("Can't parse JSON")
		end

		local function modify(name)
			name = "Syntax_"..name
			local c = theme[name]
			if c then
				c = c:gsub(" ", ""):split(",")
				local Color = Color3.fromRGB(tonumber(c[1]), tonumber(c[2]), tonumber(c[3]))
				syntax[name] = Color or white
				ui[name]:SetColor(Color)
			end
		end

		for _,v in next, {"Comment", "Number", "String", "Character", "Operator", "Keywords", "Globals", "Functions", "Enums", "Logic", "Metamethods", "SWFunctions", "Custom"} do
			modify(v)
		end
		preview()
	end
})
