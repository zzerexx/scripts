getgenv().AimbotSettings = {
	Aimbot = {
		Enabled = true,
		TargetPart = "Head",
		VisibleCheck = true,
		Use_mousemoverel = true,
		Strength = 100, -- 1% - 200%
		TeamCheck = true, -- Press ] to toggle
		Keybind = Enum.UserInputType.MouseButton2, -- Must be a UserInputType or KeyCode
		AimType = "Hold", -- "Hold" or "Toggle"
		AlwaysActive = false,
		ToggleKey = Enum.KeyCode.RightShift,
		MaximumDistance = 300, -- Set this to something lower if you dont wanna lock on some random person across the map
	},
	AimAssist = {
		Enabled = false,
		ToggleKey = Enum.KeyCode.RightShift,
		MinFov = 15,
		MaxFov = 80,
		DynamicFov = true,
		ShowFov = false, -- Shows Min & Max fov
		Strength = 55, -- 1% - 100%
		AlwaysActive = true,
		SlowSensitivity = true,
		SlowFactor = 1.75, -- 1% - 10%
		MaximumDistance = 300,
		RequireMovement = true,
	},
	FovCircle = {
		Enabled = true,
		Dynamic = true,
		Radius = 100,
		Transparency = 1,
		Color = Color3.fromRGB(255,255,255),
		NumSides = 64,
	},
	Whitelisted = {}, -- Username or User ID
	WhitelistFriends = true, -- Automatically adds friends to the whitelist
	Ignore = nil -- Raycast Ignore
} -- v1.1.10
loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalAimbot.lua"))()

local HttpService = game:GetService("HttpService")
local players = game:GetService("Players")
local aimbot = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalAimbot.lua"))()
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local UI = Material.Load({
	Title = "Universal Aimbot",
	Style = 2,
	SizeX = 400,
	SizeY = 500,
	Theme = "Dark"
})
function Banner(text)
	UI.Banner({Text = text})
end

local Aimbot = UI.New({Title = "Aimbot"})
local Assist = UI.New({Title = "Aim Assist"})
local Fov = UI.New({Title = "Fov Circle"})
local Other = UI.New({Title = "Other"})

Aimbot.Toggle({
	Text = "Enabled",
	Callback = function(value)
		aimbot:Set("Aimbot","Enabled",value)
	end,
	Enabled = true
})
Aimbot.TextField({
	Text = "Target Part (Head is default)",
	Type = "Default",
	Callback = function(value)
		aimbot:Set("Aimbot","TargetPart",value)
	end
})
Aimbot.Toggle({
	Text = "Visible Check",
	Callback = function(value)
		aimbot:Set("Aimbot","VisibleCheck",value)
	end,
	Enabled = true
})
Aimbot.Toggle({
	Text = "Use mousemoverel",
	Callback = function(value)
		aimbot:Set("Aimbot","Use_mousemoverel",value)
	end,
	Enabled = true
})
Aimbot.Slider({
	Text = "Strength",
	Callback = function(value)
		aimbot:Set("Aimbot","Strength",value)
	end,
	Min = 1,
	Max = 200,
	Def = 100
})
Aimbot.Toggle({
	Text = "Team Check",
	Callback = function(value)
		aimbot:Set("Aimbot","TeamCheck",value)
	end,
	Enabled = true
})
Aimbot.Dropdown({
	Text = "Aim Type",
	Callback = function(value)
		aimbot:Set("Aimbot","AimType",value)
	end,
	Options = {"Hold","Toggle"}
})
Aimbot.Toggle({
	Text = "Always Active",
	Callback = function(value)
		aimbot:Set("Aimbot","AlwaysActive",value)
	end,
	Enabled = false
})
Aimbot.TextField({
	Text = "Toggle Key (RightShift is default)",
	Type = "Default",
	Callback = function(value)
		aimbot:Set("Aimbot","ToggleKey",Enum.KeyCode[value])
	end
})
Aimbot.Slider({
	Text = "Maximum Distance",
	Callback = function(value)
		aimbot:Set("Aimbot","MaximumDistance",value)
	end,
	Min = 0,
	Max = 1000,
	Def = 300,
})

Assist.Toggle({
	Text = "Enabled",
	Callback = function(value)
		aimbot:Set("AimAssist","Enabled",value)
	end,
	Enabled = false
})
Assist.Slider({
	Text = "Minimum Fov",
	Callback = function(value)
		aimbot:Set("AimAssist","MinFov",value)
	end,
	Min = 0,
	Max = 30,
	Def = 15
})
Assist.Slider({
	Text = "Maximum Fov",
	Callback = function(value)
		aimbot:Set("AimAssist","MaxFov",value)
	end,
	Min = 0,
	Max = 200,
	Def = 80
})
Assist.Toggle({
	Text = "Dynamic Fov",
	Callback = function(value)
		aimbot:Set("AimAssist","DynamicFov",value)
	end,
	Enabled = true
})
Assist.Toggle({
	Text = "Show Fov",
	Callback = function(value)
		aimbot:Set("AimAssist","ShowFov",value)
	end,
	Enabled = false
})
Assist.Slider({
	Text = "Strength",
	Callback = function(value)
		aimbot:Set("AimAssist","Strength",value)
	end,
	Min = 1,
	Max = 100,
	Def = 55
})
Assist.Toggle({
	Text = "AlwaysActive",
	Callback = function(value)
		aimbot:Set("AimAssist","AlwaysActive",value)
	end,
	Enabled = true
})
Assist.TextField({
	Text = "Toggle Key (RightShift is default)",
	Type = "Default",
	Callback = function(value)
		aimbot:Set("AimAssist","ToggleKey",Enum.KeyCode[value])
	end
})
Assist.Toggle({
	Text = "Slow Sensitivity",
	Callback = function(value)
		aimbot:Set("AimAssist","SlowSensitivity",value)
	end,
	Enabled = true
})
Assist.Slider({
	Text = "Slow Factor",
	Callback = function(value)
		aimbot:Set("AimAssist","SlowFactor",value / 10)
	end,
	Min = 10,
	Max = 100,
	Def = 17
})
Assist.Slider({
	Text = "Maximum Distance",
	Callback = function(value)
		if value == 0 then
			aimbot:Set("AimAssist","MaximumDistance",math.huge)
		else
			aimbot:Set("AimAssist","MaximumDistance",value)
		end
	end,
	Min = 0,
	Max = 1000,
	Def = 300
})
Assist.Toggle({
	Text = "Require Movement",
	Callback = function(value)
		aimbot:Set("AimAssist","RequireMovement",value)
	end,
	Enabled = true
})

Fov.Toggle({
	Text = "Enabled",
	Callback = function(value)
		aimbot:Set("FovCircle","Enabled",value)
	end,
	Enabled = true
})
Fov.Toggle({
	Text = "Dynamic",
	Callback = function(value)
		aimbot:Set("FovCircle","Dynamic",value)
	end,
	Enabled = true
})
Fov.Slider({
	Text = "Radius",
	Callback = function(value)
		aimbot:Set("FovCircle","Radius",value)
	end,
	Min = 0,
	Max = 500,
	Def = 100
})
Fov.Slider({
	Text = "Transparency",
	Callback = function(value)
		aimbot:Set("FovCircle","Transparency",value / 10)
	end,
	Min = 0,
	Max = 10,
	Def = 10
})
Fov.ColorPicker({
	Text = "Color",
	Default = Color3.fromRGB(255,255,255),
	Callback = function(value)
		aimbot:Set("FovCircle","Color",value)
	end
})
Fov.Slider({
	Text = "Number of Sides",
	Callback = function(value)
		aimbot:Set("FovCircle","NumSides",value)
	end,
	Min = 16,
	Max = 128,
	Def = 64
})

local list = getgenv().AimbotSettings.Whitelisted
local plr = nil
Other.TextField({
	Text = "Username or User ID",
	Type = "Default",
	Callback = function(value)
		if value:gsub(" ","") ~= "" and not players:FindFirstChild(value) then
			return Banner(value.." is not in the game.")
		end
		plr = value
		print(plr)
	end
})
Other.Button({
	Text = "Add Player to Whitelist",
	Callback = function()
		if plr == nil then
			return Banner("Please enter a Username or User ID.")
		end
		if table.find(list,plr) then
			return Banner(plr.." is already whitelisted.")
		end
		table.insert(list,plr)
	end
})
Other.Button({
	Text = "Remove Player from Whitelist",
	Callback = function()
		if plr == nil then
			return Banner("Please enter a Username or User ID.")
		end
		if not table.find(list,plr) then
			return Banner(plr.." is not whitelisted.")
		end
		table.remove(list,table.find(list,plr))
	end
})
Other.Toggle({
	Text = "Whitelist Friends",
	Callback = function(value)
		aimbot:Set("Other","WhitelistFriends",value)
	end,
	Enabled = true
})
Other.Button({
	Text = "Destroy Aimbot",
	Callback = function()
		aimbot:Destroy()
	end
})
