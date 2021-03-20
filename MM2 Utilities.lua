-- Murder Mystery 2 Utilities by zzerexx#3970
print("Loaded all settings    [1/6]")
if game.PlaceId ~= 142823291 then game:GetService("TeleportService"):Teleport(142823291) end
if typeof(getgenv().mm2) == "Instance" then getgenv().mm2:Destroy() end
local ss = getgenv().Settings
local players = game:GetService("Players")
local player = players.LocalPlayer
local camera = workspace.CurrentCamera
local mouse = player:GetMouse()
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
print("Loaded all variables   [2/6]")
local MM2 = Instance.new("ScreenGui")
local Topbar = Instance.new("Frame")
local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Murderer = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local Sheriff = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local MurdererText = Instance.new("TextLabel")
local SheriffText = Instance.new("TextLabel")
local GunDropText = Instance.new("TextLabel")
local GunDrop = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local UICorner_5 = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local Credit = Instance.new("TextLabel")
local Spectating = Instance.new("TextLabel")
print("Loaded all instances   [3/6]")
if game.PlaceId ~= 142823291 then MM2:Destroy() end

MM2.Name = "MM2"
MM2.Parent = game:GetService("CoreGui")
getgenv().mm2 = MM2

Topbar.Name = "Topbar"
Topbar.Parent = MM2
Topbar.AnchorPoint = Vector2.new(0.5,0.5)
Topbar.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
Topbar.Position = UDim2.new(0.5, 0, 0.375, 0)
Topbar.Size = UDim2.new(0, 170, 0, 30)
Topbar.ZIndex = 11

Main.Name = "Main"
Main.Parent = Topbar
Main.AnchorPoint = Vector2.new(0.5,0)
Main.ClipsDescendants = true
Main.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Main.Position = UDim2.new(0.5, 0, 0, 0)
Main.Size = UDim2.new(0, 170, 0, 209)
Main.ZIndex = 10

UICorner.Name = "UICorner"
UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = Main

Murderer.Name = "Murderer"
Murderer.Parent = Main
Murderer.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
Murderer.Position = UDim2.new(0.0602940023, 0, 0.142000005, 25)
Murderer.Size = UDim2.new(0, 150, 0, 30)
Murderer.ZIndex = 11
Murderer.Font = Enum.Font.GothamBold
Murderer.Text = "None"
Murderer.TextColor3 = Color3.fromRGB(255, 100, 100)
Murderer.TextSize = 16.000
Murderer.AutoButtonColor = false

UICorner_2.Name = "UICorner"
UICorner_2.CornerRadius = UDim.new(0, 6)
UICorner_2.Parent = Murderer

Sheriff.Name = "Sheriff"
Sheriff.Parent = Main
Sheriff.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
Sheriff.Position = UDim2.new(0.0602940321, 0, 0.400999993, 25)
Sheriff.Size = UDim2.new(0, 150, 0, 30)
Sheriff.ZIndex = 11
Sheriff.Font = Enum.Font.GothamBold
Sheriff.Text = "None"
Sheriff.TextColor3 = Color3.fromRGB(100, 100, 255)
Sheriff.TextSize = 16.000
Sheriff.AutoButtonColor = false

UICorner_3.Name = "UICorner"
UICorner_3.CornerRadius = UDim.new(0, 6)
UICorner_3.Parent = Sheriff

MurdererText.Name = "MurdererText"
MurdererText.Parent = Main
MurdererText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MurdererText.BackgroundTransparency = 1.000
MurdererText.Position = UDim2.new(0.0544118881, 0, 0.144037277, 0)
MurdererText.Size = UDim2.new(0, 150, 0, 24)
MurdererText.ZIndex = 11
MurdererText.Font = Enum.Font.GothamBold
MurdererText.Text = "Murderer"
MurdererText.TextColor3 = Color3.fromRGB(255, 0, 0)
MurdererText.TextSize = 16.000

SheriffText.Name = "SheriffText"
SheriffText.Parent = Main
SheriffText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SheriffText.BackgroundTransparency = 1.000
SheriffText.Position = UDim2.new(0.0602941513, 0, 0.403182238, 0)
SheriffText.Size = UDim2.new(0, 150, 0, 24)
SheriffText.ZIndex = 11
SheriffText.Font = Enum.Font.GothamBold
SheriffText.Text = "Sheriff"
SheriffText.TextColor3 = Color3.fromRGB(0, 0, 255)
SheriffText.TextSize = 16.000

GunDropText.Name = "GunDropText"
GunDropText.Parent = Main
GunDropText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GunDropText.BackgroundTransparency = 1.000
GunDropText.Position = UDim2.new(0.0602941513, 0, 0.661555469, 0)
GunDropText.Size = UDim2.new(0, 150, 0, 24)
GunDropText.ZIndex = 11
GunDropText.Font = Enum.Font.GothamBold
GunDropText.Text = "Gun Dropped"
GunDropText.TextColor3 = Color3.fromRGB(0, 255, 0)
GunDropText.TextSize = 16.000

GunDrop.Name = "GunDrop"
GunDrop.Parent = Main
GunDrop.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
GunDrop.Position = UDim2.new(0.0602940321, 0, 0.660000026, 25)
GunDrop.Size = UDim2.new(0, 150, 0, 30)
GunDrop.ZIndex = 11
GunDrop.Font = Enum.Font.GothamBold
GunDrop.Text = "nil"
GunDrop.TextColor3 = Color3.fromRGB(255, 255, 255)
GunDrop.TextSize = 16.000
GunDrop.AutoButtonColor = false

UICorner_4.Name = "UICorner"
UICorner_4.CornerRadius = UDim.new(0, 6)
UICorner_4.Parent = GunDrop

UICorner_5.Name = "UICorner"
UICorner_5.CornerRadius = UDim.new(0, 6)
UICorner_5.Parent = Topbar

Title.Name = "Title"
Title.Parent = Topbar
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.247058824, 0, 0, 0)
Title.Size = UDim2.new(0, 85, 0, 30)
Title.ZIndex = 12
Title.Font = Enum.Font.GothamBold
Title.Text = "Error Occurred" -- dont change
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16.000

Credit.Name = "Credit"
Credit.Parent = Main
Credit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credit.BackgroundTransparency = 1.000
Credit.Position = UDim2.new(0.06, 0, 0.923, 0)
Credit.Size = UDim2.new(0, 150, 0, 15)
Credit.ZIndex = 11
Credit.Font = Enum.Font.GothamBold
Credit.Text = "Made by zzerexx#3970"
Credit.TextColor3 = Color3.fromRGB(255, 255, 255)
Credit.TextSize = 12.000

Spectating.Name = "Spectating"
Spectating.Parent = MM2
Spectating.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Spectating.BackgroundTransparency = 1.000
Spectating.Position = UDim2.new(0.5, 0, 0.8, 0)
Spectating.Size = UDim2.new(0, 150, 0, 15)
Spectating.ZIndex = 15
Spectating.Font = Enum.Font.GothamBold
Spectating.Text = "Spectating: None"
Spectating.TextColor3 = Color3.fromRGB(255, 255, 255)
Spectating.TextSize = 32.000
Spectating.AnchorPoint = Vector2.new(0.5,0.5)
Spectating.Visible = false
print("Loaded all properties  [4/6]")
local folder = Instance.new("Folder")
folder.Parent = MM2
folder.Name = "Folder"
function notif(text)
	if typeof(text) == "string" and ss.Notifications then
		game.StarterGui:SetCore("SendNotification", {
			Title = "MM2 Utilities",
			Text = text,
			Duration = 1.5,
			Button1 = "Ok" 
		})
	end
end
local aimbottoggled = false
UIS.InputBegan:Connect(function(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.Y then
		aimbottoggled = not aimbottoggled
		notif("Aimbot toggled: "..tostring(aimbottoggled))
	end
end)
function mm2()
	for i,v in pairs(folder:GetChildren()) do
		v:Destroy()
	end
	for i,v in pairs(workspace:GetDescendants()) do
		if v.Name == "Raggy" and ss.RemoveRagdolls then
			v:Destroy()
		elseif v.Name == "GlitchProof" and v.ClassName == "Model" and ss.RemoveBarriers then
			v:Destroy()
		end
	end
	for i,v in pairs(players:GetChildren()) do
		if v.Name ~= player.Name and not folder:FindFirstChild(v.Name) then
			if ss.NameEsp then
				local Billboard = Instance.new("BillboardGui")
				local Name = Instance.new("TextLabel")
				Billboard.Name = v.Name
				Billboard.Parent = folder
				Billboard.Adornee = v.Character.Head
				Billboard.Size = UDim2.new(10, 0, 4, 0)
				Billboard.ExtentsOffset = Vector3.new(0, 3, 0)
				Billboard.AlwaysOnTop = true
				Billboard.MaxDistance = math.huge
				Name.Name = "Name"
				Name.Parent = Billboard
				Name.BackgroundTransparency = 1
				Name.TextTransparency = ss.NameTextTransparency
				Name.BorderSizePixel = 0
				Name.Font = ss.NameFont
				Name.Size = UDim2.new(1, 0, 1, 0)
				Name.Text = v.Name
				Name.TextColor3 = ss.InnocentColor
				Name.TextScaled = false
				Name.TextSize = 18
				if v.Backpack:FindFirstChild("Knife") or v.Character:FindFirstChild("Knife") then
					Murderer.Text = v.Name
					Name.TextColor3 = ss.MurdererColor
					if not Murderer.TextFits then
						Murderer.TextScaled = true
					else
						Murderer.TextScaled = false
					end
				elseif v.Backpack:FindFirstChild("Gun") or v.Character:FindFirstChild("Gun") then
					Sheriff.Text = v.Name
					Name.TextColor3 = ss.SheriffColor
					if not Sheriff.TextFits then
						Sheriff.TextScaled = true
					else
						Sheriff.TextScaled = false
					end
				elseif ss.AvoidInnocents and not v.Backpack:FindFirstChild("Knife") or v.Character:FindFirstChild("Knife") or v.Backpack:FindFirstChild("Gun") or v.Character:FindFirstChild("Gun") then
					Billboard:Destroy()
				end
			end -- ss.NameEsp
		end -- Name Check
	end -- for i,v
	if workspace:FindFirstChild("GunDrop",true) then
		if ss.GunEsp then
			local GunEsp = Instance.new("BoxHandleAdornment")
			GunEsp.Name = "Gun"
			GunEsp.Parent = folder
			GunEsp.Adornee = game.Workspace.GunDrop
			GunEsp.AlwaysOnTop = true
			GunEsp.Color3 = ss.GunEspColor
			GunEsp.Size = game.Workspace.GunDrop.Size
			GunEsp.Transparency = 0.6
			GunEsp.ZIndex = 0
			if ss.GunNameEsp then
				local Billboard = Instance.new("BillboardGui")
				local Name = Instance.new("TextLabel")
				Billboard.Name = "Gun"
				Billboard.Parent = folder
				Billboard.Adornee = game.Workspace.GunDrop
				Billboard.Size = UDim2.new(10, 0, 4, 0)
				Billboard.ExtentsOffset = Vector3.new(0, 3, 0)
				Billboard.AlwaysOnTop = true
				Billboard.MaxDistance = math.huge
				Name.Name = "Name"
				Name.Parent = Billboard
				Name.BackgroundTransparency = 1
				Name.TextTransparency = ss.GunNameTransparency
				Name.BorderSizePixel = 0
				Name.Font = ss.NameFont
				Name.Size = UDim2.new(1, 0, 1, 0)
				Name.Text = "Gun"
				Name.TextColor3 = ss.GunNameColor
				Name.TextScaled = false
				Name.TextSize = 18
			end
		end
		if ss.AutoPickupGun then
			local hrp = player.Character.HumanoidRootPart
			local OldCF = hrp.CFrame
			hrp.CFrame = game.Workspace.GunDrop.CFrame
			wait(0.2)
			hrp.CFrame = OldCF
		end
		GunDrop.Text = "True"
		GunDrop.TextColor3 = ss.GColorT
	else
		GunDrop.Text = "False"
		GunDrop.TextColor3 = ss.GColorF
	end
	if ss.Aimbot then
		local keypressed = false
		local team
		local target
		mouse.Button2Down:Connect(function()
			keypressed = true
		end)
		mouse.Button2Up:Connect(function()
			keypressed = false
		end)
		if player.Backpack:FindFirstChild("Knife") or player.Character:FindFirstChild("Knife") then
			team = "Murderer"
			target = players[Sheriff.Text].Character.HumanoidRootPart
			if ss.AimbotAsMurderer then
				aimbottoggled = true
				notif("Aimbot toggled: true (Murderer)")
				repeat
					if keypressed and aimbottoggled then
						camera.CFrame = CFrame.new(camera.CFrame.Position, target.Position)
					end
					RunService.RenderStepped:Wait()
				until players[Sheriff.Text].Character.Humanoid.Health < 1 or team == nil or ss.Aimbot == false or ss.AimbotAsMurderer == false
			end
		elseif player.Backpack:FindFirstChild("Gun") or player.Character:FindFirstChild("Gun") then
			team = "Sheriff"
			target = players[Murderer.Text].Character.HumanoidRootPart
			if ss.AimbotAsSheriff then
				aimbottoggled = true
				notif("Aimbot toggled: true (Sheriff)")
				repeat
					if keypressed and aimbottoggled then
						camera.CFrame = CFrame.new(camera.CFrame.Position, target.Position)
					end
					RunService.RenderStepped:Wait()
				until players[Murderer.Text].Character.Humanoid.Health < 1 or team == nil or ss.Aimbot == false or ss.AimbotAsSheriff == false
			end
		else
			team = nil
			target = nil
			aimbottoggled = false
		end
	end
end
function XrayOn(workspace)
	for i,v in pairs(object:GetChildren()) do
		if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
			v.LocalTransparencyModifier = 0.9
		end
		XrayOn(v)
	end
end
function XrayOff(workspace)
	for i,v in pairs(object:GetChildren()) do
		if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
			v.LocalTransparencyModifier = 0
		end
		XrayOff(v)
	end
end
local noclip = false
local xray = false
local toggle1 = false
local emotes = false
function stuff(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.R and ss.Noclip then
		noclip = not noclip
		notif("Noclip toggled: "..tostring(noclip))
		player.Character.Humanoid:ChangeState(11)
		repeat
			player.Character.Humanoid:ChangeState(11)
			RunService.Stepped:Wait()
		until noclip == false
	end
	if input.KeyCode == Enum.KeyCode.T and ss.Xray then
		xray = not xray
		notif("Xray toggled: "..tostring(xray))
		if xray then
			XrayOn(workspace)
		else
			XrayOff(workspace)
		end
	end
	if input.KeyCode == Enum.KeyCode.RightControl then
		toggle1 = not toggle1
		if toggle1 then
			Topbar.Visible = false
			notif("Gui is now invisible")
		else
			Topbar.Visible = true
			notif("Gui is now visible")
		end
	end
end
UIS.InputBegan:Connect(stuff)
local ctrlpressed = false
mouse.Button1Down:Connect(function()
	if ctrlpressed and ss.CtrlClickTP then
		player.Character:MoveTo(mouse.Hit.p)
	end
end)
UIS.InputBegan:Connect(function(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.LeftControl then
		ctrlpressed = true
	end
end)
UIS.InputEnded:Connect(function(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.LeftControl then
		ctrlpressed = false
	end
end)
local mbtn = false -- murderer button
local sbtn = false -- sheriff button
Murderer.MouseButton1Click:Connect(function()
	if Murderer.Text ~= "None" then
		if mbtn == false then
			camera.CameraSubject = players[Murderer.Text].Character.Humanoid
			Spectating.Visible = true
			Spectating.Text = "Spectating: "..Murderer.Text
			Spectating.TextColor3 = Color3.fromRGB(255, 0, 0)
			mbtn = true
			sbtn = false
		elseif mbtn == true then
			camera.CameraSubject = player.Character.Humanoid
			Spectating.Visible = false
			Spectating.Text = "Spectating: None"
			Spectating.TextColor3 = Color3.fromRGB(255, 255, 255)
			mbtn = false
		end
	end
end)
Sheriff.MouseButton1Click:Connect(function()
	if Sheriff.Text ~= "None" then
		if sbtn == false then
			camera.CameraSubject = players[Sheriff.Text].Character.Humanoid
			Spectating.Visible = true
			Spectating.Text = "Spectating: "..Sheriff.Text
			Spectating.TextColor3 = Color3.fromRGB(0, 0, 255)
			sbtn = true
			mbtn = false
		elseif sbtn == true then
			camera.CameraSubject = player.Character.Humanoid
			Spectating.Visible = false
			Spectating.Text = "Spectating: None"
			Spectating.TextColor3 = Color3.fromRGB(255, 255, 255)
			sbtn = false
		end
	end
end)
GunDrop.MouseButton1Click:Connect(function()
	pcall(function()
		if workspace:FindFirstChild("GunDrop",true) and GunDrop.Text == "True" then
			local hrp = player.Character.HumanoidRootPart
			local OldCF = hrp.CFrame
			hrp.CFrame = workspace.GunDrop.CFrame
			wait(0.2)
			hrp.CFrame = OldCF
		end
	end)
end)
if ss.UnlockEmotes and player.PlayerGui.MainGUI then
	for i,v in pairs(player.PlayerGui.MainGUI.Game.Emotes.EmotePages:GetChildren()) do
		if v.Name == "MM2 Utilities" then v:Destroy() end
	end
	local emote = require(game:GetService("ReplicatedStorage").Modules.EmoteModule).GeneratePage
	local target = player.PlayerGui.MainGUI.Game.Emotes
	local emotelist = { "headless","zombie","zen","ninja","floss","dab" }
	if not player.PlayerGui.MainGUI.Game.Emotes.EmotePages:FindFirstChild("MM2 Utilities") then
		emote(emotelist,target,"MM2 Utilities")
	end
end
function dragify(Frame)
	dragToggle = nil
	local dragSpeed = 0.5
	dragInput = nil
	dragStart = nil
	local dragPos = nil
	function updateInput(input)
		local Delta = input.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		TweenService:Create(Frame, TweenInfo.new(0.25), {Position = Position}):Play()
	end
	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end
dragify(Topbar) -- credit to this guy: https://www.roblox.com/library/5021849770/Smooth-Drag
print("Loaded all scripts     [5/6]")
function ApplyTheme(Color1, Color2, Color3, MColor1, MColor2, SColor1, SColor2, GColor1, TextFont, TextColor)
	Topbar.BackgroundColor3 = Color1
	Murderer.BackgroundColor3 = Color2
	Sheriff.BackgroundColor3 = Color2
	GunDrop.BackgroundColor3 = Color2
	Main.BackgroundColor3 = Color3
	MurdererText.TextColor3 = MColor1
	Murderer.TextColor3 = MColor2
	SheriffText.TextColor3 = SColor1
	Sheriff.TextColor3 = SColor2
	GunDropText.TextColor3 = GColor1
	Title.Font = TextFont
	Murderer.Font = TextFont
	MurdererText.Font = TextFont
	Sheriff.Font = TextFont
	SheriffText.Font = TextFont
	GunDrop.Font = TextFont
	GunDropText.Font = TextFont
	Credit.Font = TextFont
	Title.TextColor3 = TextColor
	Credit.TextColor3 = TextColor
end
ApplyTheme(ss.Color1, ss.Color2, ss.Color3, ss.MColor1, ss.MColor2, ss.SColor1, ss.SColor2, ss.GColor1, ss.TextFont, ss.MainTextColor)
function PresetTheme(Theme)
	local theme
	if Theme == "Carbon" then
		theme = {
			Color1 = Color3.fromRGB(19,19,19),
			Color2 = Color3.fromRGB(19,19,19),
			Color3 = Color3.fromRGB(24,24,24),
			MColor1 = Color3.fromRGB(255,0,0),
			MColor2 = Color3.fromRGB(255,100,100),
			SColor1 = Color3.fromRGB(0,0,255),
			SColor2 = Color3.fromRGB(100,100,255),
			GColor1 = Color3.fromRGB(0,255,0),
			GColorT = Color3.fromRGB(100,255,100),
			GColorF = Color3.fromRGB(255,100,100),
			TextFont = ss.TextFont,
			MainTextColor = Color3.fromRGB(255,255,255)
		}
		ApplyTheme(theme.Color1, theme.Color2, theme.Color3, theme.MColor1, theme.MColor2, theme.SColor1, theme.SColor2, theme.GColor1, theme.TextFont, theme.MainTextColor)
	elseif Theme == "Strawberry" then
		theme = {
			Color1 = Color3.fromRGB(244,143,177),
			Color2 = Color3.fromRGB(244,143,177),
			Color3 = Color3.fromRGB(248,187,208),
			MColor1 = Color3.fromRGB(255,0,170),
			MColor2 = Color3.fromRGB(255,255,255),
			SColor1 = Color3.fromRGB(255,0,170),
			SColor2 = Color3.fromRGB(255,255,255),
			GColor1 = Color3.fromRGB(255,0,170),
			GColorT = Color3.fromRGB(255,255,255),
			GColorF = Color3.fromRGB(255,255,255),
			TextFont = ss.TextFont,
			MainTextColor = Color3.fromRGB(255,255,255)
		}
		ss.GColorT = theme.GColorT
		ss.GColorF = theme.GColorF
		ApplyTheme(theme.Color1, theme.Color2, theme.Color3, theme.MColor1, theme.MColor2, theme.SColor1, theme.SColor2, theme.GColor1, theme.TextFont, theme.MainTextColor)
	elseif Theme == "SkyBlue" then
		theme = {
			Color1 = Color3.fromRGB(59,132,235),
			Color2 = Color3.fromRGB(59,132,235),
			Color3 = Color3.fromRGB(120,172,245),
			MColor1 = Color3.fromRGB(0,0,255),
			MColor2 = Color3.fromRGB(255,255,255),
			SColor1 = Color3.fromRGB(0,0,255),
			SColor2 = Color3.fromRGB(255,255,255),
			GColor1 = Color3.fromRGB(0,0,255),
			GColorT = Color3.fromRGB(255,255,255),
			GColorF = Color3.fromRGB(255,255,255),
			TextFont = ss.TextFont,
			MainTextColor = Color3.fromRGB(255,255,255)
		}
		ss.GColorT = theme.GColorT
		ss.GColorF = theme.GColorF
		ApplyTheme(theme.Color1, theme.Color2, theme.Color3, theme.MColor1, theme.MColor2, theme.SColor1, theme.SColor2, theme.GColor1, theme.TextFont, theme.MainTextColor)
	elseif Theme == "Emerald" then
		theme = {
			Color1 = Color3.fromRGB(29,185,84),
			Color2 = Color3.fromRGB(29,185,84),
			Color3 = Color3.fromRGB(92,255,105),
			MColor1 = Color3.fromRGB(0,225,0),
			MColor2 = Color3.fromRGB(255,255,255),
			SColor1 = Color3.fromRGB(0,225,0),
			SColor2 = Color3.fromRGB(255,255,255),
			GColor1 = Color3.fromRGB(0,225,0),
			GColorT = Color3.fromRGB(255,255,255),
			GColorF = Color3.fromRGB(255,255,255),
			TextFont = ss.TextFont,
			MainTextColor = Color3.fromRGB(255,255,255)
		}
		ss.GColorT = theme.GColorT
		ss.GColorF = theme.GColorF
		ApplyTheme(theme.Color1, theme.Color2, theme.Color3, theme.MColor1, theme.MColor2, theme.SColor1, theme.SColor2, theme.GColor1, theme.TextFont, theme.MainTextColor)
	end
end
PresetTheme(ss.PresetTheme)
print("Applied custom theme   [6/6]")
Title.Text = "MM2 Utilities"
local goal1 = {} goal1.TextTransparency = 0
function fadetext(obj, delay) TweenService:Create(obj, TweenInfo.new(delay,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),goal1):Play() end
function LoadAnimation()
	local loadtime = tick()
	Topbar.Size = UDim2.new(0,0,0,0)
	Topbar.Visible = false
	Title.TextTransparency = 1
	Main.Size = UDim2.new(0,0,0,0)
	Main.Visible = false
	MurdererText.TextTransparency = 1
	Murderer.TextTransparency = 1
	SheriffText.TextTransparency = 1
	Sheriff.TextTransparency = 1
	GunDropText.TextTransparency = 1
	GunDrop.TextTransparency = 1
	Credit.TextTransparency = 1
	Topbar.Visible = true
	Topbar:TweenSize(UDim2.new(0,30,0,30),"Out","Sine","0.3")
	wait(0.3)
	Topbar:TweenSize(UDim2.new(0,170,0,30),"Out","Sine","0.5")
	wait(0.5)
	fadetext(Title, 0.5)
	Main.Visible = true
	Main.Size = UDim2.new(0,170,0,30)
	Main:TweenSize(UDim2.new(0,170,0,209),"Out","Sine","0.7")
	wait(0.2)
	fadetext(MurdererText, 0.2)
	wait(0.07)
	fadetext(Murderer, 0.2)
	wait(0.07)
	fadetext(SheriffText, 0.2)
	wait(0.06)
	fadetext(Sheriff, 0.2)
	wait(0.06)
	fadetext(GunDropText, 0.2)
	wait(0.05)
	fadetext(GunDrop, 0.2)
	wait(0.05)
	fadetext(Credit, 0.2)
	print("Loaded animation, took "..tick()-loadtime.." seconds")
end
LoadAnimation()
local l = game:GetService("Lighting")
getgenv().oldl = { Ambient = l.Ambient, Brightness = l.Brightness, GlobalShadows = l.GlobalShadows }
function StartMM2()
	if ss.Enabled then
		pcall(mm2)
		ApplyTheme(ss.Color1, ss.Color2, ss.Color3, ss.MColor1, ss.MColor2, ss.SColor1, ss.SColor2, ss.GColor1, ss.TextFont, ss.MainTextColor)
		PresetTheme(ss.PresetTheme)
		player.Character.Humanoid.WalkSpeed = ss.WalkSpeed
		player.Character.Humanoid.JumpPower = ss.JumpPower
		camera.FieldOfView = ss.FieldOfView
		player.DevCameraOcclusionMode = ss.CameraMode
		player.CameraMaxZoomDistance = ss.MaxZoom
		if ss.RemoveBlackScreen then
			player.PlayerGui.SpawnFade.Fade.Visible = false
			player.PlayerGui.CameraFade.Fade.Visible = false
		end
		if ss.Fullbright then
			l.Ambient = Color3.fromRGB(255,255,255)
			l.Brightness = 50
			l.GlobalShadows = false
		else
			l.Ambient = getgenv().oldl.Ambient
			l.Brightness = getgenv().oldl.Brightness
			l.GlobalShadows = getgenv().oldl.GlobalShadows
		end
		if ss.UnlockEmotes and player.PlayerGui.MainGUI then -- did not make this btw
			local emote = require(game:GetService("ReplicatedStorage").Modules.EmoteModule).GeneratePage
			local target = player.PlayerGui.MainGUI.Game.Emotes
			local emotelist = { "headless","zombie","zen","ninja","floss","dab" }
			if not player.PlayerGui.MainGUI.Game.Emotes.EmotePages:FindFirstChild("MM2 Utilities") then
				emote(emotelist,target,"MM2 Utilities")
				notif("Unlocked emotes")
			end
		end
	end
end
pcall(StartMM2)
if not getgenv().MM2_UTILITIES_LOADED then
	print("\n███╗░░░███╗███╗░░░███╗██████╗░  ██╗░░░██╗████████╗██╗██╗░░░░░██╗████████╗██╗███████╗░██████╗\n████╗░████║████╗░████║╚════██╗  ██║░░░██║╚══██╔══╝██║██║░░░░░██║╚══██╔══╝██║██╔════╝██╔════╝\n██╔████╔██║██╔████╔██║░░███╔═╝  ██║░░░██║░░░██║░░░██║██║░░░░░██║░░░██║░░░██║█████╗░░╚█████╗░\n██║╚██╔╝██║██║╚██╔╝██║██╔══╝░░  ██║░░░██║░░░██║░░░██║██║░░░░░██║░░░██║░░░██║██╔══╝░░░╚═══██╗\n██║░╚═╝░██║██║░╚═╝░██║███████╗  ╚██████╔╝░░░██║░░░██║███████╗██║░░░██║░░░██║███████╗██████╔╝\n╚═╝░░░░░╚═╝╚═╝░░░░░╚═╝╚══════╝  ░╚═════╝░░░░╚═╝░░░╚═╝╚══════╝╚═╝░░░╚═╝░░░╚═╝╚══════╝╚═════╝░")
	print('Press "Left Ctrl" to toggle gui visibility')
	print('Executing multiple times will cause notification spam, disable "Notifications" to prevent this')
end
getgenv().MM2_UTILITIES_LOADED = true
while wait(2) do
	pcall(StartMM2)
end
