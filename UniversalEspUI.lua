-- my universal esp script but with a ui
-- ui lib made by twink marie
getgenv().EspSettings = {
	TeamCheck = false,
	ToggleKey = Enum.KeyCode.RightAlt,
	AntiDetection = true,
	Boxes = {
		Enabled = true,
		Transparency = 0.7,
		Color = Color3.fromRGB(255,255,255),
		UseTeamColor = true,
	},
	Tracers = {
		Enabled = true,
		Transparency = 0.7,
		Color = Color3.fromRGB(255,255,255),
		UseTeamColor = true,
		Origin = "Top", -- "Top" or "Center" or "Bottom" or "Mouse"
		Thickness = 1
	},
	Names = {
		Enabled = true,
		Transparency = 0.7,
		Color = Color3.fromRGB(255,255,255),
		UseTeamColor = true,
		Font = Drawing.Fonts.UI, -- UI or System or Plex or Monospace
		Size = 18,
		Outline = true,
		OutlineColor = Color3.fromRGB(0,0,0),
		ShowDistance = false,
		ShowHealth = false,
		UseDisplayName = false,
	},
	Skeletons = {
		Enabled = true,
		Transparency = 0.7,
		Color = Color3.fromRGB(255,255,255),
		UseTeamColor = true,
		Thickness = 1
	},
	LookTracers = {
		Enabled = true,
		Transparency = 0.7,
		Color = Color3.fromRGB(255,255,255),
		UseTeamColor = true,
		IgnoreWater = true,
		Thickness = 1
	},
	HealthBars = {
		Enabled = true,
		Transparency = 0.7,
		Color = Color3.fromRGB(0,255,0),
		OutlineColor = Color3.fromRGB(255,255,255),
		UseTeamColor = true -- this only applies to the outline
	}
} -- v1.5.2

local esp = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEsp.lua", true))()
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local UI = Material.Load({
	Title = "Universal Esp",
	Style = 2,
	SizeX = 514,
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
local LookTracers = UI.New({Title = "Look Tracers"})
local HealthBars = UI.New({Title = "Health Bars"})
local Other = UI.New({Title = "Other"})

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
	Def = 7
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
	Def = 7
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
	Def = 7
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
	Enabled = false
})
Names.Toggle({
	Text = "Use Display Name",
	Callback = function(value)
		esp:Set("Names","UseDisplayName",value)
	end,
	Enabled = false
})

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
	Def = 7
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
Skeletons.Slider({
	Text = "Thickness",
	Callback = function(value)
		esp:Set("Skeletons","Thickness",value)
	end,
	Min = 1,
	Max = 5,
	Def = 1
})

LookTracers.Toggle({
	Text = "Enabled",
	Callback = function(value)
		esp:Set("LookTracers","Enabled",value)
	end,
	Enabled = true
})
LookTracers.Slider({
	Text = "Transparency",
	Callback = function(value)
		esp:Set("LookTracers","Transparency",value / 10)
	end,
	Min = 0,
	Max = 10,
	Def = 7
})
LookTracers.ColorPicker({
	Text = "Color",
	Default = Color3.fromHSV(0,0,1),
	Callback = function(value)
		esp:Set("LookTracers","Color",value)
	end
})
LookTracers.Toggle({
	Text = "Use Team Color",
	Callback = function(value)
		esp:Set("LookTracers","UseTeamColor",value)
	end,
	Enabled = true
})
LookTracers.Toggle({
	Text = "Ignore Water",
	Callback = function(value)
		esp:Set("LookTracers","IgnoreWater",value)
	end,
	Enabled = true
})
LookTracers.Slider({
	Text = "Thickness",
	Callback = function(value)
		esp:Set("LookTracers","Thickness",value)
	end,
	Min = 1,
	Max = 5,
	Def = 1
})

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
	Def = 7
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
