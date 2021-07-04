-- OLD VERSION
local ss = {
    SilentAim = {
        Enabled = true,
        TargetType = "Closest to Player"
    },
}

if not getgenv().EspSettings then
    getgenv().EspSettings = {
        TeamCheck = true,
        ToggleKey = Enum.KeyCode.RightAlt,
        AntiDetection = true,
        Boxes = {Enabled = true,Transparency = 0.7,Color = Color3.fromRGB(255,255,255),UseTeamColor = true},
        Tracers = {Enabled = false,Transparency = 0.7,Color = Color3.fromRGB(255,255,255),UseTeamColor = true,Origin = "Top",Thickness = 1},
        Names = {Enabled = true,Transparency = 0.7,Color = Color3.fromRGB(255,255,255),UseTeamColor = true,Font = Drawing.Fonts.UI,Size = 18,Outline = true,OutlineColor = Color3.fromRGB(0,0,0),ShowDistance = false,ShowHealth = false,UseDisplayName = false,},
        Skeletons = {Enabled = false,Transparency = 0.7,Color = Color3.fromRGB(255,255,255),UseTeamColor = true,Thickness = 1},
        LookTracers = {Enabled = false,Transparency = 0.7,Color = Color3.fromRGB(255,255,255),UseTeamColor = true,IgnoreWater = true,Thickness = 1
        }
    } -- v1.4.0
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEsp.lua", true))()
end

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local UI = Material.Load({
    Title = "aimblox gui",
    Style = 2,
    SizeX = 350,
    SizeY = 250,
    Theme = "Dark"
})
local SilentAim = UI.New({Title = "Silent Aim"})
local ESP = UI.New({Title = "ESP"})
local GunMods = UI.New({Title = "Gun Mods"})
local Misc = UI.New({Title = "Miscellaneous"})

function Banner(text)
    UI.Banner({
        Text = text
    })
end
function GunMod(name,value)
    for i,v in next, getgc(true) do
        if typeof(v) == "table" then
            if rawget(v,name) then
                rawset(v,name,value or math.huge)
            end
        end
    end
end
local bannershown = true
spawn(function() wait(2) bannershown = false end)
SilentAim.Toggle({
    Text = "Enabled",
    Callback = function(value)
        ss.SilentAim.Enabled = value
        if not bannershown and game.PlaceId == 6808416928 then
            Banner("Warning! Destroying around 75 lobby targets will get you kicked!")
            bannershown = true
        end
    end,
    Enabled = true,
})
SilentAim.Dropdown({
    Text = "Target Type",
    Callback = function(value)
        ss.SilentAim.TargetType = value
    end,
    Options = {"Closest to Player","Closest to Mouse"}
})

ESP.Toggle({
    Text = "Boxes",
    Callback = function(value)
        getgenv().EspSettings.Boxes.Enabled = value
    end,
    Enabled = true
})
ESP.Toggle({
    Text = "Tracers",
    Callback = function(value)
        getgenv().EspSettings.Tracers.Enabled = value
    end,
    Enabled = true
})
ESP.Toggle({
    Text = "Names",
    Callback = function(value)
        getgenv().EspSettings.Names.Enabled = value
    end,
    Enabled = true
})
ESP.Toggle({
    Text = "Team Check",
    Callback = function(value)
        getgenv().EspSettings.TeamCheck = value
    end,
    Enabled = true
})

GunMods.Button({
    Text = "Infinite Ammo",
    Callback = function()
        GunMod("MaxAmmo",math.huge)
        GunMod("Ammo",math.huge)
    end
})
GunMods.Dropdown({
    Text = "Firing Mode",
    Callback = function(value)
        GunMod("FiringMode",value)
    end,
    Options = {"Auto","Burst","Semi"}
})

Misc.Button({
    Text = "Teleport to Lobby",
    Callback = function()
        game:GetService("TeleportService"):Teleport(6808416928)
    end
})
Misc.Button({
    Text = "Teleport to Competitive",
    Callback = function()
        game:GetService("TeleportService"):Teleport(6808489605)
    end
})
Misc.Button({
    Text = "Redeem All Codes",
    Callback = function()
        for i,v in next, game:GetService("ReplicatedFirst").Shared.Components.Player.Codes:GetChildren() do
            game:GetService("ReplicatedStorage").Remotes.ActivateCode:FireServer(v.Name)
        end
    end
})
Misc.Button({
    Text = "Rejoin Game",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId)
    end
})

local players = game:GetService("Players")
local player = players.LocalPlayer
local camera = workspace.CurrentCamera

function ClosestPlayer()
    local plr
    local closest = math.huge
    for i,v in next, players:GetPlayers() do
        if v ~= player and v.Character and v.Character.Humanoid.Health > 0 then
            local mag = (player.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
            if ss.SilentAim.TargetType == "Closest to Mouse" then
                local mouse = game:GetService("UserInputService"):GetMouseLocation()
                local vector, inViewport = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                if inViewport then
                    mag = (Vector2.new(mouse.X,mouse.Y) - Vector2.new(vector.X,vector.Y)).Magnitude
                end
            end
            if mag < closest then
                if (player.Team ~= nil and v.Team ~= player.Team) or player.Team == nil then
                    plr = v
                    closest = mag
                end
            end
        end
    end
    return plr
end

local mt = getrawmetatable(game)
local oldnc = mt.__namecall
setreadonly(mt,false)
mt.__namecall = newcclosure(function(self,...)
    if ss.SilentAim.Enabled and getnamecallmethod() == "FireServer" and self.Name == "ShotEvent" then
        if game.PlaceId == 6808416928 then
            game:GetService("ReplicatedStorage").Remotes.HitLobbyTarget:FireServer()
        elseif game.PlaceId == 6808489605 then
            if ClosestPlayer() == nil then
                return
            end
            local plr = ClosestPlayer()
            local args = {
                [1] = plr,
                [2] = camera:FindFirstChildOfClass("Model").Name,
                [3] = require(game:GetService("ReplicatedFirst"):WaitForChild("Shared"):WaitForChild("RemoteUtils")).PackVector(plr.Character.Head.Position),
                [4] = plr.Character.Head,
                [5] = "Default"
            }
            game:GetService("ReplicatedStorage").Remotes.GunShot:FireServer(unpack(args))
        end
    end
    return oldnc(self,...)
end)
setreadonly(mt,true)
