repeat
	task.wait(0.5)
until not UESP_LOADING
getgenv().UAIM_LOADING = true
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

if UAIM then
	return
end
getgenv().OldInstance = nil

local function Load(file)
	return loadstring(game:HttpGet(string.format("https://raw.githubusercontent.com/zzerexx/scripts/main/%s.lua", file)))()
end

local version = "v1.1.15"
local aimbot = Load("UniversalAimbot")
local cfg = Load("ConfigManager")
local Material = Load("MaterialLuaRemake")
local UI = Material.Load({
	Title = "Universal Aimbot",
	Style = 3,
	SizeX = 400,
	SizeY = 535,
	Theme = "Dark"
})
local players = game:GetService("Players")

local icons = {
	['Aimbot'] = "https://i.imgur.com/Bcaku7A.png",
	['Aim Assist'] = "https://i.imgur.com/Bcaku7A.png",
	['Settings'] = "https://i.imgur.com/6uJAQON.png",
	['Fov Circle'] = "https://i.imgur.com/HGAgY9G.png",
	['Trigger Bot'] = "https://i.imgur.com/ePrh1aW.png",
	['Other'] = "https://i.imgur.com/Lwl0iV7.png",
	['Configs'] = "https://i.imgur.com/bcuIP5f.png",
	['Feedback'] = "https://i.imgur.com/FYbAIod.png"
}
for i,v in next, icons do
	local folder = "UAIM_Icons"
	if not isfolder("UAIM_Icons") then
		makefolder("UAIM_Icons")
	end
	local path = folder.."\\"..i..".png"
	if not isfile(path) then
		writefile(path, game:HttpGet(v))
	end
end

function page(title)
	return UI.new({Title = title, ImageId = "UAIM_Icons\\"..title..".png", ImageSize = Vector2.new(20, 20)})
end

local Aimbot = page("Aimbot")
local Assist = page("Aim Assist")
local Settings = page("Settings")
local Fov = page("Fov Circle")
local Trigger = page("Trigger Bot")
local Other = page("Other")
local Configs = page("Configs")
local Feedback = page("Feedback")
local ss = getgenv().AimbotSettings
local conn1,conn2,conn3
local cfgname,selectedcfg = "",""
local togglekey = Enum.KeyCode.RightControl
local aimbottogglebtn, uitogglebtn

local newsettings = {
	TriggerBot = {
		Delay = 60,
		Spam = true,
		ClicksPerSecond = 10
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

local function save(a)
	cfg.Save(a, {
		settings = ss,
		ui = {
			ToggleKey = togglekey.Name
		}
	})
end
local function load(a)
	local settings = ((a.Data ~= nil and a.Data.settings ~= nil and a.Data.settings) or a.settings ~= nil and a.settings) or a
	for i,v in next, settings do
		if typeof(v) == "table" then
			for i2,v2 in next, v do
				aimbot:Set(i, i2, v2)
			end
		else
			aimbot:Set("Other", i, v)
		end
	end
	task.spawn(function()
		repeat task.wait(0.25) until aimbottogglebtn ~= nil and uitogglebtn ~= nil
		local key = settings.ToggleKey
		aimbottogglebtn:SetBind((typeof(key) == "EnumItem" and key) or Enum.KeyCode[key])
		if a.Data ~= nil and a.Data.ui ~= nil then
			local b = a.Data.ui.ToggleKey
			if b then
				togglekey = Enum.KeyCode[b]
				uitogglebtn:SetBind(togglekey)
			end
		end
	end)
end

cfg.Init("UAIM", {
	settings = ss,
	ui = {
		ToggleKey = togglekey.Name
	}
}, load)

function destroy()
	conn1:Disconnect()
	conn2:Disconnect()
	conn3:Disconnect()
	aimbot:Destroy()
	UI.UI:Destroy()
	getgenv().UAIM = nil
end

do -- Aimbot
	local type = "Aimbot"
	Aimbot.Toggle({
		Text = "Enabled",
		Callback = function(value)
			aimbot:Set(type, "Enabled", value)
		end,
		Enabled = ss.Aimbot.Enabled
	})
	Aimbot.Dropdown({
		Text = "Target Part",
		Callback = function(value)
			aimbot:Set(type, "TargetPart", value)
		end,
		Options = {"Head", "UpperTorso", "Torso", "HumanoidRootPart"},
		Def = ss.Aimbot.TargetPart,
		Menu = {
			Info = function()
				UI.Banner("Some games don't have certain parts. For example, Arsenal doesn't have Torso, so you will have to select UpperTorso.")
			end
		}
	})
	Aimbot.TextField({
		Text = "Target Part (Custom)",
		Type = "Default",
		Callback = function(value)
			aimbot:Set(type, "TargetPart", value)
		end
	})
	Aimbot.Toggle({
		Text = "Use mousemoverel",
		Callback = function(value)
			aimbot:Set(type, "Use_mousemoverel", value)
		end,
		Enabled = ss.Aimbot.Use_mousemoverel
	})
	Aimbot.Slider({
		Text = "Strength",
		Callback = function(value)
			aimbot:Set(type, "Strength", value)
		end,
		Min = 1,
		Max = 200,
		Def = ss.Aimbot.Strength,
		Menu = {
			Info = function()
				UI.Banner("If you are experiencing shakiness, try raising the Refresh Rate to 10 (if its lower).\nAlternatively, you can lower the Strength.")
			end
		}
	})
	Aimbot.Dropdown({
		Text = "Aim Type",
		Callback = function(value)
			aimbot:Set(type, "AimType", value)
		end,
		Options = {"Hold", "Toggle"},
		Def = ss.Aimbot.AimType
	})
end

do -- Aim Assist
	local type = "AimAssist"
	Assist.Toggle({
		Text = "Enabled",
		Callback = function(value)
			aimbot:Set(type, "Enabled", value)
		end,
		Enabled = ss.AimAssist.Enabled
	})
	Assist.Slider({
		Text = "Minimum Fov",
		Callback = function(value)
			aimbot:Set(type, "MinFov", value)
		end,
		Min = 0,
		Max = 50,
		Def = ss.AimAssist.MinFov
	})
	Assist.Slider({
		Text = "Maximum Fov",
		Callback = function(value)
			aimbot:Set(type, "MaxFov", value)
		end,
		Min = 0,
		Max = 200,
		Def = ss.AimAssist.MaxFov
	})
	Assist.Toggle({
		Text = "Dynamic Fov",
		Callback = function(value)
			aimbot:Set(type, "DynamicFov", value)
		end,
		Enabled = ss.AimAssist.DynamicFov
	})
	Assist.Toggle({
		Text = "Show Fov",
		Callback = function(value)
			aimbot:Set(type, "ShowFov", value)
		end,
		Enabled = ss.AimAssist.ShowFov
	})
	Assist.Slider({
		Text = "Strength",
		Callback = function(value)
			aimbot:Set(type,"Strength",value)
		end,
		Min = 1,
		Max = 100,
		Def = ss.AimAssist.Strength
	})
	Assist.Toggle({
		Text = "Slow Sensitivity",
		Callback = function(value)
			aimbot:Set(type, "SlowSensitivity", value)
		end,
		Enabled = ss.AimAssist.SlowSensitivity
	})
	Assist.Slider({
		Text = "Slow Factor",
		Callback = function(value)
			aimbot:Set(type,"SlowFactor",value / 10)
		end,
		Min = 10,
		Max = 100,
		Def = ss.AimAssist.SlowFactor * 10
	})
	Assist.Toggle({
		Text = "Require Movement",
		Callback = function(value)
			aimbot:Set(type, "RequireMovement", value)
		end,
		Enabled = true
	})
end

do -- Settings
	local type = "Other"
	Settings.Toggle({
		Text = "Team Check",
		Callback = function(value)
			aimbot:Set(type, "TeamCheck", value)
		end,
		Enabled = ss.TeamCheck
	})
	Settings.Toggle({
		Text = "Visible Check",
		Callback = function(value)
			aimbot:Set(type, "VisibleCheck", value)
		end,
		Enabled = ss.VisibleCheck
	})
	Settings.Slider({
		Text = "Refresh Rate",
		Callback = function(value)
			aimbot:Set(type, "RefreshRate", value)
		end,
		Min = 0,
		Max = 50,
		Def = ss.RefreshRate
	})
	aimbottogglebtn = Settings.Keybind({
		Text = "Aimbot Toggle Key",
		Callback = function(value)
			aimbot:Set(type, "ToggleKey", value.Name)
		end,
		Def = Enum.KeyCode[aimbot:Get("Other", "ToggleKey")],
		AllowMouse = false
	})
	Settings.Slider({
		Text = "Maximum Distance",
		Callback = function(value)
			aimbot:Set(type, "MaximumDistance", value)
		end,
		Min = 0,
		Max = 2000,
		Def = ss.MaximumDistance
	})
	Settings.Toggle({
		Text = "Always Active",
		Callback = function(value)
			aimbot:Set(type, "AlwaysActive", value)
		end,
		Enabled = ss.AlwaysActive,
		Menu = {
			Info = function()
				UI.Banner("If enabled, aimbot/aim assist will always be active, even without holding right click.")
			end
		}
	})
end

do -- Fov Circle
	local type = "FovCircle"
	Fov.Toggle({
		Text = "Enabled",
		Callback = function(value)
			aimbot:Set(type, "Enabled", value)
		end,
		Enabled = ss.FovCircle.Enabled
	})
	Fov.Toggle({
		Text = "Dynamic",
		Callback = function(value)
			aimbot:Set(type, "Dynamic", value)
		end,
		Enabled = ss.FovCircle.Dynamic
	})
	Fov.Slider({
		Text = "Radius",
		Callback = function(value)
			aimbot:Set(type, "Radius", value)
		end,
		Min = 0,
		Max = 500,
		Def = ss.FovCircle.Radius
	})
	Fov.Slider({
		Text = "Transparency",
		Callback = function(value)
			aimbot:Set(type, "Transparency", value / 10)
		end,
		Min = 0,
		Max = 10,
		Def = ss.FovCircle.Transparency * 10
	})
	Fov.ColorPicker({
		Text = "Color",
		Default = ss.FovCircle.Color,
		Callback = function(value)
			aimbot:Set(type, "Color", value)
		end
	})
	Fov.Slider({
		Text = "Number of Sides",
		Callback = function(value)
			aimbot:Set(type, "NumSides", value)
		end,
		Min = 16,
		Max = 128,
		Def = ss.FovCircle.NumSides
	})
end

do -- Trigger Bot
	local type = "TriggerBot"
	Trigger.Toggle({
		Text = "Enabled",
		Callback = function(value)
			aimbot:Set(type, "Enabled", value)
		end,
		Enabled = ss.TriggerBot.Enabled
	})
	Trigger.Slider({
		Text = "Delay (milliseconds)",
		Callback = function(value)
			aimbot:Set(type, "Delay", value)
		end,
		Min = 0,
		Max = 1000,
		Def = ss.TriggerBot.Delay
	})
	Trigger.Toggle({
		Text = "Spam",
		Callback = function(value)
			aimbot:Set(type, "Spam", value)
		end,
		Enabled = ss.TriggerBot.Spam
	})
	Trigger.Slider({
		Text = "Clicks Per Second",
		Callback = function(value)
			aimbot:Set(type, "ClicksPerSecond", value)
		end,
		Min = 0,
		Max = 37,
		Def = ss.TriggerBot.ClicksPerSecond,
		Menu = {
			Info = function()
				UI.Banner("Set this to 0 to get anything higher than 37 CPS.")
			end
		}
	})
end

do -- Other
	local type = "Other"
	local list = getgenv().AimbotSettings.Whitelisted
	local plr = players.LocalPlayer.Name
	local dd = Other.Dropdown({
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
	Other.Button({
		Text = "Add Player to Whitelist",
		Callback = function()
			if plr == "" then
				return UI.Banner("Please select a player.")
			end
			if table.find(list, plr) then
				return UI.Banner(plr.." is already whitelisted.")
			end
			table.insert(list, plr)
		end
	})
	Other.Button({
		Text = "Remove Player from Whitelist",
		Callback = function()
			if plr == nil then
				return UI.Banner("Please select a player.")
			end
			if not table.find(list,plr) then
				return UI.Banner(plr.." is not whitelisted.")
			end
			table.remove(list, table.find(list, plr))
		end
	})
	Other.Toggle({
		Text = "Whitelist Friends",
		Callback = function(value)
			aimbot:Set(type, "WhitelistFriends", value)
		end,
		Enabled = true,
		Menu = {
			Info = function()
				UI.Banner("If enabled, your friends will automatically be whitelisted upon joining.")
			end
		}
	})
	Other.Button({
		Text = "Destroy Aimbot",
		Callback = destroy,
		Menu = {
			Info = function()
				UI.Banner("This button will completely remove Universal Aimbot, including the UI.")
			end
		}
	})
	Other.Button({
		Text = "Credits",
		Callback = function()
			UI.Banner("Material UI Library created by twink marie\nUniversal Aimbot created by zzerexx#3970")
		end,
		Menu = {
			Version = function()
				UI.Banner(version)
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

do -- Feedback
	local Http = game:GetService("HttpService")
	local request = request or http_request or (http and http.request) or nil
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
		Feedback.TextBox({
			Text = "Your message here",
			Callback = function(value)
				msg = value
			end,
			ClearOnFocus = false
		})
		Feedback.Button({
			Text = "Send Feedback",
			Callback = function()
				if sending then UI.Banner("Please wait until your request has been completed.") end
				sending = true
				UI.Banner("Sending feedback...")

				local req = request({
					Url = "https://websec.services/ws/send/ZUC1hEr2taJ2a1NBGtPZ2VcKBYPf5YeebL801aC1",
					Method = "POST",
					Headers = {
						['Content-Type'] = "application/json"
					},
					Body = Http:JSONEncode({
						content = "",
						embeds = {{
							title = "Universal Aimbot Feedback",
							description = string.format("`%s`", msg),
							timestamp = DateTime.now():ToIsoDate(),
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

				local status = Http:JSONDecode(req.Body).status
				UI.Banner((status == 10 and "Thank you for your feedback!") or ("Failed to send feedback;\n"..errors[status]))
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

getgenv().UAIM_LOADING = false
