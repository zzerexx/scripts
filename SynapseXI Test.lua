--[[ Synapse XI (Synapse X Internal)
	 v1.1.0 Test Release
	 features coming soon in v1.1.0
	 Made by zzerexx#3970
]]
local SynapseXI = Instance.new("ScreenGui")
local Topbar = Instance.new("Frame")
local Main = Instance.new("Frame")
local ScriptBox = Instance.new("Frame")
local Scripts = Instance.new("ScrollingFrame")
local Dex = Instance.new("TextButton")
local IY = Instance.new("TextButton")
local CMDX = Instance.new("TextButton")
local EditorScroll = Instance.new("ScrollingFrame")
local Editor = Instance.new("TextBox")
local NumberScroll = Instance.new("ScrollingFrame")
local Numbers = Instance.new("TextBox")
local NumberBG = Instance.new("Frame")
local Tabs = Instance.new("Folder")
local Tab1 = Instance.new("TextLabel")
local NewTab = Instance.new("TextButton")
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
local CustomExtension = Instance.new("TextBox")
local CustomBtn = Instance.new("TextButton")
local OptionsTopbar = Instance.new("Frame")
local SynapseLogo_2 = Instance.new("ImageButton")
local Title_4 = Instance.new("TextLabel")
local Main_3 = Instance.new("Frame")
local UnlockFps = Instance.new("ImageButton")
local UnlockFpsText = Instance.new("TextLabel")
local AutoLaunch = Instance.new("ImageButton")
local AutoLaunchText = Instance.new("TextLabel")
local AutoAttach = Instance.new("ImageButton")
local AutoAttachText = Instance.new("TextLabel")
local FileClosing = Instance.new("ImageButton")
local FileClosingText = Instance.new("TextLabel")
local ClearEditor = Instance.new("ImageButton")
local ClearEditorText = Instance.new("TextLabel")
local InternalUI = Instance.new("ImageButton")
local InternalUIText = Instance.new("TextLabel")
local TopMost = Instance.new("ImageButton")
local TopMostText = Instance.new("TextLabel")
local AutoJoin = Instance.new("ImageButton")
local AutoJoinText = Instance.new("TextLabel")
local EditorTheme = Instance.new("TextLabel")
local ThemeName = Instance.new("TextLabel")
local Close_4 = Instance.new("TextButton")
local DropdownBtn = Instance.new("ImageLabel")
local OpenSynapse = Instance.new("Frame")
local SynapseOpen = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local Loader = Instance.new("Frame")
local Top = Instance.new("Frame")
local Title_5 = Instance.new("TextLabel")
local SynapseLogo_3 = Instance.new("ImageLabel")
local BarBackground = Instance.new("Frame")
local Bar = Instance.new("Frame")
local Text = Instance.new("TextLabel")
local SettingsTopbar = Instance.new("Frame")
local Main_4 = Instance.new("Frame")
local Placeholder3 = Instance.new("ImageButton")
local Placeholder3Text = Instance.new("TextLabel")
local Placeholder8 = Instance.new("ImageButton")
local Placeholder8Text = Instance.new("TextLabel")
local AutoSave = Instance.new("ImageButton")
local AutoSaveText = Instance.new("TextLabel")
local Placeholder5 = Instance.new("ImageButton")
local Placeholder5Text = Instance.new("TextLabel")
local Placeholder4 = Instance.new("ImageButton")
local Placeholder4Text = Instance.new("TextLabel")
local Placeholder6 = Instance.new("ImageButton")
local Placeholder6Text = Instance.new("TextLabel")
local Placeholder7 = Instance.new("ImageButton")
local Placeholder7Text = Instance.new("TextLabel")
local LoadAnimation = Instance.new("ImageButton")
local LoadAnimationText = Instance.new("TextLabel")
local Title_6 = Instance.new("TextLabel")
local Close_5 = Instance.new("TextButton")
local SynapseLogo_4 = Instance.new("ImageLabel")
local Save_2 = Instance.new("TextButton")
local TimeSaved = Instance.new("TextLabel")
local ScriptHubTopbar = Instance.new("Frame")
local Main_5 = Instance.new("Frame")
local Image = Instance.new("ImageLabel")
local SynapseLogo_5 = Instance.new("ImageButton")
local Title_7 = Instance.new("TextLabel")
local Close_6 = Instance.new("TextButton")
local Execute_3 = Instance.new("TextButton")
local ScriptsBox = Instance.new("Frame")
local DarkDex = Instance.new("TextButton")
local UnnamedEsp = Instance.new("TextButton")
local RemoteSpy = Instance.new("TextButton")
local ScriptDumper = Instance.new("TextButton")
local DescriptionBox = Instance.new("Frame")
local Description = Instance.new("TextLabel")
local Minimize_2 = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local characters = { "A","B","C","D","E","F","G","H","I","J","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","0","!","@","#","$","%","^","&","*","(",")","-","=","[","]","|",";","'",",",".","/","_","+","{","}",":","<",">","?","`","~" }
function randname() local randomname = characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)]..characters[math.random(1,#characters)] return randomname end
if syn then syn.protect_gui(SynapseXI) end
SynapseXI.Name = randname()
SynapseXI.Parent = game.CoreGui
getgenv().sxiname = SynapseXI.Name

Topbar.Name = "Topbar"
Topbar.Parent = SynapseXI
Topbar.AnchorPoint = Vector2.new(0.5, 0.5)
Topbar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Topbar.BorderSizePixel = 0
Topbar.Position = UDim2.new(0.5, 0, 0.300000012, 0)
Topbar.Size = UDim2.new(0, 801, 0, 30)

Main.Name = "Main"
Main.Parent = Topbar
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Position = UDim2.new(0.5, 0, 5.9067359, 0)
Main.Size = UDim2.new(0, 801, 0, 355)
Main.ZIndex = 0

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
Scripts.ScrollBarThickness = 5
Scripts.ScrollingEnabled = false

Dex.Name = "Dex"
Dex.Parent = Scripts
Dex.BackgroundColor3 = Color3.fromRGB(55, 84, 98)
Dex.BackgroundTransparency = 1.000
Dex.BorderColor3 = Color3.fromRGB(38, 160, 218)
Dex.BorderSizePixel = 0
Dex.Position = UDim2.new(0, 4, 0, 40)
Dex.Size = UDim2.new(0, 118, 0, 20)
Dex.ZIndex = 2
Dex.AutoButtonColor = false
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
IY.BorderColor3 = Color3.fromRGB(38, 160, 218)
IY.BorderSizePixel = 0
IY.Position = UDim2.new(0.0252100863, 1, 0.0262473151, 6)
IY.Size = UDim2.new(0, 118, 0, 20)
IY.ZIndex = 2
IY.AutoButtonColor = false
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
CMDX.BorderColor3 = Color3.fromRGB(38, 160, 218)
CMDX.BorderSizePixel = 0
CMDX.Position = UDim2.new(0.0252100863, 1, 0.00237634405, 0)
CMDX.Size = UDim2.new(0, 118, 0, 20)
CMDX.ZIndex = 2
CMDX.AutoButtonColor = false
CMDX.Font = Enum.Font.SourceSansSemibold
CMDX.Text = "  CMD X.lua"
CMDX.TextColor3 = Color3.fromRGB(255, 255, 255)
CMDX.TextSize = 14.000
CMDX.TextWrapped = true
CMDX.TextXAlignment = Enum.TextXAlignment.Left

EditorScroll.Name = "EditorScroll"
EditorScroll.Parent = Main
EditorScroll.Active = true
EditorScroll.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
EditorScroll.BorderSizePixel = 0
EditorScroll.Position = UDim2.new(0.0551860221, 0, 0.151656285, 0)
EditorScroll.Size = UDim2.new(0, 631, 0, 259)
EditorScroll.ZIndex = 3
EditorScroll.BottomImage = "rbxassetid://6488047993"
EditorScroll.MidImage = "rbxassetid://6488047993"
EditorScroll.ScrollBarThickness = 13
EditorScroll.TopImage = "rbxassetid://6488047993"

Editor.Name = "Editor"
Editor.Parent = EditorScroll
Editor.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Editor.BorderSizePixel = 0
Editor.Size = UDim2.new(0, 631, 0, 259)
Editor.ZIndex = 3
Editor.ClearTextOnFocus = false
Editor.Font = Enum.Font.Code
Editor.MultiLine = true
Editor.PlaceholderText = "-- made by zzerexx#3970"
Editor.Text = ""
Editor.TextColor3 = Color3.fromRGB(255, 255, 255)
Editor.TextSize = 14.000
Editor.TextXAlignment = Enum.TextXAlignment.Left
Editor.TextYAlignment = Enum.TextYAlignment.Top

NumberScroll.Name = "NumberScroll"
NumberScroll.Parent = Main
NumberScroll.Active = true
NumberScroll.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
NumberScroll.BorderSizePixel = 0
NumberScroll.Position = UDim2.new(0.00400000298, 0, 0.151656285, 0)
NumberScroll.Size = UDim2.new(0, 39, 0, 259)
NumberScroll.BottomImage = "rbxassetid://6488047993"
NumberScroll.MidImage = "rbxassetid://6488047993"
NumberScroll.ScrollBarThickness = 0
NumberScroll.ScrollingEnabled = false
NumberScroll.TopImage = "rbxassetid://6488047993"

Numbers.Name = "Numbers"
Numbers.Parent = NumberScroll
Numbers.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
Numbers.BorderSizePixel = 0
Numbers.Selectable = false
Numbers.Size = UDim2.new(0, 39, 0, 259)
Numbers.ZIndex = 2
Numbers.Font = Enum.Font.Code
Numbers.Text = ""
Numbers.TextColor3 = Color3.fromRGB(255, 255, 255)
Numbers.TextSize = 14.000
Numbers.TextWrapped = true
Numbers.TextYAlignment = Enum.TextYAlignment.Top

NumberBG.Name = "NumberBG"
NumberBG.Parent = Main
NumberBG.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
NumberBG.BorderSizePixel = 0
NumberBG.Position = UDim2.new(0.00400000019, 0, 0.149000004, 0)
NumberBG.Size = UDim2.new(0, 41, 0, 259)

Tabs.Name = "Tabs"
Tabs.Parent = Main

Tab1.Name = "Tab1"
Tab1.Parent = Tabs
Tab1.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
Tab1.BorderSizePixel = 0
Tab1.Position = UDim2.new(0.00374531839, 0, 0.0985915512, 0)
Tab1.Size = UDim2.new(0, 65, 0, 18)
Tab1.Font = Enum.Font.SourceSans
Tab1.Text = "  Script 1  x"
Tab1.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab1.TextSize = 15.000
Tab1.TextXAlignment = Enum.TextXAlignment.Left

NewTab.Name = "NewTab"
NewTab.Parent = Tab1
NewTab.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
NewTab.BorderColor3 = Color3.fromRGB(139, 139, 139)
NewTab.Position = UDim2.new(0, 69, 0, 2)
NewTab.Size = UDim2.new(0, 15, 0, 15)
NewTab.Font = Enum.Font.SourceSans
NewTab.Text = "+"
NewTab.TextColor3 = Color3.fromRGB(255, 255, 255)
NewTab.TextSize = 20.000

Attach.Name = "Attach"
Attach.Parent = Topbar
Attach.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Attach.BorderColor3 = Color3.fromRGB(134, 134, 134)
Attach.BorderSizePixel = 0
Attach.Position = UDim2.new(0, 614, 10.7670002, -6)
Attach.Size = UDim2.new(0, 89, 0, 31)
Attach.AutoButtonColor = false
Attach.Font = Enum.Font.SourceSans
Attach.Text = "Attach"
Attach.TextColor3 = Color3.fromRGB(255, 255, 255)
Attach.TextSize = 18.000

Options.Name = "Options"
Options.Parent = Topbar
Options.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Options.BorderColor3 = Color3.fromRGB(134, 134, 134)
Options.BorderSizePixel = 0
Options.Position = UDim2.new(0, 482, 10.7670002, -6)
Options.Size = UDim2.new(0, 89, 0, 31)
Options.AutoButtonColor = false
Options.Font = Enum.Font.SourceSans
Options.Text = "Options"
Options.TextColor3 = Color3.fromRGB(255, 255, 255)
Options.TextSize = 18.000

ExecFile.Name = "ExecFile"
ExecFile.Parent = Topbar
ExecFile.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ExecFile.BorderColor3 = Color3.fromRGB(134, 134, 134)
ExecFile.BorderSizePixel = 0
ExecFile.Position = UDim2.new(0, 292, 10.7670002, -6)
ExecFile.Size = UDim2.new(0, 89, 0, 31)
ExecFile.AutoButtonColor = false
ExecFile.Font = Enum.Font.SourceSans
ExecFile.Text = "Execute File"
ExecFile.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecFile.TextSize = 18.000

Clear.Name = "Clear"
Clear.Parent = Topbar
Clear.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Clear.BorderColor3 = Color3.fromRGB(134, 134, 134)
Clear.BorderSizePixel = 0
Clear.Position = UDim2.new(0, 101, 10.7670002, -6)
Clear.Size = UDim2.new(0, 89, 0, 31)
Clear.AutoButtonColor = false
Clear.Font = Enum.Font.SourceSans
Clear.Text = "Clear"
Clear.TextColor3 = Color3.fromRGB(255, 255, 255)
Clear.TextSize = 18.000

Execute.Name = "Execute"
Execute.Parent = Topbar
Execute.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Execute.BorderColor3 = Color3.fromRGB(134, 134, 134)
Execute.BorderSizePixel = 0
Execute.Position = UDim2.new(0, 5, 10.7670002, -6)
Execute.Size = UDim2.new(0, 89, 0, 31)
Execute.AutoButtonColor = false
Execute.Font = Enum.Font.SourceSans
Execute.Text = "Execute"
Execute.TextColor3 = Color3.fromRGB(255, 255, 255)
Execute.TextSize = 18.000

OpenFile.Name = "OpenFile"
OpenFile.Parent = Topbar
OpenFile.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
OpenFile.BorderColor3 = Color3.fromRGB(134, 134, 134)
OpenFile.BorderSizePixel = 0
OpenFile.Position = UDim2.new(0, 197, 10.7670002, -6)
OpenFile.Size = UDim2.new(0, 89, 0, 31)
OpenFile.AutoButtonColor = false
OpenFile.Font = Enum.Font.SourceSans
OpenFile.Text = "Open File"
OpenFile.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenFile.TextSize = 18.000

SaveFile.Name = "SaveFile"
SaveFile.Parent = Topbar
SaveFile.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SaveFile.BorderColor3 = Color3.fromRGB(134, 134, 134)
SaveFile.BorderSizePixel = 0
SaveFile.Position = UDim2.new(0, 387, 10.7670002, -6)
SaveFile.Size = UDim2.new(0, 89, 0, 31)
SaveFile.AutoButtonColor = false
SaveFile.Font = Enum.Font.SourceSans
SaveFile.Text = "Save File"
SaveFile.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveFile.TextSize = 18.000

ScriptHub.Name = "ScriptHub"
ScriptHub.Parent = Topbar
ScriptHub.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ScriptHub.BorderColor3 = Color3.fromRGB(134, 134, 134)
ScriptHub.BorderSizePixel = 0
ScriptHub.Position = UDim2.new(0, 709, 10.7670002, -6)
ScriptHub.Size = UDim2.new(0, 89, 0, 31)
ScriptHub.AutoButtonColor = false
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
SynapseLogo.Image = "rbxassetid://6444400790"
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
Minimize.BorderColor3 = Color3.fromRGB(134, 134, 134)
Minimize.BorderSizePixel = 0
Minimize.Position = UDim2.new(0.916354597, 0, 1.1920929e-07, 0)
Minimize.Size = UDim2.new(0, 22, 0, 22)
Minimize.ZIndex = 2
Minimize.AutoButtonColor = false
Minimize.Font = Enum.Font.SourceSans
Minimize.Text = "_"
Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
Minimize.TextSize = 16.000

Maximize.Name = "Maximize"
Maximize.Parent = Topbar
Maximize.BackgroundColor3 = Color3.fromRGB(52, 69, 85)
Maximize.BackgroundTransparency = 1.000
Maximize.BorderColor3 = Color3.fromRGB(134, 134, 134)
Maximize.BorderSizePixel = 0
Maximize.Position = UDim2.new(0.943820298, 0, 3.35276127e-08, 0)
Maximize.Size = UDim2.new(0, 22, 0, 22)
Maximize.ZIndex = 2
Maximize.AutoButtonColor = false
Maximize.Font = Enum.Font.SourceSans
Maximize.Text = "M"
Maximize.TextColor3 = Color3.fromRGB(255, 255, 255)
Maximize.TextSize = 16.000

Close.Name = "Close"
Close.Parent = Topbar
Close.BackgroundColor3 = Color3.fromRGB(52, 69, 85)
Close.BackgroundTransparency = 1.000
Close.BorderColor3 = Color3.fromRGB(134, 134, 134)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.972534359, 0, 1.1920929e-07, 0)
Close.Size = UDim2.new(0, 22, 0, 22)
Close.ZIndex = 2
Close.AutoButtonColor = false
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
InfoIcon.Image = "rbxassetid://6332882793"

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
Ok.Image = "rbxassetid://6444452008"

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
Execute_2.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
Execute_2.BorderColor3 = Color3.fromRGB(105, 105, 105)
Execute_2.Size = UDim2.new(0, 160, 0, 22)
Execute_2.ZIndex = 4
Execute_2.AutoButtonColor = false
Execute_2.Font = Enum.Font.SourceSans
Execute_2.Text = "                    Execute"
Execute_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Execute_2.TextSize = 14.000
Execute_2.TextXAlignment = Enum.TextXAlignment.Left

Load.Name = "Load"
Load.Parent = Menu
Load.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
Load.BorderColor3 = Color3.fromRGB(105, 105, 105)
Load.Position = UDim2.new(0, 0, 0.522727251, 0)
Load.Size = UDim2.new(0, 160, 0, 22)
Load.ZIndex = 4
Load.AutoButtonColor = false
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
Close_3.BorderColor3 = Color3.fromRGB(134, 134, 134)
Close_3.BorderSizePixel = 0
Close_3.Position = UDim2.new(0.055555556, 0, 3.36666656, 0)
Close_3.Size = UDim2.new(0, 75, 0, 30)
Close_3.ZIndex = 5
Close_3.AutoButtonColor = false
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
Extension.BorderColor3 = Color3.fromRGB(134, 134, 134)
Extension.BorderSizePixel = 0
Extension.Position = UDim2.new(0.722222209, 0, 2, 0)
Extension.Size = UDim2.new(0, 40, 0, 25)
Extension.ZIndex = 5
Extension.AutoButtonColor = false
Extension.Font = Enum.Font.SourceSans
Extension.Text = ".lua"
Extension.TextColor3 = Color3.fromRGB(255, 255, 255)
Extension.TextSize = 14.000

Save.Name = "Save"
Save.Parent = BoxTopbar
Save.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Save.BorderColor3 = Color3.fromRGB(134, 134, 134)
Save.BorderSizePixel = 0
Save.Position = UDim2.new(0.527777791, 0, 3.36666656, 0)
Save.Size = UDim2.new(0, 75, 0, 30)
Save.ZIndex = 5
Save.AutoButtonColor = false
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

CustomExtension.Name = "CustomExtension"
CustomExtension.Parent = BoxTopbar
CustomExtension.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
CustomExtension.BorderSizePixel = 0
CustomExtension.Position = UDim2.new(0.722000003, 0, 2, 0)
CustomExtension.Size = UDim2.new(0, 40, 0, 25)
CustomExtension.ZIndex = 5
CustomExtension.ClearTextOnFocus = false
CustomExtension.Font = Enum.Font.SourceSans
CustomExtension.PlaceholderText = ".txt"
CustomExtension.Text = ""
CustomExtension.TextColor3 = Color3.fromRGB(255, 255, 255)
CustomExtension.TextSize = 14.000

CustomBtn.Name = "CustomBtn"
CustomBtn.Parent = BoxTopbar
CustomBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
CustomBtn.BorderColor3 = Color3.fromRGB(134, 134, 134)
CustomBtn.BorderSizePixel = 0
CustomBtn.Position = UDim2.new(0.722222209, 0, 1.26666665, 0)
CustomBtn.Size = UDim2.new(0, 40, 0, 15)
CustomBtn.ZIndex = 5
CustomBtn.AutoButtonColor = false
CustomBtn.Font = Enum.Font.SourceSans
CustomBtn.Text = "Custom"
CustomBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
CustomBtn.TextSize = 12.000

OptionsTopbar.Name = "OptionsTopbar"
OptionsTopbar.Parent = SynapseXI
OptionsTopbar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
OptionsTopbar.BorderSizePixel = 0
OptionsTopbar.Position = UDim2.new(0.356236786, 0, 0.366468847, 0)
OptionsTopbar.Size = UDim2.new(0, 271, 0, 30)
OptionsTopbar.Visible = false
OptionsTopbar.ZIndex = 8

SynapseLogo_2.Name = "SynapseLogo"
SynapseLogo_2.Parent = OptionsTopbar
SynapseLogo_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SynapseLogo_2.BackgroundTransparency = 1.000
SynapseLogo_2.BorderSizePixel = 0
SynapseLogo_2.Position = UDim2.new(0.00400000019, 4, 0.166999996, -2)
SynapseLogo_2.Size = UDim2.new(0, 25, 0, 25)
SynapseLogo_2.ZIndex = 9
SynapseLogo_2.Image = "rbxassetid://6444400790"
SynapseLogo_2.ScaleType = Enum.ScaleType.Fit

Title_4.Name = "Title"
Title_4.Parent = OptionsTopbar
Title_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_4.BackgroundTransparency = 1.000
Title_4.BorderSizePixel = 0
Title_4.Position = UDim2.new(0.167876184, 0, 0, 0)
Title_4.Size = UDim2.new(0, 180, 0, 30)
Title_4.ZIndex = 9
Title_4.Font = Enum.Font.SourceSans
Title_4.Text = "Synapse X - Options"
Title_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_4.TextSize = 15.000

Main_3.Name = "Main"
Main_3.Parent = OptionsTopbar
Main_3.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
Main_3.BorderSizePixel = 0
Main_3.Size = UDim2.new(0, 271, 0, 315)
Main_3.ZIndex = 7

UnlockFps.Name = "UnlockFps"
UnlockFps.Parent = Main_3
UnlockFps.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UnlockFps.BorderSizePixel = 0
UnlockFps.Position = UDim2.new(0, 87, 0.0949999988, 12)
UnlockFps.Size = UDim2.new(0, 13, 0, 13)
UnlockFps.ZIndex = 8
UnlockFps.Image = "rbxassetid://6444393266"

UnlockFpsText.Name = "UnlockFpsText"
UnlockFpsText.Parent = UnlockFps
UnlockFpsText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UnlockFpsText.BackgroundTransparency = 1.000
UnlockFpsText.BorderSizePixel = 0
UnlockFpsText.Position = UDim2.new(0.984388292, 0, -0.0207509547, 0)
UnlockFpsText.Size = UDim2.new(0, 72, 0, 13)
UnlockFpsText.ZIndex = 8
UnlockFpsText.Font = Enum.Font.SourceSans
UnlockFpsText.Text = "  Unlock FPS"
UnlockFpsText.TextColor3 = Color3.fromRGB(255, 255, 255)
UnlockFpsText.TextSize = 16.000
UnlockFpsText.TextXAlignment = Enum.TextXAlignment.Left

AutoLaunch.Name = "AutoLaunch"
AutoLaunch.Parent = Main_3
AutoLaunch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoLaunch.BorderSizePixel = 0
AutoLaunch.Position = UDim2.new(0, 87, 0.0949999988, 35)
AutoLaunch.Size = UDim2.new(0, 13, 0, 13)
AutoLaunch.ZIndex = 8
AutoLaunch.Image = "rbxassetid://6444393266"

AutoLaunchText.Name = "AutoLaunchText"
AutoLaunchText.Parent = AutoLaunch
AutoLaunchText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoLaunchText.BackgroundTransparency = 1.000
AutoLaunchText.BorderSizePixel = 0
AutoLaunchText.Position = UDim2.new(0.984389067, 0, -0.0207519531, 0)
AutoLaunchText.Size = UDim2.new(0, 72, 0, 13)
AutoLaunchText.ZIndex = 8
AutoLaunchText.Font = Enum.Font.SourceSans
AutoLaunchText.Text = "  Auto-Launch"
AutoLaunchText.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoLaunchText.TextSize = 16.000
AutoLaunchText.TextXAlignment = Enum.TextXAlignment.Left

AutoAttach.Name = "AutoAttach"
AutoAttach.Parent = Main_3
AutoAttach.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoAttach.BorderSizePixel = 0
AutoAttach.Position = UDim2.new(0, 87, 0.0949999988, 58)
AutoAttach.Size = UDim2.new(0, 13, 0, 13)
AutoAttach.ZIndex = 8
AutoAttach.Image = "rbxassetid://6444393266"

AutoAttachText.Name = "AutoAttachText"
AutoAttachText.Parent = AutoAttach
AutoAttachText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoAttachText.BackgroundTransparency = 1.000
AutoAttachText.BorderSizePixel = 0
AutoAttachText.Position = UDim2.new(0.984389067, 0, -0.0207519531, 0)
AutoAttachText.Size = UDim2.new(0, 72, 0, 13)
AutoAttachText.ZIndex = 8
AutoAttachText.Font = Enum.Font.SourceSans
AutoAttachText.Text = "  Auto-Attach"
AutoAttachText.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoAttachText.TextSize = 16.000
AutoAttachText.TextXAlignment = Enum.TextXAlignment.Left

FileClosing.Name = "FileClosing"
FileClosing.Parent = Main_3
FileClosing.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FileClosing.BorderSizePixel = 0
FileClosing.Position = UDim2.new(0, 87, 0.0949999988, 81)
FileClosing.Size = UDim2.new(0, 13, 0, 13)
FileClosing.ZIndex = 8
FileClosing.Image = "rbxassetid://6444393266"

FileClosingText.Name = "FileClosingText"
FileClosingText.Parent = FileClosing
FileClosingText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FileClosingText.BackgroundTransparency = 1.000
FileClosingText.BorderSizePixel = 0
FileClosingText.Position = UDim2.new(0.984389067, 0, -0.0207519531, 0)
FileClosingText.Size = UDim2.new(0, 72, 0, 13)
FileClosingText.ZIndex = 8
FileClosingText.Font = Enum.Font.SourceSans
FileClosingText.Text = "  File Closing Prompt"
FileClosingText.TextColor3 = Color3.fromRGB(255, 255, 255)
FileClosingText.TextSize = 16.000
FileClosingText.TextXAlignment = Enum.TextXAlignment.Left

ClearEditor.Name = "ClearEditor"
ClearEditor.Parent = Main_3
ClearEditor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ClearEditor.BorderSizePixel = 0
ClearEditor.Position = UDim2.new(0, 87, 0.0949999988, 104)
ClearEditor.Size = UDim2.new(0, 13, 0, 13)
ClearEditor.ZIndex = 8
ClearEditor.Image = "rbxassetid://6444393266"

ClearEditorText.Name = "ClearEditorText"
ClearEditorText.Parent = ClearEditor
ClearEditorText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ClearEditorText.BackgroundTransparency = 1.000
ClearEditorText.BorderSizePixel = 0
ClearEditorText.Position = UDim2.new(0.984389067, 0, -0.0207519531, 0)
ClearEditorText.Size = UDim2.new(0, 72, 0, 13)
ClearEditorText.ZIndex = 8
ClearEditorText.Font = Enum.Font.SourceSans
ClearEditorText.Text = "  Clear Editor Prompt"
ClearEditorText.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearEditorText.TextSize = 16.000
ClearEditorText.TextXAlignment = Enum.TextXAlignment.Left

InternalUI.Name = "InternalUI"
InternalUI.Parent = Main_3
InternalUI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InternalUI.BorderSizePixel = 0
InternalUI.Position = UDim2.new(0, 87, 0.0949999988, 127)
InternalUI.Size = UDim2.new(0, 13, 0, 13)
InternalUI.ZIndex = 8
InternalUI.Image = "rbxassetid://6444393266"

InternalUIText.Name = "InternalUIText"
InternalUIText.Parent = InternalUI
InternalUIText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InternalUIText.BackgroundTransparency = 1.000
InternalUIText.BorderSizePixel = 0
InternalUIText.Position = UDim2.new(0.984389067, 0, -0.0207519531, 0)
InternalUIText.Size = UDim2.new(0, 72, 0, 13)
InternalUIText.ZIndex = 8
InternalUIText.Font = Enum.Font.SourceSans
InternalUIText.Text = "  Internal UI"
InternalUIText.TextColor3 = Color3.fromRGB(255, 255, 255)
InternalUIText.TextSize = 16.000
InternalUIText.TextXAlignment = Enum.TextXAlignment.Left

TopMost.Name = "TopMost"
TopMost.Parent = Main_3
TopMost.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TopMost.BorderSizePixel = 0
TopMost.Position = UDim2.new(0, 87, 0.0949999988, 150)
TopMost.Size = UDim2.new(0, 13, 0, 13)
TopMost.ZIndex = 8
TopMost.Image = "rbxassetid://6444393266"

TopMostText.Name = "TopMostText"
TopMostText.Parent = TopMost
TopMostText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TopMostText.BackgroundTransparency = 1.000
TopMostText.BorderSizePixel = 0
TopMostText.Position = UDim2.new(0.984389067, 0, -0.0207519531, 0)
TopMostText.Size = UDim2.new(0, 72, 0, 13)
TopMostText.ZIndex = 8
TopMostText.Font = Enum.Font.SourceSans
TopMostText.Text = "  TopMost"
TopMostText.TextColor3 = Color3.fromRGB(255, 255, 255)
TopMostText.TextSize = 16.000
TopMostText.TextXAlignment = Enum.TextXAlignment.Left

AutoJoin.Name = "AutoJoin"
AutoJoin.Parent = Main_3
AutoJoin.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoJoin.BorderSizePixel = 0
AutoJoin.Position = UDim2.new(0, 87, 0.0949999988, 173)
AutoJoin.Size = UDim2.new(0, 13, 0, 13)
AutoJoin.ZIndex = 8
AutoJoin.Image = "rbxassetid://6444393266"

AutoJoinText.Name = "AutoJoinText"
AutoJoinText.Parent = AutoJoin
AutoJoinText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoJoinText.BackgroundTransparency = 1.000
AutoJoinText.BorderSizePixel = 0
AutoJoinText.Position = UDim2.new(0.984389067, 0, -0.0207519531, 0)
AutoJoinText.Size = UDim2.new(0, 72, 0, 13)
AutoJoinText.ZIndex = 8
AutoJoinText.Font = Enum.Font.SourceSans
AutoJoinText.Text = "  Discord AutoJoin"
AutoJoinText.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoJoinText.TextSize = 16.000
AutoJoinText.TextXAlignment = Enum.TextXAlignment.Left

EditorTheme.Name = "EditorTheme"
EditorTheme.Parent = Main_3
EditorTheme.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EditorTheme.BackgroundTransparency = 1.000
EditorTheme.BorderSizePixel = 0
EditorTheme.Position = UDim2.new(0.32100001, 17, 0.683000028, 14)
EditorTheme.Size = UDim2.new(0, 73, 0, 11)
EditorTheme.ZIndex = 8
EditorTheme.Font = Enum.Font.SourceSans
EditorTheme.Text = "Editor Theme"
EditorTheme.TextColor3 = Color3.fromRGB(255, 255, 255)
EditorTheme.TextSize = 15.000

ThemeName.Name = "ThemeName"
ThemeName.Parent = Main_3
ThemeName.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
ThemeName.BorderSizePixel = 0
ThemeName.Position = UDim2.new(0, 10, 0.936999977, -45)
ThemeName.Size = UDim2.new(0, 238, 0, 20)
ThemeName.ZIndex = 8
ThemeName.Font = Enum.Font.SourceSans
ThemeName.Text = "Tomorrow-night-eighties"
ThemeName.TextColor3 = Color3.fromRGB(255, 255, 255)
ThemeName.TextSize = 15.000
ThemeName.TextXAlignment = Enum.TextXAlignment.Left

Close_4.Name = "Close"
Close_4.Parent = OptionsTopbar
Close_4.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Close_4.BorderColor3 = Color3.fromRGB(134, 134, 134)
Close_4.BorderSizePixel = 0
Close_4.Position = UDim2.new(0, 11, 9.60000038, -13)
Close_4.Size = UDim2.new(0, 249, 0, 27)
Close_4.ZIndex = 8
Close_4.AutoButtonColor = false
Close_4.Font = Enum.Font.SourceSans
Close_4.Text = "Close"
Close_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Close_4.TextSize = 15.000

DropdownBtn.Name = "DropdownBtn"
DropdownBtn.Parent = OptionsTopbar
DropdownBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DropdownBtn.BorderColor3 = Color3.fromRGB(255, 255, 255)
DropdownBtn.Position = UDim2.new(0.911439061, 0, 8.33333302, 0)
DropdownBtn.Size = UDim2.new(0, 13, 0, 20)
DropdownBtn.ZIndex = 8
DropdownBtn.Image = "rbxassetid://6444392911"

OpenSynapse.Name = "OpenSynapse"
OpenSynapse.Parent = SynapseXI
OpenSynapse.AnchorPoint = Vector2.new(0.5, 0.5)
OpenSynapse.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
OpenSynapse.BackgroundTransparency = 1.000
OpenSynapse.BorderSizePixel = 0
OpenSynapse.Position = UDim2.new(0.472515851, 0, 0.541543007, 0)
OpenSynapse.Size = UDim2.new(0, 50, 0, 50)
OpenSynapse.Visible = false
OpenSynapse.ZIndex = 1000

SynapseOpen.Name = "SynapseOpen"
SynapseOpen.Parent = OpenSynapse
SynapseOpen.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SynapseOpen.BorderSizePixel = 0
SynapseOpen.Size = UDim2.new(0, 50, 0, 50)
SynapseOpen.ZIndex = 1000
SynapseOpen.AutoButtonColor = false
SynapseOpen.Image = "rbxassetid://6444393089"
SynapseOpen.ImageRectSize = Vector2.new(500, 500)
SynapseOpen.ScaleType = Enum.ScaleType.Fit

UICorner.Parent = SynapseOpen

Loader.Name = "Loader"
Loader.Parent = SynapseXI
Loader.AnchorPoint = Vector2.new(0.5, 0.5)
Loader.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
Loader.BorderSizePixel = 0
Loader.Position = UDim2.new(0.5, 0, 0.5, 0)
Loader.Size = UDim2.new(0, 418, 0, 117)
Loader.Visible = false
Loader.ZIndex = 10

Top.Name = "Top"
Top.Parent = Loader
Top.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
Top.BorderSizePixel = 0
Top.Size = UDim2.new(0, 418, 0, 30)
Top.ZIndex = 12

Title_5.Name = "Title"
Title_5.Parent = Loader
Title_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_5.BackgroundTransparency = 1.000
Title_5.BorderSizePixel = 0
Title_5.Position = UDim2.new(0.35645932, 0, 0, 0)
Title_5.Size = UDim2.new(0, 120, 0, 30)
Title_5.ZIndex = 13
Title_5.Font = Enum.Font.SourceSans
Title_5.Text = "Synapse X - Loader"
Title_5.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_5.TextSize = 15.000

SynapseLogo_3.Name = "SynapseLogo"
SynapseLogo_3.Parent = Loader
SynapseLogo_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SynapseLogo_3.BackgroundTransparency = 1.000
SynapseLogo_3.BorderSizePixel = 0
SynapseLogo_3.Position = UDim2.new(0.0215310995, 0, 0.0341880322, 0)
SynapseLogo_3.Size = UDim2.new(0, 25, 0, 22)
SynapseLogo_3.ZIndex = 13
SynapseLogo_3.Image = "rbxassetid://6444400790"

BarBackground.Name = "BarBackground"
BarBackground.Parent = Loader
BarBackground.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
BarBackground.BorderSizePixel = 0
BarBackground.Position = UDim2.new(0, 19, 0.256000012, 44)
BarBackground.Size = UDim2.new(0, 387, 0, 22)
BarBackground.ZIndex = 12

Bar.Name = "Bar"
Bar.Parent = Loader
Bar.AnchorPoint = Vector2.new(0, 0.5)
Bar.BackgroundColor3 = Color3.fromRGB(6, 176, 37)
Bar.BorderSizePixel = 0
Bar.Position = UDim2.new(0, 19, 0.350017101, 44)
Bar.Size = UDim2.new(0, 97, 0, 22)
Bar.ZIndex = 13

Text.Name = "Text"
Text.Parent = Loader
Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text.BackgroundTransparency = 1.000
Text.BorderSizePixel = 0
Text.Position = UDim2.new(0.389952153, 0, 0.419, -3)
Text.Size = UDim2.new(0, 99, 0, 18)
Text.ZIndex = 11
Text.Font = Enum.Font.SourceSans
Text.Text = "Initializing..."
Text.TextColor3 = Color3.fromRGB(255, 255, 255)
Text.TextSize = 18.000

SettingsTopbar.Name = "SettingsTopbar"
SettingsTopbar.Parent = SynapseXI
SettingsTopbar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SettingsTopbar.BorderSizePixel = 0
SettingsTopbar.Position = UDim2.new(0.356236786, 0, 0.36201781, 0)
SettingsTopbar.Size = UDim2.new(0, 271, 0, 30)
SettingsTopbar.Visible = false
SettingsTopbar.ZIndex = 11

Main_4.Name = "Main"
Main_4.Parent = SettingsTopbar
Main_4.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
Main_4.BorderColor3 = Color3.fromRGB(27, 42, 53)
Main_4.BorderSizePixel = 0
Main_4.Size = UDim2.new(0, 271, 0, 315)
Main_4.ZIndex = 10

Placeholder3.Name = "Placeholder3"
Placeholder3.Parent = Main_4
Placeholder3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Placeholder3.BorderSizePixel = 0
Placeholder3.Position = UDim2.new(0, 87, 0.0949999988, 58)
Placeholder3.Size = UDim2.new(0, 13, 0, 13)
Placeholder3.ZIndex = 11
Placeholder3.Image = "rbxassetid://6444393266"

Placeholder3Text.Name = "Placeholder3Text"
Placeholder3Text.Parent = Placeholder3
Placeholder3Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Placeholder3Text.BackgroundTransparency = 1.000
Placeholder3Text.BorderSizePixel = 0
Placeholder3Text.Position = UDim2.new(0.984389067, 0, -0.0207519531, 0)
Placeholder3Text.Size = UDim2.new(0, 72, 0, 13)
Placeholder3Text.ZIndex = 11
Placeholder3Text.Font = Enum.Font.SourceSans
Placeholder3Text.Text = "  Placeholder 3"
Placeholder3Text.TextColor3 = Color3.fromRGB(255, 255, 255)
Placeholder3Text.TextSize = 16.000
Placeholder3Text.TextXAlignment = Enum.TextXAlignment.Left

Placeholder8.Name = "Placeholder8"
Placeholder8.Parent = Main_4
Placeholder8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Placeholder8.BorderSizePixel = 0
Placeholder8.Position = UDim2.new(0, 87, 0.0949999988, 173)
Placeholder8.Size = UDim2.new(0, 13, 0, 13)
Placeholder8.ZIndex = 11
Placeholder8.Image = "rbxassetid://6444393266"

Placeholder8Text.Name = "Placeholder8Text"
Placeholder8Text.Parent = Placeholder8
Placeholder8Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Placeholder8Text.BackgroundTransparency = 1.000
Placeholder8Text.BorderSizePixel = 0
Placeholder8Text.Position = UDim2.new(0.984389067, 0, -0.0207519531, 0)
Placeholder8Text.Size = UDim2.new(0, 72, 0, 13)
Placeholder8Text.ZIndex = 11
Placeholder8Text.Font = Enum.Font.SourceSans
Placeholder8Text.Text = "  Placeholder 8"
Placeholder8Text.TextColor3 = Color3.fromRGB(255, 255, 255)
Placeholder8Text.TextSize = 16.000
Placeholder8Text.TextXAlignment = Enum.TextXAlignment.Left

AutoSave.Name = "AutoSave"
AutoSave.Parent = Main_4
AutoSave.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoSave.BorderSizePixel = 0
AutoSave.Position = UDim2.new(0, 87, 0.0949999988, 35)
AutoSave.Size = UDim2.new(0, 13, 0, 13)
AutoSave.ZIndex = 11
AutoSave.Image = "rbxassetid://6444393266"

AutoSaveText.Name = "AutoSaveText"
AutoSaveText.Parent = AutoSave
AutoSaveText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoSaveText.BackgroundTransparency = 1.000
AutoSaveText.BorderSizePixel = 0
AutoSaveText.Position = UDim2.new(0.984389067, 0, -0.0207519531, 0)
AutoSaveText.Size = UDim2.new(0, 72, 0, 13)
AutoSaveText.ZIndex = 11
AutoSaveText.Font = Enum.Font.SourceSans
AutoSaveText.Text = "  Auto Save"
AutoSaveText.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoSaveText.TextSize = 16.000
AutoSaveText.TextXAlignment = Enum.TextXAlignment.Left

Placeholder5.Name = "Placeholder5"
Placeholder5.Parent = Main_4
Placeholder5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Placeholder5.BorderSizePixel = 0
Placeholder5.Position = UDim2.new(0, 87, 0.0949999988, 104)
Placeholder5.Size = UDim2.new(0, 13, 0, 13)
Placeholder5.ZIndex = 11
Placeholder5.Image = "rbxassetid://6444393266"

Placeholder5Text.Name = "Placeholder5Text"
Placeholder5Text.Parent = Placeholder5
Placeholder5Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Placeholder5Text.BackgroundTransparency = 1.000
Placeholder5Text.BorderSizePixel = 0
Placeholder5Text.Position = UDim2.new(0.984389067, 0, -0.0207519531, 0)
Placeholder5Text.Size = UDim2.new(0, 72, 0, 13)
Placeholder5Text.ZIndex = 11
Placeholder5Text.Font = Enum.Font.SourceSans
Placeholder5Text.Text = "  Placeholder 5"
Placeholder5Text.TextColor3 = Color3.fromRGB(255, 255, 255)
Placeholder5Text.TextSize = 16.000
Placeholder5Text.TextXAlignment = Enum.TextXAlignment.Left

Placeholder4.Name = "Placeholder4"
Placeholder4.Parent = Main_4
Placeholder4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Placeholder4.BorderSizePixel = 0
Placeholder4.Position = UDim2.new(0, 87, 0.0949999988, 81)
Placeholder4.Size = UDim2.new(0, 13, 0, 13)
Placeholder4.ZIndex = 11
Placeholder4.Image = "rbxassetid://6444393266"

Placeholder4Text.Name = "Placeholder4Text"
Placeholder4Text.Parent = Placeholder4
Placeholder4Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Placeholder4Text.BackgroundTransparency = 1.000
Placeholder4Text.BorderSizePixel = 0
Placeholder4Text.Position = UDim2.new(0.984389067, 0, -0.0207519531, 0)
Placeholder4Text.Size = UDim2.new(0, 72, 0, 13)
Placeholder4Text.ZIndex = 11
Placeholder4Text.Font = Enum.Font.SourceSans
Placeholder4Text.Text = "  Placeholder 4"
Placeholder4Text.TextColor3 = Color3.fromRGB(255, 255, 255)
Placeholder4Text.TextSize = 16.000
Placeholder4Text.TextXAlignment = Enum.TextXAlignment.Left

Placeholder6.Name = "Placeholder6"
Placeholder6.Parent = Main_4
Placeholder6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Placeholder6.BorderSizePixel = 0
Placeholder6.Position = UDim2.new(0, 87, 0.0949999988, 127)
Placeholder6.Size = UDim2.new(0, 13, 0, 13)
Placeholder6.ZIndex = 11
Placeholder6.Image = "rbxassetid://6444393266"

Placeholder6Text.Name = "Placeholder6Text"
Placeholder6Text.Parent = Placeholder6
Placeholder6Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Placeholder6Text.BackgroundTransparency = 1.000
Placeholder6Text.BorderSizePixel = 0
Placeholder6Text.Position = UDim2.new(0.984389067, 0, -0.0207519531, 0)
Placeholder6Text.Size = UDim2.new(0, 72, 0, 13)
Placeholder6Text.ZIndex = 11
Placeholder6Text.Font = Enum.Font.SourceSans
Placeholder6Text.Text = "  Placeholder 6"
Placeholder6Text.TextColor3 = Color3.fromRGB(255, 255, 255)
Placeholder6Text.TextSize = 16.000
Placeholder6Text.TextXAlignment = Enum.TextXAlignment.Left

Placeholder7.Name = "Placeholder7"
Placeholder7.Parent = Main_4
Placeholder7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Placeholder7.BorderSizePixel = 0
Placeholder7.Position = UDim2.new(0, 87, 0.0949999988, 150)
Placeholder7.Size = UDim2.new(0, 13, 0, 13)
Placeholder7.ZIndex = 11
Placeholder7.Image = "rbxassetid://6444393266"

Placeholder7Text.Name = "Placeholder7Text"
Placeholder7Text.Parent = Placeholder7
Placeholder7Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Placeholder7Text.BackgroundTransparency = 1.000
Placeholder7Text.BorderSizePixel = 0
Placeholder7Text.Position = UDim2.new(0.984389067, 0, -0.0207519531, 0)
Placeholder7Text.Size = UDim2.new(0, 72, 0, 13)
Placeholder7Text.ZIndex = 11
Placeholder7Text.Font = Enum.Font.SourceSans
Placeholder7Text.Text = "  Placeholder 7"
Placeholder7Text.TextColor3 = Color3.fromRGB(255, 255, 255)
Placeholder7Text.TextSize = 16.000
Placeholder7Text.TextXAlignment = Enum.TextXAlignment.Left

LoadAnimation.Name = "LoadAnimation"
LoadAnimation.Parent = Main_4
LoadAnimation.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadAnimation.BorderSizePixel = 0
LoadAnimation.Position = UDim2.new(0, 87, 0.0949999988, 12)
LoadAnimation.Size = UDim2.new(0, 13, 0, 13)
LoadAnimation.ZIndex = 11
LoadAnimation.Image = "rbxassetid://6444393266"

LoadAnimationText.Name = "LoadAnimationText"
LoadAnimationText.Parent = LoadAnimation
LoadAnimationText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadAnimationText.BackgroundTransparency = 1.000
LoadAnimationText.BorderSizePixel = 0
LoadAnimationText.Position = UDim2.new(0.984388292, 0, -0.0207509547, 0)
LoadAnimationText.Size = UDim2.new(0, 72, 0, 13)
LoadAnimationText.ZIndex = 11
LoadAnimationText.Font = Enum.Font.SourceSans
LoadAnimationText.Text = "  Load Animation"
LoadAnimationText.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadAnimationText.TextSize = 16.000
LoadAnimationText.TextXAlignment = Enum.TextXAlignment.Left

Title_6.Name = "Title"
Title_6.Parent = SettingsTopbar
Title_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_6.BackgroundTransparency = 1.000
Title_6.BorderSizePixel = 0
Title_6.Position = UDim2.new(0.132841319, 0, 0, 0)
Title_6.Size = UDim2.new(0, 200, 0, 30)
Title_6.ZIndex = 12
Title_6.Font = Enum.Font.SourceSans
Title_6.Text = "Synapse X  - Settings"
Title_6.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_6.TextSize = 15.000

Close_5.Name = "Close"
Close_5.Parent = SettingsTopbar
Close_5.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Close_5.BorderColor3 = Color3.fromRGB(134, 134, 134)
Close_5.BorderSizePixel = 0
Close_5.Position = UDim2.new(0, 11, 9.60000038, -13)
Close_5.Size = UDim2.new(0, 249, 0, 27)
Close_5.ZIndex = 11
Close_5.AutoButtonColor = false
Close_5.Font = Enum.Font.SourceSans
Close_5.Text = "Close"
Close_5.TextColor3 = Color3.fromRGB(255, 255, 255)
Close_5.TextSize = 15.000

SynapseLogo_4.Name = "SynapseLogo"
SynapseLogo_4.Parent = SettingsTopbar
SynapseLogo_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SynapseLogo_4.BackgroundTransparency = 1.000
SynapseLogo_4.BorderSizePixel = 0
SynapseLogo_4.Position = UDim2.new(0.00400000019, 4, 0.166999996, -2)
SynapseLogo_4.Size = UDim2.new(0, 25, 0, 25)
SynapseLogo_4.ZIndex = 12
SynapseLogo_4.Image = "rbxassetid://6444400790"
SynapseLogo_4.ScaleType = Enum.ScaleType.Fit

Save_2.Name = "Save"
Save_2.Parent = SettingsTopbar
Save_2.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Save_2.BorderColor3 = Color3.fromRGB(134, 134, 134)
Save_2.BorderSizePixel = 0
Save_2.Position = UDim2.new(0, 11, 9.60000038, -48)
Save_2.Size = UDim2.new(0, 249, 0, 27)
Save_2.ZIndex = 11
Save_2.AutoButtonColor = false
Save_2.Font = Enum.Font.SourceSans
Save_2.Text = "Save"
Save_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Save_2.TextSize = 15.000

TimeSaved.Name = "TimeSaved"
TimeSaved.Parent = SettingsTopbar
TimeSaved.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TimeSaved.BackgroundTransparency = 1.000
TimeSaved.BorderSizePixel = 0
TimeSaved.Position = UDim2.new(0.368152887, 0, 7.546, -3)
TimeSaved.Size = UDim2.new(0, 72, 0, 13)
TimeSaved.ZIndex = 11
TimeSaved.Font = Enum.Font.SourceSans
TimeSaved.Text = "Saved at: "
TimeSaved.TextColor3 = Color3.fromRGB(255, 255, 255)
TimeSaved.TextSize = 16.000

ScriptHubTopbar.Name = "ScriptHubTopbar"
ScriptHubTopbar.Parent = SynapseXI
ScriptHubTopbar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ScriptHubTopbar.BorderSizePixel = 0
ScriptHubTopbar.Position = UDim2.new(0.362657577, 0, 0.268545985, 0)
ScriptHubTopbar.Size = UDim2.new(0, 439, 0, 30)
ScriptHubTopbar.Visible = false
ScriptHubTopbar.ZIndex = 3

Main_5.Name = "Main"
Main_5.Parent = ScriptHubTopbar
Main_5.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
Main_5.BorderSizePixel = 0
Main_5.Size = UDim2.new(0, 439, 0, 336)
Main_5.ZIndex = 2

Image.Name = "Image"
Image.Parent = Main_5
Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Image.BackgroundTransparency = 1.000
Image.BorderSizePixel = 0
Image.Position = UDim2.new(0.330000013, -16, 0.0890000015, 10)
Image.Size = UDim2.new(0, 294, 0, 170)
Image.ZIndex = 3
Image.Image = "rbxassetid://6444388463"

SynapseLogo_5.Name = "SynapseLogo"
SynapseLogo_5.Parent = ScriptHubTopbar
SynapseLogo_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SynapseLogo_5.BackgroundTransparency = 1.000
SynapseLogo_5.BorderSizePixel = 0
SynapseLogo_5.Position = UDim2.new(0.00400000019, 4, 0.166999996, -2)
SynapseLogo_5.Size = UDim2.new(0, 25, 0, 25)
SynapseLogo_5.ZIndex = 9
SynapseLogo_5.Image = "http://www.roblox.com/asset/?id=6444400790"
SynapseLogo_5.ScaleType = Enum.ScaleType.Fit

Title_7.Name = "Title"
Title_7.Parent = ScriptHubTopbar
Title_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_7.BackgroundTransparency = 1.000
Title_7.BorderSizePixel = 0
Title_7.Position = UDim2.new(0.293160915, 0, 0, 0)
Title_7.Size = UDim2.new(0, 180, 0, 30)
Title_7.ZIndex = 9
Title_7.Font = Enum.Font.SourceSans
Title_7.Text = "Synapse X - Script Hub"
Title_7.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_7.TextSize = 15.000

Close_6.Name = "Close"
Close_6.Parent = ScriptHubTopbar
Close_6.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Close_6.BorderColor3 = Color3.fromRGB(134, 134, 134)
Close_6.BorderSizePixel = 0
Close_6.Position = UDim2.new(0.674000025, -11, 10.3999996, -11)
Close_6.Size = UDim2.new(0, 143, 0, 24)
Close_6.ZIndex = 3
Close_6.AutoButtonColor = false
Close_6.Font = Enum.Font.SourceSans
Close_6.Text = "Close"
Close_6.TextColor3 = Color3.fromRGB(255, 255, 255)
Close_6.TextSize = 15.000

Execute_3.Name = "Execute"
Execute_3.Parent = ScriptHubTopbar
Execute_3.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Execute_3.BorderColor3 = Color3.fromRGB(134, 134, 134)
Execute_3.BorderSizePixel = 0
Execute_3.Position = UDim2.new(0.34799999, -24, 10.3999996, -11)
Execute_3.Size = UDim2.new(0, 147, 0, 24)
Execute_3.ZIndex = 3
Execute_3.AutoButtonColor = false
Execute_3.Font = Enum.Font.SourceSans
Execute_3.Text = "Execute"
Execute_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Execute_3.TextSize = 15.000

ScriptsBox.Name = "ScriptsBox"
ScriptsBox.Parent = ScriptHubTopbar
ScriptsBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ScriptsBox.BorderSizePixel = 0
ScriptsBox.Position = UDim2.new(0, 10, 1, 10)
ScriptsBox.Size = UDim2.new(0, 115, 0, 286)
ScriptsBox.ZIndex = 3

DarkDex.Name = "DarkDex"
DarkDex.Parent = ScriptsBox
DarkDex.BackgroundColor3 = Color3.fromRGB(55, 84, 98)
DarkDex.BackgroundTransparency = 1.000
DarkDex.BorderColor3 = Color3.fromRGB(38, 160, 218)
DarkDex.BorderSizePixel = 0
DarkDex.Size = UDim2.new(0, 115, 0, 20)
DarkDex.ZIndex = 4
DarkDex.AutoButtonColor = false
DarkDex.Font = Enum.Font.SourceSansSemibold
DarkDex.Text = "  Dark Dex"
DarkDex.TextColor3 = Color3.fromRGB(255, 255, 255)
DarkDex.TextSize = 15.000
DarkDex.TextWrapped = true
DarkDex.TextXAlignment = Enum.TextXAlignment.Left

UnnamedEsp.Name = "UnnamedEsp"
UnnamedEsp.Parent = ScriptsBox
UnnamedEsp.BackgroundColor3 = Color3.fromRGB(55, 84, 98)
UnnamedEsp.BackgroundTransparency = 1.000
UnnamedEsp.BorderColor3 = Color3.fromRGB(38, 160, 218)
UnnamedEsp.BorderSizePixel = 0
UnnamedEsp.Position = UDim2.new(0, 0, 0.0699300691, 0)
UnnamedEsp.Size = UDim2.new(0, 115, 0, 20)
UnnamedEsp.ZIndex = 4
UnnamedEsp.AutoButtonColor = false
UnnamedEsp.Font = Enum.Font.SourceSansSemibold
UnnamedEsp.Text = "  Unnamed ESP"
UnnamedEsp.TextColor3 = Color3.fromRGB(255, 255, 255)
UnnamedEsp.TextSize = 15.000
UnnamedEsp.TextWrapped = true
UnnamedEsp.TextXAlignment = Enum.TextXAlignment.Left

RemoteSpy.Name = "RemoteSpy"
RemoteSpy.Parent = ScriptsBox
RemoteSpy.BackgroundColor3 = Color3.fromRGB(55, 84, 98)
RemoteSpy.BackgroundTransparency = 1.000
RemoteSpy.BorderColor3 = Color3.fromRGB(38, 160, 218)
RemoteSpy.BorderSizePixel = 0
RemoteSpy.Position = UDim2.new(0, 0, 0.139860138, 0)
RemoteSpy.Size = UDim2.new(0, 115, 0, 20)
RemoteSpy.ZIndex = 4
RemoteSpy.AutoButtonColor = false
RemoteSpy.Font = Enum.Font.SourceSansSemibold
RemoteSpy.Text = "  Remote Spy"
RemoteSpy.TextColor3 = Color3.fromRGB(255, 255, 255)
RemoteSpy.TextSize = 15.000
RemoteSpy.TextWrapped = true
RemoteSpy.TextXAlignment = Enum.TextXAlignment.Left

ScriptDumper.Name = "ScriptDumper"
ScriptDumper.Parent = ScriptsBox
ScriptDumper.BackgroundColor3 = Color3.fromRGB(55, 84, 98)
ScriptDumper.BackgroundTransparency = 1.000
ScriptDumper.BorderColor3 = Color3.fromRGB(38, 160, 218)
ScriptDumper.BorderSizePixel = 0
ScriptDumper.Position = UDim2.new(0, 0, 0.2097902, 0)
ScriptDumper.Size = UDim2.new(0, 115, 0, 20)
ScriptDumper.ZIndex = 4
ScriptDumper.AutoButtonColor = false
ScriptDumper.Font = Enum.Font.SourceSansSemibold
ScriptDumper.Text = "  Script Dumper"
ScriptDumper.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptDumper.TextSize = 15.000
ScriptDumper.TextWrapped = true
ScriptDumper.TextXAlignment = Enum.TextXAlignment.Left

DescriptionBox.Name = "DescriptionBox"
DescriptionBox.Parent = ScriptHubTopbar
DescriptionBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
DescriptionBox.BorderSizePixel = 0
DescriptionBox.Position = UDim2.new(0.319000006, -10, 8.53299999, -41)
DescriptionBox.Size = UDim2.new(0, 299, 0, 80)
DescriptionBox.ZIndex = 3

Description.Name = "Description"
Description.Parent = DescriptionBox
Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Description.BackgroundTransparency = 1.000
Description.BorderSizePixel = 0
Description.Size = UDim2.new(0, 299, 0, 80)
Description.ZIndex = 4
Description.Font = Enum.Font.SourceSans
Description.Text = "Description"
Description.TextColor3 = Color3.fromRGB(255, 255, 255)
Description.TextSize = 15.000
Description.TextWrapped = true
Description.TextXAlignment = Enum.TextXAlignment.Left
Description.TextYAlignment = Enum.TextYAlignment.Top

Minimize_2.Name = "Minimize"
Minimize_2.Parent = ScriptHubTopbar
Minimize_2.BackgroundColor3 = Color3.fromRGB(52, 69, 85)
Minimize_2.BackgroundTransparency = 1.000
Minimize_2.BorderColor3 = Color3.fromRGB(134, 134, 134)
Minimize_2.BorderSizePixel = 0
Minimize_2.Position = UDim2.new(0.948245287, 0, 1.1920929e-07, 0)
Minimize_2.Size = UDim2.new(0, 22, 0, 22)
Minimize_2.ZIndex = 4
Minimize_2.AutoButtonColor = false
Minimize_2.Font = Enum.Font.SourceSans
Minimize_2.Text = "_"
Minimize_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Minimize_2.TextSize = 16.000

TextLabel.Parent = SynapseXI
TextLabel.AnchorPoint = Vector2.new(0, 1)
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.00499999989, 0, 0.995000005, 0)
TextLabel.Size = UDim2.new(0, 60, 0, 15)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "zzerexx#3970"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 20.000
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Scripts:

local function AQSLQV_fake_script() -- Scripts.ScriptBoxScripts 
	local script = Instance.new('LocalScript', Scripts)

	script.Parent.Dex.BackgroundTransparency = 0
	script.Parent.IY.BackgroundTransparency = 0
	script.Parent.CMDX.BackgroundTransparency = 0
	script.Parent.Dex.BorderSizePixel = 1
	script.Parent.IY.BorderSizePixel = 1
	script.Parent.CMDX.BorderSizePixel = 1
	script.Parent.Dex.BorderColor3 = Color3.fromRGB(60, 60, 60)
	script.Parent.IY.BorderColor3 = Color3.fromRGB(60, 60, 60)
	script.Parent.CMDX.BorderColor3 = Color3.fromRGB(60, 60, 60)
	script.Parent.Dex.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	script.Parent.IY.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	script.Parent.CMDX.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	script.Parent.Dex.BorderMode = Enum.BorderMode.Inset
	script.Parent.IY.BorderMode = Enum.BorderMode.Inset
	script.Parent.CMDX.BorderMode = Enum.BorderMode.Inset
	local scripts = {
		Dex = [[local Dex = rawget(game:GetObjects("rbxassetid://3567096419"), 0X1)
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
	xpcall(Load, warn, Dex)]],
		IY = [[loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()]],
		CMDX = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()]]
	}
	function selection(name)
		script.Parent.Dex.ZIndex = 2
		script.Parent.IY.ZIndex = 2
		script.Parent.CMDX.ZIndex = 2
		script.Parent.Dex.BorderColor3 = Color3.fromRGB(60, 60, 60)
		script.Parent.IY.BorderColor3 = Color3.fromRGB(60, 60, 60)
		script.Parent.CMDX.BorderColor3 = Color3.fromRGB(60, 60, 60)
		script.Parent.Dex.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		script.Parent.IY.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		script.Parent.CMDX.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		script.Parent[name].ZIndex = 3
		script.Parent[name].BorderColor3 = Color3.fromRGB(38, 160, 218)
		script.Parent[name].BackgroundColor3 = Color3.fromRGB(55, 84, 98)
	end
	local scriptnames = { "Dex","IY","CMDX" }
	local mouse = game.Players.LocalPlayer:GetMouse()
	local name
	for i,v in pairs(scriptnames) do
		script.Parent[v].BackgroundTransparency = 0
		script.Parent[v].BorderSizePixel = 1
		script.Parent[v].BorderColor3 = Color3.fromRGB(60, 60, 60)
		script.Parent[v].BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		script.Parent[v].BorderMode = Enum.BorderMode.Inset

		mouse.Button1Down:Connect(function()
			script.Parent[v].BorderColor3 = Color3.fromRGB(60, 60, 60)
			script.Parent[v].BackgroundColor3 = Color3.fromRGB(60, 60, 60)
			script.Parent.Parent.Parent.Parent.Parent.Menu.Visible = false
		end)
		mouse.Button2Down:Connect(function()
			script.Parent[v].BorderColor3 = Color3.fromRGB(60, 60, 60)
			script.Parent[v].BackgroundColor3 = Color3.fromRGB(60, 60, 60)
			script.Parent.Parent.Parent.Parent.Parent.Menu.Visible = false
		end)

		script.Parent[v].MouseButton1Down:Connect(function()
			name = v
			selection(name)
		end)
		script.Parent[v].MouseButton2Click:Connect(function()
			name = v
			selection(name)
			script.Parent.Parent.Parent.Parent.Parent.Menu.Position = UDim2.new(0, mouse.X, 0, mouse.Y)
			script.Parent.Parent.Parent.Parent.Parent.Menu.Visible = true
			if v == "Dex" then
				getgenv().Script = scripts[v]
			end
		end)
	end
end
coroutine.wrap(AQSLQV_fake_script)()
local function BOIV_fake_script() -- Editor.EditorScript 
	local script = Instance.new('LocalScript', Editor)

	if isfile("settings.xi") then
		local data = game:GetService("HttpService"):JSONDecode(readfile("settings.xi"))
		script.Parent.Text = data["Editor"]
	end

	local UIS = game:GetService("UserInputService")
	local lines = 1
	local editor = script.Parent
	local numbers = script.Parent.Parent.Parent.NumberScroll.Numbers

	local function linethingy(input, gameProcessed)
		if input.KeyCode == Enum.KeyCode.Return or Enum.KeyCode.Backspace then
			numbers.Text = ""
			for i = 1, editor.TextBounds.Y / editor.TextSize do
				if i == 1 then
					numbers.Text = "1"
					lines = i
				elseif i ~= lines then
					numbers.Text = numbers.Text.."\n"..tostring(i)
					lines = i
				end
			end
		end
	end
	UIS.InputBegan:Connect(linethingy)
end
coroutine.wrap(BOIV_fake_script)()
local function FEEQWF_fake_script() -- Editor.SyntaxHighlighter 
	local script = Instance.new('LocalScript', Editor)

	local SyntaxColors1 = {
		Text = Color3.fromRGB(204,204,204),         -- Text, No Highlighting
		Operator = Color3.fromRGB(204,204,204),     -- Operators, No Highlighting
		Number = Color3.fromRGB(255,198,0),         -- Number, Gold
		String = Color3.fromRGB(173,241,149),       -- String, Green
		Comment = Color3.fromRGB(102,102,102),      -- Comment, Gray
		Keyword = Color3.fromRGB(248,109,124),      -- Keyword, Pink
		LocalMethod = Color3.fromRGB(253,251,172),  -- Local Method, Light Yellow  
		LocalProperty = Color3.fromRGB(97,161,241), -- LocalProperty, Light Blue
		Nil = Color3.fromRGB(255,198,0),            -- Nil, Gold
		Bool = Color3.fromRGB(255,198,0),           -- Bool, Gold
		Function = Color3.fromRGB(248,109,124),     -- Function, Pink
		Local = Color3.fromRGB(248,109,124),        -- Local, Pink
		Self = Color3.fromRGB(248,109,124),         -- Self, Pink
		FunctionName = Color3.fromRGB(253,251,172)  -- FunctionName, Light Yellow
	}
	local SyntaxColors = {
		None = "204,204,204",
		Gold = "255,198,0",
		Green = "173,241,149",
		Pink = "248,109,124",
		Yellow = "253,251,172",
		LightBlue = "97,161,241"
		--None = Color3.fromRGB(204,204,204),         -- Text, Operators
		--Gold = Color3.fromRGB(255,198,0),           -- Number, Bool, Nil
		--Green = Color3.fromRGB(173,241,149),        -- String
		--Pink = Color3.fromRGB(248,109,124),         -- Keyword, Function, Local, Self
		--Yellow = Color3.fromRGB(253,251,172),       -- Local Method, Function Name
		--LightBlue = Color3.fromRGB(97,161,241),     -- Local Property
	}
	local Syntax123 = {
		Gold = {
			"nil",
			"true",
			"false",
			"1",
			"2",
			"3",
			"4",
			"5",
			"6",
			"7",
			"8",
			"9",
			"0",
		},
		Green = {

		},
		Pink = {
			"and",
			"break",
			"do",
			"else",
			"elseif",
			"end",
			"for",
			"function",
			"local",
			"if",
			"in",
			"repeat",
			"return",
			"then",
			"until",
			"while",
			"else"
		},
		Yellow = {

		},
		LightBlue = {
			"game",
			"script",
			"Parent",
			--property,
		}
	}
	local Source = {
		-- PINK
		"and",
		"break",
		"do",
		"else",
		"elseif",
		"end",
		"for",
		"function",
		"local",
		"if",
		"in",
		"repeat",
		"return",
		"then",
		"until",
		"while",
		"else",
		-- GOLD
		"nil",
		"true",
		"false",
		"1",
		"2",
		"3",
		"4",
		"5",
		"6",
		"7",
		"8",
		"9",
		"0",
		-- YELLOW
		"()",
		-- LIGHTBLUE
		"game",
		"script",
		"Parent",
	}
	local Highlight = {
		"Pink",
		"Pink",
		"Pink",
		"Pink",
		"Pink",
		"Pink",
		"Pink",
		"Pink",
		"Pink",
		"Pink",
		"Pink",
		"Pink",
		"Pink",
		"Pink",
		"Pink",
		"Pink",
		"Pink",
		"Gold",
		"Gold",
		"Gold",
		"Gold",
		"Gold",
		"Gold",
		"Gold",
		"Gold",
		"Gold",
		"Gold",
		"Gold",
		"Gold",
		"Gold",
		"Yellow",
		"LightBlue",
		"LightBlue",
		"LightBlue",
	}
	script.Parent.RichText = true
	local a = "<font color='rgb("
	local b = ")'>"
	local c = "</font>"
	function highlight(str)
		str = tostring(str)
		for position = 1,#Source do
			for i,v in pairs(Source) do
				str = str:gsub(Source[i],Highlight[i]..Source[i]..c)
			end
			if str:find("Pink") then
				str = str:gsub("Pink",a..SyntaxColors.Pink..b)
			elseif str:find("Gold") then
				str = str:gsub("Gold",a..SyntaxColors.Gold..b)
			elseif str:find("Yellow") then
				str = str:gsub("Yellow",a..SyntaxColors.Yellow..b)
			elseif str:find("Green") then
				str = str:gsub("Green",a..SyntaxColors.Green..b)
			elseif str:find("LightBlue") then
				str = str:gsub("LightBlue",a..SyntaxColors.LightBlue..b)
			end
			return(str)
		end
	end
	script.Parent:GetPropertyChangedSignal("Text"):Connect(function()
		--script.Parent.Text = highlight(script.Parent.Text)
	end)
	-- credit to Agent#9336 for inspiration
end
coroutine.wrap(FEEQWF_fake_script)()
local function YLXUZDW_fake_script() -- Main.ScrollingScript 
	local script = Instance.new('LocalScript', Main)

	local numberscroll = script.Parent.NumberScroll
	local editorscroll = script.Parent.EditorScroll
	local number = numberscroll.Numbers
	local editor = editorscroll.Editor
	game:GetService("RunService").RenderStepped:Connect(function()
		numberscroll.CanvasPosition = Vector2.new(numberscroll.CanvasPosition.X, editorscroll.CanvasPosition.Y)
		editorscroll.CanvasPosition = Vector2.new(editorscroll.CanvasPosition.X, numberscroll.CanvasPosition.Y)
		if editor.TextBounds.X > 631 or editor.TextBounds.Y > 259 then
			local textboundsx = editor.TextBounds.X - 631
			local textboundsy = editor.TextBounds.Y - 259
			editor.Size = UDim2.new(0, 631 + textboundsx, 0, 259 + textboundsy)
			editorscroll.CanvasSize = editor.Size
		else
			editor.Size = UDim2.new(0, 631, 0, 259)
			editorscroll.CanvasSize = editor.Size
		end
		number.Size = UDim2.new(0, 39, 0, editor.TextBounds.Y)
		numberscroll.CanvasSize = UDim2.new(0, 39, 0, editor.TextBounds.Y)
	end)
end
coroutine.wrap(YLXUZDW_fake_script)()
local function LXUVMW_fake_script() -- Tabs.TabScript 
	local script = Instance.new('LocalScript', Tabs)

	local tab = 1
	function newTab(number)
		local tab = Instance.new("TextLabel")
		tab.Parent = script.Parent
		tab.Name = "Tab"..number
		tab.BackgroundColor3 = Color3.fromRGB(105,105,105)
		tab.BorderSizePixel = 0
		tab.Position = nil
		tab.Size = UDim2.new(0,65,0,18)
		tab.ZIndex = 1
		tab.Text = "  Script "..number.."  x"
	end
end
coroutine.wrap(LXUVMW_fake_script)()
local function CWFK_fake_script() -- Attach.AttachScript 
	local script = Instance.new('LocalScript', Attach)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Title.Text = "Synapse X - " .. getgenv().Version .. " (already injected!)"
		wait(2)
		script.Parent.Parent.Title.Text = "Synapse X - " .. getgenv().Version
	end)

end
coroutine.wrap(CWFK_fake_script)()
local function GXVFQZ_fake_script() -- Clear.ClearScript 
	local script = Instance.new('LocalScript', Clear)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Main.EditorScroll.Editor.Text = ""
	end)
end
coroutine.wrap(GXVFQZ_fake_script)()
local function WJPWT_fake_script() -- Execute.ExecuteScript 
	local script = Instance.new('LocalScript', Execute)

	script.Parent.MouseButton1Click:Connect(function()
		if string.lower(script.Parent.Parent.Main.EditorScroll.Editor.Text) == ":settings" then
			script.Parent.Parent.Parent.SettingsTopbar.Visible = true
		else
			loadstring(script.Parent.Parent.Main.EditorScroll.Editor.Text)()
		end
	end)
end
coroutine.wrap(WJPWT_fake_script)()
local function SFKLA_fake_script() -- ScriptHub.ScriptHubScript 
	local script = Instance.new('LocalScript', ScriptHub)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Text = "Starting..."
		wait(0.75)
		script.Parent.Text = "Script Hub"
		script.Parent.Parent.Parent.ScriptHubTopbar.Visible = true
	end)
end
coroutine.wrap(SFKLA_fake_script)()
local function KGKKURN_fake_script() -- SynapseLogo.LogoScript 
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
		end
	end)
end
coroutine.wrap(KGKKURN_fake_script)()
local function TUROK_fake_script() -- Minimize.MinScript 
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
coroutine.wrap(TUROK_fake_script)()
local function RDVJYSY_fake_script() -- Maximize.MaxScript 
	local script = Instance.new('LocalScript', Maximize)

	script.Parent.MouseButton1Click:Connect(function()
		local hint = Instance.new("Hint")
		hint.Parent = game.CoreGui[getgenv().sxiname]
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
coroutine.wrap(RDVJYSY_fake_script)()
local function SPTB_fake_script() -- Close.CloseScript 
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
coroutine.wrap(SPTB_fake_script)()
local function KVWH_fake_script() -- Topbar.MainScript 
	local script = Instance.new('LocalScript', Topbar)

	script.Parent.Active = true
	script.Parent.Draggable = true

	script.Parent.Minimize.BorderMode = Enum.BorderMode.Inset
	script.Parent.Maximize.BorderMode = Enum.BorderMode.Inset
	script.Parent.Close.BorderMode = Enum.BorderMode.Inset

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
	local buttons = { "Execute","Clear","OpenFile","ExecFile","SaveFile","Options","Attach","ScriptHub","Minimize","Maximize","Close" }
	for i,v in pairs(buttons) do
		script.Parent[v].MouseEnter:Connect(function()
			script.Parent[v].BackgroundColor3 = Color3.fromRGB(44, 61, 77)
			script.Parent[v].BorderSizePixel = 1
			if v == "Minimize" or "Maximize" or "Close" then
				script.Parent[v].BackgroundColor3 = Color3.fromRGB(52, 69, 85)
			end
		end)
		script.Parent[v].MouseLeave:Connect(function()
			script.Parent[v].BackgroundColor3 = Color3.fromRGB(60, 60, 60)
			script.Parent[v].BorderSizePixel = 0
		end)
	end

	wait(2)
	if isfile("settings.xi") then
		local data = game:GetService("HttpService"):JSONDecode(readfile("settings.xi"))
		script.Parent.Position = UDim2.new(data["Position"]["XScale"], data["Position"]["XOffset"], data["Position"]["YScale"], data["Position"]["YOffset"])
		script.Parent.Parent.OpenSynapse.SynapseOpen.Position = UDim2.new(data["OpenPosition"]["XScale"], data["OpenPosition"]["XOffset"], data["OpenPosition"]["YScale"], data["OpenPosition"]["YOffset"])
	end
end
coroutine.wrap(KVWH_fake_script)()
local function EVOVKY_fake_script() -- Close_2.LocalScript 
	local script = Instance.new('LocalScript', Close_2)

	script.Parent.MouseButton1Down:Connect(function()
		script.Parent.Parent.Visible = false
	end)
end
coroutine.wrap(EVOVKY_fake_script)()
local function IJXX_fake_script() -- CloseBG.LocalScript 
	local script = Instance.new('LocalScript', CloseBG)

	script.Parent.MouseEnter:Connect(function()
		script.Parent.BackgroundColor3 = Color3.fromRGB(232, 17, 35)
	end)
	script.Parent.MouseLeave:Connect(function()
		script.Parent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	end)
end
coroutine.wrap(IJXX_fake_script)()
local function YHZPUL_fake_script() -- TopbarCredits.LocalScript 
	local script = Instance.new('LocalScript', TopbarCredits)

	script.Parent.Visible = false
	script.Parent.Active = true
	script.Parent.Draggable = true
end
coroutine.wrap(YHZPUL_fake_script)()
local function TNRI_fake_script() -- Ok.LocalScript 
	local script = Instance.new('LocalScript', Ok)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Visible = false
	end)
	script.Parent.MouseButton1Down:Connect(function()
		script.Parent.Image = "http://www.roblox.com/asset/?id=6444451840"
	end)
	script.Parent.MouseButton1Up:Connect(function()
		script.Parent.Image = "http://www.roblox.com/asset/?id=6444452008"
	end)
end
coroutine.wrap(TNRI_fake_script)()
local function LUPS_fake_script() -- Menu.MenuScript 
	local script = Instance.new('LocalScript', Menu)

	getgenv().Script = ""
	script.Parent.Visible = false
	script.Parent.Execute.BorderMode = Enum.BorderMode.Inset
	script.Parent.Load.BorderMode = Enum.BorderMode.Inset
	local mouse = game.Players.LocalPlayer:GetMouse()

	script.Parent.Execute.MouseButton1Click:Connect(function()
		loadstring(getgenv().Script)()
		script.Parent.Visible = false
	end)
	script.Parent.Load.MouseButton1Click:Connect(function()
		script.Parent.Parent.Topbar.Main.EditorScroll.Editor.Text = getgenv().Script
		script.Parent.Visible = false
	end)
	mouse.Button1Down:Connect(function()
		script.Parent.Visible = false
	end)

	script.Parent.Execute.MouseEnter:Connect(function()
		script.Parent.Execute.BackgroundColor3 = Color3.fromRGB(89, 118, 132)
		script.Parent.Execute.BorderColor3 = Color3.fromRGB(58, 146, 183)
	end)

	script.Parent.Execute.MouseLeave:Connect(function()
		script.Parent.Execute.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
		script.Parent.Execute.BorderColor3 = Color3.fromRGB(105, 105, 105)
	end)

	script.Parent.Load.MouseEnter:Connect(function()
		script.Parent.Load.BackgroundColor3 = Color3.fromRGB(89, 118, 132)
		script.Parent.Load.BorderColor3 = Color3.fromRGB(58, 146, 183)
	end)

	script.Parent.Load.MouseLeave:Connect(function()
		script.Parent.Load.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
		script.Parent.Load.BorderColor3 = Color3.fromRGB(105, 105, 105)
	end)

end
coroutine.wrap(LUPS_fake_script)()
local function EGJGHT_fake_script() -- SynapseXI.MainController 
	local script = Instance.new('LocalScript', SynapseXI)

	print([[If you got an error, delete "settings.xi" in your workspace folder and rejoin.]])
	local mouse = game.Players.LocalPlayer:GetMouse()
	mouse.Button1Down:Connect(function()
		script.Parent.Menu.Visible = false
	end)

	getgenv().Version = game:HttpGet("https://pastebin.com/raw/f5aimzFS")

	script.Parent.Topbar.Title.Text = "Synapse X - "..getgenv().Version

end
coroutine.wrap(EGJGHT_fake_script)()
local function AVOG_fake_script() -- Close_3.BoxCloseScript 
	local script = Instance.new('LocalScript', Close_3)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Visible = false
	end)

	script.Parent.MouseEnter:Connect(function()
		script.Parent.BackgroundColor3 = Color3.fromRGB(44, 61, 77)
		script.Parent.BorderSizePixel = 1
	end)

	script.Parent.MouseLeave:Connect(function()
		script.Parent.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		script.Parent.BorderSizePixel = 0
	end)
end
coroutine.wrap(AVOG_fake_script)()
local function JVBRFBF_fake_script() -- Extension.ExtensionScript 
	local script = Instance.new('LocalScript', Extension)

	script.Parent.Parent.CustomExtension.Visible = false
	local ex = 1
	local CustomExtensionMode = false
	getgenv().extension = ".lua"
	--[[
		1 = .lua
		2 = .txt
		3 = .json
	]]

	script.Parent.MouseButton1Click:Connect(function()
		if ex == 1 then
			ex = 2
			script.Parent.Text = ".txt"
			getgenv().extension = ".txt"
		elseif ex == 2 then
			ex = 3
			script.Parent.Text = ".json"
			getgenv().extension = ".json"
		elseif ex == 3 then
			ex = 1
			script.Parent.Text = ".lua"
			getgenv().extension = ".lua"
		end
	end)
	script.Parent.Parent.CustomBtn.MouseButton1Click:Connect(function()
		if CustomExtensionMode == false then
			CustomExtensionMode = true
			script.Parent.Parent.CustomExtension.Visible = true
			script.Parent.Visible = false
			script.Parent.Parent.CustomBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
		elseif CustomExtensionMode == true then
			CustomExtensionMode = false
			script.Parent.Parent.CustomExtension.Visible = false
			script.Parent.Visible = true
			script.Parent.Parent.CustomBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
			if script.Parent.Text == ".txt" then
				getgenv().extension = ".txt"
			elseif script.Parent.Text == ".lua" then
				getgenv().extension = ".lua"
			elseif script.Parent.Text == ".json" then
				getgenv().extension = ".json"
			end
		end
	end)
	local badextensions = { ".exe",".scr",".bat",".com",".csh",".msi",".vb",".vbs",".vbe",".ws",".wsf",".wsh",".ps1",".psy",".xi" }
	local customex = script.Parent.Parent.CustomExtension
	script.Parent.Parent.CustomExtension.FocusLost:Connect(function()
		for i,v in pairs(badextensions) do
			if customex.Text == v then -- checks for blacklisted extensions
				script.Parent.Parent.Error.Text = "That extension is not allowed!"
				wait(1.5)
				script.Parent.Parent.Error.Text = ""
			elseif not string.match(customex.Text, ".") then -- checks if extension has a .
				script.Parent.Parent.Error.Text = "Invalid extension."
				wait(1.5)
				script.Parent.Parent.Error.Text = ""
			else
				if CustomExtensionMode and customex.Text ~= v then
					getgenv().extension = string.lower(customex.Text)
				end
			end
		end
	end)

	script.Parent.MouseEnter:Connect(function()
		script.Parent.BackgroundColor3 = Color3.fromRGB(44, 61, 77)
		script.Parent.BorderSizePixel = 1
	end)

	script.Parent.MouseLeave:Connect(function()
		script.Parent.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		script.Parent.BorderSizePixel = 0
	end)
end
coroutine.wrap(JVBRFBF_fake_script)()
local function UXBT_fake_script() -- Save.SaveScript 
	local script = Instance.new('LocalScript', Save)

	script.Parent.Parent.Visible = false
	script.Parent.Parent.Active = true
	script.Parent.Parent.Draggable = true
	local badextensions = { ".exe",".scr",".bat",".com",".csh",".msi",".vb",".vbs",".vbe",".ws",".wsf",".wsh",".ps1",".psy",".xi" }
	script.Parent.MouseButton1Click:Connect(function()
		if getgenv().Action == "Open" then
			if isfile(script.Parent.Parent.ScriptName.Text .. getgenv().extension) then
				local ss = readfile(script.Parent.Parent.ScriptName.Text .. getgenv().extension)
				game.CoreGui[getgenv().sxiname].Topbar.Main.EditorScroll.Editor.Text = tostring(ss)
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
				for i,v in pairs(badextensions) do
					if getgenv().extension == v then
						script.Parent.Parent.Error.Text = "That extension is not allowed!"
						wait(1.5)
						script.Parent.Parent.Error.Text = ""
					elseif getgenv().extension ~= v and getgenv().extension ~= ".xi" then
						pcall(function()
							writefile(script.Parent.Parent.ScriptName.Text .. getgenv().extension, "-- Saved with Synapse XI\n\n" .. game.CoreGui[getgenv().sxiname].Topbar.Main.EditorScroll.Editor.Text)
							script.Parent.Parent.Success.Text = "Saved as " .. script.Parent.Parent.ScriptName.Text .. getgenv().extension .. "!"
							wait(1.5)
							script.Parent.Parent.Success.Text = ""
						end)
					end
				end
			end
		end
	end)

	script.Parent.MouseEnter:Connect(function()
		script.Parent.BackgroundColor3 = Color3.fromRGB(44, 61, 77)
		script.Parent.BorderSizePixel = 1
	end)

	script.Parent.MouseLeave:Connect(function()
		script.Parent.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		script.Parent.BorderSizePixel = 0
	end)
end
coroutine.wrap(UXBT_fake_script)()
local function GVVF_fake_script() -- BoxTopbar.BoxScript 
	local script = Instance.new('LocalScript', BoxTopbar)

	script.Parent.Close.BorderMode = Enum.BorderMode.Inset
	script.Parent.Extension.BorderMode = Enum.BorderMode.Inset
	script.Parent.Save.BorderMode = Enum.BorderMode.Inset
end
coroutine.wrap(GVVF_fake_script)()
local function KYCL_fake_script() -- Main_3.OptionsScript2 
	local script = Instance.new('LocalScript', Main_3)

	local ON = "rbxassetid://6444393422"
	local OFF = "rbxassetid://6444393266"

	if isfile("settings.xi") then
		local data = game:GetService("HttpService"):JSONDecode(readfile("settings.xi"))
		getgenv().UnlockFps = data["Options"]["UnlockFps"]
		getgenv().AutoLaunch = data["Options"]["AutoLaunch"]
		getgenv().AutoAttach = data["Options"]["AutoAttach"]
		getgenv().FileClosing = data["Options"]["FileClosing"]
		getgenv().ClearEditor = data["Options"]["ClearEditor"]
		getgenv().InternalUI = data["Options"]["InternalUI"]
		getgenv().TopMost = data["Options"]["TopMost"]
		getgenv().AutoJoin = data["Options"]["AutoJoin"]
		if getgenv().UnlockFps == true then
			script.Parent.UnlockFps.Image = ON
		end
		if getgenv().AutoLaunch == true then
			script.Parent.AutoLaunch.Image = ON
		end
		if getgenv().AutoAttach == true then
			script.Parent.AutoAttach.Image = ON
		end
		if getgenv().FileClosing == true then
			script.Parent.FileClosing.Image = ON
		end
		if getgenv().ClearEditor == true then
			script.Parent.ClearEditor.Image = ON
		end
		if getgenv().InternalUI == true then
			script.Parent.InternalUI.Image = ON
		end
		if getgenv().TopMost == true then
			script.Parent.TopMost.Image = ON
		end
		if getgenv().AutoJoin == true then
			script.Parent.AutoJoin.Image = ON
		end
	else -- default settings
		getgenv().UnlockFps = false
		getgenv().AutoLaunch = false
		getgenv().AutoAttach = false
		getgenv().FileClosing = true
		getgenv().ClearEditor = true
		getgenv().InternalUI = false
		getgenv().TopMost = true
		getgenv().AutoJoin = true
		script.Parent.UnlockFps.Image = OFF
		script.Parent.AutoLaunch.Image = OFF
		script.Parent.AutoAttach.Image = OFF
		script.Parent.FileClosing.Image = ON
		script.Parent.ClearEditor.Image = ON
		script.Parent.InternalUI.Image = OFF
		script.Parent.TopMost.Image = ON
		script.Parent.AutoJoin.Image = ON
	end
	-- none of these actually work
	local options = { "UnlockFps","AutoLaunch","AutoAttach","FileClosing","ClearEditor","InternalUI","TopMost","AutoJoin" }
	for i,v in pairs(options) do
		script.Parent[v].MouseButton1Click:Connect(function()
			if getgenv()[v] == false then
				getgenv()[v] = true
				script.Parent[v].Image = ON
			elseif getgenv()[v] == true then
				getgenv()[v] = false
				script.Parent[v].Image = OFF
			end
		end)
	end
end
coroutine.wrap(KYCL_fake_script)()
local function CWOPJK_fake_script() -- OptionsTopbar.OptionsScript1 
	local script = Instance.new('LocalScript', OptionsTopbar)

	script.Parent.Visible = false
	script.Parent.Active = true
	script.Parent.Draggable = true
	script.Parent.DropdownBtn.BorderMode = Enum.BorderMode.Inset

	script.Parent.Parent.Topbar.Options.MouseButton1Click:Connect(function()
		script.Parent.Visible = true
	end)

	script.Parent.DropdownBtn.MouseEnter:Connect(function()
		script.Parent.DropdownBtn.BorderColor3 = Color3.fromRGB(134, 134, 134)
		script.Parent.DropdownBtn.ImageColor3 = Color3.fromRGB(138, 194, 243)
	end)
	script.Parent.DropdownBtn.MouseLeave:Connect(function()
		script.Parent.DropdownBtn.BorderColor3 = Color3.fromRGB(255, 255, 255)
		script.Parent.DropdownBtn.ImageColor3 = Color3.fromRGB(255, 255, 255)
	end)

	script.Parent.Main.ThemeName.MouseEnter:Connect(function()
		script.Parent.DropdownBtn.BorderColor3 = Color3.fromRGB(134, 134, 134)
		script.Parent.DropdownBtn.ImageColor3 = Color3.fromRGB(138, 194, 243)
	end)
	script.Parent.Main.ThemeName.MouseLeave:Connect(function()
		script.Parent.DropdownBtn.BorderColor3 = Color3.fromRGB(255, 255, 255)
		script.Parent.DropdownBtn.ImageColor3 = Color3.fromRGB(255, 255, 255)
	end)
end
coroutine.wrap(CWOPJK_fake_script)()
local function NRUMNC_fake_script() -- Close_4.CloseScript 
	local script = Instance.new('LocalScript', Close_4)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Visible = false
	end)

	script.Parent.MouseEnter:Connect(function()
		script.Parent.BackgroundColor3 = Color3.fromRGB(44, 61, 77)
		script.Parent.BorderSizePixel = 1
	end)

	script.Parent.MouseLeave:Connect(function()
		script.Parent.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		script.Parent.BorderSizePixel = 0
	end)
end
coroutine.wrap(NRUMNC_fake_script)()
local function KLRAJM_fake_script() -- SynapseOpen.Dragify 
	local script = Instance.new('LocalScript', SynapseOpen)

	local UIS = game:GetService("UserInputService")
	function dragify(Frame)
		dragToggle = nil
		local dragSpeed = 0.25
		dragInput = nil
		dragStart = nil
		local dragPos = nil
		function updateInput(input)
			local Delta = input.Position - dragStart
			local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
			game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.25), {Position = Position}):Play()
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

	dragify(script.Parent)
end
coroutine.wrap(KLRAJM_fake_script)()
local function MNVNNOE_fake_script() -- OpenSynapse.OpenSynapse 
	local script = Instance.new('LocalScript', OpenSynapse)

	if isfile("settings.xi") then
		local data = game:GetService("HttpService"):JSONDecode(readfile("settings.xi"))

		script.Parent.Position = UDim2.new(data["OpenPosition"])
	end

	script.Parent.Visible = false
	script.Parent.SynapseOpen.MouseButton1Click:Connect(function()
		script.Parent.Visible = false
		game.CoreGui[getgenv().sxiname].Topbar.Visible = true
	end)

	game.CoreGui[getgenv().sxiname].Topbar.Minimize.MouseButton1Click:Connect(function()
		script.Parent.Visible = true
	end)
end
coroutine.wrap(MNVNNOE_fake_script)()
local function KKRXBCZ_fake_script() -- SynapseXI.Configuration 
	local script = Instance.new('LocalScript', SynapseXI)

	script.Parent:SetAttribute("MadeBy","zzerexx#3970")
	if not isfile("settings.xi") then
		script.Parent.SettingsTopbar.TimeSaved.Text = "Saved at: nil"
	end
	while wait(5) do
		if getgenv().AutoSave == true then
			local XI = game.CoreGui[getgenv().sxiname]
			local TimeApi = game:GetService("HttpService"):JSONDecode(game:HttpGet("http://worldtimeapi.org/api/timezone/America/New_York"))
			local Time = TimeApi["datetime"]
			Time = Time:split(".") Time = Time[1]
			Time = Time:split("T")
			local Date = Time[1]
			Time = Time[2]
			local Settings = {
				["TimeSaved"] = tostring(Date..", "..Time),
				["Options"] = {
					["UnlockFps"] = getgenv().UnlockFps,
					["AutoLaunch"] = getgenv().AutoLaunch,
					["AutoAttach"] = getgenv().AutoAttach,
					["FileClosing"] = getgenv().FileClosing,
					["ClearEditor"] = getgenv().ClearEditor,
					["InternalUI"] = getgenv().InternalUI,
					["TopMost"] = getgenv().TopMost,
					["AutoJoin"] = getgenv().AutoJoin
				},
				["Settings2"] = {
					["LoadAnimation"] = getgenv().LoadAnimation,
					["AutoSave"] = getgenv().AutoSave,
					["Placeholder3"] = getgenv().Placeholder3,
					["Placeholder4"] = getgenv().Placeholder4,
					["Placeholder5"] = getgenv().Placeholder5,
					["Placeholder6"] = getgenv().Placeholder6,
					["Placeholder7"] = getgenv().Placeholder7,
					["Placeholder8"] = getgenv().Placeholder8,
				},
				["Position"] = {
					["XScale"] = XI.Topbar.Position.X.Scale,
					["XOffset"] = XI.Topbar.Position.X.Offset,
					["YScale"] = XI.Topbar.Position.Y.Scale,
					["YOffset"] = XI.Topbar.Position.Y.Offset,
				},
				["OpenPosition"] = {
					["XScale"] = XI.OpenSynapse.SynapseOpen.Position.X.Scale,
					["XOffset"] = XI.OpenSynapse.SynapseOpen.Position.X.Offset,
					["YScale"] = XI.OpenSynapse.SynapseOpen.Position.Y.Scale,
					["YOffset"] = XI.OpenSynapse.SynapseOpen.Position.Y.Offset,
				},
				["Editor"] = XI.Topbar.Main.EditorScroll.Editor.Text,
			}
			writefile("settings.xi", game:GetService("HttpService"):JSONEncode(Settings))
			local data = game:GetService("HttpService"):JSONDecode(readfile("settings.xi"))
			script.Parent.SettingsTopbar.TimeSaved.Text = "Saved at: "..data["TimeSaved"].." EST"
		end
	end
	-- :)
	local z = Instance.new("TextLabel", script.Parent)
	z.Name = "zzerexx#3970 was here"
	z.BackgroundTransparency = 1
	z.TextTransparency = 0.9
	z.AnchorPoint = Vector2.new(0,1)
	z.Position = UDim2.new(0.005,0,0.995,0)
	z.Size = UDim2.new(0,60,0,15)
	z.ZIndex = 100
	z.Font = Enum.Font.GothamBold
	z.Text = "zzerexx#3970"
	z.TextColor3 = Color3.fromRGB(255,255,255)
	z.TextSize = 20
	z.TextXAlignment = "Left"
end
coroutine.wrap(KKRXBCZ_fake_script)()
local function ZOXDMQH_fake_script() -- Bar.LoaderAnimation 
	local script = Instance.new('LocalScript', Bar)

	script.Parent.Parent.Visible = true
	-- Animation Length: 5 Seconds
	function load()
		script.Parent.Size = UDim2.new(0, 0, 0, 22)   -- Initializing...
		script.Parent.Parent.Text.Text = "Initializing..."
		wait(1.3)
		script.Parent.Size = UDim2.new(0, 97, 0, 22)  -- Checking whitelist...
		script.Parent.Parent.Text.Text = "Checking whitelist..."
		wait(0.75)
		script.Parent.Size = UDim2.new(0, 193, 0, 22) -- Downloading data...
		script.Parent.Parent.Text.Text = "Downloading data..."
		wait(0.6)
		script.Parent.Size = UDim2.new(0, 290, 0, 22) -- Checking data...
		script.Parent.Parent.Text.Text = "Checking data..."
		wait(0.85)
		script.Parent.Size = UDim2.new(0, 387, 0, 22) -- Ready to launch!
		script.Parent.Parent.Text.Text = "Ready to launch!"
		wait(1.5)
		script.Parent.Parent.Visible = false
		game.CoreGui[getgenv().sxiname].Topbar.Visible = true
	end
	if isfile("settings.xi") then
		local data = game:GetService("HttpService"):JSONDecode(readfile("settings.xi"))
		getgenv().LoadAnimation = data["Settings2"]["LoadAnimation"]
		if getgenv().LoadAnimation == true then
			script.Parent.Parent.Visible = true
			game.CoreGui[getgenv().sxiname].Topbar.Visible = false
			load()
		else
			script.Parent.Parent.Visible = false
			game.CoreGui[getgenv().sxiname].Topbar.Visible = true
		end
	else
		getgenv().LoadAnimation = true
		if getgenv().LoadAnimation == true then
			script.Parent.Parent.Visible = true
			game.CoreGui[getgenv().sxiname].Topbar.Visible = false
			load()
		end
	end
end
coroutine.wrap(ZOXDMQH_fake_script)()
local function VCCLIC_fake_script() -- Main_4.SettingsScript2 
	local script = Instance.new('LocalScript', Main_4)

	local ON = "rbxassetid://6444393422"
	local OFF = "rbxassetid://6444393266"

	if isfile("settings.xi") then
		local data = game:GetService("HttpService"):JSONDecode(readfile("settings.xi"))
		getgenv().LoadAnimation = data["Settings2"]["LoadAnimation"]
		getgenv().AutoSave = data["Settings2"]["AutoSave"]
		getgenv().Placeholder3 = data["Settings2"]["Placeholder3"]
		getgenv().Placeholder4 = data["Settings2"]["Placeholder4"]
		getgenv().Placeholder5 = data["Settings2"]["Placeholder5"]
		getgenv().Placeholder6 = data["Settings2"]["Placeholder6"]
		getgenv().Placeholder7 = data["Settings2"]["Placeholder7"]
		getgenv().Placeholder8 = data["Settings2"]["Placeholder8"]
		if getgenv().LoadAnimation == true then
			script.Parent.LoadAnimation.Image = ON
		end
		if getgenv().AutoSave == true then
			script.Parent.AutoSave.Image = ON
		end
		if getgenv().Placeholder3 == true then
			script.Parent.Placeholder3.Image = ON
		end
		if getgenv().Placeholder4 == true then
			script.Parent.Placeholder4.Image = ON
		end
		if getgenv().Placeholder5 == true then
			script.Parent.Placeholder5.Image = ON
		end
		if getgenv().Placeholder6 == true then
			script.Parent.Placeholder6.Image = ON
		end
		if getgenv().Placeholder7 == true then
			script.Parent.Placeholder7.Image = ON
		end
		if getgenv().Placeholder8 == true then
			script.Parent.Placeholder8.Image = ON
		end
	else -- default settings
		getgenv().LoadAnimation = true
		getgenv().AutoSave = true
		getgenv().Placeholder3 = false
		getgenv().Placeholder4 = false
		getgenv().Placeholder5 = false
		getgenv().Placeholder6 = false
		getgenv().Placeholder7 = false
		getgenv().Placeholder8 = false
		script.Parent.LoadAnimation.Image = ON
		script.Parent.AutoSave.Image = ON
		script.Parent.Placeholder3.Image = OFF
		script.Parent.Placeholder4.Image = OFF
		script.Parent.Placeholder5.Image = OFF
		script.Parent.Placeholder6.Image = OFF
		script.Parent.Placeholder7.Image = OFF
		script.Parent.Placeholder8.Image = OFF
	end
	local settings2 = { "LoadAnimation","AutoSave","Placeholder3","Placeholder4","Placeholder5","Placeholder6","Placeholder7","Placeholder8" }
	for i,v in pairs(settings2) do
		script.Parent[v].MouseButton1Click:Connect(function()
			if getgenv()[v] == false then
				getgenv()[v] = true
				script.Parent[v].Image = ON
			elseif getgenv()[v] == true then
				getgenv()[v] = false
				script.Parent[v].Image = OFF
			end
		end)
	end
end
coroutine.wrap(VCCLIC_fake_script)()
local function GWBAEG_fake_script() -- SettingsTopbar.SettingsScript1 
	local script = Instance.new('LocalScript', SettingsTopbar)

	script.Parent.Visible = false
	script.Parent.Active = true
	script.Parent.Draggable = true

	if isfile("settings.xi") then
		local data = game:GetService("HttpService"):JSONDecode(readfile("settings.xi"))
		script.Parent.TimeSaved.Text = "Saved at: "..data["TimeSaved"].." EST"
	end
end
coroutine.wrap(GWBAEG_fake_script)()
local function YHMDPJS_fake_script() -- Close_5.LocalScript 
	local script = Instance.new('LocalScript', Close_5)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Visible = false
	end)

	script.Parent.MouseEnter:Connect(function()
		script.Parent.BackgroundColor3 = Color3.fromRGB(44, 61, 77)
		script.Parent.BorderSizePixel = 1
	end)

	script.Parent.MouseLeave:Connect(function()
		script.Parent.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		script.Parent.BorderSizePixel = 0
	end)
end
coroutine.wrap(YHMDPJS_fake_script)()
local function FOBEP_fake_script() -- Save_2.SaveConfigScript 
	local script = Instance.new('LocalScript', Save_2)

	script.Parent.MouseButton1Click:Connect(function()
		local XI = game.CoreGui[getgenv().sxiname]
		local TimeApi = game:GetService("HttpService"):JSONDecode(game:HttpGet("http://worldtimeapi.org/api/timezone/America/New_York"))
		local Time = TimeApi["datetime"]
		Time = Time:split(".") Time = Time[1]
		Time = Time:split("T")
		local Date = Time[1]
		Time = Time[2]
		local Settings = {
			["TimeSaved"] = tostring(Date..", "..Time),
			["Options"] = {
				["UnlockFps"] = getgenv().UnlockFps,
				["AutoLaunch"] = getgenv().AutoLaunch,
				["AutoAttach"] = getgenv().AutoAttach,
				["FileClosing"] = getgenv().FileClosing,
				["ClearEditor"] = getgenv().ClearEditor,
				["InternalUI"] = getgenv().InternalUI,
				["TopMost"] = getgenv().TopMost,
				["AutoJoin"] = getgenv().AutoJoin
			},
			["Settings2"] = {
				["LoadAnimation"] = getgenv().LoadAnimation,
				["AutoSave"] = getgenv().AutoSave,
				["Placeholder3"] = getgenv().Placeholder3,
				["Placeholder4"] = getgenv().Placeholder4,
				["Placeholder5"] = getgenv().Placeholder5,
				["Placeholder6"] = getgenv().Placeholder6,
				["Placeholder7"] = getgenv().Placeholder7,
				["Placeholder8"] = getgenv().Placeholder8,
			},
			["Position"] = {
				["XScale"] = XI.Topbar.Position.X.Scale,
				["XOffset"] = XI.Topbar.Position.X.Offset,
				["YScale"] = XI.Topbar.Position.Y.Scale,
				["YOffset"] = XI.Topbar.Position.Y.Offset,
			},
			["OpenPosition"] = {
				["XScale"] = XI.OpenSynapse.SynapseOpen.Position.X.Scale,
				["XOffset"] = XI.OpenSynapse.SynapseOpen.Position.X.Offset,
				["YScale"] = XI.OpenSynapse.SynapseOpen.Position.Y.Scale,
				["YOffset"] = XI.OpenSynapse.SynapseOpen.Position.Y.Offset,
			},
			["Editor"] = XI.Topbar.Main.EditorScroll.Editor.Text,
		}
		writefile("settings.xi", game:GetService("HttpService"):JSONEncode(Settings))
		local data = game:GetService("HttpService"):JSONDecode(readfile("settings.xi"))
		script.Parent.Parent.TimeSaved.Text = "Saved at: "..data["TimeSaved"].." EST"
	end)

	script.Parent.MouseEnter:Connect(function()
		script.Parent.BackgroundColor3 = Color3.fromRGB(44, 61, 77)
		script.Parent.BorderSizePixel = 1
	end)

	script.Parent.MouseLeave:Connect(function()
		script.Parent.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		script.Parent.BorderSizePixel = 0
	end)
end
coroutine.wrap(FOBEP_fake_script)()
local function GKQHN_fake_script() -- ScriptsBox.ScriptsBoxScripts 
	local script = Instance.new('LocalScript', ScriptsBox)

	local stuff = {
		Selected = { DarkDex = false,UnnamedEsp = false,RemoteSpy = false,ScriptDumper = false },
		Images = { DarkDex = "rbxassetid://6444388463",UnnamedEsp = "rbxassetid://6444388545",RemoteSpy = "rbxassetid://6444388640",ScriptDumper = "rbxassetid://6444388772" },
		Descriptions = { DarkDex = "A version of the popular Dex explorer with patches specifically for Synapse X.",UnnamedEsp = "ESP Made by ic3w0lf using the Drawing API.",RemoteSpy = "Allows you to view RemoteEvents and RemoteFunctions called.",ScriptDumper = "Dumps all LocalScripts and ModuleScripts." },
		scriptnames = { "DarkDex","UnnamedEsp","RemoteSpy","ScriptDumper" },
		scripts = {
			DarkDex = [[local a=rawget(game:GetObjects("rbxassetid://3567096419"),0X1)if type(syn)=="table"and type(syn.protect_gui)=="function"then xpcall(syn.protect_gui,warn,a)end;a.Name,a.Parent="SynapseDex",game:GetService("CoreGui")function Load(b)if b:IsA("Script")then xpcall(coroutine.wrap(function()local c,d,e,f={},{},{script=b},loadstring(b.Source,"="..b:GetFullName())d.__index=function(g,h)if e[h]==nil then return getfenv()[h]else return e[h]end end;d.__newindex=function(g,h,i)if e[h]==nil then getfenv()[h]=i else e[h]=i end end;setmetatable(c,d)setfenv(f,c)return f()end),warn)end;for j,k in pairs(b:GetChildren())do xpcall(Load,warn,k)end end;xpcall(Load,warn,a)]],
			UnnamedEsp = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"))()]],
			RemoteSpy = [[loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()]],
			ScriptDumper = [[print("Making folder.")makefolder(game.PlaceId)print("Collecting scripts.")local a=getscripts()local b=0;local c=0;local d=tick()print("Decompiling scripts.")for e,f in pairs(a)do if b==5 then repeat wait()until b~=5 end;coroutine.resume(coroutine.create(function()c=c+1;print("Decompiling",f.Name,c.."/"..#a)writefile(game.PlaceId.."/"..f.Name.." "..c..".lua",decompile(f))b=b-1 end))b=b+1 end;print("Writing info.md")writefile(game.PlaceId.."/".."!info.md","Decompiled "..game.PlaceId..".\n"..c.." scripts were decompiled.\nTook "..math.floor(tick()-d).." seconds.".."\nScript Dumper made by ToddDev#9610")print("Successfully dumped in "..math.floor(tick()-d).." seconds.")print("Script Dumper made by ToddDev#9610")]],
		}
	}
	-- Remote Spy    : https://v3rmillion.net/showthread.php?tid=940660
	-- Script Dumper : https://v3rmillion.net/showthread.php?tid=1013629
	-- remote spy and script dumper are different because i cant find the same one in the synapse script hub
	local SCRIPT = nil
	script.Parent.Parent.Minimize.BorderMode = Enum.BorderMode.Inset
	script.Parent.Parent.Main.Image.ImageTransparency = 1
	script.Parent.Parent.DescriptionBox.Description.Text = ""
	script.Parent.DarkDex.BackgroundTransparency = 0
	script.Parent.UnnamedEsp.BackgroundTransparency = 0
	script.Parent.RemoteSpy.BackgroundTransparency = 0
	script.Parent.ScriptDumper.BackgroundTransparency = 0

	script.Parent.DarkDex.BorderSizePixel = 1
	script.Parent.UnnamedEsp.BorderSizePixel = 1
	script.Parent.RemoteSpy.BorderSizePixel = 1
	script.Parent.ScriptDumper.BorderSizePixel = 1

	script.Parent.DarkDex.BorderColor3 = Color3.fromRGB(30, 30, 30)
	script.Parent.UnnamedEsp.BorderColor3 = Color3.fromRGB(30, 30, 30)
	script.Parent.RemoteSpy.BorderColor3 = Color3.fromRGB(30, 30, 30)
	script.Parent.ScriptDumper.BorderColor3 = Color3.fromRGB(30, 30, 30)

	script.Parent.DarkDex.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	script.Parent.UnnamedEsp.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	script.Parent.RemoteSpy.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	script.Parent.ScriptDumper.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

	script.Parent.DarkDex.BorderMode = Enum.BorderMode.Inset
	script.Parent.UnnamedEsp.BorderMode = Enum.BorderMode.Inset
	script.Parent.RemoteSpy.BorderMode = Enum.BorderMode.Inset
	script.Parent.ScriptDumper.BorderMode = Enum.BorderMode.Inset

	local mouse = game.Players.LocalPlayer:GetMouse()
	mouse.Button1Down:Connect(function()
		script.Parent.DarkDex.BorderColor3 = Color3.fromRGB(30, 30, 30)
		script.Parent.UnnamedEsp.BorderColor3 = Color3.fromRGB(30, 30, 30)
		script.Parent.RemoteSpy.BorderColor3 = Color3.fromRGB(30, 30, 30)
		script.Parent.ScriptDumper.BorderColor3 = Color3.fromRGB(30, 30, 30)

		script.Parent.DarkDex.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		script.Parent.UnnamedEsp.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		script.Parent.RemoteSpy.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		script.Parent.ScriptDumper.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	end)
	mouse.Button2Down:Connect(function()
		stuff.Selected.DarkDex = false
		stuff.Selected.UnnamedEsp = false
		stuff.Selected.RemoteSpy = false
		stuff.Selected.ScriptDumper = false
		SCRIPT = nil
		script.Parent.DarkDex.BorderColor3 = Color3.fromRGB(30, 30, 30)
		script.Parent.UnnamedEsp.BorderColor3 = Color3.fromRGB(30, 30, 30)
		script.Parent.RemoteSpy.BorderColor3 = Color3.fromRGB(30, 30, 30)
		script.Parent.ScriptDumper.BorderColor3 = Color3.fromRGB(30, 30, 30)

		script.Parent.DarkDex.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		script.Parent.UnnamedEsp.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		script.Parent.RemoteSpy.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		script.Parent.ScriptDumper.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	end)

	for i,v in pairs(stuff.scriptnames) do
		script.Parent[v].MouseButton1Down:Connect(function()
			for i2,v2 in pairs(stuff.scriptnames) do
				stuff.Selected[v2] = false
			end
			stuff.Selected[v] = true
			script.Parent.Parent.Main.Image.ImageTransparency = 0
			script.Parent.Parent.Main.Image.Image = stuff.Images[v]
			script.Parent.Parent.DescriptionBox.Description.Text = stuff.Descriptions[v]
			script.Parent[v].ZIndex = 4
			script.Parent[v].BorderColor3 = Color3.fromRGB(38, 160, 218)
			script.Parent[v].BackgroundColor3 = Color3.fromRGB(32, 61, 75)
			for i2,v2 in pairs(stuff.scriptnames) do
				if v2 ~= v then
					script.Parent[v2].ZIndex = 3
					script.Parent[v2].BorderColor3 = Color3.fromRGB(30, 30, 30)
					script.Parent[v2].BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					SCRIPT = stuff.scripts[v]
				end
			end
		end)
	end
	for i,v in pairs(stuff.scriptnames) do
		script.Parent[v].MouseEnter:Connect(function()
			if stuff.Selected[v] == false then
				script.Parent[v].BorderColor3 = Color3.fromRGB(35, 115, 154)
				script.Parent[v].BackgroundColor3 = Color3.fromRGB(31, 45, 53)
			end
		end)
		script.Parent[v].MouseLeave:Connect(function()
			if stuff.Selected[v] == false then
				script.Parent[v].BorderColor3 = Color3.fromRGB(30, 30, 30)
				script.Parent[v].BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			end
		end)
	end
	script.Parent.Parent.Execute.MouseButton1Click:Connect(function()
		for i,v in pairs(stuff.scriptnames) do
			if stuff.Selected[v] then
				script.Parent[v].BorderColor3 = Color3.fromRGB(218, 218, 218)
				script.Parent[v].BackgroundColor3 = Color3.fromRGB(75, 75, 75)
			end
		end
		if SCRIPT == nil then
			print("There's no script selected!")
		else
			script.Parent.Parent.Execute.Text = "Executing..."
			wait(0.35)
			loadstring(SCRIPT)()
			script.Parent.Parent.Execute.Text = "Execute"
		end
	end)
	script.Parent.Parent.Close.MouseButton1Click:Connect(function()
		script.Parent.Parent.Visible = false
		SCRIPT = nil
		script.Parent.Parent.Main.Image.ImageTransparency = 1
		script.Parent.Parent.DescriptionBox.Description.Text = ""
		script.Parent.DarkDex.BackgroundTransparency = 0
		script.Parent.UnnamedEsp.BackgroundTransparency = 0
		script.Parent.RemoteSpy.BackgroundTransparency = 0
		script.Parent.ScriptDumper.BackgroundTransparency = 0

		script.Parent.DarkDex.BorderSizePixel = 1
		script.Parent.UnnamedEsp.BorderSizePixel = 1
		script.Parent.RemoteSpy.BorderSizePixel = 1
		script.Parent.ScriptDumper.BorderSizePixel = 1

		script.Parent.DarkDex.BorderColor3 = Color3.fromRGB(30, 30, 30)
		script.Parent.UnnamedEsp.BorderColor3 = Color3.fromRGB(30, 30, 30)
		script.Parent.RemoteSpy.BorderColor3 = Color3.fromRGB(30, 30, 30)
		script.Parent.ScriptDumper.BorderColor3 = Color3.fromRGB(30, 30, 30)

		script.Parent.DarkDex.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		script.Parent.UnnamedEsp.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		script.Parent.RemoteSpy.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		script.Parent.ScriptDumper.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	end)
end
coroutine.wrap(GKQHN_fake_script)()
local function BGIY_fake_script() -- Minimize_2.MinScript 
	local script = Instance.new('LocalScript', Minimize_2)

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
coroutine.wrap(BGIY_fake_script)()
local function XRCOF_fake_script() -- ScriptHubTopbar.ScriptHubScript 
	local script = Instance.new('LocalScript', ScriptHubTopbar)

	script.Parent.Visible = false
	script.Parent.Active = true
	script.Parent.Draggable = true

	local buttons = { "Close","Execute","Minimize" }
	for i,v in pairs(buttons) do
		script.Parent[v].MouseEnter:Connect(function()
			script.Parent[v].BackgroundColor3 = Color3.fromRGB(44, 61, 77)
			script.Parent[v].BorderSizePixel = 1
		end)

		script.Parent[v].MouseLeave:Connect(function()
			script.Parent[v].BackgroundColor3 = Color3.fromRGB(60, 60, 60)
			script.Parent[v].BorderSizePixel = 0
		end)
	end
end
coroutine.wrap(XRCOF_fake_script)()
