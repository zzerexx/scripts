--[[ Synapse XI (Synapse X Internal)
	Version 1.0.0
	Made by zzerexx#3970
]]

local SynapseXI = Instance.new("ScreenGui")
local Topbar = Instance.new("Frame")
local Main = Instance.new("Frame")
local Editor = Instance.new("TextBox")
local Numbers = Instance.new("TextBox")
local Tab1 = Instance.new("TextLabel")
local ScriptBox = Instance.new("Frame")
local Scripts = Instance.new("ScrollingFrame")
local Dex = Instance.new("TextButton")
local IY = Instance.new("TextButton")
local CMDX = Instance.new("TextButton")
local Attach = Instance.new("TextButton")
local Options = Instance.new("TextButton")
local ExecFile = Instance.new("TextButton")
local Clear = Instance.new("TextButton")
local Execute = Instance.new("TextButton")
local OpenFile = Instance.new("TextButton")
local SaveFile = Instance.new("TextButton")
local ScriptHub = Instance.new("TextButton")
local SynapseLogo = Instance.new("ImageButton")
local Title = Instance.new("TextLabel")
local Minimize = Instance.new("TextButton")
local Maximize = Instance.new("TextButton")
local Close = Instance.new("TextButton")
local TopbarCredits = Instance.new("Frame")
local SynapseCredits = Instance.new("Frame")
local InfoIcon = Instance.new("ImageLabel")
local Credits1 = Instance.new("TextLabel")
local Credits2 = Instance.new("TextLabel")
local Title_2 = Instance.new("TextLabel")
local Close_2 = Instance.new("TextButton")
local CloseBG = Instance.new("TextButton")
local Bottom = Instance.new("Frame")
local Ok = Instance.new("ImageButton")
local Menu = Instance.new("Frame")
local Execute_2 = Instance.new("TextButton")
local Load = Instance.new("TextButton")
local BoxTopbar = Instance.new("Frame")
local Main_2 = Instance.new("Frame")
local Title_3 = Instance.new("TextLabel")
local Close_3 = Instance.new("TextButton")
local Action = Instance.new("TextLabel")
local ScriptName = Instance.new("TextBox")
local Extension = Instance.new("TextButton")
local Save = Instance.new("TextButton")
local Error = Instance.new("TextLabel")
local Success = Instance.new("TextLabel")

--Properties:

SynapseXI.Name = "SynapseXI"
SynapseXI.Parent = game.CoreGui

Topbar.Name = "Topbar"
Topbar.Parent = SynapseXI
Topbar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Topbar.BorderSizePixel = 0
Topbar.Position = UDim2.new(0.0761099458, 0, 0.323442072, 0)
Topbar.Size = UDim2.new(0, 801, 0, 30)

Main.Name = "Main"
Main.Parent = Topbar
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, 0, 5.9067359, 0)
Main.Size = UDim2.new(0, 801, 0, 355)
Main.ZIndex = 0

Editor.Name = "Editor"
Editor.Parent = Main
Editor.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Editor.BorderSizePixel = 0
Editor.Position = UDim2.new(0, 44, 0.0850000009, 23)
Editor.Size = UDim2.new(0, 632, 0, 259)
Editor.ClearTextOnFocus = false
Editor.Font = Enum.Font.Code
Editor.MultiLine = true
Editor.PlaceholderText = "-- made by zzerexx#3970"
Editor.Text = ""
Editor.TextColor3 = Color3.fromRGB(255, 255, 255)
Editor.TextSize = 14.000
Editor.TextWrapped = true
Editor.TextXAlignment = Enum.TextXAlignment.Left
Editor.TextYAlignment = Enum.TextYAlignment.Top

Numbers.Name = "Numbers"
Numbers.Parent = Main
Numbers.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
Numbers.BorderSizePixel = 0
Numbers.Position = UDim2.new(0.00374531839, 0, 0.149295777, 0)
Numbers.Size = UDim2.new(0, 41, 0, 259)
Numbers.Font = Enum.Font.Code
Numbers.Text = ""
Numbers.TextColor3 = Color3.fromRGB(255, 255, 255)
Numbers.TextSize = 14.000
Numbers.TextYAlignment = Enum.TextYAlignment.Top

Tab1.Name = "Tab1"
Tab1.Parent = Main
Tab1.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
Tab1.BorderSizePixel = 0
Tab1.Position = UDim2.new(0.00374531839, 0, 0.0985915512, 0)
Tab1.Size = UDim2.new(0, 65, 0, 18)
Tab1.Font = Enum.Font.SourceSans
Tab1.Text = "Script 1  x"
Tab1.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab1.TextSize = 16.000

ScriptBox.Name = "ScriptBox"
ScriptBox.Parent = Main
ScriptBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ScriptBox.BorderSizePixel = 0
ScriptBox.Position = UDim2.new(0.851000011, -3, 0.0850000009, 3)
ScriptBox.Size = UDim2.new(0, 119, 0, 279)

Scripts.Name = "Scripts"
Scripts.Parent = ScriptBox
Scripts.Active = true
Scripts.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Scripts.BackgroundTransparency = 1.000
Scripts.BorderSizePixel = 0
Scripts.Size = UDim2.new(0, 119, 0, 279)
Scripts.ScrollBarThickness = 8
Scripts.ScrollingEnabled = false

Dex.Name = "Dex"
Dex.Parent = Scripts
Dex.BackgroundColor3 = Color3.fromRGB(55, 84, 98)
Dex.BackgroundTransparency = 1.000
Dex.BorderSizePixel = 0
Dex.Position = UDim2.new(0, 4, 0, 40)
Dex.Size = UDim2.new(0, 118, 0, 20)
Dex.ZIndex = 2
Dex.Font = Enum.Font.SourceSansSemibold
Dex.Text = "  Synapse Dex.lua"
Dex.TextColor3 = Color3.fromRGB(255, 255, 255)
Dex.TextSize = 14.000
Dex.TextWrapped = true
Dex.TextXAlignment = Enum.TextXAlignment.Left

IY.Name = "IY"
IY.Parent = Scripts
IY.BackgroundColor3 = Color3.fromRGB(55, 84, 98)
IY.BackgroundTransparency = 1.000
IY.BorderSizePixel = 0
IY.Position = UDim2.new(0.0252100863, 1, 0.0262473151, 6)
IY.Size = UDim2.new(0, 118, 0, 20)
IY.ZIndex = 2
IY.Font = Enum.Font.SourceSansSemibold
IY.Text = "  Infinite Yield.lua"
IY.TextColor3 = Color3.fromRGB(255, 255, 255)
IY.TextSize = 14.000
IY.TextWrapped = true
IY.TextXAlignment = Enum.TextXAlignment.Left

CMDX.Name = "CMDX"
CMDX.Parent = Scripts
CMDX.BackgroundColor3 = Color3.fromRGB(55, 84, 98)
CMDX.BackgroundTransparency = 1.000
CMDX.BorderSizePixel = 0
CMDX.Position = UDim2.new(0.0252100863, 1, 0.00237634405, 0)
CMDX.Size = UDim2.new(0, 118, 0, 20)
CMDX.ZIndex = 2
CMDX.Font = Enum.Font.SourceSansSemibold
CMDX.Text = "  CMD X.lua"
CMDX.TextColor3 = Color3.fromRGB(255, 255, 255)
CMDX.TextSize = 14.000
CMDX.TextWrapped = true
CMDX.TextXAlignment = Enum.TextXAlignment.Left

Attach.Name = "Attach"
Attach.Parent = Topbar
Attach.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Attach.BorderSizePixel = 0
Attach.Position = UDim2.new(0, 614, 10.7670002, -6)
Attach.Size = UDim2.new(0, 89, 0, 31)
Attach.Font = Enum.Font.SourceSans
Attach.Text = "Attach"
Attach.TextColor3 = Color3.fromRGB(255, 255, 255)
Attach.TextSize = 18.000

Options.Name = "Options"
Options.Parent = Topbar
Options.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Options.BorderSizePixel = 0
Options.Position = UDim2.new(0, 482, 10.7670002, -6)
Options.Size = UDim2.new(0, 89, 0, 31)
Options.Font = Enum.Font.SourceSans
Options.Text = "Options"
Options.TextColor3 = Color3.fromRGB(255, 255, 255)
Options.TextSize = 18.000

ExecFile.Name = "ExecFile"
ExecFile.Parent = Topbar
ExecFile.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ExecFile.BorderSizePixel = 0
ExecFile.Position = UDim2.new(0, 292, 10.7670002, -6)
ExecFile.Size = UDim2.new(0, 89, 0, 31)
ExecFile.Font = Enum.Font.SourceSans
ExecFile.Text = "Execute File"
ExecFile.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecFile.TextSize = 18.000

Clear.Name = "Clear"
Clear.Parent = Topbar
Clear.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Clear.BorderSizePixel = 0
Clear.Position = UDim2.new(0, 101, 10.7670002, -6)
Clear.Size = UDim2.new(0, 89, 0, 31)
Clear.Font = Enum.Font.SourceSans
Clear.Text = "Clear"
Clear.TextColor3 = Color3.fromRGB(255, 255, 255)
Clear.TextSize = 18.000

Execute.Name = "Execute"
Execute.Parent = Topbar
Execute.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Execute.BorderSizePixel = 0
Execute.Position = UDim2.new(0, 5, 10.7670002, -6)
Execute.Size = UDim2.new(0, 89, 0, 31)
Execute.Font = Enum.Font.SourceSans
Execute.Text = "Execute"
Execute.TextColor3 = Color3.fromRGB(255, 255, 255)
Execute.TextSize = 18.000

OpenFile.Name = "OpenFile"
OpenFile.Parent = Topbar
OpenFile.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
OpenFile.BorderSizePixel = 0
OpenFile.Position = UDim2.new(0, 197, 10.7670002, -6)
OpenFile.Size = UDim2.new(0, 89, 0, 31)
OpenFile.Font = Enum.Font.SourceSans
OpenFile.Text = "Open File"
OpenFile.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenFile.TextSize = 18.000

SaveFile.Name = "SaveFile"
SaveFile.Parent = Topbar
SaveFile.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SaveFile.BorderSizePixel = 0
SaveFile.Position = UDim2.new(0, 387, 10.7670002, -6)
SaveFile.Size = UDim2.new(0, 89, 0, 31)
SaveFile.Font = Enum.Font.SourceSans
SaveFile.Text = "Save File"
SaveFile.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveFile.TextSize = 18.000

ScriptHub.Name = "ScriptHub"
ScriptHub.Parent = Topbar
ScriptHub.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ScriptHub.BorderSizePixel = 0
ScriptHub.Position = UDim2.new(0, 709, 10.7670002, -6)
ScriptHub.Size = UDim2.new(0, 89, 0, 31)
ScriptHub.Font = Enum.Font.SourceSans
ScriptHub.Text = "Script Hub"
ScriptHub.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptHub.TextSize = 18.000

SynapseLogo.Name = "SynapseLogo"
SynapseLogo.Parent = Topbar
SynapseLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SynapseLogo.BackgroundTransparency = 1.000
SynapseLogo.BorderSizePixel = 0
SynapseLogo.Position = UDim2.new(0.00400000019, 4, 0.166999996, -2)
SynapseLogo.Size = UDim2.new(0, 25, 0, 25)
SynapseLogo.ZIndex = 2
SynapseLogo.Image = "http://www.roblox.com/asset/?id=5732867260"
SynapseLogo.ScaleType = Enum.ScaleType.Fit

Title.Name = "Title"
Title.Parent = Topbar
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.374531835, 0, 0, 0)
Title.Size = UDim2.new(0, 200, 0, 30)
Title.ZIndex = 2
Title.Font = Enum.Font.SourceSans
Title.Text = "Synapse X - v2.5.2b"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 15.000

Minimize.Name = "Minimize"
Minimize.Parent = Topbar
Minimize.BackgroundColor3 = Color3.fromRGB(52, 69, 85)
Minimize.BackgroundTransparency = 1.000
Minimize.BorderSizePixel = 0
Minimize.Position = UDim2.new(0.916354597, 0, 1.1920929e-07, 0)
Minimize.Size = UDim2.new(0, 22, 0, 22)
Minimize.ZIndex = 2
Minimize.Font = Enum.Font.SourceSans
Minimize.Text = "_"
Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
Minimize.TextSize = 16.000

Maximize.Name = "Maximize"
Maximize.Parent = Topbar
Maximize.BackgroundColor3 = Color3.fromRGB(52, 69, 85)
Maximize.BackgroundTransparency = 1.000
Maximize.BorderSizePixel = 0
Maximize.Position = UDim2.new(0.943820298, 0, 3.35276127e-08, 0)
Maximize.Size = UDim2.new(0, 22, 0, 22)
Maximize.ZIndex = 2
Maximize.Font = Enum.Font.SourceSans
Maximize.Text = "M"
Maximize.TextColor3 = Color3.fromRGB(255, 255, 255)
Maximize.TextSize = 16.000

Close.Name = "Close"
Close.Parent = Topbar
Close.BackgroundColor3 = Color3.fromRGB(52, 69, 85)
Close.BackgroundTransparency = 1.000
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.972534359, 0, 1.1920929e-07, 0)
Close.Size = UDim2.new(0, 22, 0, 22)
Close.ZIndex = 2
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 16.000

TopbarCredits.Name = "TopbarCredits"
TopbarCredits.Parent = SynapseXI
TopbarCredits.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TopbarCredits.BorderSizePixel = 0
TopbarCredits.Position = UDim2.new(0.234672308, 0, 0.0252225474, 0)
TopbarCredits.Size = UDim2.new(0, 393, 0, 30)
TopbarCredits.Visible = false
TopbarCredits.ZIndex = 5

SynapseCredits.Name = "SynapseCredits"
SynapseCredits.Parent = TopbarCredits
SynapseCredits.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SynapseCredits.BorderColor3 = Color3.fromRGB(0, 0, 0)
SynapseCredits.Position = UDim2.new(-0.00138318539, 0, -0.0166271031, 0)
SynapseCredits.Size = UDim2.new(0, 394, 0, 185)
SynapseCredits.ZIndex = 4

InfoIcon.Name = "InfoIcon"
InfoIcon.Parent = SynapseCredits
InfoIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InfoIcon.BorderSizePixel = 0
InfoIcon.Position = UDim2.new(0.00499999989, 21, 0.162, 22)
InfoIcon.Size = UDim2.new(0, 32, 0, 32)
InfoIcon.ZIndex = 5
InfoIcon.Image = "http://www.roblox.com/asset/?id=6332882793"

Credits1.Name = "Credits1"
Credits1.Parent = SynapseCredits
Credits1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credits1.BorderSizePixel = 0
Credits1.Position = UDim2.new(0.187817261, 0, 0.280918926, 0)
Credits1.Size = UDim2.new(0, 312, 0, 31)
Credits1.ZIndex = 5
Credits1.Font = Enum.Font.SourceSans
Credits1.Text = "Synapse X was developed by 3dsboy08, brack4712, Louka, DefCon42, and Eternal."
Credits1.TextColor3 = Color3.fromRGB(0, 0, 0)
Credits1.TextSize = 14.000
Credits1.TextWrapped = true
Credits1.TextXAlignment = Enum.TextXAlignment.Left

Credits2.Name = "Credits2"
Credits2.Parent = SynapseCredits
Credits2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credits2.BorderSizePixel = 0
Credits2.Position = UDim2.new(0.187817261, 0, 0.502540529, 0)
Credits2.Size = UDim2.new(0, 290, 0, 31)
Credits2.ZIndex = 5
Credits2.Font = Enum.Font.SourceSans
Credits2.Text = "Additional credits:\\n    - Rain: Emotional support and testing"
Credits2.TextColor3 = Color3.fromRGB(0, 0, 0)
Credits2.TextSize = 14.000
Credits2.TextWrapped = true
Credits2.TextXAlignment = Enum.TextXAlignment.Left

Title_2.Name = "Title"
Title_2.Parent = TopbarCredits
Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_2.BorderSizePixel = 0
Title_2.Size = UDim2.new(0, 67, 0, 29)
Title_2.ZIndex = 6
Title_2.Font = Enum.Font.SourceSans
Title_2.Text = "Synapse X"
Title_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Title_2.TextSize = 15.000

Close_2.Name = "Close"
Close_2.Parent = TopbarCredits
Close_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close_2.BackgroundTransparency = 1.000
Close_2.BorderSizePixel = 0
Close_2.Position = UDim2.new(0.921999991, 2, 0, -2)
Close_2.Rotation = 45.000
Close_2.Size = UDim2.new(0, 30, 0, 30)
Close_2.ZIndex = 7
Close_2.Font = Enum.Font.SourceSansLight
Close_2.Text = "+"
Close_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Close_2.TextSize = 34.000

CloseBG.Name = "CloseBG"
CloseBG.Parent = TopbarCredits
CloseBG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseBG.BorderSizePixel = 0
CloseBG.Position = UDim2.new(0.922474682, 0, 0, 0)
CloseBG.Size = UDim2.new(0, 30, 0, 30)
CloseBG.ZIndex = 6
CloseBG.Font = Enum.Font.SourceSansLight
CloseBG.Text = ""
CloseBG.TextColor3 = Color3.fromRGB(0, 0, 0)
CloseBG.TextSize = 34.000

Bottom.Name = "Bottom"
Bottom.Parent = TopbarCredits
Bottom.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
Bottom.BorderSizePixel = 0
Bottom.Position = UDim2.new(0, 0, 4.73333311, 0)
Bottom.Size = UDim2.new(0, 392, 0, 42)
Bottom.ZIndex = 5

Ok.Name = "Ok"
Ok.Parent = TopbarCredits
Ok.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Ok.BorderSizePixel = 0
Ok.Position = UDim2.new(0, 302, 4.7329998, 9)
Ok.Size = UDim2.new(0, 75, 0, 23)
Ok.ZIndex = 6
Ok.Image = "http://www.roblox.com/asset/?id=6333067933"

Menu.Name = "Menu"
Menu.Parent = SynapseXI
Menu.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
Menu.BorderSizePixel = 0
Menu.Position = UDim2.new(0.749471426, 0, 0.216617197, 0)
Menu.Size = UDim2.new(0, 160, 0, 44)
Menu.Visible = false
Menu.ZIndex = 3

Execute_2.Name = "Execute"
Execute_2.Parent = Menu
Execute_2.BackgroundColor3 = Color3.fromRGB(55, 84, 98)
Execute_2.BackgroundTransparency = 1.000
Execute_2.BorderSizePixel = 0
Execute_2.Size = UDim2.new(0, 160, 0, 22)
Execute_2.ZIndex = 4
Execute_2.Font = Enum.Font.SourceSans
Execute_2.Text = "                    Execute"
Execute_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Execute_2.TextSize = 14.000
Execute_2.TextXAlignment = Enum.TextXAlignment.Left

Load.Name = "Load"
Load.Parent = Menu
Load.BackgroundColor3 = Color3.fromRGB(55, 84, 98)
Load.BackgroundTransparency = 1.000
Load.BorderSizePixel = 0
Load.Position = UDim2.new(0, 0, 0.522727251, 0)
Load.Size = UDim2.new(0, 160, 0, 22)
Load.ZIndex = 4
Load.Font = Enum.Font.SourceSans
Load.Text = "                    Load to Editor"
Load.TextColor3 = Color3.fromRGB(255, 255, 255)
Load.TextSize = 14.000
Load.TextXAlignment = Enum.TextXAlignment.Left

BoxTopbar.Name = "BoxTopbar"
BoxTopbar.Parent = SynapseXI
BoxTopbar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
BoxTopbar.BorderSizePixel = 0
BoxTopbar.Position = UDim2.new(0.403805494, 0, 0.477744818, 0)
BoxTopbar.Size = UDim2.new(0, 180, 0, 30)
BoxTopbar.Visible = false
BoxTopbar.ZIndex = 5

Main_2.Name = "Main"
Main_2.Parent = BoxTopbar
Main_2.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
Main_2.BorderSizePixel = 0
Main_2.Position = UDim2.new(-0.0006929636, 0, -0.0252225399, 0)
Main_2.Size = UDim2.new(0, 180, 0, 140)
Main_2.ZIndex = 4

Title_3.Name = "Title"
Title_3.Parent = BoxTopbar
Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_3.BackgroundTransparency = 1.000
Title_3.BorderSizePixel = 0
Title_3.Position = UDim2.new(-0.00555555569, 0, 0, 0)
Title_3.Size = UDim2.new(0, 180, 0, 30)
Title_3.ZIndex = 6
Title_3.Font = Enum.Font.SourceSans
Title_3.Text = "Synapse X"
Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_3.TextSize = 15.000

Close_3.Name = "Close"
Close_3.Parent = BoxTopbar
Close_3.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Close_3.BorderSizePixel = 0
Close_3.Position = UDim2.new(0.055555556, 0, 3.36666656, 0)
Close_3.Size = UDim2.new(0, 75, 0, 30)
Close_3.ZIndex = 5
Close_3.Font = Enum.Font.SourceSans
Close_3.Text = "Close"
Close_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Close_3.TextSize = 15.000

Action.Name = "Action"
Action.Parent = BoxTopbar
Action.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Action.BackgroundTransparency = 1.000
Action.BorderSizePixel = 0
Action.Position = UDim2.new(-0.00555555569, 0, 1.20000005, 0)
Action.Size = UDim2.new(0, 180, 0, 20)
Action.ZIndex = 5
Action.Font = Enum.Font.SourceSans
Action.Text = "Save File"
Action.TextColor3 = Color3.fromRGB(255, 255, 255)
Action.TextSize = 14.000

ScriptName.Name = "ScriptName"
ScriptName.Parent = BoxTopbar
ScriptName.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ScriptName.BorderSizePixel = 0
ScriptName.Position = UDim2.new(0.055555556, 0, 2, 0)
ScriptName.Size = UDim2.new(0, 110, 0, 25)
ScriptName.ZIndex = 5
ScriptName.ClearTextOnFocus = false
ScriptName.Font = Enum.Font.SourceSans
ScriptName.PlaceholderText = "ScriptName"
ScriptName.Text = ""
ScriptName.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptName.TextSize = 14.000

Extension.Name = "Extension"
Extension.Parent = BoxTopbar
Extension.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Extension.BorderSizePixel = 0
Extension.Position = UDim2.new(0.722222209, 0, 2, 0)
Extension.Size = UDim2.new(0, 40, 0, 25)
Extension.ZIndex = 5
Extension.Font = Enum.Font.SourceSans
Extension.Text = ".lua"
Extension.TextColor3 = Color3.fromRGB(255, 255, 255)
Extension.TextSize = 14.000

Save.Name = "Save"
Save.Parent = BoxTopbar
Save.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Save.BorderSizePixel = 0
Save.Position = UDim2.new(0.527777791, 0, 3.36666656, 0)
Save.Size = UDim2.new(0, 75, 0, 30)
Save.ZIndex = 5
Save.Font = Enum.Font.SourceSans
Save.Text = "Save"
Save.TextColor3 = Color3.fromRGB(255, 255, 255)
Save.TextSize = 15.000

Error.Name = "Error"
Error.Parent = BoxTopbar
Error.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Error.BackgroundTransparency = 1.000
Error.BorderSizePixel = 0
Error.Position = UDim2.new(-0.00555555569, 0, 2.83333325, 0)
Error.Size = UDim2.new(0, 180, 0, 16)
Error.ZIndex = 5
Error.Font = Enum.Font.SourceSans
Error.Text = ""
Error.TextColor3 = Color3.fromRGB(255, 0, 0)
Error.TextSize = 14.000

Success.Name = "Success"
Success.Parent = BoxTopbar
Success.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Success.BackgroundTransparency = 1.000
Success.BorderSizePixel = 0
Success.Position = UDim2.new(-0.00555555569, 0, 2.83333325, 0)
Success.Size = UDim2.new(0, 180, 0, 16)
Success.ZIndex = 5
Success.Font = Enum.Font.SourceSans
Success.Text = ""
Success.TextColor3 = Color3.fromRGB(85, 255, 0)
Success.TextSize = 14.000

-- Border Modes:
-- needs this because gui to lua doesnt support bordermodes :(
CMDX.BorderMode = "Inset"
Dex.BorderMode = "Inset"
IY.BorderMode = "Inset"
Execute_2.BorderMode = "Inset"
Load.BorderMode = "Inset"
Close.BorderMode = "Inset"
Maximize.BorderMode = "Inset"
Minimize.BorderMode = "Inset"
Close_3.BorderMode = "Inset"
Extension.BorderMode = "Inset"
Save.BorderMode = "Inset"

-- Scripts:

local function JIMK_fake_script() -- Editor.EditorScript 
	local script = Instance.new('LocalScript', Editor)


end
coroutine.wrap(JIMK_fake_script)()
local function SHML_fake_script() -- Scripts.ScriptBoxScripts 
	local script = Instance.new('LocalScript', Scripts)

	local mouse = game.Players.LocalPlayer:GetMouse()
	script.Parent.Dex.MouseButton1Down:Connect(function()
		script.Parent.Dex.BackgroundTransparency = 0
		script.Parent.IY.BackgroundTransparency = 1
		script.Parent.CMDX.BackgroundTransparency = 1
	end)
	script.Parent.IY.MouseButton1Down:Connect(function()
		script.Parent.IY.BackgroundTransparency = 0
		script.Parent.Dex.BackgroundTransparency = 1
		script.Parent.CMDX.BackgroundTransparency = 1
	end)
	script.Parent.CMDX.MouseButton1Down:Connect(function()
		script.Parent.CMDX.BackgroundTransparency = 0
		script.Parent.Dex.BackgroundTransparency = 1
		script.Parent.IY.BackgroundTransparency = 1
	end)
	script.Parent.Dex.MouseButton2Click:Connect(function()
		script.Parent.Parent.Parent.Parent.Parent.Menu.Position = UDim2.new(0, mouse.X, 0, mouse.Y)
		script.Parent.Parent.Parent.Parent.Parent.Menu.Visible = true
		getgenv().Script = [[local Dex = rawget(game:GetObjects("rbxassetid://3567096419"), 0X1)
	if type(syn) == "table" and type(syn.protect_gui) == "function" then
	    xpcall(syn.protect_gui, warn, Dex)
	end
	Dex.Name, Dex.Parent = "SynapseDex", game:GetService("CoreGui")
	function Load(x)
	    if x:IsA("Script") then
	        xpcall(coroutine.wrap(function()
	            local Fenv, FenvMt, RealFenv, Func = {}, {}, {
	                script = x
	            }, loadstring(x.Source, "=" .. x:GetFullName())
	            FenvMt.__index = function(a, b)
	                if RealFenv[b] == nil then
	                    return getfenv()[b]
	                else
	                    return RealFenv[b]
	                end
	            end
	            FenvMt.__newindex = function(a, b, c)
	                if RealFenv[b] == nil then
	                    getfenv()[b] = c
	                else
	                    RealFenv[b] = c
	                end
	            end
	            setmetatable(Fenv, FenvMt)
	            setfenv(Func, Fenv)
	            return Func()
	        end), warn)
	    end
	    for _, v in pairs(x:GetChildren()) do
	        xpcall(Load, warn, v)
	    end
	end
	xpcall(Load, warn, Dex)]]
	end)

	script.Parent.IY.MouseButton2Click:Connect(function()
		script.Parent.Parent.Parent.Parent.Parent.Menu.Position = UDim2.new(0, mouse.X, 0, mouse.Y)
		script.Parent.Parent.Parent.Parent.Parent.Menu.Visible = true
		getgenv().Script = [[loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()]]
	end)

	script.Parent.CMDX.MouseButton2Click:Connect(function()
		script.Parent.Parent.Parent.Parent.Parent.Menu.Position = UDim2.new(0, mouse.X, 0, mouse.Y)
		script.Parent.Parent.Parent.Parent.Parent.Menu.Visible = true
		getgenv().Script = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()]]
	end)
end
coroutine.wrap(SHML_fake_script)()
local function GPRH_fake_script() -- Attach.AttachScript 
	local script = Instance.new('LocalScript', Attach)

	script.Parent.MouseButton1Click:Connect(function()
		if syn then
			script.Parent.Parent.Title.Text = "Synapse X - " .. getgenv().Version .. " (already injected!)"
			wait(3.2)
			script.Parent.Parent.Title.Text = "Synapse X - " .. getgenv().Version
		else
			script.Parent.Parent.Title.Text = "Synapse X " .. "(already injected!)"
			wait(3.2)
			script.Parent.Parent.Title.Text = "Synapse X"
		end
	end)

end
coroutine.wrap(GPRH_fake_script)()
local function XRNEWDR_fake_script() -- Clear.ClearScript 
	local script = Instance.new('LocalScript', Clear)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Main.Editor.Text = ""
	end)
end
coroutine.wrap(XRNEWDR_fake_script)()
local function MHOSHJ_fake_script() -- Execute.ExecuteScript 
	local script = Instance.new('LocalScript', Execute)

	script.Parent.MouseButton1Click:Connect(function()
		loadstring(script.Parent.Parent.Main.Editor.Text)()
	end)
end
coroutine.wrap(MHOSHJ_fake_script)()
local function XDQMSBM_fake_script() -- SynapseLogo.LogoScript 
	local script = Instance.new('LocalScript', SynapseLogo)

	local sound = Instance.new("Sound")
	sound.Parent = script.Parent
	sound.Name = "Asterisk"
	sound.SoundId = "http://www.roblox.com/asset/?id=6333015935"
	sound.Volume = 3
	sound.Pitch = 1
	sound.Looped = false

	script.Parent.MouseButton1Down:Connect(function()
		if script.Parent.Parent.Parent.TopbarCredits.Visible == false then
			script.Parent.Asterisk.Playing = true
			script.Parent.Parent.Parent.TopbarCredits.Visible = true
		else
			do end
		end
	end)
end
coroutine.wrap(XDQMSBM_fake_script)()
local function HADMIPF_fake_script() -- Minimize.MinScript 
	local script = Instance.new('LocalScript', Minimize)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Visible = false
	end)
	script.Parent.MouseEnter:Connect(function()
		script.Parent.BackgroundTransparency = 0
	end)

	script.Parent.MouseLeave:Connect(function()
		script.Parent.BackgroundTransparency = 1
	end)
end
coroutine.wrap(HADMIPF_fake_script)()
local function DXGN_fake_script() -- Maximize.MaxScript 
	local script = Instance.new('LocalScript', Maximize)

	script.Parent.MouseButton1Click:Connect(function()
		local hint = Instance.new("Hint")
		hint.Parent = game.CoreGui
		hint.Text = "no one uses maximize"
		wait(3)
		hint:Destroy()
	end)
	script.Parent.MouseEnter:Connect(function()
		script.Parent.BackgroundTransparency = 0
	end)

	script.Parent.MouseLeave:Connect(function()
		script.Parent.BackgroundTransparency = 1
	end)
end
coroutine.wrap(DXGN_fake_script)()
local function GGEFJW_fake_script() -- Close.CloseScript 
	local script = Instance.new('LocalScript', Close)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Parent:Destroy()
	end)
	script.Parent.MouseEnter:Connect(function()
		script.Parent.BackgroundTransparency = 0
	end)

	script.Parent.MouseLeave:Connect(function()
		script.Parent.BackgroundTransparency = 1
	end)
end
coroutine.wrap(GGEFJW_fake_script)()
local function GCKWLBG_fake_script() -- Topbar.MainScript 
	local script = Instance.new('LocalScript', Topbar)

	script.Parent.Active = true
	script.Parent.Draggable = true

	getgenv().Action = nil
	script.Parent.OpenFile.MouseButton1Click:Connect(function()
		script.Parent.Parent.BoxTopbar.Visible = true
		script.Parent.Parent.BoxTopbar.Save.Text = "Open"
		script.Parent.Parent.BoxTopbar.Action.Text = "Open File"
		getgenv().Action = "Open"
	end)
	script.Parent.ExecFile.MouseButton1Click:Connect(function()
		script.Parent.Parent.BoxTopbar.Visible = true
		script.Parent.Parent.BoxTopbar.Save.Text = "Execute"
		script.Parent.Parent.BoxTopbar.Action.Text = "Execute File"
		getgenv().Action = "Execute"
	end)
	script.Parent.SaveFile.MouseButton1Click:Connect(function()
		script.Parent.Parent.BoxTopbar.Visible = true
		script.Parent.Parent.BoxTopbar.Save.Text = "Save"
		script.Parent.Parent.BoxTopbar.Action.Text = "Save File"
		getgenv().Action = "Save"
	end)
end
coroutine.wrap(GCKWLBG_fake_script)()
local function JBXT_fake_script() -- Close_2.LocalScript 
	local script = Instance.new('LocalScript', Close_2)

	script.Parent.MouseButton1Down:Connect(function()
		script.Parent.Parent.Visible = false
	end)
end
coroutine.wrap(JBXT_fake_script)()
local function WGNZJG_fake_script() -- CloseBG.LocalScript 
	local script = Instance.new('LocalScript', CloseBG)

	script.Parent.MouseEnter:Connect(function()
		script.Parent.BackgroundColor3 = Color3.fromRGB(232, 17, 35)
	end)
	script.Parent.MouseLeave:Connect(function()
		script.Parent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	end)
end
coroutine.wrap(WGNZJG_fake_script)()
local function YCASCQ_fake_script() -- TopbarCredits.LocalScript 
	local script = Instance.new('LocalScript', TopbarCredits)

	script.Parent.Visible = false
	script.Parent.Active = true
	script.Parent.Draggable = true
end
coroutine.wrap(YCASCQ_fake_script)()
local function OSTAPJS_fake_script() -- Ok.LocalScript 
	local script = Instance.new('LocalScript', Ok)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Visible = false
	end)
	script.Parent.MouseButton1Down:Connect(function()
		script.Parent.Image = "http://www.roblox.com/asset/?id=6333067779"
	end)
	script.Parent.MouseButton1Up:Connect(function()
		script.Parent.Image = "http://www.roblox.com/asset/?id=6333067933"
	end)
end
coroutine.wrap(OSTAPJS_fake_script)()
local function RRDDAO_fake_script() -- Menu.MenuScript 
	local script = Instance.new('LocalScript', Menu)

	getgenv().Script = ""
	script.Parent.Visible = false
	local mouse = game.Players.LocalPlayer:GetMouse()

	script.Parent.Execute.MouseButton1Click:Connect(function()
		loadstring(getgenv().Script)()
		script.Parent.Visible = false
	end)
	script.Parent.Load.MouseButton1Click:Connect(function()
		script.Parent.Parent.Topbar.Main.Editor.Text = getgenv().Script
		script.Parent.Visible = false
	end)
	mouse.Button1Down:Connect(function()
		script.Parent.Visible = false
	end)



end
coroutine.wrap(RRDDAO_fake_script)()
local function CJJVS_fake_script() -- SynapseXI.MainController 
	local script = Instance.new('LocalScript', SynapseXI)

	local mouse = game.Players.LocalPlayer:GetMouse()
	mouse.Button1Down:Connect(function()
		script.Parent.Menu.Visible = false
	end)

	if syn then
		local a = syn.request({
			Url = "https://pastebin.com/raw/f5aimzFS", -- anyone can use this link, ill be updating it when synapse updates
			Method = "GET"
		})

		getgenv().Version = a.Body

		script.Parent.Topbar.Title.Text = "Synapse X - " .. getgenv().Version
	else
		local hint = Instance.new("Hint")
		hint.Parent = game.CoreGui
		hint.Text = "Synapse version is not available for non-synapse users."
		-- request doesnt work so yea
		script.Parent.Topbar.Title.Text = "Synapse X"
		wait(3)
		hint:Destroy()
	end

end
coroutine.wrap(CJJVS_fake_script)()
local function WBYAZMV_fake_script() -- Close_3.BoxCloseScript 
	local script = Instance.new('LocalScript', Close_3)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Visible = false
	end)

	script.Parent.MouseEnter:Connect(function()
		script.Parent.BackgroundColor3 = Color3.fromRGB(52, 69, 85)
	end)

	script.Parent.MouseLeave:Connect(function()
		script.Parent.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	end)
end
coroutine.wrap(WBYAZMV_fake_script)()
local function ECUT_fake_script() -- Extension.ExtensionScript 
	local script = Instance.new('LocalScript', Extension)

	local ex = 1
	getgenv().extension = ".lua"
	--[[
		1 = .lua
		2 = .txt
		3 = .json
	]]

	script.Parent.MouseButton1Click:Connect(function()
		if ex == 1 then
			ex = ex + 1
			script.Parent.Text = ".txt"
			getgenv().extension = ".txt"
		elseif ex == 2 then
			ex = ex + 1
			script.Parent.Text = ".json"
			getgenv().extension = ".json"
		elseif ex == 3 then
			ex = 1
			script.Parent.Text = ".lua"
			getgenv().extension = ".lua"
		end
	end)


end
coroutine.wrap(ECUT_fake_script)()
local function KPDL_fake_script() -- Save.SaveScript 
	local script = Instance.new('LocalScript', Save)

	script.Parent.Parent.Visible = false
	script.Parent.Parent.Active = true
	script.Parent.Parent.Draggable = true

	script.Parent.MouseButton1Click:Connect(function()
		if getgenv().Action == "Open" then
			if isfile(script.Parent.Parent.ScriptName.Text .. getgenv().extension) then
				local ss = readfile(script.Parent.Parent.ScriptName.Text .. getgenv().extension)
				script.Parent.Parent.Parent.Topbar.Main.Editor.Text = tostring(ss)
				script.Parent.Parent.Success.Text = "Opened " .. script.Parent.Parent.ScriptName.Text .. getgenv().extension .. "!"
				wait(1.5)
				script.Parent.Parent.Success.Text = ""
			elseif script.Parent.Parent.ScriptName.Text == "" then
				script.Parent.Parent.Error.Text = "Error: No file name entered."
				wait(1.5)
				script.Parent.Parent.Error.Text = ""
			else
				script.Parent.Parent.Error.Text = "Error: File does not exist."
				wait(1.5)
				script.Parent.Parent.Error.Text = ""
			end
		elseif getgenv().Action == "Execute" then
			if isfile(script.Parent.Parent.ScriptName.Text .. getgenv().extension) then
				local ss = readfile(script.Parent.Parent.ScriptName.Text .. getgenv().extension)
				loadstring(ss)()
				script.Parent.Parent.Success.Text = "Executed " .. script.Parent.Parent.ScriptName.Text .. getgenv().extension .. "!"
				wait(1.5)
				script.Parent.Parent.Success.Text = ""
			elseif script.Parent.Parent.ScriptName.Text == "" then
				script.Parent.Parent.Error.Text = "Error: No file name entered."
				wait(1.5)
				script.Parent.Parent.Error.Text = ""
			else
				script.Parent.Parent.Error.Text = "Error: File does not exist."
				wait(1.5)
				script.Parent.Parent.Error.Text = ""
			end
		elseif getgenv().Action == "Save" then
			if script.Parent.Parent.ScriptName == "" then
				script.Parent.Parent.Error.Text = "Error: No file name entered."
				wait(1.5)
				script.Parent.Parent.Error.Text = ""
			else
				writefile(script.Parent.Parent.ScriptName.Text .. getgenv().extension, "-- Saved with Synapse XI\n\n" .. script.Parent.Parent.Parent.Topbar.Main.Editor.Text)
				script.Parent.Parent.Success.Text = "Saved as " .. script.Parent.Parent.ScriptName.Text .. getgenv().extension .. "!"
				wait(1.5)
				script.Parent.Parent.Success.Text = ""
			end
		end
	end)

	script.Parent.MouseEnter:Connect(function()
		script.Parent.BackgroundColor3 = Color3.fromRGB(52, 69, 85)
	end)

	script.Parent.MouseLeave:Connect(function()
		script.Parent.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	end)
end
coroutine.wrap(KPDL_fake_script)()
