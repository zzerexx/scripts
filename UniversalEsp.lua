if not getgenv().EspSettings then
	getgenv().EspSettings = {
		TeamCheck = false,
		ToggleKey = Enum.KeyCode.RightAlt,
		AntiDetection = true,
		Boxes = {
			Enabled = true,
			Transparency = 0.7,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
		},
		Tracers = {
			Enabled = true,
			Transparency = 0.7,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			Origin = "Top", -- "Top" or "Center" or "Bottom" or "Mouse"
			Thickness = 1
		},
		Names = {
			Enabled = true,
			Transparency = 0.7,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			Font = Drawing.Fonts.UI, -- UI or System or Plex or Monospace
			Size = 18,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
			ShowDistance = false,
			ShowHealth = true,
			UseDisplayName = false,
		},
		Skeletons = {
			Enabled = true,
			Transparency = 0.7,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			Thickness = 1
		},
		LookTracers = {
			Enabled = true,
			Transparency = 0.7,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			IgnoreWater = true,
			Thickness = 1
		},
		HealthBars = {
			Enabled = true,
			Transparency = 0.7,
			Color = Color3.fromRGB(0,255,0),
			OutlineColor = Color3.fromRGB(255,255,255),
			UseTeamColor = true -- this only applies to the outline
		}
	} -- v1.5.3
end
if getgenv().EspSettings and getgenv().EspSettings.AntiDetection then
	for _,v in next, getconnections(game:GetService("ScriptContext").Error) do
		v:Disable()
	end
end
if not Drawing then
	game:GetService("Players").LocalPlayer:Kick("\n\nUniversal Esp\nYour exploit does not have a Drawing Library!\n")
	return
end
if typeof(getgenv().UESP_RS) == "RBXScriptConnection" then
	getgenv().UESP_RS:Disconnect()
end
if typeof(getgenv().UESP_OBJECTS) == "table" then
	for _,v in next, getgenv().UESP_OBJECTS do
		if typeof(v.Object) == "table" then
			for _,v2 in next, v.Object do
				v2:Remove()
			end
		else
			v.Object:Remove()
		end
	end
	table.clear(getgenv().UESP_OBJECTS)
end

local players = game:GetService("Players")
local player = players.LocalPlayer
local camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local ss = getgenv().EspSettings
getgenv().UESP_OBJECTS = {}
getgenv().UESP_VISIBLE = true
getgenv().UESP_TOTALOBJECTS = function()
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
	for _,v in next, getgenv().UESP_OBJECTS do
		if typeof(v.Object) == "table" then
			for _,v2 in next, v.Object do
				data.DrawingObjects += 1
				if v2.Visible then
					data.VisibleObjects += 1
				end
				if v.Type == "Name" then
					data.Names += 1
				elseif v.Type == "Skeleton" then
					data.Skeletons += 1
				elseif v.Type == "HealthBar" then
					data.HealthBars += 1
				elseif v.Type == "Cham" then
					data.Chams += 1
				end
			end
		else
			data.DrawingObjects += 1
			if v.Object.Visible then
				data.VisibleObjects += 1
			end
			if v.Type == "Box" then
				data.Boxes += 1
			elseif v.Type == "Tracer" then
				data.Tracers += 1
			elseif v.Type == "LookTracer" then
				data.LookTracers += 1
			elseif v.Type == "Label" then
				data.Labels += 1
			end
		end
	end
	return data
end
local bodyparts = {
	"Head","UpperTorso","LowerTorso","LeftUpperArm","LeftLowerArm","LeftHand","RightUpperArm","RightLowerArm","RightHand","LeftUpperLeg","LeftLowerLeg","LeftFoot","RightUpperLeg","RightLowerLeg","RightFoot",
	"Torso","Left Arm","Right Arm","Left Leg","Right Leg",
	"Chest","Hips","LeftArm","LeftForearm","RightArm","RightForearm","LeftLeg","LeftForeleg","RightLeg","RightForeleg"
}
local gids = { -- game ids
	['arsenal'] = 111958650,
	['pf'] = 113491250,
	['pft'] = 115272207, -- pf test place
	['pfu'] = 1256867479, -- pf unstable branch
	['bb'] = 1168263273,
}

if game.GameId == (gids.pf or gids.pft or gids.pfu) then
	for _,v in next, getgc(true) do
		if typeof(v) == "table" and rawget(v,"getbodyparts") then
			getchar = rawget(v,"getbodyparts")
		elseif typeof(v) == "table" and rawget(v,"getplayerhealth") then
			gethealth = rawget(v,"getplayerhealth")
		end
	end
elseif game.GameId == gids.bb then
	for _,v in next, getgc(true) do
		if typeof(v) == "table" and rawget(v,"InitProjectile") and v.TS then
			ts = v.TS
		end
	end
end

function IsAlive(plr)
	if plr and plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid") and plr.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
		return true
	elseif game.GameId == (gids.pf or gids.pft or gids.pfu) then
		if plr and plr ~= player and getchar(plr,plr) ~= nil then
			return true
		end
	elseif game.GameId == gids.bb then
		if plr and plr ~= player and ts.Characters:GetCharacter(plr) ~= nil and ts.Characters:GetCharacter(plr):FindFirstChild("Health") and ts.Characters:GetCharacter(plr).Health.Value > 0 then
			return true
		end
	end
	return false
end
function RigType(plr)
	if game.GameId ~= gids.pf and game.GameId ~= gids.bb and plr.Character:FindFirstChild("UpperTorso") and plr.Character:FindFirstChild("LowerTorso") and plr.Character:FindFirstChild("LeftUpperArm") and plr.Character:FindFirstChild("LeftLowerArm") and plr.Character:FindFirstChild("LeftHand") and plr.Character:FindFirstChild("RightUpperArm") and plr.Character:FindFirstChild("RightLowerArm") and plr.Character:FindFirstChild("RightHand") and plr.Character:FindFirstChild("LeftUpperLeg") and plr.Character:FindFirstChild("LeftLowerLeg") and plr.Character:FindFirstChild("LeftFoot") and plr.Character:FindFirstChild("RightUpperLeg") and plr.Character:FindFirstChild("RightLowerLeg") and plr.Character:FindFirstChild("RightFoot") then
		return "R15"
	end
	return "R6"
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
function GetHealth(plr)
	if game.GameId == (gids.pf or gids.pft or gids.pfu) then
		return {math.floor(gethealth(plr,plr)),100}
	elseif game.GameId == gids.bb then 
		return {math.floor(ts.Characters:GetCharacter(plr).Health.Value),math.floor(ts.Characters:GetCharacter(plr).Health.MaxHealth.Value)}
	elseif game.GameId == gids.arsenal then
		return {math.floor(plr.NRPBS.Health.Value),math.floor(plr.NRPBS.MaxHealth.Value)}
	elseif plr.Character ~= nil and plr.Character:FindFirstChildOfClass("Humanoid") then
		return {math.floor(plr.Character.Humanoid.Health),math.floor(plr.Character.Humanoid.MaxHealth)}
	end
	return {100,100}
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
function Box(plr)
	ss = getgenv().EspSettings
	local box = Drawing.new("Quad")
	box.Visible = false
	box.Transparency = ss.Boxes.Transparency
	box.Color = ss.Boxes.Color
	box.Thickness = 1
	box.Filled = false
	table.insert(getgenv().UESP_OBJECTS,{Object = box,Type = "Box",Player = plr})
end
function Tracer(plr)
	ss = getgenv().EspSettings
	local tracer = Drawing.new("Line")
	tracer.Visible = false
	tracer.Transparency = ss.Tracers.Transparency
	tracer.Color = ss.Tracers.Color
	tracer.Thickness = ss.Tracers.Thickness
	table.insert(getgenv().UESP_OBJECTS,{Object = tracer,Type = "Tracer",Player = plr})
end
function Name(plr)
	ss = getgenv().EspSettings
	local objects = {
		Name = Drawing.new("Text"),
		Data = Drawing.new("Text")
	}
	for _,v in next, objects do
		v.Visible = false
		v.Transparency = ss.Names.Transparency
		v.Color = ss.Names.Color
		v.Text = plr.Name
		v.Size = ss.Names.Size
		v.Center = true
		v.Outline = ss.Names.Outline
		v.OutlineColor = ss.Names.OutlineColor
		v.Font = ss.Names.Font
	end
	table.insert(getgenv().UESP_OBJECTS,{Object = objects,Type = "Name",Player = plr})
end
function Skeleton(plr)
	ss = getgenv().EspSettings
	local objects = {
		-- R15
		UpperTorso = Drawing.new("Line"),
		LowerTorso = Drawing.new("Line"),
		LeftUpperArm = Drawing.new("Line"),
		LeftLowerArm = Drawing.new("Line"),
		LeftHand = Drawing.new("Line"),
		RightUpperArm = Drawing.new("Line"),
		RightLowerArm = Drawing.new("Line"),
		RightHand = Drawing.new("Line"),
		LeftUpperLeg = Drawing.new("Line"),
		LeftLowerLeg = Drawing.new("Line"),
		LeftFoot = Drawing.new("Line"),
		RightUpperLeg = Drawing.new("Line"),
		RightLowerLeg = Drawing.new("Line"),
		RightFoot = Drawing.new("Line"),
		-- R6
		Torso = Drawing.new("Line"),
		["Left Arm"] = Drawing.new("Line"),
		["Right Arm"] = Drawing.new("Line"),
		["Left Leg"] = Drawing.new("Line"),
		["Right Leg"] = Drawing.new("Line"),
		-- bad business
		Chest = Drawing.new("Line"),
		Hips = Drawing.new("Line"),
		LeftArm = Drawing.new("Line"),
		LeftForearm = Drawing.new("Line"),
		RightArm = Drawing.new("Line"),
		RightForearm = Drawing.new("Line"),
		LeftLeg = Drawing.new("Line"),
		LeftForeleg = Drawing.new("Line"),
		RightLeg = Drawing.new("Line"),
		RightForeleg = Drawing.new("Line"),
	}
	for _,v in next, objects do
		v.Visible = false
		v.Transparency = ss.Skeletons.Transparency
		v.Color = ss.Skeletons.Color
		v.Thickness = ss.Skeletons.Thickness
	end
	table.insert(getgenv().UESP_OBJECTS,{Object = objects,Type = "Skeleton",Player = plr})
end
function LookTracer(plr)
	ss = getgenv().EspSettings
	local tracer = Drawing.new("Line")
	tracer.Visible = false
	tracer.Transparency = ss.LookTracers.Transparency
	tracer.Color = ss.LookTracers.Color
	tracer.Thickness = ss.LookTracers.Thickness
	table.insert(getgenv().UESP_OBJECTS,{Object = tracer,Type = "LookTracer",Player = plr})
end
function HealthBar(plr)
	ss = getgenv().EspSettings
	local objects = {
		Bar = Drawing.new("Quad"),
		Outline = Drawing.new("Quad")
	}
	for _,v in next, objects do
		v.Visible = false
		v.Transparency = ss.HealthBars.Transparency
		v.Thickness = 1
	end
	objects.Bar.Color = ss.HealthBars.Color
	objects.Bar.Filled = true
	objects.Outline.Color = ss.HealthBars.OutlineColor
	objects.Outline.Filled = false
	table.insert(getgenv().UESP_OBJECTS,{Object = objects,Type = "HealthBar",Player = plr})
end

function Label(part,options)
	local label = Drawing.new("Text")
	label.Visible = false
	label.Transparency = options.Transparency or 0.7
	label.Color = options.Color or Color3.fromRGB(255,255,255)
	label.Size = options.Size or 18
	label.Center = true
	label.Outline = options.Outline or true
	label.OutlineColor = options.OutlineColor or Color3.fromRGB(0,0,0)
	label.Font = options.Font or Drawing.Fonts.UI
	table.insert(getgenv().UESP_OBJECTS,{Object = label,Type = "Label",Part = part,Options = options})
end
function Cham(part,options)
	local objects = {
		Top = Drawing.new("Quad"),
		Bottom = Drawing.new("Quad"),
		Left = Drawing.new("Quad"),
		Right = Drawing.new("Quad"),
		Front = Drawing.new("Quad"),
		Back = Drawing.new("Quad")
	}
	for _,v in next, objects do
		v.Visible = false
		v.Transparency = options.Transparency or 0.5
		v.Color = options.Color or Color3.fromRGB(255,255,255)
		v.Thickness = options.Thickness or 2
		v.Filled = options.Filled or true
	end
	table.insert(getgenv().UESP_OBJECTS,{Object = objects,Type = "Cham",Part = part,Options = options})
end

getgenv().UESP_RS = RunService.RenderStepped:Connect(function()
	for i,v in next, getgenv().UESP_OBJECTS do
		ss = getgenv().EspSettings
		local plr, part
		local cf, size, _, inViewport, tl, tr, bl, br
		local c1, c2, c3, c4, c5, c6, c7, c8, y1
		if v.Player then
			if IsAlive(v.Player) then
				-- from unnamed esp lololol
				plr = v.Player
				cf, size = GetChar(plr):GetBoundingBox()
				size /= 2
				_, inViewport = camera:WorldToViewportPoint(cf.Position)
				tl = camera:WorldToViewportPoint((cf * CFrame.new(-size.X,size.Y,0)).Position)
				tr = camera:WorldToViewportPoint((cf * CFrame.new(size.X,size.Y,0)).Position)
				bl = camera:WorldToViewportPoint((cf * CFrame.new(-size.X,-size.Y,0)).Position)
				br = camera:WorldToViewportPoint((cf * CFrame.new(size.X,-size.Y,0)).Position)
			end
		elseif v.Part then
			part = v.Part
			cf, size = v.Part.CFrame, v.Part.Size / 2
			_, inViewport = camera:WorldToViewportPoint(cf.Position)
			c1 = camera:WorldToViewportPoint((cf * CFrame.new(size.X,size.Y,size.Z)).Position)
			c2 = camera:WorldToViewportPoint((cf * CFrame.new(-size.X,size.Y,size.Z)).Position)
			c3 = camera:WorldToViewportPoint((cf * CFrame.new(-size.X,-size.Y,size.Z)).Position)
			c4 = camera:WorldToViewportPoint((cf * CFrame.new(size.X,-size.Y,size.Z)).Position)
			c5 = camera:WorldToViewportPoint((cf * CFrame.new(size.X,size.Y,-size.Z)).Position)
			c6 = camera:WorldToViewportPoint((cf * CFrame.new(-size.X,size.Y,-size.Z)).Position)
			c7 = camera:WorldToViewportPoint((cf * CFrame.new(-size.X,-size.Y,-size.Z)).Position)
			c8 = camera:WorldToViewportPoint((cf * CFrame.new(size.X,-size.Y,-size.Z)).Position)
			y1 = camera:WorldToViewportPoint(part.Position)
		end

		if v.Type == "Box" then
			local box = v.Object
			if getgenv().UESP_VISIBLE and ss.Boxes.Enabled and IsAlive(plr) then
				if inViewport then
					box.Transparency = ss.Boxes.Transparency
					box.PointA = Vector2.new(tr.X,tr.Y)
					box.PointB = Vector2.new(tl.X,tl.Y)
					box.PointC = Vector2.new(bl.X,bl.Y)
					box.PointD = Vector2.new(br.X,br.Y)
					box.Visible = (not ss.TeamCheck or (GetTeam(plr) ~= GetTeam(player) and ss.TeamCheck))
				else
					box.Visible = false
				end
				if ss.Boxes.UseTeamColor then
					box.Color = plr.TeamColor.Color
					if game.GameId == gids.bb then
						if GetTeam(plr) == "Omega" then
							box.Color = Color3.fromRGB(38,125,255)
						elseif GetTeam(plr) == "Beta" then
							box.Color = Color3.fromRGB(255,116,38)
						end
					end
				else
					box.Color = ss.Boxes.Color
				end
			else
				box.Visible = false
			end
		elseif v.Type == "Tracer" then
			local tracer = v.Object
			if getgenv().UESP_VISIBLE and ss.Tracers.Enabled and IsAlive(plr) then
				local origins = {
					['top'] = Vector2.new(camera.ViewportSize.X / 2, 0),
					['center'] = Vector2.new(camera.ViewportSize.X / 2,camera.ViewportSize.Y / 2),
					['bottom'] = Vector2.new(camera.ViewportSize.X / 2,camera.ViewportSize.Y),
					['mouse'] = game:GetService("UserInputService"):GetMouseLocation()
				}
				local origin = origins[ss.Tracers.Origin:lower() or "top"]
	
				if inViewport then
					tracer.Transparency = ss.Tracers.Transparency
					tracer.Thickness = ss.Tracers.Thickness
					tracer.From = origin
					tracer.To = Vector2.new(tl.X + (tr.X - tl.X) / 2,tl.Y + (tr.Y - tl.Y) / 2)
					tracer.Visible = (not ss.TeamCheck or (GetTeam(plr) ~= GetTeam(player) and ss.TeamCheck))
				else
					tracer.Visible = false
				end
				if ss.Tracers.UseTeamColor then
					tracer.Color = plr.TeamColor.Color
					if game.GameId == gids.bb then
						if GetTeam(plr) == "Omega" then
							tracer.Color = Color3.fromRGB(38,125,255)
						elseif GetTeam(plr) == "Beta" then
							tracer.Color = Color3.fromRGB(255,116,38)
						end
					end
				else
					tracer.Color = ss.Tracers.Color
				end
			else
				tracer.Visible = false
			end
		elseif v.Type == "Name" then
			local name = v.Object
			if getgenv().UESP_VISIBLE and ss.Names.Enabled and IsAlive(plr) then
				if inViewport then
					for _,v2 in next, name do
						v2.Transparency = ss.Names.Transparency
						v2.Size = ss.Names.Size
						v2.Outline = ss.Names.Outline
						v2.OutlineColor = ss.Names.OutlineColor
						v2.Font = ss.Names.Font
					end
					name.Name.Position = Vector2.new(tl.X + (tr.X - tl.X) / 2,tl.Y - (ss.Names.Size + 2))
					name.Data.Position = Vector2.new(tl.X + (tr.X - tl.X) / 2,bl.Y + (br.Y - bl.Y) / 2)
					if ss.HealthBars.Enabled then
						name.Data.Position = Vector2.new(name.Data.Position.X,name.Data.Position.Y + 15)
					end
					name.Name.Visible = (not ss.TeamCheck or (GetTeam(plr) ~= GetTeam(player) and ss.TeamCheck))
					name.Data.Visible = (not ss.TeamCheck or (GetTeam(plr) ~= GetTeam(player) and ss.TeamCheck))
					local mag
					if game.GameId == gids.bb then
						mag = math.floor((camera.CFrame.Position - GetChar(plr).Parent.Root.Position).Magnitude)
					elseif game.GameId == (gids.pf or gids.pft or gids.pfu) then
						mag = math.floor((camera.CFrame.Position - GetChar(plr).Torso.Position).Magnitude)
					else
						mag = math.floor((camera.CFrame.Position - GetChar(plr).HumanoidRootPart.Position).Magnitude)
					end
					local health = GetHealth(plr)
					name.Name.Text = ((not ss.Names.UseDisplayName and plr.Name) or (ss.Names.UseDisplayName and plr.DisplayName))
					name.Data.Text = ""
					if ss.Names.ShowDistance then
						name.Data.Text = "[ "..mag.."m ]"
					end
					if ss.Names.ShowHealth then
						name.Data.Text = name.Data.Text.." [ "..math.floor((health[1] / health[2]) * 100).."% ]"
					end
				else
					name.Name.Visible = false
					name.Data.Visible = false
				end
				if ss.Names.UseTeamColor then
					name.Name.Color = plr.TeamColor.Color
					name.Data.Color = plr.TeamColor.Color
					if game.GameId == gids.bb then
						if GetTeam(plr) == "Omega" then
							name.Name.Color = Color3.fromRGB(38,125,255)
							name.Data.Color = Color3.fromRGB(38,125,255)
						elseif GetTeam(plr) == "Beta" then
							name.Name.Color = Color3.fromRGB(255,116,38)
							name.Data.Color = Color3.fromRGB(255,116,38)
						end
					end
				else
					name.Name.Color = ss.Names.Color
					name.Data.Color = ss.Names.Color
				end
			else
				name.Name.Visible = false
				name.Data.Visible = false
			end
		elseif v.Type == "Skeleton" then
			local skeleton = v.Object
			if getgenv().UESP_VISIBLE and ss.Skeletons.Enabled and IsAlive(plr) or getgenv().UESP_VISIBLE and ss.Skeletons.Enabled and IsAlive(plr) and game.GameId == gids.bb then
				if inViewport then
					local From = {
						['UpperTorso'] = "Head",
						['LowerTorso'] = "UpperTorso",
						['LeftUpperArm'] = "UpperTorso",
						['RightUpperArm'] = "UpperTorso",
						['LeftLowerArm'] = "LeftUpperArm",
						['RightLowerArm'] = "RightUpperArm",
						['LeftHand'] = "LeftLowerArm",
						['RightHand'] = "RightLowerArm",
						['LeftUpperLeg'] = "LowerTorso",
						['RightUpperLeg'] = "LowerTorso",
						['LeftLowerLeg'] = "LeftUpperLeg",
						['RightLowerLeg'] = "RightUpperLeg",
						['LeftFoot'] = "LeftLowerLeg",
						['RightFoot'] = "RightLowerLeg",

						['Torso'] = "Head",
						['Left Arm'] = "Torso",
						['Right Arm'] = "Torso",
						['Left Leg'] = "Torso",
						['Right Leg'] = "Torso",

						-- bad business
						['Chest'] = "Head",
						['Hips'] = "Chest",
						['LeftArm'] = "Chest",
						['LeftForearm'] = "LeftArm",
						--['LeftHand'] = "LeftForearm",
						['RightArm'] = "Chest",
						['RightForearm'] = "RightArm",
						--['RightHand'] = "RightForearm",
						['LeftLeg'] = "Hips",
						['LeftForeleg'] = "LeftLeg",
						--['LeftFoot'] = "LeftForeleg",
						['RightLeg'] = "Hips",
						['RightForeleg'] = "RightLeg",
						--['RightFoot'] = "RightForeleg",
					}
					if game.GameId == gids.bb then
						From['LeftHand'] = "LeftForearm"
						From['RightHand'] = "RightForearm"
						From['LeftFoot'] = "LeftForeleg"
						From['RightFoot'] = "RightForeleg"
					end
					for i2,v2 in next, skeleton do
						v2.Visible = true
						v2.Transparency = ss.Skeletons.Transparency
						v2.Color = ss.Skeletons.Color
						v2.Thickness = ss.Skeletons.Thickness
						v2.Visible = (not ss.TeamCheck or (GetTeam(plr) ~= GetTeam(player) and ss.TeamCheck))

						if GetChar(plr):FindFirstChild(i2) then
							local vector1 = camera:WorldToViewportPoint(GetChar(plr):FindFirstChild(From[i2]).Position)
							v2.From = Vector2.new(vector1.X,vector1.Y)

							local vector2 = camera:WorldToViewportPoint(GetChar(plr)[i2].Position)
							v2.To = Vector2.new(vector2.X,vector2.Y)
						end
						if ss.Skeletons.UseTeamColor then
							v2.Color = plr.TeamColor.Color
							if game.GameId == gids.bb then
								if GetTeam(plr) == "Omega" then
									v2.Color = Color3.fromRGB(38,125,255)
								elseif GetTeam(plr) == "Beta" then
									v2.Color = Color3.fromRGB(255,116,38)
								end
							end
						else
							v2.Color = ss.Skeletons.Color
						end
					end
				else
					for _,v2 in next, skeleton do
						v2.Visible = false
					end
				end
			else
				for _,v2 in next, skeleton do
					v2.Visible = false
				end
			end
		elseif v.Type == "LookTracer" then
			-- Look Tracers have been disabled since it's kinda useless
			local tracer = v.Object
			if getgenv().UESP_VISIBLE and ss.LookTracers.Enabled and IsAlive(plr) and true == false then
				local params = RaycastParams.new()
				params.FilterDescendantsInstances = {GetChar(plr)}
				params.FilterType = Enum.RaycastFilterType.Blacklist
				params.IgnoreWater = ss.LookTracers.IgnoreWater
				local result = workspace:Raycast(GetChar(plr).Head.Position,GetChar(plr).Head.CFrame.LookVector * 500,params)
				if result ~= nil then
					local vector2, inViewport2 = camera:WorldToViewportPoint(result.Position)
					if inViewport and inViewport2 then
						tracer.Transparency = ss.LookTracers.Transparency
						tracer.Thickness = ss.LookTracers.Thickness
						tracer.From = Vector2.new(head.X,head.Y)
						tracer.To = Vector2.new(vector2.X,vector2.Y)
		
						if ss.TeamCheck and GetTeam(plr) == GetTeam(player) then
							tracer.Visible = false
						else
							tracer.Visible = true
						end
					else
						tracer.Visible = false
					end
					if ss.LookTracers.UseTeamColor then
						tracer.Color = plr.TeamColor.Color
						if game.GameId == gids.bb then
							if GetTeam(plr) == "Omega" then
								tracer.Color = Color3.fromRGB(38,125,255)
							elseif GetTeam(plr) == "Beta" then
								tracer.Color = Color3.fromRGB(255,116,38)
							end
						end
					else
						tracer.Color = ss.LookTracers.Color
					end
				end
			else
				tracer.Visible = false
			end
		elseif v.Type == "HealthBar" then
			local bar = v.Object.Bar
			local outline = v.Object.Outline
			if getgenv().UESP_VISIBLE and ss.HealthBars.Enabled and IsAlive(plr) then
				if inViewport then
					bar.Color = ss.HealthBars.Color
					bar.Transparency = ss.HealthBars.Transparency
					outline.Color = ss.HealthBars.OutlineColor
					outline.Transparency = ss.HealthBars.Transparency
					local health = (GetHealth(plr)[1] / GetHealth(plr)[2])
					bar.PointA = Vector2.new(
						bl.X + (br.X - bl.X) * health,
						(bl.Y + (br.Y - bl.Y) * health) + 5
					)
					bar.PointB = Vector2.new(
						bl.X,
						bl.Y + 5
					)
					bar.PointC = Vector2.new(
						bl.X,
						bl.Y + math.clamp(1000 / tl.Z,8,12)
					)
					bar.PointD = Vector2.new(
						bl.X + (br.X - bl.X) * health,
						(bl.Y + (br.Y - bl.Y) * health) + math.clamp(1000 / tl.Z,8,12)
					)

					outline.PointA = Vector2.new(br.X,br.Y + 5)
					outline.PointB = Vector2.new(bl.X,bl.Y + 5)
					outline.PointC = Vector2.new(bl.X,bl.Y + math.clamp(1000 / tl.Z,8,12))
					outline.PointD = Vector2.new(br.X,br.Y + math.clamp(1000 / tl.Z,8,12))
					
					if ss.TeamCheck and GetTeam(plr) == GetTeam(player) then
						bar.Visible = false
						outline.Visible = false
					else
						bar.Visible = true
						outline.Visible = true
					end
					if ss.HealthBars.UseTeamColor then
						outline.Color = plr.TeamColor.Color
						if game.GameId == gids.bb then
							if GetTeam(plr) == "Omega" then
								outline.Color = Color3.fromRGB(38,125,255)
							elseif GetTeam(plr) == "Beta" then
								outline.Color = Color3.fromRGB(255,116,38)
							end
						end
					else
						outline.Color = ss.HealthBars.OutlineColor
					end
				else
					bar.Visible = false
					outline.Visible = false
				end
			else
				bar.Visible = false
				outline.Visible = false
			end
		elseif v.Type == "Label" then
			if v.Part.Parent ~= nil then
				if getgenv().UESP_VISIBLE then
					if inViewport then
						v.Object.Visible = true
						v.Object.Transparency = v.Options.Transparency or 0.7
						v.Object.Color = v.Options.Color or Color3.fromRGB(255,255,255)
						v.Object.Text = v.Options.Text or part.Name
						v.Object.Size = v.Options.Size or 18
						v.Object.Outline = v.Options.Outline or true
						v.Object.OutlineColor = v.Options.OutlineColor or Color3.fromRGB(0,0,0)
						v.Object.Font = v.Options.Font or Drawing.Fonts.UI
	
						v.Object.Position = Vector2.new(y1.X,y1.Y - (v.Options.Size or 18) / 2)
					else
						v.Object.Visible = false
					end
				else
					v.Object.Visible = false
				end
			else
				v.Object:Remove()
				table.remove(getgenv().UESP_OBJECTS,i)
			end
		elseif v.Type == "Cham" then
			if v.Part.Parent ~= nil then
				if getgenv().UESP_VISIBLE then
					if inViewport then
						for _,v2 in next, v.Object do
							v2.Visible = true
							v2.Transparency = v.Options.Transparency or 0.5
							v2.Color = v.Options.Color or Color3.fromRGB(255,255,255)
							v2.Filled = v.Options.Filled or true
							v2.Thickness = v.Options.Thickness or 2
						end
	
						v.Object.Top.PointA = Vector2.new(c5.X,c5.Y)
						v.Object.Top.PointB = Vector2.new(c6.X,c6.Y)
						v.Object.Top.PointC = Vector2.new(c2.X,c2.Y)
						v.Object.Top.PointD = Vector2.new(c1.X,c1.Y)
	
						v.Object.Bottom.PointA = Vector2.new(c4.X,c4.Y)
						v.Object.Bottom.PointB = Vector2.new(c3.X,c3.Y)
						v.Object.Bottom.PointC = Vector2.new(c7.X,c7.Y)
						v.Object.Bottom.PointD = Vector2.new(c8.X,c8.Y)
	
						v.Object.Left.PointA = Vector2.new(c2.X,c2.Y)
						v.Object.Left.PointB = Vector2.new(c6.X,c6.Y)
						v.Object.Left.PointC = Vector2.new(c7.X,c7.Y)
						v.Object.Left.PointD = Vector2.new(c3.X,c3.Y)
	
						v.Object.Right.PointA = Vector2.new(c5.X,c5.Y)
						v.Object.Right.PointB = Vector2.new(c1.X,c1.Y)
						v.Object.Right.PointC = Vector2.new(c4.X,c4.Y)
						v.Object.Right.PointD = Vector2.new(c8.X,c8.Y)
	
						v.Object.Front.PointA = Vector2.new(c1.X,c1.Y)
						v.Object.Front.PointB = Vector2.new(c2.X,c2.Y)
						v.Object.Front.PointC = Vector2.new(c3.X,c3.Y)
						v.Object.Front.PointD = Vector2.new(c4.X,c4.Y)
	
						v.Object.Back.PointA = Vector2.new(c5.X,c5.Y)
						v.Object.Back.PointB = Vector2.new(c6.X,c6.Y)
						v.Object.Back.PointC = Vector2.new(c7.X,c7.Y)
						v.Object.Back.PointD = Vector2.new(c8.X,c8.Y)
					else
						for _,v2 in next, v.Object do
							v2.Visible = false
						end
					end
				else
					for _,v2 in next, v.Object do
						v2.Visible = false
					end
				end
			else
				for _,v2 in next, v.Object do
					v2:Remove()
				end
				table.remove(getgenv().UESP_OBJECTS,i)
			end
		end
	end
end)
game:GetService("UserInputService").InputBegan:Connect(function(i,gp)
	if not gp and i.KeyCode == (ss.ToggleKey or Enum.KeyCode[ss.ToggleKey]) then
		getgenv().UESP_VISIBLE = not getgenv().UESP_VISIBLE
	end
end)
for _,v in next, players:GetPlayers() do
	if v ~= player then
		Box(v)
		Tracer(v)
		Name(v)
		Skeleton(v)
		--LookTracer(v)
		HealthBar(v)
	end
end
players.PlayerAdded:Connect(function(v)
	if v ~= player then
		Box(v)
		Tracer(v)
		Name(v)
		Skeleton(v)
		--LookTracer(v)
		HealthBar(v)
	end
end)
players.PlayerRemoving:Connect(function(plr)
	for i,v in next, getgenv().UESP_OBJECTS do
		if v.Player == plr then
			table.remove(getgenv().UESP_OBJECTS,i)
			if typeof(v.Object) == "table" then
				for _,v2 in next, v.Object do
					v2:Remove()
				end
			else
				v.Object:Remove()
			end
		end
	end
end)

local esp = {}

function ValidType(type)
	if type == "Other" or getgenv().EspSettings[type] ~= nil then
		return true
	end
	return false
end
function ValidOption(type,option)
	if type == "Other" or getgenv().EspSettings[type][option] ~= nil then
		return true
	end
	return false
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
function esp.Label(part,options)
	assert(typeof(part) == "Instance","Universal Esp: bad argument to #1 'Label' (Instance expected, got "..typeof(part)..")")
	Label(part,options or {})
end
function esp.Cham(part,options)
	assert(typeof(part) == "Instance","Universal Esp: bad argument to #1 'Cham' (Instance expected, got "..typeof(part)..")")
	Cham(part,options or {})
end

return esp
