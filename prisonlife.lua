-- prison life
local players = game:GetService("Players")
local player = players.LocalPlayer
local camera = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local UI = Material.Load({
     Title = "prison life",
     Style = 3,
     SizeX = 400,
     SizeY = 255,
     Theme = "Dark"
})

local var = {
    reminders = true,
    walkspeed = 16,
    jumppower = 50,
    noclip = false,
    silentaim = false,
    visiblecheck = false,
    infjump = false,
    godmode = false,
    superpunchenabled = false,
    infstamina = false,
    antitaze = false,
    antiarrest = false,
    fullbright = false,
    doorcollision = true,
    rejoinonkick = false,
    nametagcolor = Color3.fromRGB(255,255,255),
}

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
    for i,v in ipairs(players:GetPlayers()) do
        table.insert(plrs,#plrs+1,v.Name)
    end
    dropdown:SetOptions(plrs)
end
function InfiniteStamina()
    if typeof(getgc) ~= "function" then
        Notification("Infinite Stamina","Missing Function: getgc") return
    elseif typeof(debug.getupvalue) ~= "function" then
        Notification("Infinite Stamina","Missing Function: debug.getupvalue") return
    elseif typeof(debug.setupvalue) ~= "function" then
        Notification("Infinite Stamina","Missing Function: debug.setupvalue") return
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
        Notification("Anti Taze","Missing Function: getconnections") return
    end
    getconnections(workspace.Remote.tazePlayer.OnClientEvent)[1]:Disable()
end
function AntiArrest()

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
    local gun = "Remington 870"
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

if not getgenv().EspSettings then
    getgenv().EspSettings = {
        TeamCheck = false,
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
Player.Toggle({
    Text = "Noclip",
    Callback = function(value)
        var.noclip = value
    end,
    Enabled = false
})
Player.Toggle({
    Text = "Infinite Jump",
    Callback = function(value)
        var.infjump = value
    end,
    Enabled = false
})
Player.Slider({
    Text = "Walk Speed",
    Callback = function(value)
        var.walkspeed = value
        player.Character.Humanoid.WalkSpeed = value
    end,
    Min = 0,
    Max = 100,
    Def = 16
})
Player.Slider({
    Text = "Jump Power",
    Callback = function(value)
        var.jumppower = value
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
            if v.Name ~= "M4A1" and v.Name ~= "Riot Shield" then
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
Weapons.Slider({
    Text = "Bullet Count",
    Callback = function(value)
        GunMod("Bullets",value)
    end,
    Min = 1,
    Max = 100,
    Def = 1,
})
Weapons.Slider({
    Text = "Fire Rate",
    Callback = function(value)
        GunMod("FireRate",value/10)
    end,
    Min = 0,
    Max = 10,
    Def = 3
})

local SilentAim = UI.New({
    Title = "Silent Aim"
})
SilentAim.Toggle({
    Text = "Enabled",
    Callback = function(value)
        var.silentaim = value
        if value == true then
            silentaim = value
        end
    end,
    Enabled = false
})
SilentAim.Toggle({
    Text = "Visible Check",
    Callback = function(value)
        var.visiblecheck = value
    end,
    Enabled = false
})

local ESP = UI.New({
    Title = "ESP"
})
ESP.Toggle({
    Text = "Team Check",
    Callback = function(value)
        getgenv().EspSettings.TeamCheck = value
    end,
    Enabled = false
})
ESP.Toggle({
    Text = "Boxes",
    Callback = function(value)
        getgenv().EspSettings.Boxes.Enabled = value
    end
})
ESP.Slider({
    Text = "Box Transparency",
    Callback = function(value)
        getgenv().EspSettings.Boxes.Transparency = value / 10
    end,
    Min = 0,
    Max = 10,
    Def = 7
})

ESP.Toggle({
    Text = "Tracers",
    Callback = function(value)
        getgenv().EspSettings.Tracers.Enabled = value
    end
})
ESP.Slider({
    Text = "Tracer Transparency",
    Callback = function(value)
        getgenv().EspSettings.Tracers.Transparency = value / 10
    end,
    Min = 0,
    Max = 10,
    Def = 7
})
ESP.Dropdown({
    Text = "Tracer Origin",
    Callback = function(value)
        getgenv().EspSettings.Tracers.Origin = value
    end,
    Options = {
        "Top",
        "Center",
        "Bottom",
        "Mouse"
    }
})

ESP.Toggle({
    Text = "Names",
    Callback = function(value)
        getgenv().EspSettings.Names.Enabled = value
    end
})
ESP.Slider({
    Text = "Name Transparency",
    Callback = function(value)
        getgenv().EspSettings.Names.Transparency = value / 10
    end,
    Min = 0,
    Max = 10,
    Def = 7
})
ESP.Dropdown({
    Text = "Name Font",
    Callback = function(value)
        getgenv().EspSettings.Names.Font = Drawing.Fonts[value]
    end,
    Options = {
        "UI",
        "System",
        "Plex",
        "Monospace"
    }
})
ESP.Toggle({
    Text = "Show Health",
    Callback = function(value)
        getgenv().EspSettings.Names.ShowHealth = value
    end,
    Enabled = false
})
ESP.Toggle({
    Text = "Show Distance",
    Callback = function(value)
        getgenv().EspSettings.Names.ShowDistance = value
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
Misc.Toggle({
    Text = "Infinite Stamina",
    Callback = function(value)
        var.infstamina = value
        if value then
            InfiniteStamina()
        end
    end,
    Enabled = false
})
Misc.Toggle({
    Text = "Anti Taze",
    Callback = function(value)
        var.antitaze = value
        if value then
            AntiTaze()
        end
    end,
    Enabled = false
})
Misc.Toggle({
    Text = "Anti Arrest",
    Callback = function(value)

        var.antiarrest = value
    end,
    Enabled = false
})
Misc.Toggle({
    Text = "Fullbright",
    Callback = function(value)
        var.fullbright = value
    end,
    Enabled = false
})
Misc.Toggle({
    Text = "Super Punch",
    Callback = function(value)
        var.superpunchenabled = value
    end,
    Enabled = false
})
Misc.Toggle({
    Text = "God Mode",
    Callback = function(value)
        var.godmode = value
    end,
    Enabled = false
})
Misc.Toggle({
    Text = "Xray",
    Callback = function(value)
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
Misc.Toggle({
    Text = "Door Collision",
    Callback = function(value)
        var.doorcollision = value
    end,
    Enabled = true
})
Misc.Toggle({
    Text = "Rejoin on Kick",
    Callback = function(value)
        var.rejoinonkick = value
    end,
    Enabled = false
})
local keycardbtn = Misc.Button({
    Text = "Get Keycard",
    Callback = function()
        if workspace.Prison_ITEMS.single:FindFirstChild("Key card") then
            workspace.Remote.ItemHandler:InvokeServer(workspace.Prison_ITEMS.single:FindFirstChild("Key card").ITEMPICKUP)
        end
    end
})
spawn(function()
    while wait(1) do
        if workspace.Prison_ITEMS.single:FindFirstChild("Key card") then
            keycardbtn:SetText("Get Keycard (Available)")
        else
            keycardbtn:SetText("Get Keycard (Unavailable)")
        end
    end
end)
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
        if value ~= "You" then
            local plr = players[value]
            if plr.Character and plr.Character:FindFirstChild("Humanoid") then
                camera.CameraSubject = plr.Character.Humanoid
            end
        else
            camera.CameraSubject = player.Character.Humanoid
        end
    end,
    Options = {"You"}
})
local killplayers = Misc.Dropdown({
    Text = "Kill Player",
    Callback = function(value)
        KillPlayer(players[value])
    end,
    Options = {}
})
Misc.ColorPicker({
    Text = "Name Tag Color",
    Default = Color3.fromRGB(255,255,255),
    Callback = function(value)
        var.nametagcolor = BrickColor.new(value).Name
    end
})
Misc.Button({
    Text = "Change Name Tag Color",
    Callback = function()
        local oldcf = player.Character.HumanoidRootPart.CFrame 
        local oldcameracf = camera.CFrame
        workspace.Remote.loadchar:InvokeServer(player,var.nametagcolor)
        player.Character.HumanoidRootPart.CFrame = oldcf
        wait()
        camera.CFrame = oldcameracf
    end
})


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
    char.Humanoid.WalkSpeed = var.walkspeed 
    char.Humanoid.JumpPower = var.jumppower
end)
RunService.Heartbeat:Connect(function()
    if var.noclip and player.Character and player.Character.Humanoid.Health > 0 then
        player.Character.Humanoid:ChangeState(11)
    end
end)
UIS.InputBegan:Connect(function(i,gp)
    if gp then
        return
    end
    if i.KeyCode == Enum.KeyCode.Space and var.infjump then
        player.Character.Humanoid:ChangeState(3)
    elseif i.KeyCode == Enum.KeyCode.F and var.superpunchenabled then
        SuperPunch()
    end
end)
player.Character.Humanoid.Changed:Connect(function(prop)
    if prop == "WalkSpeed" and player.Character.Humanoid.WalkSpeed ~= var.walkspeed then
        player.Character.Humanoid.WalkSpeed = var.walkspeed
    elseif prop == "JumpPower" and player.Character.Humanoid.JumpPower ~= var.JumpPower then
        player.Character.Humanoid.JumpPower = var.jumppower
    end
end)
game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(function()
    if var.rejoinonkick then
        if queue_on_teleport or syn.queue_on_teleport then
            local queue = queue_on_teleport or syn.queue_on_teleport
            queue('loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/prisonlife.lua"))()')
        end
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId)
    end
end)
while wait() do
    if player.Character and player.Character.Humanoid.Health < 1 then
        if var.godmode then
            local oldcf = player.Character.HumanoidRootPart.CFrame
            local oldcameracf = camera.CFrame
            workspace.Remote.loadchar:InvokeServer()
            player.Character.HumanoidRootPart.CFrame = oldcf
            wait()
            camera.CFrame = oldcameracf
        end
        if var.antitaze then
            AntiTaze()
        end
        if var.infstamina then
            InfiniteStamina()
        end
    end
    if var.fullbright then
        Lighting.Ambient = Color3.fromRGB(255,255,255)
        Lighting.Brightness = 10
    end
    for i,v in next, workspace.Doors:GetDescendants() do
        if v:IsA("Part") then
            v.CanCollide = var.doorcollision
        end
    end
end
