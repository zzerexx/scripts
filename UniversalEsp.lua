if not EspSettings then
	getgenv().EspSettings = {
		TeamCheck = false,
		ToggleKey = Enum.KeyCode.RightAlt,
		AntiDetection = true,
		RefreshRate = 10, -- how fast the esp updates (milliseconds)
		Boxes = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
		},
		Tracers = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			Origin = "Top", -- "Top" or "Center" or "Bottom" or "Mouse"
			Thickness = 1
		},
		Names = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			Font = Drawing.Fonts.UI, -- UI or System or Plex or Monospace
			Size = 18,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
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
			Thickness = 1
		},
		LookTracers = {
			Enabled = false,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			IgnoreWater = true,
			Thickness = 1,
		},
		HealthBars = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(0,255,0),
			OutlineColor = Color3.fromRGB(255,255,255),
			UseTeamColor = true -- this only applies to the outline
		}
	}
end
if EspSettings.AntiDetection and getconnections then
	for _,v in next, getconnections(game:GetService("ScriptContext").Error) do
		v:Disable()
	end
end
if not Drawing then
	game:GetService("Players").LocalPlayer:Kick("\n\nUniversal Esp\nYour exploit does not have a Drawing Library!\n")
	return
end
if UESP then
	UESP:Destroy()
end
local ZIndexEnabled = pcall(function()
	assert(not identifyexecutor():find("ScriptWare"),"")
	local a = Drawingnew("Square")
	a.ZIndex = 1
end)

local players = game:GetService("Players")
local player = players.LocalPlayer
local camera = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Drawingnew = Drawing.new 
local Fonts = Drawing.Fonts
local tableinsert = table.insert
local WorldToViewportPoint = camera.WorldToViewportPoint
local CFramenew = CFrame.new
local Vector2new = Vector2.new 
local Color3fromRGB = Color3.fromRGB
local mathfloor = math.floor
local mathclamp = math.clamp
local mathhuge = math.huge
local osclock = os.clock
local GameId = game.GameId
local ID = 0
local ss = getgenv().EspSettings
getgenv().UESP_OBJECTS = {}
getgenv().UESP_VISIBLE = true
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
}
local zindex = {
	['Box'] = 0,
	['Tracer'] = 1,
	['Name'] = 4,
	['Skeleton'] = 0,
	['LookTracer'] = 0,
	['HealthBar'] = 2,
	['Label'] = 3,
	['Cham'] = -1
}
local origins = {}
local omega, beta = Color3fromRGB(38,125,255), Color3fromRGB(255,116,38)
local white, black = Color3fromRGB(255,255,255), Color3fromRGB(0,0,0)
local getchar, gethealth, ts
if GameId == (gids.pf or gids.pft or gids.pfu) then
	for _,v in next, getgc(true) do
		if typeof(v) == "table" and rawget(v,"getbodyparts") then
			getchar = rawget(v,"getbodyparts")
		elseif typeof(v) == "table" and rawget(v,"getplayerhealth") then
			gethealth = rawget(v,"getplayerhealth")
		end
	end
elseif GameId == gids.bb then
	for _,v in next, getgc(true) do
		if typeof(v) == "table" and rawget(v,"InitProjectile") and v.TS then
			ts = v.TS
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

function IsAlive(plr)
	if plr.Character and plr.Character.Humanoid.Health > 0 then
		return true
	elseif getchar then
		if getchar(plr,plr) ~= nil then
			return true
		end
	elseif ts then
		if ts.Characters:GetCharacter(plr) ~= nil then
			return true
		end
	end
	return false
end
function GetChar(plr)
	if getchar then
		return getchar(plr).torso.Parent
	elseif ts then
		return ts.Characters:GetCharacter(plr).Body
	elseif plr.Character ~= nil then
		return plr.Character
	end
	return nil
end
function GetHealth(plr)
	local a = plr.Character
	if gethealth then
		return {mathfloor(gethealth(plr,plr)),100}
	elseif ts then 
		a = ts.Characters:GetCharacter(plr).Health
		return {mathfloor(a.Value),mathfloor(a.MaxHealth.Value)}
	elseif GameId == gids.arsenal then
		a = plr.NRPBS
		return {mathfloor(a.Health.Value),mathfloor(a.MaxHealth.Value)}
	elseif a ~= nil and a:FindFirstChildOfClass("Humanoid") then
		return {mathfloor(a.Humanoid.Health),mathfloor(a.Humanoid.MaxHealth)}
	end
	return {100,100}
end
function GetTeam(plr)
	if ts then
		for _,v in next, game:GetService("Teams"):GetChildren() do
			if not v.Players:FindFirstChild(plr.Name) then
				return v.Name
			end
		end
	end
	return plr.Team
end
function ApplyZIndex(obj,name)
	if ZIndexEnabled then
		if typeof(obj) == "table" and obj.__OBJECT_EXISTS == nil then
			for _,v in next, obj do
				v.ZIndex = zindex[name]
			end
		else
			obj.ZIndex = zindex[name]
		end
	end
end
function SetProp(obj,prop,value)
	if typeof(obj) == "table" and obj.__OBJECT_EXISTS == nil then
		for _,v in next, obj do
			v[prop] = value
		end
	else
		obj[prop] = value
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

	local box = Drawingnew("Quad")
	box.Visible = false
	box.Thickness = 1
	box.Filled = false
	ApplyZIndex(box,"Box")
	local a = {Object = box, Type = "Boxes", Player = plr, Destroyed = false, Id = ID}
	function a:Remove()
		box:Remove()
		a.Destroyed = true
	end
	tableinsert(UESP_OBJECTS,a)
end
function Tracer(plr)
	ID += 1

	local tracer = Drawingnew("Line")
	tracer.Visible = false
	ApplyZIndex(tracer,"Tracer")
	local a = {Object = tracer, Type = "Tracers", Player = plr, Destroyed = false, Id = ID}
	function a:Remove()
		tracer:Remove()
		a.Destroyed = true
	end
	tableinsert(UESP_OBJECTS,a)
end
function Name(plr)
	ID += 1

	local objects = {
		Name = Drawingnew("Text"),
		Data = Drawingnew("Text")
	}
	SetProp(objects, "Visible", false)
	SetProp(objects, "Center", true)
	ApplyZIndex(objects,"Name")
	local a = {Object = objects, Type = "Names", Player = plr, Destroyed = false, Id = ID}
	function a:Remove()
		objects.Name:Remove()
		objects.Data:Remove()
		a.Destroyed = true
	end
	tableinsert(UESP_OBJECTS,a)
end
function Skeleton(plr)
	ID += 1

	local objects = (ts and {
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
	}) or {
		-- R15
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
		Torso = Drawingnew("Line"),
		["Left Arm"] = Drawingnew("Line"),
		["Right Arm"] = Drawingnew("Line"),
		["Left Leg"] = Drawingnew("Line"),
		["Right Leg"] = Drawingnew("Line")
	}
	SetProp(objects, "Visible", false)
	ApplyZIndex(objects,"Skeleton")
	local a = {Object = objects, Type = "Skeletons", Player = plr, Destroyed = false, Id = ID}
	function a:Remove()
		for _,v in next, objects do
			v:Remove()
		end
		a.Destroyed = true
	end
	tableinsert(UESP_OBJECTS,a)
end
function LookTracer(plr)
	ID += 1

	local tracer = Drawingnew("Line")
	tracer.Visible = false
	ApplyZIndex(tracer,"LookTracer")
	local a = {Object = tracer, Type = "LookTracers", Player = plr, Destroyed = false, Id = ID}
	function a:Remove()
		tracer:Remove()
		a.Destroyed = true
	end
	tableinsert(UESP_OBJECTS,a)
end
function HealthBar(plr)
	ID += 1

	local objects = {
		Bar = Drawingnew("Quad"),
		Outline = Drawingnew("Quad")
	}
	SetProp(objects, "Visible", false)
	SetProp(objects, "Thickness", 1)
	objects.Bar.Filled = true
	objects.Outline.Filled = false
	ApplyZIndex(objects, "HealthBar")
	local a = {Object = objects, Type = "HealthBars", Player = plr, Destroyed = false, Id = ID}
	function a:Remove()
		objects.Bar:Remove()
		objects.Outline:Remove()
		a.Destroyed = true
	end
	tableinsert(UESP_OBJECTS,a)
end

function Label(part,options)
	ID += 1

	local label = Drawingnew("Text")
	label.Visible = false

	local o = {
		Text = options.Text or part.Name,
		Transparency = options.Transparency or 0.7,
		Color = options.Color or white,
		Size = options.Size or 18,
		Center = ternary(options.Center ~= nil, options.Center, true),
		Outline = ternary(options.Outline ~= nil, options.Outline, true),
		OutlineColor = options.OutlineColor or black,
		Font = options.Font or Fonts.UI
	}
	
	ApplyZIndex(label,"Labels")
	local a = {Object = label, Type = "Label", Part = part, Options = o, Destroyed = false, Id = ID}
	function a:Remove()
		label:Remove()
		a.Destroyed = true
	end
	tableinsert(UESP_OBJECTS,a)
	return a
end
function Cham(part,options)
	ID += 1

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
		Thickness = options.Thickness or 3,
		Filled = ternary(options.Filled ~= nil, options.Filled, true)
	}
	ApplyZIndex(objects,"Chams")
	local a = {Object = objects, Type = "Cham", Part = part, Options = o, Destroyed = false, Id = ID}
	function a:Remove()
		for _,v in next, objects do
			v:Remove()
		end
		a.Destroyed = true
	end
	tableinsert(UESP_OBJECTS,a)
	return a
end

function updateorigins()
	local x, y = camera.ViewportSize.X, camera.ViewportSize.Y
	origins = {
		top = Vector2new(x / 2, 0),
		center = Vector2new(x / 2, y / 2),
		bottom = Vector2new(x / 2, y),
		mouse = UIS:GetMouseLocation()
	}
end
updateorigins()
camera:GetPropertyChangedSignal("ViewportSize"):Connect(updateorigins)

local lastupdate = osclock()
function update()
	ss.RefreshRate = mathclamp(ss.RefreshRate, 0, mathhuge)
	if osclock() - lastupdate < (ss.RefreshRate / 1000) then
		return
	end
	lastupdate = osclock()
	for _,v in next, UESP_OBJECTS do
		if not v.Destroyed then
			if v.Player == nil and not v.Options then
				v:Remove()
			elseif v.Part == nil and v.Options then
				v:Remove()
			end
	
			local plr, part, obj, type = v.Player, v.Part, v.Object, v.Type -- objects shit
			local cf, size, _, inViewport, tl, tr, bl, br				   -- boxes shit
			local tlx, tly, tlz, trx, try, blx, bly, brx, bry			   -- boxes corner axes shit
			local c0, c1, c2, c3, c4, c5, c6, c7, c8						-- part corner positions shit
			local team, myteam, teamcolor								   -- team shit
			local ccf, char, health, maxhealth							  -- other shit
			local s = ss[type] or v.Options								 -- settings shit
			if plr and IsAlive(plr) and s and s.Enabled then
				ccf, char, health, maxhealth = camera.CFrame.Position, GetChar(plr), GetHealth(plr)[1], GetHealth(plr)[2]
				cf, size = char:GetBoundingBox()
				team, myteam, teamcolor = GetTeam(plr), GetTeam(player), plr.TeamColor.Color
				size /= 2
				local x, y = size.X, size.Y
				_, inViewport = WorldToViewportPoint(camera,cf.Position)
				tl = WorldToViewportPoint(camera,(cf * CFramenew(-x,y,0)).Position)
				tr = WorldToViewportPoint(camera,(cf * CFramenew(x,y,0)).Position)
				bl = WorldToViewportPoint(camera,(cf * CFramenew(-x,-y,0)).Position)
				br = WorldToViewportPoint(camera,(cf * CFramenew(x,-y,0)).Position)

				tlx, tly, tlz = tl.X, tl.Y, tl.Z
				trx, try = tr.X, tr.Y
				blx, bly = bl.X, bl.Y
				brx, bry = br.X, br.Y
			elseif v.Part then
				cf, size = part.CFrame, part.Size / 2
				local x, y, z = size.X, size.Y, size.Z
				c0, inViewport = WorldToViewportPoint(camera,cf.Position)
				c1 = WorldToViewportPoint(camera,(cf * CFramenew(x,y,z)).Position)
				c2 = WorldToViewportPoint(camera,(cf * CFramenew(-x,y,z)).Position)
				c3 = WorldToViewportPoint(camera,(cf * CFramenew(-x,-y,z)).Position)
				c4 = WorldToViewportPoint(camera,(cf * CFramenew(x,-y,z)).Position)
				c5 = WorldToViewportPoint(camera,(cf * CFramenew(x,y,-z)).Position)
				c6 = WorldToViewportPoint(camera,(cf * CFramenew(-x,y,-z)).Position)
				c7 = WorldToViewportPoint(camera,(cf * CFramenew(-x,-y,-z)).Position)
				c8 = WorldToViewportPoint(camera,(cf * CFramenew(x,-y,-z)).Position)

				c1 = Vector2new(c1.X, c1.Y)
				c2 = Vector2new(c2.X, c2.Y)
				c3 = Vector2new(c3.X, c3.Y)
				c4 = Vector2new(c4.X, c4.Y)
				c5 = Vector2new(c5.X, c5.Y)
				c6 = Vector2new(c6.X, c6.Y)
				c7 = Vector2new(c7.X, c7.Y)
				c8 = Vector2new(c8.X, c8.Y)
			end
	
			if UESP_VISIBLE and not v.Destroyed then
				if plr and IsAlive(plr) and s and s.Enabled then
					printconsole("applying")
					local color = (ts and team == "Omega" and omega or team == "Beta" and beta) or (s.UseTeamColor and teamcolor) or s.Color
					SetProp(obj, "Visible", not ss.TeamCheck or (ss.TeamCheck and team ~= myteam))
					if type == "Boxes" and s.Enabled and inViewport then
						obj.Transparency = s.Transparency
						obj.Color = color
						obj.PointA = Vector2new(trx, try)
						obj.PointB = Vector2new(tlx, tly)
						obj.PointC = Vector2new(blx, bly)
						obj.PointD = Vector2new(brx, bry)
					elseif type == "Tracers" and s.Enabled and inViewport then
						obj.Transparency = s.Transparency
						obj.Color = color
						obj.Thickness = s.Thickness 
						obj.From = origins[s.Origin:lower() or "top"]
						obj.To = Vector2new(tlx + (trx - tlx) / 2, tly + (try - tly) / 2)
						if ss.Tracers.Origin:lower() == "bottom" then
							obj.To = Vector2new(blx + (brx - blx) / 2, bly + (bry - bly) / 2)
						end
					elseif type == "Names" and s.Enabled and inViewport then
						SetProp(obj, "Transparency", s.Transparency)
						SetProp(obj, "Color", color)
						SetProp(obj, "Size", s.Size)
						SetProp(obj, "Outline", s.Outline)
						SetProp(obj, "OutlineColor", s.OutlineColor)
						SetProp(obj, "Font", s.Font)
						
						obj.Name.Position = Vector2new(tlx + (trx - tlx) / 2, tly - (s.Size + 2))
						obj.Data.Position = Vector2new(blx + (brx - blx) / 2, bly + (bry - bly) / 2)
						if s.Enabled then
							obj.Data.Position = Vector2new(obj.Data.Position.X, obj.Data.Position.Y + mathclamp(1000 / tlz,8,15))
						end
						local mag
						if ts then
							mag = mathfloor((ccf - char.Parent.Root.Position).Magnitude)
						elseif getchar then
							mag = mathfloor((ccf - char.Torso.Position).Magnitude)
						else
							mag = mathfloor((ccf - char.HumanoidRootPart.Position).Magnitude)
						end
						obj.Name.Text = (s.UseDisplayName and plr.DisplayName) or plr.Name
						obj.Data.Text = ""
						if s.ShowDistance then
							obj.Data.Text = "[ "..mag..s.DistanceDataType.." ]"
						end
						if s.ShowHealth then
							local a = s.HealthDataType:lower()
							if a == "percentage" then
								obj.Data.Text = obj.Data.Text.." [ "..mathfloor((health / maxhealth) * 100).."% ]"
							elseif a == "value" then
								obj.Data.Text = obj.Data.Text.." [ "..health.."/"..maxhealth.." ]"
							end
						end
					elseif type == "Skeletons" and s.Enabled and inViewport then
						SetProp(obj, "Transparency", s.Transparency)
						SetProp(obj, "Color", color)
						SetProp(obj, "Thickness", s.Thickness)

						for i2,v2 in next, obj do
							if char:FindFirstChild(i2) then
								local pos1 = WorldToViewportPoint(camera, char:FindFirstChild(From[i2]).Position)
								local pos2 = WorldToViewportPoint(camera, char[i2].Position)
								v2.From = Vector2new(pos1.X, pos1.Y)
								v2.To = Vector2new(pos2.X, pos2.Y)
							end
						end
					elseif type == "HealthBars" and s.Enabled and inViewport then
						local bar, out, z = obj.Bar, obj.Outline, mathclamp(1000 / tlz, 8, 12)
						SetProp(obj, "Transparency", s.Transparency)
						SetProp(obj, "Color", color)
						health = health / maxhealth
						bar.PointA = Vector2new(
							blx + (brx - blx) * health,
							(bly + (bry - bly) * health) + 5
						)
						bar.PointB = Vector2new(
							blx,
							bly + 5
						)
						bar.PointC = Vector2new(
							blx,
							bly + z
						)
						bar.PointD = Vector2new(
							blx + (brx - blx) * health,
							(bly + (bry - bly) * health) + z
						)

						out.PointA = Vector2new(brx, bry + 5)
						out.PointB = Vector2new(blx, bly + 5)
						out.PointC = Vector2new(blx, bly + z)
						out.PointD = Vector2new(brx, bry + z)
					end
				elseif part and part.Parent ~= nil then
					SetProp(obj, "Visible", inViewport)
					if type == "Labels" and inViewport then
						obj.Transparency = s.Transparency
						obj.Color = s.Color
						obj.Text = s.Text
						obj.Size = s.Size
						obj.Outline = s.Outline
						obj.OutlineColor = s.OutlineColor
						obj.Font = s.Font

						obj.Position = Vector2new(c0.X, c0.Y - (s.Size) / 2)
					elseif type == "Chams" and inViewport then
						local t, b, l, r, f, bb = obj.Top, obj.Bottom, obj.Left, obj.Right, obj.Front, obj.Back
						SetProp(obj, "Transparency", s.Transparency)
						SetProp(obj, "Color", s.Color)
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
				if not inViewport or not ss[type].Enabled then
					SetProp(obj, "Visible", false)
				end
			elseif not UESP_VISIBLE and not v.Destroyed then
				SetProp(obj, "Visible", false)
			end
		end
	end
end

getgenv().UESP_RS = RunService.RenderStepped:Connect(update)
UIS.InputBegan:Connect(function(i,gp)
	if not gp and i.KeyCode == (ss.ToggleKey or Enum.KeyCode[ss.ToggleKey]) then
		getgenv().UESP_VISIBLE = not UESP_VISIBLE
	end
end)
for _,v in next, players:GetPlayers() do
	if v ~= player then
		--LookTracer(v)
		Box(v)
		Skeleton(v)
		Tracer(v)
		HealthBar(v)
		Name(v)
	end
end
players.PlayerAdded:Connect(function(v)
	if v ~= player then
		--LookTracer(v)
		Box(v)
		Skeleton(v)
		Tracer(v)
		HealthBar(v)
		Name(v)
	end
end)

local esp = {}

function ValidType(type)
	return type == "Other" or getgenv().EspSettings[type] ~= nil
end
function ValidOption(type,option)
	return type == "Other" or getgenv().EspSettings[type][option] ~= nil
end
function esp:Toggle(type)
	assert(ValidType(type),"Universal Esp: bad argument to #1 'Toggle' (Invalid Type)")
	if type == ("TeamCheck" or "AntiDetection") then
		getgenv().EspSettings[type] = not getgenv().EspSettings[type]
	else
		getgenv().EspSettings[type].Enabled = not getgenv().EspSettings[type].Enabled
	end
end
function esp:Get(type,option)
	assert(ValidType(type),"Universal Esp: bad argument to #1 'Get' (Invalid Type)")
	assert(ValidOption(type,option),"Universal Esp: bad argument to #2 'Get' (Invalid Option)")
	if type == "Other" then
		return getgenv().EspSettings[option]
	end
	return getgenv().EspSettings[type][option]
end
function esp:Set(type,option,value)
	assert(ValidType(type),"Universal Esp: bad argument to #1 'Set' (Invalid Type)")
	assert(ValidOption(type,option),"Universal Esp: bad argument to #2 'Set' (Invalid Option)")
	assert(value ~= nil,"Universal Esp: bad argument to #3 'Set'")
	if type == "Other" then
		getgenv().EspSettings[option] = value
	else
		getgenv().EspSettings[type][option] = value
	end
end
function esp:SetAll(option,value)
	assert(ValidOption("Boxes",option),"Universal Esp: bad argument to #1 'SetAll' (Invalid Option)")
	assert(value ~= nil,"Universal Esp: bad argument to #2 'SetAll'")
	for _,v in next, EspSettings do
		if typeof(v) == "table" and v.Enabled ~= nil then
			v[option] = value
		end
	end
end
function esp.Label(part,options)
	assert(typeof(part) == "Instance","Universal Esp: bad argument to #1 'Label' (Instance expected, got "..typeof(part)..")")
	return Label(part,options or {})
end
function esp.Cham(part,options)
	assert(typeof(part) == "Instance","Universal Esp: bad argument to #1 'Cham' (Instance expected, got "..typeof(part)..")")
	return Cham(part,options or {})
end
function esp:GetObjects(plr)
	assert(typeof(plr) == "Instance","Universal Esp: bad argument to #1 'GetObjects' (Instance expected, got nil)")
	assert(plr.ClassName == "Player","Universal Esp: bad argument to #1 'GetObjects' (Player expected, got "..plr.ClassName..")")
	local objects = {
		['Boxes'] = nil,
		['Tracers'] = nil,
		['Names'] = nil,
		['Skeletons'] = nil,
		['LookTracers'] = nil,
		['HealthBars'] = nil
	}
	for _,v in next, UESP_OBJECTS do
		if v.Player == plr then
			objects[v.Type] = v
		end
	end
	return objects
end
function esp:GetTotalObjects()
	local data = {
		DrawingObjects = 0,
		VisibleObjects = 0,
		Boxes = 0,
		Tracers = 0,
		Names = 0,
		Skeletons = 0,
		LookTracers = 0,
		HealthBars = 0,
		Labels = 0,
		Chams = 0,
	}
	for _,v in next, UESP_OBJECTS do
		if typeof(v.Object) == "table" and v.Object.__OBJECT_EXISTS == nil then
			for _,v2 in next, v.Object do
				data.DrawingObjects += 1
				if v2.Visible then
					data.VisibleObjects += 1
				end
				data[v.Type] += 1
			end
		else
			data.DrawingObjects += 1
			if v.Object.Visible then
				data.VisibleObjects += 1
			end
			data[v.Type] += 1
		end
	end
	return data
end
function esp:Destroy()
	UESP_RS:Disconnect()
	for _,v in next, UESP_OBJECTS do
		v:Remove()
	end
end
getgenv().UESP = esp
return esp
