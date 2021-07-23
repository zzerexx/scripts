getgenv().AimbotSettings = {
    Aimbot = {
        TargetPart = "Head",
        VisibleCheck = true,
    },
    Fov = {
        Enabled = true,
        Dynamic = true,
        Radius = 100,
        Transparency = 1,
        Color = Color3.fromRGB(255,255,255),
        NumSides = 64,
    },
    Whitelisted = {} -- Username or User ID
}

local players = game:GetService("Players")
local player = players.LocalPlayer
local camera = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local mouse = UIS:GetMouseLocation()
local ss = getgenv().AimbotSettings
local bodyparts = {"Head","UpperTorso","LowerTorso","LeftUpperArm","LeftLowerArm","LeftHand","RightUpperArm","RightLowerArm","RightHand","LeftUpperLeg","LeftLowerLeg","LeftFoot","RightUpperLeg","RightLowerLeg","RightFoot","Torso","Left Arm","Right Arm","Left Leg","Right Leg"}
local ads = false

function IsAlive(plr)
    if plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") and plr.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
        return true
    end
    return false
end
function ClosestPlayer()
    mouse = UIS:GetMouseLocation()
    local plr = nil
    local closest = math.huge
    for i,v in next, players:GetPlayers() do
        if v ~= player and IsAlive(v) then
            local vector, inViewport = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
            if inViewport then
                local mag = (Vector2.new(mouse.X,mouse.Y) - Vector2.new(vector.X,vector.Y)).Magnitude
                if mag < closest and ((player.Team ~= nil and v.Team ~= player.Team) or player.Team == nil) then
                    plr = v
                    closest = mag
                end
            end
        end
    end
    return plr
end
function IsVisible(plr)
    if ss.Aimbot.VisibleCheck and IsAlive(plr) then
        for i,v in next, plr.Character:GetChildren() do
            if table.find(bodyparts,v.Name) then
                local params = RaycastParams.new()
                params.FilterDescendantsInstances = {camera,player.Character}
                params.FilterType = Enum.RaycastFilterType.Blacklist
                params.IgnoreWater = true
                local result = workspace:Raycast(camera.CFrame.Position,(v.Position - camera.CFrame.Position).Unit * 500,params)
                if result and result.Instance:FindFirstAncestor(plr.Name) then
                    return true
                end
            end
        end
    elseif not ss.Aimbot.VisibleCheck and IsAlive(plr) then
        return true
    end
    return false
end
local fov
function InFov(plr)
    mouse = UIS:GetMouseLocation()
    if IsAlive(plr) then
        local vector, inViewport = camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
        if ss.Fov.Enabled and inViewport then
            for i,v in next, plr.Character:GetChildren() do
                if table.find(bodyparts,v.Name) then
                    local vector2, inViewport2 = camera:WorldToViewportPoint(v.Position)
                    if inViewport2 and (Vector2.new(mouse.X,mouse.Y) - Vector2.new(vector2.X,vector2.Y)).Magnitude <= (fov.Radius or ss.Fov.Radius) then
                        return true
                    end
                end
            end
        elseif not ss.Fov.Enabled and inViewport then
            return true
        end
    end
    return false
end
function IsWhitelisted(plr)
    if table.find(ss.Whitelisted,(plr.Name or plr.UserId)) then
        return true
    end
    return false
end

UIS.InputBegan:Connect(function(i,gp)
    if gp then
        return
    end
    if i.UserInputType == Enum.UserInputType.MouseButton2 or i.KeyCode == Enum.KeyCode.Q then
        ads = true
    end
end)
UIS.InputEnded:Connect(function(i,gp)
    if gp then
        return
    end
    if i.UserInputType == Enum.UserInputType.MouseButton2 or i.KeyCode == Enum.KeyCode.Q then
        ads = false
    end
end)

fov = Drawing.new("Circle")
fov.Visible = true
fov.Transparency = 1
fov.Color = Color3.fromRGB(255,255,255)
fov.Thickness = 1
fov.NumSides = 64
fov.Radius = 100
fov.Filled = false
getgenv().AIMBOT_FOV = fov
getgenv().AIMBOT_RS = RunService.RenderStepped:Connect(function()
    if ss.Fov.Enabled then
        fov.Position = UIS:GetMouseLocation()
        fov.NumSides = ss.Fov.NumSides
        fov.Radius = ss.Fov.Radius
        fov.Transparency = ss.Fov.Transparency
        fov.Color = ss.Fov.Color
        if ss.Fov.Dynamic then
            fov.Radius = ss.Fov.Radius / (camera.FieldOfView / 100)
        end
    else
        fov.Transparency = 0
    end
    if ads then
        local plr = ClosestPlayer()
        if plr ~= nil then
            if (ss.Aimbot.VisibleCheck and IsVisible(plr)) and InFov(plr) then
                camera.CFrame = CFrame.new(camera.CFrame.Position,plr.Character[ss.Aimbot.TargetPart].Position)
            end
        end
    end
end)
