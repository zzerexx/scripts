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
			ShowHealth = false,
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
	} -- v1.5.1
end
if getgenv().EspSettings and getgenv().EspSettings.AntiDetection then
	for i,v in next, getconnections(game:GetService("ScriptContext").Error) do
		v:Disable()
	end
end
if not Drawing then
	game:GetService("Players").LocalPlayer:Kick("\n\nUniversal Esp\nYour exploit does not have a Drawing Library!\n")
	return
end
if typeof(getgenv().UNIVERSALESP_OBJECTS) == "table" then
	for i,v in next, getgenv().UNIVERSALESP_OBJECTS do
		if typeof(v.Object) == "table" then
			for _,v2 in next, v.Object do
				v2:Remove()
			end
		else
			v.Object:Remove()
		end
		table.remove(getgenv().UNIVERSALESP_OBJECTS,i)
	end
end
if typeof(getgenv().UNIVERSALESP_RS) == "RBXScriptConnection" then
	getgenv().UNIVERSALESP_RS:Disconnect()
end

local players = game:GetService("Players")
local player = players.LocalPlayer
local camera = workspace.CurrentCamera
local mouse = game:GetService("UserInputService"):GetMouseLocation()
local RunService = game:GetService("RunService")
local ss = getgenv().EspSettings
getgenv().UNIVERSALESP_OBJECTS = {}
getgenv().UNIVERSALESP_VISIBLE = true
local bodyparts = {"Head","UpperTorso","LowerTorso","LeftUpperArm","LeftLowerArm","LeftHand","RightUpperArm","RightLowerArm","RightHand","LeftUpperLeg","LeftLowerLeg","LeftFoot","RightUpperLeg","RightLowerLeg","RightFoot","Torso","Left Arm","Right Arm","Left Leg","Right Leg"}

function IsAlive(plr)
	if plr and plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid") and plr.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
		return true
	end
	return false
end
function RigType(plr)
	if plr.Character:FindFirstChild("UpperTorso") and plr.Character:FindFirstChild("LowerTorso") and plr.Character:FindFirstChild("LeftUpperArm") and plr.Character:FindFirstChild("LeftLowerArm") and plr.Character:FindFirstChild("LeftHand") and plr.Character:FindFirstChild("RightUpperArm") and plr.Character:FindFirstChild("RightLowerArm") and plr.Character:FindFirstChild("RightHand") and plr.Character:FindFirstChild("LeftUpperLeg") and plr.Character:FindFirstChild("LeftLowerLeg") and plr.Character:FindFirstChild("LeftFoot") and plr.Character:FindFirstChild("RightUpperLeg") and plr.Character:FindFirstChild("RightLowerLeg") and plr.Character:FindFirstChild("RightFoot") then
		return "R15"
	end
	return "R6"
end
function Box(plr)
	ss = getgenv().EspSettings
	local box = Drawing.new("Square")
	box.Visible = false
	box.Transparency = ss.Boxes.Transparency
	box.Color = ss.Boxes.Color
	box.Thickness = 1
	box.Filled = false
	table.insert(getgenv().UNIVERSALESP_OBJECTS,{Object = box,Type = "Box",Player = plr})
end
function Tracer(plr)
	ss = getgenv().EspSettings
	local tracer = Drawing.new("Line")
	tracer.Visible = false
	tracer.Transparency = ss.Tracers.Transparency
	tracer.Color = ss.Tracers.Color
	tracer.Thickness = ss.Tracers.Thickness
	table.insert(getgenv().UNIVERSALESP_OBJECTS,{Object = tracer,Type = "Tracer",Player = plr})
end
function Name(plr)
	ss = getgenv().EspSettings
	local name = Drawing.new("Text")
	name.Visible = false
	name.Transparency = ss.Names.Transparency
	name.Color = ss.Names.Color
	name.Text = plr.Name
	name.Size = ss.Names.Size
	name.Center = true
	name.Outline = ss.Names.Outline
	name.OutlineColor = ss.Names.OutlineColor
	name.Font = ss.Names.Font
	table.insert(getgenv().UNIVERSALESP_OBJECTS,{Object = name,Type = "Name",Player = plr})
end
function Skeleton(plr)
	ss = getgenv().EspSettings
	local objects = {
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

		Torso = Drawing.new("Line"),
		["Left Arm"] = Drawing.new("Line"),
		["Right Arm"] = Drawing.new("Line"),
		["Left Leg"] = Drawing.new("Line"),
		["Right Leg"] = Drawing.new("Line")
	}
	for i,v in next, objects do
		v.Visible = false
		v.Transparency = ss.Skeletons.Transparency
		v.Color = ss.Skeletons.Color
		v.Thickness = ss.Skeletons.Thickness
	end
	table.insert(getgenv().UNIVERSALESP_OBJECTS,{Object = objects,Type = "Skeleton",Player = plr})
end
function LookTracer(plr)
	ss = getgenv().EspSettings
	local tracer = Drawing.new("Line")
	tracer.Visible = false
	tracer.Transparency = ss.LookTracers.Transparency
	tracer.Color = ss.LookTracers.Color
	tracer.Thickness = ss.LookTracers.Thickness
	table.insert(getgenv().UNIVERSALESP_OBJECTS,{Object = tracer,Type = "LookTracer",Player = plr})
end
function HealthBar(plr)
	ss = getgenv().EspSettings
	local objects = {
		Bar = Drawing.new("Square"),
		Outline = Drawing.new("Square")
	}
	for i,v in next, objects do
		v.Visible = false
		v.Transparency = ss.HealthBars.Transparency
		v.Thickness = 1
	end
	objects.Bar.Color = ss.HealthBars.Color
	objects.Bar.Filled = true
	objects.Outline.Color = ss.HealthBars.OutlineColor
	objects.Outline.Filled = false
	table.insert(getgenv().UNIVERSALESP_OBJECTS,{Object = objects,Type = "HealthBar",Player = plr})
end

getgenv().UNIVERSALESP_RS = RunService.RenderStepped:Connect(function()
	for i,v in next, getgenv().UNIVERSALESP_OBJECTS do
		ss = getgenv().EspSettings
		local plr = v.Player
		if v.Type == "Box" then
			local box = v.Object
			if getgenv().UNIVERSALESP_VISIBLE and ss.Boxes.Enabled and IsAlive(plr) then
				local hrp, inViewport = camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
				local head = camera:WorldToViewportPoint(plr.Character.Head.Position + Vector3.new(0,0.5,0))
				local leg = camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position - Vector3.new(0,3,0))

				if inViewport then
					box.Transparency = ss.Boxes.Transparency
					box.Size = Vector2.new(1000 / hrp.Z, head.Y - leg.Y)
					box.Position = Vector2.new(hrp.X - box.Size.X / 2, hrp.Y - (box.Size.Y / 2))

					if ss.TeamCheck and plr.Team == player.Team then
						box.Visible = false
					else
						box.Visible = true
					end
				else
					box.Visible = false
				end
				if ss.Boxes.UseTeamColor then
					box.Color = plr.TeamColor.Color
				else
					box.Color = ss.Boxes.Color
				end
			else
				box.Visible = false
			end
		elseif v.Type == "Tracer" then
			local tracer = v.Object
			if getgenv().UNIVERSALESP_VISIBLE and ss.Tracers.Enabled and IsAlive(plr) then
				local vector, inViewport = camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
				
				local top = Vector2.new(camera.ViewportSize.X / 2, 0)
				local center = Vector2.new(camera.ViewportSize.X / 2,camera.ViewportSize.Y / 2)
				local bottom = Vector2.new(camera.ViewportSize.X / 2,camera.ViewportSize.Y)
				mouse = game:GetService("UserInputService"):GetMouseLocation()
				local origin = top
				if ss.Tracers.Origin:lower() == "center" then
					origin = center
				elseif ss.Tracers.Origin:lower() == "bottom" then
					origin = bottom
				elseif ss.Tracers.Origin:lower() == "mouse" then
					origin = mouse
				end
	
				if inViewport then
					tracer.Transparency = ss.Tracers.Transparency
					tracer.Thickness = ss.Tracers.Thickness
					tracer.From = origin
					tracer.To = Vector2.new(vector.X,vector.Y)
	
					if ss.TeamCheck and plr.Team == player.Team then
						tracer.Visible = false
					else
						tracer.Visible = true
					end
				else
					tracer.Visible = false
				end
				if ss.Tracers.UseTeamColor then
					tracer.Color = plr.TeamColor.Color
				else
					tracer.Color = ss.Tracers.Color
				end
			else
				tracer.Visible = false
			end
		elseif v.Type == "Name" then
			local name = v.Object
			if getgenv().UNIVERSALESP_VISIBLE and ss.Names.Enabled and IsAlive(plr) then
				local vector, inViewport = camera:WorldToViewportPoint(plr.Character.Head.Position + Vector3.new(0,plr.Character.Head.Size.Y * 2,0))
				if inViewport then
					name.Transparency = ss.Names.Transparency
					name.Size = ss.Names.Size
					name.Outline = ss.Names.Outline
					name.OutlineColor = ss.Names.OutlineColor
					name.Position = Vector2.new(vector.X,vector.Y)
					name.Font = ss.Names.Font
					if ss.TeamCheck and plr.Team == player.Team then
						name.Visible = false
					else
						name.Visible = true
					end
					local mag = 0
					if player.Character:FindFirstChild("HumanoidRootPart") then
						mag = math.floor((player.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude)
					end
					local health = math.floor(plr.Character:FindFirstChildOfClass("Humanoid").Health)
					local max = math.floor(plr.Character:FindFirstChildOfClass("Humanoid").MaxHealth)
					if game.GameId == 111958650 then
						health = plr.NRPBS.Health.Value
						max = plr.NRPBS.MaxHealth.Value
					end
					local plrname = plr.Name
					if ss.Names.UseDisplayName then
						plrname = plr.DisplayName
					end
					if ss.Names.ShowDistance and ss.Names.ShowHealth then
						name.Text = plrname.." [ "..mag.." ] [ "..health.."/"..max.." ]"
					elseif ss.Names.ShowDistance then
						name.Text = plrname.." [ "..mag.." ]"
					elseif ss.Names.ShowHealth then
						name.Text = plrname.." [ "..health.."/"..max.." ]"
					else
						name.Text = plrname
					end
				else
					name.Visible = false
				end
				if ss.Names.UseTeamColor then
					name.Color = plr.TeamColor.Color
				else
					name.Color = ss.Names.Color
				end
			else
				name.Visible = false
			end
		elseif v.Type == "Skeleton" then
			local skeleton = v.Object
			if getgenv().UNIVERSALESP_VISIBLE and ss.Skeletons.Enabled and IsAlive(plr) and RigType(plr) == "R15" then
				local _, inViewport = camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
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
					}
					for i2,v2 in next, skeleton do
						v2.Visible = true
						v2.Transparency = ss.Skeletons.Transparency
						v2.Color = ss.Skeletons.Color
						v2.Thickness = ss.Skeletons.Thickness
						if ss.TeamCheck and plr.Team == player.Team then
							v2.Visible = false
						end

						if plr.Character:FindFirstChild(i2) then
							local vector1 = camera:WorldToViewportPoint(plr.Character:FindFirstChild(From[i2]).Position)
							v2.From = Vector2.new(vector1.X,vector1.Y)

							local vector2 = camera:WorldToViewportPoint(plr.Character[i2].Position)
							v2.To = Vector2.new(vector2.X,vector2.Y)
						end
					end
				else
					for i2,v2 in next, skeleton do
						v2.Visible = false
					end
				end
				for i2,v2 in next, skeleton do
					if ss.Skeletons.UseTeamColor then
						v2.Color = plr.TeamColor.Color
					else
						v2.Color = ss.Skeletons.Color
					end
				end
			else
				for i2,v2 in next, skeleton do
					v2.Visible = false
				end
			end
		elseif v.Type == "LookTracer" then
			local tracer = v.Object
			if getgenv().UNIVERSALESP_VISIBLE and ss.LookTracers.Enabled and IsAlive(plr) then
				local vector, inViewport = camera:WorldToViewportPoint(plr.Character.Head.Position)
				local params = RaycastParams.new()
				params.FilterDescendantsInstances = {plr.Character}
				params.FilterType = Enum.RaycastFilterType.Blacklist
				params.IgnoreWater = ss.LookTracers.IgnoreWater
				local result = workspace:Raycast(plr.Character.Head.Position,plr.Character.Head.CFrame.LookVector * 500,params)
				if result ~= nil then
					local vector2, inViewport2 = camera:WorldToViewportPoint(result.Position)
					if inViewport and inViewport2 then
						tracer.Transparency = ss.LookTracers.Transparency
						tracer.Thickness = ss.LookTracers.Thickness
						tracer.From = Vector2.new(vector.X,vector.Y)
						tracer.To = Vector2.new(vector2.X,vector2.Y)
		
						if ss.TeamCheck and plr.Team == player.Team then
							tracer.Visible = false
						else
							tracer.Visible = true
						end
					else
						tracer.Visible = false
					end
					if ss.LookTracers.UseTeamColor then
						tracer.Color = plr.TeamColor.Color
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
			if getgenv().UNIVERSALESP_VISIBLE and ss.HealthBars.Enabled and IsAlive(plr) then
				local hrp, inViewport = camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
				local head = camera:WorldToViewportPoint(plr.Character.Head.Position + Vector3.new(0,0.5,0))
				local leg = camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position - Vector3.new(0,3,0))

				if inViewport then
					local size = Vector2.new(1000 / hrp.Z,head.Y - leg.Y)
					bar.Color = ss.HealthBars.Color
					bar.Transparency = ss.HealthBars.Transparency
					bar.Size = Vector2.new(3, (head.Y - leg.Y) - 4)
					bar.Position = Vector2.new((hrp.X - size.X / 2) - 6, (hrp.Y - (bar.Size.Y / 2)))
					outline.Color = ss.HealthBars.OutlineColor
					outline.Transparency = ss.HealthBars.Transparency
					outline.Size = Vector2.new(5, (head.Y - leg.Y))
					outline.Position = Vector2.new((hrp.X - size.X / 2) - 7, (hrp.Y - (bar.Size.Y / 2)) - 2)

					local health = math.floor(plr.Character:FindFirstChildOfClass("Humanoid").Health)
					local max = math.floor(plr.Character:FindFirstChildOfClass("Humanoid").MaxHealth)
					if game.GameId == 111958650 then
						health = plr.NRPBS.Health.Value
						max = plr.NRPBS.MaxHealth.Value
					end
					bar.Size = Vector2.new(3, ((head.Y - leg.Y) - 4) * (health / max))
					bar.Position = Vector2.new((hrp.X - size.X / 2) -6, (hrp.Y - (bar.Size.Y / 2)) - (bar.Size.Y / 1000))

					if ss.TeamCheck and plr.Team == player.Team then
						bar.Visible = false
						outline.Visible = false
					else
						bar.Visible = true
						outline.Visible = true
					end
					if ss.HealthBars.UseTeamColor then
						outline.Color = plr.TeamColor.Color
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
		end
	end
end)
game:GetService("UserInputService").InputBegan:Connect(function(i,gp)
	if not gp and i.KeyCode == (ss.ToggleKey or Enum.KeyCode[ss.ToggleKey]) then
		getgenv().UNIVERSALESP_VISIBLE = not getgenv().UNIVERSALESP_VISIBLE
	end
end)
for i,v in next, players:GetPlayers() do
	Box(v)
	Tracer(v)
	Name(v)
	Skeleton(v)
	LookTracer(v)
	HealthBar(v)
end
players.PlayerAdded:Connect(function(v)
	Box(v)
	Tracer(v)
	Name(v)
	Skeleton(v)
	LookTracer(v)
	HealthBar(v)
end)
players.PlayerRemoving:Connect(function(plr)
	for i,v in next, getgenv().UNIVERSALESP_OBJECTS do
		if v.Player == plr then
			if typeof(v.Object) == "table" then
				for _,v2 in next, v.Object do
					v2:Remove()
				end
			else
				v.Object:Remove()
			end
			table.remove(getgenv().UNIVERSALESP_OBJECTS,i)
		end
	end
end)

local esp = {}

function ValidType(type)
	if getgenv().EspSettings[type] ~= nil then
		return true
	end
	return false
end
function ValidOption(type,option)
	if getgenv().EspSettings[type][option] ~= nil then
		return true
	end
	return false
end
function esp:Toggle(type)
	assert(ValidType(type),"Universal Esp: bad argument to #1 'Toggle' (Invalid Esp Type)")
	if type == ("TeamCheck" or "ToggleKey" or "AntiDetection") then
		getgenv().EspSettings[type] = not getgenv().EspSettings[type]
	else
		getgenv().EspSettings[type].Enabled = not getgenv().EspSettings[type].Enabled
	end
end
function esp:Get(type,option)
	assert(ValidType(type),"Universal Esp: bad argument to #1 'Get' (Invalid Esp Type)")
	assert(ValidOption(type,option),"Universal Esp: bad argument to #2 'Get' (Invalid Option)")
	if type == ("TeamCheck" or "ToggleKey" or "AntiDetection") then
		return getgenv().EspSettings[type]
	end
	return getgenv().EspSettings[type][option]
end
function esp:Set(type,option,value)
	assert(ValidType(type),"Universal Esp: bad argument to #1 'Set' (Invalid Esp Type)")
	assert(ValidOption(type,option),"Universal Esp: bad argument to #2 'Set' (Invalid Option)")
	assert(value ~= nil,"Universal Esp: bad argument to #3 'Set'")
	getgenv().EspSettings[type][option] = value
	if type == ("TeamCheck" or "ToggleKey" or "AntiDetection") then
		getgenv().EspSettings[type] = value
	else
		getgenv().EspSettings[type][option] = value
	end
end

return esp
