if game.GameId == 1168263273 then
	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = "Universal Esp",
		Text = "Universal Esp is detected on Bad Business! Please use a different script to prevent getting banned.",
		Duration = 5
	})
	return
end
for _,v in next, getconnections(game:GetService("ScriptContext").Error) do
	v:Disable()
end
if not Drawing then
	game:GetService("Players").LocalPlayer:Kick("\n\nUniversal Esp\nYour exploit does not have a Drawing Library!\n")
	return
end
if UESP then
	UESP:Destroy()
end
local ZIndexEnabled = pcall(function()
	local a = Drawing.new("Square")
	a.Visible = false
	task.delay(0.1,function()
		a:Remove()
	end)
	a.ZIndex = 1
end)

local players = game:GetService("Players")
local player = players.LocalPlayer
local camera = workspace.CurrentCamera
local uis = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Drawingnew = Drawing.new
local Fonts = Drawing.Fonts
local tableinsert = table.insert
local WorldToViewportPoint = camera.WorldToViewportPoint
local CFramenew = CFrame.new
local Vector2new = Vector2.new 
local fromRGB = Color3.fromRGB
local mathfloor = math.floor
local lower = string.lower
local osclock = os.clock
local next = next
local typeof = typeof
local FindFirstChild = game.FindFirstChild
local GetMouseLocation = uis.GetMouseLocation

local GameId = game.GameId
local OBJECTS, VISIBLE, ID = {}, true, 0
local gids = { -- game ids
	['arsenal'] = 111958650,
	['pf'] = 113491250,
	['pft'] = 115272207, -- pf test place
	['pfu'] = 1256867479, -- pf unstable branch
	['bb'] = 1168263273,
}
local zindex = {
	['Boxes'] = 1,
	['Names'] = 2
}
local omega, beta, black = fromRGB(255,116,38), fromRGB(38,125,255), fromRGB(0,0,0)
local getchar, gethealth, ts, characters, teams
if GameId == (gids.pf or gids.pft or gids.pfu) then
	for _,v in next, getgc(true) do
		if typeof(v) == "table" and rawget(v, "getbodyparts") then
			getchar = rawget(v, "getbodyparts")
		elseif typeof(v) == "table" and rawget(v, "getplayerhealth") then
			gethealth = rawget(v, "getplayerhealth")
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
end
local oldfuncs = {}

function IsAlive(plr)
	local humanoid = FindFirstChild(plr.Character or game, "Humanoid")
	if humanoid and humanoid.Health > 0 then
		return true
	end
	return false
end
do
	if getchar then
		IsAlive = function(plr)
			return getchar(plr) ~= nil
		end
	end
	if ts then
		IsAlive = function(plr)
			return characters:GetCharacter(plr) ~= nil
		end
	end
end
oldfuncs.alive = IsAlive

function GetChar(plr)
	return plr.Character
end
do
	if getchar then
		GetChar = function(plr)
			local a = getchar(plr)
			if a ~= nil then
				return a.torso.Parent
			end
			return nil
		end
	end
	if ts then
		GetChar = function(plr)
			return characters:GetCharacter(plr)
		end
	end
end
oldfuncs.character = GetChar

function GetHealth(plr)
	local a = FindFirstChild(plr.Character or game, "Humanoid")
	if a then
		return {mathfloor(a.Health), mathfloor(a.MaxHealth)}
	end
	return {100,100}
end
do
	if gethealth then
		GetHealth = function(plr)
			return {mathfloor(gethealth(plr, plr)), 100}
		end
	end
	if ts then
		GetHealth = function(plr)
			local a = characters:GetCharacter(plr)
			local hp = FindFirstChild(a, "Health")
			if hp then
				return {mathfloor(hp.Value), mathfloor(hp.MaxHealth.Value)}
			end
			return {100,100}
		end
	end
	if GameId == gids.arsenal then
		GetHealth = function(plr)
			local a = plr.NRPBS
			return {mathfloor(a.Health.Value), mathfloor(a.MaxHealth.Value)}
		end
	end
end
oldfuncs.health = GetHealth

function GetTeam(plr)
	return plr.Team
end
do
	if ts then
		GetTeam = function(plr)
			return teams:GetPlayerTeam(plr)
		end
	end
end
oldfuncs.team = GetTeam

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
do
	if GameId == gids.arsenal then
		local ffa = game:GetService("ReplicatedStorage"):WaitForChild("wkspc"):WaitForChild("FFA")
		IsFFA = function()
			return ffa.Value == true
		end
	end
end
oldfuncs.ffa = IsFFA

function ApplyZIndex(obj,name)
	if ZIndexEnabled then
		local idx = zindex[name]
		for _,v in next, obj do
			v.ZIndex = idx
		end
	end
end
function SetProp(obj,prop,value)
	for _,v in next, obj do
		v[prop] = value
	end
end
function ternary(condition,val1,val2)
	if condition then
		return val1
	end
	return val2
end
function Box(plr)
	ID += 1

	local type = "Boxes"
	local objects = {
		Box = Drawingnew("Quad"),
		Outline = Drawingnew("Quad")
	}
	SetProp(objects, "Visible", false)
	SetProp(objects, "Filled", false)
	objects.Box.Thickness = 1
	objects.Outline.Thickness = 3
	ApplyZIndex(objects, type)
	objects.Outline.ZIndex = 0
	local a = {Object = objects, Type = type, Player = plr, Destroyed = false, Id = ID}
	function a:Remove()
		if a.Destroyed then return end
		objects.Box:Remove()
		objects.Outline:Remove()
		a.Destroyed = true
	end
	OBJECTS[ID] = a
end
function Name(plr)
	ID += 1

	local type = "Names"
	local objects = {
		Name = Drawingnew("Text"),
		Data = Drawingnew("Text")
	}
	SetProp(objects, "Visible", false)
	SetProp(objects, "Center", true)
	SetProp(objects, "Outline", true)
	SetProp(objects, "OutlineColor", black)
	SetProp(objects, "Font", Fonts.UI)
	ApplyZIndex(objects, type)
	local a = {Object = objects, Type = type, Player = plr, Destroyed = false, Id = ID}
	function a:Remove()
		if a.Destroyed then return end
		objects.Name:Remove()
		objects.Data:Remove()
		a.Destroyed = true
	end
	OBJECTS[ID] = a
end

local lastupdate = osclock()
function update()
	if osclock() - lastupdate < 0.01 then -- 10ms
		return
	end
	lastupdate = osclock()
	local ffa, myteam, ccf = IsFFA(), GetTeam(player), camera.CFrame.Position
	for _,v in next, OBJECTS do
		if not v.Destroyed then
			if v.Player == nil then
				v:Remove()
			end
	
			local plr, obj, type = v.Player, v.Object, v.Type					-- objects shit
			local cf, size, mid, inViewport, tl, tr, bl, br					  -- boxes shit
			local tlx, tly, trx, try, blx, bly, brx, bry						 -- boxes corner axes shit
			local team, teamcolor												-- team shit
			local char, health, maxhealth, mag, mousemag, render				 -- other shit
			if VISIBLE and plr and IsAlive(plr) then
				local hp = GetHealth(plr)
				char, health, maxhealth = GetChar(plr), hp[1], hp[2]
				cf, size = char:GetBoundingBox()
				team, teamcolor = GetTeam(plr), plr.TeamColor.Color
				mag = (ccf - cf.Position).Magnitude
				render = ffa or (not ffa and team ~= myteam) and mag <= 300
				if render then
					size /= 2
					local x, y = size.X, size.Y
					mid, inViewport = WorldToViewportPoint(camera, cf.Position)
					tl = WorldToViewportPoint(camera, (cf * CFramenew(-x,  y, 0)).Position)
					tr = WorldToViewportPoint(camera, (cf * CFramenew( x,  y, 0)).Position)
					bl = WorldToViewportPoint(camera, (cf * CFramenew(-x, -y, 0)).Position)
					br = WorldToViewportPoint(camera, (cf * CFramenew( x, -y, 0)).Position)

					tlx, tly = tl.X, tl.Y
					trx, try = tr.X, tr.Y
					blx, bly = bl.X, bl.Y
					brx, bry = br.X, br.Y

					mousemag = (GetMouseLocation(uis) - Vector2new(mid.X, mid.Y)).Magnitude
				end
			end
			if VISIBLE then
				if plr and IsAlive(plr) then
					SetProp(obj, "Visible", render)
					if inViewport and render then
						local color = (ts and team == "Omega" and omega or team == "Beta" and beta) or teamcolor
						local transparency = (mousemag <= 75 and 0.35) or 1
						
						SetProp(obj, "Transparency", transparency)
						SetProp(obj, "Color", color)
						if type == "Boxes" then
							local box, out = obj.Box, obj.Outline

							local A = Vector2new(trx, try)
							local B = Vector2new(tlx, tly)
							local C = Vector2new(blx, bly)
							local D = Vector2new(brx, bry)

							box.PointA = A
							box.PointB = B
							box.PointC = C
							box.PointD = D

							out.Color = black
							out.PointA = A
							out.PointB = B
							out.PointC = C
							out.PointD = D
						elseif type == "Names" then
							local name, data = obj.Name, obj.Data
							local h,l = (tly > try and tly) or try, (tly < try and tly) or try
							
							name.Position = Vector2new(tlx + (trx - tlx) / 2, (h + (l - h) / 2) - 20)
							data.Position = Vector2new(blx + (brx - blx) / 2, bly + (bry - bly) / 2)

							name.Text = plr.Name
							data.Text = "[ "..mathfloor((health / maxhealth) * 100).."% ]"
						end
					end
				end
				if not inViewport then
					SetProp(obj, "Visible", false)
				end
			else
				SetProp(obj, "Visible", false)
			end
		end
	end
end

local conn2 = RunService.RenderStepped:Connect(update)
local conn3 = uis.InputBegan:Connect(function(i,gp)
	if not gp and i.KeyCode == Enum.KeyCode.RightAlt then
		VISIBLE = not VISIBLE
	end
end)
function doshit(v)
	Box(v)
	Name(v)
end
for _,v in next, players:GetPlayers() do
	if v ~= player then
		doshit(v)
	end
end
local conn4 = players.PlayerAdded:Connect(doshit)

local esp = {}
local destroyed = false

function esp:SetFunction(a,f)
	assert(typeof(a) == "string",("Universal Esp: bad argument to #1 'SetFunction' (string expected, got %s)"):format(typeof(a)))
	assert(typeof(f) == "function",("Universal Esp: bad argument to #2 'SetFunction' (function expected, got %s)"):format(typeof(f)))
	a = lower(a)
	assert(oldfuncs[a] ~= nil,"Universal Esp: bad argument to #1 'SetFunction' (invalid function)")
	if a == "alive" then -- ik it looks like shit stfu
		IsAlive = f
	elseif a == "character" then
		GetChar = f
	elseif a == "health" then
		GetHealth = f
	elseif a == "team" then
		GetTeam = f
	elseif a == "ffa" then
		IsFFA = f
	end
end
function esp:ResetFunction(a)
	assert(typeof(a) == "string",("Universal Esp: bad argument to #1 'SetFunction' (string expected, got %s)"):format(typeof(a)))
	a = lower(a)
	assert(oldfuncs[a] ~= nil,"Universal Esp: bad argument to #1 'SetFunction' (invalid function)")
	local f = oldfuncs[a]
	if a == "alive" then
		IsAlive = f
	elseif a == "character" then
		GetChar = f
	elseif a == "health" then
		GetHealth = f
	elseif a == "team" then
		GetTeam = f
	elseif a == "ffa" then
		IsFFA = f
	end
end
function esp:Destroy()
	if destroyed then return end
	conn2:Disconnect()
	conn3:Disconnect()
	conn4:Disconnect()
	for _,v in next, OBJECTS do
		v:Remove()
	end
	destroyed = true
end
getgenv().UESP = esp
return esp
