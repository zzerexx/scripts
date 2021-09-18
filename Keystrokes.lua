-- Gui to Lua
-- Version: 3.2

-- Instances:

local Keystrokes = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local W = Instance.new("TextLabel")
local S = Instance.new("TextLabel")
local A = Instance.new("TextLabel")
local D = Instance.new("TextLabel")
local Space = Instance.new("TextLabel")
local MouseButton1 = Instance.new("TextLabel")
local MouseButton2 = Instance.new("TextLabel")
local CPS = Instance.new("TextLabel")
local FPS = Instance.new("TextLabel")

if syn and syn.protect_gui then
	syn.protect_gui(Keystrokes)
end

--Properties:

Keystrokes.Name = "Keystrokes"
Keystrokes.Parent = (gethui and gethui()) or (get_hidden_ui and get_hidden_ui()) or game.CoreGui
Keystrokes.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = Keystrokes
Main.Active = true
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.BackgroundTransparency = 1.000
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(0, 110, 0, 207)

W.Name = "W"
W.Parent = Main
W.AnchorPoint = Vector2.new(0.5, 0)
W.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
W.BackgroundTransparency = 0.600
W.BorderSizePixel = 0
W.Position = UDim2.new(0.5, 0, 0, 0)
W.Size = UDim2.new(0, 34, 0, 35)
W.Font = Enum.Font.Gotham
W.Text = "W"
W.TextColor3 = Color3.fromRGB(255, 255, 255)
W.TextSize = 16.000

S.Name = "S"
S.Parent = Main
S.AnchorPoint = Vector2.new(0.5, 0)
S.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
S.BackgroundTransparency = 0.600
S.BorderSizePixel = 0
S.Position = UDim2.new(0.5, 0, 0, 39)
S.Size = UDim2.new(0, 34, 0, 35)
S.Font = Enum.Font.Gotham
S.Text = "S"
S.TextColor3 = Color3.fromRGB(255, 255, 255)
S.TextSize = 16.000

A.Name = "A"
A.Parent = Main
A.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
A.BackgroundTransparency = 0.600
A.BorderSizePixel = 0
A.Position = UDim2.new(0, 0, 0, 39)
A.Size = UDim2.new(0, 34, 0, 35)
A.Font = Enum.Font.Gotham
A.Text = "A"
A.TextColor3 = Color3.fromRGB(255, 255, 255)
A.TextSize = 16.000

D.Name = "D"
D.Parent = Main
D.AnchorPoint = Vector2.new(1, 0)
D.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
D.BackgroundTransparency = 0.600
D.BorderSizePixel = 0
D.Position = UDim2.new(1, 0, 0, 39)
D.Size = UDim2.new(0, 34, 0, 35)
D.Font = Enum.Font.Gotham
D.Text = "D"
D.TextColor3 = Color3.fromRGB(255, 255, 255)
D.TextSize = 16.000

Space.Name = "Space"
Space.Parent = Main
Space.AnchorPoint = Vector2.new(0.5, 0)
Space.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Space.BackgroundTransparency = 0.600
Space.BorderSizePixel = 0
Space.Position = UDim2.new(0.5, 0, 0, 116)
Space.Size = UDim2.new(0, 110, 0, 25)
Space.Font = Enum.Font.Gotham
Space.Text = "────"
Space.TextColor3 = Color3.fromRGB(255, 255, 255)
Space.TextSize = 18.000

MouseButton1.Name = "MouseButton1"
MouseButton1.Parent = Main
MouseButton1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MouseButton1.BackgroundTransparency = 0.600
MouseButton1.BorderSizePixel = 0
MouseButton1.Position = UDim2.new(0, 0, 0, 78)
MouseButton1.Size = UDim2.new(0, 53, 0, 35)
MouseButton1.Font = Enum.Font.Gotham
MouseButton1.Text = "LMB"
MouseButton1.TextColor3 = Color3.fromRGB(255, 255, 255)
MouseButton1.TextSize = 16.000

MouseButton2.Name = "MouseButton2"
MouseButton2.Parent = Main
MouseButton2.AnchorPoint = Vector2.new(1, 0)
MouseButton2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MouseButton2.BackgroundTransparency = 0.600
MouseButton2.BorderSizePixel = 0
MouseButton2.Position = UDim2.new(1, 0, 0, 78)
MouseButton2.Size = UDim2.new(0, 53, 0, 35)
MouseButton2.Font = Enum.Font.Gotham
MouseButton2.Text = "RMB"
MouseButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
MouseButton2.TextSize = 16.000

CPS.Name = "CPS"
CPS.Parent = Main
CPS.AnchorPoint = Vector2.new(0.5, 0)
CPS.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CPS.BackgroundTransparency = 0.600
CPS.BorderSizePixel = 0
CPS.Position = UDim2.new(0.5, 0, 0, 144)
CPS.Size = UDim2.new(0, 110, 0, 25)
CPS.Font = Enum.Font.Gotham
CPS.Text = "0 | 0 CPS"
CPS.TextColor3 = Color3.fromRGB(255, 255, 255)
CPS.TextSize = 16.000

FPS.Name = "FPS"
FPS.Parent = Main
FPS.AnchorPoint = Vector2.new(0.5, 0)
FPS.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FPS.BackgroundTransparency = 0.600
FPS.BorderSizePixel = 0
FPS.Position = UDim2.new(0.5, 0, 0, 172)
FPS.Size = UDim2.new(0, 110, 0, 25)
FPS.Font = Enum.Font.Gotham
FPS.Text = "0 FPS"
FPS.TextColor3 = Color3.fromRGB(255, 255, 255)
FPS.TextSize = 16.000

-- Scripts:

local function YAZCKSA_fake_script() -- Keystrokes.LocalScript 
	local script = Instance.new('LocalScript', Keystrokes)

	local UIS = game:GetService("UserInputService")
	local TweenService = game:GetService("TweenService")
	local RunService = game:GetService("RunService")
	local CPS,FPS = {['MouseButton1'] = 0,['MouseButton2'] = 0},0
	
	script.Parent.Main.Draggable = true
	
	UIS.InputBegan:Connect(function(i,gp)
		local input = (i.UserInputType.Name == "Keyboard" and "KeyCode") or (i.KeyCode.Name == "Unknown" and "UserInputType")
		if not gp and script.Parent.Main:FindFirstChild(i[input].Name) then
			TweenService:Create(script.Parent.Main[i[input].Name],TweenInfo.new(0.15,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(255,255,255),TextColor3 = Color3.fromRGB(0,0,0)}):Play()
			if i.UserInputType.Name == "MouseButton1" or i.UserInputType.Name == "MouseButton2" then
				CPS[i.UserInputType.Name] += 1
				wait(1)
				CPS[i.UserInputType.Name] -= 1
			end
		end
	end)
	UIS.InputEnded:Connect(function(i,gp)
		local input = (i.UserInputType.Name == "Keyboard" and "KeyCode") or (i.KeyCode.Name == "Unknown" and "UserInputType")
		if not gp and script.Parent.Main:FindFirstChild(i[input].Name) then
			TweenService:Create(script.Parent.Main[i[input].Name],TweenInfo.new(0.15,Enum.EasingStyle.Sine,Enum.EasingDirection.In),{BackgroundColor3 = Color3.fromRGB(0,0,0),TextColor3 = Color3.fromRGB(255,255,255)}):Play()
		end
	end)
	RunService.RenderStepped:Connect(function()
		spawn(function()
			FPS += 1
			wait(1)
			FPS -= 1
		end)
		script.Parent.Main.CPS.Text = CPS["MouseButton1"].." | "..CPS["MouseButton2"].." CPS"
		script.Parent.Main.FPS.Text = FPS.." FPS"
	end)
end
coroutine.wrap(YAZCKSA_fake_script)()
