-- Universal Esp by zzerexx#3970
if getgenv().EspSettings and getgenv().EspSettings.AntiDetection then
	for i,v in next, getconnections(game:GetService("ScriptContext").Error) do
		v:Disable()
	end
	for i,v in next, getconnections(game.DescendantAdded) do -- for the ui version
		v:Disable()
	end
	hookfunction((gcinfo or collectgarbage),function(...)
		return math.random(150,300)
	end)
end
if typeof(Drawing.new) ~= "function" then
    game:GetService("Players").LocalPlayer:Kick("\n\nUniversal Esp\nYour exploit does not have a Drawing Library!\n")
    return
end
if typeof(getgenv().UNIVERSALESP_OBJECTS) == "table" then
    for i,v in next, getgenv().UNIVERSALESP_OBJECTS do
        if typeof(v.Object) == "table" then
            for i2,v2 in next, v.Object do
                v2:Remove()
            end
        else
            v:Remove()
        end
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
    box.Visible = false
    box.Transparency = ss.Boxes.Transparency
    box.Color = ss.Boxes.Color
    box.Thickness = 1
    box.Filled = false
    table.insert(getgenv().UNIVERSALESP_OBJECTS,{Object = box,Type = "Box",Player = plr})
end

function Tracer(plr)
    ss = getgenv().EspSettings
    local tracer = Drawing.new("Line")
    tracer.Visible = false
    tracer.Transparency = ss.Tracers.Transparency
    tracer.Color = ss.Tracers.Color
    tracer.Thickness = ss.Tracers.Thickness
    table.insert(getgenv().UNIVERSALESP_OBJECTS,{Object = tracer,Type = "Tracer",Player = plr})
end

function Name(plr)
    ss = getgenv().EspSettings
    local name = Drawing.new("Text")
    name.Visible = false
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

function Skeleton(plr)
    ss = getgenv().EspSettings
    local objects = {
        UpperTorso = Drawing.new("Line"),
        LowerTorso = Drawing.new("Line"),
        LeftUpperArm = Drawing.new("Line"),
        LeftLowerArm = Drawing.new("Line"),
        LeftHand = Drawing.new("Line"),
        RightUpperArm = Drawing.new("Line"),
        RightLowerArm = Drawing.new("Line"),
        RightHand = Drawing.new("Line"),
        LeftUpperLeg = Drawing.new("Line"),
        LeftLowerLeg = Drawing.new("Line"),
        LeftFoot = Drawing.new("Line"),
        RightUpperLeg = Drawing.new("Line"),
        RightLowerLeg = Drawing.new("Line"),
        RightFoot = Drawing.new("Line")
    }
    for i,v in next, objects do
        v.Visible = false
        v.Transparency = ss.Skeletons.Transparency
        v.Color = ss.Skeletons.Color
        v.Thickness = ss.Skeletons.Thickness
    end
    table.insert(getgenv().UNIVERSALESP_OBJECTS,{Object = objects,Type = "Skeleton",Player = plr})
end

function LookTracer(plr)
	ss = getgenv().EspSettings
	local tracer = Drawing.new("Line")
	tracer.Visible = false
    tracer.Transparency = ss.LookTracers.Transparency
    tracer.Color = ss.LookTracers.Color
    tracer.Thickness = ss.LookTracers.Thickness
    table.insert(getgenv().UNIVERSALESP_OBJECTS,{Object = tracer,Type = "LookTracer",Player = plr})
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
        elseif v.Type == "Skeleton" then
            local skeleton = v.Object
            if getgenv().UNIVERSALESP_VISIBLE and ss.Skeletons.Enabled and plr and plr ~= player and plr.Character and plr.Character:FindFirstChild("UpperTorso") and plr.Character:FindFirstChild("LowerTorso") and plr.Character:FindFirstChild("LeftUpperArm") and plr.Character:FindFirstChild("LeftLowerArm") and plr.Character:FindFirstChild("LeftHand") and plr.Character:FindFirstChild("RightUpperArm") and plr.Character:FindFirstChild("RightLowerArm") and plr.Character:FindFirstChild("RightHand") and plr.Character:FindFirstChild("LeftUpperLeg") and plr.Character:FindFirstChild("LeftLowerLeg") and plr.Character:FindFirstChild("LeftFoot") and plr.Character:FindFirstChild("RightUpperLeg") and plr.Character:FindFirstChild("RightLowerLeg") and plr.Character:FindFirstChild("RightFoot") and plr.Character:FindFirstChildOfClass("Humanoid") and plr.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
                local vector, inViewport = camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                if inViewport then
                    for i2,v2 in next, skeleton do
                        v2.Visible = true
                        v2.Transparency = ss.Skeletons.Transparency
                        v2.Color = ss.Skeletons.Color
                        v2.Thickness = ss.Skeletons.Thickness
                        if ss.TeamCheck and plr.Team == player.Team then
                            v2.Visible = false
                        end
                    end
                    local head = camera:WorldToViewportPoint(plr.Character.Head.Position) -- bruh
                    local utorso = camera:WorldToViewportPoint(plr.Character.UpperTorso.Position)
                    local ltorso = camera:WorldToViewportPoint(plr.Character.LowerTorso.Position)
                    local luarm = camera:WorldToViewportPoint(plr.Character.LeftUpperArm.Position)
                    local llarm = camera:WorldToViewportPoint(plr.Character.LeftLowerArm.Position)
                    local lhand = camera:WorldToViewportPoint(plr.Character.LeftHand.Position)
                    local ruarm = camera:WorldToViewportPoint(plr.Character.RightUpperArm.Position)
                    local rlarm = camera:WorldToViewportPoint(plr.Character.RightLowerArm.Position)
                    local rhand = camera:WorldToViewportPoint(plr.Character.RightHand.Position)
                    local luleg = camera:WorldToViewportPoint(plr.Character.LeftUpperLeg.Position)
                    local llleg = camera:WorldToViewportPoint(plr.Character.LeftLowerLeg.Position)
                    local lfoot = camera:WorldToViewportPoint(plr.Character.LeftFoot.Position)
                    local ruleg = camera:WorldToViewportPoint(plr.Character.RightUpperLeg.Position)
                    local rlleg = camera:WorldToViewportPoint(plr.Character.RightLowerLeg.Position)
                    local rfoot = camera:WorldToViewportPoint(plr.Character.RightFoot.Position)

                    v.Object.UpperTorso.From = Vector2.new(head.X,head.Y)
                    v.Object.UpperTorso.To = Vector2.new(utorso.X,utorso.Y)
                        
                    v.Object.LowerTorso.From = Vector2.new(utorso.X,utorso.Y)
                    v.Object.LowerTorso.To = Vector2.new(ltorso.X,ltorso.Y)

                    v.Object.LeftUpperArm.From = Vector2.new(utorso.X,utorso.Y)
                    v.Object.LeftUpperArm.To = Vector2.new(luarm.X,luarm.Y)

                    v.Object.LeftLowerArm.From = Vector2.new(luarm.X,luarm.Y)
                    v.Object.LeftLowerArm.To = Vector2.new(llarm.X,llarm.Y)

                    v.Object.LeftHand.From = Vector2.new(llarm.X,llarm.Y)
                    v.Object.LeftHand.To = Vector2.new(lhand.X,lhand.Y)

                    v.Object.RightUpperArm.From = Vector2.new(utorso.X,utorso.Y)
                    v.Object.RightUpperArm.To = Vector2.new(ruarm.X,ruarm.Y)

                    v.Object.RightLowerArm.From = Vector2.new(ruarm.X,ruarm.Y)
                    v.Object.RightLowerArm.To = Vector2.new(rlarm.X,rlarm.Y)

                    v.Object.RightHand.From = Vector2.new(rlarm.X,rlarm.Y)
                    v.Object.RightHand.To = Vector2.new(rhand.X,rhand.Y)

                    v.Object.LeftUpperLeg.From = Vector2.new(ltorso.X,ltorso.Y)
                    v.Object.LeftUpperLeg.To = Vector2.new(luleg.X,luleg.Y)

                    v.Object.LeftLowerLeg.From = Vector2.new(luleg.X,luleg.Y)
                    v.Object.LeftLowerLeg.To = Vector2.new(llleg.X,llleg.Y)

                    v.Object.LeftFoot.From = Vector2.new(llleg.X,llleg.Y)
                    v.Object.LeftFoot.To = Vector2.new(lfoot.X,lfoot.Y)

                    v.Object.RightUpperLeg.From = Vector2.new(ltorso.X,ltorso.Y)
                    v.Object.RightUpperLeg.To = Vector2.new(ruleg.X,ruleg.Y)

                    v.Object.RightLowerLeg.From = Vector2.new(ruleg.X,ruleg.Y)
                    v.Object.RightLowerLeg.To = Vector2.new(rlleg.X,rlleg.Y)

                    v.Object.RightFoot.From = Vector2.new(rlleg.X,rlleg.Y)
                    v.Object.RightFoot.To = Vector2.new(rfoot.X,rfoot.Y)
                else
                    for i2,v2 in next, skeleton do
                        v2.Visible = false
                    end
                end
                for i2,v2 in next, skeleton do
                    if ss.Skeletons.UseTeamColor then
                        v2.Color = plr.TeamColor.Color
                    else
                        v2.Color = ss.Skeletons.Color
                    end
                end
            else
                for i2,v2 in next, skeleton do
                    v2.Visible = false
                end
            end
        elseif v.Type == "LookTracer" then
            local tracer = v.Object
            if getgenv().UNIVERSALESP_VISIBLE and ss.LookTracers.Enabled and plr and plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChildOfClass("Humanoid") and plr.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
                local vector, inViewport = camera:WorldToViewportPoint(plr.Character.Head.Position)
                local ray = Ray.new(plr.Character.Head.Position,plr.Character.Head.CFrame.LookVector * 1000)
                local _, pos = workspace:FindPartOnRay(ray,plr.Character,true,ss.LookTracers.IgnoreWater)
                local vector2, inViewport2 = camera:WorldToViewportPoint(pos)
    
                if inViewport and inViewport2 then
                    tracer.Transparency = ss.LookTracers.Transparency
                    tracer.Thickness = ss.LookTracers.Thickness
                    tracer.From = Vector2.new(vector.X,vector.Y)
                    tracer.To = Vector2.new(vector2.X,vector2.Y)
    
                    if ss.TeamCheck and plr.Team == player.Team then
                        tracer.Visible = false
                    else
                        tracer.Visible = true
                    end
                else
                    tracer.Visible = false
                end
                if ss.LookTracers.UseTeamColor then
                    tracer.Color = plr.TeamColor.Color
                else
                    tracer.Color = ss.LookTracers.Color
                end
            else
                tracer.Visible = false
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
    Skeleton(v)
    LookTracer(v)
end
players.PlayerAdded:Connect(function(v)
    Box(v)
    Tracer(v)
    Name(v)
    Skeleton(v)
    LookTracer(v)
end)
players.PlayerRemoving:Connect(function(plr)
    for i,v in next, getgenv().UNIVERSALESP_OBJECTS do
        if v.Player == plr then
            if typeof(v.Object) == "table" then
                for i2,v2 in next, v.Object do
                    v2:Remove()
                end
            else
                v:Remove()
            end
            table.remove(getgenv().UNIVERSALESP_OBJECTS,i)
        end
    end
end)
