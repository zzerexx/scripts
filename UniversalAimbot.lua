if not getgenv().AimbotSettings then
	getgenv().AimbotSettings = {
		Aimbot = {
			TargetPart = "Head",
			VisibleCheck = true,
			Use_mousemoverel = true,
			TeamCheck = true, -- Press ] to toggle
			Keybind = Enum.UserInputType.MouseButton2, -- Must be a UserInputType or KeyCode
			AimType = "Hold", -- "Hold" or "Toggle"
			AlwaysActive = false,
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
		Ignore = nil -- Raycast Ignore
	}
end

if game.GameId == (111958650 or 115797356 or 147332621) then -- arsenal, counter blox, typical colors 2
	getgenv().AimbotSettings.Ignore = workspace.Ray_Ignore
elseif game.GameId == 833423526 then -- strucid
	getgenv().AimbotSettings.Ignore = workspace.IgnoreThese
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
				if mag < closest and ((player.Team ~= nil and v.Team ~= player.Team) or (ss.TeamCheck or player.Team == nil)) then
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
				if ss.Ignore ~= nil and typeof(ss.Ignore) == "Instance" then
					params.FilterDescendantsInstances = {camera,player.Character,ss.Ignore}
				end
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
		local _, inViewport = camera:WorldToViewportPoint(plr.Character[ss.Aimbot.TargetPart].Position)
		if ss.FovCircle.Enabled and inViewport then
			for i,v in next, plr.Character:GetChildren() do
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
	elseif i.KeyCode == Enum.KeyCode.RightBracket then
		ss.TeamCheck = not ss.TeamCheck
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
	if ads or ss.Aimbot.AlwaysActive then
		local plr = ClosestPlayer()
		if plr ~= nil then
			if IsVisible(plr) and InFov(plr) and not IsWhitelisted(plr) and plr.Character:FindFirstChild(ss.Aimbot.TargetPart) then
				if ss.Aimbot.Use_mousemoverel then
					local vector = camera:WorldToViewportPoint(plr.Character[ss.Aimbot.TargetPart].Position)
					mousemoverel(vector.X - mouse.X,vector.Y - mouse.Y)
				else
					camera.CFrame = CFrame.new(camera.CFrame.Position,plr.Character[ss.Aimbot.TargetPart].Position)
				end
			end
		end
	end
end)

local aimbot = {}

function ValidType(type)
	if getgenv().AimbotSettings[type] then
		return true
	end
	return false
end
function ValidOption(type,option)
	if getgenv().AimbotSettings[type][option] then
		return true
	end
	return false
end
function aimbot:Toggle(type)
	assert(ValidType(type),"Universal Aimbot: bad argument to #1 'Toggle' (Invalid Aimbot Type)")
	getgenv().AimbotSettings[type].Enabled = not getgenv().AimbotSettings[type].Enabled
end
function aimbot:Get(type,option)
	assert(ValidType(type),"Universal Aimbot: bad argument to #1 'Get' (Invalid Aimbot Type)")
	assert(ValidOption(type,option),"Universal Aimbot: bad argument to #2 'Get' (Invalid Option)")
	return getgenv().AimbotSettings[type][option]
end
function aimbot:Set(type,option,value)
	assert(ValidType(type),"Universal Aimbot: bad argument to #1 'Set' (Invalid Aimbot Type)")
	assert(ValidOption(type,option),"Universal Aimbot: bad argument to #2 'Set' (Invalid Option)")
	assert(value ~= nil,"Universal Aimbot: bad argument to #3 'Set'")
	getgenv().AimbotSettings[type][option] = value
end

return aimbot
