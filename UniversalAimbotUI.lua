getgenv().AimbotSettings = {
	Aimbot = {
		Enabled = true,
		TargetPart = "Head",
		VisibleCheck = true,
		Use_mousemoverel = true,
		Strength = 100, -- 1% - 100%
		TeamCheck = true, -- Press ] to toggle
		Keybind = Enum.UserInputType.MouseButton2, -- Must be a UserInputType or KeyCode
		AimType = "Hold", -- "Hold" or "Toggle"
		AlwaysActive = false,
		ToggleKey = Enum.KeyCode.RightShift,
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
	Ignore = nil -- Raycast Ignore
} -- v1.1.5
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
	Text = "Target Part",
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
	Max = 100,
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
