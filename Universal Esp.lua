-- Universal Esp by zzerexx#3970
getgenv().Settings = {
	Enabled = true, 
	ProtectGui = true, -- Only available for Synapse, ProtoSmasher, Script-Ware, Krnl
	OnlyEnemies = true,
	-- BOX ESP NOT READY
	BoxEsp = false,
	BoxTransparency = 0.75,
	BoxColor = Color3.fromRGB(0, 170, 255),
	BoxTeamColor = true,

	Chams = true,
	ChamsTransparency = 0.75,
	ChamsColor = Color3.fromRGB(0, 170, 255),
	ChamsTeamColor = true,
	-- TRACERS NOT READY
	Tracers = false, -- Drawing Library is required for this
	TracerTransparency = 0.4, -- Tracer Transparency is opposite to Roblox
	TracerColor = Color3.fromRGB(0, 0, 0),
	TracerOrigin = "Top", -- "Top" or "Center" or "Bottom" or "Cursor"
	TracerThickness = 1.5,
	TracerTeamColor = true,
	
	NameEsp = true,
	NameTextTransparency = 0,
	NameColor = Color3.fromRGB(255, 0, 0),
	NameFont = "SourceSans", -- Fonts: https://developer.roblox.com/en-us/api-reference/enum/Font
	NameTextScaled = false, -- useless feature
	NameTextSize = 18,
	NameTeamColor = true,

	HeadTracers = false, -- also useless feature
	HeadTracerTransparency = 0.3,
	HeadTracerColor = Color3.fromRGB(255, 0, 0),
	HeadTracerLength = 5,
	HeadTracerThickness = 0.05,
	HeadTracerTeamColor = true,
}
getgenv().RemoveTracers = false
local players = game:GetService("Players")
local characters = { "A","B","C","D","E","F","G","H","I","J","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","0","!","@","#","$","%","^","&","*","(",")","-","=","[","]","|",";","'",",",".","/","_","+","{","}",":","<",">","?","`","~" }
local classnames = { "ClickDetector","SunRaysEffect","Decal","RemoteEvent","SelectionBox","SurfaceAppearance","AlignOrientation","AnimationController","LineForce","PrismaticConstraint","Tool","Trail","Atmosphere","ForceField","Motor6D","Humanoid","ShirtGraphic","Explosion","RocketPropulsion","Weld","WorldModel","CompressorSoundEffect","BindableFunction","Team","Vector3Value","HumanoidDescription","ColorCorrectionEffect","Torque","BodyAngularVelocity","PointLight","LocalizationTable","SpecialMesh","FlangeSoundEffect","CFrameValue","BallSocketConstraint","DialogChoice","DepthOfFieldEffect","RemoteFunction" }
function randname() local randomname = characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)] return randomname end
local protected = Instance.new(classnames[math.random(1,#classnames)])
if getgenv().Settings.ProtectGui then
	if syn then
		syn.protect_gui(protected)
		protected.Parent = game:GetService("CoreGui")
	elseif PROTOSMASHER_LOADED then
		protected.Parent = get_hidden_gui()
	elseif KRNL_LOADED then -- temp removed script ware
		protected.Parent = gethui()
	else
		print("Your exploit does not support ProtectGui!")
		protected.Parent = game:GetService("CoreGui")
	end
else
	protected.Parent = game:GetService("CoreGui")
end
protected.Name = randname()
local function esp()
	getgenv().RemoveTracers = false
	for i,v in pairs(protected:GetChildren()) do
		v:Destroy()
	end
	local plrparts = {
		"Head","Torso","Left Arm","Right Arm","Left Leg","Right Leg", -- R6
		"UpperTorso","LowerTorso","LeftUpperArm","LeftLowerArm","LeftHand","RightUpperArm","RightLowerArm","RightHand","LeftUpperLeg","LeftLowerLeg","LeftFoot","RightUpperLeg","RightUpperLeg","RightFoot", -- R15
		"UpperLeftArm","LowerLeftArm","UpperRightArm","LowerRightArm","UpperLeftLeg","LowerLeftLeg","UpperRightLeg","LowerRightLeg","MidTorso","LeftHandle","RightHandle","Shoulders", -- AceOfSpadez Body Parts
		--"Neck","Chest","Abdomen","Hips","LeftForearm","RightForearm","LeftForeleg","RightForeleg" -- Bad Business Body Parts
	}
	for i,v in pairs(players:GetChildren()) do
		if v.Name ~= players.LocalPlayer.Name then
			local folder = Instance.new(classnames[math.random(1,#classnames)])
			folder.Parent = protected
			folder.Name = randname()
			if getgenv().Settings.HeadTracers == true then
				if v.Character:FindFirstChild("Head") then
					local htracerlength = getgenv().Settings.HeadTracerLength
					local Offset = htracerlength - (htracerlength * 2) - 1
					local HTracer = Instance.new("CylinderHandleAdornment")
					HTracer.Name = "HeadTracer".."_"..randname()
					HTracer.Parent = folder
					HTracer.Adornee = v.Character.Head 
					HTracer.Height = getgenv().Settings.HeadTracerLength
					HTracer.Radius = getgenv().Settings.HeadTracerThickness
					HTracer.SizeRelativeOffset = Vector3.new(0, 0.4, Offset)
					HTracer.AlwaysOnTop = true
					HTracer.Color3 = getgenv().Settings.HeadTracerColor
					HTracer.Transparency = getgenv().Settings.HeadTracerTransparency
					HTracer.ZIndex = 0
					if game.PlaceId == 3233893879 then -- Bad Business, does not work
						HTracer.Adornee = v.Character.Parent.Body.Head
					end
					if game.PlaceId == 142823291 then -- Murder Mystery 2
						if v.Backpack:FindFirstChild("Knife") or v.Character:FindFirstChild("Knife") then
							HTracer.Color3 = Color3.fromRGB(255, 0, 0) -- Murderer
						elseif v.Backpack:FindFirstChild("Gun") or v.Character:FindFirstChild("Gun") then
							HTracer.Color3 = Color3.fromRGB(0, 0, 255) -- Sheriff
						end
					end
					if getgenv().Settings.HeadTracerTeamColor == true then
						HTracer.Color3 = v.TeamColor.Color
					end
					if getgenv().Settings.OnlyEnemies == true then
						if v.Team == players.LocalPlayer.Team then
							HTracer:Destroy()
						end
					end
				end
			end
			if getgenv().Settings.NameEsp == true then
				if v.Character:FindFirstChild("Head") then
					local Billboard = Instance.new("BillboardGui")
					local Name = Instance.new("TextLabel")
					Billboard.Name = v.Name.."_"..randname()
					Billboard.Parent = folder
					Billboard.Adornee = v.Character.Head
					Billboard.Size = UDim2.new(10, 0, 4, 0)
					Billboard.ExtentsOffset = Vector3.new(0, 3, 0)
					Billboard.AlwaysOnTop = true
					Billboard.MaxDistance = math.huge
					Name.Name = "Name".."_"..randname()
					Name.Parent = Billboard
					Name.BackgroundTransparency = 1
					Name.TextTransparency = getgenv().Settings.NameTextTransparency
					Name.BorderSizePixel = 0
					Name.Font = getgenv().Settings.NameFont
					Name.Size = UDim2.new(1, 0, 1, 0)
					Name.Text = v.Name
					Name.TextColor3 = getgenv().Settings.NameColor
					Name.TextScaled = getgenv().Settings.NameTextScaled
					Name.TextSize = getgenv().Settings.NameTextSize
					if game.PlaceId == 3233893879 then -- Bad Business, does not work
						Billboard.Adornee = v.Character.Parent.Body.Head
					end 
					if game.PlaceId == 142823291 then -- Murder Mystery 2
						if v.Backpack:FindFirstChild("Knife") or v.Character:FindFirstChild("Knife") then
							Name.TextColor3 = Color3.fromRGB(255, 0, 0) -- Murderer
						elseif v.Backpack:FindFirstChild("Gun") or v.Character:FindFirstChild("Gun") then
							Name.TextColor3 = Color3.fromRGB(0, 0, 255) -- Sheriff
						end
					end
					if getgenv().Settings.NameTeamColor == true then
						Name.TextColor3 = v.TeamColor.Color
					end
					if getgenv().Settings.OnlyEnemies == true then
						if v.Team == players.LocalPlayer.Team then
							Billboard:Destroy()
						end
					end
				end
			end
			if getgenv().Settings.Chams == true then
				for i2,v2 in pairs(plrparts) do
					if v.Character:FindFirstChild(v2) then
						local Chams = Instance.new("BoxHandleAdornment")
						Chams.Name = v2.."_"..randname()
						Chams.Parent = folder
						Chams.Adornee = v.Character[v2]
						Chams.AlwaysOnTop = true
						Chams.Color3 = getgenv().Settings.ChamsColor
						Chams.Size = v.Character[v2].Size
						Chams.Transparency = getgenv().Settings.ChamsTransparency
						Chams.ZIndex = 0
						if game.PlaceId == 3233893879 then -- Bad Business, does not work
							Chams.Adornee = v.Character.Body[v2]
						end
						if game.PlaceId == 142823291 then -- Murder Mystery 2
							if v.Backpack:FindFirstChild("Knife") or v.Character:FindFirstChild("Knife") then
								Chams.Color3 = Color3.fromRGB(255, 0, 0) -- Murderer
							elseif v.Backpack:FindFirstChild("Gun") or v.Character:FindFirstChild("Gun") then
								Chams.Color3 = Color3.fromRGB(0, 0, 255) -- Sheriff
							end
						end
						if getgenv().Settings.ChamsTeamColor == true then
							Chams.Color3 = v.TeamColor.Color
						end
						if getgenv().Settings.OnlyEnemies == true then
							if v.Team == players.LocalPlayer.Team then
								Chams:Destroy()
							end
						end
					end -- FindFirstChild
				end -- for i2,v2
			end -- Settings.Chams
			if getgenv().Settings.Tracers == true then
				local camera = game:GetService("Workspace").CurrentCamera
				local cursor = game:GetService("UserInputService"):GetMouseLocation()
				local Tracer = Drawing.new("Line")
				Tracer.Visible = true
				Tracer.Thickness = getgenv().Settings.TracerThickness
				Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
				Tracer.To = Vector2.new()
				Tracer.Color = getgenv().Settings.TracerColor
				Tracer.Transparency = getgenv().Settings.TracerTransparency 
				if getgenv().Settings.TracerOrigin == "Top" then
					Tracer.From = Vector2.new(camera.ViewportSize.X / 2, 3)
				elseif getgenv().Settings.TracerOrigin == "Center" then
					Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
				elseif getgenv().Settings.TracerOrigin == "Bottom" then
					Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y)
				elseif getgenv().Settings.TracerOrigin == "Cursor" then
					cursor = game:GetService("UserInputService"):GetMouseLocation()
					Tracer.From = Vector2.new(cursor.X, cursor.Y)
				else
					Tracer.From = Vector2.new(camera.ViewportSize.X / 2, 3) -- Top by default because its the best :)
				end
				local RenderStepped
				RenderStepped = game:GetService("RunService").RenderStepped:Connect(function()
					if getgenv().RemoveTracers == true then
						Tracer:Remove()
						RenderStepped:Disconnect()
					end
					local Part = v.Character:WaitForChild("HumanoidRootPart")
					local vector, inViewport = camera:WorldToViewportPoint(Part.Position)
					if inViewport and getgenv().RemoveTracers == false then
						Tracer.Visible = true
						Tracer.To = Vector2.new(vector.X, vector.Y)
					elseif not inViewport and getgenv().RemoveTracers == false then
						Tracer.Visible = false
					end
					if getgenv().Settings.TracerOrigin == "Cursor" then
						cursor = game:GetService("UserInputService"):GetMouseLocation()
						Tracer.From = Vector2.new(cursor.X, cursor.Y)
					end
				end)
				if getgenv().Settings.TracerTeamColor == true then
					Tracer.Color = v.TeamColor.Color
				end
				if getgenv().Settings.OnlyEnemies == true then
					if v.Team == players.LocalPlayer.Team then
						Tracer:Remove()
					end
				end
			end
		end -- Name Check
	end -- For i,v
end -- Function
if getgenv().Settings.Enabled then esp() end
while wait(4) do
	esp()
end

--[[ Supported Games
	 Any game with normal character models
	 Arsenal
	 Counter Blox
	 Typical Colors 2
	 Unit: Classified
	 Unit 1968
	 RECOIL
	 No-Scope Sniping
	 Pistol 1v1
	 Polybattle
	 Big Paintball
	 AceOfSpadez
	 Murder Mystery 2
	 
	 Not Supported
	 Most games with custom character models
	 Phantom Forces
	 Strucid
	 Bad Business
	 Polyguns
	 Q-Clash
]]
