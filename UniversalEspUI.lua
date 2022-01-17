if not EspSettings then
	getgenv().EspSettings = {
		TeamCheck = false,
		ToggleKey = Enum.KeyCode.RightAlt,
		AntiDetection = true,
		RefreshRate = 10, -- how fast the esp updates (milliseconds)
		MaximumDistance = 500, -- only renders players within this distance
		MouseVisibility = {
			Enabled = true, -- makes any drawing objects transparent when they are near your mouse
			Radius = 60,
			Transparency = 0.3
		},
		Boxes = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			RainbowColor = false,
			Thickness = 1
		},
		Tracers = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			RainbowColor = false,
			Origin = "Top", -- "Top" or "Center" or "Bottom" or "Mouse"
			Thickness = 1
		},
		Names = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			RainbowColor = false,
			Font = Drawing.Fonts.UI, -- UI or System or Plex or Monospace
			Size = 18,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
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
			Thickness = 1
		},
		HealthBars = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(0,255,0),
			UseTeamColor = true,
			RainbowColor = false,
			OutlineColor = Color3.fromRGB(255,255,255)
		},
		HeadDots = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			RainbowColor = false,
			Thickness = 2,
			Filled = false
		}
	}
end

if UESP then
	return
end
if OldInstance then
	getgenv().OldInstance = nil
end

local version = "v1.6.4"
local esp = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEsp.lua", true))()
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local UI = Material.Load({
	Title = "Universal Esp",
	Style = 2,
	SizeX = 492,
	SizeY = 500,
	Theme = "Dark"
})
function Banner(text)
	UI.Banner({Text = text})
end

local Boxes = UI.New({Title = "Boxes"})
local Tracers = UI.New({Title = "Tracers"})
local Names = UI.New({Title = "Names"})
local Skeletons = UI.New({Title = "Skeletons"})
--local LookTracers = UI.New({Title = "Look Tracers"})
local HealthBars = UI.New({Title = "Health Bars"})
local HeadDots = UI.New({Title = "Head Dots"})
local Other = UI.New({Title = "Other"})
local ui = OldInstance

do -- Boxes
	Boxes.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set("Boxes","Enabled",value)
		end,
		Enabled = true
	})
	Boxes.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set("Boxes","Transparency",value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = 10
	})
	Boxes.ColorPicker({
		Text = "Color",
		Default = Color3.fromHSV(0,0,1),
		Callback = function(value)
			esp:Set("Boxes","Color",value)
		end
	})
	Boxes.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set("Boxes","UseTeamColor",value)
		end,
		Enabled = true
	})
	Boxes.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set("Boxes","RainbowColor",value)
		end,
		Enabled = false
	})
	Boxes.Slider({
		Text = "Thickness",
		Callback = function(value)
			esp:Set("Boxes","Thickness",value)
		end,
		Min = 1,
		Max = 5,
		Def = 1
	})
end

do -- Tracers
	Tracers.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set("Tracers","Enabled",value)
		end,
		Enabled = true
	})
	Tracers.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set("Tracers","Transparency",value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = 10
	})
	Tracers.ColorPicker({
		Text = "Color",
		Default = Color3.fromHSV(0,0,1),
		Callback = function(value)
			esp:Set("Tracers","Color",value)
		end
	})
	Tracers.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set("Tracers","UseTeamColor",value)
		end,
		Enabled = true
	})
	Tracers.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set("Tracers","RainbowColor",value)
		end,
		Enabled = false
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
		Def = 1
	})
end

do -- Names
	Names.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set("Names","Enabled",value)
		end,
		Enabled = true
	})
	Names.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set("Names","Transparency",value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = 10
	})
	Names.ColorPicker({
		Text = "Color",
		Default = Color3.fromHSV(0,0,1),
		Callback = function(value)
			esp:Set("Names","Color",value)
		end
	})
	Names.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set("Names","UseTeamColor",value)
		end,
		Enabled = true
	})
	Names.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set("Names","RainbowColor",value)
		end,
		Enabled = false
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
		Def = 18
	})
	Names.Toggle({
		Text = "Outline",
		Callback = function(value)
			esp:Set("Names","Outline",value)
		end,
		Enabled = true
	})
	Names.ColorPicker({
		Text = "Outline Color",
		Default = Color3.fromHSV(0,0,0),
		Callback = function(value)
			esp:Set("Names","OutlineColor",value)
		end
	})
	Names.Toggle({
		Text = "Show Distance",
		Callback = function(value)
			esp:Set("Names","ShowDistance",value)
		end,
		Enabled = false
	})
	Names.Toggle({
		Text = "Show Health",
		Callback = function(value)
			esp:Set("Names","ShowHealth",value)
		end,
		Enabled = true
	})
	Names.Toggle({
		Text = "Use Display Name",
		Callback = function(value)
			esp:Set("Names","UseDisplayName",value)
		end,
		Enabled = false
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
		Enabled = true
	})
	Skeletons.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set("Skeletons","Transparency",value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = 10
	})
	Skeletons.ColorPicker({
		Text = "Color",
		Default = Color3.fromHSV(0,0,1),
		Callback = function(value)
			esp:Set("Skeletons","Color",value)
		end
	})
	Skeletons.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set("Skeletons","UseTeamColor",value)
		end,
		Enabled = true
	})
	Skeletons.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set("Skeletons","RainbowColor",value)
		end,
		Enabled = false
	})
	Skeletons.Slider({
		Text = "Thickness",
		Callback = function(value)
			esp:Set("Skeletons","Thickness",value)
		end,
		Min = 1,
		Max = 5,
		Def = 1
	})
end

do -- HealthBars
	HealthBars.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set("HealthBars","Enabled",value)
		end,
		Enabled = true
	})
	HealthBars.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set("HealthBars","Transparency",value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = 10
	})
	HealthBars.ColorPicker({
		Text = "Color",
		Default = Color3.fromHSV(0.3,1,1),
		Callback = function(value)
			esp:Set("HealthBars","Color",value)
		end
	})
	HealthBars.ColorPicker({
		Text = "Outline Color",
		Default = Color3.fromHSV(0,0,1),
		Callback = function(value)
			esp:Set("HealthBars","OutlineColor",value)
		end
	})
	HealthBars.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set("HealthBars","UseTeamColor",value)
		end,
		Enabled = true
	})
	HealthBars.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set("HealthBars","RainbowColor",value)
		end,
		Enabled = false
	})
end

do -- HeadDots
	HeadDots.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set("HeadDots","Enabled",value)
		end,
		Enabled = true
	})
	HeadDots.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set("HeadDots","Transparency",value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = 10
	})
	HeadDots.ColorPicker({
		Text = "Color",
		Default = Color3.fromHSV(0,0,1),
		Callback = function(value)
			esp:Set("HeadDots","Color",value)
		end
	})
	HeadDots.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set("HeadDots","UseTeamColor",value)
		end,
		Enabled = true
	})
	HeadDots.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set("HeadDots","RainbowColor",value)
		end,
		Enabled = false
	})
	HeadDots.Slider({
		Text = "Thickness",
		Callback = function(value)
			esp:Set("HeadDots","Thickness",value)
		end,
		Min = 1,
		Max = 5,
		Def = 1
	})
	HeadDots.Toggle({
		Text = "Filled",
		Callback = function(value)
			esp:Set("HeadDots","Filled",value)
		end,
		Enabled = false
	})
end

do -- Other
	Other.Toggle({
		Text = "Team Check",
		Callback = function(value)
			esp:Set("Other","TeamCheck",value)
		end
	})
	Other.TextField({
		Text = "Toggle Key",
		Type = "Default",
		Callback = function(value)
			if not Enum.KeyCode[value] then
				return Banner("Invalid KeyCode")
			end
			esp:Set("Other","ToggleKey",Enum.KeyCode[value])
		end
	})
	Other.Slider({
		Text = "Refresh Rate (ms)",
		Callback = function(value)
			esp:Set("Other","RefreshRate",value)
		end,
		Def = 10,
		Min = 0,
		Max = 50,
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
		Def = 500
	})
	Other.Toggle({
		Text = "Mouse Visibility",
		Callback = function(value)
			esp:Set("MouseVisibility","Enabled",value)
		end,
		Enabled = true,
		Menu = {
			Info = function()
				Banner("Makes any drawing objects transparent when they are near your mouse.")
			end
		}
	})
	Other.Slider({
		Text = "Mouse Visibility Radius",
		Callback = function(value)
			esp:Set("MouseVisibility","Radius",value)
		end,
		Min = 10,
		Max = 150,
		Def = 60
	})
	Other.Slider({
		Text = "Mouse Visibility Transparency",
		Callback = function(value)
			esp:Set("MouseVisibility","Transparency",value / 10)
		end,
		Min = 1,
		Max = 10,
		Def = 3
	})
	
	Other.Toggle({
		Text = "Enabled (All)",
		Callback = function(value)
			esp:SetAll("Enabled",value)
		end,
		Enabled = true,
		Menu = {
			Info = function()
				Banner("Changes the 'Enabled' setting for all types.")
			end
		}
	})
	Other.Slider({
		Text = "Transparency (All)",
		Callback = function(value)
			esp:SetAll("Transparency",value / 10)
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
	Other.ColorPicker({
		Text = "Color (All)",
		Default = Color3.fromRGB(255,255,255),
		Callback = function(value)
			esp:SetAll("Color",value)
		end,
		Menu = {
			Info = function()
				Banner("Changes the 'Color' setting for all types.")
			end
		}
	})
	Other.Toggle({
		Text = "Use Team Color (All)",
		Callback = function(value)
			esp:SetAll("UseTeamColor",value)
		end,
		Enabled = true,
		Menu = {
			Info = function()
				Banner("Changes the 'Use Team Color' setting for all types.")
			end
		}
	})
	Other.Toggle({
		Text = "Rainbow Color (All)",
		Callback = function(value)
			esp:SetAll("RainbowColor",value)
		end,
		Enabled = false,
		Menu = {
			Info = function()
				Banner("Changes the 'RainbowColor' setting for all types.")
			end
		}
	})
	Other.Button({
		Text = "Destroy Esp",
		Callback = function()
			esp:Destroy()
			ui:Destroy()
		end,
		Menu = {
			Info = function()
				Banner("This button will completely remove Universal Esp, including the UI.")
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
