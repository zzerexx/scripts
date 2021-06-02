-- prison life
local players = game:GetService("Players")
local player = players.LocalPlayer
local camera = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local UI = Material.Load({
     Title = "prison life",
     Style = 3,
     SizeX = 400,
     SizeY = 280,
     Theme = "Dark"
})
print("Loaded UI Library [1/5]")

if game.PlaceId ~= 155615604 then
    UI.Banner({
        Text = "Please use this gui on Prison Life.",
        Options = {"Ok"}
    })
    local home = UI.New({
        Title = "Teleport"
    })
    home.Button({
        Text = "Teleport to Prison Life",
        Callback = function()
            game:GetService("TeleportService"):Teleport(155615604)
        end
    })
    return
end

local var = {
    ['Player'] = {
        ['Noclip'] = false,
        ['InfiniteJump'] = false,
        ['InfiniteStamina'] = false,
        ['AntiTaze'] = false,
        ['AntiArrest'] = false,
        ['SuperPunch'] = false,
        ['GodMode'] = false,
        ['WalkSpeed'] = 16,
        ['JumpPower'] = 50
    },
    ['Weapons'] = {
        ['BulletCount'] = 1,
        ['FireRate'] = 0.5
    },
    ['SilentAim'] = {
        ['SilentAim'] = false,
        ['VisibleCheck'] = false
    },
    ['ESP'] = {
        ['TeamCheck'] = false,
        ['Boxes'] = {
            ['Enabled'] = false,
            ['Transparency'] = 0.7,
        },
        ['Tracers'] = {
            ['Enabled'] = false,
            ['Transparency'] = 0.7,
            ['Origin'] = "Top",
        },
        ['Names'] = {
            ['Enabled'] = false,
            ['Transparency'] = 0.7,
            ['Font'] = Drawing.Fonts.UI,
            ['ShowDistance'] = false,
            ['ShowHealth'] = false
        },
    },
    ['Misc'] = {
        ['Fullbright'] = false,
        ['Xray'] = false,
        ['DoorCollision'] = false,
        ['RejoinOnKick'] = false,
        ['NameTagColor'] = "Bright orange"
    }
}
local Settings = {Player={Noclip,InfiniteJump,InfiniteStamina,AntiTaze,AntiArrest,SuperPunch,GodMode,WalkSpeed,JumpPower},Weapons={BulletCount,FireRate},SilentAim={SilentAim,VisibleCheck},ESP={TeamCheck,Boxes={Enabled,Transparency},Tracers={Enabled,Transparency,Origin},Names={Enabled,Transparency,Font,ShowDistance,ShowHealth}},Misc={Fullbright,Xray,DoorCollision,RejoinOnKick,NameTagColor}}
print("Loaded Variables  [2/5]")

if writefile and readfile and makefolder and isfolder and isfile then
    if not isfolder("PrisonLife") then
        makefolder("PrisonLife")
        makefolder("PrisonLife\\Configs")
        writefile("PrisonLife\\Configs\\Default.json",HttpService:JSONEncode(var))
        print("Created Folder")
    end
else
    UI.Banner({
        Text = "It appears that your exploit does not have the required functions to use configs.\nRequired functions: writefile, readfile, makefolder, isfolder, isfile",
        Options = {"Ok"}
    })
end

function Notification(title,text,duration)
    if not duration then
        duration = 5
    end
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = title,
        Text = text,
        Duration = duration
    })
end
function Banner(text)
    UI.Banner({
        Text = text,
        Options = {"Ok"}
    })
end
function GunMod(mod,value)
    for i,v in next, player.Backpack:GetChildren() do
        if v:IsA("Tool") and v.Name == "AK-47" or v.Name == "Remington 870" or v.Name == "M9" or v.Name == "M4A1" or v.Name == "Taser" then
            require(v.GunStates)[mod] = value
        end
    end
    for i,v in next, player.Character:GetChildren() do
        if v:IsA("Tool") and v.Name == "AK-47" or v.Name == "Remington 870" or v.Name == "M9" or v.Name == "M4A1" or v.Name == "Taser" then
            require(v.GunStates)[mod] = value
        end
    end
end
function ClosestPlayer(target)
    local plr = nil
    local closest = math.huge
    for i,v in next, players:GetPlayers() do
        if v ~= player and v.Team ~= player.Team and v.Character and v.Character.Humanoid.Health > 0 then
            local mag
            if target == "ClosestToPlayer" then
                mag = (player.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
            elseif target == "ClosestToMouse" then
                mag = (camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position) - camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)).Magnitude
            end
            if mag < closest then
                plr = v
                closest = mag
            end
        end
    end
    return plr
end
function UpdateList(dropdown)
    local plrs = {}
    for i,v in next, players:GetPlayers() do
        if v ~= player then
            table.insert(plrs,#plrs+1,v.Name)
        end
    end
    table.sort(plrs,function(a,b)
        return a < b
    end)
    table.insert(plrs,1,player.Name)
    dropdown:SetOptions(plrs)
end
function GetConfigs()
    if not isfolder("PrisonLife\\Configs") then
        Banner("Could not find the configs folder.")
        return
    end
    local list = {}
    for i,v in next, listfiles("PrisonLife\\Configs") do
        table.insert(list,#list+1,v:split("\\")[3]:split(".json")[1])
    end
    table.sort(list,function(a,b)
        return a < b
    end)
    return list
end
function LoadConfig(name)
    if not isfile("PrisonLife\\Configs\\"..name..".json") then
        Banner("Config '"..name.."' was not found.")
        return
    end
    local info = HttpService:JSONDecode(readfile("PrisonLife\\Configs\\"..name..".json"))
    var = info
    for i,v in next, info do -- lol
        for i2,v2 in next, v do
            if i2 == "NameTagColor" then
                var.Misc.NameTagColor = info[i][i2]
                Settings.Misc.NameTagColor = BrickColor.new(info[i][i2]).Color:ToHSV()
            else
                var[i][i2] = info[i][i2]
            end
            if typeof(info[i][i2]) ~= "table" then
                if i2.SetState then
                    Settings[i][i2]:SetState(info[i][i2])
                elseif i2.SetOptions then
                    Settings[i][i2]:SetOptions(info[i][i2])
                elseif i2.SetColor then
                    Settings[i][i2]:SetColor(info[i][i2])
                end
            else
                for i3,v3 in next, info[i][i2] do
                    var[i][i2][i3] = info[i][i2][i3]
                    if typeof(info[i][i2][i3]) ~= "table" then
                        if Settings[i][i2][i3].SetState and typeof(info[i][i2][i3]) == "boolean" then
                            Settings[i][i2][i3]:SetState(info[i][i2][i3])
                        elseif Settings[i][i2][i3].SetColor and typeof(info[i][i2][i3]) == "BrickColor" then
                            Settings[i][i2][i3]:SetColor(BrickColor.new(info[i][i2][i3]).Color:ToHSV())
                        elseif Settings[i][i2][i3].SetColor and typeof(info[i][i2][i3]) == "string" then
                            Settings[i][i2][i3] = (info[i][i2][i3])
                        end
                    else
                        for i4,v4 in next, info[i][i2][i3] do
                            var[i][i2][i3][i4] = info[i][i2][i3][i4]
                            if Settings[i][i2][i3][i4].SetState and typeof(info[i][i2][i3][i4]) == "boolean" then
                                Settings[i][i2][i3][i4]:SetState(info[i][i2][i3][i4])
                            elseif Settings[i][i2][i3][i4].SetColor and typeof(info[i][i2][i3][i4]) == "string" then
                                Settings[i][i2][i3][i4] = info[i][i2][i3][i4]
                            end
                        end
                    end
                end
            end
        end
    end
    if var.Player.InfiniteStamina then
        InfiniteStamina()
    end
    if var.Player.AntiTaze then
        AntiTaze()
    end
    player.Character.Humanoid.WalkSpeed = var.Player.WalkSpeed
    player.Character.Humanoid.JumpPower = var.Player.JumpPower
end
function InfiniteStamina()
    if typeof(getgc) ~= "function" then
        Banner("Your exploit does not have the required function for this.\nRequired function: getgc") return
    elseif typeof(debug.getupvalues) ~= "function" then
        Banner("Your exploit does not have the required function for this.\nRequired function: debug.getupvalues") return
    elseif typeof(debug.setupvalue) ~= "function" then
        Banner("Your exploit does not have the required function for this.\nRequired function: debug.setupvalue") return
    end
    for i,v in next, getgc() do 
        if typeof(v) == "function" and getfenv(v).script and tostring(getfenv(v).script) == "ClientInputHandler" then 
            for i2,v2 in next, debug.getupvalues(v) do 
                if typeof(v2) == "number" then 
                    debug.setupvalue(v,i2,math.huge)
                end
            end
        end
    end
end
function AntiTaze()
    if typeof(getconnections) ~= "function" then
        Banner("Your exploit does not have the required function for this.\nRequired function: getconnections") return
    end
    getconnections(workspace.Remote.tazePlayer.OnClientEvent)[1]:Disable()
end
function AntiArrest()
    workspace.Remote.arrestPlayer.OnClientEvent:Connect(function()
        player.Character.ClientInputHandler.Disabled = true 
        wait(0.5)
        player.Character.ClientInputHandler.Disabled = false
    end)
end
function SuperPunch()
    local part = Instance.new("Part",player.Character)
    local weld = Instance.new("Weld",part)
	part.CanCollide = false
	part.Size = Vector3.new(5,2,3)
	part.Transparency = 1
	weld.C1 = CFrame.new(0,0,2)
	weld.Part0 = player.Character.Torso
	weld.Part1 = part
	part.Touched:Connect(function(p)
		if not p.Parent:FindFirstChildOfClass("Humanoid") or p.Parent.Name == player.Name then
			return
		end
		local plr = players:GetPlayerFromCharacter(p.Parent)
		for i = 1,20 do
			ReplicatedStorage.meleeEvent:FireServer(plr)
		end
        part:Destroy()
	end)
end
function KillPlayer(plr)
    local oldcolor = player.TeamColor.Name
    workspace.Remote.TeamEvent:FireServer("Medium stone grey")
    local gun = "AK-47"
    workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.giver[gun].ITEMPICKUP)
    ReplicatedStorage.ReloadEvent:FireServer(player.Backpack[gun] or player.Character[gun])
    local args = {
        [1] = {
            [1] = {
                ["RayObject"] = Ray.new(Vector3.new(888.39965820313, 101.48999023438, 2388.4970703125), Vector3.new(-392.79403686523, 32.449165344238, 68.263359069824)),
                ["Distance"] = 23.821922302246,
                ["Cframe"] = CFrame.new(Vector3.new(875.65051269531, 102.33503723145, 2392.59375), Vector3.new(0.99490803480148, -0.09966829419136, -0.014973159879446)),
                ["Hit"] = plr.Character.Head
            },
            [2] = {
                ["RayObject"] = Ray.new(Vector3.new(888.39965820313, 101.48999023438, 2388.4970703125), Vector3.new(-392.48315429688, 33.763328552246, 69.404510498047)),
                ["Distance"] = 23.831678390503,
                ["Cframe"] = CFrame.new(Vector3.new(875.65051269531, 102.37702178955, 2392.6313476563), Vector3.new(0.99450075626373, -0.10315123945475, -0.018112052232027)),
                ["Hit"] = plr.Character.Head
            },
            [3] = {
                ["RayObject"] = Ray.new(Vector3.new(888.39965820313, 101.48999023438, 2388.4970703125), Vector3.new(-393.71801757813, 24.107759475708, 66.369728088379)),
                ["Distance"] = 23.773683547974,
                ["Cframe"] = CFrame.new(Vector3.new(875.65051269531, 102.07206726074, 2392.5297851563), Vector3.new(0.99692684412003, -0.077747754752636, -0.0096018556505442)),
                ["Hit"] = plr.Character.Head
            },
            [4] = {
                ["RayObject"] = Ray.new(Vector3.new(888.39965820313, 101.48999023438, 2388.4970703125), Vector3.new(-395.65017700195, 28.086275100708, 51.692462921143)),
                ["Distance"] = 23.802883148193,
                ["Cframe"] = CFrame.new(Vector3.new(875.65051269531, 102.19207000732, 2392.0632324219), Vector3.new(0.99570387601852, -0.087735749781132, 0.029601030051708)),
                ["Hit"] = plr.Character.Head
            },
            [5] = {
                ["RayObject"] = Ray.new(Vector3.new(888.39965820313, 101.48999023438, 2388.4970703125), Vector3.new(-395.87457275391, 31.009611129761, 48.184143066406)),
                ["Distance"] = 23.82692527771,
                ["Cframe"] = CFrame.new(Vector3.new(875.65051269531, 102.28240203857, 2391.9533691406), Vector3.new(0.99469912052155, -0.095229558646679, 0.038792934268713)),
                ["Hit"] = plr.Character.Head
            }
        },
        [2] = player.Backpack:FindFirstChild(gun) or player.Character:FindFirstChild(gun)
    }
    ReplicatedStorage.ShootEvent:FireServer(unpack(args))
    ReplicatedStorage.ShootEvent:FireServer(unpack(args))
    workspace.Remote.TeamEvent:FireServer(oldcolor)
end
print("Loaded Functions  [3/5]")

if not getgenv().EspSettings then
    getgenv().EspSettings = {
        TeamCheck = true,
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
            Origin = "Top",
            Thickness = 1
        },
        Names = {
            Enabled = true,
            Transparency = 0.7,
            Color = Color3.fromRGB(255,255,255),
            UseTeamColor = true,
            Font = Drawing.Fonts.UI,
            Size = 18,
            Outline = true,
            OutlineColor = Color3.fromRGB(0,0,0),
            ShowDistance = false,
            ShowHealth = false,
        }
    }
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEsp.lua", true))()
end
print("Loaded ESP        [4/5]")

local CFrames = {
    ["AK-47"] = CFrame.new(-933.276184, 94.1287842, 2056.50757, 0.00427169399, 7.74807063e-08, 0.99999094, -1.15140981e-08, 1, -7.74322473e-08, -0.99999094, -1.11832286e-08, 0.00427169399),
    ["Remington 870 (Guard)"] = CFrame.new(826.941101, 99.9900055, 2255.91968, 0.999999702, -1.98958556e-08, -0.000784283737, 1.99129744e-08, 1, 2.18187655e-08, 0.000784283737, -2.18343761e-08, 0.999999702),
    ["Remington 870 (Criminal)"] = CFrame.new(-945.207703, 94.1287842, 2056.38037, 0.00967568532, 7.7783227e-08, 0.99995321, -1.45837564e-08, 1, -7.76457512e-08, -0.99995321, -1.38317979e-08, 0.00967568532),
    ["M9"] = CFrame.new(821.475525, 99.9899826, 2255.04858, 0.999646246, 4.7205595e-09, 0.0265972149, -1.96314676e-09, 1, -1.03699101e-07, -0.0265972149, 1.03610205e-07, 0.999646246),
    ["M4A1"] = CFrame.new(854.068359, 99.9900055, 2254.83936, 0.999996901, -1.25656943e-08, 0.00236702268, 1.26199131e-08, 1, -2.2888921e-08, -0.00236702268, 2.29187176e-08, 0.999996901),
    ["Riot Shield"] = CFrame.new(849.428223, 99.9900055, 2254.85425, 0.999885798, -1.29644135e-08, -0.0151139488, 1.26199131e-08, 1, -2.2888921e-08, 0.0151139488, 2.26955699e-08, 0.999885798),
    
    ["Criminal Base"] = CFrame.new(-924.982788, 95.1273117, 2138.22974, -0.01514115, 4.4389445e-08, -0.999885559, -5.0008893e-08, 1, 4.51518147e-08, 0.999885559, 5.0686797e-08, -0.01514115),
    ["Yard"] = CFrame.new(776.431519, 98.1899414, 2524.91895, -0.999886036, 3.67849466e-08, 0.0150980083, 3.62649537e-08, 1, -3.47149403e-08, -0.0150980083, -3.41634525e-08, -0.999886036),
    ["Cells"] = CFrame.new(916.90564, 99.9899902, 2409.95752, -0.999995172, 2.05472812e-08, 0.00306595769, 2.0416083e-08, 1, -4.28221298e-08, -0.00306595769, -4.27593214e-08, -0.999995172),
    ["Cafeteria"] = CFrame.new(916.262207, 99.9899826, 2344.8064, 0.999993801, 1.63763625e-09, -0.00352707505, -1.96196814e-09, 1, -9.19514562e-08, 0.00352707505, 9.19578014e-08, 0.999993801),
    ["Cafeteria Kitchen"] = CFrame.new(963.562683, 99.9899597, 2240.49658, 0.695446253, -2.97293532e-08, 0.7185781, 3.57168695e-08, 1, 6.80537626e-09, -0.7185781, 2.09325854e-08, 0.695446253),
    ["Guard Armory"] = CFrame.new(836.457947, 99.9900055, 2283.51123, 0.999959648, 1.02565195e-07, -0.00900303945, -1.02191713e-07, 1, 4.19438209e-08, 0.00900303945, -4.10221013e-08, 0.999959648),
    ["Prison Gate"] = CFrame.new(487.016022, 98.1900101, 2247.58813, 0.0244596694, 5.71806567e-08, 0.999700844, 2.62643685e-08, 1, -5.78403778e-08, -0.999700844, 2.76712662e-08, 0.0244596694),
    ["Car Spawn (Criminal)"] = CFrame.new(-909.68158, 95.1273117, 2152.95068, -0.999859512, 1.75644388e-08, 0.016758915, 1.74348305e-08, 1, -7.87971288e-09, -0.016758915, -7.5864186e-09, -0.999859512),
    ["Car Spawn (City) 1"] = CFrame.new(-529.096924, 54.5750389, 1776.43274, 0.59292084, -5.12499874e-08, -0.805260777, -3.84759282e-08, 1, -9.19741439e-08, 0.805260777, 8.55165396e-08, 0.59292084),
    ["Car Spawn (City) 2"] = CFrame.new(-195.717926, 54.5750237, 1879.81824, -0.0522688404, -1.89185076e-08, -0.998633087, -2.29093402e-08, 1, -1.77453181e-08, 0.998633087, 2.1950493e-08, -0.0522688404),
    ["Freeway Hideout"] = CFrame.new(-78.9059448, 11.2191191, 1343.09668, 0.0444511548, 1.49661687e-08, 0.999011576, 8.75487345e-08, 1, -1.88764702e-08, -0.999011576, 8.83012774e-08, 0.0444511548),
}

local Home = UI.New({
    Title = "Home"
})

local Player = UI.New({
    Title = "Player"
})
Settings.Player.Noclip = Player.Toggle({
    Text = "Noclip",
    Callback = function(value)
        var.Player.Noclip = value
    end,
    Enabled = false
})
Settings.Player.InfiniteJump = Player.Toggle({
    Text = "Infinite Jump",
    Callback = function(value)
        var.Player.InfiniteJump = value
    end,
    Enabled = false
})
Settings.Player.InfiniteStamina = Player.Toggle({
    Text = "Infinite Stamina",
    Callback = function(value)
        var.Player.InfiniteStamina = value
    end,
    Enabled = false
})
Settings.Player.AntiTaze = Player.Toggle({
    Text = "Anti Taze",
    Callback = function(value)
        var.Player.AntiTaze = value
    end,
    Enabled = false
})
Settings.Player.AntiArrest = Player.Toggle({
    Text = "Anti Arrest",
    Callback = function(value)
        var.Player.AntiArrest = value
    end,
    Enabled = false
})
Settings.Player.SuperPunch = Player.Toggle({
    Text = "Super Punch",
    Callback = function(value)
        var.Player.SuperPunch = value
    end,
    Enabled = false
})
Settings.Player.GodMode = Player.Toggle({
    Text = "God Mode",
    Callback = function(value)
        var.Player.GodMode = value
    end,
    Enabled = false
})
Settings.Player.WalkSpeed = Player.Slider({
    Text = "Walk Speed",
    Callback = function(value)
        var.Player.WalkSpeed = value
        player.Character.Humanoid.WalkSpeed = value
    end,
    Min = 0,
    Max = 100,
    Def = 16
})
Settings.Player.JumpPower = Player.Slider({
    Text = "Jump Power",
    Callback = function(value)
        var.Player.JumpPower = value
        player.Character.Humanoid.JumpPower = value
    end,
    Min = 0,
    Max = 100,
    Def = 50
})

local Weapons = UI.New({
    Title = "Weapons"
})
Weapons.Button({
    Text = "Get All Weapons",
    Callback = function()
        for i,v in next, workspace.Prison_ITEMS.giver:GetChildren() do
            if MarketplaceService:PlayerOwnsAsset(player,96651) and v.Name == "M4A1" or v.Name == "Riot Shield" then
                workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
            elseif v.Name ~= "M4A1" and v.Name ~= "Riot Shield" then
                workspace.Remote.ItemHandler:InvokeServer(v.ITEMPICKUP)
            end
        end
    end
})
Weapons.Button({
    Text = "Infinite Ammo",
    Callback = function()
        GunMod("MaxAmmo",math.huge)
        GunMod("CurrentAmmo",math.huge)
        GunMod("StoredAmmo",math.huge)
    end
})
Weapons.Button({
    Text = "Full Auto",
    Callback = function()
        GunMod("AutoFire",true)
    end
})
Weapons.Button({
    Text = "Instant Reload",
    Callback = function()
        GunMod("ReloadTime",0)
    end
})
Settings.Weapons.BulletCount = Weapons.Slider({
    Text = "Bullet Count",
    Callback = function(value)
        var.Weapons.BulletCount = value
        GunMod("Bullets",value)
    end,
    Min = 1,
    Max = 100,
    Def = 1,
})
Settings.Weapons.FireRate = Weapons.Slider({
    Text = "Fire Rate",
    Callback = function(value)
        var.Weapons.FireRate = value / 10
        GunMod("FireRate",value / 10)
    end,
    Min = 0,
    Max = 10,
    Def = 3
})

local SilentAim = UI.New({
    Title = "Silent Aim"
})
Settings.SilentAim.SilentAim = SilentAim.Toggle({
    Text = "Enabled",
    Callback = function(value)
        var.SilentAim.SilentAim = value
    end,
    Enabled = false
})
Settings.SilentAim.VisibleCheck = SilentAim.Toggle({
    Text = "Visible Check",
    Callback = function(value)
        var.SilentAim.VisibleCheck = value
    end,
    Enabled = false
})

local ESP = UI.New({
    Title = "ESP"
})
Settings.ESP.TeamCheck = ESP.Toggle({
    Text = "Team Check",
    Callback = function(value)
        getgenv().EspSettings.TeamCheck = value
        var.ESP.TeamCheck = value
    end,
    Enabled = false
})
Settings.ESP.Boxes.Enabled = ESP.Toggle({
    Text = "Boxes",
    Callback = function(value)
        getgenv().EspSettings.Boxes.Enabled = value
        var.ESP.Boxes.Enabled = value
    end
})
Settings.ESP.Boxes.Transparency = ESP.Slider({
    Text = "Box Transparency",
    Callback = function(value)
        getgenv().EspSettings.Boxes.Transparency = value / 10
        var.ESP.Boxes.Transparency = value / 10
    end,
    Min = 0,
    Max = 10,
    Def = 7
})

Settings.ESP.Tracers.Enabled = ESP.Toggle({
    Text = "Tracers",
    Callback = function(value)
        getgenv().EspSettings.Tracers.Enabled = value
        var.ESP.Tracers.Enabled = value
    end
})
Settings.ESP.Tracers.Transparency = ESP.Slider({
    Text = "Tracer Transparency",
    Callback = function(value)
        getgenv().EspSettings.Tracers.Transparency = value / 10
        var.ESP.Tracers.Transparency = value / 10
    end,
    Min = 0,
    Max = 10,
    Def = 7
})
Settings.ESP.Tracers.Origin = ESP.Dropdown({
    Text = "Tracer Origin",
    Callback = function(value)
        getgenv().EspSettings.Tracers.Origin = value
        var.ESP.Tracers.Origin = value
    end,
    Options = {
        "Top",
        "Center",
        "Bottom",
        "Mouse"
    }
})

Settings.ESP.Names.Enabled = ESP.Toggle({
    Text = "Names",
    Callback = function(value)
        getgenv().EspSettings.Names.Enabled = value
        var.ESP.Names.Enabled = value
    end
})
Settings.ESP.Names.Transparency = ESP.Slider({
    Text = "Name Transparency",
    Callback = function(value)
        getgenv().EspSettings.Names.Transparency = value / 10
        var.ESP.Names.Transparency = value
    end,
    Min = 0,
    Max = 10,
    Def = 7
})
Settings.ESP.Names.Font = ESP.Dropdown({
    Text = "Name Font",
    Callback = function(value)
        getgenv().EspSettings.Names.Font = Drawing.Fonts[value]
        var.ESP.Names.Font = Drawing.Fonts[value]
    end,
    Options = {
        "UI",
        "System",
        "Plex",
        "Monospace"
    }
})
Settings.ESP.Names.ShowDistance = ESP.Toggle({
    Text = "Show Distance",
    Callback = function(value)
        getgenv().EspSettings.Names.ShowDistance = value
        var.ESP.Names.ShowDistance = value
    end,
    Enabled = false
})
Settings.ESP.Names.ShowHealth = ESP.Toggle({
    Text = "Show Health",
    Callback = function(value)
        getgenv().EspSettings.Names.ShowHealth = value
        var.ESP.Names.ShowHealth = value
    end,
    Enabled = false
})

local Teleports = UI.New({
    Title = "Teleports"
})
Teleports.Dropdown({
    Text = "Locations",
    Callback = function(value)
        player.Character.HumanoidRootPart.CFrame = CFrames[value]
    end,
    Options = {
        "Criminal Base",
        "Yard",
        "Cells",
        "Cafeteria",
        "Cafeteria Kitchen",
        "Guard Armory",
        "Prison Gate",
        "Car Spawn (Criminal)",
        "Car Spawn (City) 1",
        "Car Spawn (City) 2",
        "Freeway Hideout",
    }
})
Teleports.Dropdown({
    Text = "Weapons",
    Callback = function(value)
        player.Character.HumanoidRootPart.CFrame = CFrames[value]
    end,
    Options = {
        "AK-47",
        "Remington 870 (Guard)",
        "Remington 870 (Criminal)",
        "M9",
        "M4A1",
        "Riot Shield"
    }
})
local playertp = Teleports.Dropdown({
    Text = "Players",
    Callback = function(value)
        local plr = players[value]
        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(plr.Character.HumanoidRootPart.Position)
        end
    end,
    Options = {}
})

local Misc = UI.New({
    Title = "Miscellaneous"
})
Settings.Misc.Fullbright = Misc.Toggle({
    Text = "Fullbright",
    Callback = function(value)
        var.Misc.Fullbright = value
    end,
    Enabled = false
})
Settings.Misc.Xray = Misc.Toggle({
    Text = "Xray",
    Callback = function(value)
        var.Misc.Xray = value
        if value then
            for i,v in next, workspace:GetDescendants() do
                if v:IsA("BasePart") then
                    v.LocalTransparencyModifier = 0.9
                end
            end
        else
            for i,v in next, workspace:GetDescendants() do
                if v:IsA("BasePart") then
                    v.LocalTransparencyModifier = 0
                end
            end
        end
    end,
    Enabled = false
})
Settings.Misc.DoorCollision = Misc.Toggle({
    Text = "Door Collision",
    Callback = function(value)
        var.Misc.DoorCollision = value
    end,
    Enabled = true
})
Settings.Misc.RejoinOnKick = Misc.Toggle({
    Text = "Rejoin on Kick",
    Callback = function(value)
        var.Misc.RejoinOnKick = value
    end,
    Enabled = false
})
local keycard = Misc.Button({
    Text = "Get Keycard",
    Callback = function()
        if workspace.Prison_ITEMS.single:FindFirstChild("Key card") then
            workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single:FindFirstChild("Key card").ITEMPICKUP)
        end
    end
})
Misc.Button({
    Text = "Copy Server Invite",
    Callback = function()
        if typeof(setclipboard) ~= "function" then
            Notification("Copy Server Invite","Missing Function: setclipboard") return
        end
        setclipboard('game:GetService("TeleportService"):TeleportToPlaceInstance('..game.PlaceId..',"'..game.JobId..'")')
    end
})
local spectate = Misc.Dropdown({
    Text = "Spectate",
    Callback = function(value)
        local plr = players[value]
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            camera.CameraSubject = plr.Character.Humanoid
        end
    end,
    Options = {}
})
local killplayers = Misc.Dropdown({
    Text = "Kill Player",
    Callback = function(value)
        KillPlayer(players[value])
    end,
    Options = {}
})
Settings.Misc.NameTagColor = Misc.ColorPicker({
    Text = "Name Tag Color",
    Default = Color3.fromHSV(0,1,1),
    Callback = function(value)
        var.Misc.NameTagColor = BrickColor.new(value)
    end
})
Misc.Button({
    Text = "Change Name Tag Color",
    Callback = function()
        local oldcf = player.Character.HumanoidRootPart.CFrame 
        local oldcameracf = camera.CFrame
        workspace.Remote.loadchar:InvokeServer(player,var.Misc.NameTagColor.Name)
        player.Character.HumanoidRootPart.CFrame = oldcf
        wait()
        camera.CFrame = oldcameracf
    end
})

local ConfigName = "Untitled"
local SelectedConfig = ""
local Config = UI.New({
    Title = "Configuration"
})
Config.TextField({
    Text = "Config Name",
    Type = "Default",
    Callback = function(value)
        if value:gsub(" ","") ~= "" then
            ConfigName = value 
        end
    end
})
Config.Button({
    Text = "Save",
    Callback = function()
        writefile("PrisonLife\\Configs\\"..ConfigName..".json",HttpService:JSONEncode(var))
    end
})
local configs = Config.Dropdown({
    Text = "Your Configs",
    Callback = function(value)
        SelectedConfig = value
    end,
    Options = {}
})
if isfolder("PrisonLife\\Configs") then
    configs:SetOptions(GetConfigs())
end
Config.Button({
    Text = "Load Config",
    Callback = function()
        LoadConfig(SelectedConfig)
    end
})
Config.Button({
    Text = "Refresh",
    Callback = function()
        if isfolder("PrisonLife\\Configs") then
            configs:SetOptions(GetConfigs())
        end
    end
})
Config.Button({
    Text = "Reset All Settings",
    Callback = function()
        LoadConfig("Default")
    end
})
print("Loaded UI         [5/5]")

for i,v in next, Settings do
    print(i,v)
end

UpdateList(playertp)
UpdateList(spectate)
UpdateList(killplayers)
players.PlayerAdded:Connect(function()
    UpdateList(playertp)
    UpdateList(spectate)
    UpdateList(killplayers)
end)
players.PlayerRemoving:Connect(function()
    UpdateList(playertp)
    UpdateList(spectate)
    UpdateList(killplayers)
end)
player.CharacterAdded:Connect(function(char)
    char:WaitForChild("Humanoid")
    char.Humanoid.WalkSpeed = var.Player.WalkSpeed
    char.Humanoid.JumpPower = var.Player.JumpPower
end)
RunService.Heartbeat:Connect(function()
    if var.Player.Noclip and player.Character and player.Character.Humanoid.Health > 0 then
        player.Character.Humanoid:ChangeState(11)
    end
end)
UIS.InputBegan:Connect(function(i,gp)
    if gp then
        return
    end
    if i.KeyCode == Enum.KeyCode.Space and var.Player.InfiniteJump then
        player.Character.Humanoid:ChangeState(3)
    elseif i.KeyCode == Enum.KeyCode.F and var.Player.SuperPunch then
        SuperPunch()
    end
end)
player.Character.Humanoid.Changed:Connect(function(prop)
    if prop == "WalkSpeed" and player.Character.Humanoid.WalkSpeed ~= var.Player.WalkSpeed then
        player.Character.Humanoid.WalkSpeed = var.Player.WalkSpeed
    elseif prop == "JumpPower" and player.Character.Humanoid.JumpPower ~= var.Player.JumpPower then
        player.Character.Humanoid.JumpPower = var.Player.JumpPower
    end
end)
game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(function()
    if var.Misc.RejoinOnKick then
        if queue_on_teleport or syn.queue_on_teleport then
            local queue_on_teleport = queue_on_teleport or syn.queue_on_teleport
            queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/prisonlife.lua"))()')
        end
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId)
    end
end)
while wait() do
    if player.Character and player.Character.Humanoid.Health < 1 then
        if var.Player.GodMode then
            local oldcf = player.Character.HumanoidRootPart.CFrame
            local oldcameracf = camera.CFrame
            workspace.Remote.loadchar:InvokeServer()
            player.Character.HumanoidRootPart.CFrame = oldcf
            wait()
            camera.CFrame = oldcameracf
        end
        if var.Player.AntiTaze then
            AntiTaze()
        end
        if var.Player.AntiArrest then
            AntiArrest()
        end
        if var.Player.InfiniteStamina then
            InfiniteStamina()
        end
    end
    if var.Misc.Fullbright then
        Lighting.Ambient = Color3.fromRGB(255,255,255)
        Lighting.Brightness = 10
    end
    for i,v in next, workspace.Doors:GetDescendants() do
        if v:IsA("Part") then
            v.CanCollide = var.Misc.DoorCollision
        end
    end
    if workspace.Prison_ITEMS.single:FindFirstChild("Key card") then
        keycard:SetText("Get Keycard (Available)")
    else
        keycard:SetText("Get Keycard (Unavailable)")
    end
end
