repeat
	task.wait(0.5)
until not UAIM_LOADING
getgenv().UESP_LOADING = true
if not EspSettings then
	getgenv().EspSettings = {
		TeamCheck = false,
		ToggleKey = "RightAlt",
		RefreshRate = 10, -- how fast the esp updates (milliseconds)
		MaximumDistance = 500, -- only renders players within this distance
		FaceCamera = false, -- Makes esp appear 2D
		AlignPoints = false, -- Improves 2D effect; only works while FaceCamera is enabled
		-- AlignPoints: This may cause esp to have abnormal behavior when looking from certain angles
		MouseVisibility = {
			Enabled = true, -- makes any drawing objects transparent when they are near your mouse
			Radius = 60,
			Transparency = 0.3,
			Selected = { -- set any of these to false to ignore them
				Boxes = true,
				Tracers = true,
				Names = true,
				Skeletons = true,
				HealthBars = true,
				HeadDots = true,
				LookTracers = true
			}
		},
		Highlights = {
			Enabled = false,
			Players = {}, -- put player usernames into this table to 'highlight' them
			Transparency = 1,
			Color = Color3.fromRGB(255, 150, 0),
			AlwaysOnTop = true
		},
		NPC = {
			Color = Color3.fromRGB(150,150,150),
			Transparency = 1,
			RainbowColor = false,
			Overrides = {
				Boxes = true,
				Tracers = true,
				Names = true,
				Skeletons = true,
				HealthBars = true,
				HeadDots = true,
				LookTracers = true
			}
		},
		Boxes = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			RainbowColor = false,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
			OutlineThickness = 3,
			Thickness = 1
		},
		Tracers = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			RainbowColor = false,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
			OutlineThickness = 3,
			Origin = "Top", -- "Top" or "Center" or "Bottom" or "Mouse"
			Thickness = 1
		},
		Names = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			RainbowColor = false,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
			Font = Drawing.Fonts.UI, -- UI or System or Plex or Monospace
			Size = 18,
			ShowDistance = false,
			ShowHealth = true,
			UseDisplayName = false,
			DistanceDataType = "m", -- what it says after the distance (ex. 100m)
			HealthDataType = "Percentage" -- "Percentage" or "Value"
		},
		Skeletons = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			RainbowColor = false,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
			OutlineThickness = 3,
			Thickness = 1
		},
		HealthBars = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(0,255,0),
			UseTeamColor = true,
			RainbowColor = false,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
			OutlineThickness = 3,
			Origin = "None", -- "None" or "Left" or "Right"
			OutlineBarOnly = true
		},
		HeadDots = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			RainbowColor = false,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
			OutlineThickness = 3,
			Thickness = 1,
			Filled = false,
			Scale = 1
		},
		LookTracers = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			RainbowColor = false,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
			OutlineThickness = 3,
			Thickness = 1,
			Length = 5
		}
	}
end

if UESP then
	return
end
getgenv().OldInstance = nil
getgenv().EspSettings.Names.OutlineThickness = 0 -- prevent error

local function Load(file)
	return loadstring(game:HttpGet(string.format("https://raw.githubusercontent.com/zzerexx/scripts/main/%s.lua", file)))()
end

local UI
--[[ old icons
local icons = {
	['UI'] = "https://i.imgur.com/xW3CaYL.png",
	['Boxes'] = "https://i.imgur.com/c62mH5p.png",
	['Tracers'] = "https://i.imgur.com/MSNjSVv.png",
	['Names'] = "https://i.imgur.com/HLiXuos.png",
	['Skeletons'] = "https://i.imgur.com/kzwPzjl.png",
	['Health Bars'] = "https://i.imgur.com/nD3lltT.png",
	['Head Dots'] = "https://i.imgur.com/HGAgY9G.png",
	['Look Tracers'] = "https://i.imgur.com/XZqC7pF.png",
	['All'] = "https://i.imgur.com/JRo82rH.png",
	['Mouse Visibility'] = "https://i.imgur.com/3FKHkB8.png",
	['Other'] = "https://i.imgur.com/Lwl0iV7.png",
	['Configs'] = "https://i.imgur.com/bcuIP5f.png",
	['Players'] = "https://i.imgur.com/EB8OOKv.png",
	['NPC'] = "",
	['Statistics'] = "https://i.imgur.com/X0IblqN.png",
	['Feedback'] = "https://i.imgur.com/FYbAIod.png"
}]]
local icons = {
	['UI'] = "https://i.imgur.com/xW3CaYL.png",
	['Boxes'] = "https://i.imgur.com/xSNPrjN.png",
	['Tracers'] = "https://i.imgur.com/oshO9nY.png",
	['Names'] = "https://i.imgur.com/dtVPsyX.png",
	['Skeletons'] = "https://i.imgur.com/HL57Z76.png",
	['Health Bars'] = "https://i.imgur.com/cPnbeKo.png",
	['Head Dots'] = "https://i.imgur.com/AWvYuRI.png",
	['Look Tracers'] = "https://i.imgur.com/GSBE57c.png",
	['All'] = "https://i.imgur.com/ChRDF9E.png",
	['Mouse Visibility'] = "https://i.imgur.com/YtB9EMq.png",
	['Other'] = "https://i.imgur.com/2HCDHHU.png",
	['Configs'] = "https://i.imgur.com/AAiWa00.png",
	['Players'] = "https://i.imgur.com/rSSostV.png",
	['NPC'] = "https://i.imgur.com/vnQqvnZ.png",
	['Statistics'] = "https://i.imgur.com/l12YZmJ.png",
	['Feedback'] = "https://i.imgur.com/rnLY3CC.png"
}
for i,v in next, icons do
	local folder = "UESP_Icons"
	if not isfolder("UESP_Icons") then
		makefolder("UESP_Icons")
	end
	local path = folder.."\\"..i..".png"
	if not isfile(path) then
		writefile(path, game:HttpGet(v))
	end
end

function page(title)
	return UI.new({Title = title, ImageId = "UESP_Icons\\"..title..".png", ImageSize = Vector2.new(20, 20)})
end

local version = "v1.6.12"
local esp = Load("UniversalEsp")
local cfg = Load("ConfigManager")
local Material = Load("MaterialLuaRemake")
UI = Material.Load({
	Title = "Universal Esp",
	SubTitle = "zzerexx was here",
	Icon = "UESP_Icons\\UI.png",
	ShowInNavigator = true,
	Style = 3,
	SizeX = 400,
	SizeY = 535,
	Theme = "Dark"
})
local players = game:GetService("Players")

local Boxes = page("Boxes")
local Tracers = page("Tracers")
local Names = page("Names")
local Skeletons = page("Skeletons")
local HealthBars = page("Health Bars")
local HeadDots = page("Head Dots")
local LookTracers = page("Look Tracers")
local All = page("All")
local MouseVisibility = page("Mouse Visibility")
local Other = page("Other")
local Configs = page("Configs")
local Players = page("Players")
local NPC = page("NPC")
local Stats = page("Statistics")
local Feedback = page("Feedback")
local ss = getgenv().EspSettings
local loaded = false
local conn1,conn2,conn3,conn4
local cfgname,selectedcfg = "",""
local addtonew = true
local togglekey = Enum.KeyCode.RightControl
local esptogglebtn, uitogglebtn

local newsettings = {
	FaceCamera = false,
	AlignPoints = false,
	HealthBars = {
		Origin = "None",
		OutlineBarOnly = true
	},
	HeadDots = {
		Scale = 1
	},
	Highlights = {
		Enabled = false,
		Players = {},
		Transparency = 1,
		Color = Color3.fromRGB(255, 150, 0),
		AlwaysOnTop = true
	},
	NPC = {
		Color = Color3.fromRGB(150,150,150),
		Transparency = 1,
		RainbowColor = false,
		Overrides = {
			Boxes = true,
			Tracers = true,
			Names = true,
			Skeletons = true,
			HealthBars = true,
			HeadDots = true,
			LookTracers = true
		}
	},
}
for i,v in next, newsettings do
	if ss[i] == nil then
		ss[i] = v
	end
	if typeof(v) == "table" then
		for i2,v2 in next, v do
			if ss[i][i2] == nil then
				ss[i][i2] = v2
			end
		end
	end
end

local function save(a)
	cfg.Save(a, {
		settings = ss,
		ui = {
			ToggleKey = togglekey.Name,
			AddToNew = addtonew
		}
	})
end
local function load(a)
	local settings = ((a.Data ~= nil and a.Data.settings ~= nil and a.Data.settings) or a.settings ~= nil and a.settings) or a
	for i,v in next, settings do
		if typeof(v) == "table" then
			for i2,v2 in next, v do
				esp:Set(i, i2, v2)
			end
		else
			esp:Set("Other", i, v)
		end
	end
	task.spawn(function()
		repeat task.wait(0.25) until esptogglebtn ~= nil and uitogglebtn ~= nil
		local key = settings.ToggleKey
		esptogglebtn:SetBind((typeof(key) == "EnumItem" and key) or Enum.KeyCode[key])
		if a.Data ~= nil and a.Data.ui ~= nil then
			local b,c = a.Data.ui.ToggleKey, a.Data.ui.AddToNew
			if b then
				togglekey = Enum.KeyCode[b]
				uitogglebtn:SetBind(togglekey)
			end
			if c then
				addtonew = c
			end
		end
	end)
end

cfg.Init("UESP", {
	settings = ss,
	ui = {
		ToggleKey = togglekey.Name,
		AddToNew = addtonew
	}
}, load)

function destroy()
	conn1:Disconnect()
	conn2:Disconnect()
	conn3:Disconnect()
	conn4:Disconnect()
	esp:Destroy()
	UI:Destroy()
	getgenv().UESP = nil
end
local script = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEspUI.lua"))
function reload(safemode)
	destroy()
	task.wait(0.5)
	if safemode then
		pcall(script)
	else
		script()
	end
end

do -- Boxes
	local type = "Boxes"
	local s = ss[type]
	Boxes.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled
	})
	Boxes.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set(type, "Transparency", value)
		end,
		Min = 0,
		Max = 1,
		Def = s.Transparency,
		Decimals = 2
	})
	Boxes.ColorPicker({
		Text = "Color",
		Default = s.Color,
		Callback = function(value)
			esp:Set(type, "Color", value)
		end
	})
	Boxes.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set(type, "UseTeamColor", value)
		end,
		Enabled = s.UseTeamColor
	})
	Boxes.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set(type, "RainbowColor", value)
		end,
		Enabled = s.RainbowColor
	})
	Boxes.Toggle({
		Text = "Outline",
		Callback = function(value)
			esp:Set(type, "Outline", value)
		end,
		Enabled = s.Outline
	})
	Boxes.ColorPicker({
		Text = "Outline Color",
		Default = s.OutlineColor,
		Callback = function(value)
			esp:Set(type, "OutlineColor", value)
		end
	})
	Boxes.Slider({
		Text = "Outline Thickness",
		Callback = function(value)
			esp:Set(type, "OutlineThickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.OutlineThickness,
		Decimals = 2,
		Suffix = " px"
	})
	Boxes.Slider({
		Text = "Thickness",
		Callback = function(value)
			esp:Set(type, "Thickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.Thickness,
		Decimals = 2,
		Suffix = " px"
	})
end

do -- Tracers
	local type = "Tracers"
	local s = ss[type]
	Tracers.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled
	})
	Tracers.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set(type, "Transparency", value)
		end,
		Min = 0,
		Max = 1,
		Def = s.Transparency,
		Decimals = 2
	})
	Tracers.ColorPicker({
		Text = "Color",
		Default = s.Color,
		Callback = function(value)
			esp:Set(type, "Color", value)
		end
	})
	Tracers.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set(type, "UseTeamColor", value)
		end,
		Enabled = s.UseTeamColor
	})
	Tracers.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set(type, "RainbowColor", value)
		end,
		Enabled = s.RainbowColor
	})
	Tracers.Toggle({
		Text = "Outline",
		Callback = function(value)
			esp:Set(type, "Outline", value)
		end,
		Enabled = s.Outline
	})
	Tracers.ColorPicker({
		Text = "Outline Color",
		Default = s.OutlineColor,
		Callback = function(value)
			esp:Set(type, "OutlineColor", value)
		end
	})
	Tracers.Slider({
		Text = "Outline Thickness",
		Callback = function(value)
			esp:Set(type, "OutlineThickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.OutlineThickness,
		Decimals = 2,
		Suffix = " px"
	})
	Tracers.Dropdown({
		Text = "Origin",
		Callback = function(value)
			esp:Set(type, "Origin", value)
		end,
		Options = {"Top","Center","Bottom","Mouse"},
		Def = s.Origin
	})
	Tracers.Slider({
		Text = "Thickness",
		Callback = function(value)
			esp:Set(type, "Thickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.Thickness,
		Decimals = 2,
		Suffix = " px"
	})
end

do -- Names
	local type = "Names"
	local s = ss[type]
	Names.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled
	})
	Names.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set(type, "Transparency", value)
		end,
		Min = 0,
		Max = 1,
		Def = s.Transparency,
		Decimals = 2
	})
	Names.ColorPicker({
		Text = "Color",
		Default = s.Color,
		Callback = function(value)
			esp:Set(type, "Color", value)
		end
	})
	Names.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set(type, "UseTeamColor", value)
		end,
		Enabled = s.UseTeamColor
	})
	Names.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set(type, "RainbowColor", value)
		end,
		Enabled = s.RainbowColor
	})
	Names.Toggle({
		Text = "Outline",
		Callback = function(value)
			esp:Set(type, "Outline", value)
		end,
		Enabled = s.Outline
	})
	Names.ColorPicker({
		Text = "Outline Color",
		Default = s.OutlineColor,
		Callback = function(value)
			esp:Set(type, "OutlineColor", value)
		end
	})
	local def
	for i,v in next, Drawing.Fonts do
		if v == s.Font then
			def = i
		end
	end
	Names.Dropdown({
		Text = "Font",
		Callback = function(value)
			esp:Set(type, "Font", Drawing.Fonts[value])
		end,
		Options = {"UI","System","Plex","Monospace"},
		Def = def
	})
	Names.Slider({
		Text = "Text Size",
		Callback = function(value)
			esp:Set(type, "Size",value)
		end,
		Min = 1,
		Max = 32,
		Def = s.Size
	})
	Names.Toggle({
		Text = "Show Distance",
		Callback = function(value)
			esp:Set(type, "ShowDistance", value)
		end,
		Enabled = s.ShowDistance
	})
	Names.Toggle({
		Text = "Show Health",
		Callback = function(value)
			esp:Set(type, "ShowHealth", value)
		end,
		Enabled = s.ShowHealth
	})
	Names.Toggle({
		Text = "Use Display Name",
		Callback = function(value)
			esp:Set(type, "UseDisplayName", value)
		end,
		Enabled = s.UseDisplayName
	})
	Names.TextField({
		Text = "Distance Data Type",
		Type = "Default",
		Callback = function(value)
			esp:Set(type, "DistanceDataType", value)
		end,
		Menu = {
			Info = function()
				UI.Banner("This is the Distance measurement. For example, if this is 'studs' then it will show '100studs'")
			end
		}
	})
	Names.Dropdown({
		Text = "Health Data Type",
		Callback = function(value)
			esp:Set(type, "HealthDataType", value)
		end,
		Options = {
			"Percentage",
			"Value"
		},
		Def = s.HealthDataType,
		Menu = {
			Info = function()
				UI.Banner("This changes the format the health is shown in.\nPercentage: [ 100% ] | Value: [ 100/100 ]")
			end
		}
	})
end

do -- Skeletons
	local type = "Skeletons"
	local s = ss[type]
	Skeletons.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled
	})
	Skeletons.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set(type, "Transparency", value)
		end,
		Min = 0,
		Max = 1,
		Def = s.Transparency,
		Decimals = 2
	})
	Skeletons.ColorPicker({
		Text = "Color",
		Default = s.Color,
		Callback = function(value)
			esp:Set(type, "Color", value)
		end
	})
	Skeletons.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set(type, "UseTeamColor", value)
		end,
		Enabled = s.UseTeamColor
	})
	Skeletons.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set(type, "RainbowColor",value)
		end,
		Enabled = s.RainbowColor
	})
	Skeletons.Toggle({
		Text = "Outline",
		Callback = function(value)
			esp:Set(type, "Outline", value)
		end,
		Enabled = s.Outline
	})
	Skeletons.ColorPicker({
		Text = "Outline Color",
		Default = s.OutlineColor,
		Callback = function(value)
			esp:Set(type, "OutlineColor", value)
		end
	})
	Skeletons.Slider({
		Text = "Outline Thickness",
		Callback = function(value)
			esp:Set(type, "OutlineThickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.OutlineThickness,
		Decimals = 2,
		Suffix = " px"
	})
	Skeletons.Slider({
		Text = "Thickness",
		Callback = function(value)
			esp:Set(type, "Thickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.Thickness,
		Decimals = 2,
		Suffix = " px"
	})
end

do -- HealthBars
	local type = "HealthBars"
	local s = ss[type]
	HealthBars.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled
	})
	HealthBars.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set(type, "Transparency", value)
		end,
		Min = 0,
		Max = 1,
		Def = s.Transparency,
		Decimals = 2
	})
	HealthBars.ColorPicker({
		Text = "Color",
		Default = s.Color,
		Callback = function(value)
			esp:Set(type, "Color", value)
		end
	})
	HealthBars.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set(type, "UseTeamColor", value)
		end,
		Enabled = s.UseTeamColor
	})
	HealthBars.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set(type, "RainbowColor", value)
		end,
		Enabled = s.RainbowColor
	})
	HealthBars.Toggle({
		Text = "Outline",
		Callback = function(value)
			esp:Set(type, "Outline", value)
		end,
		Enabled = s.Outline
	})
	HealthBars.ColorPicker({
		Text = "Outline Color",
		Default = s.OutlineColor,
		Callback = function(value)
			esp:Set(type, "OutlineColor", value)
		end
	})
	HealthBars.Slider({
		Text = "Outline Thickness",
		Callback = function(value)
			esp:Set(type, "OutlineThickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.OutlineThickness,
		Decimals = 2,
		Suffix = " px"
	})
	HealthBars.Dropdown({
		Text = "Origin",
		Callback = function(value)
			esp:Set(type, "Origin", value)
		end,
		Options = {"None","Left","Right"},
		Def = s.Origin
	})
	HealthBars.Toggle({
		Text = "Outline Bar Only",
		Callback = function(value)
			esp:Set(type, "OutlineBarOnly", value)
		end,
		Enabled = s.OutlineBarOnly
	})
end

do -- HeadDots
	local type = "HeadDots"
	local s = ss[type]
	HeadDots.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled,
		Menu = {
			Info = function()
				UI.Banner("This works best on 70 camera fov! Anything higher can make the circle look larger when closer to the player.")
			end
		}
	})
	HeadDots.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set(type, "Transparency", value)
		end,
		Min = 0,
		Max = 1,
		Def = s.Transparency,
		Decimals = 2
	})
	HeadDots.ColorPicker({
		Text = "Color",
		Default = s.Color,
		Callback = function(value)
			esp:Set(type, "Color", value)
		end
	})
	HeadDots.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set(type, "UseTeamColor", value)
		end,
		Enabled = s.UseTeamColor
	})
	HeadDots.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set(type, "RainbowColor", value)
		end,
		Enabled = s.RainbowColor
	})
	HeadDots.Toggle({
		Text = "Outline",
		Callback = function(value)
			esp:Set(type, "Outline", value)
		end,
		Enabled = s.Outline
	})
	HeadDots.ColorPicker({
		Text = "Outline Color",
		Default = s.OutlineColor,
		Callback = function(value)
			esp:Set(type, "OutlineColor", value)
		end
	})
	HeadDots.Slider({
		Text = "Outline Thickness",
		Callback = function(value)
			esp:Set(type, "OutlineThickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.OutlineThickness,
		Decimals = 2,
		Suffix = " px"
	})
	HeadDots.Slider({
		Text = "Thickness",
		Callback = function(value)
			esp:Set(type, "Thickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.Thickness,
		Decimals = 2,
		Suffix = " px"
	})
	HeadDots.Toggle({
		Text = "Filled",
		Callback = function(value)
			esp:Set(type, "Filled", value)
		end,
		Enabled = s.Filled
	})
	HeadDots.Slider({
		Text = "Scale",
		Callback = function(value)
			esp:Set(type, "Scale", value)
		end,
		Min = 0.5,
		Max = 2,
		Def = s.Scale,
		Decimals = 2,
		Suffix = "x"
	})
end

do -- LookTracers
	local type = "LookTracers"
	local s = ss[type]
	LookTracers.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled
	})
	LookTracers.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set(type, "Transparency", value)
		end,
		Min = 0,
		Max = 1,
		Def = s.Transparency,
		Decimals = 2
	})
	LookTracers.ColorPicker({
		Text = "Color",
		Default = s.Color,
		Callback = function(value)
			esp:Set(type, "Color", value)
		end
	})
	LookTracers.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set(type, "UseTeamColor", value)
		end,
		Enabled = s.UseTeamColor
	})
	LookTracers.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set(type, "RainbowColor", value)
		end,
		Enabled = s.RainbowColor
	})
	LookTracers.Toggle({
		Text = "Outline",
		Callback = function(value)
			esp:Set(type, "Outline", value)
		end,
		Enabled = s.Outline
	})
	LookTracers.ColorPicker({
		Text = "Outline Color",
		Default = s.OutlineColor,
		Callback = function(value)
			esp:Set(type, "OutlineColor", value)
		end
	})
	LookTracers.Slider({
		Text = "Outline Thickness",
		Callback = function(value)
			esp:Set(type, "OutlineThickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.OutlineThickness,
		Decimals = 2
	})
	LookTracers.Slider({
		Text = "Thickness",
		Callback = function(value)
			esp:Set(type, "Thickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.Thickness,
		Decimals = 2
	})
	LookTracers.Slider({
		Text = "Length",
		Callback = function(value)
			esp:Set(type, "Length", value)
		end,
		Min = 3,
		Max = 25,
		Def = s.Length,
		Suffix = " studs"
	})
end

do -- All
	All.Toggle({
		Text = "Enabled (All)",
		Callback = function(value)
			if loaded then
				esp:SetAll("Enabled", value)
			end
		end,
		Enabled = false,
		Menu = {
			Info = function()
				UI.Banner("Changes the 'Enabled' setting for all types.")
			end
		}
	})
	All.Slider({
		Text = "Transparency (All)",
		Callback = function(value)
			if loaded then
				esp:SetAll("Transparency", value)
			end
		end,
		Min = 0,
		Max = 1,
		Def = 1,
		Decimals = 2,
		Menu = {
			Info = function()
				UI.Banner("Changes the 'Transparency' setting for all types.")
			end
		}
	})
	All.ColorPicker({
		Text = "Color (All)",
		Default = Color3.fromRGB(255,255,255),
		Callback = function(value)
			if loaded then
				esp:SetAll("Color", value)
			end
		end,
		Menu = {
			Info = function()
				UI.Banner("Changes the 'Color' setting for all types.")
			end
		}
	})
	All.Toggle({
		Text = "Use Team Color (All)",
		Callback = function(value)
			if loaded then
				esp:SetAll("UseTeamColor", value)
			end
		end,
		Enabled = true,
		Menu = {
			Info = function()
				UI.Banner("Changes the 'Use Team Color' setting for all types.")
			end
		}
	})
	All.Toggle({
		Text = "Rainbow Color (All)",
		Callback = function(value)
			if loaded then
				esp:SetAll("RainbowColor", value)
			end
		end,
		Enabled = false,
		Menu = {
			Info = function()
				UI.Banner("Changes the 'RainbowColor' setting for all types.")
			end
		}
	})
	All.Toggle({
		Text = "Outline (All)",
		Callback = function(value)
			if loaded then
				esp:SetAll("Outline", value)
			end
		end,
		Enabled = true,
		Menu = {
			Info = function()
				UI.Banner("Changes the 'Outline' setting for all types.")
			end
		}
	})
	All.ColorPicker({
		Text = "Outline Color (All)",
		Default = Color3.fromRGB(0,0,0),
		Callback = function(value)
			if loaded then
				esp:SetAll("OutlineColor", value)
			end
		end,
		Menu = {
			Info = function()
				UI.Banner("Changes the 'OutlineColor' setting for all types.")
			end
		}
	})
	All.Slider({
		Text = "Outline Thickness (All)",
		Callback = function(value)
			if loaded then
				esp:SetAll("OutlineThickness", value)
			end
		end,
		Min = 1,
		Max = 5,
		Def = 3,
		Suffix = " px",
		Menu = {
			Info = function()
				UI.Banner("Changes the 'OutlineThickness' setting for all types. (except for Names)")
			end
		}
	})
end

do -- MouseVisibility
	local type = "MouseVisibility"
	local s = ss[type]
	MouseVisibility.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled,
		Menu = {
			Info = function()
				UI.Banner("Makes any drawing objects transparent when they are near your mouse.")
			end
		}
	})
	MouseVisibility.Slider({
		Text = "Radius",
		Callback = function(value)
			esp:Set(type, "Radius", value)
		end,
		Min = 10,
		Max = 150,
		Def = s.Radius,
		Suffix = " px"
	})
	MouseVisibility.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set(type, "Transparency", value)
		end,
		Min = 0,
		Max = 1,
		Def = s.Transparency,
		Decimals = 2
	})
	local selected = s.Selected
	MouseVisibility.ChipSet({
		Text = "Selected",
		Callback = function(value)
			esp:Set(type, "Selected", value)
		end,
		Options = {
			Boxes = selected.Boxes,
			Tracers = selected.Tracers,
			Names = selected.Names,
			Skeletons = selected.Skeletons,
			HealthBars = selected.HealthBars,
			HeadDots = selected.HeadDots,
			LookTracers = selected.LookTracers
		}
	})
end

do -- Other
	local type = "Other"
	Other.Toggle({
		Text = "Team Check",
		Callback = function(value)
			esp:Set(type, "TeamCheck", value)
		end,
		Enabled = ss.TeamCheck
	})
	esptogglebtn = Other.Keybind({
		Text = "Esp Toggle Key",
		Callback = function(value)
			esp:Set(type, "ToggleKey", value.Name)
		end,
		Def = Enum.KeyCode[esp:Get("Other", "ToggleKey")],
		AllowMouse = false
	})
	Other.Slider({
		Text = "Refresh Rate",
		Callback = function(value)
			esp:Set(type, "RefreshRate", value)
		end,
		Min = 0,
		Max = 50,
		Def = ss.RefreshRate,
		Suffix = " ms",
		Menu = {
			Info = function()
				UI.Banner("How fast the esp updates. This is in milliseconds.")
			end
		}
	})
	Other.Slider({
		Text = "Maximum Distance",
		Callback = function(value)
			esp:Set(type, "MaximumDistance", value)
		end,
		Min = 50,
		Max = 2000,
		Def = ss.MaximumDistance,
		Suffix = " studs"
	})
	Other.Toggle({
		Text = "Face Camera",
		Callback = function(value)
			esp:Set(type, "FaceCamera", value)
		end,
		Enabled = ss.FaceCamera,
		Menu = {
			Info = function()
				UI.Banner("Makes Boxes and Health Bars appear 2D.")
			end
		}
	})
	Other.Toggle({
		Text = "Align Points",
		Callback = function(value)
			esp:Set(type, "AlignPoints", value)
		end,
		Enabled = ss.AlignPoints,
		Menu = {
			Info = function()
				UI.Banner("Further improves 2D effect. Only works while 'Face Camera' is enabled.\nNote that this may cause esp to have abnormal behavior when looking from certain angles.")
			end
		}
	})
	Other.Button({
		Text = "Destroy Esp",
		Callback = destroy,
		Menu = {
			Info = function()
				UI.Banner("This will completely remove Universal Esp, including the UI.")
			end
		}
	})
	Other.Button({
		Text = "Load Performance Version",
		Callback = function()
			UI.Banner({
				Text = "Are you sure you want to load the Performance version?",
				Callback = function(value)
					if value == "Yes" then
						destroy()
						loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEspPerformance.lua"))()
					end
				end,
				Options = {"Yes", "No"}
			})
		end,
		Menu = {
			Info = function()
				UI.Banner("This will replace the current esp with an optimized version made for performance which can offer more fps. Note that this version does NOT have any customizability.")
			end
		}
	})
	Other.Button({
		Text = "Re-Load UI",
		Callback = function()
			UI.Banner({
				Text = "Are you sure you want to re-load the UI?",
				Callback = function(value)
					if value == "Yes" then
						reload()
					end
				end,
				Options = {"Yes", "No"}
			})
		end
	})
	Other.Button({
		Text = "Load Safe Mode",
		Callback = function()
			UI.Banner({
				Text = "Are you sure you want to load the UI in Safe Mode?",
				Callback = function(value)
					if value == "Yes" then
						reload(true)
					end
				end,
				Options = {"Yes", "No"}
			})
		end,
		Menu = {
			Info = function()
				UI.Banner("Re-loads the ui in Safe Mode. (prevents detection via script errors)\nNote that this <b>does not</b> prevent <i>all</i> detections.")
			end
		}
	})
	uitogglebtn = Other.Keybind({
		Text = "UI Toggle Key",
		Callback = function(value)
			togglekey = value
		end,
		Def = togglekey,
		AllowMouse = false
	})
	Other.Button({
		Text = "Hide UI",
		Callback = function()
			UI.Toggle(false)
		end
	})
	Other.Label({
		Text = "Made by zzerexx#3970 | "..version,
		Center = true,
		Transparent = true
	})
end

do -- Configs
	local list
	local function isempty(s)
		return s:gsub(" ","") == ""
	end
	local function refresh()
		list:SetOptions(cfg.Get())
	end

	Configs.TextField({
		Text = "Config Name",
		Type = "Default",
		Callback = function(value)
			if not isempty(value) then
				cfgname = value
			end
		end
	})
	Configs.Button({
		Text = "Create New Config",
		Callback = function()
			if not isempty(cfgname) then
				save(cfgname)
				UI.Banner("Successfully created: "..cfgname)
				refresh()
			else
				UI.Banner("Please enter a name for your config in the text box above.")
			end 
		end
	})
	list = Configs.Dropdown({
		Text = "Your Configs",
		Callback = function(value)
			selectedcfg = value
		end,
		Options = {},
		Def = "Default"
	})
	refresh()
	Configs.Button({
		Text = "Load Selected Config",
		Callback = function()
			cfg.Load(selectedcfg, load)
		end,
		Menu = {
			Info = function()
				UI.Banner("Your settings will not apply to the UI. (cuz im lazy)")
			end
		}
	})
	Configs.Button({
		Text = "Overwrite Selected Config",
		Callback = function()
			save(selectedcfg)
			UI.Banner("Successfully overwritten: "..selectedcfg)
		end
	})
	Configs.Button({
		Text = "Delete Selected Config",
		Callback = function()
			if cfg.Valid(selectedcfg) then
				cfg.Delete(selectedcfg)
				UI.Banner("Successfully deleted: "..selectedcfg)
				refresh()
			else
				UI.Banner(selectedcfg.." does not exist.")
			end
		end
	})
	Configs.Button({
		Text = "Set Selected Config as Default",
		Callback = function()
			cfg.SetDefault(selectedcfg)
		end,
		Menu = {
			Info = function()
				UI.Banner("This will overwrite your current default config!")
			end
		}
	})
	Configs.Button({
		Text = "Refresh Config List",
		Callback = refresh
	})
end

do -- Players
	local plr = players.LocalPlayer.Name
	local dd = Players.Dropdown({
		Text = "Player List",
		Callback = function(value)
			plr = value
		end,
		Options = {},
		Def = players.LocalPlayer.Name
	})
	local function update()
		local t = {}
		for _,v in next, players:GetPlayers() do
			table.insert(t, v.Name)
		end
		table.sort(t, function(a,b)
			return a < b
		end)
		dd:SetOptions(t)
	end
	update()
	conn1 = players.PlayerAdded:Connect(update)
	conn2 = players.PlayerRemoving:Connect(update)

	Players.Label({
		Text = "━━ Esp Manager ━━",
		Center = true,
		Transparent = true
	})
	Players.Button({
		Text = "Add esp to the selected player",
		Callback = function()
			if not players:FindFirstChild(plr) then
				UI.Banner(plr.." is not in the game.")
				return
			end

			esp:Add(plr)
		end
	})
	Players.Button({
		Text = "Remove esp from the selected player",
		Callback = function()
			if not players:FindFirstChild(plr) then
				UI.Banner(plr.." is not in the game")
				return
			end

			esp:Remove(plr)
		end
	})
	Players.Button({
		Text = "Add esp to all players",
		Callback = function()
			for _,v in next, players:GetPlayers() do
				esp:Add(v)
			end
		end
	})
	Players.Button({
		Text = "Remove esp from all players",
		Callback = function()
			for _,v in next, players:GetPlayers() do
				esp:Remove(v)
			end
		end
	})
	Players.Toggle({
		Text = "Add esp to players upon joining",
		Callback = function(value)
			addtonew = value
		end,
		Enabled = true,
		Menu = {
			Info = function()
				UI.Banner("Adds esp to players when they join the game.")
			end
		}
	})

	local type = "Highlights"
	local s = ss[type]
	Players.Label({
		Text = "━━ Highlights ━━",
		Center = true,
		Transparent = true
	})
	Players.Toggle({
		Text = "Highlights",
		Callback = function(value)
			esp:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled
	})
	Players.Slider({
		Text = "Highlights: Transparency",
		Callback = function(value)
			esp:Set(type, "Transparency", value)
		end,
		Min = 0,
		Max = 1,
		Def = s.Transparency,
		Decimals = 2
	})
	Players.ColorPicker({
		Text = "Highlights: Color",
		Callback = function(value)
			esp:Set(type, "Color", value)
		end,
		Def = s.Color
	})
	Players.Toggle({
		Text = "Highlights: Always On Top",
		Callback = function(value)
			esp:Set(type, "AlwaysOnTop", value)
		end,
		Enabled = s.AlwaysOnTop
	})
	Players.Button({
		Text = "Highlight the selected player",
		Callback = function()
			if not players:FindFirstChild(plr) then
				UI.Banner(plr.." is not in the game.")
				return
			end

			local t = esp:Get("Highlights", "Players")
			if table.find(t, plr) then
				UI.Banner(plr.." is already highlighted")
				return
			end
			table.insert(t, plr)
			esp:Set("Highlights", "Players", t)
		end
	})
	Players.Button({
		Text = "Un-highlight the selected player",
		Callback = function()
			if not players:FindFirstChild(plr) then
				UI.Banner(plr.." is not in the game.")
				return
			end

			local t = esp:Get("Highlights", "Players")
			local index = table.find(t, plr)
			if not index then
				UI.Banner(plr.." is not highlighted")
				return
			end
			table.remove(t, index)
			esp:Set("Highlights", "Players", t)
		end
	})
end

do -- NPC
	local type = "NPC"
	local s = ss[type]

	NPC.Button({
		Text = "Add esp to all NPCs",
		Callback = function()
			for _,v in next, workspace:GetDescendants() do
				local model = v:FindFirstAncestorOfClass("Model")
				if v:IsA("Humanoid") and model and not players:GetPlayerFromCharacter(model) then
					esp:Add(model)
				end
			end
		end
	})
	NPC.Button({
		Text = "Remove esp from all NPCs",
		Callback = function()
			for _,v in next, workspace:GetDescendants() do
				local model = v:FindFirstAncestorOfClass("Model")
				if v:IsA("Humanoid") and model and not players:GetPlayerFromCharacter(model) then
					esp:Remove(model)
				end
			end
		end
	})

	NPC.ColorPicker({
		Text = "Color",
		Callback = function(value)
			esp:Set(type, "Color", value)
		end,
		Def = s.Color
	})
	NPC.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set(type, "Transparency", value)
		end,
		Min = 0,
		Max = 1,
		Def = s.Transparency,
		Decimals = 2
	})
	NPC.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set(type, "RainbowColor", value)
		end,
		Enabled = s.RainbowColor
	})
	local o = s.Overrides
	NPC.ChipSet({
		Text = "Overrides",
		Callback = function(value)
			esp:Set(type, "Overrides", value)
		end,
		Options = {
			Boxes = o.Boxes,
			Tracers = o.Tracers,
			Names = o.Names,
			Skeletons = o.Skeletons,
			HealthBars = o.HealthBars,
			HeadDots = o.HeadDots,
			LookTracers = o.LookTracers
		},
		Menu = {
			Info = function()
				UI.Banner("If a type is enabled, the options above will be used instead. Otherwise, it will use the corresponding type's option.")
			end
		}
	})
end

do -- Stats
	local stats = Stats.Table({
		Text = "Esp Statistics",
		Key = "Type",
		Value = "# of Objects",
		ShowInfo = true,
		Data = esp:GetTotalObjects()
	})
	Stats.Button({
		Text = "Update Statistics",
		Callback = function()
			stats:SetData(esp:GetTotalObjects())
		end
	})
end

do -- Feedback
	local url = "https://websec.services/send/628d301f5db848748d1e31b1"
	local script = "Esp"

	local Http = game:GetService("HttpService")
	local request = request or http_request or (http and http.request) or (syn and syn.request) or nil
	local errors = {
		[2] = "The feedback system is receiving too many requests at the moment.",
		[3] = "You are sending too many requests.",
		[4] = "Your message contains @everyone or @here.",
		[5] = "Your message contains a @user mention",
		[8] = "Your message contains a discord invite.",
		[11] = "Not receiving feedback at the moment."
	}
	if request then
		local msg = nil
		local sending = false
		local bug = false
		Feedback.TextBox({
			Text = "Your message here",
			Callback = function(value)
				msg = value
			end,
			ClearOnFocus = false
		})
		Feedback.Toggle({
			Text = "Is this a bug report?",
			Callback = function(value)
				bug = value
			end,
			Enabled = false
		})
		Feedback.Button({
			Text = "Send Feedback",
			Callback = function()
				if sending then UI.Banner("Please wait until your request has been completed.") end
				sending = true
				UI.Banner("Sending feedback...")

				local gameicon = Http:JSONDecode(game:HttpGet(string.format("https://thumbnails.roblox.com/v1/places/gameicons?placeIds=%s&size=128x128&format=Png&isCircular=false", game.PlaceId))).data[1].imageUrl

				local req = request({
					Url = url,
					Method = "POST",
					Headers = {
						['Content-Type'] = "application/json"
					},
					Body = Http:JSONEncode({
						content = "",
						embeds = {{
							title = string.format("Universal %s %s", script, bug and "Bug Report" or "Feedback"),
							description = string.format("`%s`", msg),
							timestamp = DateTime.now():ToIsoDate(),
							color = bug and 0xFF0000 or 0x00FFFF,
							image = {
								url = gameicon
							},
							author = {
								name = "Game: "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
								url = "https://roblox.com/games/"..game.PlaceId
							},
							footer = {
								text = "Exploit: <agent>"
							}
						}}
					})
				})

				if not req.Success then
					sending = false
					UI.Banner("Failed to send feedback; Request failed")
					return
				end
				
				--local status = Http:JSONDecode(req.Body).status
				--UI.Banner(status == 0 and "Thank you for your feedback!" or "Failed to send feedback")
				--UI.Banner((status == 10 and "Thank you for your feedback!") or ("Failed to send feedback;\n"..errors[status]))
				UI.Banner("Thank you for your feedback")
				sending = false
			end,
			Menu = {
				Info = function()
					UI.Banner("Sending feedback will also send the following information:\n- The name of the game that you're in\n- The name of the exploit you're currently using")
				end
			}
		})
		Feedback.Label({
			Text = "Only use this for feedback and/or bug reporting.",
			Center = true,
			Transparent = true
		})
	else
		Feedback.Label({
			Text = "Your exploit doesn't support HTTP requests.",
			Center = true,
			Transparent = true
		})
	end
end

conn3 = game:GetService("UserInputService").InputBegan:Connect(function(i, gp)
	if not gp and i.KeyCode == togglekey then
		UI.Toggle()
	end
end)
conn4 = players.PlayerAdded:Connect(function(plr)
	if not addtonew then
		task.wait(0.5)
		esp:Remove(plr)
	end
end)

loaded = true
getgenv().UESP_LOADING = false
