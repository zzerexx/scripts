--[[
v1.1.17 Changes
- Added a customizable crosshair with various options
- Added `UseKeybind` for TriggerBot; if this is enabled, you must hold down your keybind to use triggerbot
]]

local VERSION = "v1.1.17"

if not getgenv().AimbotSettings then
	getgenv().AimbotSettings = {
		TeamCheck = true, -- Press ] to toggle
		VisibleCheck = true,
		IgnoreTransparency = true, -- if enabled, visible check will automatically filter transparent objects
		IgnoredTransparency = 0.5, -- all parts with a transparency greater than this will be ignored (IgnoreTransparency has to be enabled)
		RefreshRate = 10, -- how fast the aimbot updates (milliseconds)
		Keybind = "MouseButton2",
		ToggleKey = "RightShift",
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
			RequireMovement = true
		},
		FovCircle = {
			Enabled = true,
			Dynamic = true,
			Radius = 100,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			NumSides = 64,
		},
		TriggerBot = {
			Enabled = false,
			Delay = 60, -- how long it waits before clicking (milliseconds)
			Spam = true, -- for semi-auto weapons
			ClicksPerSecond = 10, -- set this to 0 to get anything higher than 37 cps
			UseKeybind = false, -- if enabled, your keybind must be held to use trigger bot
		},
		Crosshair = {
			Enabled = false,
			Transparency = 1,
			TransparencyKeybind = 1, -- when the keybind is held, the crosshair's transparency will be changed to this
			Color = Color3.fromRGB(255, 0, 0),
			RainbowColor = false,
			Length = 15,
			Thickness = 2,
			Offset = 0
		},
		Priority = {},
		Whitelisted = {}, -- Username or User ID
		WhitelistFriends = true, -- Automatically adds friends to the whitelist
		Ignore = {} -- Raycast Ignore
	}
end

if not AimbotSettings.IgnoredTransparency then
	local bind = Instance.new("BindableFunction")
	bind.OnInvoke = function()
		setclipboard("https://pastebin.com/raw/nwqE7v07")
	end
	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = "Universal Aimbot",
		Text = "Please update your script!",
		Duration = 5,
		Button1 = "Get Latest Script",
		Callback = bind
	})
	return
end

local players = game:GetService("Players")
local player = players.LocalPlayer
local camera = workspace.CurrentCamera
local uis = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local mousemoverel = mousemoverel
local mouse1press = mouse1press
local mouse1release = mouse1release
local Drawingnew = Drawing.new 
local Fonts = Drawing.Fonts
local tableinsert = table.insert
local WorldToViewportPoint = camera.WorldToViewportPoint
local CFramenew = CFrame.new
local Vector2new = Vector2.new 
local fromRGB = Color3.fromRGB
local fromHSV = Color3.fromHSV
local mathfloor = math.floor
local mathclamp = math.clamp
local mathhuge = math.huge
local lower = string.lower
local mouse = uis:GetMouseLocation()
local osclock = os.clock
local RaycastParamsnew = RaycastParams.new
local FindFirstChild = game.FindFirstChild
local taskwait = task.wait
local taskspawn = task.spawn

local GameId = game.GameId
local ss = getgenv().AimbotSettings
local Aimbot = ss.Aimbot
local AimAssist = ss.AimAssist
local FovCircle = ss.FovCircle
local Trigger = ss.TriggerBot
local Mouse = player:GetMouse()

if GameId == (111958650 or 115797356 or 147332621) then -- arsenal, counter blox, typical colors 2
	ss.Ignore = {workspace.Ray_Ignore}
elseif GameId == 833423526 then -- strucid
	ss.Ignore = {workspace.IgnoreThese}
elseif GameId == 1168263273 then -- bad business
	do end
elseif GameId == 2162282815 then -- rush point
	ss.Ignore = {camera, player.Character, workspace.RaycastIgnore, workspace.DroppedWeapons, workspace.MapFolder.Map.Ramps, workspace.MapFolder.Map.Walls.MapWalls}
elseif FindFirstChild(workspace, "Ignore") then
	tableinsert(ss.Ignore, workspace.Ignore)
elseif FindFirstChild(workspace, "RaycastIgnore") then
	tableinsert(ss.Ignore, workspace.RaycastIgnore)
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
local olddelta = uis.MouseDeltaSensitivity
local triggering = false
local mousedown = false
local Ignore = {camera}
local gids = { -- game ids
	['arsenal'] = 111958650,
	['pf'] = 113491250,
	['pft'] = 115272207, -- pf test place
	['pfu'] = 1256867479, -- pf unstable branch
	['bb'] = 1168263273,
	['rp'] = 2162282815, -- rush point
}
local getchar, getvis, ts, characters, teams, rp
if (GameId == gids.pf) or (GameId == gids.pft) or (GameId == gids.pfu) then
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
			characters = ts.Characters
			teams = ts.Teams
		end
	end
elseif GameId == gids.rp then
	-- CREDIT TO THIS DUDE FOR CRASH FIX https://v3rmillion.net/showthread.php?pid=8248169#pid8248169
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Github-Account-39021832/Rush-Point-Fix-Crash/main/src.lua"))()
	for _,v in next, getgc(true) do
		if typeof(v) == "table" and rawget(v, "GetAllCharacters") then
			rp = v
		end
	end
end

local rootpart = (getchar and "Torso") or (ts and "Chest") or "HumanoidRootPart"

local oldfuncs = {}

function IsAlive(plr)
	local humanoid = FindFirstChild(plr.Character or game, "Humanoid")
	if humanoid and humanoid.Health > 0 then
		return true
	end
	return false
end

function GetChar(plr)
	return plr.Character
end

function GetTeam(plr)
	return plr.Team
end

function IsFFA()
	local t = {}
	for _,v in next, players:GetPlayers() do
		local team = GetTeam(v)
		if team == nil then return true end
		team = team.Name or team
		if not t[team] then
			tableinsert(t, team)
		end
	end
	return #t == 1
end

function ClosestPlayer()
	mouse = uis:GetMouseLocation()
	local plr = nil
	local closest = mathhuge
	local myteam = GetTeam(player)
	for _,v in next, ss.Priority do
		v = players:FindFirstChild(v)
		if v and IsAlive(v) and InFov(v) then
			return v
		end
	end
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

local params = RaycastParamsnew()
params.FilterType = Enum.RaycastFilterType.Blacklist
params.IgnoreWater = true
function IsVisible(plr, character, mycharacter, cf, targetpos, valid)
	local char = character or GetChar(plr)
	if ss.VisibleCheck and (valid or IsAlive(plr) and FindFirstChild(char, Aimbot.TargetPart)) then
		if getvis then
			return getvis(player,plr)
		else
			local mychar = mycharacter or GetChar(player)
			tableinsert(Ignore, mychar)
			params.FilterDescendantsInstances = Ignore
			local cf = cf or camera.CFrame.Position
			local targetpos = targetpos or char[Aimbot.TargetPart].Position
			local result = workspace:Raycast(cf, (targetpos - cf).Unit * 500,params)
			if result then
				local ins = result.Instance
				local isdes = ins:IsDescendantOf(char)
				local model = ins:FindFirstAncestorOfClass("Model")
				if ss.IgnoreTransparency then
					if ins.Transparency > ss.IgnoredTransparency and not (model ~= nil and model:FindFirstChildOfClass("Humanoid")) and not isdes then
						tableinsert(Ignore, ins)
						return IsVisible(plr, char, mychar, cf, targetpos, true)
					elseif isdes then
						return true
					end
				elseif isdes then
					return true
				end
			end
		end
	elseif not ss.VisibleCheck and IsAlive(plr) then
		return true
	end
	return false
end
task.spawn(function() -- update ignore list (i have no idea if i even need this but whatever)
	while true do
		if typeof(ss.Ignore) == "table" then
			for _,v in next, ss.Ignore do
				tableinsert(Ignore, v)
			end
		end
		taskwait(3)
	end
end)

local fov
function InFov(plr,Fov)
	mouse = uis:GetMouseLocation()
	if IsAlive(plr) then
		local char = GetChar(plr)
		if ts and FindFirstChild(char, "Body") then
			char = char.Body
		end
		local target = FindFirstChild(char, Aimbot.TargetPart)
		if target then
			local _, inViewport = WorldToViewportPoint(camera, target.Position)
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
		else
			return false
		end
	end
	return false
end

do -- compatibility
	if getchar then -- phantom forces
		IsAlive = function(plr)
			return getchar(plr) ~= nil
		end
		GetChar = function(plr)
			local a = getchar(plr)
			if a ~= nil then
				return a.torso.Parent
			end
			return nil
		end
	end
	
	if ts then -- bad business
		hookfunction(PluginManager, error)
		IsAlive = function(plr)
			return characters:GetCharacter(plr) ~= nil
		end
		GetChar = function(plr)
			return characters:GetCharacter(plr)
		end
		GetTeam = function(plr)
			return teams:GetPlayerTeam(plr, plr)
		end
	end

	if GameId == gids.arsenal then -- arsenal
		local ffa = game:GetService("ReplicatedStorage"):WaitForChild("wkspc"):WaitForChild("FFA")
		IsFFA = function()
			return ffa.Value
		end
	end

	if rp then -- rush point
		--[[ -- function method (shitty asf)
		local getallchars = rp.GetAllCharacters
		GetChar = function(plr)
			for _,v in next, getallchars() do
				if v.Name == plr.Name then
					return v
				end
			end
		end
		]]
		local mapfolder = workspace:WaitForChild("MapFolder")
		local playerfolder = mapfolder:WaitForChild("Players")
		local gamemode = mapfolder:WaitForChild("GameStats"):WaitForChild("GameMode")
		GetChar = function(plr)
			return FindFirstChild(playerfolder, plr.Name)
		end
		IsAlive = GetChar
		GetTeam = function(plr)
			local char = GetChar(plr)
			if char and FindFirstChild(char, "Team") then
				return char.Team.Value
			end
			return nil
		end
		IsFFA = function()
			return gamemode.Value == "Deathmatch"
		end
	end
end

oldfuncs.alive = IsAlive
oldfuncs.character = GetChar
oldfuncs.team = GetTeam
oldfuncs.ffa = IsFFA
oldfuncs.closest = ClosestPlayer
oldfuncs.visible = IsVisible
oldfuncs.fov = InFov

function IsWhitelisted(plr)
	if table.find(ss.Whitelisted, (plr.Name or plr.UserId)) then
		return true
	end
	return false
end

local uit = Enum.UserInputType
local kc = Enum.KeyCode
local mb1 = uit.MouseButton1
local conn1 = uis.InputBegan:Connect(function(i,gp)
	if gp then
		return
	end
	local a = ss.Keybind:find("Mouse") and uit[ss.Keybind] or kc[ss.Keybind]
	local b = kc[ss.ToggleKey] ~= nil and kc[ss.ToggleKey]
	if i.UserInputType == a or i.KeyCode == a then
		if Aimbot.AimType == "Toggle" then
			ads = not ads
		else
			ads = true
		end
	elseif i.KeyCode == b then
		Aimbot.Enabled = not Aimbot.Enabled
		fov.Visible = Aimbot.Enabled
		AimAssist.Enabled = not AimAssist.Enabled
	end
	if i.UserInputType == mb1 then
		mousedown = true
	end
end)
local conn2 = uis.InputEnded:Connect(function(i,gp)
	if gp then
		return
	end
	local a = ss.Keybind:find("Mouse") and uit[ss.Keybind] or kc[ss.Keybind]
	if (i.UserInputType == a or i.KeyCode == a) and Aimbot.AimType == "Hold" then
		ads = false
	end
	if i.UserInputType == mb1 then
		mousedown = false
	end
end)

fov = Drawingnew("Circle")
fov.Visible = true
fov.Transparency = 1
fov.Color = fromRGB(255,255,255)
fov.Thickness = 1
fov.NumSides = 64
fov.Radius = 100
fov.Filled = false

-- aim assist fov circles and labels
local fov1, fov2, label1, label2 = Drawingnew("Circle"), Drawingnew("Circle"), Drawingnew("Text"), Drawingnew("Text")
do
	for _,v in next, {fov1, fov2} do
		v.Visible = false
		v.Transparency = 1 
		v.Thickness = 1 
		v.NumSides = 64
		v.Radius = 100
		v.Filled = false
	end
	fov1.Color = fromRGB(255,0,0)
	fov2.Color = fromRGB(0, 0, 255)
	
	for _,v in next, {label1,label2} do
		v.Visible = false
		v.Transparency = 1
		v.Size = 32 
		v.Center = true 
		v.Outline = true 
		v.OutlineColor = fromRGB(0,0,0)
		v.Font = Fonts.UI
	end
	label1.Color = fromRGB(255,255,255)
	label1.Text = "Aim Assist only works when the player is outside the Red circle and inside the Blue circle"
	label2.Color = fromRGB(255,0,0)
	label2.Text = "You cannot use Aimbot and Aim Assist at the same time!"
end
function removefov()
	fov:Remove()
	fov1:Remove()
	fov2:Remove()
	label1:Remove()
	label2:Remove()
end

-- crosshair
local t, b, r, l, chdestroyed = Drawingnew("Line"), Drawingnew("Line"), Drawingnew("Line"), Drawingnew("Line"), false
for _,v in next, {t, b, r, l} do
	pcall(function()
		v.ZIndex = 100
	end)
end
function updatecrosshair(s)
	for _,v in next, {t, b, r, l} do
		v.Visible = s.Enabled
	end
	if chdestroyed or not s.Enabled then return end
	local center = camera.ViewportSize / 2
	center = Vector2new(mathfloor(center.X), mathfloor(center.Y))
	local length = s.Length
	local offset = s.Offset

	for _,v in next, {t, b, r, l} do
		v.Transparency = ads and s.TransparencyKeybind or s.Transparency
		v.Color = s.RainbowColor and fromHSV(tick() % 5 / 5, 1, 1) or s.Color
		v.Thickness = s.Thickness
	end

	t.From = Vector2new(center.X, center.Y - offset)
	t.To   = Vector2new(center.X, center.Y - offset - length)

	b.From = Vector2new(center.X, center.Y + offset)
	b.To   = Vector2new(center.X, center.Y + offset + length)

	r.From = Vector2new(center.X + offset, center.Y)
	r.To   = Vector2new(center.X + offset + length, center.Y)

	l.From = Vector2new(center.X - offset, center.Y)
	l.To   = Vector2new(center.X - offset - length, center.Y)
end
function removecrosshair()
	t:Remove()
	b:Remove()
	r:Remove()
	l:Remove()
	chdestroyed = true
end
local defaultcrosshair = {
	Enabled = false,
	Transparency = 1,
	TransparencyKeybind = 1,
	Color = fromRGB(255, 0, 0),
	RainbowColor = false,
	Length = 15,
	Thickness = 2,
	Offset = 0
}
updatecrosshair(ss.Crosshair or defaultcrosshair)

local lastupdate = osclock()
function update()
	ss.RefreshRate = mathclamp(ss.RefreshRate, 0, mathhuge)
	if osclock() - lastupdate < (ss.RefreshRate / 1000) then
		return
	end
	lastupdate = osclock()

	mouse = uis:GetMouseLocation()
	local min, max, dyn, size = AimAssist.MinFov, AimAssist.MaxFov, AimAssist.DynamicFov, camera.ViewportSize
	local bot, assist = Aimbot.Enabled, AimAssist.Enabled

	local plr = ClosestPlayer()
	if plr ~= nil then
		local s = (bot and not assist and Aimbot) or (assist and not bot and AimAssist)
		local char, mychar = GetChar(plr), GetChar(player)
		local cf, ccf = char:GetBoundingBox(), camera.CFrame
		local dist = (ccf.Position - cf.Position).Magnitude

		if (ads or ss.AlwaysActive) and dist <= ss.MaximumDistance then
			if IsVisible(plr) and not IsWhitelisted(plr) then
				local str = mathclamp(s.Strength, 1, (bot and 200) or (assist and 100))
				if getchar then
					str = mathclamp(str, 1, 65)
				end
				local target = Aimbot.TargetPart
				if ts and FindFirstChild(char, "Body") then
					char = char.Body
				end
				if bot then
					target = FindFirstChild(char, target)
					if InFov(plr) and target then
						local vector = WorldToViewportPoint(camera, target.Position)
						if Aimbot.Use_mousemoverel then
							str /= 100
							mousemoverel((vector.X - mouse.X) * str, (vector.Y - mouse.Y) * str)
						else
							camera.CFrame = CFramenew(ccf.Position, char[target.Name].Position)
						end
					end
				end
				if assist then
					local inmaxfov = InFov(plr, max)
					if not InFov(plr, min) and inmaxfov then
						local factor = AimAssist.SlowFactor
						if AimAssist.SlowSensitivity then
							factor = mathclamp(factor, 1, 10)
							uis.MouseDeltaSensitivity = (inmaxfov and (olddelta / factor)) or olddelta
						end
						if (AimAssist.RequireMovement and FindFirstChild(mychar, "Humanoid") and mychar.Humanoid.MoveDirection.Magnitude > 0) or not AimAssist.RequireMovement or getchar then
							local body = WorldToViewportPoint(camera, char[rootpart].Position)
							local head = WorldToViewportPoint(camera, char.Head.Position)
							local vector = body
							if (mouse - Vector2new(head.X, head.Y)).Magnitude < (mouse - Vector2new(body.X, body.Y)).Magnitude then
								vector = head
							end
		
							-- distance based strength
							local mag = (ccf.Position - char[rootpart].Position).Magnitude
							local mult = (mag <= 20 and 2) or (mag <= 40 and 1.4) or 1
		
							if ads then
								mult /= 1.8
							end
							if AimAssist.SlowSensitivity then
								mult *= factor
							end
		
							str *= mult
							str /= 1000
							mousemoverel((vector.X - mouse.X) * str, (vector.Y - mouse.Y) * str * 1.2)
						end
					elseif assist and not inmaxfov then
						uis.MouseDeltaSensitivity = olddelta
					end
				end
			elseif assist and not InFov(plr, max) then
				uis.MouseDeltaSensitivity = olddelta
			end
		end

		local target = Mouse.Target
		local usebind = Trigger.UseKeybind
		if not triggering and Trigger.Enabled and target ~= nil and target:IsDescendantOf(char) and not mousedown then
			taskspawn(function()
				triggering = true
				taskwait(Trigger.Delay / 1000)
				target = Mouse.Target
				if target ~= nil and target:IsDescendantOf(char) then
					triggering = true
					local cps = Trigger.ClicksPerSecond
					local spam = Trigger.Spam
					if cps > 37 then
						cps = 0
					end
					local waitamount = cps == 0 and 0 or 1 / cps
					
					if (usebind and ads or not usebind) then
						mouse1press()
					end
					taskwait(waitamount)
					repeat
						target = Mouse.Target
						if spam and (usebind and ads or not usebind) and not mousedown then
							mouse1press()
						end
						taskwait(waitamount)
					until char == nil or Mouse.Target == nil or not Mouse.Target:IsDescendantOf(char)
					mouse1release()
					triggering = false
				else
					triggering = false
				end
			end)
		end
	end

	if FovCircle.Enabled then
		fov.Position = mouse
		fov.NumSides = FovCircle.NumSides
		fov.Radius = FovCircle.Radius
		fov.Transparency = FovCircle.Transparency
		fov.Color = FovCircle.Color
		if FovCircle.Dynamic then
			fov.Radius = FovCircle.Radius / (camera.FieldOfView / 80)
		end
	else
		fov.Transparency = 0
	end

	local showfov = AimAssist.ShowFov
	max = (dyn and not ads and max) or (dyn and ads and max / (camera.FieldOfView / 100)) or max
	fov1.Visible = showfov
	fov2.Visible = showfov
	label1.Visible = showfov
	label2.Visible = bot and assist
	if showfov then
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

	updatecrosshair(ss.Crosshair or defaultcrosshair)
end
--local conn3 = RunService.RenderStepped:Connect(update)
local name = ""
for _ = 1, math.random(16, 24) do
	name ..= string.char(math.random(97, 122))
end
RunService:BindToRenderStep(name, 0, update)
local conn4 = players.PlayerAdded:Connect(function(plr)
	if ss.WhitelistFriends and player:IsFriendsWith(plr.UserId) then
		tableinsert(ss.Whitelisted, plr.UserId)
	end
end)
if typeof(ss.Keybind) == "EnumItem" then
	ss.Keybind = ss.Keybind.Name
end
if typeof(ss.ToggleKey) == "EnumItem" then
	ss.ToggleKey = ss.ToggleKey.Name
end

local aimbot = {Version = VERSION}
local destroyed = false

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
function aimbot:SetFunction(a,f)
	assert(typeof(a) == "string",("Universal Aimbot: bad argument to #1 'SetFunction' (string expected, got %s)"):format(typeof(a)))
	assert(typeof(f) == "function",("Universal Aimbot: bad argument to #2 'SetFunction' (function expected, got %s)"):format(typeof(f)))
	a = lower(a)
	if a == "alive" then
		IsAlive = f
	elseif a == "character" then
		GetChar = f
	elseif a == "team" then
		GetTeam = f
	elseif a == "ffa" then
		IsFFA = f
	elseif a == "closest" then
		ClosestPlayer = f
	elseif a == "visible" then
		IsVisible = f
	end
end
function aimbot:ResetFunction(a)
	assert(typeof(a) == "string",("Universal Aimbot: bad argument to #1 'ResetFunction' (string expected, got %s)"):format(typeof(a)))
	a = lower(a)
	assert(oldfuncs[a] ~= nil,"Universal Aimbot: bad argument to #1 'ResetFunction' (invalid function)")
	local f = oldfuncs[a]
	if a == "alive" then
		IsAlive = f
	elseif a == "character" then
		GetChar = f
	elseif a == "team" then
		GetTeam = f
	elseif a == "ffa" then
		IsFFA = f
	elseif a == "closest" then
		ClosestPlayer = f
	elseif a == "visible" then
		IsVisible = f
	end
end
function aimbot:Destroy()
	if destroyed then return end
	conn1:Disconnect()
	conn2:Disconnect()
	--conn3:Disconnect()
	conn4:Disconnect()
	RunService:UnbindFromRenderStep(name)
	removefov()
	removecrosshair()
	uis.MouseDeltaSensitivity = olddelta
	destroyed = true
end
getgenv().UAIM = aimbot
return aimbot
