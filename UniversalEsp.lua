--[[
v1.6.12 Changes
- Added support for Rush Point
- Added esp support for NPC characters (any models with a humanoid)
- Added GetTeamColor function
- and other fixes im too lazy to write
]]

local VERSION = "v1.6.12"

if not EspSettings then
	getgenv().EspSettings = {
		TeamCheck = false,
		ToggleKey = "RightAlt",
		RefreshRate = 10, -- how fast the esp updates (milliseconds)
		MaximumDistance = 500, -- only renders players within this distance
		FaceCamera = false, -- Makes esp appear 2D
		AlignPoints = false, -- Improves 2D effect; only works while FaceCamera is enabled
		-- AlignPoints: This may cause esp to have abnormal behavior when looking from certain angles
		MouseVisibility = {
			Enabled = true, -- makes any drawing objects transparent when they are near your mouse
			Radius = 60,
			Transparency = 0.3,
			Selected = { -- set any of these to false to ignore them
				Boxes = true,
				Tracers = true,
				Names = true,
				Skeletons = true,
				HealthBars = true,
				HeadDots = true,
				LookTracers = true
			}
		},
		Highlights = {
			Enabled = false,
			Players = {}, -- put player usernames into this table to 'highlight' them
			Transparency = 1,
			Color = Color3.fromRGB(255, 150, 0),
			AlwaysOnTop = true
		},
		NPC = {
			Color = Color3.fromRGB(150,150,150),
			Transparency = 1,
			RainbowColor = false,
			Overrides = {
				Boxes = true,
				Tracers = true,
				Names = true,
				Skeletons = true,
				HealthBars = true,
				HeadDots = true,
				LookTracers = true
			}
		},
		Boxes = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			RainbowColor = false,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
			OutlineThickness = 3,
			Thickness = 1
		},
		Tracers = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			RainbowColor = false,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
			OutlineThickness = 3,
			Origin = "Top", -- "Top" or "Center" or "Bottom" or "Mouse"
			Thickness = 1
		},
		Names = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			RainbowColor = false,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
			Font = Drawing.Fonts.UI, -- UI or System or Plex or Monospace
			Size = 18,
			ShowDistance = false,
			ShowHealth = true,
			UseDisplayName = false,
			DistanceDataType = "m", -- what it says after the distance (ex. 100m)
			HealthDataType = "Percentage" -- "Percentage" or "Value"
		},
		Skeletons = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			RainbowColor = false,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
			OutlineThickness = 3,
			Thickness = 1
		},
		HealthBars = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(0,255,0),
			UseTeamColor = true,
			RainbowColor = false,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
			OutlineThickness = 3,
			Origin = "None", -- "None" or "Left" or "Right"
			OutlineBarOnly = true
		},
		HeadDots = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			RainbowColor = false,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
			OutlineThickness = 3,
			Thickness = 1,
			Filled = false,
			Scale = 1
		},
		LookTracers = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			RainbowColor = false,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
			OutlineThickness = 3,
			Thickness = 1,
			Length = 5
		}
	}
end

if EspSettings.Highlights == nil then
	local bind = Instance.new("BindableFunction")
	bind.OnInvoke = function()
		setclipboard("https://pastebin.com/raw/5zw0rLH9")
	end
	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = "Universal Esp",
		Text = "Please update your script!",
		Duration = 5,
		Button1 = "Get Latest Script",
		Callback = bind
	})
	return
end
getgenv().EspSettings.Names.OutlineThickness = 0 -- to make setall work

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
	task.delay(0.1, function()
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
local tablesort = table.sort
local tablefind = table.find
local WorldToViewportPoint = camera.WorldToViewportPoint
local CFramenew = CFrame.new
local Vector2new = Vector2.new 
local fromRGB = Color3.fromRGB
local fromHSV = Color3.fromHSV
local mathfloor = math.floor
local mathclamp = math.clamp
local mathhuge = math.huge
local mathabs = math.abs
local lower = string.lower
local find = string.find
local osclock = os.clock
local next = next
local tick = tick
local typeof = typeof
local FindFirstChild = game.FindFirstChild
local GetMouseLocation = uis.GetMouseLocation

local GameId = game.GameId
local ss, mousevis, highlights, npcs = getgenv().EspSettings, getgenv().EspSettings.MouseVisibility, getgenv().EspSettings.Highlights, getgenv().EspSettings.NPC
local OBJECTS, VISIBLE, ID, OUTLINES = {}, true, 0, true
--[[local bodyparts = {
	"Head","UpperTorso","LowerTorso","LeftUpperArm","LeftLowerArm","LeftHand","RightUpperArm","RightLowerArm","RightHand","LeftUpperLeg","LeftLowerLeg","LeftFoot","RightUpperLeg","RightLowerLeg","RightFoot",
	"Torso","Left Arm","Right Arm","Left Leg","Right Leg",
	"Chest","Hips","LeftArm","LeftForearm","RightArm","RightForearm","LeftLeg","LeftForeleg","RightLeg","RightForeleg"
}]]
local gids = { -- game ids
	['arsenal'] = 111958650,
	['pf'] = 113491250,
	['pft'] = 115272207, -- pf test place
	['pfu'] = 1256867479, -- pf unstable branch
	['bb'] = 1168263273,
	['rp'] = 2162282815, -- rush point
}
local zindex = {
	['Boxes'] = 2,
	['Tracers'] = 3,
	['Names'] = 6,
	['Skeletons'] = 2,
	['HealthBars'] = 4,
	['HeadDots'] = 3,
	['LookTracers'] = 3,
	['Labels'] = 5,
	['Chams'] = 0
}
local zindex_ontop = { -- zindex for always on top objects
	['Boxes'] = 12,
	['Tracers'] = 13,
	['Names'] = 16,
	['Skeletons'] = 12,
	['HealthBars'] = 14,
	['HeadDots'] = 13,
	['LookTracers'] = 13,
	['Labels'] = 15,
	['Chams'] = 10
}
local Base = {
	"Enabled",
	"Transparency",
	"Color",
	"UseTeamColor",
	"RainbowColor",
	"Outline",
	"OutlineColor"
}
local origins = {}
local white, black = fromRGB(255,255,255), fromRGB(0,0,0)
local getchar, gethealth, ts, characters, teams, rp
if (GameId == gids.pf) or (GameId == gids.pft) or (GameId == gids.pfu) then
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
local From = {
	UpperTorso = "Head",
	LowerTorso = "UpperTorso",
	LeftUpperArm = "UpperTorso",
	RightUpperArm = "UpperTorso",
	LeftLowerArm = "LeftUpperArm",
	RightLowerArm = "RightUpperArm",
	LeftHand = "LeftLowerArm",
	RightHand = "RightLowerArm",
	LeftUpperLeg = "LowerTorso",
	RightUpperLeg = "LowerTorso",
	LeftLowerLeg = "LeftUpperLeg",
	RightLowerLeg = "RightUpperLeg",
	LeftFoot = "LeftLowerLeg",
	RightFoot = "RightLowerLeg",

	Torso = "Head",
	['Left Arm'] = "Torso",
	['Right Arm'] = "Torso",
	['Left Leg'] = "Torso",
	['Right Leg'] = "Torso",

	Chest = "Head",
	Hips = "Chest",
	LeftArm = "Chest",
	LeftForearm = "LeftArm",
	RightArm = "Chest",
	RightForearm = "RightArm",
	LeftLeg = "Hips",
	LeftForeleg = "LeftLeg",
	RightLeg = "Hips",
	RightForeleg = "RightLeg"
}
if ts then
	From.LeftHand = "LeftForearm"
	From.RightHand = "RightForearm"
	From.LeftFoot = "LeftForeleg"
	From.RightFoot = "RightForeleg"
end
local supportedparts = {
	"CornerWedgePart",
	"Model",
	"NegateOperation",
	"Part",
	"TrussPart",
	"UnionOperation",
	"WedgePart"
}
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

function ApplyZIndex(obj,name,ontop)
	if ZIndexEnabled then
		local idx = (ontop and zindex_ontop[name]) or zindex[name]
		for i,v in next, obj do
			v.ZIndex = (find(i, "Outline") and idx - 1) or idx
		end
	end
end
function SetProp(obj,prop,value,outline)
	for i,v in next, obj do
		if (OUTLINES and outline and find(i, "Outline")) or (not outline and OUTLINES) then
			v[prop] = value
		end
	end
end
local Object = {
	Boxes = function()
		return {
			Outline = Drawingnew("Quad"),
			Box = Drawingnew("Quad")
		}
	end,
	Tracers = function()
		return {
			Outline = Drawingnew("Line"),
			Tracer = Drawingnew("Line")
		}
	end,
	Names = function()
		return {
			Name = Drawingnew("Text"),
			Data = Drawingnew("Text")
		}
	end,
	Skeletons = function()
		return (ts and { -- bad business
			ChestOutline = Drawingnew("Line"),
			HipsOutline = Drawingnew("Line"),
			LeftArmOutline = Drawingnew("Line"),
			LeftForearmOutline = Drawingnew("Line"),
			LeftHandOutline = Drawingnew("Line"),
			RightArmOutline = Drawingnew("Line"),
			RightForearmOutline = Drawingnew("Line"),
			RightHandOutline = Drawingnew("Line"),
			LeftLegOutline = Drawingnew("Line"),
			LeftForelegOutline = Drawingnew("Line"),
			LeftFootOutline = Drawingnew("Line"),
			RightLegOutline = Drawingnew("Line"),
			RightForelegOutline = Drawingnew("Line"),
			RightFootOutline = Drawingnew("Line"),

			Chest = Drawingnew("Line"),
			Hips = Drawingnew("Line"),
			LeftArm = Drawingnew("Line"),
			LeftForearm = Drawingnew("Line"),
			LeftHand = Drawingnew("Line"),
			RightArm = Drawingnew("Line"),
			RightForearm = Drawingnew("Line"),
			RightHand = Drawingnew("Line"),
			LeftLeg = Drawingnew("Line"),
			LeftForeleg = Drawingnew("Line"),
			LeftFoot = Drawingnew("Line"),
			RightLeg = Drawingnew("Line"),
			RightForeleg = Drawingnew("Line"),
			RightFoot = Drawingnew("Line")
		}) or { -- 42 objects btw
			-- R15
			UpperTorsoOutline = Drawingnew("Line"),
			LowerTorsoOutline = Drawingnew("Line"),
			LeftUpperArmOutline = Drawingnew("Line"),
			LeftLowerArmOutline = Drawingnew("Line"),
			LeftHandOutline = Drawingnew("Line"),
			RightUpperArmOutline = Drawingnew("Line"),
			RightLowerArmOutline = Drawingnew("Line"),
			RightHandOutline = Drawingnew("Line"),
			LeftUpperLegOutline = Drawingnew("Line"),
			LeftLowerLegOutline = Drawingnew("Line"),
			LeftFootOutline = Drawingnew("Line"),
			RightUpperLegOutline = Drawingnew("Line"),
			RightLowerLegOutline = Drawingnew("Line"),
			RightFootOutline = Drawingnew("Line"),

			UpperTorso = Drawingnew("Line"),
			LowerTorso = Drawingnew("Line"),
			LeftUpperArm = Drawingnew("Line"),
			LeftLowerArm = Drawingnew("Line"),
			LeftHand = Drawingnew("Line"),
			RightUpperArm = Drawingnew("Line"),
			RightLowerArm = Drawingnew("Line"),
			RightHand = Drawingnew("Line"),
			LeftUpperLeg = Drawingnew("Line"),
			LeftLowerLeg = Drawingnew("Line"),
			LeftFoot = Drawingnew("Line"),
			RightUpperLeg = Drawingnew("Line"),
			RightLowerLeg = Drawingnew("Line"),
			RightFoot = Drawingnew("Line"),
			-- R6
			TorsoOutline = Drawingnew("Line"),
			["Left ArmOutline"] = Drawingnew("Line"),
			["Right ArmOutline"] = Drawingnew("Line"),
			["Left LegOutline"] = Drawingnew("Line"),
			["Right LegOutline"] = Drawingnew("Line"),

			Torso = Drawingnew("Line"),
			["Left Arm"] = Drawingnew("Line"),
			["Right Arm"] = Drawingnew("Line"),
			["Left Leg"] = Drawingnew("Line"),
			["Right Leg"] = Drawingnew("Line")
		}
	end,
	HealthBars = function()
		return {
			Outline = Drawingnew("Quad"),
			Bar = Drawingnew("Quad")
		}
	end,
	HeadDots = function()
		return {
			Outline = Drawingnew("Circle"),
			Dot = Drawingnew("Circle")
		}
	end,
	LookTracers = function()
		return {
			Outline = Drawingnew("Line"),
			Tracer = Drawingnew("Line")
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
function Tracer(plr)
	local type = "Tracers"
	local objects = NewObject(type)
	local a = NewCharacterObject(objects, type, plr)
	function a:Remove()
		if a.Destroyed then return end
		objects.Tracer:Remove()
		objects.Outline:Remove()
		a.Destroyed = true
	end
	OBJECTS[ID] = a
end
function Name(plr)
	local type = "Names"
	local objects = NewObject(type)
	SetProp(objects, "Center", true)
	local a = NewCharacterObject(objects, type, plr)
	function a:Remove()
		if a.Destroyed then return end
		objects.Name:Remove()
		objects.Data:Remove()
		a.Destroyed = true
	end
	OBJECTS[ID] = a
end
function Skeleton(plr)
	local type = "Skeletons"
	local objects = NewObject(type)
	local a = NewCharacterObject(objects, type, plr)
	function a:Remove()
		if a.Destroyed then return end
		for _,v in next, objects do
			v:Remove()
		end
		a.Destroyed = true
	end
	OBJECTS[ID] = a
end
function HealthBar(plr)
	local type = "HealthBars"
	local objects = NewObject(type)
	SetProp(objects, "Thickness", 1)
	objects.Bar.Filled = true
	objects.Outline.Filled = false
	if ZIndexEnabled then objects.Outline.ZIndex = 2 end
	local a = NewCharacterObject(objects, type, plr)
	function a:Remove()
		if a.Destroyed then return end
		objects.Bar:Remove()
		objects.Outline:Remove()
		a.Destroyed = true
	end
	OBJECTS[ID] = a
end
function HeadDot(plr)
	local type = "HeadDots"
	local objects = NewObject(type)
	local a = NewCharacterObject(objects, type, plr)
	function a:Remove()
		if a.Destroyed then return end
		objects.Dot:Remove()
		objects.Outline:Remove()
		a.Destroyed = true
	end
	OBJECTS[ID] = a
end
function LookTracer(plr)
	local type = "LookTracers"
	local objects = NewObject(type)
	local a = NewCharacterObject(objects, type, plr)
	function a:Remove()
		if a.Destroyed then return end
		objects.Tracer:Remove()
		objects.Outline:Remove()
		a.Destroyed = true
	end
	OBJECTS[ID] = a
end

local props = {
	Labels = {
		Text = "string",
		Transparency = "number",
		Color = "Color3",
		RainbowColor = "boolean",
		Size = "number",
		Outline = "boolean",
		OutlineColor = "Color3",
		Font = "number",
		Offset = "Vector2"
	},
	Chams = {
		Transparency = "number",
		Color = "Color3",
		RainbowColor = "boolean",
		Thickness = "number",
		Filled = "boolean"
	}
}
function Label(part,options)
	ID += 1

	local type = "Labels"
	local objects = {
		Label = Drawingnew("Text")
	}
	objects.Label.Visible = false
	objects.Label.Center = true

	local o = {
		Text = options.Text or part.Name,
		Transparency = options.Transparency or 1,
		Color = options.Color or white,
		RainbowColor = ternary(options.RainbowColor ~= nil, options.RainbowColor, false),
		Size = options.Size or 18,
		Outline = ternary(options.Outline ~= nil, options.Outline, true),
		OutlineColor = options.OutlineColor or black,
		Font = options.Font or Fonts.UI,
		Offset = options.Offset or Vector2new()
	}
	
	ApplyZIndex(objects, type)
	local a,c,t = {Object = objects, Type = type, Part = part, Options = o, Destroyed = false, Id = ID}
	function a:SetPart(p)
		assert(typeof(p) == "Instance",("Universal Esp: bad argument #1 to 'SetPart' (Instance expected, got %s)"):format(typeof(p)))
		assert(table.find(supportedparts, part.ClassName),("Universal Esp: bad argument to #1 'SetPart' (Part or Model expected, got %s)"):format(p.ClassName))
		a.Part = p
		t.Part = p
	end
	function a:SetProp(prop,value)
		assert(prop ~= nil,"Universal Esp: bad argument #1 to 'SetProp' (property is nil)")
		assert(o[prop] ~= nil,"Universal Esp: bad argument #1 to 'SetProp' (invalid property)")
		local expected, got = props[type][prop], typeof(value)
		assert(expected == got,("Universal Esp: bad argument to #2 'SetProp' (%s expected, got %s)"):format(expected, got))
		if o[prop] == nil then return end
		o[prop] = value
		t.Options[prop] = value
	end
	function a:Remove()
		if a.Destroyed then return end
		objects.Label:Remove()
		c:Disconnect()
		a.Destroyed = true
	end
	c = part.AncestryChanged:Connect(function(_,p)
		if p == nil then
			a:Remove()
			return
		end
		a:SetPart(FindFirstChild(p, part.Name))
	end)
	OBJECTS[ID] = a
	t = OBJECTS[ID]
	return a
end
function Cham(part,options)
	ID += 1

	local type = "Chams"
	local objects = {
		Top = Drawingnew("Quad"),
		Bottom = Drawingnew("Quad"),
		Left = Drawingnew("Quad"),
		Right = Drawingnew("Quad"),
		Front = Drawingnew("Quad"),
		Back = Drawingnew("Quad")
	}
	local o = {
		Transparency = options.Transparency or 1,
		Color = options.Color or white,
		RainbowColor = ternary(options.RainbowColor ~= nil, options.RainbowColor, false),
		Thickness = options.Thickness or 3,
		Filled = ternary(options.Filled ~= nil, options.Filled, true)
	}
	ApplyZIndex(objects, type)
	local a,c,t = {Object = objects, Type = type, Part = part, Options = o, Destroyed = false, Id = ID}
	function a:SetPart(p)
		assert(typeof(p) == "Instance",("Universal Esp: bad argument #1 to 'SetPart' (Instance expected, got %s)"):format(typeof(p)))
		assert(table.find(supportedparts, part.ClassName),("Universal Esp: bad argument to #1 'SetPart' (Part or Model expected, got %s)"):format(p.ClassName))
		a.Part = p
		t.Part = p
	end
	function a:SetProp(prop,value)
		assert(prop ~= nil,"Universal Esp: bad argument #1 to 'SetProp' (property is nil)")
		assert(o[prop] ~= nil,"Universal Esp: bad argument #1 to 'SetProp' (invalid property)")
		local expected, got = props[type][prop], typeof(value)
		assert(expected == got,("Universal Esp: bad argument to #2 'SetProp' (%s expected, got %s)"):format(expected, got))
		o[prop] = value
		t.Options[prop] = value
	end
	function a:Remove()
		if a.Destroyed then return end
		for _,v in next, objects do
			v:Remove()
		end
		c:Disconnect()
		a.Destroyed = true
	end
	c = part.AncestryChanged:Connect(function(_,p)
		if p == nil then
			a:Remove()
			return
		end
		a:SetPart(FindFirstChild(p, part.Name))
	end)
	OBJECTS[ID] = a
	t = OBJECTS[ID]
	return a
end

function updateorigins()
	local x, y = camera.ViewportSize.X, camera.ViewportSize.Y
	origins = {
		top = Vector2new(x / 2, 0),
		center = Vector2new(x / 2, y / 2),
		bottom = Vector2new(x / 2, y),
		mouse = GetMouseLocation(uis)
	}
end
updateorigins()
local conn1 = camera:GetPropertyChangedSignal("ViewportSize"):Connect(updateorigins)

local lastupdate, refresh = osclock(), ss.RefreshRate
function update()
	refresh = mathclamp(ss.RefreshRate, 0, mathhuge)
	if osclock() - lastupdate < (refresh / 1000) then
		return
	end
	lastupdate = osclock()
	local mousepos = GetMouseLocation(uis)
	origins.mouse = mousepos
	local ffa, myteam, ccf, camfov = IsFFA(), GetTeam(player), camera.CFrame.Position, camera.FieldOfView
	for _,v in next, OBJECTS do
		if not v.Destroyed then
			if v.Player == nil and not v.Options then
				v:Remove()
			elseif v.Part == nil and v.Options then
				v:Remove()
			end
	
			local plr, part, obj, type, isnpc = v.Player, v.Part, v.Object, v.Type, v.NPC -- objects shit
			local cf, size, mid, inViewport, tl, tr, bl, br -- boxes shit
			local tlx, tly, tlz, trx, try, blx, bly, brx, bry, z -- boxes corner axes shit
			local c0, c1, c2, c3, c4, c5, c6, c7, c8 -- part corner positions shit
			local head, ltracerto -- head dots and look tracers shit
			local team, teamcolor -- team shit
			local char, health, maxhealth, mag, mousemag, render -- other shit
			local s = v.Options or ss[type] -- settings shit
			if VISIBLE and plr and IsAlive(plr) and s and s.Enabled then
				local hp = GetHealth(plr)
				char, health, maxhealth = GetChar(plr), hp[1], hp[2]
				cf, size = char:GetBoundingBox()
				team, teamcolor = GetTeam(plr), GetTeamColor(plr)
				mag = (ccf - cf.Position).Magnitude
				render = ffa or (not ss.TeamCheck or (not ffa and ss.TeamCheck and team ~= myteam)) and mag <= ss.MaximumDistance
				if render then
					if ss.FaceCamera then
						cf = CFramenew(cf.Position, ccf)
					end
					size /= 2
					local x, y = size.X, size.Y
					mid, inViewport = WorldToViewportPoint(camera, cf.Position)
					tl = WorldToViewportPoint(camera, (cf * CFramenew(-x,  y, 0)).Position)
					tr = WorldToViewportPoint(camera, (cf * CFramenew( x,  y, 0)).Position)
					bl = WorldToViewportPoint(camera, (cf * CFramenew(-x, -y, 0)).Position)
					br = WorldToViewportPoint(camera, (cf * CFramenew( x, -y, 0)).Position)

					tlx, tly, tlz = tl.X, tl.Y, tl.Z
					trx, try = tr.X, tr.Y
					blx, bly = bl.X, bl.Y
					brx, bry = br.X, br.Y
					z = mathclamp(1000 / tlz, 8, 12)

					if ss.FaceCamera and ss.AlignPoints then
						if tly < try then
							tly += mathabs(tly - try) / 2
						else
							tly += mathabs(try - tly) / 2
						end
						try = tly

						if bly < bry then
							bly += mathabs(bly - bry) / 2
						else
							bly += mathabs(bry - bly) / 2
						end
						bry = bly
					end

					if ts and FindFirstChild(char, "Body") then
						char = char.Body
					end
					if (type == "HeadDots" or type == "LookTracers") and FindFirstChild(char, "Head") then
						local headcf = char.Head.CFrame
						head = WorldToViewportPoint(camera, headcf.Position)
						if type == "LookTracers" then
							ltracerto = WorldToViewportPoint(camera, (headcf * CFramenew(0, 0, -s.Length)).Position)
						end
					end
					if mousevis.Enabled then
						local mags = {}
						tableinsert(mags, (mousepos - Vector2new(mid.X, mid.Y)).Magnitude)
						tableinsert(mags, (mousepos - Vector2new(tlx, tly)).Magnitude)
						tableinsert(mags, (mousepos - Vector2new(trx, try)).Magnitude)
						tableinsert(mags, (mousepos - Vector2new(blx, bly)).Magnitude)
						tableinsert(mags, (mousepos - Vector2new(brx, bry)).Magnitude)
						
						tablesort(mags, function(a,b)
							return a < b
						end)

						mousemag = mags[1]
					end
				end
			elseif VISIBLE and v.Part then
				local class = part.ClassName
				if find(class, "Part") or find(class, "Operation") then
					cf, size = part.CFrame, part.Size / 2
				elseif class == "Model" then
					cf, size = part:GetBoundingBox()
					size /= 2
				end
				local x, y, z = size.X, size.Y, size.Z
				c0, inViewport = WorldToViewportPoint(camera,cf.Position)
				if type == "Chams" then
					c1 = WorldToViewportPoint(camera, (cf * CFramenew( x,  y,  z)).Position)
					c2 = WorldToViewportPoint(camera, (cf * CFramenew(-x,  y,  z)).Position)
					c3 = WorldToViewportPoint(camera, (cf * CFramenew(-x, -y,  z)).Position)
					c4 = WorldToViewportPoint(camera, (cf * CFramenew( x, -y,  z)).Position)
					c5 = WorldToViewportPoint(camera, (cf * CFramenew( x,  y, -z)).Position)
					c6 = WorldToViewportPoint(camera, (cf * CFramenew(-x,  y, -z)).Position)
					c7 = WorldToViewportPoint(camera, (cf * CFramenew(-x, -y, -z)).Position)
					c8 = WorldToViewportPoint(camera, (cf * CFramenew( x, -y, -z)).Position)

					c1 = Vector2new(c1.X, c1.Y)
					c2 = Vector2new(c2.X, c2.Y)
					c3 = Vector2new(c3.X, c3.Y)
					c4 = Vector2new(c4.X, c4.Y)
					c5 = Vector2new(c5.X, c5.Y)
					c6 = Vector2new(c6.X, c6.Y)
					c7 = Vector2new(c7.X, c7.Y)
					c8 = Vector2new(c8.X, c8.Y)
				end
			end
			if VISIBLE then
				if plr and IsAlive(plr) and s and s.Enabled then
					SetProp(obj, "Visible", render)
					if s.Enabled and inViewport and render then
						local highlight = highlights.Enabled and tablefind(highlights.Players, plr.Name)
						local certified_npc = isnpc and npcs.Overrides[type]
						local color =		(highlight and highlights.Color) or
											 (certified_npc and (npcs.RainbowColor and fromHSV(tick() % 5 / 5, 1, 1) or npcs.Color)) or
											 (s.RainbowColor and fromHSV(tick() % 5 / 5, 1, 1)) or
											 (s.UseTeamColor and teamcolor) or
											 s.Color
						local transparency = (mousevis.Enabled and mousevis.Selected[type] and mousemag <= mousevis.Radius and mousevis.Transparency) or
											 (certified_npc and npcs.Transparency) or
											 (highlight and highlights.Transparency) or
											 s.Transparency
						--
						
						ApplyZIndex(obj, type, highlight and highlights.AlwaysOnTop)
						SetProp(obj, "Transparency", transparency)
						SetProp(obj, "Color", color)
						if type == "Boxes" then
							local box, out = obj.Box, obj.Outline
							box.Thickness = s.Thickness

							box.PointA = Vector2new(trx, try)
							box.PointB = Vector2new(tlx, tly)
							box.PointC = Vector2new(blx, bly)
							box.PointD = Vector2new(brx, bry)

							if OUTLINES then
								out.Visible = s.Outline and box.Visible
								if s.Outline then
									out.Color = s.OutlineColor
									out.Thickness = s.Thickness + s.OutlineThickness
									out.PointA = box.PointA
									out.PointB = box.PointB
									out.PointC = box.PointC
									out.PointD = box.PointD
								end
							end
						elseif type == "Tracers" then
							local thickness, outline, origin = s.Thickness, s.Outline, lower(s.Origin)
							local tracer, out = obj.Tracer, obj.Outline
							tracer.Thickness = thickness

							local from = origins[origin]
							local to = Vector2new(tlx + (trx - tlx) / 2, tly + (try - tly) / 2)
							tracer.From = from
							tracer.To = to
							if origin == "bottom" then
								to = Vector2new(blx + (brx - blx) / 2, bly + (bry - bly) / 2)
								tracer.To = to
							end

							if OUTLINES then
								out.Visible = outline and tracer.Visible
								if outline then
									out.Color = s.OutlineColor
									out.Thickness = thickness + s.OutlineThickness
									out.From = from
									out.To = to
								end
							end
						elseif type == "Names" then
							SetProp(obj, "Size", s.Size)
							SetProp(obj, "Outline", s.Outline)
							SetProp(obj, "OutlineColor", s.OutlineColor)
							SetProp(obj, "Font", s.Font)
							local name, data = obj.Name, obj.Data
							local h,l = (tly > try and tly) or try, (tly < try and tly) or try
							
							name.Position = Vector2new(tlx + (trx - tlx) / 2, (h + (l - h) / 2) - (s.Size + 2))
							data.Position = Vector2new(blx + (brx - blx) / 2, bly + (bry - bly) / 2)
							if ss.HealthBars.Enabled then
								data.Position = Vector2new(data.Position.X, data.Position.Y + z)
							end

							if isnpc then
								name.Text = "[NPC] "
							end
							name.Text = (s.UseDisplayName and plr.DisplayName) or plr.Name

							data.Text = ""
							if s.ShowDistance then
								data.Text = "[ "..mathfloor(mag)..s.DistanceDataType.." ]"
							end
							if s.ShowHealth then
								local a = lower(s.HealthDataType)
								if a == "percentage" then
									data.Text = data.Text.." [ "..mathfloor((health / maxhealth) * 100).."% ]"
								elseif a == "value" then
									data.Text = data.Text.." [ "..mathfloor(health).."/"..mathfloor(maxhealth).." ]"
								end
							end
						elseif type == "Skeletons" then
							local thickness, othickness, outline = s.Thickness, s.OutlineThickness, s.Outline
							SetProp(obj, "Thickness", thickness)
	
							for i2,v2 in next, obj do
								local from = FindFirstChild(char, From[i2] or "")
								local to = FindFirstChild(char, i2 or "")
								local isoutline = find(i2, "Outline")
								if not isoutline and from and find(from.ClassName, "Part") and to and find(to.ClassName, "Part") then
									local pos1, in1 = WorldToViewportPoint(camera, from.Position)
									local pos2, in2 = WorldToViewportPoint(camera, to.Position)
									v2.Visible = in1 and in2
									if in1 and in2 then
										v2.From = Vector2new(pos1.X, pos1.Y)
										v2.To = Vector2new(pos2.X, pos2.Y)
									end
								end
							end
							if OUTLINES then
								for i2,v2 in next, obj do
									if find(i2, "Outline") then
										local name = i2:gsub("Outline","")
										local v3 = obj[name]
										v2.Visible = outline and v3.Visible
										if v2.Visible then
											v2.Color = s.OutlineColor
											v2.Thickness = thickness + othickness
											v2.From = v3.From
											v2.To = v3.To
										end
									end
								end
							end
						elseif type == "HealthBars" then
							local outline, origin, baronly = s.Outline, s.Origin:lower(), s.OutlineBarOnly
							local bar, out = obj.Bar, obj.Outline
							health = mathclamp(health, 0, maxhealth) / maxhealth
							local left, right = blx, brx
							local lefty, righty = bly, bry

							if origin == "left" then
								left = (blx < brx and blx) or brx
								right = (blx > brx and blx) or brx

								lefty = (blx < brx and bly) or bry
								righty = (blx > brx and bly) or bry
							elseif origin == "right" then
								left = (blx < brx and brx) or blx
								right = (blx > brx and brx) or blx

								lefty = (blx < brx and bry) or bly
								righty = (blx > brx and bry) or bly
							end

							bar.PointA = Vector2new(
								left + (right - left) * health,
								(lefty + (righty - lefty) * health) + 5
							)
							bar.PointB = Vector2new(
								left,
								lefty + 5
							)
							bar.PointC = Vector2new(
								left,
								lefty + z
							)
							bar.PointD = Vector2new(
								left + (right - left) * health,
								(lefty + (righty - lefty) * health) + z
							)
	
							if OUTLINES then
								out.Visible = outline and bar.Visible
								if outline then
									out.Color = s.OutlineColor
									out.Thickness = s.OutlineThickness
									out.PointA = (baronly and bar.PointA) or Vector2new(brx, bry + 5)
									out.PointB = (baronly and bar.PointB) or Vector2new(blx, bly + 5)
									out.PointC = (baronly and bar.PointC) or Vector2new(blx, bly + z)
									out.PointD = (baronly and bar.PointD) or Vector2new(brx, bry + z)
								end
							end
						elseif type == "HeadDots" then
							if FindFirstChild(char, "Head") then
								local thickness, outline, filled = s.Thickness, s.Outline, s.Filled
								local dot, out = obj.Dot, obj.Outline
								dot.Thickness = thickness 
								dot.Filled = filled

								local pos = Vector2new(head.X, head.Y)
								local radius = z / ((mag / 60) * (camfov / 70)) * s.Scale
								dot.Position = pos
								dot.Radius = radius

								if OUTLINES then
									out.Visible = outline and dot.Visible
									if outline  then
										out.Color = s.OutlineColor
										out.Thickness = (filled and thickness + (s.OutlineThickness - 1)) or thickness + s.OutlineThickness
										out.Position = pos
										out.Radius = (filled and radius + 1) or radius
									end
								end
							else
								SetProp(obj, "Visible", false)
							end
						elseif type == "LookTracers" then
							if FindFirstChild(char, "Head") then
								local thickness, outline = s.Thickness, s.Outline
								local tracer, out = obj.Tracer, obj.Outline
								tracer.Thickness = thickness

								local from = Vector2new(head.X, head.Y)
								local to = Vector2new(ltracerto.X, ltracerto.Y)
								tracer.From = from
								tracer.To = to

								if OUTLINES then
									out.Visible = outline and tracer.Visible
									if outline then
										out.Color = s.OutlineColor
										out.Thickness = thickness + s.OutlineThickness
										out.From = from
										out.To = to
									end
								end
							else
								SetProp(obj, "Visible", false)
							end
						end
					end
				elseif part then
					SetProp(obj, "Visible", inViewport)
					if inViewport then
						local color = (s.RainbowColor and fromHSV(tick() % 5 / 5, 1, 1)) or s.Color
						SetProp(obj, "Transparency", s.Transparency)
						SetProp(obj, "Color", color)
						if type == "Labels" then
							local label = obj.Label
							label.Text = s.Text
							label.Size = s.Size
							label.Outline = s.Outline
							label.OutlineColor = s.OutlineColor
							label.Font = s.Font
	
							label.Position = Vector2new(c0.X, c0.Y - (s.Size) / 2) + s.Offset
						elseif type == "Chams" then
							local t, b, l, r, f, bb = obj.Top, obj.Bottom, obj.Left, obj.Right, obj.Front, obj.Back
							SetProp(obj, "Filled", s.Filled)
							SetProp(obj, "Thickness", s.Thickness)
	
							t.PointA = c5
							t.PointB = c6
							t.PointC = c2
							t.PointD = c1
	
							b.PointA = c4
							b.PointB = c3
							b.PointC = c7
							b.PointD = c8
	
							l.PointA = c2
							l.PointB = c6
							l.PointC = c7
							l.PointD = c3
	
							r.PointA = c5
							r.PointB = c1
							r.PointC = c4
							r.PointD = c8
	
							f.PointA = c1
							f.PointB = c2
							f.PointC = c3
							f.PointD = c4
	
							bb.PointA = c5
							bb.PointB = c6
							bb.PointC = c7
							bb.PointD = c8
						end
					end
				end
				if not inViewport or (v.Options == nil and not ss[type].Enabled) then
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
if typeof(ss.ToggleKey) == "EnumItem" then
	ss.ToggleKey = ss.ToggleKey.Name
end
local conn3 = uis.InputBegan:Connect(function(i,gp)
	if not gp and i.KeyCode == Enum.KeyCode[ss.ToggleKey] then
		VISIBLE = not VISIBLE
	end
end)
function doshit(v)
	Box(v)
	Skeleton(v)
	LookTracer(v)
	Tracer(v)
	HeadDot(v)
	HealthBar(v)
	Name(v)
end
for _,v in next, players:GetPlayers() do
	if v ~= player then
		doshit(v)
	end
end
local conn4 = players.PlayerAdded:Connect(doshit)

local esp = {Version = VERSION}
local destroyed = false

function ValidType(type)
	return type == "Other" or ss[type] ~= nil
end
function ValidOption(type,option)
	return (type == "Other" and ss[option] ~= nil) or ss[type][option] ~= nil
end
function esp:Toggle(type)
	assert(ValidType(type),"Universal Esp: bad argument to #1 'Toggle' (Invalid Type)")
	if ss[type].Enabled == nil then
		ss[type] = not ss[type]
	else
		ss[type].Enabled = not ss[type].Enabled
	end
end
function esp:Get(type,option)
	assert(ValidType(type),"Universal Esp: bad argument to #1 'Get' (Invalid Type)")
	assert(ValidOption(type, option),"Universal Esp: bad argument to #2 'Get' (Invalid Option)")
	if type == "Other" then
		return ss[option]
	end
	return ss[type][option]
end
function esp:Set(type,option,value)
	assert(ValidType(type),"Universal Esp: bad argument to #1 'Set' (Invalid Type)")
	assert(ValidOption(type, option),"Universal Esp: bad argument to #2 'Set' (Invalid Option)")
	assert(value ~= nil,"Universal Esp: bad argument to #3 'Set'")
	if type == "Other" then
		ss[option] = value
	else
		ss[type][option] = value
	end
end
function esp:SetAll(option,value)
	assert(Base[option] == nil,"Universal Esp: bad argument to #1 'SetAll' (Invalid Option)")
	assert(value ~= nil,"Universal Esp: bad argument to #2 'SetAll'")
	for i,v in next, ss do
		if typeof(v) == "table" and zindex[i] ~= nil then
			v[option] = value
		end
	end
end
function esp.Label(part,options)
	assert(typeof(part) == "Instance", ("Universal Esp: bad argument to #1 'Label' (Instance expected, got %s)"):format(typeof(part)))
	assert(table.find(supportedparts, part.ClassName),("Universal Esp: bad argument to #1 'Label' (Part or Model expected, got %s)"):format(part.ClassName))
	return Label(part, options or {})
end
function esp.Cham(part,options)
	assert(typeof(part) == "Instance",("Universal Esp: bad argument to #1 'Cham' (Instance expected, got %s)"):format(typeof(part)))
	assert(table.find(supportedparts, part.ClassName),("Universal Esp: bad argument to #1 'Cham' (Part or Model expected, got %s)"):format(part.ClassName))
	return Cham(part, options or {})
end
function esp:GetObjects(a)
	a = a or ""
	local t = typeof(a)
	if (t == "Instance" and a.ClassName == "Player") or (t == "string" and FindFirstChild(players, a)) then
		local plr = (t == "string" and players[a]) or a
		local objects = {
			['Boxes'] = nil,
			['Tracers'] = nil,
			['Names'] = nil,
			['Skeletons'] = nil,
			['HealthBars'] = nil,
			['HeadDots'] = nil,
			['LookTracers'] = nil
		}
		for _,v in next, OBJECTS do
			if v.Player == plr then
				objects[v.Type] = v
			end
		end
		return objects
	elseif typeof(a) == "string" then
		if zindex[a] ~= nil then
			local objects = {}
			for _,v in next, OBJECTS do
				if v.Type == a then
					tableinsert(objects, v)
				end
			end
			return objects
		elseif a == "" then
			return OBJECTS
		end
	end
	return {}
end
function esp:GetTotalObjects()
	local data = {
		DrawingObjects = 0,
		VisibleObjects = 0,
		DestroyedObjects = 0,
		Boxes = 0,
		Tracers = 0,
		Names = 0,
		Skeletons = 0,
		HealthBars = 0,
		HeadDots = 0,
		LookTracers = 0,
		Labels = 0,
		Chams = 0,
		Outlines = 0
	}
	for _,v in next, OBJECTS do
		for i2,v2 in next, v.Object do
			if not v.Destroyed then
				data.DrawingObjects += 1
				if v2.Visible then
					data.VisibleObjects += 1
				end
				if find(i2, "Outline") then
					data.Outlines += 1
				else
					data[v.Type] += 1
				end
			end
		end
	end
	return data
end
function hasesp(a)
	for _,v in next, OBJECTS do
		if v.Player ~= nil and v.Player == a and not v.Destroyed then
			return true
		end
	end
	return false
end
function esp:Add(a)
	a = a or ""
	local t = typeof(a)
	if (t == "Instance" and a.ClassName == "Player" or a.ClassName == "Model") or (t == "string" and FindFirstChild(players, a)) then
		local plr = (t == "string" and players[a]) or a
		if not hasesp(plr) then
			doshit(plr)
		end
	end
end
function esp:Remove(a)
	a = a or ""
	local t = typeof(a)
	if (t == "Instance" and a.ClassName == "Player" or a.ClassName == "Model") or (t == "string" and FindFirstChild(players, a)) then
		local plr = (t == "string" and players[a]) or a
		if hasesp(plr) then
			for _,v in next, OBJECTS do
				if v.Player ~= nil and v.Player == plr then
					v:Remove()
				end
			end
		end
	end
end
--[[function esp:DisableOutlines()
	OUTLINES = false
	for _,v in next, OBJECTS do
		for i2,v2 in next, v.Object do
			if i2:find("Outline") then
				v2:Remove()
			end
		end
	end
end]]
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
	conn1:Disconnect()
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
