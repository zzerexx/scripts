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

if UAIMBOT then
    return
end
if OldInstance then
    getgenv().OldInstance = nil
end

local version = "v1.1.13"
local players = game:GetService("Players")
local aimbot = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalAimbot.lua"))()
local cfg = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/ConfigManager.lua"))()
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

function destroy()
    conn1:Disconnect()
    aimbot:Destroy()
    ui:Destroy()
    getgenv().UAIM = nil
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
        Options = {"Head","UpperTorso","Torso","HumanoidRootPart"},
        Menu = {
            Info = function()
                Banner("Some games don't have certain parts. For example, Arsenal doesn't have Torso, so you will have to select UpperTorso.")
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
                Banner("If you are experiencing shakiness, try raising the Refresh Rate to 10 (if its lower).\nAlternatively, you can lower the Strength.")
            end
        }
    })
    Aimbot.Dropdown({
        Text = "Aim Type",
        Callback = function(value)
            aimbot:Set(type, "AimType", value)
        end,
        Options = {"Hold","Toggle"}
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
    aimbottogglebtn = Settings.Button({
        Text = "Aimbot Toggle Key: "..aimbot:Get(type, "ToggleKey"),
        Callback = function()
            Keybind(aimbottogglebtn, "Aimbot Toggle Key", function(key)
                aimbot:Set(type, "ToggleKey", key.Name)
            end)
        end
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
                Banner("If enabled, aimbot/aim assist will always be active, even without holding right click.")
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
                Banner("Set this to 0 to get anything higher than 37 CPS.")
            end
        }
    })
end

do -- Other
    local type = "Other"
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
            aimbot:Set(type, "WhitelistFriends", value)
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
        Callback = destroy,
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
    if not game:GetService("HttpService"):JSONDecode(readfile(listfiles("UAIM")[1])).Data then
        for _,v in next, listfiles("UAIM") do
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
                    ToggleKey = togglekey.Name
                }
            }))
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
        local key = settings.ToggleKey
        aimbottogglebtn:SetText("Aimbot Toggle Key: "..((typeof(key) == "EnumItem" and key.Name) or key))
		if a.Data ~= nil and a.Data.ui ~= nil then
            local b = a.Data.ui.ToggleKey
			if b then
                togglekey = Enum.KeyCode[b]
                uitogglebtn:SetText("UI Toggle Key: "..b)
            end
		end
	end

	cfg.Init("UAIM", {
		settings = ss,
		ui = {
			ToggleKey = togglekey.Name
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

conn1 = game:GetService("UserInputService").InputBegan:Connect(function(i,gp)
    if not gp and i.KeyCode == togglekey then
        ui.Enabled = not ui.Enabled
    end
end)

loaded = true
getgenv().UAIM_LOADING = false
