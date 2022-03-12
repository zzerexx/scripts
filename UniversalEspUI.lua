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
if OldInstance then
	getgenv().OldInstance = nil
end
getgenv().EspSettings.Names.OutlineThickness = 0 -- prevent error

local version = "v1.6.9"
local esp = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEsp.lua"))()
local cfg = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/ConfigManager.lua"))()
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local UI = Material.Load({
	Title = "Universal Esp",
	Style = 3,
	SizeX = 400,
	SizeY = 535,
	Theme = "Dark"
})
local players = game:GetService("Players")
function Banner(text)
	UI.Banner({Text = text})
end

local Boxes = UI.New({Title = "Boxes"})
local Tracers = UI.New({Title = "Tracers"})
local Names = UI.New({Title = "Names"})
local Skeletons = UI.New({Title = "Skeletons"})
local HealthBars = UI.New({Title = "Health Bars"})
local HeadDots = UI.New({Title = "Head Dots"})
local LookTracers = UI.New({Title = "Look Tracers"})
local All = UI.New({Title = "All"})
local MouseVisibility = UI.New({Title = "Mouse Visibility"})
local Other = UI.New({Title = "Other"})
local Configs = UI.New({Title = "Configs"})
local Players = UI.New({Title = "Players"})
local Stats = UI.New({Title = "Statistics"})
local ui = OldInstance
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
	}
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

function destroy()
	conn1:Disconnect()
	conn2:Disconnect()
	conn3:Disconnect()
	conn4:Disconnect()
	esp:Destroy()
	ui:Destroy()
	getgenv().UESP = nil
end
local listening = false
function Keybind(btn, text, f)
	if not listening then
		listening = true
		btn:SetText(text..": ...")
		local lol;lol = game:GetService("UserInputService").InputBegan:Connect(function(i)
			local key = i.KeyCode
			if listening and key.Name ~= "Unknown" then
				btn:SetText(text..": "..key.Name)
				listening = false
				lol:Disconnect()
				task.wait(0.1)
				f(key)
			end
		end)
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
			esp:Set(type, "Transparency", value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = s.Transparency * 10
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
		Def = s.OutlineThickness
	})
	Boxes.Slider({
		Text = "Thickness",
		Callback = function(value)
			esp:Set(type, "Thickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.Thickness
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
			esp:Set(type, "Transparency", value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = s.Transparency * 10
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
		Def = s.OutlineThickness
	})
	Tracers.Dropdown({
		Text = "Origin",
		Callback = function(value)
			esp:Set(type, "Origin", value)
		end,
		Options = {"Top","Center","Bottom","Mouse"}
	})
	Tracers.Slider({
		Text = "Thickness",
		Callback = function(value)
			esp:Set(type, "Thickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.Thickness
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
			esp:Set(type, "Transparency", value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = s.Transparency * 10
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
	Names.Dropdown({
		Text = "Font",
		Callback = function(value)
			esp:Set(type, "Font", Drawing.Fonts[value])
		end,
		Options = {"UI","System","Plex","Monospace"}
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
				Banner("This is the Distance measurement. For example, if this is 'studs' then it will show '100studs'")
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
		Menu = {
			Info = function()
				Banner("This changes what the health shows.\nPercentage: [ 100% ] | Value: [ 100/100 ]")
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
			esp:Set(type, "Transparency", value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = s.Transparency * 10
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
		Def = s.OutlineThickness
	})
	Skeletons.Slider({
		Text = "Thickness",
		Callback = function(value)
			esp:Set(type, "Thickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.Thickness
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
			esp:Set(type, "Transparency", value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = s.Transparency * 10
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
		Def = s.OutlineThickness
	})
	HealthBars.Dropdown({
		Text = "Origin",
		Callback = function(value)
			esp:Set(type, "Origin", value)
		end,
		Options = {"None","Left","Right"}
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
				Banner("This works best on 70 camera fov! Anything higher can make the circle look larger when closer to the player.")
			end
		}
	})
	HeadDots.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set(type, "Transparency", value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = s.Transparency * 10
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
		Def = s.OutlineThickness
	})
	HeadDots.Slider({
		Text = "Thickness",
		Callback = function(value)
			esp:Set(type, "Thickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.Thickness
	})
	HeadDots.Toggle({
		Text = "Filled",
		Callback = function(value)
			esp:Set(type, "Filled", value)
		end,
		Enabled = s.Filled
	})
	HeadDots.Slider({
		Text = "Scale (divided by 10)",
		Callback = function(value)
			esp:Set(type, "Scale", value / 10)
		end,
		Min = 5,
		Max = 20,
		Def = s.Scale * 10
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
			esp:Set(type, "Transparency", value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = s.Transparency * 10
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
		Def = s.OutlineThickness
	})
	LookTracers.Slider({
		Text = "Thickness",
		Callback = function(value)
			esp:Set(type, "Thickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.Thickness
	})
	LookTracers.Slider({
		Text = "Length",
		Callback = function(value)
			esp:Set(type, "Length", value)
		end,
		Min = 3,
		Max = 25,
		Def = s.Length
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
				Banner("Changes the 'Enabled' setting for all types.")
			end
		}
	})
	All.Slider({
		Text = "Transparency (All)",
		Callback = function(value)
			if loaded then
				esp:SetAll("Transparency", value / 10)
			end
		end,
		Min = 0,
		Max = 10,
		Def = 10,
		Menu = {
			Info = function()
				Banner("Changes the 'Transparency' setting for all types.")
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
				Banner("Changes the 'Color' setting for all types.")
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
				Banner("Changes the 'Use Team Color' setting for all types.")
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
				Banner("Changes the 'RainbowColor' setting for all types.")
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
				Banner("Changes the 'Outline' setting for all types.")
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
				Banner("Changes the 'OutlineColor' setting for all types.")
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
		Menu = {
			Info = function()
				Banner("Changes the 'OutlineThickness' setting for all types. (except for Names)")
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
				Banner("Makes any drawing objects transparent when they are near your mouse.")
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
		Def = s.Radius
	})
	MouseVisibility.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set(type, "Transparency", value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = s.Transparency * 10
	})
	local selected = s.Selected
	MouseVisibility.DataTable({
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
	esptogglebtn = Other.Button({
		Text = "Esp Toggle Key: "..esp:Get("Other", "ToggleKey"),
		Callback = function()
			Keybind(esptogglebtn, "Esp Toggle Key", function(key)
				esp:Set(type, "ToggleKey", key.Name)
			end)
		end
	})
	Other.Slider({
		Text = "Refresh Rate (ms)",
		Callback = function(value)
			esp:Set(type, "RefreshRate", value)
		end,
		Min = 0,
		Max = 50,
		Def = ss.RefreshRate,
		Menu = {
			Info = function()
				Banner("How fast the esp updates. This is in milliseconds.")
			end
		}
	})
	Other.Slider({
		Text = "Maximum Distance",
		Callback = function(value)
			esp:Set(type, "MaximumDistance", value)
		end,
		Min = 50,
		Max = 1000,
		Def = ss.MaximumDistance
	})
	Other.Toggle({
		Text = "Face Camera",
		Callback = function(value)
			esp:Set(type, "FaceCamera", value)
		end,
		Enabled = ss.FaceCamera,
		Menu = {
			Info = function()
				Banner("Makes Boxes and Health Bars appear 2D.")
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
				Banner("Further improves 2D effect. Only works while 'Face Camera' is enabled.\nNote that this may cause esp to have abnormal behavior when looking from certain angles.")
			end
		}
	})
	Other.Button({
		Text = "Destroy Esp",
		Callback = destroy,
		Menu = {
			Info = function()
				Banner("This will completely remove Universal Esp, including the UI.")
			end
		}
	})
	Other.Button({
		Text = "Load Performance Version",
		Callback = function()
			destroy()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEspPerformance.lua"))()
		end,
		Menu = {
			Info = function()
				Banner("This will replace the current esp with an optimized version made for performance which can offer more fps. Note that this version does NOT have any customizability.")
			end
		}
	})
	Other.Button({
		Text = "Load Safe Mode",
		Callback = function()
			destroy()
			pcall(loadstring, (game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEspUI.lua")))
		end,
		Menu = {
			Info = function()
				Banner("Re-loads the ui in Safe Mode. (prevents detection via script errors)")
			end
		}
	})
	Other.Button({
		Text = "Credits",
		Callback = function()
			Banner("Material UI Library created by twink marie\nUniversal Esp created by zzerexx#3970")
		end,
		Menu = {
			Version = function()
				Banner(version)
			end
		}
	})
	uitogglebtn = Other.Button({
		Text = "UI Toggle Key: "..togglekey.Name,
		Callback = function() 
			Keybind(uitogglebtn, "UI Toggle Key", function(key)
				togglekey = key
			end)
		end
	})
end

do -- Configs
	if not game:GetService("HttpService"):JSONDecode(readfile(listfiles("UESP")[1])).Data then
		for _,v in next, listfiles("UESP") do
			local data = game:GetService("HttpService"):JSONDecode(readfile(v))
			for i2,v2 in next, data do
				if typeof(v2) == "table" then
					for i3,v3 in next, v2 do
						if typeof(v3) == "table" and v3.R then
							data[i2][i3] = Color3.new(v3.R, v3.G, v3.B)
						end
					end
				end
			end

			writefile(v, cfg.Encode({
				settings = data,
				ui = {
					ToggleKey = togglekey.Name,
					AddToNew = addtonew
				}
			}))
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
		local key = settings.ToggleKey
		esptogglebtn:SetText("Esp Toggle Key: "..((typeof(key) == "EnumItem" and key.Name) or key))
		if a.Data ~= nil and a.Data.ui ~= nil then
			local b,c = a.Data.ui.ToggleKey, a.Data.ui.AddToNew
			if b then
				togglekey = Enum.KeyCode[b]
				uitogglebtn:SetText("UI Toggle Key: "..b)
			end
			if c then
				addtonew = c
			end
		end
	end

	cfg.Init("UESP", {
		settings = ss,
		ui = {
			ToggleKey = togglekey.Name,
			AddToNew = addtonew
		}
	}, load)

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
				Banner("Successfully created: "..cfgname)
				refresh()
			else
				Banner("Please enter a name for your config in the text box above.")
			end 
		end
	})
	list = Configs.Dropdown({
		Text = "Your Configs",
		Callback = function(value)
			selectedcfg = value
		end,
		Options = {}
	})
	refresh()
	Configs.Button({
		Text = "Load Selected Config",
		Callback = function()
			cfg.Load(selectedcfg, load)
		end,
		Menu = {
			Info = function()
				Banner("Your settings will not apply to the UI. (cuz im lazy)")
			end
		}
	})
	Configs.Button({
		Text = "Overwrite Selected Config",
		Callback = function()
			save(selectedcfg)
			Banner("Successfully overwritten: "..selectedcfg)
		end
	})
	Configs.Button({
		Text = "Delete Selected Config",
		Callback = function()
			if cfg.Valid(selectedcfg) then
				cfg.Delete(selectedcfg)
				Banner("Successfully deleted: "..selectedcfg)
				refresh()
			else
				Banner(selectedcfg.." does not exist.")
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
				Banner("This will overwrite your current default config!")
			end
		}
	})
	Configs.Button({
		Text = "Refresh Config List",
		Callback = refresh
	})
end

do -- Players
	local plr = ""
	local dd = Players.Dropdown({
		Text = "Player List",
		Callback = function(value)
			plr = value
		end,
		Options = {}
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

	Players.Button({
		Text = "Add Esp",
		Callback = function()
			if not players:FindFirstChild(plr) then
				Banner(plr.." is not in the game.")
				return
			end
			esp:Add(plr)
		end,
		Menu = {
			Info = function()
				Banner("Enter a username in the box above and press this to add esp to that player.")
			end
		}
	})
	Players.Button({
		Text = "Remove Esp",
		Callback = function()
			if not players:FindFirstChild(plr) then
				Banner(plr.." is not in the game")
				return
			end
			esp:Remove(plr)
		end,
		Menu = {
			Info = function()
				Banner("Enter a username in the box above and press this to remove esp from that player.")
			end
		}
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
				Banner("Adds esp to players when they join the game.")
			end
		}
	})
end

do -- Stats
	local drawing = Stats.Button({
		Text = "Drawing Objects: N/A",
		Callback = function() end
	})
	local visible = Stats.Button({
		Text = "Rendered Objects: N/A",
		Callback = function() end
	})
	local destroyed = Stats.Button({
		Text = "Destroyed Objects: N/A",
		Callback = function() end
	})
	local boxes = Stats.Button({
		Text = "Boxes: N/A",
		Callback = function() end
	})
	local tracers = Stats.Button({
		Text = "Tracers: N/A",
		Callback = function() end
	})
	local names = Stats.Button({
		Text = "Names: N/A",
		Callback = function() end
	})
	local skeletons = Stats.Button({
		Text = "Skeletons: N/A",
		Callback = function() end
	})
	local healthbars = Stats.Button({
		Text = "Health Bars: N/A",
		Callback = function() end
	})
	local headdots = Stats.Button({
		Text = "Head Dots: N/A",
		Callback = function() end
	})
	local looktracers = Stats.Button({
		Text = "Look Tracers: N/A",
		Callback = function() end
	})
	local labels = Stats.Button({
		Text = "Labels: N/A",
		Callback = function() end
	})
	local chams = Stats.Button({
		Text = "Chams: N/A",
		Callback = function() end
	})
	local outlines = Stats.Button({
		Text = "Outlines: N/A",
		Callback = function() end
	})

	local bruhwtf = {
		{
			Text = "Drawing Objects: %s",
			ValueName = "DrawingObjects",
			Object = drawing
		},
		{
			Text = "Visible Objects: %s",
			ValueName = "VisibleObjects",
			Object = visible
		},
		{
			Text = "Destroyed Objects: %s",
			ValueName = "DestroyedObjects",
			Object = destroyed
		},
		{
			Text = "Boxes: %s",
			ValueName = "Boxes",
			Object = boxes
		},
		{
			Text = "Tracers: %s",
			ValueName = "Tracers",
			Object = tracers
		},
		{
			Text = "Names: %s",
			ValueName = "Names",
			Object = names
		},
		{
			Text = "Skeletons: %s",
			ValueName = "Skeletons",
			Object = skeletons
		},
		{
			Text = "Health Bars: %s",
			ValueName = "HealthBars",
			Object = healthbars
		},
		{
			Text = "Head Dots: %s",
			ValueName = "HeadDots",
			Object = headdots
		},
		{
			Text = "Look Tracers: %s",
			ValueName = "LookTracers",
			Object = looktracers
		},
		{
			Text = "Labels: %s",
			ValueName = "Labels",
			Object = labels
		},
		{
			Text = "Chams: %s",
			ValueName = "Chams",
			Object = chams
		},
		{
			Text = "Outlines: %s",
			ValueName = "Outlines",
			Object = outlines
		}
	}
	Stats.Button({
		Text = "Update Statistics",
		Callback = function()
			local data = esp:GetTotalObjects()
			for _,v in next, bruhwtf do
				v.Object:SetText((v.Text):format(data[v.ValueName]))
			end
		end
	})
end

conn3 = game:GetService("UserInputService").InputBegan:Connect(function(i,gp)
	if not gp and i.KeyCode == togglekey then
		ui.Enabled = not ui.Enabled
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
