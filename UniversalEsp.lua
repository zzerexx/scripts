-- Universal Esp by zzerexx#3970
if typeof(Drawing.new) ~= "function" then
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "Universal Esp",
        Text = "Your exploit does not have a Drawing Library",
        Duration = 10
    })
    return
end
if typeof(getgenv().UNIVERSALESP_OBJECTS) == "table" then
    for i,v in next, getgenv().UNIVERSALESP_OBJECTS do
        v.Object:Remove()
        table.remove(getgenv().UNIVERSALESP_OBJECTS,i)
    end
end
if typeof(getgenv().UNIVERSALESP_RS) == "RBXScriptConnection" then
    getgenv().UNIVERSALESP_RS:Disconnect()
end

local players = game:GetService("Players")
local player = players.LocalPlayer
local camera = workspace.CurrentCamera
local mouse = game:GetService("UserInputService"):GetMouseLocation()
local RunService = game:GetService("RunService")
local ss = getgenv().EspSettings
getgenv().UNIVERSALESP_OBJECTS = {}
getgenv().UNIVERSALESP_VISIBLE = true

function Box(plr)
    ss = getgenv().EspSettings
    local box = Drawing.new("Square")
    box.Visible = true
    box.Transparency = ss.Boxes.Transparency
    box.Color = ss.Boxes.Color
    box.Thickness = 1
    box.Filled = false
    table.insert(getgenv().UNIVERSALESP_OBJECTS,{Object = box,Type = "Box",Player = plr})
end

function Tracer(plr)
    ss = getgenv().EspSettings
    local tracer = Drawing.new("Line")
    tracer.Visible = true
    tracer.Transparency = ss.Tracers.Transparency
    tracer.Color = ss.Tracers.Color
    tracer.Thickness = ss.Tracers.Thickness
    table.insert(getgenv().UNIVERSALESP_OBJECTS,{Object = tracer,Type = "Tracer",Player = plr})
end

function Name(plr)
    ss = getgenv().EspSettings
    local name = Drawing.new("Text")
    name.Visible = true
    name.Transparency = ss.Names.Transparency
    name.Color = ss.Names.Color
    name.Text = plr.Name
    name.Size = ss.Names.Size
    name.Center = true
    name.Outline = ss.Names.Outline
    name.OutlineColor = ss.Names.OutlineColor
    name.Font = ss.Names.Font
    table.insert(getgenv().UNIVERSALESP_OBJECTS,{Object = name,Type = "Name",Player = plr})
end

getgenv().UNIVERSALESP_RS = RunService.RenderStepped:Connect(function()
    for i,v in next, getgenv().UNIVERSALESP_OBJECTS do
        ss = getgenv().EspSettings
        local plr = v.Player
        if v.Type == "Box" then
            local box = v.Object
            if getgenv().UNIVERSALESP_VISIBLE and ss.Boxes.Enabled and plr and plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid") and plr.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
                local vector, inViewport = camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                
                local root = plr.Character.HumanoidRootPart
                local head = plr.Character.Head
                local rootpos = camera:WorldToViewportPoint(root.Position)
                local headpos = camera:WorldToViewportPoint(head.Position + Vector3.new(0,0.5,0))
                local legpos = camera:WorldToViewportPoint(root.Position - Vector3.new(0,3,0))

                if inViewport then
                    box.Transparency = ss.Boxes.Transparency
                    box.Size = Vector2.new(1000 / rootpos.Z, headpos.Y - legpos.Y)
                    box.Position = Vector2.new(rootpos.X - box.Size.X / 2, rootpos.Y - (box.Size.Y / 2))

                    if ss.TeamCheck and plr.Team == player.Team then
                        box.Visible = false
                    else
                        box.Visible = true
                    end
                else
                    box.Visible = false
                end
                if ss.Boxes.UseTeamColor then
                    box.Color = plr.TeamColor.Color
                else
                    box.Color = ss.Boxes.Color
                end
            else
                box.Visible = false
            end
        elseif v.Type == "Tracer" then
            local tracer = v.Object
            if getgenv().UNIVERSALESP_VISIBLE and ss.Tracers.Enabled and plr and plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid") and plr.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
                local vector, inViewport = camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                
                local top = Vector2.new(camera.ViewportSize.X / 2, 0)
                local center = Vector2.new(camera.ViewportSize.X / 2,camera.ViewportSize.Y / 2)
                local bottom = Vector2.new(camera.ViewportSize.X / 2,camera.ViewportSize.Y)
                mouse = game:GetService("UserInputService"):GetMouseLocation()
                local origin = top
                if ss.Tracers.Origin:lower() == "top" then
                    origin = top
                elseif ss.Tracers.Origin:lower() == "center" then
                    origin = center
                elseif ss.Tracers.Origin:lower() == "bottom" then
                    origin = bottom
                elseif ss.Tracers.Origin:lower() == "mouse" then
                    origin = mouse
                end
    
                if inViewport then
                    tracer.Transparency = ss.Tracers.Transparency
                    tracer.Thickness = ss.Tracers.Thickness
                    tracer.From = origin
                    tracer.To = Vector2.new(vector.X,vector.Y)
    
                    if ss.TeamCheck and plr.Team == player.Team then
                        tracer.Visible = false
                    else
                        tracer.Visible = true
                    end
                else
                    tracer.Visible = false
                end
                if ss.Tracers.UseTeamColor then
                    tracer.Color = plr.TeamColor.Color
                else
                    tracer.Color = ss.Tracers.Color
                end
            else
                tracer.Visible = false
            end
        elseif v.Type == "Name" then
            local name = v.Object
            if getgenv().UNIVERSALESP_VISIBLE and ss.Names.Enabled and plr and plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid") and plr.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
                local vector, inViewport = camera:WorldToViewportPoint(plr.Character.Head.Position)
                if inViewport then
                    name.Transparency = ss.Names.Transparency
                    name.Size = ss.Names.Size
                    name.Outline = ss.Names.Outline
                    name.OutlineColor = ss.Names.OutlineColor
                    name.Position = Vector2.new(vector.X,vector.Y-30)
                    name.Font = ss.Names.Font
                    if ss.TeamCheck and plr.Team == player.Team then
                        name.Visible = false
                    else
                        name.Visible = true
                    end
                    local mag = 0
                    if player.Character:FindFirstChild("HumanoidRootPart") then
                        mag = math.floor((player.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude)
                    end
                    local health = math.floor(plr.Character:FindFirstChildOfClass("Humanoid").Health)
                    local maxhealth = math.floor(plr.Character:FindFirstChildOfClass("Humanoid").MaxHealth)
                    local plrname = plr.Name
                    if ss.Names.UseDisplayName then
                        plrname = plr.DisplayName
                    end
                    if ss.Names.ShowDistance and ss.Names.ShowHealth then
                        name.Text = plrname.." [ "..mag.." ] [ "..health.."/"..maxhealth.." ]"
                    elseif ss.Names.ShowDistance then
                        name.Text = plrname.." [ "..mag.." ]"
                    elseif ss.Names.ShowHealth then
                        name.Text = plrname.." [ "..health.."/"..maxhealth.." ]"
                    else
                        name.Text = plrname
                    end
                else
                    name.Visible = false
                end
                if ss.Names.UseTeamColor then
                    name.Color = plr.TeamColor.Color
                else
                    name.Color = ss.Names.Color
                end
            else
                name.Visible = false
            end
        end
    end
end)
game:GetService("UserInputService").InputBegan:Connect(function(i,gp)
    if not gp and i.KeyCode == ss.ToggleKey then
        getgenv().UNIVERSALESP_VISIBLE = not getgenv().UNIVERSALESP_VISIBLE
    end
end)
for i,v in next, players:GetPlayers() do
    Box(v)
    Tracer(v)
    Name(v)
end
players.PlayerAdded:Connect(function(v)
    Box(v)
    Tracer(v)
    Name(v)
end)
players.PlayerRemoving:Connect(function(plr)
    for i,v in next, getgenv().UNIVERSALESP_OBJECTS do
        if v.Player == plr then
            v.Object:Remove()
            table.remove(getgenv().UNIVERSALESP_OBJECTS,i)
        end
    end
end)
