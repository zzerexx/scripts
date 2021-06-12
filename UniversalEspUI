-- my universal esp script but with a ui
-- ui lib made by twink marie
if not getgenv().EspSettings then
	getgenv().EspSettings = {
		TeamCheck = true,
		Boxes = {
			Enabled = true,
			Transparency = 0.7,
			Color = Color3.fromRGB(255,0,0),
			UseTeamColor = true,
		},
		Tracers = {
			Enabled = true,
			Transparency = 0.7,
			Color = Color3.fromRGB(255,0,0),
			UseTeamColor = true,
			Origin = "Top",
			Thickness = 1
		},
		Names = {
			Enabled = true,
			Transparency = 0.7,
			Color = Color3.fromRGB(255,0,0),
			UseTeamColor = true,
			Font = Drawing.Fonts.UI,
			Size = 18,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
			ShowDistance = false,
			ShowHealth = false,
		}
	} -- v1.0.2
	loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEsp.lua"))()
end

local http = game:GetService("HttpService")
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local UI = Material.Load({
	Title = "Universal ESP",
	Style = 3,
	SizeX = 350,
	SizeY = 235,
	Theme = "Dark"
})

local Boxes = UI.New({
	Title = "Boxes"
})
local Tracers = UI.New({
	Title = "Tracers"
})
local Names = UI.New({
	Title = "Names"
})
local Other = UI.New({
	Title = "Other"
})
--[[local Config = UI.New({
	Title = "Configuration"
})]]

local ss = getgenv().EspSettings

local ui = {
	Boxes = {
		Enabled,
		Transparency,
		Color,
		UseTeamColor
	},
	Tracers = {
		Enabled,
		Transparency,
		Color,
		UseTeamColor,
		Origin,
		Thickness
	},
	Names = {
		Enabled,
		Transparency,
		Color,
		UseTeamColor,
		Font,
		Size,
		Outline,
		OutlineColor,
		ShowDistance,
		ShowHealth
	},
	Other = {
		TeamCheck
	}
}

ui.Boxes.Enabled = Boxes.Toggle({
	Text = "Enabled",
	Callback = function(value)
		ss.Boxes.Enabled = value
	end,
	Enabled = true
})
ui.Boxes.Transparency = Boxes.Slider({
	Text = "Transparency",
	Callback = function(value)
		ss.Boxes.Transparency = value / 10
	end,
	Min = 0,
	Max = 10,
	Def = 7
})
ui.Boxes.Color = Boxes.ColorPicker({
	Text = "Color",
	Default = Color3.fromHSV(1,1,1),
	Callback = function(value)
		ss.Boxes.Color = value
	end,
})
ui.Boxes.UseTeamColor = Boxes.Toggle({
	Text = "Use Team Color",
	Callback = function(value)
		ss.Boxes.UseTeamColor = value
	end,
	Enabled = true
})

ui.Tracers.Enabled = Tracers.Toggle({
	Text = "Enabled",
	Callback = function(value)
		ss.Tracers.Enabled = value
	end,
	Enabled = true
})
ui.Tracers.Transparency = Tracers.Slider({
	Text = "Transparency",
	Callback = function(value)
		ss.Tracers.Transparency = value / 10
	end,
	Min = 0,
	Max = 10,
	Def = 7
})
ui.Tracers.Color = Tracers.ColorPicker({
	Text = "Color",
	Default = Color3.fromHSV(1,1,1),
	Callback = function(value)
		ss.Tracers.Color = value
	end,
})
ui.Tracers.UseTeamColor = Tracers.Toggle({
	Text = "Use Team Color",
	Callback = function(value)
		ss.Tracers.UseTeamColor = value
	end,
	Enabled = true
})
ui.Tracers.Origin = Tracers.Dropdown({
	Text = "Origin",
	Callback = function(value)
		ss.Tracers.Origin = value
	end,
	Options = {"Top","Center","Bottom","Mouse"}
})
ui.Tracers.Thickness = Tracers.Slider({
	Text = "Thickness",
	Callback = function(value)
		ss.Tracers.Thickness = value
	end,
	Min = 1,
	Max = 5,
	Def = 1
})

ui.Names.Enabled = Names.Toggle({
	Text = "Enabled",
	Callback = function(value)
		ss.Names.Enabled = value
	end,
	Enabled = true
})
ui.Names.Transparency = Names.Slider({
	Text = "Transparency",
	Callback = function(value)
		ss.Names.Transparency = value / 10
	end,
	Min = 0,
	Max = 10,
	Def = 7
})
ui.Names.Color = Names.ColorPicker({
	Text = "Color",
	Default = Color3.fromHSV(1,1,1),
	Callback = function(value)
		ss.Names.Color = value
	end,
})
ui.Names.UseTeamColor = Names.Toggle({
	Text = "Use Team Color",
	Callback = function(value)
		ss.Names.UseTeamColor = value
	end,
	Enabled = true
})
ui.Names.Font = Names.Dropdown({
	Text = "Text Font",
	Callback = function(value)
		ss.Names.Font = Drawing.Fonts[value]
	end,
	Options = {"UI","System","Plex","Monospace"}
})
ui.Names.Size = Names.Slider({
	Text = "Text Size",
	Callback = function(value)
		ss.Names.Size = value
	end,
	Min = 0,
	Max = 32,
	Def = 18
})
ui.Names.Outline = Names.Toggle({
	Text = "Outline",
	Callback = function(value)
		ss.Names.Outline = value
	end,
	Enabled = true
})
ui.Names.OutlineColor = Names.ColorPicker({
	Text = "Outline Color",
	Default = Color3.fromHSV(0,0,0),
	Callback = function(value)
		ss.Names.OutlineColor = value
	end,
})
ui.Names.ShowDistance = Names.Toggle({
	Text = "Show Distance",
	Callback = function(value)
		ss.Names.ShowDistance = value
	end,
	Enabled = false
})
ui.Names.ShowHealth = Names.Toggle({
	Text = "Show Health",
	Callback = function(value)
		ss.Names.ShowHealth = value
	end,
	Enabled = false
})

ui.Other.TeamCheck = Other.Toggle({
	Text = "Team Check",
	Callback = function(value)
		ss.TeamCheck = value
	end,
	Enabled = true
})

--[[ config stuff
function Banner(text)
	UI.Banner({
		Text = text
	})
end
function RefreshList(dropdown)
	if isfolder("EspConfigs") then
		local t = {}
		for i,v in next, listfiles("EspConfigs") do
			if v ~= "DefaultConfig.txt" then
				table.insert(t,v:split("\\")[2]:split(".")[1])
			end
		end
		dropdown:SetOptions(t)
	end
end
function LoadConfig(name)
	if isfile("EspConfigs\\"..name..".json") then
		local data = http:JSONDecode(readfile("EspConfigs\\"..name..".json"))
		for i,v in next, data do
			if typeof(v) == "table" then
				for i2,v2 in next, v do
					ss[i][i2] = v2
				end
			else
				ss[i] = v
			end
		end
		ui.Boxes.Enabled:SetState(data.Boxes.Enabled)
		local BoxesColor = data.Boxes.Color:split(", ")
		ui.Boxes.Color:SetColor(Color3.fromHSV(tonumber(BoxesColor[1]),tonumber(BoxesColor[2]),tonumber(BoxesColor[3])))
		ui.Boxes.UseTeamColor:SetState(data.Boxes.UseTeamColor)
		ui.Tracers.Enabled:SetState(data.Tracers.Enabled)
		local TracersColor = data.Tracers.Color:split(", ")
		ui.Tracers.Color:SetColor(Color3.fromHSV(tonumber(TracersColor[1]),tonumber(TracersColor[2]),tonumber(TracersColor[3])))
		ui.Tracers.UseTeamColor:SetState(data.Tracers.UseTeamColor)
		ui.Names.Enabled:SetState(data.Names.Enabled)
		local NamesColor = data.Names.Color:split(", ")
		ui.Names.Color:SetColor(Color3.fromHSV(tonumber(NamesColor[1]),tonumber(NamesColor[2]),tonumber(NamesColor[3])))
		ui.Names.UseTeamColor:SetState(data.Names.UseTeamColor)
		ui.Names.Outline:SetState(data.Names.Outline)
		local NamesOutlineColor = data.Names.Color:split(", ")
		ui.Names.OutlineColor:SetColor(Color3.fromHSV(tonumber(NamesOutlineColor[1]),tonumber(NamesOutlineColor[2]),tonumber(NamesOutlineColor[3])))
		ui.Names.ShowDistance:SetState(data.Names.ShowDistance)
		ui.Names.ShowHealth:SetState(data.Names.ShowHealth)
		ui.Other.TeamCheck:SetState(data.Other.TeamCheck)
	end
end
function SaveConfig(name)
	local data = ss
	data.Boxes.Color = tostring(ss.Boxes.Color)
	data.Tracers.Color = tostring(ss.Tracers.Color)
	data.Names.Color = tostring(ss.Names.Color)
	data.Names.OutlineColor = tostring(ss.Names.OutlineColor)
	data = http:JSONEncode(data)
	if not isfolder("EspConfigs") then
		makefolder("EspConfigs")
	end
	writefile("EspConfigs\\"..name..".json",data)
	Banner("Saved Configuration: "..name)
end
local SelectedConfig = nil
local ConfigList
local ConfigName = "Untitled"
ConfigList = Config.Dropdown({
	Text = "Your Configs",
	Callback = function(value)
		SelectedConfig = value
	end,
	Options = {}
})
RefreshList(ConfigList)
Config.Button({
	Text = "Load Config",
	Callback = function()
		if SelectedConfig ~= nil then
			LoadConfig(SelectedConfig)
		end
	end
})
Config.Button({
	Text = "Refresh List",
	Callback = function()
		RefreshList(ConfigList)
	end
})
Config.TextField({
	Text = "Config Name",
	Type = "Default",
	Callback = function(value)
		ConfigName = value
	end
})
Config.Button({
	Text = "Save Config",
	Callback = function()
		SaveConfig(ConfigName)
	end
})
]]
