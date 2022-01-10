if not EspSettings then
	getgenv().EspSettings = {
		TeamCheck = false,
		ToggleKey = Enum.KeyCode.RightAlt,
		AntiDetection = true,
		RefreshRate = 10, -- how fast the esp updates (milliseconds)
		MaximumDistance = 500, -- only renders players within this distance
		MouseVisibility = {
			Enabled = true, -- makes any drawing objects transparent when they are near your mouse
			Radius = 60,
			Transparency = 0.3
		},
		Boxes = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true
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
		HealthBars = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(0,255,0),
			OutlineColor = Color3.fromRGB(255,255,255),
			UseTeamColor = true
		}
	}
end

if not UESP then
	task.delay(5,function()
		local bind = Instance.new("BindableFunction")
		bind.OnInvoke = function(a)
			if a == "Get Script" then
				setclipboard("https://pastebin.com/raw/5zw0rLH9")
			end
		end
		game:GetService("StarterGui"):SetCore("SendNotification",{
			Title = "Universal Esp",
			Text = "Script not working? Make sure you have the latest version!",
			Duration = 5,
			Button1 = "OK",
			Button2 = "Get Script",
			Callback = bind
		})
	end)
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
	local a = Drawing.new("Square")
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
local tablesort = table.sort
local WorldToViewportPoint = camera.WorldToViewportPoint
local CFramenew = CFrame.new
local Vector2new = Vector2.new 
local Color3fromRGB = Color3.fromRGB
local mathfloor = math.floor
local mathclamp = math.clamp
local mathhuge = math.huge
local osclock = os.clock
local GameId = game.GameId
local ss, mousevis, OBJECTS, VISIBLE, ID = getgenv().EspSettings, getgenv().EspSettings.MouseVisibility, {}, true, 0
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
	['Boxes'] = 0,
	['Tracers'] = 1,
	['Names'] = 4,
	['Skeletons'] = 0,
	['LookTracers'] = 0,
	['HealthBars'] = 2,
	['Labels'] = 3,
	['Chams'] = -1
}
local origins = {}
local omega, beta = Color3fromRGB(255,116,38), Color3fromRGB(38,125,255)
local white, black = Color3fromRGB(255,255,255), Color3fromRGB(0,0,0)
local getchar, gethealth, ts, characters
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
	if plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
		return true
	elseif getchar then
		return getchar(plr) ~= nil
	elseif ts then
		return characters:GetCharacter(plr) ~= nil
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
		return characters:GetCharacter(plr)
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
		a = characters:GetCharacter(plr)
		if a:FindFirstChild("Health") then
			return {mathfloor(a.Health.Value),mathfloor(a.Health.MaxHealth.Value)}
		end
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
		return ts.Teams:GetPlayerTeam(plr)
	end
	return plr.Team
end
function ApplyZIndex(obj,name)
	if ZIndexEnabled then
		local idx = zindex[name]
		if typeof(obj) == "table" and obj.__OBJECT_EXISTS == nil then -- checks if table has __OBJECT_EXISTS cuz synapse dumb
			for _,v in next, obj do
				v.ZIndex = idx
			end
		else
			obj.ZIndex = idx
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

	local type = "Boxes"
	local box = Drawingnew("Quad")
	box.Visible = false
	box.Thickness = 1
	box.Filled = false
	ApplyZIndex(box, type)
	local a = {Object = box, Type = type, Player = plr, Destroyed = false, Id = ID}
	function a:Remove()
		box:Remove()
		a.Destroyed = true
	end
	tableinsert(OBJECTS,a)
end
function Tracer(plr)
	ID += 1

	local type = "Tracers"
	local tracer = Drawingnew("Line")
	tracer.Visible = false
	ApplyZIndex(tracer, type)
	local a = {Object = tracer, Type = type, Player = plr, Destroyed = false, Id = ID}
	function a:Remove()
		tracer:Remove()
		a.Destroyed = true
	end
	tableinsert(OBJECTS,a)
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
	ApplyZIndex(objects, type)
	local a = {Object = objects, Type = type, Player = plr, Destroyed = false, Id = ID}
	function a:Remove()
		objects.Name:Remove()
		objects.Data:Remove()
		a.Destroyed = true
	end
	tableinsert(OBJECTS,a)
end
function Skeleton(plr)
	ID += 1

	local type = "Skeletons"
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
	ApplyZIndex(objects, type)
	local a = {Object = objects, Type = type, Player = plr, Destroyed = false, Id = ID}
	function a:Remove()
		for _,v in next, objects do
			v:Remove()
		end
		a.Destroyed = true
	end
	tableinsert(OBJECTS,a)
end
function HealthBar(plr)
	ID += 1

	local type = "HealthBars"
	local objects = {
		Bar = Drawingnew("Quad"),
		Outline = Drawingnew("Quad")
	}
	SetProp(objects, "Visible", false)
	SetProp(objects, "Thickness", 1)
	objects.Bar.Filled = true
	objects.Outline.Filled = false
	ApplyZIndex(objects, type)
	local a = {Object = objects, Type = type, Player = plr, Destroyed = false, Id = ID}
	function a:Remove()
		objects.Bar:Remove()
		objects.Outline:Remove()
		a.Destroyed = true
	end
	tableinsert(OBJECTS,a)
end

function Label(part,options)
	ID += 1

	local type = "Labels"
	local label = Drawingnew("Text")
	label.Visible = false
	label.Center = true

	local o = {
		Text = options.Text or part.Name,
		Transparency = options.Transparency or 0.7,
		Color = options.Color or white,
		Size = options.Size or 18,
		Outline = ternary(options.Outline ~= nil, options.Outline, true),
		OutlineColor = options.OutlineColor or black,
		Font = options.Font or Fonts.UI
	}
	
	ApplyZIndex(label, type)
	local a = {Object = label, Type = type, Part = part, Options = o, Destroyed = false, Id = ID}
	function a:SetPart(p)
		assert(typeof(p) == "Instance","Universal Esp: bad argument #1 to 'SetPart' (Instance expected, got "..typeof(p)..")")
		assert(p.ClassName:find("Part"),"Universal Esp: bad argument #1 to 'SetPart' (Part expected, got "..p.ClassName..")")
		table.remove(OBJECTS, table.find(OBJECTS, a))
		a.Part = p 
		tableinsert(OBJECTS, a)
	end
	function a:Remove()
		label:Remove()
		a.Destroyed = true
	end
	tableinsert(OBJECTS,a)
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
		Thickness = options.Thickness or 3,
		Filled = ternary(options.Filled ~= nil, options.Filled, true)
	}
	ApplyZIndex(objects, type)
	local a = {Object = objects, Type = type, Part = part, Options = o, Destroyed = false, Id = ID}
	function a:SetPart(p)
		assert(typeof(p) == "Instance","Universal Esp: bad argument #1 to 'SetPart' (Instance expected, got "..typeof(p)..")")
		assert(p.ClassName:find("Part"),"Universal Esp: bad argument #1 to 'SetPart' (Part expected, got "..p.ClassName..")")
		table.remove(OBJECTS, table.find(OBJECTS, a))
		a.Part = p 
		tableinsert(OBJECTS, a)
	end
	function a:Remove()
		for _,v in next, objects do
			v:Remove()
		end
		a.Destroyed = true
	end
	tableinsert(OBJECTS,a)
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
local conn1 = camera:GetPropertyChangedSignal("ViewportSize"):Connect(updateorigins)

local lastupdate = osclock()
function update()
	local refresh = ss.RefreshRate
	refresh = mathclamp(refresh, 0, mathhuge)
	if osclock() - lastupdate < (refresh / 1000) then
		return
	end
	lastupdate = osclock()
	origins.mouse = UIS:GetMouseLocation()
	for _,v in next, OBJECTS do
		if not v.Destroyed then
			if v.Player == nil and not v.Options then
				v:Remove()
			elseif v.Part == nil and v.Options then
				v:Remove()
			end
	
			local plr, part, obj, type = v.Player, v.Part, v.Object, v.Type -- objects shit
			local cf, size, mid, inViewport, tl, tr, bl, br				 -- boxes shit
			local tlx, tly, tlz, trx, try, blx, bly, brx, bry, z			-- boxes corner axes shit
			local c0, c1, c2, c3, c4, c5, c6, c7, c8						-- part corner positions shit
			local team, myteam, teamcolor								   -- team shit
			local ccf, char, health, maxhealth, mag, mousemag			   -- other shit
			local s = ss[type] or v.Options								 -- settings shit
			if plr and IsAlive(plr) and s and s.Enabled then
				local hp = GetHealth(plr)
				ccf, char, health, maxhealth = camera.CFrame.Position, GetChar(plr), hp[1], hp[2]
				cf, size = char:GetBoundingBox()
				team, myteam, teamcolor = GetTeam(plr), GetTeam(player), plr.TeamColor.Color
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

				mag = (ccf - cf.Position).Magnitude
				if mousevis.Enabled then
					local m = UIS:GetMouseLocation()
					local mags = {}
					tableinsert(mags, (m - Vector2new(mid.X, mid.Y)).Magnitude)
					tableinsert(mags, (m - Vector2new(tlx, tly)).Magnitude)
					tableinsert(mags, (m - Vector2new(trx, try)).Magnitude)
					tableinsert(mags, (m - Vector2new(blx, bly)).Magnitude)
					tableinsert(mags, (m - Vector2new(brx, bry)).Magnitude)
					
					tablesort(mags, function(a,b)
						return a < b
					end)

					mousemag = mags[1]
				end
			elseif v.Part then
				cf, size = part.CFrame, part.Size / 2
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
	
			if VISIBLE and not v.Destroyed then
				if plr and IsAlive(plr) and s and s.Enabled then
					local color = (ts and team == "Omega" and omega or team == "Beta" and beta) or (s.UseTeamColor and teamcolor) or s.Color
					local transparency = (mousevis.Enabled and mousemag <= mousevis.Radius and mousevis.Transparency) or s.Transparency
					SetProp(obj, "Visible", (not ss.TeamCheck or (ss.TeamCheck and team ~= myteam)) and mag <= ss.MaximumDistance)
					if s.Enabled and inViewport and mag <= ss.MaximumDistance then
						SetProp(obj, "Transparency", transparency)
						SetProp(obj, "Color", color)
						if type == "Boxes" then
							obj.PointA = Vector2new(trx, try)
							obj.PointB = Vector2new(tlx, tly)
							obj.PointC = Vector2new(blx, bly)
							obj.PointD = Vector2new(brx, bry)
						elseif type == "Tracers" then
							obj.Thickness = s.Thickness 
							obj.From = origins[s.Origin:lower() or "top"]
							obj.To = Vector2new(tlx + (trx - tlx) / 2, tly + (try - tly) / 2)
							if s.Origin:lower() == "bottom" then
								obj.To = Vector2new(blx + (brx - blx) / 2, bly + (bry - bly) / 2)
							end
						elseif type == "Names" then
							SetProp(obj, "Size", s.Size)
							SetProp(obj, "Outline", s.Outline)
							SetProp(obj, "OutlineColor", s.OutlineColor)
							SetProp(obj, "Font", s.Font)
							local name, data = obj.Name, obj.Data
							
							name.Position = Vector2new(tlx + (trx - tlx) / 2, tly - (s.Size + 2))
							data.Position = Vector2new(blx + (brx - blx) / 2, bly + (bry - bly) / 2)
							if ss.HealthBars.Enabled then
								data.Position = Vector2new(data.Position.X, data.Position.Y + z)
							end
							name.Text = (s.UseDisplayName and plr.DisplayName) or plr.Name
							data.Text = ""
							if s.ShowDistance then
								data.Text = "[ "..mathfloor(mag)..s.DistanceDataType.." ]"
							end
							if s.ShowHealth then
								local a = s.HealthDataType:lower()
								if a == "percentage" then
									data.Text = obj.Data.Text.." [ "..mathfloor((health / maxhealth) * 100).."% ]"
								elseif a == "value" then
									data.Text = obj.Data.Text.." [ "..mathfloor(health).."/"..mathfloor(maxhealth).." ]"
								end
							end
						elseif type == "Skeletons" then
							SetProp(obj, "Thickness", s.Thickness)
	
							for i2,v2 in next, obj do
								if ts then
									char = char.Body
								end
								if char:FindFirstChild(From[i2]) and char:FindFirstChild(i2) then
									local pos1 = WorldToViewportPoint(camera, char:FindFirstChild(From[i2]).Position)
									local pos2 = WorldToViewportPoint(camera, char:FindFirstChild(i2).Position)
									v2.From = Vector2new(pos1.X, pos1.Y)
									v2.To = Vector2new(pos2.X, pos2.Y)
								end
							end
						elseif type == "HealthBars" then
							local bar, out = obj.Bar, obj.Outline
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
					end
				elseif part then
					SetProp(obj, "Visible", inViewport)
					SetProp(obj, "Transparency", s.Transparency)
					SetProp(obj, "Color", s.Color)
					if inViewport then
						if type == "Labels" then
							obj.Text = s.Text
							obj.Size = s.Size
							obj.Outline = s.Outline
							obj.OutlineColor = s.OutlineColor
							obj.Font = s.Font
	
							obj.Position = Vector2new(c0.X, c0.Y - (s.Size) / 2)
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
			elseif not VISIBLE and not v.Destroyed then
				SetProp(obj, "Visible", false)
			end
		end
	end
end

local conn2 = RunService.RenderStepped:Connect(update)
local conn3 = UIS.InputBegan:Connect(function(i,gp)
	if not gp and i.KeyCode == (ss.ToggleKey or Enum.KeyCode[ss.ToggleKey]) then
		VISIBLE = not VISIBLE
	end
end)
for _,v in next, players:GetPlayers() do
	if v ~= player then
		Box(v)
		Skeleton(v)
		Tracer(v)
		HealthBar(v)
		Name(v)
	end
end
local conn4 = players.PlayerAdded:Connect(function(v)
	if v ~= player then
		Box(v)
		Skeleton(v)
		Tracer(v)
		HealthBar(v)
		Name(v)
	end
end)

local esp = {}
local destroyed = false

function ValidType(type)
	return type == "Other" or ss[type] ~= nil
end
function ValidOption(type,option)
	return (type == "Other" and ss[option] ~= nil) or ss[type][option] ~= nil
end
function esp:Toggle(type)
	assert(ValidType(type),"Universal Esp: bad argument to #1 'Toggle' (Invalid Type)")
	if type == ("TeamCheck" or "AntiDetection" or "MouseVisibility") then
		ss[type] = not ss[type]
	else
		ss[type].Enabled = not ss[type].Enabled
	end
end
function esp:Get(type,option)
	assert(ValidType(type),"Universal Esp: bad argument to #1 'Get' (Invalid Type)")
	assert(ValidOption(type,option),"Universal Esp: bad argument to #2 'Get' (Invalid Option)")
	if type == "Other" then
		return ss[option]
	end
	return ss[type][option]
end
function esp:Set(type,option,value)
	assert(ValidType(type),"Universal Esp: bad argument to #1 'Set' (Invalid Type)")
	assert(ValidOption(type,option),"Universal Esp: bad argument to #2 'Set' (Invalid Option)")
	assert(value ~= nil,"Universal Esp: bad argument to #3 'Set'")
	if type == "Other" then
		ss[option] = value
	else
		ss[type][option] = value
	end
end
function esp:SetAll(option,value)
	assert(ValidOption("Boxes",option),"Universal Esp: bad argument to #1 'SetAll' (Invalid Option)")
	assert(value ~= nil,"Universal Esp: bad argument to #2 'SetAll'")
	for _,v in next, ss do
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
	assert(typeof(plr) == "Instance","Universal Esp: bad argument to #1 'GetObjects' (Instance expected, got "..typeof(plr)..")")
	assert(plr.ClassName == "Player","Universal Esp: bad argument to #1 'GetObjects' (Player expected, got "..plr.ClassName..")")
	local objects = {
		['Boxes'] = nil,
		['Tracers'] = nil,
		['Names'] = nil,
		['Skeletons'] = nil,
		['LookTracers'] = nil,
		['HealthBars'] = nil
	}
	for _,v in next, OBJECTS do
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
	for _,v in next, OBJECTS do
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
	if destroyed then return end
	conn1:Disconnect()
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
