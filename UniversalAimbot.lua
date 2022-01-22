if not getgenv().AimbotSettings then
	getgenv().AimbotSettings = {
		TeamCheck = true, -- Press ] to toggle
		VisibleCheck = true,
		RefreshRate = 10, -- how fast the aimbot updates (milliseconds)
		Keybind = Enum.UserInputType.MouseButton2, -- Must be a UserInputType or KeyCode
		ToggleKey = Enum.KeyCode.RightShift,
		MaximumDistance = 300, -- Set this to something lower if you dont wanna lock on some random person across the map
		AlwaysActive = false,
		Aimbot = {
			Enabled = true,
			TargetPart = "Head",
			Use_mousemoverel = true,
			Strength = 100, -- 1% - 200%
			AimType = "Hold", -- "Hold" or "Toggle"
		},
		AimAssist = {
			Enabled = false,
			MinFov = 15,
			MaxFov = 80,
			DynamicFov = true,
			ShowFov = false, -- Shows Min & Max fov
			Strength = 55, -- 1% - 100%
			SlowSensitivity = true,
			SlowFactor = 1.75, -- 1% - 10%
			RequireMovement = true,
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

task.delay(5,function()
	local bind = Instance.new("BindableFunction")
	bind.OnInvoke = function(a)
		if a == "Get Script" then
			setclipboard("https://pastebin.com/raw/nwqE7v07")
		end
	end
	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = "Universal Aimbot",
		Text = "Script not working? Make sure you have the latest version!",
		Duration = 5,
		Button1 = "OK",
		Button2 = "Get Script",
		Callback = bind
	})
end)

local players = game:GetService("Players")
local player = players.LocalPlayer
local camera = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local mousemoverel = mousemoverel
local Drawingnew = Drawing.new 
local Fonts = Drawing.Fonts
local tableinsert = table.insert
local WorldToViewportPoint = camera.WorldToViewportPoint
local CFramenew = CFrame.new
local Vector2new = Vector2.new 
local Color3fromRGB = Color3.fromRGB
local mathclamp = math.clamp
local mathhuge = math.huge
local mouse = UIS:GetMouseLocation()
local osclock = os.clock
local GameId = game.GameId
local ss = getgenv().AimbotSettings
local Aimbot = ss.Aimbot
local AimAssist = ss.AimAssist
local FovCircle = ss.FovCircle

if game.GameId == (111958650 or 115797356 or 147332621) then -- arsenal, counter blox, typical colors 2
	ss.Ignore = {workspace.Ray_Ignore}
elseif game.GameId == 833423526 then -- strucid
	ss.Ignore = {workspace.IgnoreThese}
elseif game.GameId == 1168263273 then -- bad business
	do end
elseif game.GameId == 2162282815 then -- rush point
	ss.Ignore = {camera, player.Character, workspace.RaycastIgnore, workspace.DroppedWeapons, workspace.MapFolder.Map.Ramps, workspace.MapFolder.Map.Walls.MapWalls}
elseif workspace:FindFirstChild("Ignore") then
	ss.Ignore = {workspace.Ignore}
end

if UAIM then
	UAIM:Destroy()
end

local bodyparts = {
	"Head","UpperTorso","LowerTorso","LeftUpperArm","LeftLowerArm","LeftHand","RightUpperArm","RightLowerArm","RightHand","LeftUpperLeg","LeftLowerLeg","LeftFoot","RightUpperLeg","RightLowerLeg","RightFoot",
	"Torso","Left Arm","Right Arm","Left Leg","Right Leg",
	"Chest","Hips","LeftArm","LeftForearm","RightArm","RightForearm","LeftLeg","LeftForeleg","RightLeg","RightForeleg"
}
local ads = false
local olddelta = UIS.MouseDeltaSensitivity
local gids = { -- game ids
	['arsenal'] = 111958650,
	['pf'] = 113491250,
	['pft'] = 115272207, -- pf test place
	['pfu'] = 1256867479, -- pf unstable branch
	['bb'] = 1168263273,
}
local getchar, getvis, ts
if GameId == (gids.pf or gids.pft or gids.pfu) then
	for _,v in next, getgc(true) do
		if typeof(v) == "table" then
			if rawget(v, "getbodyparts") then
				getchar = rawget(v, "getbodyparts")
			elseif rawget(v, "getplayervisible") then
				getvis = rawget(v, "getplayervisible") -- it was that easy smh
			end
		end
	end
elseif GameId == gids.bb then
	for _,v in next, getgc(true) do
		if typeof(v) == "table" and rawget(v, "InitProjectile") and rawget(v, "TS") then
			ts = rawget(v, "TS")
		end
	end
end

function IsAlive(plr)
	if plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character:FindFirstChild("Humanoid").Health > 0 then
		return true
	elseif getchar then
		return getchar(plr) ~= nil
	elseif ts then
		return ts.Characters:GetCharacter(plr) ~= nil
	end
	return false
end
function GetChar(plr)
	if getchar then
		local a = getchar(plr)
		if a ~= nil then
			return a.torso.Parent
		end
	elseif ts then
		return ts.Characters:GetCharacter(plr).Body
	elseif plr.Character ~= nil then
		return plr.Character
	end
	return nil
end
function GetTeam(plr)
	if ts then
		return ts.Teams:GetPlayerTeam(plr)
	end
	return plr.Team
end
function ClosestPlayer()
	mouse = UIS:GetMouseLocation()
	local plr = nil
	local closest = mathhuge
	local myteam = GetTeam(player)
	for _,v in next, players:GetPlayers() do
		if v ~= player and IsAlive(v) then
			local cf = GetChar(v):GetPivot()
			local vector, inViewport = WorldToViewportPoint(camera, cf.Position)
			if inViewport then
				local mag = (Vector2new(mouse.X, mouse.Y) - Vector2new(vector.X, vector.Y)).Magnitude
				local team = GetTeam(v)
				if mag < closest and ((team ~= nil and team ~= myteam) or team == nil or not ss.TeamCheck) then
					plr = v
					closest = mag
				end
			end
		end
	end
	return plr
end
function IsVisible(plr)
	local char = GetChar(plr)
	if ss.VisibleCheck and IsAlive(plr) and char:FindFirstChild(Aimbot.TargetPart) then
		if getvis then
			return getvis(player,plr)
		else
			local mychar = GetChar(player)
			local ignore = {camera, mychar}
			for _,v in next, ss.Ignore do
				tableinsert(ignore, v)
			end
			local params = RaycastParams.new()
			params.FilterDescendantsInstances = ignore
			params.FilterType = Enum.RaycastFilterType.Blacklist
			params.IgnoreWater = true
			local result = workspace:Raycast(camera.CFrame.Position, (char[Aimbot.TargetPart].Position - camera.CFrame.Position).Unit * 500,params)
			if result and result.Instance:IsDescendantOf(char) then
				return true
			end
		end
	elseif not ss.VisibleCheck and IsAlive(plr) then
		return true
	end
	return false
end
local fov
function InFov(plr,Fov)
	mouse = UIS:GetMouseLocation()
	if IsAlive(plr) then
		local char = GetChar(plr)
		local _, inViewport = WorldToViewportPoint(camera, char[Aimbot.TargetPart].Position)
		if (FovCircle.Enabled or AimAssist.Enabled) and inViewport then
			for _,v in next, char:GetChildren() do
				if table.find(bodyparts, v.Name) and v.ClassName:find("Part") then
					local vector2, inViewport2 = WorldToViewportPoint(camera, v.Position)
					if inViewport2 and (Vector2new(mouse.X, mouse.Y) - Vector2new(vector2.X, vector2.Y)).Magnitude <= (Fov or fov.Radius or FovCircle.Radius) then
						return true
					end
				end
			end
		elseif not FovCircle.Enabled and IsAlive(plr) then
			return true
		end
	end
	return false
end
function IsWhitelisted(plr)
	if table.find(ss.Whitelisted, (plr.Name or plr.UserId)) then
		return true
	end
	return false
end

local conn1 = UIS.InputBegan:Connect(function(i,gp)
	if gp then
		return
	end
	if i.UserInputType == ss.Keybind or i.KeyCode == ss.Keybind then
		if Aimbot.AimType == "Toggle" then
			ads = not ads
		else
			ads = true
		end
	elseif i.KeyCode == ss.ToggleKey then
		Aimbot.Enabled = not Aimbot.Enabled
		fov.Visible = Aimbot.Enabled
		AimAssist.Enabled = not AimAssist.Enabled
	end
end)
local conn2 = UIS.InputEnded:Connect(function(i,gp)
	if gp then
		return
	end
	if (i.UserInputType == ss.Keybind or i.KeyCode == ss.Keybind) and Aimbot.AimType == "Hold" then
		ads = false
	end
end)

fov = Drawingnew("Circle")
fov.Visible = true
fov.Transparency = 1
fov.Color = Color3.fromRGB(255,255,255)
fov.Thickness = 1
fov.NumSides = 64
fov.Radius = 100
fov.Filled = false

local fov1,fov2,label1,label2 = Drawingnew("Circle"),Drawingnew("Circle"),Drawingnew("Text"),Drawingnew("Text")
for _,v in next, {fov1,fov2} do
	v.Visible = false
	v.Transparency = 1 
	v.Thickness = 1 
	v.NumSides = 64
	v.Radius = 100
	v.Filled = false
end
fov1.Color = Color3fromRGB(255,0,0)
fov2.Color = Color3fromRGB(0, 0, 255)

for _,v in next, {label1,label2} do
	v.Visible = false
	v.Transparency = 1
	v.Size = 32 
	v.Center = true 
	v.Outline = true 
	v.OutlineColor = Color3fromRGB(0,0,0)
	v.Font = Fonts.UI
end
label1.Color = Color3.fromRGB(255,255,255)
label1.Text = "Aim Assist only works when the player is outside the Red circle and inside the Blue circle"
label2.Color = Color3.fromRGB(255,0,0)
label2.Text = "You cannot use Aimbot and Aim Assist at the same time!"

function removefov()
	fov:Remove()
	fov1:Remove()
	fov2:Remove()
	label1:Remove()
	label2:Remove()
end

local lastupdate = osclock()
function update()
	ss.RefreshRate = mathclamp(ss.RefreshRate, 0, mathhuge)
	if osclock() - lastupdate < (ss.RefreshRate / 1000) then
		return
	end
	lastupdate = osclock()
	mouse = UIS:GetMouseLocation()
	local min, max, dyn, size = AimAssist.MinFov, AimAssist.MaxFov, AimAssist.DynamicFov, camera.ViewportSize
	local bot, assist = Aimbot.Enabled, AimAssist.Enabled
	if ts then
		ss.VisibleCheck = false
	end
	if FovCircle.Enabled then
		fov.Position = mouse
		fov.NumSides = FovCircle.NumSides
		fov.Radius = FovCircle.Radius
		fov.Transparency = FovCircle.Transparency
		fov.Color = FovCircle.Color
		if FovCircle.Dynamic then
			fov.Radius = FovCircle.Radius / (camera.FieldOfView / 100)
		end
	else
		fov.Transparency = 0
	end
	max = (dyn and not ads and max) or (dyn and ads and max / (camera.FieldOfView / 100)) or max
	fov1.Visible = AimAssist.ShowFov
	fov2.Visible = AimAssist.ShowFov
	label1.Visible = AimAssist.ShowFov
	label2.Visible = bot and assist
	if AimAssist.ShowFov then
		fov1.Position = mouse
		fov1.Radius = min

		fov2.Position = mouse
		fov2.Radius = max

		label1.Position = Vector2new(size.X / 2, (size.Y / 2) + max + 10)
	end
	if bot and assist then
		label2.Position = Vector2new(size.X / 2, (size.Y / 2) + max + 42)
		return
	end
	local plr = ClosestPlayer()
	if plr == nil then return end
	local s = (bot and not assist and Aimbot) or (assist and not bot and AimAssist)
	local char, mychar = GetChar(plr), GetChar(player)
	local cf, ccf = char:GetBoundingBox(), camera.CFrame
	if (ads or ss.AlwaysActive) and (ccf.Position - cf.Position).Magnitude <= ss.MaximumDistance then
		if IsVisible(plr) and not IsWhitelisted(plr) then
			local str = mathclamp(s.Strength, 1, (bot and 200) or (assist and 100))
			if getchar then
				str = mathclamp(str, 1, 65)
			end
			if bot and InFov(plr) and char:FindFirstChild(Aimbot.TargetPart) then
				local vector = WorldToViewportPoint(camera, char[Aimbot.TargetPart].Position)
				if Aimbot.Use_mousemoverel then
					str /= 100
					mousemoverel((vector.X - mouse.X) * str, (vector.Y - mouse.Y) * str)
				else
					camera.CFrame = CFramenew(ccf.Position, char[Aimbot.TargetPart].Position)
				end
			end
			if assist and not InFov(plr, min) and InFov(plr, max) then
				if AimAssist.SlowSensitivity then
					local factor = AimAssist.SlowFactor 
					factor = mathclamp(factor, 1, 10)
					UIS.MouseDeltaSensitivity = (InFov(plr, max) and (olddelta / factor)) or olddelta
				end
				if (AimAssist.RequireMovement and mychar.Humanoid.MoveDirection.Magnitude > 0) or not AimAssist.RequireMovement or getchar then
					local part = (getchar and "Torso") or (ts and "Chest") or "HumanoidRootPart"
					local body = WorldToViewportPoint(camera, char[part].Position)
					local head = WorldToViewportPoint(camera, char.Head.Position)
					local vector = body
					if (mouse - Vector2new(head.X, head.Y)).Magnitude < (mouse - Vector2new(body.X, body.Y)).Magnitude then
						vector = head
					end
					local mag, mult = (ccf.Position - char[part].Position).Magnitude, 1
					if mag <= 20 then
						mult = 2
					elseif mag <= 40 then
						mult = 1.4 
					elseif mag > 100 then
						mult = 0.8
					end
					if ads then
						mult /= 1.8
					end
					str *= mult
					str /= 1000
					mousemoverel((vector.X - mouse.X) * str, (vector.Y - mouse.Y) * str)
				end
			end
		end
	end
end
local conn3 = RunService.RenderStepped:Connect(update)
local conn4 = players.PlayerAdded:Connect(function(plr)
	if ss.WhitelistFriends and player:IsFriendsWith(plr.UserId) then
		tableinsert(ss.Whitelisted,plr.UserId)
	end
end)

local aimbot = {}

function ValidType(type)
	return type == "Other" or ss[type] ~= nil
end
function ValidOption(type,option)
	return (type == "Other" and ss[option] ~= nil) or ss[type][option] ~= nil
end
function aimbot:Toggle(type)
	assert(ValidType(type),"Universal Aimbot: bad argument to #1 'Toggle' (Invalid Type)")
	if type == ("Whitelisted" or "Ignore") then
		ss[type] = not ss[type]
	else
		ss[type].Enabled = not ss[type].Enabled
	end
end
function aimbot:Get(type,option)
	assert(ValidType(type),"Universal Aimbot: bad argument to #1 'Get' (Invalid Type)")
	assert(ValidOption(type,option),"Universal Aimbot: bad argument to #2 'Get' (Invalid Option)")
	if type == "Other" then
		return ss[option]
	end
	return ss[type][option]
end
function aimbot:Set(type,option,value)
	assert(ValidType(type),"Universal Aimbot: bad argument to #1 'Set' (Invalid Type)")
	assert(ValidOption(type,option),"Universal Aimbot: bad argument to #2 'Set' (Invalid Option)")
	assert(value ~= nil,"Universal Aimbot: bad argument to #3 'Set'")
	if type == "Other" then
		ss[option] = value
	else
		ss[type][option] = value
	end
end
function aimbot:Destroy()
	conn1:Disconnect()
	conn2:Disconnect()
	conn3:Disconnect()
	conn4:Disconnect()
	removefov()
end
getgenv().UAIM = aimbot
return aimbot
