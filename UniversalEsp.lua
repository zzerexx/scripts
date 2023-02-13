--[[
v1.7.1 Changes
- Made a few synchronization changes to prevent errors on Synapse

UI Changes
- No UI changes
]]

local VERSION = "v1.7.1"

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
			Method = "Hover", -- "Radius" or "Hover" | Hover is newest method and is a lot more accurate than Radius
			HoverRadius = 50,
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
			OutlineThickness = 1,
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
			OutlineThickness = 1,
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
			OutlineThickness = 1,
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
			OutlineThickness = 1,
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
			OutlineThickness = 1,
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
			OutlineThickness = 1,
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
local mathmin = math.min
local mathmax = math.max
local lower = string.lower
local find = string.find
local osclock = os.clock
local next = next
local tick = tick
local typeof = typeof
local taskspawn = task.spawn
local taskdesync = task.desynchronize
local tasksync = task.synchronize
local taskwait = task.wait
local profbegin = debug and debug.profilebegin or function() end
local profend = debug and debug.profileend or function() end
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
	['mm2'] = 66654135
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
local white, black = fromRGB(255,255,255), fromRGB(0,0,0)
local getEntry, ts, characters, teams, rp
if (GameId == gids.pf) or (GameId == gids.pft) or (GameId == gids.pfu) then
	local require = rawget(getrenv().shared, "require")
	if require == nil then
		setclipboard('loadstring(game:HttpGet("https://raw.githubusercontent.com/Spoorloos/scripts/main/pf-actor-bypass.lua"))()')
		local a = Instance.new("Message", game.CoreGui)
		a.Text = "-- Universal Esp Notice --\n\nA script has been copied to your clipboard.\nPlease put this script in your exploit's autoexec folder and rejoin the game.\n(this script is required to bypass the new update)\n\nbypass was created by Spoorloos"
		return
	else
		local _cache = rawget(debug.getupvalue(require, 1), "_cache")
		local ReplicationInterface = rawget(rawget(_cache, "ReplicationInterface"), "module")
		getEntry = rawget(ReplicationInterface, "getEntry")
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
	rp = true
	-- CREDIT TO THIS DUDE FOR CRASH FIX https://v3rmillion.net/showthread.php?pid=8248169#pid8248169
	--loadstring(game:HttpGet("https://raw.githubusercontent.com/Github-Account-39021832/Rush-Point-Fix-Crash/main/src.lua"))()
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
	"WedgePart",
	"MeshPart"
}

local PlayerObjects = {}

local setidentity = setidentity or setthreadidentity or set_thread_identity or setthreadcontext or set_thread_context or (syn and syn.set_thread_identity) or nil
function safecall(func, env, ...)
	if not setidentity then
		return func(...)
	end

	local suc, env = pcall(getsenv, env)
	return coroutine.wrap(function(...)
		setidentity(2)
		if suc then
			setfenv(0, env)
			setfenv(1, env)
		end
		return func(...)
	end)(...)
end

local oldfuncs = {}

function IsAlive(plr)
	if plr.ClassName == "Model" then
		return true
	end

	local humanoid = plr.Character and plr.Character:FindFirstChild("Humanoid") or nil
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

	local a = plr.Character and plr.Character:FindFirstChild("Humanoid") or nil
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
		if team == nil then
			return true
		end

		team = team.Name or team
		if t[team] then
			return true
		else
			tableinsert(t, team)
		end
	end
	return #t == 1
end

do -- compatibility
	if getEntry then -- phantom forces
		local cache = {}
		GetChar = function(plr)
			local obj = getEntry(plr)
			if obj ~= nil then
				local char = obj.Character
				if char and char.Parent ~= nil then
					return char
				end
			end
			return nil
		end
		IsAlive = GetChar
		GetHealth = function(plr)
			local obj = getEntry(plr)
			if obj ~= nil then
				return {mathfloor(obj.Health), 100}
			end
			return nil
		end
	end
	
	if ts then -- bad business
		local settings = game:GetService("ReplicatedStorage"):WaitForChild("PlayerData"):WaitForChild(player.Name):WaitForChild("Settings")
		local function getcolor(a)
			local b = settings:WaitForChild(string.format("Team%sColor", a)).Value:split(",")
			for i,v in next, b do
				b[i] = tonumber(v) / 100
			end
			return fromHSV(unpack(b))
		end
		local teamcolors = {
			Survivors = getcolor("Survivors"),
			Infected = getcolor("Infected"),
			FFA = getcolor("FFA"),
			Beta = getcolor("Beta"),
			Omega = getcolor("Omega")
		}
		
		hookfunction(PluginManager, error) -- prevent crash
		GetChar = function(plr)
			return characters:GetCharacter(plr)
		end
		IsAlive = GetChar
		GetHealth = function(plr)
			local a = GetChar(plr)
			local hp = a:FindFirstChild("Health")
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
		local mapfolder = workspace:WaitForChild("MapFolder")
		local playerfolder = mapfolder:WaitForChild("Players")
		local gamestats = mapfolder:WaitForChild("GameStats")
		GetChar = function(plr)
			return playerfolder:FindFirstChild(plr.Name)
		end
		IsAlive = GetChar
		GetHealth = function(plr)
			local char = GetChar(plr) if not char then return {0, 100} end
			local humanoid = char:FindFirstChildOfClass("Humanoid") if not humanoid then return {0, 100} end
			return {mathfloor(humanoid.Health), mathfloor(humanoid.MaxHealth)}
		end
		GetTeam = function(plr)
			local char = GetChar(plr) if not char then return "" end
			local team = char:FindFirstChild("Team") if not team then return "" end
			return team.Value
		end
		GetTeamColor = function(plr)
			local char = GetChar(plr) if not char then return white end
			local outline = char:FindFirstChild("OutlineESP") if not outline then return white end
			return outline.OutlineColor
		end
		IsFFA = function()
			return gamestats.GameMode.Value == "Deathmatch"
		end
	end

	if GameId == gids.mm2 then
		local sheriff = Color3.new(0, 0, 1)
		local murderer = Color3.new(1, 0, 0)
		local innocent = Color3.new(0, 1, 0)
		GetTeam = function(plr)
			local backpack = plr.Backpack
			local char = GetChar(plr)
			if (backpack and backpack:FindFirstChild("Gun")) or (char and char:FindFirstChild("Gun")) then
				return "Sheriff"
			elseif (backpack and backpack:FindFirstChild("Knife")) or (char and char:FindFirstChild("Knife")) then
				return "Murderer"
			end
			return "Innocent"
		end
		GetTeamColor = function(plr)
			local backpack = plr.Backpack
			local char = GetChar(plr)
			if (backpack and backpack:FindFirstChild("Gun")) or (char and char:FindFirstChild("Gun")) then
				return sheriff
			elseif (backpack and backpack:FindFirstChild("Knife")) or (char and char:FindFirstChild("Knife")) then
				return murderer
			end
			return innocent
		end
	end
end

oldfuncs.alive = IsAlive
oldfuncs.character = GetChar
oldfuncs.health = GetHealth
oldfuncs.team = GetTeam
oldfuncs.teamcolor = GetTeamColor
oldfuncs.ffa = IsFFA

----

function ternary(condition, truevalue, falsevalue)
	if condition then
		return truevalue
	end
	return falsevalue
end

function ApplyZIndex(obj, name, ontop)
	if ZIndexEnabled then
		local idx = (ontop and zindex_ontop[name]) or zindex[name]
		for i,v in next, obj do
			v.ZIndex = (find(i, "Outline") and idx - 1) or idx
		end
	end
end
function SetProp(obj, prop, value, outline)
	tasksync()
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
	end,
	Labels = function()
		return {
			Label = Drawingnew("Text")
		}
	end,
	Chams = function()
		return {
			Top = Drawingnew("Quad"),
			Bottom = Drawingnew("Quad"),
			Left = Drawingnew("Quad"),
			Right = Drawingnew("Quad"),
			Front = Drawingnew("Quad"),
			Back = Drawingnew("Quad")
		}
	end
}
local RemoveFunction = {
	Boxes = function(self)
		if self.Destroyed then return end
		self.Object.Box:Remove()
		self.Object.Outline:Remove()
		self.Destroyed = true
	end,
	Tracers = function(self)
		if self.Destroyed then return end
		self.Object.Tracer:Remove()
		self.Object.Outline:Remove()
		self.Destroyed = true
	end,
	Names = function(self)
		if self.Destroyed then return end
		self.Object.Name:Remove()
		self.Object.Data:Remove()
		self.Destroyed = true
	end,
	Skeletons = function(self)
		if self.Destroyed then return end
		for _,v in next, self.Object do
			v:Remove()
		end
		self.Destroyed = true
	end,
	HealthBars = function(self)
		if self.Destroyed then return end
		self.Object.Bar:Remove()
		self.Object.Outline:Remove()
		self.Destroyed = true
	end,
	HeadDots = function(self)
		if self.Destroyed then return end
		self.Object.Dot:Remove()
		self.Object.Outline:Remove()
		self.Destroyed = true
	end,
	LookTracers = function(self)
		if self.Destroyed then return end
		self.Object.Tracer:Remove()
		self.Object.Outline:Remove()
		self.Destroyed = true
	end,
	Labels = function(self)
		if self.Destroyed then return end
		self.Object.Label:Remove()
		self.AncestryChanged:Disconnect()
		self.Destroyed = true
	end,
	Chams = function(self)
		if self.Destroyed then return end
		self.Object.Top:Remove()
		self.Object.Bottom:Remove()
		self.Object.Left:Remove()
		self.Object.Right:Remove()
		self.Object.Front:Remove()
		self.Object.Back:Remove()
		self.AncestryChanged:Disconnect()
		self.Destroyed = true
	end
}
function NewObject(type) -- create the actual drawing objects
	tasksync()
	local obj = Object[type]()
	SetProp(obj, "Visible", false)
	ApplyZIndex(obj, type)
	taskdesync()
	return obj
end
function NewCharacterObject(objs, type, plr) -- create data object for players and npcs
	ID += 1

	local t = {
		Object = objs,
		Type = type,
		Player = plr,
		NPC = plr.ClassName ~= "Player",
		Destroyed = false,
		Id = ID,
		Remove = RemoveFunction[type]
	}

	OBJECTS[ID] = t

	return t
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
function PartSetPart(self, p) -- SetPart function for labels and chams
	assert(typeof(p) == "Instance", ("Universal Esp: bad argument #1 to 'SetPart' (Instance expected, got %s)"):format(typeof(p)))
	assert(tablefind(supportedparts, p.ClassName), ("Universal Esp: bad argument #1 to 'SetPart' (BasePart or Model expected, got %s)"):format(p.ClassName))
	self.Part = p
end
function PartSetProp(self, prop, value) -- SetProp function for labels and chams
	assert(prop ~= nil, "Universal Esp: bad argument #1 to 'SetProp' (property is nil)")
	assert(self.Options[prop] ~= nil, "Universal Esp: bad argument #1 to 'SetProp' (invalid property)")
	local expected, got = props[self.Type][prop], typeof(value)
	assert(expected == got,("Universal Esp: bad argument to #2 'SetProp' (%s expected, got %s)"):format(expected, got))
	self.Options[prop] = value
end
function NewPartObject(objs, type, part, options) -- create data object for parts and models
	ID += 1
	tasksync()

	local t = {
		Object = objs,
		Type = type,
		Part = part,
		Options = options,
		Destroyed = false,
		Id = ID,
		AncestryChanged = nil,
		SetPart = PartSetPart,
		SetProp = PartSetProp,
		Remove = RemoveFunction[type]
	}
	t.AncestryChanged = part.AncestryChanged:Connect(function(_, parent)
		if parent == nil then
			t:Remove()
			return
		end
		t:SetPart(parent:FindFirstChild(part.Name))
	end)
	taskdesync()

	OBJECTS[ID] = t

	return t
end

local ss = getgenv().EspSettings
local origins = {}
local mousepos = Vector2.zero
local ffa = IsFFA()
local myteam = GetTeam(player)
local ccf = camera.CFrame.Position
local camfov = camera.FieldOfView
local rainbow = fromHSV(tick() % 5 / 5, 1, 1)
local teamcheck = ss.TeamCheck
local maxdist = ss.MaximumDistance
local facecamera = ss.FaceCamera
local alignpoints = ss.AlignPoints
local refreshrate = ss.RefreshRate / 1000

local mv_enabled = mousevis.Enabled
local mv_selected = mousevis.Selected
local mv_transparency = mousevis.Transparency
local mv_method = mousevis.Method and lower(mousevis.Method) or nil
local mv_radius = mousevis.Radius
local mv_hoverradius = mousevis.HoverRadius or 10

local hl_enabled = highlights.Enabled
local hl_players = highlights.Players
local hl_color = highlights.Color 
local hl_transparency = highlights.Transparency
local hl_ontop = highlights.AlwaysOnTop

local npc_overrides = npcs.Overrides
local npc_color = npcs.Color
local npc_transparency = npcs.Transparency
local npc_rainbow = npcs.Rainbow

local Boxes = ss.Boxes
local Tracers = ss.Tracers
local Names = ss.Names
local Skeletons = ss.Skeletons
local HealthBars = ss.HealthBars
local HeadDots = ss.HeadDots
local LookTracers = ss.LookTracers
function UpdateVariables() -- set variables once per frame so it doesnt have to do it multiple times
	ss = getgenv().EspSettings
	mousepos = GetMouseLocation(uis)
	local x, y = camera.ViewportSize.X, camera.ViewportSize.Y
	origins = {
		top = Vector2new(x / 2, 0),
		center = Vector2new(x / 2, y / 2),
		bottom = Vector2new(x / 2, y),
		mouse = mousepos
	}
	ffa = IsFFA()
	myteam = GetTeam(player)
	ccf = camera.CFrame.Position
	camfov = camera.FieldOfView
	rainbow = fromHSV(tick() % 5 / 5, 1, 1)
	teamcheck = ss.TeamCheck
	maxdist = ss.MaximumDistance
	facecamera = ss.FaceCamera
	alignpoints = ss.AlignPoints
	refreshrate = ss.RefreshRate / 1000
	mv_enabled = mousevis.Enabled
	mv_selected = mousevis.Selected
	mv_transparency = mousevis.Transparency
	mv_method = mousevis.Method and lower(mousevis.Method) or nil
	mv_radius = mousevis.Radius
	mv_hoverradius = mousevis.HoverRadius
	hl_enabled = highlights.Enabled
	hl_players = highlights.Players
	hl_color = highlights.Color 
	hl_transparency = highlights.Transparency
	hl_ontop = highlights.Always
	npc_overrides = npcs.Overrides
	npc_color = npcs.Color
	npc_transparency = npcs.Transparency
	npc_rainbow = npcs.Rainbow
	ss = getgenv().EspSettings
	Boxes = ss.Boxes
	Tracers = ss.Tracers
	Names = ss.Names
	Skeletons = ss.Skeletons
	HealthBars = ss.HealthBars
	HeadDots = ss.HeadDots
	LookTracers = ss.LookTracers
end
UpdateVariables()
local conn2 = RunService.Heartbeat:Connect(UpdateVariables)
function UpdateObjects(self) -- update esp objects for players and npcs
	taskdesync()

	local plr, isnpc = self.Player, self.NPC
	local cf, size, mid, inViewport, tl, tr, bl, br
	local tlx, tly, tlz, trx, try, blx, bly, brx, bry, z
	local head, ltracerto
	local team, teamcolor
	local health, maxhealth, mag, overlapping, render
	local char = plr and GetChar(plr)

	local objs = self.Objects
	local box = objs.Box.Object
	local tracer = objs.Tracer.Object
	local name = objs.Name.Object
	local skeleton = objs.Skeleton.Object
	local bar = objs.HealthBar.Object
	local dot = objs.HeadDot.Object
	local ltracer = objs.LookTracer.Object

	if VISIBLE and char then
		local hp = GetHealth(plr)
		health, maxhealth = hp[1], hp[2]
		tasksync()
		cf, size = char:GetBoundingBox()
		taskdesync()
		team, teamcolor = GetTeam(plr), GetTeamColor(plr)
		mag = (ccf - cf.Position).Magnitude
		render = (ffa or (not teamcheck or (not ffa and teamcheck and team ~= myteam))) and mag <= maxdist
		mid, inViewport = WorldToViewportPoint(camera, cf.Position)

		local BOXES = Boxes.Enabled
		local TRACERS = Tracers.Enabled
		local NAMES = Names.Enabled
		local SKELETONS = Skeletons.Enabled
		local HEALTHBARS = HealthBars.Enabled
		local HEADDOTS = HeadDots.Enabled
		local LOOKTRACERS = LookTracers.Enabled

		SetProp(box, "Visible", render and inViewport and BOXES)
		SetProp(tracer, "Visible", render and inViewport and TRACERS)
		SetProp(name, "Visible", render and inViewport and NAMES)
		SetProp(skeleton, "Visible", render and inViewport and SKELETONS)
		SetProp(bar, "Visible", render and inViewport and HEALTHBARS)
		SetProp(dot, "Visible", render and inViewport and HEADDOTS)
		SetProp(ltracer, "Visible", render and inViewport and LOOKTRACERS)

		if render and inViewport then
			do
				if facecamera then
					cf = CFramenew(cf.Position, ccf)
				end
				size /= 2
				local x, y = size.X, size.Y
				--mid, inViewport = WorldToViewportPoint(camera, cf.Position)
				tl = WorldToViewportPoint(camera, (cf * CFramenew(-x,  y, 0)).Position)
				tr = WorldToViewportPoint(camera, (cf * CFramenew( x,  y, 0)).Position)
				bl = WorldToViewportPoint(camera, (cf * CFramenew(-x, -y, 0)).Position)
				br = WorldToViewportPoint(camera, (cf * CFramenew( x, -y, 0)).Position)
	
				tlx, tly, tlz = tl.X, tl.Y, tl.Z
				trx, try = tr.X, tr.Y
				blx, bly = bl.X, bl.Y
				brx, bry = br.X, br.Y
				z = mathclamp(1000 / tlz, 8, 12)
	
				if facecamera and alignpoints then
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
	
				if ts and char:FindFirstChild("Body") then -- BAD BUSINESS
					char = char.Body
				end
	
				if mv_enabled then
					local method = mv_method
					if method == "radius" or not method then
						local mags = {}
						tableinsert(mags, (mousepos - Vector2new(mid.X, mid.Y)).Magnitude)
						tableinsert(mags, (mousepos - Vector2new(tlx, tly)).Magnitude)
						tableinsert(mags, (mousepos - Vector2new(trx, try)).Magnitude)
						tableinsert(mags, (mousepos - Vector2new(blx, bly)).Magnitude)
						tableinsert(mags, (mousepos - Vector2new(brx, bry)).Magnitude)
						
						tablesort(mags, function(a,b)
							return a < b
						end)
	
						overlapping = mags[1] <= mv_radius
					elseif method == "hover" then
						local x_min = mathmin(tlx, trx, blx, brx) - mv_hoverradius
						local x_max = mathmax(tlx, trx, blx, brx) + mv_hoverradius
	
						local y_min_offset = 0
						local y_max_offset = 0
						if Names.Enabled then
							y_min_offset = Names.Size - 2
							if Names.ShowHealth or Names.ShowDistance then
								y_max_offset += Names.Size + 2
							end
						end
						if HealthBars.Enabled then
							y_max_offset += z 
						end
						local y_min = mathmin(tly, try, bly, bry) - y_min_offset - mv_hoverradius
						local y_max = mathmax(tly, try, bly, bry) + y_max_offset + mv_hoverradius
	
						local mousex = mousepos.X
						local mousey = mousepos.Y
	
						overlapping = mousex > x_min and mousex < x_max and mousey > y_min and mousey < y_max
					end
				end
			end

			local highlight = hl_enabled and tablefind(hl_players, plr.Name)

			if BOXES then
				local type = "Boxes"
				local certified_npc = isnpc and npc_overrides[type]
				local color =		(highlight and hl_color) or 
									 (certified_npc and (npc_rainbow and rainbow or npc_color)) or
									 (Boxes.RainbowColor and rainbow) or
									 (Boxes.UseTeamColor and teamcolor) or
									 Boxes.Color
				local transparency = (mv_enabled and mv_selected[type] and overlapping and mv_transparency) or
									 (certified_npc and npc_transparency) or
									 (highlight and hl_transparency) or
									 Boxes.Transparency
				ApplyZIndex(box, type, highlight and hl_ontop)
				SetProp(box, "Color", color)
				SetProp(box, "Transparency", transparency)

				local box, out = box.Box, box.Outline
				box.Thickness = Boxes.Thickness
				box.PointA = Vector2new(trx, try)
				box.PointB = Vector2new(tlx, tly)
				box.PointC = Vector2new(blx, bly)
				box.PointD = Vector2new(brx, bry)

				if OUTLINES then
					out.Visible = Boxes.Outline and box.Visible
					if Boxes.Outline then
						out.Color = Boxes.OutlineColor
						out.Thickness = Boxes.Thickness + (Boxes.OutlineThickness * 2)
						out.PointA = box.PointA
						out.PointB = box.PointB
						out.PointC = box.PointC
						out.PointD = box.PointD
					end
				end
			end
	
			if TRACERS then
				local type = "Tracers"
				local certified_npc = isnpc and npc_overrides[type]
				local color =		(highlight and hl_color) or 
									 (certified_npc and (npc_rainbow and rainbow or npc_color)) or
									 (Tracers.RainbowColor and rainbow) or
									 (Tracers.UseTeamColor and teamcolor) or
									 Tracers.Color
				local transparency = (mv_enabled and mv_selected[type] and overlapping and mv_transparency) or
									 (certified_npc and npc_transparency) or
									 (highlight and hl_transparency) or
									 Tracers.Transparency
				ApplyZIndex(tracer, type, highlight and hl_ontop)
				SetProp(tracer, "Color", color)
				SetProp(tracer, "Transparency", transparency)

				local thickness, outline, origin = Tracers.Thickness, Tracers.Outline, lower(Tracers.Origin)
				local tracer, out = tracer.Tracer, tracer.Outline
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
						out.Color = Tracers.OutlineColor
						out.Thickness = thickness + (Tracers.OutlineThickness * 2)
						out.From = from
						out.To = to
					end
				end
			end
	
			if NAMES then
				local type = "Names"
				local certified_npc = isnpc and npc_overrides[type]
				local color =		(highlight and hl_color) or 
									 (certified_npc and (npc_rainbow and rainbow or npc_color)) or
									 (Names.RainbowColor and rainbow) or
									 (Names.UseTeamColor and teamcolor) or
									 Names.Color
				local transparency = (mv_enabled and mv_selected[type] and overlapping and mv_transparency) or
									 (certified_npc and npc_transparency) or
									 (highlight and hl_transparency) or
									 Names.Transparency
				ApplyZIndex(name, type, highlight and hl_ontop)
				SetProp(name, "Color", color)
				SetProp(name, "Transparency", transparency)

				SetProp(name, "Size", Names.Size)
				SetProp(name, "Outline", Names.Outline)
				SetProp(name, "OutlineColor", Names.OutlineColor)
				SetProp(name, "Font", Names.Font)
				local name, data = name.Name, name.Data
				local h,l = (tly > try and tly) or try, (tly < try and tly) or try
				
				name.Position = Vector2new(tlx + (trx - tlx) / 2, (h + (l - h) / 2) - (Names.Size + 2))
				data.Position = Vector2new(blx + (brx - blx) / 2, bly + (bry - bly) / 2)
				if ss.HealthBars.Enabled then
					data.Position = Vector2new(data.Position.X, data.Position.Y + z)
				end

				if isnpc then
					name.Text = "[NPC] "
				end
				name.Text = (Names.UseDisplayName and plr.DisplayName) or plr.Name

				data.Text = ""
				if Names.ShowDistance then
					data.Text = "[ "..mathfloor(mag)..Names.DistanceDataType.." ]"
				end
				if Names.ShowHealth then
					local a = lower(Names.HealthDataType)
					if a == "percentage" then
						data.Text = data.Text.." [ "..mathfloor((health / maxhealth) * 100).."% ]"
					elseif a == "value" then
						data.Text = data.Text.." [ "..mathfloor(health).."/"..mathfloor(maxhealth).." ]"
					end
				end
			end
	
			if SKELETONS then
				local type = "Skeletons"
				local certified_npc = isnpc and npc_overrides[type]
				local color =		(highlight and hl_color) or 
									 (certified_npc and (npc_rainbow and rainbow or npc_color)) or
									 (Skeletons.RainbowColor and rainbow) or
									 (Skeletons.UseTeamColor and teamcolor) or
									 Skeletons.Color
				local transparency = (mv_enabled and mv_selected[type] and overlapping and mv_transparency) or
									 (certified_npc and npc_transparency) or
									 (highlight and hl_transparency) or
									 Skeletons.Transparency
				ApplyZIndex(skeleton, type, highlight and hl_ontop)
				SetProp(skeleton, "Color", color)
				SetProp(skeleton, "Transparency", transparency)
				
				local thickness, othickness, outline = Skeletons.Thickness, Skeletons.OutlineThickness, Skeletons.Outline
				SetProp(skeleton, "Thickness", thickness)

				for i2,v2 in next, skeleton do
					local from = char:FindFirstChild(From[i2] or "")
					local to = char:FindFirstChild(i2 or "")
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
					for i2,v2 in next, skeleton do
						if find(i2, "Outline") then
							local name = i2:gsub("Outline","")
							local v3 = skeleton[name]
							v2.Visible = outline and v3.Visible
							if v2.Visible then
								v2.Color = Skeletons.OutlineColor
								v2.Thickness = thickness + (othickness * 2)
								v2.From = v3.From
								v2.To = v3.To
							end
						end
					end
				end
			end
	
			if HEALTHBARS then
				local type = "HealthBars"
				local certified_npc = isnpc and npc_overrides[type]
				local color =		(highlight and hl_color) or 
									 (certified_npc and (npc_rainbow and rainbow or npc_color)) or
									 (HealthBars.RainbowColor and rainbow) or
									 (HealthBars.UseTeamColor and teamcolor) or
									 HealthBars.Color
				local transparency = (mv_enabled and mv_selected[type] and overlapping and mv_transparency) or
									 (certified_npc and npc_transparency) or
									 (highlight and hl_transparency) or
									 HealthBars.Transparency
				ApplyZIndex(bar, type, highlight and hl_ontop)
				SetProp(bar, "Color", color)
				SetProp(bar, "Transparency", transparency)

				local outline, origin, baronly = HealthBars.Outline, HealthBars.Origin:lower(), HealthBars.OutlineBarOnly
				local bar, out = bar.Bar, bar.Outline
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
						out.Color = HealthBars.OutlineColor
						out.Thickness = HealthBars.OutlineThickness * 2
						out.PointA = (baronly and bar.PointA) or Vector2new(brx, bry + 5)
						out.PointB = (baronly and bar.PointB) or Vector2new(blx, bly + 5)
						out.PointC = (baronly and bar.PointC) or Vector2new(blx, bly + z)
						out.PointD = (baronly and bar.PointD) or Vector2new(brx, bry + z)
					end
				end
			end
	
			if HEADDOTS then
				local type = "HeadDots"
				local certified_npc = isnpc and npc_overrides[type]
				local color =		(highlight and hl_color) or 
									 (certified_npc and (npc_rainbow and rainbow or npc_color)) or
									 (HeadDots.RainbowColor and rainbow) or
									 (HeadDots.UseTeamColor and teamcolor) or
									 HeadDots.Color
				local transparency = (mv_enabled and mv_selected[type] and overlapping and mv_transparency) or
									 (certified_npc and npc_transparency) or
									 (highlight and hl_transparency) or
									 HeadDots.Transparency
				ApplyZIndex(dot, type, highlight and hl_ontop)
				SetProp(dot, "Color", color)
				SetProp(dot, "Transparency", transparency)

				head = char:FindFirstChild("Head")
				if head then
					local headcf = head.CFrame
					head = WorldToViewportPoint(camera, headcf.Position)
				end

				if head then
					local thickness, outline, filled = HeadDots.Thickness, HeadDots.Outline, HeadDots.Filled
					local dot, out = dot.Dot, dot.Outline
					dot.Thickness = thickness 
					dot.Filled = filled

					local pos = Vector2new(head.X, head.Y)
					local radius = z / ((mag / 60) * (camfov / 70)) * HeadDots.Scale
					dot.Position = pos
					dot.Radius = radius

					if OUTLINES then
						out.Visible = outline and dot.Visible
						if outline  then
							local othickness = thickness + (HeadDots.OutlineThickness * 2)
							out.Color = HeadDots.OutlineColor
							out.Thickness = (filled and thickness + (othickness - 1)) or othickness
							out.Position = pos
							out.Radius = (filled and radius + 1) or radius
						end
					end
				else
					SetProp(dot, "Visible", false)
				end
			end
	
			if LOOKTRACERS then
				local type = "LookTracers"
				local certified_npc = isnpc and npc_overrides[type]
				local color =		(highlight and hl_color) or 
									 (certified_npc and (npc_rainbow and rainbow or npc_color)) or
									 (LookTracers.RainbowColor and rainbow) or
									 (LookTracers.UseTeamColor and teamcolor) or
									 LookTracers.Color
				local transparency = (mv_enabled and mv_selected[type] and overlapping and mv_transparency) or
									 (certified_npc and npc_transparency) or
									 (highlight and hl_transparency) or
									 LookTracers.Transparency
				ApplyZIndex(ltracer, type, highlight and hl_ontop)
				SetProp(ltracer, "Color", color)
				SetProp(ltracer, "Transparency", transparency)

				head = char:FindFirstChild("Head")
				if head then
					local headcf = head.CFrame
					head = WorldToViewportPoint(camera, headcf.Position)
					ltracerto = WorldToViewportPoint(camera, (headcf * CFramenew(0, 0, -LookTracers.Length)).Position)
				end

				if head then
					local thickness, outline = LookTracers.Thickness, LookTracers.Outline
					local tracer, out = ltracer.Tracer, ltracer.Outline
					tracer.Thickness = thickness

					local from = Vector2new(head.X, head.Y)
					local to = Vector2new(ltracerto.X, ltracerto.Y)
					tracer.From = from
					tracer.To = to

					if OUTLINES then
						out.Visible = outline and tracer.Visible
						if outline then
							out.Color = LookTracers.OutlineColor
							out.Thickness = thickness + (LookTracers.OutlineThickness * 2)
							out.From = from
							out.To = to
						end
					end
				else
					SetProp(ltracer, "Visible", false)
				end
			end
		end
	else
		SetProp(box, "Visible", false)
		SetProp(tracer, "Visible", false)
		SetProp(name, "Visible", false)
		SetProp(skeleton, "Visible", false)
		SetProp(bar, "Visible", false)
		SetProp(dot, "Visible", false)
		SetProp(ltracer, "Visible", false)
	end
end
function UpdatePartObjects(self) -- update esp objects for parts and models
	taskdesync()

	local part = self.Part
	local type = self.Type
	local obj = self.Objects
	local s = self.Options

	local cf, size, inViewport
	local c0, c1, c2, c3, c4, c5, c6, c7, c8

	if VISIBLE then
		local class = part.ClassName
		if find(class, "Part") or find(class, "Operation") then
			cf, size = part.CFrame, part.Size / 2
		elseif class == "Model" then
			tasksync()
			cf, size = part:GetBoundingBox()
			taskdesync()
			size /= 2
		end
		local x, y, z = size.X, size.Y, size.Z
		c0, inViewport = WorldToViewportPoint(camera,cf.Position)
		if type == "Chams" and inViewport then
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

		SetProp(obj, "Visible", inViewport)

		if inViewport then
			local color = (s.RainbowColor and rainbow) or s.Color
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
	else
		SetProp(obj, "Visible", false)
	end
end
function UpdateParallel(self) -- begin the loop that calls the update function
	taskdesync()
	taskspawn(function()
		while true do
			taskdesync()
			local clock = osclock()
			if refreshrate > 0 and (clock - self.LastUpdate) < refreshrate then
				taskwait()
				continue
			end
			self.LastUpdate = clock

			if self.Destroyed then
				break
			end
			self:Update()
			taskwait()
		end
	end)
end

function NewDrawing(type, target, options) -- create esp objects and data objects
	local drawobjs = NewObject(type)
	local obj = (options ~= nil and NewPartObject(drawobjs, type, target, options)) or NewCharacterObject(drawobjs, type, target)
	return drawobjs, obj
end
function NewPlayer(plr)
	local Box, BoxObj = NewDrawing("Boxes", plr)
	SetProp(Box, "Filled", false)

	local Tracer, TracerObj = NewDrawing("Tracers", plr)

	local Name, NameObj = NewDrawing("Names", plr)
	SetProp(Name, "Center", true)

	local Skeleton, SkeletonObj = NewDrawing("Skeletons", plr)

	local HealthBar, HealthBarObj = NewDrawing("HealthBars", plr)
	SetProp(HealthBar, "Thickness", 1)
	HealthBar.Bar.Filled = true
	HealthBar.Outline.Filled = false

	local HeadDot, HeadDotObj = NewDrawing("HeadDots", plr)

	local LookTracer, LookTracerObj = NewDrawing("LookTracers", plr)

	local t = {}
	t.Destroyed = false
	t.Player = plr
	t.NPC = plr.ClassName ~= "Player"
	t.Objects = {
		Box = BoxObj,
		Tracer = TracerObj,
		Name = NameObj,
		Skeleton = SkeletonObj,
		HealthBar = HealthBarObj,
		HeadDot = HeadDotObj,
		LookTracer = LookTracerObj
	}
	t.Update = UpdateObjects
	t.LastUpdate = osclock()
	t.Destroy = function(self)
		if self.Destroyed then return end
		self.Destroyed = true
		for _,v in next, self.Objects do
			v:Remove()
		end
	end

	PlayerObjects[plr] = t

	UpdateParallel(t)
end

function NewLabel(part, options)
	tasksync()
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

	local Label, LabelObj = NewDrawing("Labels", part, o)
	Label.Label.Visible = false
	Label.Label.Center = true

	local t = {}
	t.Destroyed = false
	t.Part = part
	t.Options = o
	t.Objects = LabelObj.Object
	t.Type = "Labels"
	t.Update = UpdatePartObjects
	t.LastUpdate = osclock()
	t.Destroy = function(self)
		if self.Destroyed then return end
		self.Destroyed = true
		for _,v in next, self.Objects do
			v:Remove()
		end
	end

	taskdesync()

	PlayerObjects[part] = t
	UpdateParallel(t)

	return LabelObj
end
function NewCham(part, options)
	tasksync()
	local o = {
		Transparency = options.Transparency or 1,
		Color = options.Color or white,
		RainbowColor = ternary(options.RainbowColor ~= nil, options.RainbowColor, false),
		Thickness = options.Thickness or 3,
		Filled = ternary(options.Filled ~= nil, options.Filled, true)
	}

	local Cham, ChamObj = NewDrawing("Chams", part, o)

	local t = {}
	t.Destroyed = false
	t.Part = part
	t.Options = o
	t.Type = "Chams"
	t.Objects = ChamObj.Object
	t.Update = UpdatePartObjects
	t.LastUpdate = osclock()
	t.Destroy = function(self)
		if self.Destroyed then return end
		self.Destroyed = true
		for _,v in next, self.Objects do
			v:Remove()
		end
	end

	taskdesync()

	PlayerObjects[part] = t
	UpdateParallel(t)

	return ChamObj
end

if typeof(ss.ToggleKey) == "EnumItem" then
	ss.ToggleKey = ss.ToggleKey.Name
end
local conn3 = uis.InputBegan:Connect(function(i,gp)
	if not gp and i.KeyCode == Enum.KeyCode[ss.ToggleKey] then
		VISIBLE = not VISIBLE
	end
end)
for _,v in next, players:GetPlayers() do
	if v ~= player then
		NewPlayer(v)
	end
end
tasksync()
local conn4 = players.PlayerAdded:Connect(NewPlayer)

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
	tasksync()
	return NewLabel(part, options or {})
end
function esp.Cham(part,options)
	assert(typeof(part) == "Instance",("Universal Esp: bad argument to #1 'Cham' (Instance expected, got %s)"):format(typeof(part)))
	assert(table.find(supportedparts, part.ClassName),("Universal Esp: bad argument to #1 'Cham' (Part or Model expected, got %s)"):format(part.ClassName))
	tasksync()
	return NewCham(part, options or {})
end
function esp:GetObjects(a)
	a = a or ""
	local t = typeof(a)
	if (t == "Instance" and a.ClassName == "Player") or (t == "string" and players:FindFirstChild(a)) then
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
		NPCObjects = 0,
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
				if v.NPC then
					data.NPCObjects += 1
				end
				if find(i2, "Outline") then
					data.Outlines += 1
				else
					data[v.Type] += 1
				end
			else
				data.DestroyedObjects += 1
			end
		end
	end
	return data
end
function esp:GetObjectFromId(id)
	return OBJECTS[id]
end
function hasesp(a)
	for _,v in next, OBJECTS do
		if (v.Player ~= nil or v.NPC) and v.Player == a and not v.Destroyed then
			return true
		end
	end
	return false
end
function esp:Add(a)
	a = a or ""
	local t = typeof(a)
	if (t == "Instance" and a.ClassName == "Player" or a.ClassName == "Model") or (t == "string" and players:FindFirstChild(a)) then
		local plr = (t == "string" and players[a]) or a
		if not hasesp(plr) then
			NewPlayer(plr)
		end
	end
end
function esp:Remove(a)
	a = a or ""
	local t = typeof(a)
	if (t == "Instance" and a.ClassName == "Player" or a.ClassName == "Model") or (t == "string" and players:FindFirstChild(a)) then
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
	conn2:Disconnect()
	conn3:Disconnect()
	conn4:Disconnect()
	for _,v in next, PlayerObjects do
		v:Destroy()
	end
	for _,v in next, OBJECTS do
		--v:Remove()
	end
	destroyed = true
end
getgenv().UESP = esp
return esp
