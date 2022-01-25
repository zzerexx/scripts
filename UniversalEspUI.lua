if not EspSettings then
	getgenv().EspSettings = {
		TeamCheck = false,
		ToggleKey = "RightAlt",
		RefreshRate = 10, -- how fast the esp updates (milliseconds)
		MaximumDistance = 500, -- only renders players within this distance
		MouseVisibility = {
			Enabled = true, -- makes any drawing objects transparent when they are near your mouse
			Radius = 60,
			Transparency = 0.3,
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
			OutlineThickness = 3
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
			Filled = false
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

local version = "v1.6.5"
local esp = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEsp.lua", true))()
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
function totable(a)
	return {R = a.R, G = a.G, B = a.B}
end
function tocolor(a)
	return Color3.fromRGB(a.R * 255, a.G * 255, a.B * 255)
end
function clonetable(a)
	local b = {}
	for i,v in next, a do
		if typeof(v) == "table" then
			v = clonetable(v)
		end
		b[i] = v
	end
	return b
end

if isfile("UESP.json") then
	local a = game:GetService("HttpService"):JSONDecode(readfile("UESP.json"))
	for i,v in next, a do
		if typeof(v) == "table" then
			for i2,v2 in next, v do
				if typeof(v2) == "table" and v2.R then
					local color = tocolor(v2)
					a[i][i2] = color
					esp:Set(i, i2, color)
				else
					if i ~= "Names" and i2 ~= "OutlineThickness" then
						esp:Set(i, i2, v2)
					end
				end
			end
		end
	end
	getgenv().EspSettings = a
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
local Players = UI.New({Title = "Players"})
local Stats = UI.New({Title = "Statistics"})
local ui = OldInstance
local ss = getgenv().EspSettings
local loaded = false
local conn1,conn2 = nil,nil

do -- Boxes
	Boxes.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set("Boxes","Enabled",value)
		end,
		Enabled = ss.Boxes.Enabled
	})
	Boxes.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set("Boxes","Transparency",value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = ss.Boxes.Transparency * 10
	})
	Boxes.ColorPicker({
		Text = "Color",
		Default = ss.Boxes.Color,
		Callback = function(value)
			esp:Set("Boxes","Color",value)
		end
	})
	Boxes.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set("Boxes","UseTeamColor",value)
		end,
		Enabled = ss.Boxes.UseTeamColor
	})
	Boxes.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set("Boxes","RainbowColor",value)
		end,
		Enabled = ss.Boxes.RainbowColor
	})
	Boxes.Toggle({
		Text = "Outline",
		Callback = function(value)
			esp:Set("Boxes","Outline",value)
		end,
		Enabled = ss.Boxes.Outline
	})
	Boxes.ColorPicker({
		Text = "Outline Color",
		Default = ss.Boxes.OutlineColor,
		Callback = function(value)
			esp:Set("Boxes","OutlineColor",value)
		end
	})
	Boxes.Slider({
		Text = "Outline Thickness",
		Callback = function(value)
			esp:Set("Boxes","OutlineThickness",value)
		end,
		Min = 1,
		Max = 5,
		Def = ss.Boxes.OutlineThickness
	})
	Boxes.Slider({
		Text = "Thickness",
		Callback = function(value)
			esp:Set("Boxes","Thickness",value)
		end,
		Min = 1,
		Max = 5,
		Def = ss.Boxes.Thickness
	})
end

do -- Tracers
	Tracers.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set("Tracers","Enabled",value)
		end,
		Enabled = ss.Tracers.Enabled
	})
	Tracers.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set("Tracers","Transparency",value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = ss.Tracers.Transparency * 10
	})
	Tracers.ColorPicker({
		Text = "Color",
		Default = ss.Tracers.Color,
		Callback = function(value)
			esp:Set("Tracers","Color",value)
		end
	})
	Tracers.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set("Tracers","UseTeamColor",value)
		end,
		Enabled = ss.Tracers.UseTeamColor
	})
	Tracers.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set("Tracers","RainbowColor",value)
		end,
		Enabled = ss.Tracers.RainbowColor
	})
	Tracers.Toggle({
		Text = "Outline",
		Callback = function(value)
			esp:Set("Tracers","Outline",value)
		end,
		Enabled = ss.Tracers.Outline
	})
	Tracers.ColorPicker({
		Text = "Outline Color",
		Default = ss.Tracers.OutlineColor,
		Callback = function(value)
			esp:Set("Tracers","OutlineColor",value)
		end
	})
	Tracers.Slider({
		Text = "Outline Thickness",
		Callback = function(value)
			esp:Set("Tracers","OutlineThickness",value)
		end,
		Min = 1,
		Max = 5,
		Def = ss.Tracers.OutlineThickness
	})
	Tracers.Dropdown({
		Text = "Origin",
		Callback = function(value)
			esp:Set("Tracers","Origin",value)
		end,
		Options = {"Top","Center","Bottom","Mouse"}
	})
	Tracers.Slider({
		Text = "Thickness",
		Callback = function(value)
			esp:Set("Tracers","Thickness",value)
		end,
		Min = 1,
		Max = 5,
		Def = ss.Tracers.Thickness
	})
end

do -- Names
	Names.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set("Names","Enabled",value)
		end,
		Enabled = ss.Names.Enabled
	})
	Names.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set("Names","Transparency",value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = ss.Names.Transparency * 10
	})
	Names.ColorPicker({
		Text = "Color",
		Default = ss.Names.Color,
		Callback = function(value)
			esp:Set("Names","Color",value)
		end
	})
	Names.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set("Names","UseTeamColor",value)
		end,
		Enabled = ss.Names.UseTeamColor
	})
	Names.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set("Names","RainbowColor",value)
		end,
		Enabled = ss.Names.RainbowColor
	})
	Names.Toggle({
		Text = "Outline",
		Callback = function(value)
			esp:Set("Names","Outline",value)
		end,
		Enabled = ss.Names.Outline
	})
	Names.ColorPicker({
		Text = "Outline Color",
		Default = ss.Names.OutlineColor,
		Callback = function(value)
			esp:Set("Names","OutlineColor",value)
		end
	})
	Names.Dropdown({
		Text = "Font",
		Callback = function(value)
			esp:Set("Names","Font",Drawing.Fonts[value])
		end,
		Options = {"UI","System","Plex","Monospace"}
	})
	Names.Slider({
		Text = "Text Size",
		Callback = function(value)
			esp:Set("Names","Size",value)
		end,
		Min = 1,
		Max = 32,
		Def = ss.Names.Size
	})
	Names.Toggle({
		Text = "Show Distance",
		Callback = function(value)
			esp:Set("Names","ShowDistance",value)
		end,
		Enabled = ss.Names.ShowDistance
	})
	Names.Toggle({
		Text = "Show Health",
		Callback = function(value)
			esp:Set("Names","ShowHealth",value)
		end,
		Enabled = ss.Names.ShowHealth
	})
	Names.Toggle({
		Text = "Use Display Name",
		Callback = function(value)
			esp:Set("Names","UseDisplayName",value)
		end,
		Enabled = ss.Names.UseDisplayName
	})
	Names.TextField({
		Text = "Distance Data Type",
		Type = "Default",
		Callback = function(value)
			esp:Set("Names","DistanceDataType",value)
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
			esp:Set("Names","HealthDataType",value)
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
	Skeletons.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set("Skeletons","Enabled",value)
		end,
		Enabled = ss.Skeletons.Enabled
	})
	Skeletons.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set("Skeletons","Transparency",value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = ss.Skeletons.Transparency * 10
	})
	Skeletons.ColorPicker({
		Text = "Color",
		Default = ss.Skeletons.Color,
		Callback = function(value)
			esp:Set("Skeletons","Color",value)
		end
	})
	Skeletons.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set("Skeletons","UseTeamColor",value)
		end,
		Enabled = ss.Skeletons.UseTeamColor
	})
	Skeletons.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set("Skeletons","RainbowColor",value)
		end,
		Enabled = ss.Skeletons.RainbowColor
	})
	Skeletons.Toggle({
		Text = "Outline",
		Callback = function(value)
			esp:Set("Skeletons","Outline",value)
		end,
		Enabled = ss.Skeletons.Outline
	})
	Skeletons.ColorPicker({
		Text = "Outline Color",
		Default = ss.Skeletons.OutlineColor,
		Callback = function(value)
			esp:Set("Skeletons","OutlineColor",value)
		end
	})
	Skeletons.Slider({
		Text = "Outline Thickness",
		Callback = function(value)
			esp:Set("Skeletons","OutlineThickness",value)
		end,
		Min = 1,
		Max = 5,
		Def = ss.Skeletons.OutlineThickness
	})
	Skeletons.Slider({
		Text = "Thickness",
		Callback = function(value)
			esp:Set("Skeletons","Thickness",value)
		end,
		Min = 1,
		Max = 5,
		Def = ss.Skeletons.Thickness
	})
end

do -- HealthBars
	HealthBars.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set("HealthBars","Enabled",value)
		end,
		Enabled = ss.HealthBars.Enabled
	})
	HealthBars.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set("HealthBars","Transparency",value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = ss.HealthBars.Transparency * 10
	})
	HealthBars.ColorPicker({
		Text = "Color",
		Default = ss.HealthBars.Color,
		Callback = function(value)
			esp:Set("HealthBars","Color",value)
		end
	})
	HealthBars.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set("HealthBars","UseTeamColor",value)
		end,
		Enabled = ss.HealthBars.UseTeamColor
	})
	HealthBars.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set("HealthBars","RainbowColor",value)
		end,
		Enabled = ss.HealthBars.RainbowColor
	})
	HealthBars.Toggle({
		Text = "Outline",
		Callback = function(value)
			esp:Set("HealthBars","Outline",value)
		end,
		Enabled = ss.HealthBars.Outline
	})
	HealthBars.ColorPicker({
		Text = "Outline Color",
		Default = ss.HealthBars.OutlineColor,
		Callback = function(value)
			esp:Set("HealthBars","OutlineColor",value)
		end
	})
	HealthBars.Slider({
		Text = "Outline Thickness",
		Callback = function(value)
			esp:Set("HealthBars","OutlineThickness",value)
		end,
		Min = 1,
		Max = 5,
		Def = ss.HealthBars.OutlineThickness
	})
end

do -- HeadDots
	HeadDots.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set("HeadDots","Enabled",value)
		end,
		Enabled = ss.HeadDots.Enabled,
		Menu = {
			Info = function()
				Banner("This works best on 70 camera fov! Anything higher can make the circle look larger when closer to the player.")
			end
		}
	})
	HeadDots.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set("HeadDots","Transparency",value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = ss.HeadDots.Transparency * 10
	})
	HeadDots.ColorPicker({
		Text = "Color",
		Default = ss.HeadDots.Color,
		Callback = function(value)
			esp:Set("HeadDots","Color",value)
		end
	})
	HeadDots.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set("HeadDots","UseTeamColor",value)
		end,
		Enabled = ss.HeadDots.UseTeamColor
	})
	HeadDots.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set("HeadDots","RainbowColor",value)
		end,
		Enabled = ss.HeadDots.RainbowColor
	})
	HeadDots.Toggle({
		Text = "Outline",
		Callback = function(value)
			esp:Set("HeadDots","Outline",value)
		end,
		Enabled = ss.HeadDots.Outline
	})
	HeadDots.ColorPicker({
		Text = "Outline Color",
		Default = ss.HeadDots.OutlineColor,
		Callback = function(value)
			esp:Set("HeadDots","OutlineColor",value)
		end
	})
	HeadDots.Slider({
		Text = "Outline Thickness",
		Callback = function(value)
			esp:Set("HeadDots","OutlineThickness",value)
		end,
		Min = 1,
		Max = 5,
		Def = ss.HeadDots.OutlineThickness
	})
	HeadDots.Slider({
		Text = "Thickness",
		Callback = function(value)
			esp:Set("HeadDots","Thickness",value)
		end,
		Min = 1,
		Max = 5,
		Def = ss.HeadDots.Thickness
	})
	HeadDots.Toggle({
		Text = "Filled",
		Callback = function(value)
			esp:Set("HeadDots","Filled",value)
		end,
		Enabled = ss.HeadDots.Filled
	})
end

do -- LookTracers
	LookTracers.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set("LookTracers","Enabled",value)
		end,
		Enabled = ss.LookTracers.Enabled
	})
	LookTracers.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set("LookTracers","Transparency",value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = ss.LookTracers.Transparency * 10
	})
	LookTracers.ColorPicker({
		Text = "Color",
		Default = ss.LookTracers.Color,
		Callback = function(value)
			esp:Set("LookTracers","Color",value)
		end
	})
	LookTracers.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set("LookTracers","UseTeamColor",value)
		end,
		Enabled = ss.LookTracers.UseTeamColor
	})
	LookTracers.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set("LookTracers","RainbowColor",value)
		end,
		Enabled = ss.LookTracers.RainbowColor
	})
	LookTracers.Toggle({
		Text = "Outline",
		Callback = function(value)
			esp:Set("LookTracers","Outline",value)
		end,
		Enabled = ss.LookTracers.Outline
	})
	LookTracers.ColorPicker({
		Text = "Outline Color",
		Default = ss.LookTracers.OutlineColor,
		Callback = function(value)
			esp:Set("LookTracers","OutlineColor",value)
		end
	})
	LookTracers.Slider({
		Text = "Outline Thickness",
		Callback = function(value)
			esp:Set("LookTracers","OutlineThickness",value)
		end,
		Min = 1,
		Max = 5,
		Def = ss.LookTracers.OutlineThickness
	})
	LookTracers.Slider({
		Text = "Thickness",
		Callback = function(value)
			esp:Set("LookTracers","Thickness",value)
		end,
		Min = 1,
		Max = 5,
		Def = ss.LookTracers.Thickness
	})
	LookTracers.Slider({
		Text = "Length",
		Callback = function(value)
			esp:Set("LookTracers","Length",value)
		end,
		Min = 3,
		Max = 25,
		Def = ss.LookTracers.Length
	})
end

do -- All
	All.Toggle({
		Text = "Enabled (All)",
		Callback = function(value)
			if loaded then
				esp:SetAll("Enabled",value)
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
				esp:SetAll("Transparency",value / 10)
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
				esp:SetAll("Color",value)
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
				esp:SetAll("UseTeamColor",value)
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
				esp:SetAll("RainbowColor",value)
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
				esp:SetAll("Outline",value)
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
				esp:SetAll("OutlineColor",value)
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
				esp:SetAll("OutlineThickness",value)
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
	MouseVisibility.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set("MouseVisibility","Enabled",value)
		end,
		Enabled = ss.MouseVisibility.Enabled,
		Menu = {
			Info = function()
				Banner("Makes any drawing objects transparent when they are near your mouse.")
			end
		}
	})
	MouseVisibility.Slider({
		Text = "Radius",
		Callback = function(value)
			esp:Set("MouseVisibility","Radius",value)
		end,
		Min = 10,
		Max = 150,
		Def = ss.MouseVisibility.Radius
	})
	MouseVisibility.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set("MouseVisibility","Transparency",value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = ss.MouseVisibility.Transparency * 10
	})
end

do -- Other
	Other.Toggle({
		Text = "Team Check",
		Callback = function(value)
			esp:Set("Other","TeamCheck",value)
		end,
		Enabled = ss.TeamCheck
	})
	Other.TextField({
		Text = "Toggle Key",
		Type = "Default",
		Callback = function(value)
			if loaded then
				if not Enum.KeyCode[value] then
					Banner("Invalid KeyCode")
					return
				end
				esp:Set("Other","ToggleKey",value)
			end
		end,
		Menu = {
			Info = function()
				Banner("Must be a valid KeyCode. See a list of KeyCodes by clicking the Link button.") 
			end,
			Link = function()
				setclipboard("https://developer.roblox.com/en-us/api-reference/enum/KeyCode")
				Banner("Copied to clipboard!")
			end
		}
	})
	Other.Slider({
		Text = "Refresh Rate (ms)",
		Callback = function(value)
			esp:Set("Other","RefreshRate",value)
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
			esp:Set("Other","MaximumDistance",value)
		end,
		Min = 50,
		Max = 1000,
		Def = ss.MaximumDistance
	})
	Other.Button({
		Text = "Save Settings",
		Callback = function()
			local a = clonetable(ss)
			for i,v in next, ss do
				if typeof(v) == "table" then
					for i2,v2 in next, v do
						if typeof(v2) == "Color3" then
							a[i][i2] = totable(v2)
						end
					end
				end
			end

			writefile("UESP.json", game:GetService("HttpService"):JSONEncode(a))
			Banner("Successfully saved your settings.")
		end,
		Menu = {
			Info = function()
				Banner("Saves your settings and uses them every time you execute! Note that this overrides your previous save.")
			end
		}
	})
	Other.Button({
		Text = "Destroy Esp",
		Callback = function()
			conn1:Disconnect()
			conn2:Disconnect()
			esp:Destroy()
			ui:Destroy()
		end,
		Menu = {
			Info = function()
				Banner("This will completely remove Universal Esp, including the UI.")
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
end

do -- Stats
	local drawing = Stats.Button({
		Text = "Drawing Objects: N/A",
		Callback = function() end
	})
	local visible = Stats.Button({
		Text = "Visible Objects: N/A",
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

	Stats.Button({
		Text = "Update Statistics",
		Callback = function()
			local data = esp:GetTotalObjects()
			drawing:SetText(("Drawing Objects: %s"):format(data.DrawingObjects))
			visible:SetText(("Visible Objects: %s"):format(data.VisibleObjects))
			destroyed:SetText(("Destroyed Objects: %s"):format(data.DestroyedObjects))
			boxes:SetText(("Boxes: %s"):format(data.Boxes))
			tracers:SetText(("Tracers: %s"):format(data.Tracers))
			names:SetText(("Names: %s"):format(data.Names))
			skeletons:SetText(("Skeletons: %s"):format(data.Skeletons))
			healthbars:SetText(("Health Bars: %s"):format(data.HealthBars))
			headdots:SetText(("Head Dots: %s"):format(data.HeadDots))
			looktracers:SetText(("Look Tracers: %s"):format(data.LookTracers))
			labels:SetText(("Labels: %s"):format(data.Labels))
			chams:SetText(("Chams: %s"):format(data.Chams))
			outlines:SetText(("Outlines: %s"):format(data.Outlines))
		end
	})
end

loaded = true
