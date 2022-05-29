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
	['rp'] = 2162282815, -- rush point
}
local zindex = {
	['Boxes'] = 1,
	['Names'] = 2
}
local white, black = fromRGB(255,255,255), fromRGB(0,0,0)
local getchar, gethealth, ts, characters, teams, rp
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
elseif GameId == gids.rp then
	-- CREDIT TO THIS DUDE FOR CRASH FIX https://v3rmillion.net/showthread.php?pid=8248169#pid8248169
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Github-Account-39021832/Rush-Point-Fix-Crash/main/src.lua"))()
	for _,v in next, getgc(true) do
		if typeof(v) == "table" and rawget(v, "GetAllCharacters") then
			rp = v -- unused
		end
	end
end
local oldfuncs = {}

function IsAlive(plr)
	if plr.ClassName == "Model" then
		return true
	end

	local humanoid = FindFirstChild(plr.Character or game, "Humanoid")
	if humanoid and humanoid.Health > 0 then
		return true
	end
	return false
end

function GetChar(plr)
	if plr.ClassName == "Model" then
		return plr
	end
	return plr.Character
end

function GetHealth(plr)
	if plr.ClassName == "Model" then
		local a = plr.Humanoid
		return {mathfloor(a.Health), mathfloor(a.MaxHealth)}
	end

	local a = FindFirstChild(plr.Character or game, "Humanoid")
	if a then
		return {mathfloor(a.Health), mathfloor(a.MaxHealth)}
	end
	return {100,100}
end

function GetTeam(plr)
	if plr.ClassName == "Model" then
		return "NPC"
	end
	return plr.Team
end

function GetTeamColor(plr)
	if plr.ClassName == "Model" then
		return npcs.Color
	end
	return plr.TeamColor.Color
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
		GetHealth = function(plr)
			return {mathfloor(gethealth(plr, plr)), 100}
		end
	end
	
	if ts then -- bad business
		local teamcolors = {
			Omega = fromRGB(255,116,38),
			Beta = fromRGB(38,125,255)
		}
		hookfunction(PluginManager, error)
		IsAlive = function(plr)
			return characters:GetCharacter(plr) ~= nil
		end
		GetChar = function(plr)
			return characters:GetCharacter(plr)
		end
		GetHealth = function(plr)
			local a = characters:GetCharacter(plr)
			local hp = FindFirstChild(a, "Health")
			if hp then
				return {mathfloor(hp.Value), mathfloor(hp.MaxHealth.Value)}
			end
			return {100, 100}
		end
		GetTeam = function(plr)
			return teams:GetPlayerTeam(plr, plr)
		end
		GetTeamColor = function(plr)
			local team = GetTeam(plr)
			return (team and teamcolors[team]) or white
		end
	end

	if GameId == gids.arsenal then -- arsenal
		GetHealth = function(plr)
			local a = plr.NRPBS
			return {mathfloor(a.Health.Value), mathfloor(a.MaxHealth.Value)}
		end
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
		local gamestats = mapfolder:WaitForChild("GameStats")
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
		GetTeamColor = function(plr)
			local char = GetChar(plr)
			return (char and FindFirstChild(char, "Outline") and char.Outline.OutlineColor) or white
		end
		IsFFA = function()
			return gamestats.GameMode.Value == "Deathmatch"
		end
	end
end

oldfuncs.alive = IsAlive
oldfuncs.character = GetChar
oldfuncs.health = GetHealth
oldfuncs.team = GetTeam
oldfuncs.ffa = IsFFA

----

function ternary(condition,val1,val2)
	if condition then
		return val1
	end
	return val2
end

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
local Object = {
	Boxes = function()
		return {
			Outline = Drawingnew("Quad"),
			Box = Drawingnew("Quad")
		}
	end,
	Names = function()
		return {
			Name = Drawingnew("Text"),
			Data = Drawingnew("Text")
		}
	end
}
function NewObject(type)
	local obj = Object[type]()
	SetProp(obj, "Visible", false)
	ApplyZIndex(obj, type)
	return obj
end
function NewCharacterObject(objs, type, plr)
	ID += 1

	return {
		Object = objs,
		Type = type,
		Player = plr,
		NPC = plr.ClassName ~= "Player",
		Destroyed = false,
		Id = ID
	}
end

function Box(plr)
	local type = "Boxes"
	local objects = NewObject(type)
	SetProp(objects, "Filled", false)
	local a = NewCharacterObject(objects, type, plr)
	function a:Remove()
		if a.Destroyed then return end
		objects.Box:Remove()
		objects.Outline:Remove()
		a.Destroyed = true
	end
	OBJECTS[ID] = a
end
function Name(plr)
	local type = "Names"
	local objects = NewObject(type)
	SetProp(objects, "Center", true)
	SetProp(objects, "Outline", true)
	SetProp(objects, "OutlineColor", black)
	SetProp(objects, "Font", Fonts.UI)
	local a = NewCharacterObject(objects, type, plr)
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

					if ts and FindFirstChild(char, "Body") then
						char = char.Body
					end

					mousemag = (GetMouseLocation(uis) - Vector2new(mid.X, mid.Y)).Magnitude
				end
			end
			if VISIBLE then
				if plr and IsAlive(plr) then
					SetProp(obj, "Visible", render)
					if inViewport and render then
						SetProp(obj, "Transparency", (mousemag <= 50 and 0.15) or 1)
						SetProp(obj, "Color", teamcolor)
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

--local conn2 = RunService.RenderStepped:Connect(update)
local name = ""
for _ = 1, math.random(16, 24) do
	name = name..string.char(math.random(97, 122))
end
RunService:BindToRenderStep(name, 0, update)
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
	elseif a == "teamcolor" then
		GetTeamColor = f
	elseif a == "ffa" then
		IsFFA = f
	end
end
function esp:ResetFunction(a)
	assert(typeof(a) == "string",("Universal Esp: bad argument to #1 'ResetFunction' (string expected, got %s)"):format(typeof(a)))
	a = lower(a)
	assert(oldfuncs[a] ~= nil,"Universal Esp: bad argument to #1 'ResetFunction' (invalid function)")
	local f = oldfuncs[a]
	if a == "alive" then
		IsAlive = f
	elseif a == "character" then
		GetChar = f
	elseif a == "health" then
		GetHealth = f
	elseif a == "team" then
		GetTeam = f
	elseif a == "teamcolor" then
		GetTeamColor = f
	elseif a == "ffa" then
		IsFFA = f
	end
end
function esp:Destroy()
	if destroyed then return end
	--conn2:Disconnect()
	conn3:Disconnect()
	conn4:Disconnect()
	RunService:UnbindFromRenderStep(name)
	for _,v in next, OBJECTS do
		v:Remove()
	end
	destroyed = true
end
getgenv().UESP = esp
return esp
