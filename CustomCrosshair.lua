-- Custom Crosshair by zzerexx#3970
--[[
    HideGameCrosshair Supported Games
    Arsenal
    Counter Blox
    Unit: Classified
    Phantom Forces
    Polybattle
    Bad Business
    Strucid
    AceOfSpadez
    RECOIL
    Jailbreak
    Blackhawk Rescue Mission 5
    Project Lazarus
    Mad City
    Big Paintball
    POLYGUNS
]]

function msg(text,duration)
    local hint = Instance.new("Hint",game.CoreGui)
    hint.Text = text
    wait(duration or 5)
    hint:Destroy()
end
function UpdateScript()
    local bind = Instance.new("BindableFunction")
    function bind.OnInvoke(response)
        if response == "Yes" then
            if not setclipboard then
                msg("https://pastebin.com/raw/eGiC2jPg")
            end
            setclipboard("https://pastebin.com/raw/eGiC2jPg")
            game.StarterGui:SetCore("SendNotification",{
                Title = "Custom Crosshair",
                Text = "Copied the script to your clipboard!",
                Duration = 5
            })
        end
    end
    game.StarterGui:SetCore("SendNotification",{
        Title = "Custom Crosshair",
        Text = "You are using an older version of Custom Crosshair. Would you like the latest version?",
        Duration = 20,
        Callback = bind,
        Button1 = "Yes",
        Button2 = "No"
    })
end
local player = game:GetService("Players").LocalPlayer
local camera = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ss = getgenv().CrosshairSettings
local middle = Vector2.new(camera.ViewportSize.X/2,camera.ViewportSize.Y/2)

if getgenv().CrosshairSettings.RainbowColor == nil then
    UpdateScript()
end
if typeof(Drawing.new) ~= "function" then
    msg("Your exploit does not have a Drawing Library",5)
    return
end
if typeof(ss.Color) ~= "Color3" then
    msg("Invalid Color",2)
    return
end

if typeof(getgenv().crosshairobj) == "table" then
    for i,v in pairs(getgenv().crosshairobj) do
        if typeof(v) == "table" or typeof(v) == "userdata" then
            v:Remove()
        end
    end
end
if typeof(getgenv().crosshairrs) == "RBXScriptConnection" then
    getgenv().crosshairrs:Disconnect()
end
local supported = false
for i,v in next, {286090429,301549746,4292776423,292439477,299659045,4716045691,3233893879,2377868063,2555870920,4651779470,606849621,2916899287,443406476,1224212277,3527629287,388599755} do
    if game.PlaceId == v then
        supported = true
    end
end
if ss.HideGameCrosshair and not supported then
    spawn(function()
        msg("HideGameCrosshair is not available for this game. Check the source for a list of supported games",5) 
    end)
end

local line1 = Drawing.new("Line") -- Top Line
local line2 = Drawing.new("Line") -- Right Line 
local line3 = Drawing.new("Line") -- Bottom Line 
local line4 = Drawing.new("Line") -- Left Line
local dot = Drawing.new("Square") -- garbage dot
getgenv().crosshairobj = {line1 = line1,line2 = line2,line3 = line3,line4 = line4,dot = dot}
line1.Visible = true
line2.Visible = true
line3.Visible = true
line4.Visible = true
dot.Thickness = 1
dot.Visible = true
dot.Filled = true
if not ss.Dot then
    dot.Visible = false
end

game:GetService("UserInputService").InputBegan:Connect(function(i,gp)
    if i.KeyCode == ss.ToggleKey and not gp and line1 and line2 and line3 and line4 and dot then
        line1.Visible = not line1.Visible
        line2.Visible = not line2.Visible
        line3.Visible = not line3.Visible
        line4.Visible = not line4.Visible
        if ss.Dot then
            dot.Visible = not dot.Visible
        end
    end
end

getgenv().crosshairrs = RunService.RenderStepped:Connect(function()
    ss = getgenv().CrosshairSettings
    if ss.HideMouseIcon ~= 0 then
        if ss.HideMouseIcon then
            UIS.MouseIconEnabled = false
        else
            UIS.MouseIconEnabled = true
        end
    end
    if ss.FollowCursor then
        middle = UIS:GetMouseLocation()
    else
        middle = Vector2.new(camera.ViewportSize.X/2,camera.ViewportSize.Y/2)
    end
    line1.Transparency = ss.Opacity
    line2.Transparency = ss.Opacity
    line3.Transparency = ss.Opacity
    line4.Transparency = ss.Opacity
    line1.Thickness = ss.Thickness
    line2.Thickness = ss.Thickness
    line3.Thickness = ss.Thickness
    line4.Thickness = ss.Thickness
    line1.Color = ss.Color
    line2.Color = ss.Color
    line3.Color = ss.Color
    line4.Color = ss.Color
    dot.Transparency = ss.Opacity
    dot.Color = ss.Color
    if ss.Dot then
        dot.Visible = true
        dot.Transparency = ss.Opacity
        dot.Color = ss.Color
    else
        dot.Visible = false
    end
    if ss.RainbowColor then
        line1.Color = Color3.fromHSV(tick()%5/5,1,1)
        line2.Color = Color3.fromHSV(tick()%5/5,1,1)
        line3.Color = Color3.fromHSV(tick()%5/5,1,1)
        line4.Color = Color3.fromHSV(tick()%5/5,1,1)
    end
    
    line1.From = Vector2.new(middle.X,middle.Y-ss.Offset)
    line2.From = Vector2.new(middle.X+ss.Offset,middle.Y)
    line3.From = Vector2.new(middle.X,middle.Y+ss.Offset)
    line4.From = Vector2.new(middle.X-ss.Offset,middle.Y)
    line1.To = Vector2.new(middle.X,middle.Y-ss.Offset-ss.Length)
    line2.To = Vector2.new(middle.X+ss.Offset+ss.Length,middle.Y)
    line3.To = Vector2.new(middle.X,middle.Y+ss.Offset+ss.Length)
    line4.To = Vector2.new(middle.X-ss.Offset-ss.Length,middle.Y)
    
    if ss.Dot then
        dot.Size = Vector2.new(ss.Thickness,ss.Thickness)
        dot.Position = Vector2.new(middle.X-(ss.Thickness/2),middle.Y-(ss.Thickness/2))
    end
    if ss.HideGameCrosshair then
        pcall(function()
            if game.PlaceId == 286090429 or game.PlaceId == 301549746 then -- Arsenal + Counter Blox
                player.PlayerGui.GUI.Crosshairs.Crosshair.LeftFrame.Visible = false
                player.PlayerGui.GUI.Crosshairs.Crosshair.RightFrame.Visible = false
                player.PlayerGui.GUI.Crosshairs.Crosshair.TopFrame.Visible = false
                player.PlayerGui.GUI.Crosshairs.Crosshair.BottomFrame.Visible = false
                player.PlayerGui.GUI.Crosshairs.Crosshair.Dot.Visible = false
            elseif game.PlaceId == 4292776423 then -- Unit: Classified
                player.PlayerGui.GUI.Crosshair.L.Visible = false
                player.PlayerGui.GUI.Crosshair.R.Visible = false
                player.PlayerGui.GUI.Crosshair.U.Visible = false
                player.PlayerGui.GUI.Crosshair.D.Visible = false
            elseif game.PlaceId == 292439477 or game.PlaceId == 299659045 then -- Phantom Forces + test place
                player.PlayerGui.MainGui.GameGui.CrossHud.Visible = false
            elseif game.PlaceId == 4716045691 then -- Polybattle
                player.PlayerGui.ScreenGui.Center.ScaleYY.Middle.MouseIcon.Crosshair.Visible = false
            elseif game.PlaceId == 3233893879 then -- Bad Business
                player.PlayerGui.MainGui.Reticle.Visible = false
            elseif game.PlaceId == 2377868063 then -- Strucid, doesnt even work xd
                player.PlayerGui.MainGui.CrossHairs.Visible = false
                player.PlayerGui.MainGui.AlternateCrosshair.Visible = false
                player.PlayerGui.MainGui.ShotgunCrossHairs.Visible = false
            elseif game.PlaceId == 2555870920 then -- AceOfSpadez
                player.PlayerGui.Core.Gameplay.Cursor.Aim.Visible = false
            elseif game.PlaceId == 4651779470 then -- RECOIL
                player.PlayerGui.WHUD.Crosshair.Visible = false
            elseif game.PlaceId == 606849621 then -- Jailbreak
                player.PlayerGui.CrossHairGui.CrossHair.Visible = false
            elseif game.PlaceId == 2916899287 then -- Blackhawk Rescue Mission 5
                player.PlayerGui.Screen["#main"]["#hud"]["#cursor"]["#left"].Visible = false
                player.PlayerGui.Screen["#main"]["#hud"]["#cursor"]["#right"].Visible = false
                player.PlayerGui.Screen["#main"]["#hud"]["#cursor"]["#top"].Visible = false
                player.PlayerGui.Screen["#main"]["#hud"]["#cursor"]["#bottom"].Visible = false
            elseif game.PlaceId == 443406476 then -- Project Lazarus
                player.PlayerGui.HUD.Reticle.Visible = false
            elseif game.PlaceId == 1224212277 then -- Mad City
                player.PlayerGui.CrosshairGUI.Crosshair.Visible = false
            elseif game.PlaceId == 3527629287 then -- Big Paintball
                player.PlayerGui.Crosshair.Frame.Visible = false
            elseif game.Placeid == 388599755 then -- POLYGUNS
                for i,v in pairs(player.PlayerGui.ScreenGui.Reticle:GetChildren()) do
                    v.Visible = false
                end
            end
        end)
    end
end)
