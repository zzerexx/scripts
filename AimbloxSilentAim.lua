-- DO NOT USE!! YOU WILL GET BANNED!
if game.PlaceId ~= 6808489605 then
    return
end
local players = game:GetService("Players")
local player = players.LocalPlayer
function ClosestPlayer()
    local plr
    local closest = math.huge
    if player.Team == nil then
        for i,v in next, players:GetPlayers() do
            if v ~= player and v.Character and v.Character.Humanoid.Health > 0 then
                local mag = (player.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                if mag < closest then
                    closest = mag 
                    plr = v
                end
            end
        end
    else
        for i,v in next, players:GetPlayers() do
            if v ~= player and v.Team ~= player.Team and v.Character and v.Character.Humanoid.Health > 0 then
                local mag = (player.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                if mag < closest then
                    closest = mag 
                    plr = v
                end
            end
        end
    end
    return plr
end

local mt = getrawmetatable(game)
local oldmt = mt.__index 
local oldnc = mt.__namecall
setreadonly(mt,false)

mt.__namecall = newcclosure(function(self,...)
    local args, method = {...}, getnamecallmethod()
    if method == "FireServer" and args[1] == "ShootSound" then
        local plr = ClosestPlayer()
        game:GetService("ReplicatedStorage").Remotes.GunShot:FireServer(
            plr,
            workspace.CurrentCamera:FindFirstChildOfClass("Model").Name,
            require(game:GetService("ReplicatedFirst"):WaitForChild("Shared"):WaitForChild("RemoteUtils")).PackVector(plr.Character.Head.Position),
            plr.Character.Head,
            "Default"
        )
        return oldnc(self,unpack(args))
    end
    return oldnc(self,...)
end)
setreadonly(mt,true)
