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
local Drop = Instance.new("TextButton")
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
local Config = Instance.new("TextBox")
local LoadConfig = Instance.new("TextButton")
local CopyConfig = Instance.new("TextButton")
local Reset = Instance.new("TextButton")
local Colors = Instance.new("Frame")
local UIListLayout_2 = Instance.new("UIListLayout")
local Green = Instance.new("TextButton")
local YellowGreen = Instance.new("TextButton")
local Yellow = Instance.new("TextButton")
local Cyan = Instance.new("TextButton")
local Pink = Instance.new("TextButton")
local Red = Instance.new("TextButton")
if syn then
	syn.protect_gui(CCv2)
end

--Properties:

CCv2.Name = game:GetService("HttpService"):GenerateGUID(false)
CCv2.Parent = (gethui and gethui()) or (get_hidden_ui and get_hidden_ui()) or game.CoreGui
CCv2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

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

Drop.Name = "Drop"
Drop.Parent = Color
Drop.AnchorPoint = Vector2.new(1, 0)
Drop.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
Drop.BorderSizePixel = 0
Drop.Position = UDim2.new(1, 0, 0, 0)
Drop.Size = UDim2.new(0, 15, 0, 25)
Drop.AutoButtonColor = false
Drop.Font = Enum.Font.Code
Drop.Text = ">"
Drop.TextColor3 = Color3.fromRGB(0, 0, 0)
Drop.TextSize = 14.000

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
Label.LayoutOrder = 100
Label.Size = UDim2.new(1, 0, 0, 25)
Label.Font = Enum.Font.SourceSans
Label.Text = "Right Control to show/hide"
Label.TextColor3 = Color3.fromRGB(0, 0, 0)
Label.TextSize = 14.000

Config.Name = "Config"
Config.Parent = Gui
Config.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Config.BorderSizePixel = 0
Config.LayoutOrder = 12
Config.Size = UDim2.new(1, 0, 0, 25)
Config.Font = Enum.Font.SourceSans
Config.PlaceholderText = "Paste config here"
Config.Text = ""
Config.TextColor3 = Color3.fromRGB(0, 0, 0)
Config.TextSize = 14.000

LoadConfig.Name = "LoadConfig"
LoadConfig.Parent = Gui
LoadConfig.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadConfig.BorderSizePixel = 0
LoadConfig.LayoutOrder = 13
LoadConfig.Size = UDim2.new(1, 0, 0, 25)
LoadConfig.AutoButtonColor = false
LoadConfig.Font = Enum.Font.SourceSans
LoadConfig.Text = "Load Config"
LoadConfig.TextColor3 = Color3.fromRGB(0, 0, 0)
LoadConfig.TextSize = 14.000

CopyConfig.Name = "CopyConfig"
CopyConfig.Parent = Gui
CopyConfig.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CopyConfig.BorderSizePixel = 0
CopyConfig.LayoutOrder = 14
CopyConfig.Size = UDim2.new(1, 0, 0, 25)
CopyConfig.AutoButtonColor = false
CopyConfig.Font = Enum.Font.SourceSans
CopyConfig.Text = "Copy Crosshair Config"
CopyConfig.TextColor3 = Color3.fromRGB(0, 0, 0)
CopyConfig.TextSize = 14.000

Reset.Name = "Reset"
Reset.Parent = Gui
Reset.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Reset.BorderSizePixel = 0
Reset.LayoutOrder = 15
Reset.Size = UDim2.new(1, 0, 0, 25)
Reset.AutoButtonColor = false
Reset.Font = Enum.Font.SourceSans
Reset.Text = "Reset to Default"
Reset.TextColor3 = Color3.fromRGB(0, 0, 0)
Reset.TextSize = 14.000

Colors.Name = "Colors"
Colors.Parent = CCv2
Colors.AnchorPoint = Vector2.new(1, 0.5)
Colors.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Colors.BorderSizePixel = 2
Colors.Position = UDim2.new(0.5, 2, 0.5, -125)
Colors.Size = UDim2.new(0, 100, 0, 25)
Colors.Visible = false

UIListLayout_2.Parent = Colors
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

Green.Name = "Green"
Green.Parent = Colors
Green.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Green.BorderSizePixel = 0
Green.Size = UDim2.new(1, 0, 0, 25)
Green.AutoButtonColor = false
Green.Font = Enum.Font.SourceSans
Green.Text = "Green"
Green.TextColor3 = Color3.fromRGB(0, 0, 0)
Green.TextSize = 14.000

YellowGreen.Name = "YellowGreen"
YellowGreen.Parent = Colors
YellowGreen.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
YellowGreen.BorderSizePixel = 0
YellowGreen.Size = UDim2.new(1, 0, 0, 25)
YellowGreen.AutoButtonColor = false
YellowGreen.Font = Enum.Font.SourceSans
YellowGreen.Text = "Yellow Green"
YellowGreen.TextColor3 = Color3.fromRGB(0, 0, 0)
YellowGreen.TextSize = 14.000

Yellow.Name = "Yellow"
Yellow.Parent = Colors
Yellow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Yellow.BorderSizePixel = 0
Yellow.Size = UDim2.new(1, 0, 0, 25)
Yellow.AutoButtonColor = false
Yellow.Font = Enum.Font.SourceSans
Yellow.Text = "Yellow"
Yellow.TextColor3 = Color3.fromRGB(0, 0, 0)
Yellow.TextSize = 14.000

Cyan.Name = "Cyan"
Cyan.Parent = Colors
Cyan.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Cyan.BorderSizePixel = 0
Cyan.Size = UDim2.new(1, 0, 0, 25)
Cyan.AutoButtonColor = false
Cyan.Font = Enum.Font.SourceSans
Cyan.Text = "Cyan"
Cyan.TextColor3 = Color3.fromRGB(0, 0, 0)
Cyan.TextSize = 14.000

Pink.Name = "Pink"
Pink.Parent = Colors
Pink.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Pink.BorderSizePixel = 0
Pink.Size = UDim2.new(1, 0, 0, 25)
Pink.AutoButtonColor = false
Pink.Font = Enum.Font.SourceSans
Pink.Text = "Pink"
Pink.TextColor3 = Color3.fromRGB(0, 0, 0)
Pink.TextSize = 14.000

Red.Name = "Red"
Red.Parent = Colors
Red.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Red.BorderSizePixel = 0
Red.Size = UDim2.new(1, 0, 0, 25)
Red.AutoButtonColor = false
Red.Font = Enum.Font.SourceSans
Red.Text = "Red"
Red.TextColor3 = Color3.fromRGB(0, 0, 0)
Red.TextSize = 14.000

-- Scripts:

local function NYHB_fake_script() -- Gui.LocalScript 
	local script = Instance.new('LocalScript', Gui)

	-- stuff that doesnt get converted by gui to lua
	local Enabled_1 = Instance.new("BoolValue")
	local Enabled_2 = Instance.new("BoolValue")
	local Enabled_3 = Instance.new("BoolValue")
	
	Enabled_1.Name = "Enabled"
	Enabled_1.Parent = script.Parent.Dot
	Enabled_1.Value = true
	
	Enabled_2.Name = "Enabled"
	Enabled_2.Parent = script.Parent.Movement
	Enabled_2.Value = false
	
	Enabled_3.Name = "Enabled"
	Enabled_3.Parent = script.Parent.Outline
	Enabled_3.Value = false
	
	script.Parent.AutomaticSize = Enum.AutomaticSize.Y
	script.Parent.Parent.Colors.AutomaticSize = Enum.AutomaticSize.Y
	
	
	local default = '{"Offset":4,"OutlineColor":{"R":0,"B":0,"G":0},"Color":{"R":255,"B":255,"G":255},"Opacity":0,"Factor":2,"Length":6,"Outline":false,"OutlineThickness":1,"Thickness":2,"CenterDot":true,"MovementError":false}'
	--[[{
		Color = {R = 255,G = 255,B = 255},
		Opacity = 0,
		Length = 6,
		Thickness = 2,
		Offset = 4,
		MovementError = false,
		Factor = 2,
		Outline = false,
		OutlineColor = {R = 0,G = 0,B = 0},
		OutlineThickness = 1,
		CenterDot = true,
	}]]
	
	local cc = script.Parent.Parent.C
	local colors = {
		['white'] = Color3.fromRGB(255,255,255),
		['green'] = Color3.fromRGB(0,255,0),
		['yellowgreen'] = Color3.fromRGB(150,255,0),
		['greenyellow'] = Color3.fromRGB(150,255,0),
		['yellow'] = Color3.fromRGB(255,255,0),
		['cyan'] = Color3.fromRGB(0,255,255),
		['pink'] = Color3.fromRGB(255,0,255),
		['red'] = Color3.fromRGB(255,0,0),
	}
	
	local color = Color3.fromRGB(255,255,255)
	local opacity = 0
	local length = 6
	local thickness = 2
	local offset = 4
	local factor = 2
	local ocolor = Color3.fromRGB(0,0,0)
	local othickness = 1
	local config = nil
	
	local studio = game:GetService("RunService"):IsStudio()
	
	if not studio then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/MoreColor3.lua"))()
	end
	
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
	function fromvalue(c)
		return Color3.fromRGB(c.R,c.G,c.B)
	end
	function tovalue(c)
		return {R = math.floor(c.R * 255),G = math.floor(c.G * 255),B = math.floor(c.B * 255)}
	end
	function copyconfig()
		local c = {
			Color = tovalue(color),
			Opacity = opacity,
			Length = length,
			Thickness = thickness,
			Offset = offset,
			MovementError = enabled("Movement"),
			Factor = factor,
			Outline = enabled("Outline"),
			OutlineColor = tovalue(ocolor),
			OutlineThickness = othickness,
			CenterDot = enabled("Dot")
		}
		local str = game:GetService("HttpService"):JSONEncode(c)
		if studio then
			return print(str)
		end
		setclipboard(str)
	end
	function loadconfig(c)
		c = game:GetService("HttpService"):JSONDecode(c)
		
		script.Parent.Color.Text = c.Color.R..", "..c.Color.G..", "..c.Color.B
		change("BackgroundColor3",fromvalue(c.Color))
		script.Parent.Opacity.Text = 1 - c.Opacity
		change("BackgroundTransparency",c.Opacity)
		
		script.Parent.Length.Text = c.Length
		script.Parent.Thickness.Text = c.Thickness
		cc.L.Size = UDim2.new(0,c.Length,0,c.Thickness)
		cc.R.Size = UDim2.new(0,c.Length,0,c.Thickness)
		cc.T.Size = UDim2.new(0,c.Thickness,0,c.Length)
		cc.B.Size = UDim2.new(0,c.Thickness,0,c.Length)
		cc.D.Size = UDim2.new(0,c.Thickness,0,c.Thickness)
		
		script.Parent.Offset.Text = c.Offset
		cc.L.Position = UDim2.new(0.5,-c.Offset,0.5,0)
		cc.R.Position = UDim2.new(0.5,c.Offset,0.5,0)
		cc.T.Position = UDim2.new(0.5,0,0.5,-c.Offset)
		cc.B.Position = UDim2.new(0.5,0,0.5,c.Offset)
		
		script.Parent.Movement.Enabled.Value = c.MovementError
		script.Parent.Movement.BackgroundColor3 = (c.MovementError and Color3.fromRGB(0,255,0)) or Color3.fromRGB(255,255,255)
		script.Parent.Factor.Text = c.Factor
		factor = c.Factor
		
		script.Parent.Outline.Enabled.Value = c.Outline
		script.Parent.Outline.BackgroundColor3 = (c.Outline and Color3.fromRGB(0,255,0)) or Color3.fromRGB(255,255,255)
		script.Parent.OutlineColor.Text = c.Color.R..", "..c.Color.G..", "..c.Color.B
		change("BorderColor3",fromvalue(c.OutlineColor))
		script.Parent.OutlineThickness.Text = c.OutlineThickness
		change("BorderSizePixel",(c.Outline and c.OutlineThickness) or 0)
		
		script.Parent.Dot.Enabled.Value = c.CenterDot
		script.Parent.Dot.BackgroundColor3 = (c.CenterDot and Color3.fromRGB(0,255,0)) or Color3.fromRGB(255,255,255)
		cc.D.Visible = c.CenterDot
	end
	
	script.Parent.Color.FocusLost:Connect(function()
		if script.Parent.Color.Text:find(",") then
			local c = script.Parent.Color.Text:gsub(" ",""):split(",")
			color = Color3.fromRGB(tonumber(c[1]),tonumber(c[2]),tonumber(c[3]))
			change("BackgroundColor3",Color3.fromRGB(tonumber(c[1]),tonumber(c[2]),tonumber(c[3])))
		end
	end)
	script.Parent.Color.Drop.Activated:Connect(function()
		script.Parent.Parent.Colors.Visible = not script.Parent.Parent.Colors.Visible
		if script.Parent.Parent.Colors.Visible then
			script.Parent.Color.Drop.Text = "<"
		else
			script.Parent.Color.Drop.Text = ">"
		end
	end)
	for _,v in next, script.Parent.Parent.Colors:GetChildren() do
		if v:IsA("TextButton") then
			v.Activated:Connect(function()
				color = colors[v.Name:lower()]
				change("BackgroundColor3",colors[v.Name:lower()])
			end)
		end
	end
	script.Parent.Opacity.FocusLost:Connect(function()
		if tonumber(script.Parent.Opacity.Text) ~= nil then
			local num = tonumber(script.Parent.Opacity.Text)
			num = 1 - num
			opacity = num
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
			ocolor = Color3.fromRGB(tonumber(c[1]),tonumber(c[2]),tonumber(c[3]))
			change("BorderColor3",Color3.fromRGB(tonumber(c[1]),tonumber(c[2]),tonumber(c[3])))
		end
	end)
	script.Parent.OutlineThickness.FocusLost:Connect(function()
		if tonumber(script.Parent.OutlineThickness.Text) ~= nil then
			othickness = tonumber(script.Parent.OutlineThickness.Text)
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
	script.Parent.Config.FocusLost:Connect(function()
		config = script.Parent.Config.Text
	end)
	script.Parent.LoadConfig.Activated:Connect(function()
		loadconfig(script.Parent.Config.Text)
	end)
	script.Parent.CopyConfig.Activated:Connect(copyconfig)
	script.Parent.Reset.Activated:Connect(function()
		loadconfig(default)
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
coroutine.wrap(NYHB_fake_script)()
