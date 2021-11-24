-- Gui to Lua
-- Version: 3.2

-- Instances:

local CCv2 = Instance.new("ScreenGui")
local C = Instance.new("Frame")
local D = Instance.new("Frame")
local R = Instance.new("Frame")
local T = Instance.new("Frame")
local B = Instance.new("Frame")
local L = Instance.new("Frame")
local Gui = Instance.new("Frame")
local Color = Instance.new("TextBox")
local UIListLayout = Instance.new("UIListLayout")
local Opacity = Instance.new("TextBox")
local Length = Instance.new("TextBox")
local Thickness = Instance.new("TextBox")
local Offset = Instance.new("TextBox")
local Movement = Instance.new("TextButton")
local Outline = Instance.new("TextButton")
local OutlineColor = Instance.new("TextBox")
local Dot = Instance.new("TextButton")
local Factor = Instance.new("TextBox")
local OutlineThickness = Instance.new("TextBox")
local Label = Instance.new("TextLabel")
local Enabled_1 = Instance.new("BoolValue")
local Enabled_2 = Instance.new("BoolValue")
local Enabled_3 = Instance.new("BoolValue")

if syn then
	syn.protect_gui(CCv2)
end

--Properties:

CCv2.Name = game:GetService("HttpService"):GenerateGUID(false)
CCv2.Parent = (gethui and gethui()) or (get_hidden_ui and get_hidden_ui()) or game.CoreGui
CCv2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
CCv2.IgnoreGuiInset = true

C.Name = "C"
C.Parent = CCv2
C.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
C.BackgroundTransparency = 1.000
C.BorderSizePixel = 0
C.Size = UDim2.new(1, 0, 1, 0)

D.Name = "D"
D.Parent = C
D.AnchorPoint = Vector2.new(0.5, 0.5)
D.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
D.BorderColor3 = Color3.fromRGB(0, 0, 0)
D.BorderSizePixel = 0
D.Position = UDim2.new(0.5, 0, 0.5, 0)
D.Size = UDim2.new(0, 2, 0, 2)

R.Name = "R"
R.Parent = C
R.AnchorPoint = Vector2.new(0, 0.5)
R.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
R.BorderColor3 = Color3.fromRGB(0, 0, 0)
R.BorderSizePixel = 0
R.Position = UDim2.new(0.5, 4, 0.5, 0)
R.Size = UDim2.new(0, 6, 0, 2)

T.Name = "T"
T.Parent = C
T.AnchorPoint = Vector2.new(0.5, 1)
T.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
T.BorderColor3 = Color3.fromRGB(0, 0, 0)
T.BorderSizePixel = 0
T.Position = UDim2.new(0.5, 0, 0.5, -4)
T.Size = UDim2.new(0, 2, 0, 6)

B.Name = "B"
B.Parent = C
B.AnchorPoint = Vector2.new(0.5, 0)
B.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
B.BorderColor3 = Color3.fromRGB(0, 0, 0)
B.BorderSizePixel = 0
B.Position = UDim2.new(0.5, 0, 0.5, 4)
B.Size = UDim2.new(0, 2, 0, 6)

L.Name = "L"
L.Parent = C
L.AnchorPoint = Vector2.new(1, 0.5)
L.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
L.BorderColor3 = Color3.fromRGB(0, 0, 0)
L.BorderSizePixel = 0
L.Position = UDim2.new(0.5, -4, 0.5, 0)
L.Size = UDim2.new(0, 6, 0, 2)

Gui.Name = "Gui"
Gui.Parent = CCv2
Gui.AnchorPoint = Vector2.new(1, 0.5)
Gui.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.BorderColor3 = Color3.fromRGB(0, 0, 0)
Gui.BorderSizePixel = 2
Gui.Position = UDim2.new(0.5, -100, 0.5, 0)
Gui.Size = UDim2.new(0, 150, 0, 300)

Color.Name = "Color"
Color.Parent = Gui
Color.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Color.BorderSizePixel = 0
Color.LayoutOrder = 1
Color.Size = UDim2.new(1, 0, 0, 25)
Color.Font = Enum.Font.SourceSans
Color.PlaceholderText = "Color (R,G,B)"
Color.Text = ""
Color.TextColor3 = Color3.fromRGB(0, 0, 0)
Color.TextSize = 14.000

UIListLayout.Parent = Gui
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

Opacity.Name = "Opacity"
Opacity.Parent = Gui
Opacity.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Opacity.BorderSizePixel = 0
Opacity.LayoutOrder = 2
Opacity.Size = UDim2.new(1, 0, 0, 25)
Opacity.Font = Enum.Font.SourceSans
Opacity.PlaceholderText = "Opacity (0-1)"
Opacity.Text = ""
Opacity.TextColor3 = Color3.fromRGB(0, 0, 0)
Opacity.TextSize = 14.000

Length.Name = "Length"
Length.Parent = Gui
Length.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Length.BorderSizePixel = 0
Length.LayoutOrder = 3
Length.Size = UDim2.new(1, 0, 0, 25)
Length.Font = Enum.Font.SourceSans
Length.PlaceholderText = "Length"
Length.Text = ""
Length.TextColor3 = Color3.fromRGB(0, 0, 0)
Length.TextSize = 14.000

Thickness.Name = "Thickness"
Thickness.Parent = Gui
Thickness.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Thickness.BorderSizePixel = 0
Thickness.LayoutOrder = 4
Thickness.Size = UDim2.new(1, 0, 0, 25)
Thickness.Font = Enum.Font.SourceSans
Thickness.PlaceholderText = "Thickness"
Thickness.Text = ""
Thickness.TextColor3 = Color3.fromRGB(0, 0, 0)
Thickness.TextSize = 14.000

Offset.Name = "Offset"
Offset.Parent = Gui
Offset.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Offset.BorderSizePixel = 0
Offset.LayoutOrder = 5
Offset.Size = UDim2.new(1, 0, 0, 25)
Offset.Font = Enum.Font.SourceSans
Offset.PlaceholderText = "Offset"
Offset.Text = ""
Offset.TextColor3 = Color3.fromRGB(0, 0, 0)
Offset.TextSize = 14.000

Movement.Name = "Movement"
Movement.Parent = Gui
Movement.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Movement.BorderSizePixel = 0
Movement.LayoutOrder = 6
Movement.Size = UDim2.new(1, 0, 0, 25)
Movement.AutoButtonColor = false
Movement.Font = Enum.Font.SourceSans
Movement.Text = "Movement Error"
Movement.TextColor3 = Color3.fromRGB(0, 0, 0)
Movement.TextSize = 14.000

Outline.Name = "Outline"
Outline.Parent = Gui
Outline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Outline.BorderSizePixel = 0
Outline.LayoutOrder = 8
Outline.Size = UDim2.new(1, 0, 0, 25)
Outline.AutoButtonColor = false
Outline.Font = Enum.Font.SourceSans
Outline.Text = "Outline"
Outline.TextColor3 = Color3.fromRGB(0, 0, 0)
Outline.TextSize = 14.000

OutlineColor.Name = "OutlineColor"
OutlineColor.Parent = Gui
OutlineColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OutlineColor.BorderSizePixel = 0
OutlineColor.LayoutOrder = 9
OutlineColor.Size = UDim2.new(1, 0, 0, 25)
OutlineColor.Font = Enum.Font.SourceSans
OutlineColor.PlaceholderText = "Outline Color (R,G,B)"
OutlineColor.Text = ""
OutlineColor.TextColor3 = Color3.fromRGB(0, 0, 0)
OutlineColor.TextSize = 14.000

Dot.Name = "Dot"
Dot.Parent = Gui
Dot.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
Dot.BorderSizePixel = 0
Dot.LayoutOrder = 11
Dot.Size = UDim2.new(1, 0, 0, 25)
Dot.AutoButtonColor = false
Dot.Font = Enum.Font.SourceSans
Dot.Text = "Center Dot"
Dot.TextColor3 = Color3.fromRGB(0, 0, 0)
Dot.TextSize = 14.000

Factor.Name = "Factor"
Factor.Parent = Gui
Factor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Factor.BorderSizePixel = 0
Factor.LayoutOrder = 7
Factor.Size = UDim2.new(1, 0, 0, 25)
Factor.Font = Enum.Font.SourceSans
Factor.PlaceholderText = "Error Factor"
Factor.Text = ""
Factor.TextColor3 = Color3.fromRGB(0, 0, 0)
Factor.TextSize = 14.000

OutlineThickness.Name = "OutlineThickness"
OutlineThickness.Parent = Gui
OutlineThickness.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OutlineThickness.BorderSizePixel = 0
OutlineThickness.LayoutOrder = 10
OutlineThickness.Size = UDim2.new(1, 0, 0, 25)
OutlineThickness.Font = Enum.Font.SourceSans
OutlineThickness.PlaceholderText = "Outline Thickness"
OutlineThickness.Text = ""
OutlineThickness.TextColor3 = Color3.fromRGB(0, 0, 0)
OutlineThickness.TextSize = 14.000

Label.Name = "Label"
Label.Parent = Gui
Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label.BorderSizePixel = 0
Label.LayoutOrder = 12
Label.Size = UDim2.new(1, 0, 0, 25)
Label.Font = Enum.Font.SourceSans
Label.Text = "Right Control to show/hide"
Label.TextColor3 = Color3.fromRGB(0, 0, 0)
Label.TextSize = 14.000

Enabled_1.Name = "Enabled"
Enabled_1.Parent = Dot
Enabled_1.Value = true

Enabled_2.Name = "Enabled"
Enabled_2.Parent = Movement
Enabled_2.Value = false

Enabled_3.Name = "Enabled"
Enabled_3.Parent = Outline
Enabled_3.Value = false

-- Scripts:

local function YGNOGB_fake_script() -- Gui.LocalScript 
	local script = Instance.new('LocalScript', Gui)

	-- set your shits to this for default crosshair
	local default = {
		Color = Color3.fromRGB(255,255,255),
		Opacity = 1,
		Length = 6,
		Thickness = 2,
		Offset = 4,
		MovementError = false,
		ErrorFactor = 2,
		Outline = false,
		OutlineColor = Color3.fromRGB(0,0,0),
		OutlineThickness = 1,
		CenterDot = true,
	}
	
	function change(prop,value)
		for i,v in next, script.Parent.Parent.C:GetChildren() do
			if v:IsA("Frame") then
				v[prop] = value
			end
		end
	end
	function enabled(name)
		return script.Parent[name].Enabled.Value
	end
	local cc = script.Parent.Parent.C
	local length = 6
	local thickness = 2
	local offset = 4
	local factor = 2
	script.Parent.Color.FocusLost:Connect(function()
		if script.Parent.Color.Text:find(",") then
			local c = script.Parent.Color.Text:gsub(" ",""):split(",")
			change("BackgroundColor3",Color3.fromRGB(tonumber(c[1]),tonumber(c[2]),tonumber(c[3])))
		end
	end)
	script.Parent.Opacity.FocusLost:Connect(function()
		if tonumber(script.Parent.Opacity.Text) ~= nil then
			local num = tonumber(script.Parent.Opacity.Text)
			num = 1 - num
			change("BackgroundTransparency",num)
		end
	end)
	script.Parent.Length.FocusLost:Connect(function()
		if tonumber(script.Parent.Length.Text) ~= nil then
			local len = tonumber(script.Parent.Length.Text)
			length = len
			cc.L.Size = UDim2.new(0,len,0,thickness)
			cc.R.Size = UDim2.new(0,len,0,thickness)
			cc.T.Size = UDim2.new(0,thickness,0,len)
			cc.B.Size = UDim2.new(0,thickness,0,len)
		end
	end)
	script.Parent.Thickness.FocusLost:Connect(function()
		if tonumber(script.Parent.Thickness.Text) ~= nil then
			local thick = tonumber(script.Parent.Thickness.Text)
			thickness = thick
			cc.L.Size = UDim2.new(0,length,0,thick)
			cc.R.Size = UDim2.new(0,length,0,thick)
			cc.T.Size = UDim2.new(0,thick,0,length)
			cc.B.Size = UDim2.new(0,thick,0,length)
			cc.D.Size = UDim2.new(0,thick,0,thick)
		end
	end)
	script.Parent.Offset.FocusLost:Connect(function()
		if tonumber(script.Parent.Offset.Text) ~= nil then
			local off = tonumber(script.Parent.Offset.Text)
			offset = off
			cc.L.Position = UDim2.new(0.5,-off,0.5,0)
			cc.R.Position = UDim2.new(0.5,off,0.5,0)
			cc.T.Position = UDim2.new(0.5,0,0.5,-off)
			cc.B.Position = UDim2.new(0.5,0,0.5,off)
		end
	end)
	script.Parent.Movement.Activated:Connect(function()
		script.Parent.Movement.Enabled.Value = not script.Parent.Movement.Enabled.Value
		if enabled("Movement") then
			script.Parent.Movement.BackgroundColor3 = Color3.fromRGB(0,255,0)
		else
			script.Parent.Movement.BackgroundColor3 = Color3.fromRGB(255,255,255)
		end
	end)
	script.Parent.Factor.FocusLost:Connect(function()
		if tonumber(script.Parent.Factor.Text) ~= nil then
			factor = tonumber(script.Parent.Factor.Text) 
		end
	end)
	script.Parent.Outline.Activated:Connect(function()
		script.Parent.Outline.Enabled.Value = not script.Parent.Outline.Enabled.Value
		if enabled("Outline") then
			script.Parent.Outline.BackgroundColor3 = Color3.fromRGB(0,255,0)
			change("BorderSizePixel",1)
		else
			script.Parent.Outline.BackgroundColor3 = Color3.fromRGB(255,255,255)
			change("BorderSizePixel",0)
		end
	end)
	script.Parent.OutlineColor.FocusLost:Connect(function()
		if script.Parent.OutlineColor.Text:find(",") then
			local c = script.Parent.OutlineColor.Text:gsub(" ",""):split(",")
			change("BorderColor3",Color3.fromRGB(tonumber(c[1]),tonumber(c[2]),tonumber(c[3])))
		end
	end)
	script.Parent.OutlineThickness.FocusLost:Connect(function()
		if tonumber(script.Parent.OutlineThickness.Text) ~= nil then
			change("BorderSizePixel",tonumber(script.Parent.OutlineThickness.Text))
		end
	end)
	script.Parent.Dot.Activated:Connect(function()
		script.Parent.Dot.Enabled.Value = not script.Parent.Dot.Enabled.Value
		cc.D.Visible = enabled("Dot")
		if enabled("Dot") then
			script.Parent.Dot.BackgroundColor3 = Color3.fromRGB(0,255,0)
		else
			script.Parent.Dot.BackgroundColor3 = Color3.fromRGB(255,255,255)
		end
	end)
	game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Running:Connect(function(speed)
		cc.L.Position = UDim2.new(0.5,
			math.clamp(-offset * ((enabled("Movement") and (speed / factor)) or 1),-math.huge,-offset),
			0.5,0)
		cc.R.Position = UDim2.new(0.5,
			math.clamp(offset * ((enabled("Movement") and (speed / factor)) or 1),offset,math.huge),
			0.5,0)
		cc.T.Position = UDim2.new(0.5,0,0.5,
			math.clamp(-offset * ((enabled("Movement") and (speed / factor)) or 1),-math.huge,-offset))
		cc.B.Position = UDim2.new(0.5,0,0.5,
			math.clamp(offset * ((enabled("Movement") and (speed / factor)) or 1),offset,math.huge))
	end)
	game:GetService("UserInputService").InputBegan:Connect(function(i,gp)
		if not gp and i.KeyCode == Enum.KeyCode.RightControl then
			script.Parent.Visible = not script.Parent.Visible
		end
	end)
	while wait() do
		game:GetService("UserInputService").MouseIconEnabled = not ((game.Players.LocalPlayer.Character.Head.Position - workspace.CurrentCamera.CFrame.Position).Magnitude < 3)
	end
end
coroutine.wrap(YGNOGB_fake_script)()
