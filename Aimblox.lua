-- kinda buggy
repeat wait() until game:IsLoaded()
local LOADED = 0
function Debug(msg)
    if getgenv().AIMBLOX_DEBUG == true then
        warn(msg)
    end
end
delay(7,function()
    local codes = {
        [0] = "Failed to load save file",
        [1] = "Universal ESP failed to load",
        [2] = "Silent Aim page failed to load",
        [3] = "ESP page failed to load",
        [4] = "Gun Mods page failed to load",
        [5] = "Player page failed to load",
        [6] = "Miscellaneous page failed to load",
        [7] = "Settings page failed to load",
        [8] = "Failed to hook _FireInternal function",
        [9] = "Failed to hook __namecall method"
    }
    local msg = "Error occurred!\nError: "..codes[LOADED].."\nCode: "..LOADED
    if messagebox then
        messagebox(msg,"Aimblox Gui",0x10)
    else
        game:GetService("Players").LocalPlayer:Kick("\n\n".."Aimblox Gui\n"..msg.."\n")
    end
end)
local version = 1
local ss = {
    Version = version,
    SavedOn = nil,
    SavedOnTick = nil,
    Style = 1,
    Theme = "Dark",
    SilentAim = {
        Enabled = true,
        TargetType = "Closest to Mouse",
        TargetPart = "Head",
        VisibleCheck = true,
        HitChance = 100,
        Fov = 100,
        NumSides = 64,
        UseFovCircle = true,
        DynamicFov = false,
        FovVisible = true,
        FovTransparency = 1,
        FovColor = {
            R = 255,
            G = 255,
            B = 255
        },
        RainbowFov = false,
        Whitelisted = {}
    },
    ESP = {
        Boxes = true,
        Tracers = true,
        Names = true,
        Skeletons = false,
        LookTracers = false,
        TeamCheck = true,
        Transparency = 0.7,
        UseTeamColor = true,
        Color = {
            R = 255,
            G = 255,
            B = 255
        },
        ShowDistance = false,
        ShowHealth = false,
    },
    GunMods = {
        InstantKill = false,
        BulletSpeed = 600,
        RPM = nil,
        FiringMode = nil,
        GunRotation = {
            X = 0,
            Y = 0,
            Z = 0
        },
    },
    Player = {
        WalkSpeedEnabled = false,
        WalkSpeed = 22,
        InfiniteJump = false,
        FieldOfView = 70,
        ThirdPerson = false,
        TPOffset = 10,
        ShowWeapon = true,
        CharacterColor = nil,
        CharacterMaterial = nil,
        RainbowCharacter = false,
        HideAccessories = false,
    },
    Misc = {
        BulletTracers = {
            Enabled = false,
            Transparency = 0.5,
            Duration = 3,
            Color1 = {
                R = 0,
                G = 170,
                B = 255
            },
            Color2 = {
                R = 0,
                G = 0,
                B = 255
            },
        },
        ImpactPoints = {
            Enabled = false,
            Transparency = 0.3,
            Duration = 3,
            Color = {
                R = 0,
                G = 170,
                B = 255
            },
            Size = 0.1,
            Material = "SmoothPlastic"
        },
        GunMaterial = nil,
        ArmMaterial = nil,
        GunReflectance = 0,
        ArmReflectance = 0,
        GunColor = nil,
        ArmColor = nil,
        RainbowGun = false,
        RainbowArms = false,
        HideGloves = false,
        Skybox = "Default"
    },
    Settings = {
        AutoSave = true,
        AutoSaveInterval = 5
    }
}
local SkyboxData = {
    ['Default'] = {
        ["CelestialBodiesShown"] = false,
		["StarCount"] = 0,
		["MoonAngularSize"] = 11,
		["MoonTextureId"] = "rbxasset://sky/moon.jpg",
		["SunAngularSize"] = 21,
		["SunTextureId"] = "rbxasset://sky/sun.jpg",
		["SkyboxBk"] = "rbxassetid://150335574",
		["SkyboxDn"] = "rbxassetid://150335585",
		["SkyboxFt"] = "rbxassetid://150335628",
		["SkyboxLf"] = "rbxassetid://150335620",
		["SkyboxRt"] = "rbxassetid://150335610",
		["SkyboxUp"] = "rbxassetid://150335642",
    },
    ['Night'] = {
        ["CelestialBodiesShown"] = false,
		["StarCount"] = 0,
		["MoonAngularSize"] = 11,
		["MoonTextureId"] = "rbxasset://sky/moon.jpg",
		["SunAngularSize"] = 21,
		["SunTextureId"] = "rbxasset://sky/sun.jpg",
		["SkyboxBk"] = "rbxassetid://12064107",
		["SkyboxDn"] = "rbxassetid://12064152",
		["SkyboxFt"] = "rbxassetid://12064121",
		["SkyboxLf"] = "rbxassetid://12063984",
		["SkyboxRt"] = "rbxassetid://12064115",
		["SkyboxUp"] = "rbxassetid://12064131",
    },
    ['Galaxy'] = {
        ["CelestialBodiesShown"] = false,
		["StarCount"] = 3000,
		["MoonAngularSize"] = 11,
		["MoonTextureId"] = "rbxasset://sky/moon.jpg",
		["SunAngularSize"] = 21,
		["SunTextureId"] = "rbxasset://sky/sun.jpg",
		["SkyboxBk"] = "rbxassetid://149397692",
		["SkyboxDn"] = "rbxassetid://149397686",
		["SkyboxFt"] = "rbxassetid://149397697",
		["SkyboxLf"] = "rbxassetid://149397684",
		["SkyboxRt"] = "rbxassetid://149397688",
		["SkyboxUp"] = "rbxassetid://149397702",
    },
    ['Sunset'] = {
        ["CelestialBodiesShown"] = false,
		["StarCount"] = 1334,
		["MoonAngularSize"] = 11,
		["MoonTextureId"] = "rbxasset://sky/moon.jpg",
		["SunAngularSize"] = 21,
		["SunTextureId"] = "rbxasset://sky/sun.jpg",
		["SkyboxBk"] = "rbxassetid://151165214",
		["SkyboxDn"] = "rbxassetid://151165197",
		["SkyboxFt"] = "rbxassetid://151165224",
		["SkyboxLf"] = "rbxassetid://151165191",
		["SkyboxRt"] = "rbxassetid://151165206",
		["SkyboxUp"] = "rbxassetid://151165227",
    },
    ['Cloudy'] = {
        ["CelestialBodiesShown"] = true,
		["StarCount"] = 3000,
		["MoonAngularSize"] = 11,
		["MoonTextureId"] = "rbxasset://sky/moon.jpg",
		["SunAngularSize"] = 11,
		["SunTextureId"] = "rbxasset://sky/sun.jpg",
		["SkyboxBk"] = "rbxassetid://252760981",
		["SkyboxDn"] = "rbxassetid://252763035",
		["SkyboxFt"] = "rbxassetid://252761439",
		["SkyboxLf"] = "rbxassetid://252760980",
		["SkyboxRt"] = "rbxassetid://252760986",
		["SkyboxUp"] = "rbxassetid://252762652",
    },
    ['Light Blue'] = {
        ["CelestialBodiesShown"] = true,
		["StarCount"] = 1334,
		["MoonAngularSize"] = 11,
		["MoonTextureId"] = "rbxasset://sky/moon.jpg",
		["SunAngularSize"] = 21,
		["SunTextureId"] = "rbxasset://sky/sun.jpg",
		["SkyboxBk"] = "rbxassetid://153695414",
		["SkyboxDn"] = "rbxassetid://153695352",
		["SkyboxFt"] = "rbxassetid://153695452",
		["SkyboxLf"] = "rbxassetid://153695320",
		["SkyboxRt"] = "rbxassetid://153695383",
		["SkyboxUp"] = "rbxassetid://153695471",
    }
}
if isfile("aimbloxsettings.json") then
    ss = game:GetService("HttpService"):JSONDecode(readfile("aimbloxsettings.json"))
    Debug("[AIMBLOX] Loaded saved settings")
end
LOADED += 1

if typeof(getgenv().AIMBLOX_FOV) == ("userdata" or "table") then
    getgenv().AIMBLOX_FOV:Remove()
    getgenv().AIMBLOX_FOV = nil
    Debug("[SILENT AIM] Removed Fov Circle")
end
if typeof(getgenv().AIMBLOX_RS) == "RBXScriptConnection" then
    getgenv().AIMBLOX_RS:Disconnect()
    getgenv().AIMBLOX_RS = nil
    Debug("[AIMBLOX] Disconnected RenderStepped")
end

if not getgenv().EspSettings then
    getgenv().EspSettings = {
        TeamCheck = true,
        ToggleKey = Enum.KeyCode.RightAlt,
        AntiDetection = true,
        Boxes = {Enabled = true,Transparency = 0.7,Color = Color3.fromRGB(255,255,255),UseTeamColor = true},
        Tracers = {Enabled = true,Transparency = 0.7,Color = Color3.fromRGB(255,255,255),UseTeamColor = true,Origin = "Top",Thickness = 1},
        Names = {Enabled = true,Transparency = 0.7,Color = Color3.fromRGB(255,255,255),UseTeamColor = true,Font = Drawing.Fonts.UI,Size = 18,Outline = true,OutlineColor = Color3.fromRGB(0,0,0),ShowDistance = false,ShowHealth = false,UseDisplayName = false,},
        Skeletons = {Enabled = false,Transparency = 0.7,Color = Color3.fromRGB(255,255,255),UseTeamColor = true,Thickness = 1},
        LookTracers = {Enabled = false,Transparency = 0.7,Color = Color3.fromRGB(255,255,255),UseTeamColor = true,IgnoreWater = true,Thickness = 1}
    } -- v1.4.0
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEsp.lua", true))()
    Debug("[ESP] Loaded Universal Esp")
end
LOADED += 1

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local UI = Material.Load({
    Title = "aimblox gui",
    Style = ss.Style or 2,
    SizeX = 447,
    SizeY = 500,
    Theme = ss.Theme or "Dark"
})
local SilentAim = UI.New({Title = "Silent Aim"})
local ESP = UI.New({Title = "ESP"})
local GunMods = UI.New({Title = "Gun Mods"})
local Player = UI.New({Title = "Player"})
local Misc = UI.New({Title = "Miscellaneous"})
local Settings = UI.New({Title = "Settings"})

function Banner(text)
    UI.Banner({
        Text = text
    })
end
function GunEquipped()
    if workspace.CurrentCamera:FindFirstChildOfClass("Model") then
        return true
    end
    return false
end
function CurrentGun()
    if GunEquipped() then
        return workspace.CurrentCamera:FindFirstChildOfClass("Model")
    end
    return nil
end
local cooldown = false
function GunMod(name,value1,cum)
    if cooldown then
        return
    end
    spawn(function()
        cooldown = true
        wait(0.1)
        cooldown = false
    end)
    for i,v in next, getgc(true) do
        if typeof(v) == "table" and rawget(v,name) then
            rawset(v,name,value1 or math.huge)
        end
    end
end
function CustomizeGun(prop,value)
    if not GunEquipped() then
        return
    end
    for i,v in next, CurrentGun().Tool:GetDescendants() do
        if v:IsA("BasePart") or v:IsA("MeshPart") then
            v[prop] = value
        end
    end
end
function CustomizeArm(prop,value)
    if not GunEquipped() then
        return
    end
    for i,v in next, CurrentGun()["Left Arm"].New:GetDescendants() do
        if v:IsA("BasePart") or v:IsA("MeshPart") then
            v[prop] = value
        end
    end
    for i,v in next, CurrentGun()["Right Arm"].New:GetDescendants() do
        if v:IsA("BasePart") or v:IsA("MeshPart") then
            v[prop] = value
        end
    end
end
function CustomizeChar(class,prop,value)
    if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and game:GetService("Players").LocalPlayer.Character.Humanoid.Health > 0 then
        for i,v in next, game:GetService("Players").LocalPlayer.Character:GetChildren() do
            if v:IsA(class) then
                if class == "Accessory" then
                    v.Handle[prop] = value
                else
                    v[prop] = value
                end
            end
        end
    end
end
function RefreshOptions(dropdown)
    local t = {}
    for i,v in next, game:GetService("Players"):GetPlayers() do
        table.insert(t,v.Name)
    end
    table.sort(t,function(a,b)
        return a < b
    end)
    dropdown:SetOptions(t)
end
function IsAlive(plr)
    if plr and plr.Character and plr.Character.Humanoid.Health > 0 then
        return true
    end
    return false
end
function SpoofStance(category,name,delay)
    local animation = game:GetService("Players").LocalPlayer.Character:WaitForChild("Animate"):WaitForChild("Animations"):WaitForChild(category):WaitForChild(name)
    local track = game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):LoadAnimation(animation)
    track:Play()
    wait(delay or 0)
    track:AdjustSpeed(0)
end
setreadonly(Color3,false)
function Color3.fromValue(c) -- Converts Value Table to Color3.fromRGB
    return Color3.fromRGB(c.R,c.G,c.B)
end
function Color3.toValue(c) -- Converts Color3.fromRGB to Value Table
    return {R = math.floor(c.R * 255),G = math.floor(c.G * 255),B = math.floor(c.B * 255)}
end
function Color3.toRGB(c) -- Converts Color3.new to Color3.fromRGB
    return math.floor(c.R * 255), math.floor(c.G * 255), math.floor(c.B * 255)
end
function GetDate()
    local date = os.date("!*t")
    if date.wday == 1 then
        date.wday = "Sunday"
    elseif date.wday == 2 then
        date.wday = "Monday"
    elseif date.wday == 3 then
        date.wday = "Tuesday"
    elseif date.wday == 4 then
        date.wday = "Wednesday"
    elseif date.wday == 5 then
        date.wday = "Thursday"
    elseif date.wday == 6 then
        date.wday = "Friday"
    elseif date.wday == 7 then
        date.wday = "Saturday"
    end
    if date.month == 1 then
        date.month = "January"
    elseif date.month == 2 then
        date.month = "February"
    elseif date.month == 3 then
        date.month = "March"
    elseif date.month == 4 then
        date.month = "April"
    elseif date.month == 5 then
        date.month = "May"
    elseif date.month == 6 then
        date.month = "June"
    elseif date.month == 7 then
        date.month = "July"
    elseif date.month == 8 then
        date.month = "August"
    elseif date.month == 9 then
        date.month = "September"
    elseif date.month == 10 then
        date.month = "October"
    elseif date.month == 11 then
        date.month = "November"
    elseif date.month == 12 then
        date.month = "December"
    end
    local ampm = "AM"
    if date.hour >= 12 then
        date.hour -= 12
        ampm = "PM"
    end
    if string.len(date.min) == 1 then
        date.min = "0"..date.min
    end
    if string.len(date.sec) == 1 then
        date.sec = "0"..date.sec
    end
    return date.wday..", "..date.month.." "..date.day..", "..date.year.." | "..date.hour..":"..date.min..":"..date.sec.." "..ampm.." UTC"
end
function SaveSettings()
    ss.SavedOn = GetDate()
    ss.SavedOnTick = tick()
    writefile("aimbloxsettings.json",game:GetService("HttpService"):JSONEncode(ss))
end

if ss.Version < version then
    do end
end

SilentAim.Toggle({
    Text = "Enabled",
    Callback = function(value)
        ss.SilentAim.Enabled = value
    end,
    Enabled = ss.SilentAim.Enabled or true,
})
SilentAim.Dropdown({
    Text = "Target Type",
    Callback = function(value)
        ss.SilentAim.TargetType = value
    end,
    Options = {"Closest to Mouse","Closest to Player"}
})
SilentAim.Dropdown({
    Text = "Target Part",
    Callback = function(value)
        ss.SilentAim.TargetPart = value
    end,
    Options = {"Head","UpperTorso","Random"}
})
SilentAim.Toggle({
    Text = "Visible Check",
    Callback = function(value)
        ss.SilentAim.VisibleCheck = value
    end,
    Enabled = ss.SilentAim.VisibleCheck or true
})
SilentAim.Slider({
    Text = "Hit Chance",
    Callback = function(value)
        ss.SilentAim.HitChance = value
    end,
    Min = 1,
    Max = 100,
    Def = ss.SilentAim.HitChance or 100
})
SilentAim.Slider({
    Text = "Fov",
    Callback = function(value)
        ss.SilentAim.Fov = value
    end,
    Min = 0,
    Max = 500,
    Def = ss.SilentAim.Fov or 100
})
SilentAim.Slider({
    Text = "Fov Sides",
    Callback = function(value)
        ss.SilentAim.NumSides = value
    end,
    Min = 1,
    Max = 128,
    Def = ss.SilentAim.NumSides or 64
})
SilentAim.Toggle({
    Text = "Use Fov Circle",
    Callback = function(value)
        ss.SilentAim.UseFovCircle = value
    end,
    Enabled = ss.SilentAim.UseFovCircle or true
})
SilentAim.Toggle({
    Text = "Dynamic Fov",
    Callback = function(value)
        ss.SilentAim.DynamicFov = value
    end,
    Enabled = ss.SilentAim.DynamicFov or false
})
SilentAim.Toggle({
    Text = "Fov Visible",
    Callback = function(value)
        ss.SilentAim.FovVisible = value
    end,
    Enabled = ss.SilentAim.FovVisible
})
SilentAim.Slider({
    Text = "Fov Transparency",
    Callback = function(value)
        ss.SilentAim.FovTransparency = value / 10
    end,
    Min = 0,
    Max = 10,
    Def = (ss.SilentAim.FovTransparency * 10) or 10
})
SilentAim.ColorPicker({
    Text = "Fov Color",
    Default = Color3.fromValue(ss.SilentAim.FovColor or {R = 255,G = 255,B = 255}),
    Callback = function(value)
        local r,g,b = Color3.toRGB(value)
        ss.SilentAim.FovColor = Color3.toValue(Color3.fromRGB(r,g,b))
    end
})
SilentAim.Toggle({
    Text = "Rainbow Fov",
    Callback = function(value)
        ss.SilentAim.RainbowFov = value
    end,
    Enabled = ss.SilentAim.RainbowFov or false
})
local whitelisted = ""
local selectedplr = ""
SilentAim.TextField({
    Text = "Player Name or User ID",
    Type = "Default",
    Callback = function(value)
        if value:gsub(" ","") ~= "" then
            whitelisted = value
        end
    end
})
SilentAim.Button({
    Text = "Whitelist Player",
    Callback = function()
        if not table.find(ss.SilentAim.Whitelisted,whitelisted) then
            table.insert(ss.SilentAim.Whitelisted,whitelisted)
        end
    end
})
local wplrs = SilentAim.Dropdown({
    Text = "Whitelisted Players",
    Callback = function(value)
        selectedplr = value
    end,
    Options = {}
})
spawn(function()
    while wait(1) do
        table.sort(ss.SilentAim.Whitelisted,function(a,b)
            return a < b
        end)
        wplrs:SetOptions(ss.SilentAim.Whitelisted)
    end
end)
SilentAim.Button({
    Text = "Unwhitelist Player",
    Callback = function()
        if table.find(ss.SilentAim.Whitelisted,selectedplr) then
            table.remove(ss.SilentAim.Whitelisted,table.find(ss.SilentAim.Whitelisted,selectedplr))
        end
    end
})
Debug("[UI] Loaded SilentAim [1/6]")
LOADED += 1

ESP.Toggle({
    Text = "Boxes",
    Callback = function(value)
        getgenv().EspSettings.Boxes.Enabled = value
        ss.ESP.Boxes = value
    end,
    Enabled = ss.ESP.Boxes
})
ESP.Toggle({
    Text = "Tracers",
    Callback = function(value)
        getgenv().EspSettings.Tracers.Enabled = value
        ss.ESP.Tracers = value
    end,
    Enabled = ss.ESP.Tracers
})
ESP.Toggle({
    Text = "Names",
    Callback = function(value)
        getgenv().EspSettings.Names.Enabled = value
        ss.ESP.Names = value
    end,
    Enabled = ss.ESP.Names
})
ESP.Toggle({
    Text = "Skeletons",
    Callback = function(value)
        getgenv().EspSettings.Skeletons.Enabled = value
        ss.ESP.Skeletons = value
    end,
    Enabled = ss.ESP.Skeletons
})
ESP.Toggle({
    Text = "Look Tracers",
    Callback = function(value)
        getgenv().EspSettings.LookTracers.Enabled = value
        ss.ESP.LookTracers = value
    end,
    Enabled = ss.ESP.LookTracers
})
ESP.Toggle({
    Text = "Team Check",
    Callback = function(value)
        getgenv().EspSettings.TeamCheck = value
        ss.ESP.TeamCheck = value
    end,
    Enabled = ss.ESP.TeamCheck
})
ESP.Slider({
    Text = "Transparency",
    Callback = function(value)
        getgenv().EspSettings.Boxes.Transparency = value / 10
        getgenv().EspSettings.Tracers.Transparency = value / 10
        getgenv().EspSettings.Names.Transparency = value / 10
        getgenv().EspSettings.Skeletons.Transparency = value / 10
        getgenv().EspSettings.LookTracers.Transparency = value / 10
        ss.ESP.Transparency = value / 10
    end,
    Min = 0,
    Max = 10,
    Def = (ss.ESP.Transparency * 10) or 7
})
ESP.Toggle({
    Text = "Use Team Color",
    Callback = function(value)
        getgenv().EspSettings.Boxes.UseTeamColor = value
        getgenv().EspSettings.Tracers.UseTeamColor = value
        getgenv().EspSettings.Names.UseTeamColor = value
        getgenv().EspSettings.Skeletons.UseTeamColor = value
        getgenv().EspSettings.LookTracers.UseTeamColor = value
        ss.ESP.UseTeamColor = value
    end,
    Enabled = ss.ESP.UseTeamColor
})
ESP.ColorPicker({
    Text = "Color",
    Default = Color3.fromValue(ss.ESP.Color or {R = 255,G = 255,B = 255}),
    Callback = function(value)
        getgenv().EspSettings.Boxes.Color = value
        getgenv().EspSettings.Tracers.Color = value
        getgenv().EspSettings.Names.Color = value
        getgenv().EspSettings.Skeletons.Color = value
        getgenv().EspSettings.LookTracers.Color = value
        local r,g,b = Color3.toRGB(value)
        ss.ESP.Color = Color3.toValue(Color3.fromRGB(r,g,b))
    end
})
ESP.Toggle({
    Text = "Show Distance",
    Callback = function(value)
        getgenv().EspSettings.Names.ShowDistance = value
        ss.ESP.ShowDistance = value
    end,
    Enabled = ss.ESP.ShowDistance
})
ESP.Toggle({
    Text = "Show Health",
    Callback = function(value)
        getgenv().EspSettings.Names.ShowHealth = value
        ss.ESP.ShowHealth = value
    end,
    Enabled = ss.ESP.ShowHealth
})
ESP.Button({
    Text = "Info",
    Callback = function()
        Banner("Press Right Alt to toggle ESP visibility.")
    end
})
Debug("[UI] Loaded ESP       [2/6]")
LOADED += 1

GunMods.Button({
    Text = "Infinite Ammo",
    Callback = function()
        GunMod("MaxAmmo",math.huge)
        GunMod("Ammo",math.huge)
    end
})
GunMods.Button({
    Text = "No Recoil",
    Callback = function()
        GunMod("Recoil",0)
    end
})
GunMods.Button({
    Text = "No Spread",
    Callback = function()
        GunMod("Spread",0)
        GunMod("MinSpread",0)
        GunMod("MaxSpread",0)
    end
})
GunMods.Button({
    Text = "No Gun Bob",
    Callback = function()
        GunMod("bobIntensity",0)
        GunMod("bobSpeed",0)
    end
})
GunMods.Button({
    Text = "Instant Equip",
    Callback = function()
        GunMod("GunEquipDelay",0)
    end
})
GunMods.Button({
    Text = "Instant Reload",
    Callback = function()
        GunMod("ReloadTime",0)
    end
})
GunMods.Toggle({
    Text = "Instant Kill",
    Callback = function(value)
        ss.GunMods.InstantKill = value
    end,
    Enabled = ss.GunMods.InstantKill or false
})
GunMods.Slider({
    Text = "Bullet Speed",
    Callback = function(value)
        GunMod("Speed",value)
        ss.GunMods.BulletSpeed = value
    end,
    Min = 0,
    Max = 2000,
    Def = ss.GunMods.BulletSpeed or 600
})
GunMods.Slider({
    Text = "Fire Rate",
    Callback = function(value)
        GunMod("RPM",value)
        ss.GunMods.RPM = value
    end,
    Min = 0,
    Max = 2000,
    Def = ss.GunMods.RPM or 550
})
GunMods.Dropdown({
    Text = "Firing Mode",
    Callback = function(value)
        GunMod("FiringMode",value)
        ss.GunMods.FiringMode = value
    end,
    Options = {"Auto","Semi"}
})
GunMods.Slider({
    Text = "Gun Rotation X",
    Callback = function(value)
        GunMod("X",value / 10)
        ss.GunMods.GunRotation.X = value
    end,
    Min = -30,
    Max = 30,
    Def = ss.GunMods.GunRotation.Z or 0
})
GunMods.Slider({
    Text = "Gun Rotation Y",
    Callback = function(value)
        GunMod("Y",value / 10)
        ss.GunMods.GunRotation.Y = value
    end,
    Min = -30,
    Max = 30,
    Def = ss.GunMods.GunRotation.Y or 0
})
GunMods.Slider({
    Text = "Gun Rotation Z",
    Callback = function(value)
        GunMod("Z",value / 10)
        ss.GunMods.GunRotation.Z = value
    end,
    Min = -30,
    Max = 30,
    Def = ss.GunMods.GunRotation.Z or 0
})
local skins = {}
for i,v in next, game:GetService("ReplicatedFirst").Shared.AttachmentsData.Skin:GetChildren() do
    table.insert(skins,v.Name)
end
table.sort(skins,function(a,b)
    return a < b
end)
--[[GunMods.Dropdown({
    Text = "Apply Skin",
    Callback = function(value)
        
    end,
    Options = skins
})]]
local mod = nil
local modvalue = nil
GunMods.TextField({
    Text = "Custom Mod",
    Type = "Default",
    Callback = function(value)
        mod = value
    end
})
local mods = {"Ammo","ReloadTime","FiringModes","BurstAmount","GunFireStopStateDelay","GunEquipDelay","GunFiringType","GunReloadType","IronSights","MinSpread","SpreadStep","MaxSpread","DropSpread","FlingMultiplier","Trail","Speed","FalloffStart","FalloffEnd","Range","RPM","VerticalClimbMax","VerticalClimb","VerticalClimbDrop","VerticalClimbDropTime","FireWeight","FireSpeed","Recoil","DeltaSensitivity","xScale","yScale","bobIntensity","bobSpeed","tweenTime","X","Y","Z","FieldOfView","OverrideAimOffset","Angle","BobSpeedFactor","XP","GunLevels","BaseXP"}
table.sort(mods,function(a,b)
    return a < b
end)
GunMods.Dropdown({
    Text = "Custom Mod (Dropdown)",
    Callback = function(value)
        mod = value
    end,
    Options = mods
})
GunMods.TextField({
    Text = "Value",
    Type = "Default",
    Callback = function(value)
        modvalue = value
    end
})
GunMods.Button({
    Text = "Apply Custom Mod",
    Callback = function()
        if mod and modvalue then
            GunMod(mod,modvalue)
        end
    end
})
Debug("[UI] Loaded GunMods   [3/6]")
LOADED += 1

Player.Toggle({
    Text = "WalkSpeed Enabled",
    Callback = function(value)
        ss.Player.WalkSpeedEnabled = value
    end,
    Enabled = ss.Player.WalkSpeedEnabled or false
})
Player.Slider({
    Text = "WalkSpeed Value",
    Callback = function(value)
        ss.Player.WalkSpeed = value
    end,
    Min = 0,
    Max = 100,
    Def = ss.Player.WalkSpeed or 22
})
Player.Toggle({
    Text = "Infinite Jump",
    Callback = function(value)
        ss.Player.InfiniteJump = value
    end,
    Enabled = ss.Player.InfiniteJump or false
})
Player.Slider({
    Text = "Field Of View",
    Callback = function(value)
        GunMod("FieldOfView",value)
        ss.Player.FieldOfView = value
    end,
    Min = 0,
    Max = 120,
    Def = ss.Player.FieldOfView or 70
})
Player.Toggle({
    Text = "Third Person",
    Callback = function(value)
        ss.Player.ThirdPerson = value
    end,
    Enabled = ss.Player.ThirdPerson or false
})
Player.Slider({
    Text = "Third Person Distance",
    Callback = function(value)
        ss.Player.TPOffset = value
    end,
    Min = 0,
    Max = 30,
    Def = ss.Player.TPOffset or 10
})
Player.Toggle({
    Text = "Show Weapon in Third Person",
    Callback = function(value)
        ss.Player.ShowWeapon = value
    end,
    Enabled = ss.Player.ShowWeapon or true
})
Player.Button({
    Text = "Info",
    Callback = function()
        Banner("Hold Scroll Wheel to free look in third person! Press Right Ctrl to toggle.")
    end
})
local materials = {}
for i,v in next, Enum.Material:GetEnumItems() do
    table.insert(materials,tostring(v):split("Enum.Material.")[2])
end
table.sort(materials,function(a,b)
    return a < b
end)
Player.Dropdown({
    Text = "Character Material",
    Callback = function(value)
        ss.Player.CharacterMaterial = value
    end,
    Options = materials
})
local charcolor = Player.ColorPicker({
    Text = "Character Color",
    Default = Color3.fromValue(ss.Player.CharacterColor or {R = 255,G = 0,B = 0}),
    Callback = function(value)
        local r,g,b = Color3.toRGB(value)
        ss.Player.CharacterColor = Color3.toValue(Color3.fromRGB(r,g,b))
    end
})
Player.Toggle({
    Text = "Rainbow Character",
    Callback = function(value)
        ss.Player.RainbowCharacter = value
    end,
    Enabled = ss.Player.RainbowCharacter or false
})
Player.Toggle({
    Text = "Hide Accessories",
    Callback = function(value)
        ss.Player.HideAccessories = value
    end,
    Enabled = ss.Player.HideAccessories or false
})
Player.Dropdown({
    Text = "Spoof Stance",
    Callback = function(value)
        ss.Player.Stance = value
        local animation
        local track
        if value == "None" then
            for i,v in next, game:GetService("Players").LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks() do
                v:Stop()
            end
        elseif value == "Sliding" then
            SpoofStance("Actions","Slide",1.8)
        end
    end,
    Options = {"None","Sliding"}
})
local plrlist = Player.Dropdown({
    Text = "Teleport to Player",
    Callback = function(value)
        if IsAlive(value) then
            game:GetService("Players").LocalPlayer.Character:MoveTo(game:GetService("Players")[value].Character.HumanoidRootPart.Position)
        end
    end,
    Options = {}
})
RefreshOptions(plrlist)
Debug("[UI] Loaded Player    [4/6]")
LOADED += 1

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
Misc.Toggle({
    Text = "Bullet Tracers",
    Callback = function(value)
        ss.Misc.BulletTracers.Enabled = value
    end,
    Enabled = ss.Misc.BulletTracers.Enabled or false
})
Misc.Slider({
    Text = "Bullet Tracer Transparency",
    Callback = function(value)
        ss.Misc.BulletTracers.Transparency = value / 10
    end,
    Min = 0,
    Max = 10,
    Def = (ss.Misc.BulletTracers.Transparency * 10) or 5
})
Misc.Slider({
    Text = "Bullet Tracer Duration",
    Callback = function(value)
        ss.Misc.BulletTracers.Duration = value
    end,
    Min = 0,
    Max = 15,
    Def = ss.Misc.BulletTracers.Duration or 3
})
Misc.ColorPicker({
    Text = "Bullet Tracer Color 1",
    Default = Color3.fromValue(ss.Misc.BulletTracers.Color1 or {R = 0,G = 170,B = 255}),
    Callback = function(value)
        local r,g,b = Color3.toRGB(value)
        ss.Misc.BulletTracers.Color1 = Color3.toValue(Color3.fromRGB(r,g,b))
    end
})
Misc.ColorPicker({
    Text = "Bullet Tracer Color 2",
    Default = Color3.fromValue(ss.Misc.BulletTracers.Color2 or {R = 0,G = 0,B = 255}),
    Callback = function(value)
        local r,g,b = Color3.toRGB(value)
        ss.Misc.BulletTracers.Color2 = Color3.toValue(Color3.fromRGB(r,g,b))
    end
})
Misc.Toggle({
    Text = "Impact Points",
    Callback = function(value)
        ss.Misc.ImpactPoints.Enabled = value
    end,
    Enabled = ss.Misc.ImpactPoints.Enabled or false
})
Misc.Slider({
    Text = "Impact Point Transparency",
    Callback = function(value)
        ss.Misc.ImpactPoints.Transparency = value / 10
    end,
    Min = 0,
    Max = 10,
    Def = (ss.Misc.ImpactPoints.Transparency * 10) or 3
})
Misc.Slider({
    Text = "Impact Point Duration",
    Callback = function(value)
        ss.Misc.ImpactPoints.Duration = value
    end,
    Min = 0,
    Max = 15,
    Def = ss.Misc.ImpactPoints.Duration or 3
})
Misc.ColorPicker({
    Text = "Impact Point Color",
    Default = Color3.fromValue(ss.Misc.ImpactPoints.Color or {R = 0,G = 170,B = 255}),
    Callback = function(value)
        local r,g,b = Color3.toRGB(value)
        ss.Misc.ImpactPoints.Color = Color3.toValue(Color3.fromRGB(r,g,b))
    end
})
Misc.Slider({
    Text = "Impact Point Size",
    Callback = function(value)
        ss.Misc.ImpactPoints.Size = value / 10
    end,
    Min = 0,
    Max = 10,
    Def = (ss.Misc.ImpactPoints.Size * 10) or 1
})
Misc.Dropdown({
    Text = "Impact Point Material",
    Callback = function(value)
        ss.Misc.ImpactPoints.Material = value
    end,
    Options = materials
})
Misc.Dropdown({
    Text = "Gun Material",
    Callback = function(value)
        CustomizeGun("Material",value)
        ss.Misc.GunMaterial = value
    end,
    Options = materials
})
Misc.Slider({
    Text = "Gun Reflectance",
    Callback = function(value)
        ss.Misc.GunReflectance = value / 10
    end,
    Min = 0,
    Max = 10,
    Def = (ss.Misc.GunReflectance * 10) or 0
})
local guncolor = Misc.ColorPicker({
    Text = "Gun Color",
    Default = Color3.fromValue(ss.Misc.GunColor or {R = 255,G = 0,B = 0}),
    Callback = function(value)
        CustomizeGun("Color",value)
        local r,g,b = Color3.toRGB(value)
        ss.Misc.GunColor = Color3.toValue(Color3.fromRGB(r,g,b))
    end
})
Misc.Toggle({
    Text = "Rainbow Gun",
    Callback = function(value)
        ss.Misc.RainbowGun = value
    end,
    Enabled = ss.Misc.RainbowGun or false
})
Misc.Dropdown({
    Text = "Arm Material",
    Callback = function(value)
        CustomizeArm("Material",value)
        ss.Misc.ArmMaterial = value
    end,
    Options = materials
})
Misc.Slider({
    Text = "Arm Reflectance",
    Callback = function(value)
        ss.Misc.ArmReflectance = value / 10
    end,
    Min = 0,
    Max = 10,
    Def = (ss.Misc.ArmReflectance * 10) or 0
})
local armcolor = Misc.ColorPicker({
    Text = "Arm Color",
    Default = Color3.fromValue(ss.Misc.ArmColor or {R = 255,G = 0,B = 0}),
    Callback = function(value)
        CustomizeArm("Color",value)
        local r,g,b = Color3.toRGB(value)
        ss.Misc.ArmColor = Color3.toValue(Color3.fromRGB(r,g,b))
    end
})
Misc.Toggle({
    Text = "Rainbow Arms",
    Callback = function(value)
        ss.Misc.RainbowArms = value
    end,
    Enabled = ss.Misc.RainbowArms or false
})
Misc.Toggle({
    Text = "Hide Gloves",
    Callback = function(value)
        ss.Misc.HideGloves = value
    end,
    Enabled = ss.Misc.HideGloves or false
})
Misc.Dropdown({
    Text = "Join Team",
    Callback = function(value)
        game:GetService("ReplicatedStorage").Remotes.SelectTeam:FireServer(value)
    end,
    Options = {"Red","Blue","Green","Yellow"}
})
Misc.Dropdown({
    Text = "Skybox",
    Callback = function(value)
        ss.Misc.Skybox = value
        if game:GetService("Lighting"):FindFirstChildOfClass("Sky") then
            game:GetService("Lighting"):FindFirstChildOfClass("Sky"):Destroy()
        end
        local sky = Instance.new("Sky",game:GetService("Lighting"))
        for i,v in next, SkyboxData[ss.Misc.Skybox] do
            sky[i] = v
        end
    end,
    Options = {"Default","Night","Galaxy","Sunset","Cloudy","Light Blue"}
})
Debug("[UI] Loaded Misc      [5/6]")
LOADED += 1

Settings.Button({
    Text = "Save Settings",
    Callback = function()
        SaveSettings()
        Banner("Your settings have been saved.")
    end
})
Settings.Toggle({
    Text = "Auto Save",
    Callback = function(value)
        ss.Settings.AutoSave = value
    end,
    Enabled = ss.Settings.AutoSave
})
Settings.Slider({
    Text = "Auto Save Intervals (Minutes)",
    Callback = function(value)
        ss.Settings.AutoSaveInterval = value
    end,
    Min = 1,
    Max = 15,
    Def = ss.Settings.AutoSaveInterval or 5
})
Settings.Button({
    Text = "Last Save",
    Callback = function()
        if ss.SavedOn ~= nil then
            Banner("Your last save was on: "..ss.SavedOn)
        else
            Banner("No last save found.")
        end
    end
})
local confirm = ""
Settings.TextField({
    Text = "Confirmation",
    Type = "Default",
    Callback = function(value)
        confirm = value
    end
})
Settings.Button({
    Text = "Delete Save",
    Callback = function()
        if confirm == "CONFIRM" and isfile("aimbloxsettings.json") then
            delfile("aimbloxsettings.json")
            ss.SavedOn = nil
            Banner("Deleted your save file.")
        elseif confirm == "CONFIRM" and not isfile("aimbloxsettings.json") then
            Banner("No save file found.")
        elseif confirm == "'CONFIRM'" then
            Banner("without the apostrophes dumbass")
        elseif confirm ~= "CONFIRM" then
            Banner("Please type 'CONFIRM' in the text field above.")
        end
    end
})
Settings.Dropdown({
    Text = "UI Style",
    Callback = function(value)
        ss.Style = value
        SaveSettings()
        Banner("Please re-execute to apply a new style. Your settings have been saved.")
    end,
    Options = {"1","2","3"}
})
Settings.Dropdown({
    Text = "UI Theme",
    Callback = function(value)
        ss.Theme = value
        SaveSettings()
        Banner("Please re-execute to apply a new theme. Your settings have been saved.")
    end,
    Options = {"Dark","Light","Mocha","Aqua","Jester"}
})
Settings.Button({
    Text = "Reload Script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/Aimblox.lua"))()
    end
})
if getgenv().AIMBLOX_DEBUG == true then
    Settings.Toggle({
        Text = "Debug Mode",
        Callback = function(value)
            getgenv().AIMBLOX_DEBUG = value
        end,
        Enabled = true
    })
end
Debug("[UI] Loaded Settings  [6/6]")
LOADED += 1

local players = game:GetService("Players")
local player = players.LocalPlayer
local camera = workspace.CurrentCamera
local mouse1 = player:GetMouse()
local mouse2 = game:GetService("UserInputService"):GetMouseLocation()
local ads = false

--local devs = {2551738991,2487300257,52187831,195749,77211046,1882534,84543025,2049476,17165546,336003}
local devs = {}
local api = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://groups.roblox.com/v1/groups/10620626/users?sortOrder=Asc&limit=25"))
for i,v in next, api.data do
    if v.role.rank >= 254 then
        table.insert(devs,v.user.userId)
    end
end
for i,v in next, players:GetPlayers() do
    if table.find(devs,v.UserId) then
        Banner("A developer is in your game! ("..v.Name..")")
    end
end
players.PlayerAdded:Connect(function(plr)
    RefreshOptions(plrlist)
    if table.find(devs,plr.UserId) then
        Banner("A developer has joined the game! ("..plr.Name..")")
    end
end)
players.PlayerRemoving:Connect(function(plr)
    RefreshOptions(plrlist)
end)

function PackVector(pos)
    return string.pack("fff",pos.X,pos.Y,pos.Z)
end
function UnpackVector(pos)
    local x, y, z = string.unpack("fff",pos)
    return Vector3.new(x,y,z)
end
function ClosestPlayer()
    mouse2 = game:GetService("UserInputService"):GetMouseLocation()
    local plr = nil
    local closest = math.huge
    for i,v in next, players:GetPlayers() do
        if v ~= player and IsAlive(v) then
            local mag = (player.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
            if ss.SilentAim.TargetType == "Closest to Mouse" then
                local vector, inViewport = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                if inViewport then
                    mag = (Vector2.new(mouse2.X,mouse2.Y) - Vector2.new(vector.X,vector.Y)).Magnitude
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
function IsVisible(plr)
    if ss.SilentAim.VisibleCheck and IsAlive(plr) then
        for i,v in next, plr.Character:GetChildren() do
            if v:IsA("MeshPart") then
                local params = RaycastParams.new()
                params.FilterDescendantsInstances = {camera,player.Character,workspace.Ignore}
                params.FilterType = Enum.RaycastFilterType.Blacklist
                params.IgnoreWater = true
                local result = workspace:Raycast(camera.CFrame.Position,(v.Position - camera.CFrame.Position).Unit * 500,params)
                if result ~= nil and result.Instance:FindFirstAncestor(plr.Name) then
                    Debug("[SILENT AIM] "..plr.Name.." is visible | Part: "..result.Instance.Name)
                    return true
                end
            end
        end
    elseif not ss.SilentAim.VisibleCheck and IsAlive(plr) then
        Debug("[SILENT AIM] "..plr.Name.." is visible (VisibleCheck disabled)")
        return true
    end
    Debug("[SILENT AIM] "..plr.Name.." is NOT visible")
    return false
end
local fov
function InFov(plr)
    mouse2 = game:GetService("UserInputService"):GetMouseLocation()
    if IsAlive(plr) then
        local vector, inViewport = camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
        if ss.SilentAim.UseFovCircle and inViewport then
            for i,v in next, plr.Character:GetChildren() do
                if v:IsA("MeshPart") then
                    local vector2, inViewport2 = camera:WorldToViewportPoint(v.Position)
                    if inViewport2 then
                        local mag = (Vector2.new(mouse2.X,mouse2.Y) - Vector2.new(vector2.X,vector2.Y)).Magnitude
                        if mag <= (fov.Radius or ss.SilentAim.Fov) then
                            Debug("[SILENT AIM] "..plr.Name.." is in the fov circle")
                            Debug("[SILENT AIM] Distance: "..mag.." | Fov: "..ss.SilentAim.Fov.." | Radius: "..fov.Radius)
                            return true
                        end
                    end
                end
            end
        elseif not ss.SilentAim.UseFovCircle and inViewport then
            Debug("[SILENT AIM] "..plr.Name.." is in the fov circle (UseFovCircle disabled)")
            return true
        end
    end
    Debug("[SILENT AIM] "..plr.Name.." is NOT in the fov circle")
    return false
end
function IsWhitelisted(plr)
    if table.find(ss.SilentAim.Whitelisted,(plr.Name or plr.UserId)) then
        return true
    end
    return false
end
function Chance(p)
    if math.random(0,100) <= p then
        return true
    end
    return false
end
function BulletTracer()
    if ss.Misc.BulletTracers.Enabled then
        local params = RaycastParams.new()
        params.FilterDescendantsInstances = {camera,player.Character,workspace.Ignore}
        params.FilterType = Enum.RaycastFilterType.Blacklist
        params.IgnoreWater = true
        local result1 = workspace:Raycast(camera.CFrame.Position,camera.CFrame.LookVector * 500,params)
        local result2 = workspace:Raycast(CurrentGun().Tool.End.Position,camera.CFrame.LookVector * 500,params)

        local beam = Instance.new("Beam",workspace.Ignore)
        local part0 = Instance.new("Part",beam)
        local part1 = Instance.new("Part",beam)
        local att0 = Instance.new("Attachment",part0)
        local att1 = Instance.new("Attachment",part1)
        beam.Enabled = true
        beam.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0,Color3.fromValue(ss.Misc.BulletTracers.Color1)),
            ColorSequenceKeypoint.new(1,Color3.fromValue(ss.Misc.BulletTracers.Color2))
        }
        beam.Transparency = NumberSequence.new{
            NumberSequenceKeypoint.new(0,ss.Misc.BulletTracers.Transparency),
            NumberSequenceKeypoint.new(1,ss.Misc.BulletTracers.Transparency)
        }
        beam.Attachment0 = att0
        beam.Attachment1 = att1
        beam.FaceCamera = true
        beam.Width0 = 0.1
        beam.Width1 = 0.1
        
        part0.Transparency = 1
        part0.Position = CurrentGun().Tool.End.Position
        part0.Anchored = true
        part0.CanCollide = false
        part0.Size = Vector3.new(0.5,0.5,0.5)

        part1.Transparency = 1
        part1.Position = result1.Position
        part1.Anchored = true
        part1.CanCollide = false
        part1.Size = Vector3.new(0.5,0.5,0.5)
        if ads then
            part1.Position = result2.Position
        end
        Debug("[MISC] Created Bullet Tracer | P1: "..tostring(part0.Position).." | P2: "..tostring(part1.Position))
        wait(ss.Misc.BulletTracers.Duration or 3)
        beam:Destroy()
    end
end
function ImpactPoint()
    if ss.Misc.ImpactPoints.Enabled then
        local params = RaycastParams.new()
        params.FilterDescendantsInstances = {camera,player.Character,workspace.Ignore}
        params.FilterType = Enum.RaycastFilterType.Blacklist
        params.IgnoreWater = true
        local result1 = workspace:Raycast(camera.CFrame.Position,camera.CFrame.LookVector * 500,params)
        local result2 = workspace:Raycast(CurrentGun().Tool.End.Position,camera.CFrame.LookVector * 500,params)

        local part = Instance.new("Part",workspace.Ignore)
        part.Transparency = ss.Misc.ImpactPoints.Transparency
        part.Position = result1.Position
        part.Anchored = true
        part.CanCollide = false
        part.Color = Color3.fromValue(ss.Misc.ImpactPoints.Color)
        part.Size = Vector3.new(ss.Misc.ImpactPoints.Size,ss.Misc.ImpactPoints.Size,ss.Misc.ImpactPoints.Size)
        part.Rotation = result1.Instance.Rotation
        part.Material = ss.Misc.ImpactPoints.Material
        if ads then
            part.Position = result2.Position
            part.Rotation = result2.Instance.Rotation
        end
        Debug("[MISC] Created Impact Point | Position: "..tostring(part.Position).." | Rotation: "..tostring(part.Rotation))
        wait(ss.Misc.ImpactPoints.Duration or 3)
        part:Destroy()
    end
end

function GunEngine(func)
    for i,v in next, getgc(true) do
        if typeof(v) == "table" and typeof(rawget(v,func)) == "function" and tostring(getfenv(rawget(v,func)).script) == "Gun" then
            return rawget(v,func)
        end
    end
end

local oldfire
oldfire = hookfunction(GunEngine("_FireInternal"),function(...)
    spawn(BulletTracer)
    spawn(ImpactPoint)
    return oldfire(...)
end)
Debug("[MISC] Hooked _FireInternal function")
LOADED += 1

local oldnc
oldnc = hookmetamethod(game,"__namecall",function(self,...)
    local Args = {...}
    if getnamecallmethod() == "FireServer" and self.Name == "ShotEvent" and Args[2] ~= ("EquipSound" and "ReloadSound") then
        if ss.SilentAim.Enabled then
            if game.PlaceId == 6808416928 then
                game:GetService("ReplicatedStorage").Remotes.HitLobbyTarget:FireServer()
                Debug("[SILENT AIM] Fired HitLobbyTarget")
            elseif game.PlaceId == 6808489605 then
                local plr = ClosestPlayer()
                if plr == nil then
                    Debug("[SILENT AIM] Returned (ClosestPlayer is nil)")
                    return oldnc(self,...)
                end
                if IsWhitelisted(plr) then
                    Debug("[SILENT AIM] Returned (ClosestPlayer is whitelisted)")
                    return oldnc(self,...)
                end
                if not IsVisible(plr) then
                    Debug("[SILENT AIM] Returned (Not Visible)")
                    return oldnc(self,...)
                end
                if not InFov(plr) then
                    Debug("[SILENT AIM] Returned (Not in Fov)")
                    return oldnc(self,...)
                end
                if not Chance(ss.SilentAim.HitChance) then
                    Debug("[SILENT AIM] Returned (Failed HitChance)")
                    return oldnc(self,...)
                end
                local args = {
                    [1] = plr,
                    [2] = CurrentGun().Name,
                    [3] = PackVector(plr.Character.Head.Position),
                    [4] = plr.Character.Head,
                    [5] = "Default"
                }
                if ss.SilentAim.TargetPart ~= "Random" then
                    args[3] = PackVector(plr.Character[ss.SilentAim.TargetPart].Position)
                    args[4] = plr.Character[ss.SilentAim.TargetPart]
                else
                    local parts = {"Head","UpperTorso","LowerTorso","LeftUpperArm","LeftLowerArm","RightUpperArm","RightLowerArm","LeftUpperLeg","LeftLowerLeg","RightUpperLeg","RightLowerLeg"}
                    local part = parts[math.random(1,#parts)]
                    args[3] = PackVector(plr.Character[part].Position)
                    args[4] = plr.Character[part]
                end
                if ads then
                    args[5] = "ADS"
                end
                --BulletTracer(args[4].Position)
                game:GetService("ReplicatedStorage").Remotes.GunShot:FireServer(unpack(args))
                Debug("[SILENT AIM] Fired GunShot | Player: "..plr.Name.."Hit Part: "..args[4].Name)
                if ss.GunMods.InstantKill then
                    for _ = 1,5 do
                        game:GetService("ReplicatedStorage").Remotes.GunShot:FireServer(unpack(args))
                    end
                end
            end
        end
    end
    return oldnc(self,...)
end)
Debug("[SILENT AIM] Hooked __namecall metamethod")
LOADED += 1

fov = Drawing.new("Circle")
fov.Visible = true
fov.Transparency = 1
fov.Color = Color3.fromRGB(255,255,255)
fov.Thickness = 1
fov.NumSides = 64
fov.Radius = 100
fov.Filled = false
Debug("[SILENT AIM] Created Fov Circle")
getgenv().AIMBLOX_FOV = fov
getgenv().AIMBLOX_RS = game:GetService("RunService").RenderStepped:Connect(function()
    if ss.SilentAim.UseFovCircle and ss.SilentAim.FovVisible then
        fov.Position = game:GetService("UserInputService"):GetMouseLocation()
        fov.NumSides = ss.SilentAim.NumSides
        fov.Radius = ss.SilentAim.Fov
        fov.Transparency = ss.SilentAim.FovTransparency
        fov.Color = Color3.fromValue(ss.SilentAim.FovColor)
        if ss.SilentAim.DynamicFov then
            fov.Radius = ss.SilentAim.Fov / (camera.FieldOfView / 100)
        end
        if ss.SilentAim.RainbowFov then
            fov.Color = Color3.fromHSV(tick()%5/5,1,1)
        end
    else
        fov.Transparency = 0
    end
    if ss.Misc.RainbowGun then
        if GunEquipped() then
            CustomizeGun("Color",Color3.fromHSV(tick()%5/5,1,1))
        end
        guncolor:SetColor(Color3.fromHSV(tick()%5/5,1,1)) 
    end
    if ss.Misc.RainbowArms then
        if GunEquipped() then
            CustomizeArm("Color",Color3.fromHSV(tick()%5/5,1,1))
        end
        armcolor:SetColor(Color3.fromHSV(tick()%5/5,1,1))
    end
    if ss.Misc.GunMaterial ~= nil then
        CustomizeGun("Material",ss.Misc.GunMaterial)
    end
    if ss.Misc.GunReflectance ~= nil then
        CustomizeGun("Reflectance",ss.Misc.GunReflectance)
    end
    if ss.Misc.GunColor ~= nil then
        CustomizeGun("Color",Color3.fromValue(ss.Misc.GunColor))
    end
    if ss.Misc.ArmMaterial ~= nil then
        CustomizeArm("Material",ss.Misc.ArmMaterial)
    end
    if ss.Misc.ArmReflectance ~= nil then
        CustomizeArm("Reflectance",ss.Misc.ArmReflectance)
    end
    if ss.Misc.ArmColor ~= nil then
        CustomizeArm("Color",Color3.fromValue(ss.Misc.ArmColor))
    end
    if ss.Misc.HideGloves and GunEquipped() then
        CurrentGun()["Left Arm"].New["Left Arm"].Lglove.Transparency = 1
        CurrentGun()["Right Arm"].New["Right Arm"].Rglove.Transparency = 1
    elseif not ss.Misc.HideGloves and GunEquipped() then
        CurrentGun()["Left Arm"].New["Left Arm"].Lglove.Transparency = 0
        CurrentGun()["Right Arm"].New["Right Arm"].Rglove.Transparency = 0
    end
    if ss.Player.CharacterMaterial ~= nil then
        CustomizeChar("MeshPart","Material",ss.Player.CharacterMaterial)
    end
    if ss.Player.CharacterColor ~= nil and ss.Player.ThirdPerson then
        CustomizeChar("MeshPart","Color",Color3.fromValue(ss.Player.CharacterColor))
    end
    if ss.Player.RainbowCharacter then
        CustomizeChar("MeshPart","Color",Color3.fromHSV(tick()%5/5,1,1))
        charcolor:SetColor(Color3.fromHSV(tick()%5/5,1,1))
    end
    if ss.Player.ThirdPerson and player.Character and player.Character.Humanoid.Health > 0 then
        camera.CFrame += camera.CFrame.LookVector * -ss.Player.TPOffset
        CustomizeChar("MeshPart","LocalTransparencyModifier",0)
        CustomizeChar("Accessory","LocalTransparencyModifier",0)
        if ss.Player.ShowWeapon and player.Character:FindFirstChild("GunTool") then
            for i,v in next, player.Character.GunTool:GetDescendants() do
                if v:IsA("MeshPart") or v:IsA("BasePart") then
                    v.LocalTransparencyModifier = 0
                end
            end
        end
    end
    if ss.Player.HideAccessories then
        CustomizeChar("Accessory","Transparency",1)
    else
        CustomizeChar("Accessory","Transparency",0)
    end
end)

player.CharacterAdded:Connect(function()
    if ss.GunMods.RPM ~= nil then
        GunMod("RPM",ss.GunMods.RPM)
        Debug("[GUN MODS] Set RPM to "..ss.GunMods.RPM)
    end
    if ss.GunMods.FiringMode ~= nil then
        GunMod("FiringMode",ss.GunMods.FiringMode)
        Debug("[GUN MODS] Set FiringMode to "..ss.GunMods.FiringMode)
    end
    if ss.Player.Stance == "Sliding" then
        SpoofStance("Actions","Sliding",1.8)
        Debug("[PLAYER] Set Player Stance to "..ss.Player.Stance)
    end
end)

player.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
    if ss.Player.WalkSpeedEnabled then
        player.Character.Humanoid.WalkSpeed = ss.Player.WalkSpeed
    end
end)

game:GetService("UserInputService").InputBegan:Connect(function(i,gp)
    if gp then
        return
    end
    if i.KeyCode == Enum.KeyCode.Space and ss.Player.InfiniteJump and IsAlive(player) then
        player.Character.Humanoid:ChangeState(3)
    elseif i.UserInputType == Enum.UserInputType.MouseButton2 or i.KeyCode == Enum.KeyCode.Q then
        ads = true
    elseif i.UserInputType == Enum.UserInputType.MouseButton3 and ss.Player.ThirdPerson then
        player.Character.Humanoid.AutoRotate = false
    elseif i.KeyCode == Enum.KeyCode.RightControl and ss.Player.ThirdPerson then
        player.Character.Humanoid.AutoRotate = not player.Character.Humanoid.AutoRotate
    end
end)
game:GetService("UserInputService").InputEnded:Connect(function(i,gp)
    if gp then
        return
    end
    if i.UserInputType == Enum.UserInputType.MouseButton2 or i.KeyCode == Enum.KeyCode.Q then
        ads = false
    elseif i.UserInputType == Enum.UserInputType.MouseButton3 and ss.Player.ThirdPerson then
        player.Character.Humanoid.AutoRotate = true
    end
end)

local qot = queue_on_teleport or syn.queue_on_teleport or nil
if qot ~= nil then
    qot('loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/Aimblox.lua"))()')
end
spawn(function()
    while wait((ss.Settings.AutoSaveInterval * 60) or 360) do
        if ss.Settings.AutoSave then
            SaveSettings()
            Debug("[SETTINGS] Auto Saved Settings")
        end
    end
end)
Debug("[AIMBLOX] Loaded Script!")
LOADED += 1
