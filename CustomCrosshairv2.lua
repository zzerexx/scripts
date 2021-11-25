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
local Menu = Instance.new("TextButton")
local Colors = Instance.new("Frame")
local UIListLayout_2 = Instance.new("UIListLayout")
local White = Instance.new("TextButton")
local Green = Instance.new("TextButton")
local YellowGreen = Instance.new("TextButton")
local Yellow = Instance.new("TextButton")
local Cyan = Instance.new("TextButton")
local Pink = Instance.new("TextButton")
local Red = Instance.new("TextButton")
local Config = Instance.new("Frame")
local UIListLayout_3 = Instance.new("UIListLayout")
local Load = Instance.new("TextButton")
local Exit = Instance.new("TextButton")
local Config_2 = Instance.new("TextBox")
local Copy = Instance.new("TextButton")
local Set = Instance.new("TextButton")
local Label_2 = Instance.new("TextLabel")
local Placeholder = Instance.new("TextButton")
local Create = Instance.new("TextButton")
local Delete = Instance.new("TextButton")
local Message = Instance.new("Frame")
local Label_3 = Instance.new("TextLabel")
local Title = Instance.new("TextLabel")
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
Gui.Position = UDim2.new(0.5, -120, 0.5, 0)
Gui.Size = UDim2.new(0, 150, 0, 25)

Color.Name = "Color"
Color.Parent = Gui
Color.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Color.BorderSizePixel = 0
Color.LayoutOrder = 1
Color.Size = UDim2.new(1, 0, 0, 25)
Color.Font = Enum.Font.SourceSans
Color.PlaceholderText = "Color"
Color.Text = ""
Color.TextColor3 = Color3.fromRGB(0, 0, 0)
Color.TextSize = 14.000

Drop.Name = "Drop"
Drop.Parent = Color
Drop.AnchorPoint = Vector2.new(1, 0)
Drop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
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
OutlineColor.PlaceholderText = "Outline Color"
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

Menu.Name = "Menu"
Menu.Parent = Gui
Menu.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Menu.BorderSizePixel = 0
Menu.LayoutOrder = 12
Menu.Size = UDim2.new(1, 0, 0, 25)
Menu.AutoButtonColor = false
Menu.Font = Enum.Font.SourceSans
Menu.Text = "Config Menu"
Menu.TextColor3 = Color3.fromRGB(0, 0, 0)
Menu.TextSize = 14.000

Colors.Name = "Colors"
Colors.Parent = CCv2
Colors.AnchorPoint = Vector2.new(0, 0.5)
Colors.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Colors.BorderSizePixel = 2
Colors.Position = UDim2.new(0.5, -118, 0.5, -75)
Colors.Size = UDim2.new(0, 100, 0, 25)
Colors.Visible = false

UIListLayout_2.Parent = Colors
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

White.Name = "White"
White.Parent = Colors
White.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
White.BorderSizePixel = 0
White.Size = UDim2.new(1, 0, 0, 25)
White.AutoButtonColor = false
White.Font = Enum.Font.SourceSans
White.Text = "White"
White.TextColor3 = Color3.fromRGB(0, 0, 0)
White.TextSize = 14.000

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

Config.Name = "Config"
Config.Parent = CCv2
Config.AnchorPoint = Vector2.new(0, 0.5)
Config.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Config.BorderColor3 = Color3.fromRGB(0, 0, 0)
Config.BorderSizePixel = 2
Config.Position = UDim2.new(0.5, 120, 0.5, 0)
Config.Size = UDim2.new(0, 150, 0, 25)
Config.Visible = false

UIListLayout_3.Parent = Config
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder

Load.Name = "Load"
Load.Parent = Config
Load.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Load.BorderSizePixel = 0
Load.LayoutOrder = 2
Load.Size = UDim2.new(1, 0, 0, 25)
Load.AutoButtonColor = false
Load.Font = Enum.Font.SourceSans
Load.Text = "Load Config"
Load.TextColor3 = Color3.fromRGB(0, 0, 0)
Load.TextSize = 14.000

Exit.Name = "Exit"
Exit.Parent = Config
Exit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Exit.BorderSizePixel = 0
Exit.LayoutOrder = 100
Exit.Size = UDim2.new(1, 0, 0, 25)
Exit.AutoButtonColor = false
Exit.Font = Enum.Font.SourceSans
Exit.Text = "Exit"
Exit.TextColor3 = Color3.fromRGB(0, 0, 0)
Exit.TextSize = 14.000

Config_2.Name = "Config"
Config_2.Parent = Config
Config_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Config_2.BorderSizePixel = 0
Config_2.LayoutOrder = 1
Config_2.Size = UDim2.new(1, 0, 0, 25)
Config_2.Font = Enum.Font.SourceSans
Config_2.PlaceholderText = "Paste config here"
Config_2.Text = ""
Config_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Config_2.TextSize = 14.000

Copy.Name = "Copy"
Copy.Parent = Config
Copy.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Copy.BorderSizePixel = 0
Copy.LayoutOrder = 5
Copy.Size = UDim2.new(1, 0, 0, 25)
Copy.AutoButtonColor = false
Copy.Font = Enum.Font.SourceSans
Copy.Text = "Copy Crosshair Config"
Copy.TextColor3 = Color3.fromRGB(0, 0, 0)
Copy.TextSize = 14.000

Set.Name = "Set"
Set.Parent = Config
Set.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Set.BorderSizePixel = 0
Set.LayoutOrder = 6
Set.Size = UDim2.new(1, 0, 0, 25)
Set.AutoButtonColor = false
Set.Font = Enum.Font.SourceSans
Set.Text = "Set to Default"
Set.TextColor3 = Color3.fromRGB(0, 0, 0)
Set.TextSize = 14.000

Label_2.Name = "Label"
Label_2.Parent = Config
Label_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label_2.BorderSizePixel = 0
Label_2.LayoutOrder = 7
Label_2.Size = UDim2.new(1, 0, 0, 25)
Label_2.Font = Enum.Font.SourceSans
Label_2.Text = "Your configs are below"
Label_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Label_2.TextSize = 14.000

Placeholder.Name = "Placeholder"
Placeholder.Parent = Config
Placeholder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Placeholder.BorderSizePixel = 0
Placeholder.LayoutOrder = 8
Placeholder.Size = UDim2.new(1, 0, 0, 25)
Placeholder.Visible = false
Placeholder.AutoButtonColor = false
Placeholder.Font = Enum.Font.SourceSans
Placeholder.Text = "Config Name"
Placeholder.TextColor3 = Color3.fromRGB(0, 0, 0)
Placeholder.TextSize = 14.000

Create.Name = "Create"
Create.Parent = Config
Create.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Create.BorderSizePixel = 0
Create.LayoutOrder = 3
Create.Size = UDim2.new(1, 0, 0, 25)
Create.AutoButtonColor = false
Create.Font = Enum.Font.SourceSans
Create.Text = "Create New Config"
Create.TextColor3 = Color3.fromRGB(0, 0, 0)
Create.TextSize = 14.000

Delete.Name = "Delete"
Delete.Parent = Config
Delete.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Delete.BorderSizePixel = 0
Delete.LayoutOrder = 3
Delete.Size = UDim2.new(1, 0, 0, 25)
Delete.AutoButtonColor = false
Delete.Font = Enum.Font.SourceSans
Delete.Text = "Delete Config"
Delete.TextColor3 = Color3.fromRGB(0, 0, 0)
Delete.TextSize = 14.000

Message.Name = "Message"
Message.Parent = CCv2
Message.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Message.BorderColor3 = Color3.fromRGB(0, 0, 0)
Message.BorderSizePixel = 2
Message.Position = UDim2.new(0, 50, 0, 50)
Message.Size = UDim2.new(0, 180, 0, 90)
Message.Visible = false
Message.ZIndex = 2

Label_3.Name = "Label"
Label_3.Parent = Message
Label_3.AnchorPoint = Vector2.new(0.5, 0)
Label_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label_3.BorderSizePixel = 0
Label_3.Position = UDim2.new(0.5, 0, 0, 24)
Label_3.Size = UDim2.new(1, -10, 1, -30)
Label_3.ZIndex = 2
Label_3.Font = Enum.Font.SourceSans
Label_3.Text = "Message"
Label_3.TextColor3 = Color3.fromRGB(0, 0, 0)
Label_3.TextSize = 14.000
Label_3.TextWrapped = true
Label_3.TextXAlignment = Enum.TextXAlignment.Left
Label_3.TextYAlignment = Enum.TextYAlignment.Top

Title.Name = "Title"
Title.Parent = Message
Title.AnchorPoint = Vector2.new(0.5, 0)
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.5, 0, 0, 5)
Title.Size = UDim2.new(1, -10, 0, 18)
Title.ZIndex = 2
Title.Font = Enum.Font.SourceSans
Title.Text = "Title"
Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Title.TextSize = 16.000
Title.TextWrapped = true
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextYAlignment = Enum.TextYAlignment.Top

-- Scripts:

local function EOLKLP_fake_script() -- Gui.LocalScript 
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
	script.Parent.Parent.IgnoreGuiInset = true
	script.Parent.Parent.Message.Label.TextTruncate = Enum.TextTruncate.AtEnd
	script.Parent.Parent.Message.Label.TextWrapped = true
	script.Parent.Parent.Config.AutomaticSize = Enum.AutomaticSize.Y
	script.Parent.Parent.Config.Config.TextTruncate = Enum.TextTruncate.AtEnd
	
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
	local studio = game:GetService("RunService"):IsStudio()
	local rs = true
	
	local color = Color3.fromRGB(255,255,255)
	local opacity = 0
	local length = 6
	local thickness = 2
	local offset = 4
	local factor = 2
	local ocolor = Color3.fromRGB(0,0,0)
	local othickness = 1
	local config = nil
	
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
	function getconfig()
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
		return game:GetService("HttpService"):JSONEncode(c)
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
		script.Parent.OutlineColor.Text = c.OutlineColor.R..", "..c.OutlineColor.G..", "..c.OutlineColor.B
		change("BorderColor3",fromvalue(c.OutlineColor))
		script.Parent.OutlineThickness.Text = c.OutlineThickness
		change("BorderSizePixel",(c.Outline and c.OutlineThickness) or 0)
		
		script.Parent.Dot.Enabled.Value = c.CenterDot
		script.Parent.Dot.BackgroundColor3 = (c.CenterDot and Color3.fromRGB(0,255,0)) or Color3.fromRGB(255,255,255)
		cc.D.Visible = c.CenterDot
	end
	local showingmessageboxthingorsomethinglikethatidk = false
	function message(msg,duration)
		if showingmessageboxthingorsomethinglikethatidk then
			return
		end
		rs = false
		showingmessageboxthingorsomethinglikethatidk = true
		spawn(function()
			repeat
				script.Parent.Parent.Message.AnchorPoint = Vector2.new(0.5,0)
				script.Parent.Parent.Message.Position = UDim2.new(0.5,0,0.5,50)
				script.Parent.Parent.Message.Visible = true
				script.Parent.Parent.Message.Title.Text = "Message"
				script.Parent.Parent.Message.Label.Text = msg 
				game:GetService("RunService").RenderStepped:Wait()
			until rs
		end)
		wait(duration)
		rs = true
		showingmessageboxthingorsomethinglikethatidk = false
		script.Parent.Parent.Message.AnchorPoint = Vector2.new(0,0)
		script.Parent.Parent.Message.Visible = false
	end
	
	if not studio and isfolder("CCv2") then
		default = readfile("CCv2\\\Default.json")
		loadconfig(default)
	end
	if not studio and not isfolder("CCv2") then
		makefolder("CCv2")
		writefile("CCv2\\Default.json",default)
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
	function move(speed)
		if script.Parent.Movement.Enabled.Value then
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
		end
	end
	game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").Running:Connect(function(speed)
		move(speed)
	end)
	game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
		char:WaitForChild("Humanoid").Running:Connect(function(speed)
			move(speed)
		end)
	end)
	script.Parent.Menu.Activated:Connect(function()
		script.Parent.Parent.Config.Visible = not script.Parent.Parent.Config.Visible
	end)
	game:GetService("UserInputService").InputBegan:Connect(function(i,gp)
		if not gp and i.KeyCode == Enum.KeyCode.RightControl then
			script.Parent.Visible = not script.Parent.Visible
			script.Parent.Parent.Colors.Visible = script.Parent.Visible
			script.Parent.Parent.Config.Visible = script.Parent.Visible
		end
	end)
	local msgs = {
		['Color'] = "The color of your crosshair\nExample: 0,170,255",
		['Opacity'] = "The opacity of your crosshair\nMust be a number between 0 and 1",
		['Length'] = "The length of each line",
		['Thickness'] = "The thickness of each line",
		['Offset'] = "How far away the lines are from the center",
		['Movement'] = "If enabled, character movement will affect the size of the crosshair",
		['Factor'] = "hard to explain, just set it to something greater than 0",
		['Outline'] = "If enabled, your crosshair will have an outline",
		['OutlineColor'] = "The color of the outline",
		['OutlineThickness'] = "The thickness of the outline",
		['Dot'] = "If enabled, a dot in the center of your crosshair will be visible",
		['Reset'] = "Resets your crosshair to the default config. If you have set a config to default, it will set it to that config instead.",
		['Menu'] = "Opens the config menu",
		
		['Config'] = "Paste your config here and click Load Config",
		['Load'] = "Paste your config in the text box above and click Load Config",
		['Create'] = "Enter your desired config name in the text box at the top and click Create New Config",
		['Delete'] = "Enter the name of the config you want to delete in the text box at the top (CASE SENSITIVE!)",
		['Copy'] = "Copies the current crosshair's config to your clipboard",
		['Set'] = "Sets the default config to the current crosshair",
	}
	local t = script.Parent:GetChildren()
	for _,v in next, script.Parent.Parent.Config:GetChildren() do
		table.insert(t,v)
	end
	for _,v in next, t do
		if not v:IsA("LocalScript") and not v:IsA("UIListLayout") then
			local ishovering = false
			v.MouseEnter:Connect(function()
				if not rs then
					return
				end
				if msgs[v.Name] then
					script.Parent.Parent.Message.Title.Text = (v.ClassName == "TextBox" and v.PlaceholderText) or v.Text
					script.Parent.Parent.Message.Label.Text = msgs[v.Name]
					ishovering = true
					wait(1)
					if ishovering then
						script.Parent.Parent.Message.Visible = true
						v.MouseLeave:Wait()
						script.Parent.Parent.Message.Visible = false
					end
					ishovering = false
				end
			end)
			v.MouseLeave:Connect(function()
				ishovering = false
			end)
		end
	end
	game:GetService("RunService").RenderStepped:Connect(function()
		if rs then
			local m = game:GetService("UserInputService"):GetMouseLocation()
			script.Parent.Parent.Message.Position = UDim2.new(0,m.X + 16,0,m.Y + 22)
		end
	end)
	
	-- config shits
	local x = script.Parent.Parent.Config
	local z = nil
	local fake = { -- this is for testing in studio
		['Default.json'] = '{"Offset":4,"OutlineColor":{"R":0,"B":0,"G":0},"Color":{"R":255,"B":255,"G":255},"Opacity":0,"Factor":2,"Length":6,"Outline":false,"OutlineThickness":1,"Thickness":2,"CenterDot":true,"MovementError":false}',
		['MyConfig.json'] = '{"Offset":2,"OutlineColor":{"R":0,"B":0,"G":0},"Color":{"R":0,"B":255,"G":255},"Opacity":0,"Factor":2,"Thickness":2,"Length":4,"OutlineThickness":1,"CenterDot":false,"MovementError":false,"Outline":false}'
	}
	
	x.Config.FocusLost:Connect(function()
		z = x.Config.Text
	end)
	x.Load.Activated:Connect(function()
		if not z then
			return
		end
		loadconfig(z)
		message("Successfully loaded your config!",1.5)
	end)
	x.Create.Activated:Connect(function()
		if z ~= nil and not z:find("{") then
			local c = getconfig()
			if not studio then
				writefile("CCv2\\"..z..".json",c)
			end
			local new = x.Placeholder:Clone()
			new.Parent = x
			new.Visible = true
			new.Text = z
			new.Name = z
			message("Created a new config: "..z,1.5)
			new.Activated:Connect(function()
				loadconfig(c)
				message("Successfully loaded config: "..z,1.5)
			end)
		end
	end)
	x.Delete.Activated:Connect(function()
		if z ~= nil and not z:find("{") and isfile("CCv2\\"..z..".json") and script.Parent.Parent.Config:FindFirstChild(z) then
			if not studio then
				delfile("CCv2\\"..z..".json")
			end
			script.Parent.Parent.Config[z]:Destroy()
			message("Deleted config: "..z,2)
		elseif not isfile(z..".json") then
			message(z.." does not exist",2)
		end
	end)
	x.Copy.Activated:Connect(function()
		setclipboard(getconfig())
		message("Copied to your clipboard!",1.5)
	end)
	x.Set.Activated:Connect(function()
		default = getconfig()
		writefile("CCv2\\Default.json",default)
		message("Your current crosshair has been set to default.",1.5)
	end)
	x.Exit.Activated:Connect(function()
		x.Visible = false
	end)
	for i,v in next, (not studio and listfiles("CCv2")) or {"Default.json","MyConfig.json"} do
		local new = x.Placeholder:Clone()
		local name = v:split(".")[1]
		new.Parent = x
		new.Visible = true
		new.Text = name
		new.Name = name
		new.Activated:Connect(function()
			loadconfig((not studio and readfile("CCv2\\"..v)) or fake[v])
			message("Successfully loaded config: "..name,1.5)
		end)
	end
	
	while wait() do
		game:GetService("UserInputService").MouseIconEnabled = not ((game.Players.LocalPlayer.Character.Head.Position - workspace.CurrentCamera.CFrame.Position).Magnitude < 3)
	end
end
coroutine.wrap(EOLKLP_fake_script)()
