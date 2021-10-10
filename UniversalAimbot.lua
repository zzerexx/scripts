if not getgenv().AimbotSettings then
	getgenv().AimbotSettings = {
		Aimbot = {
            Enabled = true,
			TargetPart = "Head",
			VisibleCheck = true,
			Use_mousemoverel = true,
			Strength = 100, -- 1% - 200%
			TeamCheck = true, -- Press ] to toggle
			Keybind = Enum.UserInputType.MouseButton2, -- Must be a UserInputType or KeyCode
			AimType = "Hold", -- "Hold" or "Toggle"
			AlwaysActive = false,
            ToggleKey = Enum.KeyCode.RightShift,
			MaximumDistance = 300, -- Set this to something lower if you dont wannalock on some random person across the map
		},
		FovCircle = {
			Enabled = true,
			Dynamic = true,
			Radius = 100,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			NumSides = 64,
		},
		Whitelisted = {}, -- Username or User ID
		WhitelistFriends = true, -- Automatically adds friends to the whitelist
		Ignore = nil -- Raycast Ignore
	}
end

if game.GameId == (111958650 or 115797356 or 147332621) then -- arsenal, counter blox, typical colors 2
	getgenv().AimbotSettings.Ignore = workspace.Ray_Ignore
elseif game.GameId == 833423526 then -- strucid
	getgenv().AimbotSettings.Ignore = workspace.IgnoreThese
elseif game.GameId == 1168263273 then -- bad business
	do end
elseif workspace:FindFirstChild("Ignore") then
	getgenv().AimbotSettings.Ignore = workspace.Ignore
end

if typeof(getgenv().AIMBOT_FOV) == ("userdata" or "table") then
	getgenv().AIMBOT_FOV:Remove()
	getgenv().AIMBOT_FOV = nil
end
if typeof(getgenv().AIMBOT_RS) == "RBXScriptConnection" then
	getgenv().AIMBOT_RS:Disconnect()
	getgenv().AIMBOT_RS = nil
end

local players = game:GetService("Players")
local player = players.LocalPlayer
local camera = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local mouse = UIS:GetMouseLocation()
local ss = getgenv().AimbotSettings
local bodyparts = {
	"Head","UpperTorso","LowerTorso","LeftUpperArm","LeftLowerArm","LeftHand","RightUpperArm","RightLowerArm","RightHand","LeftUpperLeg","LeftLowerLeg","LeftFoot","RightUpperLeg","RightLowerLeg","RightFoot",
	"Torso","Left Arm","Right Arm","Left Leg","Right Leg",
	"Chest","Hips","LeftArm","LeftForearm","RightArm","RightForearm","LeftLeg","LeftForeleg","RightLeg","RightForeleg"
}
local ads = false
local gids = { -- game ids
    ['arsenal'] = 111958650,
	['pf'] = 113491250,
	['pft'] = 115272207, -- pf test place
    ['pfu'] = 1256867479, -- pf unstable branch
	['bb'] = 1168263273,
}
for _,v in next, getgc(true) do
	if typeof(v) == "table" then
		if game.GameId == (gids.pf or gids.pft or gids.pfu) then
			if rawget(v,"getbodyparts") then
				getchar = rawget(v,"getbodyparts")
			elseif rawget(v,"getplayerhealth") then
				gethealth = rawget(v,"getplayerhealth")
			end
		elseif game.GameId == gids.bb then
			if rawget(v,"InitProjectile") and v.TS then
				ts = v.TS
			end
		end
	end
end

function IsAlive(plr)
	if plr and plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid") and plr.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
		return true
    elseif game.GameId == (gids.pf or gids.pft or gids.pfu) then
        if plr and plr ~= player and getchar(plr) ~= nil then
            return true
        end
    elseif game.GameId == gids.bb then
        if plr and plr ~= player and ts.Characters:GetCharacter(plr) ~= nil and ts.Characters:GetCharacter(plr):FindFirstChild("Health") and ts.Characters:GetCharacter(plr).Health.Value > 0 then
            return true
        end
	end
	return false
end
function GetChar(plr)
    if game.GameId == (gids.pf or gids.pft or gids.pfu) then
        return getchar(plr).torso.Parent
    elseif game.GameId == gids.bb then
        return ts.Characters:GetCharacter(plr).Body
    elseif plr.Character ~= nil then
        return plr.Character
    end
    return nil
end
function GetTeam(plr)
	if game.GameId == gids.bb then
		for _,v in next, game:GetService("Teams"):GetChildren() do
			if not v.Players:FindFirstChild(plr.Name) then
				return v.Name
			end
		end
	else
		return plr.Team
	end
	return nil
end
function ClosestPlayer()
	mouse = UIS:GetMouseLocation()
	local plr = nil
	local closest = math.huge
	for _,v in next, players:GetPlayers() do
		if v ~= player and IsAlive(v) then
			local vector, inViewport
			if game.GameId == gids.bb then
				vector, inViewport = camera:WorldToViewportPoint(GetChar(v).Parent.Root.Position)
			elseif game.GameId == (gids.pf or gids.pft or gids.pfu) then
				vector, inViewport = camera:WorldToViewportPoint(GetChar(v).Torso.Position)
			else
				vector, inViewport = camera:WorldToViewportPoint(GetChar(v).HumanoidRootPart.Position)
			end
			if inViewport then
				local mag = (Vector2.new(mouse.X,mouse.Y) - Vector2.new(vector.X,vector.Y)).Magnitude
				if mag < closest and ((GetTeam(player) ~= nil and GetTeam(v) ~= GetTeam(player)) or not ss.Aimbot.TeamCheck) then
					plr = v
					closest = mag
				end
			end
		end
	end
	return plr
end
function IsVisible(plr)
	if ss.Aimbot.VisibleCheck and IsAlive(plr) and GetChar(plr):FindFirstChild(ss.Aimbot.TargetPart) then
		local params = RaycastParams.new()
		params.FilterDescendantsInstances = {camera,GetChar(player)}
		params.FilterType = Enum.RaycastFilterType.Blacklist
		params.IgnoreWater = true
		if ss.Ignore ~= nil and typeof(ss.Ignore) == "Instance" then
			params.FilterDescendantsInstances = {camera,GetChar(player),ss.Ignore}
		end
		local result = workspace:Raycast(camera.CFrame.Position,(GetChar(plr)[ss.Aimbot.TargetPart].Position - camera.CFrame.Position).Unit * 500,params)
		if result and result.Instance:IsDescendantOf(GetChar(plr)) then
			return true
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
		local _, inViewport = camera:WorldToViewportPoint(GetChar(plr)[ss.Aimbot.TargetPart].Position)
		if ss.FovCircle.Enabled and inViewport then
			for _,v in next, GetChar(plr):GetChildren() do
				if table.find(bodyparts,v.Name) then
					local vector2, inViewport2 = camera:WorldToViewportPoint(v.Position)
					if inViewport2 and (Vector2.new(mouse.X,mouse.Y) - Vector2.new(vector2.X,vector2.Y)).Magnitude <= (fov.Radius or ss.FovCircle.Radius) then
						return true
					end
				end
			end
		elseif not ss.FovCircle.Enabled and IsAlive(plr) then
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
	if i.UserInputType == ss.Aimbot.Keybind or i.KeyCode == ss.Aimbot.Keybind then
		if ss.Aimbot.AimType == "Toggle" then
			ads = not ads
		else
			ads = true
		end
    elseif i.KeyCode == ss.Aimbot.ToggleKey then
        ss.Aimbot.Enabled = not ss.Aimbot.Enabled
	end
end)
UIS.InputEnded:Connect(function(i,gp)
	if gp then
		return
	end
	if (i.UserInputType == ss.Aimbot.Keybind or i.KeyCode == ss.Aimbot.Keybind) and ss.Aimbot.AimType == "Hold" then
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
	ss = getgenv().AimbotSettings
	mouse = UIS:GetMouseLocation()
	if game.GameId == (gids.pf or gids.pft or gids.pfu or gids.bb) then
		ss.Aimbot.VisibleCheck = false
	end
	if ss.FovCircle.Enabled then
		fov.Position = mouse
		fov.NumSides = ss.FovCircle.NumSides
		fov.Radius = ss.FovCircle.Radius
		fov.Transparency = ss.FovCircle.Transparency
		fov.Color = ss.FovCircle.Color
		if ss.FovCircle.Dynamic then
			fov.Radius = ss.FovCircle.Radius / (camera.FieldOfView / 100)
		end
	else
		fov.Transparency = 0
	end
	local plr = ClosestPlayer()
	if ss.Aimbot.Enabled and (ads or ss.Aimbot.AlwaysActive) and plr ~= nil then
		if plr ~= nil then
			if IsVisible(plr) and InFov(plr) and not IsWhitelisted(plr) and GetChar(plr):FindFirstChild(ss.Aimbot.TargetPart) and (camera.CFrame.Position - GetChar(plr):FindFirstChild(ss.Aimbot.TargetPart).Position).Magnitude <= ss.Aimbot.MaximumDistance then
				print("Active")
				if ss.Aimbot.Use_mousemoverel then
					local vector = camera:WorldToViewportPoint(GetChar(plr)[ss.Aimbot.TargetPart].Position)
					ss.Aimbot.Strength = math.clamp(ss.Aimbot.Strength,1,200)
					if game.GameId == (gids.pf or gids.pft or gids.pfu) then
						ss.Aimbot.Strength = math.clamp(ss.Aimbot.Strength,1,65)
					end
					mousemoverel((vector.X - mouse.X) * (ss.Aimbot.Strength / 100),(vector.Y - mouse.Y) * (ss.Aimbot.Strength / 100))
				else
					camera.CFrame = CFrame.new(camera.CFrame.Position,GetChar(plr)[ss.Aimbot.TargetPart].Position)
				end
			end
		end
	end
end)

players.PlayerAdded:Connect(function(plr)
	if ss.WhitelistFriends and player:IsFriendsWith(plr.UserId) then
		table.insert(ss.Whitelisted,plr.UserId)
	end
end)

local aimbot = {}

function ValidType(type)
	if type == "Other" or getgenv().AimbotSettings[type] ~= nil then
		return true
	end
	return false
end
function ValidOption(type,option)
	if type == "Other" or getgenv().AimbotSettings[type][option] ~= nil then
		return true
	end
	return false
end
function aimbot:Toggle(type)
	assert(ValidType(type),"Universal Aimbot: bad argument to #1 'Toggle' (Invalid Type)")
	if type == ("Whitelisted" or "Ignore") then
		getgenv().AimbotSettings[type] = not getgenv().AimbotSettings[type]
	else
		getgenv().AimbotSettings[type].Enabled = not getgenv().AimbotSettings[type].Enabled
	end
end
function aimbot:Get(type,option)
	assert(ValidType(type),"Universal Aimbot: bad argument to #1 'Get' (Invalid Type)")
	assert(ValidOption(type,option),"Universal Aimbot: bad argument to #2 'Get' (Invalid Option)")
	if type == "Other" then
		return getgenv().AimbotSettings[option]
	end
	return getgenv().AimbotSettings[type][option]
end
function aimbot:Set(type,option,value)
	assert(ValidType(type),"Universal Aimbot: bad argument to #1 'Set' (Invalid Type)")
	assert(ValidOption(type,option),"Universal Aimbot: bad argument to #2 'Set' (Invalid Option)")
	assert(value ~= nil,"Universal Aimbot: bad argument to #3 'Set'")
	if type == "Other" then
		getgenv().AimbotSettings[option] = value
	else
		getgenv().AimbotSettings[type][option] = value
	end
end

return aimbot
