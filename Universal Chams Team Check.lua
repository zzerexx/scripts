-- Universal Chams w/ Team Check
-- Made by zzerexx#3970

for i,v in pairs(game.CoreGui:GetChildren()) do
   if v.Name == "Chams" and v.ClassName == "ScreenGui" then
       v:Destroy()
    end
end
for i,v in pairs(game.Workspace:GetDescendants()) do
    local chams = Instance.new("ScreenGui")
    chams.Parent = game.CoreGui
    chams.Name = "Chams"
    if v.ClassName == "Humanoid" then
        if v.RigType == Enum.HumanoidRigType.R15 then
            -- R15
            local plr = game.Workspace[v.Parent.Name]
            local r = game.Players[v.Parent.Name].TeamColor.r
            local g = game.Players[v.Parent.Name].TeamColor.g
            local b = game.Players[v.Parent.Name].TeamColor.b
            local teamcolor = Color3.new(r, g, b)
            local rfoot = Instance.new("BoxHandleAdornment") -- Right Foot
            local rlowerleg = Instance.new("BoxHandleAdornment") -- Right Lower Leg
            local rupperleg = Instance.new("BoxHandleAdornment") -- Right Upper Leg
            local rlowerarm = Instance.new("BoxHandleAdornment") -- Right Lower Arm
            local rupperarm = Instance.new("BoxHandleAdornment") -- Right Upper Arm
            local rhand = Instance.new("BoxHandleAdornment") -- Right Hand

            local lfoot = Instance.new("BoxHandleAdornment") -- Left Foot
            local llowerleg = Instance.new("BoxHandleAdornment") -- Left Lower Leg
            local lupperleg = Instance.new("BoxHandleAdornment") -- Left Upper Leg
            local llowerarm = Instance.new("BoxHandleAdornment") -- Left Lower Arm
            local lupperarm = Instance.new("BoxHandleAdornment") -- Left Upper Arm
            local lhand = Instance.new("BoxHandleAdornment") -- Left Hand

            local lowertorso = Instance.new("BoxHandleAdornment") -- Lower Torso
            local uppertorso = Instance.new("BoxHandleAdornment") -- Upper Torso
            local head = Instance.new("BoxHandleAdornment") -- Head

            rfoot.Parent = chams
            rfoot.AlwaysOnTop = true
            rfoot.Color3 = teamcolor
            rfoot.Size = plr.RightFoot.Size
            rfoot.Transparency = 0.5
            rfoot.Adornee = plr.RightFoot
            rfoot.ZIndex = 0

            rlowerleg.Parent = chams
            rlowerleg.AlwaysOnTop = true
            rlowerleg.Color3 = teamcolor
            rlowerleg.Size = plr.RightLowerLeg.Size
            rlowerleg.Transparency = 0.5
            rlowerleg.Adornee = plr.RightLowerLeg
            rlowerleg.ZIndex = 0

            rupperleg.Parent = chams
            rupperleg.AlwaysOnTop = true
            rupperleg.Color3 = teamcolor
            rupperleg.Size = plr.RightUpperLeg.Size
            rupperleg.Transparency = 0.5
            rupperleg.Adornee = plr.RightUpperLeg
            rupperleg.ZIndex = 0

            rlowerarm.Parent = chams
            rlowerarm.AlwaysOnTop = true
            rlowerarm.Color3 = teamcolor
            rlowerarm.Size = plr.RightLowerArm.Size
            rlowerarm.Transparency = 0.5
            rlowerarm.Adornee = plr.RightLowerArm
            rlowerarm.ZIndex = 0

            rupperarm.Parent = chams
            rupperarm.AlwaysOnTop = true
            rupperarm.Color3 = teamcolor
            rupperarm.Size = plr.RightUpperArm.Size
            rupperarm.Transparency = 0.5
            rupperarm.Adornee = plr.RightUpperArm
            rupperarm.ZIndex = 0

            rhand.Parent = chams
            rhand.AlwaysOnTop = true
            rhand.Color3 = teamcolor
            rhand.Size = plr.RightHand.Size
            rhand.Transparency = 0.5
            rhand.Adornee = plr.RightHand
            rhand.ZIndex = 0

            lfoot.Parent = chams
            lfoot.AlwaysOnTop = true
            lfoot.Color3 = teamcolor
            lfoot.Size = plr.LeftFoot.Size
            lfoot.Transparency = 0.5
            lfoot.Adornee = plr.LeftFoot
            lfoot.ZIndex = 0

            llowerleg.Parent = chams
            llowerleg.AlwaysOnTop = true
            llowerleg.Color3 = teamcolor
            llowerleg.Size = plr.LeftLowerLeg.Size
            llowerleg.Transparency = 0.5
            llowerleg.Adornee = plr.LeftLowerLeg
            llowerleg.ZIndex = 0

            lupperleg.Parent = chams
            lupperleg.AlwaysOnTop = true
            lupperleg.Color3 = teamcolor
            lupperleg.Size = plr.LeftUpperLeg.Size
            lupperleg.Transparency = 0.5
            lupperleg.Adornee = plr.LeftUpperLeg
            lupperleg.ZIndex = 0

            llowerarm.Parent = chams
            llowerarm.AlwaysOnTop = true
            llowerarm.Color3 = teamcolor
            llowerarm.Size = plr.LeftLowerArm.Size
            llowerarm.Transparency = 0.5
            llowerarm.Adornee = plr.LeftLowerArm
            llowerarm.ZIndex = 0

            lupperarm.Parent = chams
            lupperarm.AlwaysOnTop = true
            lupperarm.Color3 = teamcolor
            lupperarm.Size = plr.LeftUpperArm.Size
            lupperarm.Transparency = 0.5
            lupperarm.Adornee = plr.LeftUpperArm
            lupperarm.ZIndex = 0

            lhand.Parent = chams
            lhand.AlwaysOnTop = true
            lhand.Color3 = teamcolor
            lhand.Size = plr.LeftHand.Size
            lhand.Transparency = 0.5
            lhand.Adornee = plr.LeftHand
            lhand.ZIndex = 0

            lowertorso.Parent = chams
            lowertorso.AlwaysOnTop = true
            lowertorso.Transparency = 0.5
                
            uppertorso.Parent = chams
            uppertorso.AlwaysOnTop = true
            uppertorso.Color3 = teamcolor
            uppertorso.Size = plr.UpperTorso.Size
            uppertorso.Transparency = 0.5
            uppertorso.Adornee = plr.UpperTorso
            uppertorso.ZIndex = 0

            head.Parent = chams
            head.AlwaysOnTop = true
            head.Color3 = teamcolor
            head.Size = Vector3.new(1, 1, 1)
            head.Transparency = 0.5
            head.Adornee = plr.Head
            head.ZIndex = 0
        else
            -- R6
            local r = game.Players[v.Parent.Name].TeamColor.r
            local g = game.Players[v.Parent.Name].TeamColor.g
            local b = game.Players[v.Parent.Name].TeamColor.b
            local teamcolor = Color3.new(r, g, b)
            local plr = game.Workspace[v.Parent.Name]
            local head = Instance.new("BoxHandleAdornment") -- Head
            local torso = Instance.new("BoxHandleAdornment") -- Torso
            local larm = Instance.new("BoxHandleAdornment") -- Left Arm
            local rarm = Instance.new("BoxHandleAdornment") -- Right Arm
            local lleg = Instance.new("BoxHandleAdornment") -- Left Leg
            local rleg = Instance.new("BoxHandleAdornment") -- Right Leg
            
            head.Parent = chams
            head.AlwaysOnTop = true
            head.Color3 = teamcolor
            head.Size = Vector3.new(1, 1, 1)
            head.Transparency = 0.5
            head.Adornee = plr.Head
            head.ZIndex = 0
            
            torso.Parent = chams
            torso.AlwaysOnTop = true
            torso.Color3 = teamcolor
            torso.Size = plr.Torso.Size
            torso.Transparency = 0.5
            torso.Adornee = plr.Torso
            torso.ZIndex = 0
            
            larm.Parent = chams
            larm.AlwaysOnTop = true
            larm.Color3 = teamcolor
            larm.Size = plr["Left Arm"].Size
            larm.Transparency = 0.5
            larm.Adornee = plr["Left Arm"]
            larm.ZIndex = 0
            
            rarm.Parent = chams
            rarm.AlwaysOnTop = true
            rarm.Color3 = teamcolor
            rarm.Size = plr["Right Arm"].Size
            rarm.Transparency = 0.5
            rarm.Adornee = plr["Right Arm"]
            rarm.ZIndex = 0
            
            lleg.Parent = chams
            lleg.AlwaysOnTop = true
            lleg.Color3 = teamcolor
            lleg.Size = plr["Left Leg"].Size
            lleg.Transparency = 0.5
            lleg.Adornee = plr["Left Leg"]
            lleg.ZIndex = 0
            
            rleg.Parent = chams
            rleg.AlwaysOnTop = true
            rleg.Color3 = teamcolor
            rleg.Size = plr["Right Leg"].Size
            rleg.Transparency = 0.5
            rleg.Adornee = plr["Right Leg"]
            rleg.ZIndex = 0
        end
    end
end