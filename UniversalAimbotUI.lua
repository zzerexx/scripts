if not AimbotSettings then
	getgenv().AimbotSettings = {
		TeamCheck = true, -- Press ] to toggle
		VisibleCheck = true,
		RefreshRate = 10, -- how fast the aimbot updates (milliseconds)
		Keybind = "MouseButton2",
		ToggleKey = "RightShift",
		MaximumDistance = 300, -- Set this to something lower if you dont wanna lock on some random person across the map
		AlwaysActive = false,
		Aimbot = {
			Enabled = true,
			TargetPart = "Head",
			Use_mousemoverel = true,
			Strength = 100, -- 1% - 200%
			AimType = "Hold", -- "Hold" or "Toggle"
		},
		AimAssist = {
			Enabled = false,
			MinFov = 15,
			MaxFov = 80,
			DynamicFov = true,
			ShowFov = false, -- Shows Min & Max fov
			Strength = 55, -- 1% - 100%
			SlowSensitivity = true,
			SlowFactor = 1.75, -- 1% - 10%
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
		TriggerBot = {
			Enabled = false,
			Delay = 60, -- how long it waits before clicking (milliseconds)
			Spam = true, -- for semi-auto weapons
		},
		Whitelisted = {}, -- Username or User ID
		WhitelistFriends = true, -- Automatically adds friends to the whitelist
		Ignore = nil -- Raycast Ignore
	}
end

if UAIMBOT then
	return
end
if OldInstance then
	getgenv().OldInstance = nil
end

local version = "v1.1.14"
local players = game:GetService("Players")
local aimbot = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalAimbot.lua"))()
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local UI = Material.Load({
	Title = "Universal Aimbot",
	Style = 3,
	SizeX = 400,
	SizeY = 535,
	Theme = "Dark"
})
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
	local t = {}
	for i,v in next, a do
		if typeof(v) == "table" then
			v = clonetable(v)
		end
		t[i] = v
	end
	return t
end

local Aimbot = UI.New({Title = "Aimbot"})
local Assist = UI.New({Title = "Aim Assist"})
local Settings = UI.New({Title = "Settings"})
local Fov = UI.New({Title = "Fov Circle"})
local Trigger = UI.New({Title = "Trigger Bot"})
local Other = UI.New({Title = "Other"})
local Configs = UI.New({Title = "Configs"})
local ui = OldInstance
local ss = getgenv().AimbotSettings
local loaded = false
local conn1 = nil
local cfgname,selectedcfg = "",""
local name = "UAIM"

if not isfolder(name) then
	makefolder(name)
end
if isfile(name..".json") then
	writefile(name.."\\Default.json", readfile(name..".json"))
	delfile(name..".json")
end

local newsettings = {
	TriggerBot = {
		Enabled = false,
			Delay = 60,
			Spam = true,
			ClicksPerSecond = 10
	}
}
for i,v in next, newsettings do
	if ss[i] == nil then
		ss[i] = v
	else
		for i2,v2 in next, v do
			if ss[i][i2] == nil then
				ss[i][i2] = v2
			end
		end
	end
end

function destroy()
	conn1:Disconnect()
	aimbot:Destroy()
	ui:Destroy()
end
function save()
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

	writefile(name.."\\"..cfgname..".json", game:GetService("HttpService"):JSONEncode(a))
end
function load()
	local path = name.."\\"..selectedcfg
	if not isfile(path) then Banner(selectedcfg.." does not exist.") return end
	local a = game:GetService("HttpService"):JSONDecode(readfile(path))
	for i,v in next, a do
		if typeof(v) == "table" then
			for i2,v2 in next, v do
				if typeof(v2) == "table" and v2.R then
					local color = tocolor(v2)
					a[i][i2] = color
					aimbot:Set(i, i2, color)
				else
					aimbot:Set(i, i2, v2)
				end
			end
		else
			aimbot:Set("Other", i, v)
		end
	end
end
if isfile(name.."\\Default.json") then
	selectedcfg = "Default.json"
	load()
else
	cfgname = "Default"
	save()
	cfgname = ""
end

do -- Aimbot
	Aimbot.Toggle({
		Text = "Enabled",
		Callback = function(value)
			aimbot:Set("Aimbot","Enabled",value)
		end,
		Enabled = ss.Aimbot.Enabled
	})
	Aimbot.Dropdown({
		Text = "Target Part",
		Callback = function(value)
			aimbot:Set("Aimbot","TargetPart",value)
		end,
		Options = {"Head","UpperTorso","Torso","HumanoidRootPart"},
		Menu = {
			Info = function()
				Banner("Some games don't have certain parts. For example, Arsenal doesn't have Torso, so you will have to select UpperTorso.")
			end
		}
	})
	Aimbot.Toggle({
		Text = "Use mousemoverel",
		Callback = function(value)
			aimbot:Set("Aimbot","Use_mousemoverel",value)
		end,
		Enabled = ss.Aimbot.Use_mousemoverel
	})
	Aimbot.Slider({
		Text = "Strength",
		Callback = function(value)
			aimbot:Set("Aimbot","Strength",value)
		end,
		Min = 1,
		Max = 200,
		Def = ss.Aimbot.Strength
	})
	Aimbot.Dropdown({
		Text = "Aim Type",
		Callback = function(value)
			aimbot:Set("Aimbot","AimType",value)
		end,
		Options = {"Hold","Toggle"}
	})
end

do -- Aim Assist
	Assist.Toggle({
		Text = "Enabled",
		Callback = function(value)
			aimbot:Set("AimAssist","Enabled",value)
		end,
		Enabled = ss.AimAssist.Enabled
	})
	Assist.Slider({
		Text = "Minimum Fov",
		Callback = function(value)
			aimbot:Set("AimAssist","MinFov",value)
		end,
		Min = 0,
		Max = 50,
		Def = ss.AimAssist.MinFov
	})
	Assist.Slider({
		Text = "Maximum Fov",
		Callback = function(value)
			aimbot:Set("AimAssist","MaxFov",value)
		end,
		Min = 0,
		Max = 200,
		Def = ss.AimAssist.MaxFov
	})
	Assist.Toggle({
		Text = "Dynamic Fov",
		Callback = function(value)
			aimbot:Set("AimAssist","DynamicFov",value)
		end,
		Enabled = ss.AimAssist.DynamicFov
	})
	Assist.Toggle({
		Text = "Show Fov",
		Callback = function(value)
			aimbot:Set("AimAssist","ShowFov",value)
		end,
		Enabled = ss.AimAssist.ShowFov
	})
	Assist.Slider({
		Text = "Strength",
		Callback = function(value)
			aimbot:Set("AimAssist","Strength",value)
		end,
		Min = 1,
		Max = 100,
		Def = ss.AimAssist.Strength
	})
	Assist.Toggle({
		Text = "Slow Sensitivity",
		Callback = function(value)
			aimbot:Set("AimAssist","SlowSensitivity",value)
		end,
		Enabled = ss.AimAssist.SlowSensitivity
	})
	Assist.Slider({
		Text = "Slow Factor",
		Callback = function(value)
			aimbot:Set("AimAssist","SlowFactor",value / 10)
		end,
		Min = 10,
		Max = 100,
		Def = ss.AimAssist.SlowFactor * 10
	})
	Assist.Toggle({
		Text = "Require Movement",
		Callback = function(value)
			aimbot:Set("AimAssist","RequireMovement",value)
		end,
		Enabled = true
	})
end

do -- Settings
	Settings.Toggle({
		Text = "Team Check",
		Callback = function(value)
			aimbot:Set("Other","TeamCheck",value)
		end,
		Enabled = ss.TeamCheck
	})
	Settings.Toggle({
		Text = "Visible Check",
		Callback = function(value)
			aimbot:Set("Other","VisibleCheck",value)
		end,
		Enabled = ss.VisibleCheck
	})
	Settings.Slider({
		Text = "Refresh Rate",
		Callback = function(value)
			aimbot:Set("Other","RefreshRate",value)
		end,
		Min = 0,
		Max = 50,
		Def = ss.RefreshRate
	})
	Settings.TextField({
		Text = "Toggle Key",
		Type = "Default",
		Callback = function(value)
			if loaded then
				if Enum.KeyCode[value] then
					aimbot:Set("Other","Keybind",Enum.KeyCode[value])
				else
					Banner("Invalid KeyCode.\nVisit https://developer.roblox.com/en-us/api-reference/enum/KeyCode for a list of KeyCodes.")
				end
			end
		end,
		Menu = {
			Info = function()
				Banner("This is the keybind that toggles aimbot and aim assist (switches between the two). Default is RightShift. Must be a valid KeyCode!")
			end,
			KeyCodes = function()
				setclipboard("https://developer.roblox.com/en-us/api-reference/enum/KeyCode")
				Banner("Copied to your clipboard!")
			end
		}
	})
	Settings.Slider({
		Text = "Maximum Distance",
		Callback = function(value)
			aimbot:Set("Other","MaximumDistance",value)
		end,
		Min = 0,
		Max = 2000,
		Def = ss.MaximumDistance
	})
	Settings.Toggle({
		Text = "Always Active",
		Callback = function(value)
			aimbot:Set("Other","AlwaysActive",value)
		end,
		Enabled = ss.AlwaysActive,
		Menu = {
			Info = function()
				Banner("If enabled, aimbot/aim assist will always be active, even without holding right click.")
			end
		}
	})
end

do -- Fov Circle
	Fov.Toggle({
		Text = "Enabled",
		Callback = function(value)
			aimbot:Set("FovCircle","Enabled",value)
		end,
		Enabled = ss.FovCircle.Enabled
	})
	Fov.Toggle({
		Text = "Dynamic",
		Callback = function(value)
			aimbot:Set("FovCircle","Dynamic",value)
		end,
		Enabled = ss.FovCircle.Dynamic
	})
	Fov.Slider({
		Text = "Radius",
		Callback = function(value)
			aimbot:Set("FovCircle","Radius",value)
		end,
		Min = 0,
		Max = 500,
		Def = ss.FovCircle.Radius
	})
	Fov.Slider({
		Text = "Transparency",
		Callback = function(value)
			aimbot:Set("FovCircle","Transparency",value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = ss.FovCircle.Transparency * 10
	})
	Fov.ColorPicker({
		Text = "Color",
		Default = ss.FovCircle.Color,
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
		Def = ss.FovCircle.NumSides
	})
end

do -- Trigger Bot
	Trigger.Toggle({
		Text = "Enabled",
		Callback = function(value)
			aimbot:Set("TriggerBot","Enabled",value)
		end,
		Enabled = ss.TriggerBot.Enabled
	})
	Trigger.Slider({
		Text = "Delay (milliseconds)",
		Callback = function(value)
			aimbot:Set("TriggerBot","Delay",value)
		end,
		Min = 0,
		Max = 1000,
		Def = ss.TriggerBot.Delay
	})
	Trigger.Toggle({
		Text = "Spam",
		Callback = function(value)
			aimbot:Set("TriggerBot","Spam",value)
		end,
		Enabled = ss.TriggerBot.Spam
	})
	Trigger.Slider({
		Text = "Clicks Per Second",
		Callback = function(value)
			aimbot:Set("TriggerBot","ClicksPerSecond",value)
		end,
		Min = 0,
		Max = 37,
		Def = ss.TriggerBot.ClicksPerSecond,
		Menu = {
			Info = function()
				Banner("Set this to 0 to get anything higher than 37 CPS.")
			end
		}
	})
end

do -- Other
	local list = getgenv().AimbotSettings.Whitelisted
	local plr = nil
	Other.TextField({
		Text = "Username or User ID",
		Type = "Default",
		Callback = function(value)
			if loaded then
				if not players:FindFirstChild(value) then
					return Banner(value.." is not in the game. (must be a username or user id, not display name)")
				end
				plr = value
			end
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
		Enabled = true,
		Menu = {
			Info = function()
				Banner("If enabled, your friends will automatically be whitelisted upon joining.")
			end
		}
	})
	Other.Button({
		Text = "Destroy Aimbot",
		Callback = function()
			conn1:Disconnect()
			aimbot:Destroy()
			ui:Destroy()
		end,
		Menu = {
			Info = function()
				Banner("This button will completely remove Universal Aimbot, including the UI.")
			end
		}
	})
	Other.Button({
		Text = "Credits",
		Callback = function()
			Banner("Material UI Library created by twink marie\nUniversal Aimbot created by zzerexx#3970")
		end,
		Menu = {
			Version = function()
				Banner(version)
			end
		}
	})
	Other.Button({
		Text = "UI Toggle Key: Right Control",
		Callback = function() end
	})
end

do -- Configs
	local list
	local function isempty(s)
		return s:gsub(" ","") == ""
	end
	local function refresh()
		local t = {}
		for _,v in next, listfiles(name) do
			table.insert(t, v:sub(6,-1))
		end
		table.sort(t, function(a,b)
			return a < b
		end)
		list:SetOptions(t)
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
				save()
				Banner("Successfully created a new config: "..cfgname)
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
		Callback = load,
		Menu = {
			Info = function()
				Banner("Your settings will not apply to the UI. (cuz im lazy)")
			end
		}
	})
	Configs.Button({
		Text = "Delete Selected Config",
		Callback = function()
			if isfile(name.."\\"..selectedcfg) then
				delfile(name.."\\"..selectedcfg)
				Banner("Successfully deleted config: "..selectedcfg)
				refresh()
			else
				Banner(selectedcfg.." does not exist.")
			end
		end
	})
	Configs.Button({
		Text = "Set Selected Config as Default",
		Callback = function()
			local old = cfgname
			cfgname = "Default"
			save()
			cfgname = old
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

conn1 = game:GetService("UserInputService").InputBegan:Connect(function(i,gp)
	if not gp and i.KeyCode == Enum.KeyCode.RightControl then
		ui.Enabled = not ui.Enabled
	end
end)

loaded = true
