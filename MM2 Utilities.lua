-- Murder Mystery 2 Utilities by zzerexx#3970
getgenv().Settings = {
	Enabled = true,
	ProtectGui = true,          -- Only available for Synapse, ProtoSmasher, Script-Ware, Krnl (RECOMMENDED)
	RemoveRagdolls = true,      -- Removes all player ragdolls
	-- Player
	WalkSpeed = 20,             -- Default: 16
	JumpPower = 50,             -- Default: 50
	FieldOfView = 80,           -- Default: 70
	CameraMode = "Invisicam",   -- "Invisicam" or "Zoom"
	MaxZoom = 100,              -- Default: 15
	CtrlClickTP = true,         -- Hold "Ctrl" and click to teleport
	Noclip = true,              -- Press "R" to toggle
	Xray = true,                -- Press "T" to toggle
	-- Aimbot
	Aimbot = true,              -- Use in First Person or while using Shift Lock
	AimbotKey = "MouseButton2", -- Locked, does not affect aimbot key
	AimbotAsSheriff = true,     -- Uses Aimbot as Sheriff
	AimbotAsMurderer = false,   -- Uses Aimbot as Murderer (bad)
	-- ESP
	NameEsp = true,
	AvoidInnocents = false,     -- Name Esp will avoid Innocents
	NameFont = "SourceSans",    -- Fonts: https://developer.roblox.com/en-us/api-reference/enum/Font
	NameTextTransparency = 0.3,
	MurdererColor = Color3.fromRGB(255, 0, 0),
	SheriffColor = Color3.fromRGB(0, 0, 255),
	InnocentColor = Color3.fromRGB(255, 255, 255),
	GunEsp = true,
	GunEspColor = Color3.fromRGB(0, 255, 0),
	GunNameEsp = true,
	GunNameTextTransparency = 0.4,
	GunNameColor = Color3.fromRGB(0, 255, 0),
	-- Auto Pickup
	AutoPickupGun = false,      -- Automatically picks up the gun when its dropped (useless + unreliable)
	RandomPickupDelay = false,  -- Waits a random amount of time before picking up the gun (may be more delayed since it checks every 2 seconds)
	RandomPickupDelayMin = 3,
	RandomPickupDelayMax = 7,
} -- v1.0.0
if game.PlaceId ~= 142823291 then game:GetService("TeleportService"):Teleport(142823291) end
if getgenv().protected then getgenv().protected:Destroy() end
local players = game:GetService("Players")
local player = players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local mouse = player:GetMouse()
local UIS = game:GetService("UserInputService")
local characters = { "A","B","C","D","E","F","G","H","I","J","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","0","!","@","#","$","%","^","&","*","(",")","-","=","[","]","|",";","'",",",".","/","_","+","{","}",":","<",">","?","`","~" }
local classnames = { "ClickDetector","SunRaysEffect","Decal","RemoteEvent","SelectionBox","SurfaceAppearance","AlignOrientation","AnimationController","LineForce","PrismaticConstraint","Tool","Trail","Atmosphere","ForceField","Motor6D","Humanoid","ShirtGraphic","Explosion","RocketPropulsion","Weld","WorldModel","CompressorSoundEffect","BindableFunction","Team","Vector3Value","HumanoidDescription","ColorCorrectionEffect","Torque","BodyAngularVelocity","PointLight","LocalizationTable","SpecialMesh","FlangeSoundEffect","CFrameValue","BallSocketConstraint","DialogChoice","DepthOfFieldEffect","RemoteFunction" }
function randname() local randomname = characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)] return randomname end
local protectedfolder = Instance.new(classnames[math.random(1,#classnames)])
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
if game.PlaceId ~= 142823291 then protectedfolder:Destroy() end
if getgenv().Settings.ProtectGui then
	if syn then
		syn.protect_gui(protectedfolder)
		protectedfolder.Parent = game:GetService("CoreGui")
	elseif PROTOSMASHER_LOADED then
		protectedfolder.Parent = get_hidden_gui()
	elseif KRNL_LOADED then
		protectedfolder.Parent = gethui()
	else
		print("Your exploit does not support ProtectGui!")
		protectedfolder.Parent = game:GetService("CoreGui")
	end
else
	protectedfolder.Parent = game:GetService("CoreGui")
end
Topbar.Active = true
Topbar.Draggable = true
protectedfolder.Name = randname()..randname()..randname()

MM2.Name = randname()
MM2.Parent = protectedfolder
getgenv().protected = protectedfolder

Topbar.Name = randname()
Topbar.Parent = MM2
Topbar.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
Topbar.Position = UDim2.new(0.611344576, 0, 0.146884277, 0)
Topbar.Size = UDim2.new(0, 170, 0, 30)
Topbar.ZIndex = 11

Main.Name = randname()
Main.Parent = Topbar
Main.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Main.Position = UDim2.new(-0.00147058826, 0, -0.0161224362, 0)
Main.Size = UDim2.new(0, 170, 0, 209)
Main.ZIndex = 10

UICorner.Name = randname()
UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = Main

Murderer.Name = randname()
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

UICorner_2.Name = randname()
UICorner_2.CornerRadius = UDim.new(0, 6)
UICorner_2.Parent = Murderer

Sheriff.Name = randname()
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

UICorner_3.Name = randname()
UICorner_3.CornerRadius = UDim.new(0, 6)
UICorner_3.Parent = Sheriff

MurdererText.Name = randname()
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

SheriffText.Name = randname()
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

GunDropText.Name = randname()
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

GunDrop.Name = randname()
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

UICorner_4.Name = randname()
UICorner_4.CornerRadius = UDim.new(0, 6)
UICorner_4.Parent = GunDrop

UICorner_5.Name = randname()
UICorner_5.CornerRadius = UDim.new(0, 6)
UICorner_5.Parent = Topbar

Title.Name = randname()
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

Credit.Name = randname()
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

Spectating.Name = randname()
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

local folder = Instance.new(classnames[math.random(1,#classnames)])
folder.Parent = MM2
folder.Name = randname()
function bruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruh()
	pcall(function()
		for i,v in pairs(folder:GetChildren()) do
			v:Destroy()
		end
		if getgenv().Settings.RemoveRagdolls then
			for i,v in pairs(game.Workspace:GetChildren()) do
				if v.Name == "Raggy" then
					v:Destroy()
				end
			end
		end
		for i,v in pairs(players:GetChildren()) do
			if v.Name ~= player.Name then
				if getgenv().Settings.NameEsp then
					local Billboard = Instance.new("BillboardGui")
					local Name = Instance.new("TextLabel")
					Billboard.Name = v.Name.."---"..randname()
					Billboard.Parent = folder
					Billboard.Adornee = v.Character.Head
					Billboard.Size = UDim2.new(10, 0, 4, 0)
					Billboard.ExtentsOffset = Vector3.new(0, 3, 0)
					Billboard.AlwaysOnTop = true
					Billboard.MaxDistance = math.huge
					Name.Name = randname()
					Name.Parent = Billboard
					Name.BackgroundTransparency = 1
					Name.TextTransparency = getgenv().Settings.NameTextTransparency
					Name.BorderSizePixel = 0
					Name.Font = getgenv().Settings.NameFont
					Name.Size = UDim2.new(1, 0, 1, 0)
					Name.Text = v.Name
					Name.TextColor3 = getgenv().Settings.InnocentColor
					Name.TextScaled = false
					Name.TextSize = 18
					if v.Backpack:FindFirstChild("Knife") or v.Character:FindFirstChild("Knife") then
						Murderer.Text = v.Name
						Name.TextColor3 = getgenv().Settings.MurdererColor
					elseif v.Backpack:FindFirstChild("Gun") or v.Character:FindFirstChild("Gun") then
						Sheriff.Text = v.Name
						Name.TextColor3 = getgenv().Settings.SheriffColor
					elseif getgenv().Settings.AvoidInnocents and not v.Backpack:FindFirstChild("Knife") or v.Character:FindFirstChild("Knife") or v.Backpack:FindFirstChild("Gun") or v.Character:FindFirstChild("Gun") then
						Billboard:Destroy()
					end
				end -- getgenv().Settings.NameEsp
			end -- Name Check
		end -- for i,v
		if game.Workspace:FindFirstChild("GunDrop",true) then
			if getgenv().Settings.GunEsp then
				local GunEsp = Instance.new("BoxHandleAdornment")
				GunEsp.Name = "Gun".."---"..randname()
				GunEsp.Parent = folder
				GunEsp.Adornee = game.Workspace.GunDrop
				GunEsp.AlwaysOnTop = true
				GunEsp.Color3 = getgenv().Settings.GunEspColor
				GunEsp.Size = game.Workspace.GunDrop.Size
				GunEsp.Transparency = 0.6
				GunEsp.ZIndex = 0
				if getgenv().Settings.GunNameEsp then
					local Billboard = Instance.new("BillboardGui")
					local Name = Instance.new("TextLabel")
					Billboard.Name = randname()
					Billboard.Parent = folder
					Billboard.Adornee = game.Workspace.GunDrop
					Billboard.Size = UDim2.new(10, 0, 4, 0)
					Billboard.ExtentsOffset = Vector3.new(0, 3, 0)
					Billboard.AlwaysOnTop = true
					Billboard.MaxDistance = math.huge
					Name.Name = randname()
					Name.Parent = Billboard
					Name.BackgroundTransparency = 1
					Name.TextTransparency = getgenv().Settings.GunNameTextTransparency
					Name.BorderSizePixel = 0
					Name.Font = getgenv().Settings.NameFont
					Name.Size = UDim2.new(1, 0, 1, 0)
					Name.Text = "Gun"
					Name.TextColor3 = getgenv().Settings.GunNameColor
					Name.TextScaled = false
					Name.TextSize = 18
				end
			end
			if getgenv().Settings.AutoPickupGun then
				local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
				local OldCF = hrp.CFrame
				wait(0.2)
				if getgenv().Settings.RandomPickupDelay then
					local randomdelay = math.random(getgenv().Settings.RandomPickupDelayMin,getgenv().Settings.RandomPickupDelayMax)
					wait(randomdelay)
				end
				hrp.CFrame = game.Workspace.GunDrop.CFrame
				wait(0.2)
				hrp.CFrame = OldCF
			end
			GunDrop.Text = "True"
			GunDrop.TextColor3 = Color3.fromRGB(100, 255, 100)
		else
			GunDrop.Text = "False"
			GunDrop.TextColor3 = Color3.fromRGB(255, 100, 100)
		end
		if getgenv().Settings.Aimbot then
			getgenv().keypressed = false
			local team
			local target
			mouse.Button2Down:Connect(function()
				getgenv().keypressed = true
			end)
			mouse.Button2Up:Connect(function()
				getgenv().keypressed = false
			end)
			if game.Players.LocalPlayer.Backpack:FindFirstChild("Knife") or player.Character:FindFirstChild("Knife") then
				team = "Murderer"
				target = players[Sheriff.Text].Character.HumanoidRootPart
				repeat wait()
					if getgenv().Settings.AimbotAsMurderer then
						if getgenv().keypressed then
							camera.CFrame = CFrame.new(camera.CFrame.Position, target.Position)
						end
					end
				until players[Sheriff.Text].Character.Humanoid.Health < 1 or team == nil
			elseif player.Backpack:FindFirstChild("Gun") or game.Players.LocalPlayer.Character:FindFirstChild("Gun") then
				team = "Sheriff"
				target = players[Murderer.Text].Character.HumanoidRootPart
				repeat wait()
					if getgenv().Settings.AimbotAsSheriff then
						if getgenv().keypressed then
							camera.CFrame = CFrame.new(camera.CFrame.Position, target.Position)
						end
					end
				until players[Murderer.Text].Character.Humanoid.Health < 1 or team == nil
			else
				team = nil
				target = nil
			end
		end
	end)
end
local noclip = false
game:GetService("RunService").Stepped:Connect(function()
	if noclip then
		player.Character.Humanoid:ChangeState(11)
	end
end)
function NoClip(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.R and getgenv().Settings.Noclip then
		noclip = not noclip
		player.Character.Humanoid:ChangeState(11)
	end
end
UIS.InputBegan:Connect(NoClip)
local object = game.workspace
function XrayOn(object)
	for i,v in pairs(object:GetChildren()) do
		if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
			v.LocalTransparencyModifier = 0.9
		end
		XrayOn(v)
	end
end
function XrayOff(object)
	for i,v in pairs(object:GetChildren()) do
		if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
			v.LocalTransparencyModifier = 0
		end
		XrayOff(v)
	end
end
local x = false
function Xray(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.T and getgenv().Settings.Xray then
		x = not x
		if x then
			XrayOn(object)
		else
			XrayOff(object)
		end
	end
end
UIS.InputBegan:Connect(Xray)
local toggle1 = false -- topbar toggle
function stuff(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.RightControl then
		toggle1 = not toggle1
		if toggle1 then
			Topbar.Visible = false
		else
			Topbar.Visible = true
		end
	end
end
UIS.InputBegan:Connect(stuff)
local ctrlpressed = false -- ctrl click tp
mouse.Button1Down:Connect(function()
	if ctrlpressed and getgenv().Settings.CtrlClickTP then
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
			game.Workspace.CurrentCamera.CameraSubject = game.Players[Murderer.Text].Character.Humanoid
			Spectating.Visible = true
			Spectating.Text = "Spectating: "..Murderer.Text
			Spectating.TextColor3 = Color3.fromRGB(255, 0, 0)
			mbtn = true
		elseif mbtn == true then
			game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
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
			game.Workspace.CurrentCamera.CameraSubject = game.Players[Sheriff.Text].Character.Humanoid
			Spectating.Visible = true
			Spectating.Text = "Spectating: "..Sheriff.Text
			Spectating.TextColor3 = Color3.fromRGB(0, 0, 255)
			sbtn = true
		elseif sbtn == true then
			game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
			Spectating.Visible = false
			Spectating.Text = "Spectating: None"
			Spectating.TextColor3 = Color3.fromRGB(255, 255, 255)
			sbtn = false
		end
	end
end)
GunDrop.MouseButton1Click:Connect(function()
	pcall(function()
		if game.Workspace:FindFirstChild("GunDrop",true) and GunDrop.Text == "True" then
			local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
			local OldCF = hrp.CFrame
			wait(0.2)
			hrp.CFrame = game.Workspace.GunDrop.CFrame
			wait(0.2)
			hrp.CFrame = OldCF
		end
	end)
end)
if getgenv().Settings.Enabled then bruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruh() end
Title.Text = "MM2 Utilities"

print("+----- MM2  Utilities -----+")
print("|    Left Ctrl to hide     |")
print("|   Aimbot may be buggy    |")
print("|                          |")
print("|       Version 1.0.0      |")
print("|       zzerexx#3970       |")
print("+--------------------------+")

while wait(2) do
	if getgenv().Settings.Enabled then
		bruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruhbruh()
		player.Character.Humanoid.WalkSpeed = getgenv().Settings.WalkSpeed
		player.Character.Humanoid.JumpPower = getgenv().Settings.JumpPower
		camera.FieldOfView = getgenv().Settings.FieldOfView
		player.DevCameraOcclusionMode = getgenv().Settings.CameraMode
		player.CameraMaxZoomDistance = getgenv().Settings.MaxZoom
	end
end
