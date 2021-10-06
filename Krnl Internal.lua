-- Gui to Lua
-- Version: 3.2

-- Instances:

local KRNL = Instance.new("ScreenGui")
local Topbar = Instance.new("Frame")
local Main = Instance.new("Frame")
local Tabs = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local File = Instance.new("Frame")
local File_2 = Instance.new("TextButton")
local Dropdown = Instance.new("Frame")
local UIListLayout_2 = Instance.new("UIListLayout")
local Inject = Instance.new("TextButton")
local KillRoblox = Instance.new("TextButton")
local Credits = Instance.new("Frame")
local Credits_2 = Instance.new("TextButton")
local Games = Instance.new("Frame")
local Games_2 = Instance.new("TextButton")
local HotScripts = Instance.new("Frame")
local HotScripts_2 = Instance.new("TextButton")
local Dropdown_2 = Instance.new("Frame")
local UIListLayout_3 = Instance.new("UIListLayout")
local DarkDex = Instance.new("TextButton")
local OpenGui = Instance.new("TextButton")
local RemoteSpy = Instance.new("TextButton")
local GameSense = Instance.new("TextButton")
local UnnamedESP = Instance.new("TextButton")
local InfiniteYield = Instance.new("TextButton")
local CMDX = Instance.new("TextButton")
local space = Instance.new("Frame")
local Others = Instance.new("Frame")
local Others_2 = Instance.new("TextButton")
local Dropdown_3 = Instance.new("Frame")
local UIListLayout_4 = Instance.new("UIListLayout")
local GetKey = Instance.new("TextButton")
local Discord = Instance.new("TextButton")
local BlueLine = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ScriptsBox = Instance.new("ScrollingFrame")
local UIListLayout_5 = Instance.new("UIListLayout")
local Example = Instance.new("TextButton")
local Execute = Instance.new("TextButton")
local Clear = Instance.new("TextButton")
local OpenFile = Instance.new("TextButton")
local SaveFile = Instance.new("TextButton")
local Inject_2 = Instance.new("TextButton")
local Options = Instance.new("TextButton")
local Editor = Instance.new("Frame")
local Line = Instance.new("Frame")
local EditorScroll = Instance.new("ScrollingFrame")
local Editor_2 = Instance.new("TextBox")
local NumberScroll = Instance.new("ScrollingFrame")
local Numbers = Instance.new("TextLabel")
local OptionsBox = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Main_2 = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Install = Instance.new("TextButton")
local InstallText = Instance.new("TextLabel")
local Toggle_Monaco = Instance.new("TextButton")
local Circle = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local UICorner_4 = Instance.new("UICorner")
local MonacoText = Instance.new("TextLabel")
local CrashLogsText = Instance.new("TextLabel")
local Toggle_CrashLogs = Instance.new("TextButton")
local Circle_2 = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local UICorner_6 = Instance.new("UICorner")
local OpacityText = Instance.new("TextLabel")
local Toggle_Opacity = Instance.new("TextButton")
local Circle_3 = Instance.new("Frame")
local UICorner_7 = Instance.new("UICorner")
local UICorner_8 = Instance.new("UICorner")
local TopMostText = Instance.new("TextLabel")
local AutoAttachText = Instance.new("TextLabel")
local Toggle_AutoAttach = Instance.new("TextButton")
local Circle_4 = Instance.new("Frame")
local UICorner_9 = Instance.new("UICorner")
local UICorner_10 = Instance.new("UICorner")
local Toggle_TopMost = Instance.new("TextButton")
local Circle_5 = Instance.new("Frame")
local UICorner_11 = Instance.new("UICorner")
local UICorner_12 = Instance.new("UICorner")
local Line_2 = Instance.new("Frame")
local Logo = Instance.new("ImageLabel")
local Title_2 = Instance.new("TextLabel")
local Fill = Instance.new("Frame")
local Close = Instance.new("ImageButton")
local Minimize = Instance.new("ImageButton")
local Logo_2 = Instance.new("ImageLabel")
local Close_2 = Instance.new("ImageButton")
local Minimize_2 = Instance.new("ImageButton")
local ScriptTabs = Instance.new("Frame")
local UIListLayout_6 = Instance.new("UIListLayout")
local Example1 = Instance.new("Frame")
local Close_3 = Instance.new("TextButton")
local Selecter = Instance.new("TextButton")
local NewTab = Instance.new("ImageButton")
local Fill_2 = Instance.new("Frame")
local CreditsBox = Instance.new("Frame")
local Main_3 = Instance.new("Frame")
local Close_4 = Instance.new("ImageButton")
local ImageLabel = Instance.new("ImageLabel")
local _1 = Instance.new("TextLabel")
local _2 = Instance.new("TextLabel")
local _3 = Instance.new("TextLabel")
local _4 = Instance.new("TextLabel")
local _5 = Instance.new("TextLabel")
local _6 = Instance.new("TextLabel")
local Filesystem = Instance.new("Frame")
local Main_4 = Instance.new("Frame")
local UICorner_13 = Instance.new("UICorner")
local FileName = Instance.new("TextBox")
local Extension = Instance.new("TextBox")
local Button = Instance.new("TextButton")
local Success = Instance.new("TextLabel")
local Error = Instance.new("TextLabel")
local UICorner_14 = Instance.new("UICorner")
local Fill_3 = Instance.new("Frame")
local Title_3 = Instance.new("TextLabel")
local Close_5 = Instance.new("ImageButton")
local Line_3 = Instance.new("Frame")
local Open = Instance.new("ImageButton")
local UICorner_15 = Instance.new("UICorner")
local ScriptsDropdown = Instance.new("Frame")
local UIListLayout_7 = Instance.new("UIListLayout")
local Execute_2 = Instance.new("TextButton")
local Load = Instance.new("TextButton")
local Delete = Instance.new("TextButton")
local Change = Instance.new("TextButton")
local Reload = Instance.new("TextButton")

local Injected = Instance.new("BoolValue")
local PermaKey = Instance.new("StringValue")
local Version = Instance.new("StringValue")
local InternalVersion = Instance.new("StringValue")
local Current = Instance.new("StringValue")
local Action = Instance.new("StringValue")
local DiscordUrl = Instance.new("StringValue")
local KeyUrl = Instance.new("StringValue")
local Name = Instance.new("StringValue")
local Number = Instance.new("NumberValue")
local Source = Instance.new("StringValue")
local CurrentTab = Instance.new("NumberValue")
local SelectedScript = Instance.new("ObjectValue")

Injected.Name = "Injected"
Injected.Parent = KRNL
Injected.Value = false

PermaKey.Name = "PermaKey"
PermaKey.Parent = KRNL
PermaKey.Value = "key"

local ver = game:HttpGet("https://cdn.krnl.ca/version.txt"):split("")
Version.Name = "Version"
Version.Parent = KRNL
Version.Value = "v"..ver[1].."."..ver[2].."."..ver[3]..ver[4]..ver[5]:lower()

InternalVersion.Name = "InternalVersion"
InternalVersion.Parent = KRNL
InternalVersion.Value = "v1.0.0"

Current.Name = "Current"
Current.Parent = Tabs
Current.Value = ""

Action.Name = "Action"
Action.Parent = Filesystem
Action.Value = "Open File"

DiscordUrl.Name = "DiscordUrl"
DiscordUrl.Parent = KRNL
DiscordUrl.Value = "https://krnl.ca/invite"

KeyUrl.Name = "KeyUrl"
KeyUrl.Parent = KRNL
KeyUrl.Value = "https://cdn.krnl.ca/getkey.php"

Name.Name = "Name"
Name.Parent = Example1
Name.Value = "Untitled.lua"

Number.Name = "Number"
Number.Parent = Example1
Number.Value = 0

Source.Name = "Source"
Source.Parent = Example1
Source.Value = ""

CurrentTab.Name = "CurrentTab"
CurrentTab.Parent = Topbar
CurrentTab.Value = 0

SelectedScript.Name = "SelectedScript"
SelectedScript.Parent = KRNL 
SelectedScript.Value = nil

--Properties:

KRNL.Name = "KRNL"
KRNL.Parent = game.CoreGui

Topbar.Name = "Topbar"
Topbar.Parent = KRNL
Topbar.Active = true
Topbar.AnchorPoint = Vector2.new(0.5, 0)
Topbar.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Topbar.BorderSizePixel = 0
Topbar.Position = UDim2.new(0.5, 0, 0.300000012, 0)
Topbar.Size = UDim2.new(0, 690, 0, 33)

Main.Name = "Main"
Main.Parent = Topbar
Main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Main.BorderSizePixel = 0
Main.Size = UDim2.new(0, 690, 0, 350)
Main.ZIndex = 0

Tabs.Name = "Tabs"
Tabs.Parent = Topbar
Tabs.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
Tabs.BorderSizePixel = 0
Tabs.Position = UDim2.new(0, 0, 1, 0)
Tabs.Size = UDim2.new(0, 690, 0, 24)

UIListLayout.Parent = Tabs
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

File.Name = "File"
File.Parent = Tabs
File.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
File.BackgroundTransparency = 1.000
File.LayoutOrder = 1
File.Size = UDim2.new(0, 41, 0, 24)
File.ZIndex = 2

File_2.Name = "File"
File_2.Parent = File
File_2.AnchorPoint = Vector2.new(0.5, 0.5)
File_2.BackgroundColor3 = Color3.fromRGB(181, 215, 243)
File_2.BackgroundTransparency = 1.000
File_2.BorderColor3 = Color3.fromRGB(0, 120, 215)
File_2.Position = UDim2.new(0.5, 0, 0.5, 0)
File_2.Size = UDim2.new(0, 35, 0, 18)
File_2.ZIndex = 2
File_2.AutoButtonColor = false
File_2.Font = Enum.Font.SourceSans
File_2.Text = "File"
File_2.TextColor3 = Color3.fromRGB(255, 255, 255)
File_2.TextSize = 15.000

Dropdown.Name = "Dropdown"
Dropdown.Parent = File_2
Dropdown.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
Dropdown.BorderColor3 = Color3.fromRGB(40, 40, 40)
Dropdown.BorderSizePixel = 0
Dropdown.Position = UDim2.new(0, 0, 1, 0)
Dropdown.Size = UDim2.new(0, 127, 0, 44)
Dropdown.Visible = false
Dropdown.ZIndex = 3

UIListLayout_2.Parent = Dropdown
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

Inject.Name = "Inject"
Inject.Parent = Dropdown
Inject.BackgroundColor3 = Color3.fromRGB(181, 215, 243)
Inject.BackgroundTransparency = 1.000
Inject.BorderColor3 = Color3.fromRGB(0, 120, 215)
Inject.Position = UDim2.new(0.441379309, 0, 1.31818175, 0)
Inject.Size = UDim2.new(0, 127, 0, 22)
Inject.ZIndex = 4
Inject.AutoButtonColor = false
Inject.Font = Enum.Font.SourceSans
Inject.Text = "                  Inject"
Inject.TextColor3 = Color3.fromRGB(255, 255, 255)
Inject.TextSize = 14.000
Inject.TextXAlignment = Enum.TextXAlignment.Left

KillRoblox.Name = "KillRoblox"
KillRoblox.Parent = Dropdown
KillRoblox.BackgroundColor3 = Color3.fromRGB(181, 215, 243)
KillRoblox.BackgroundTransparency = 1.000
KillRoblox.BorderColor3 = Color3.fromRGB(0, 120, 215)
KillRoblox.Position = UDim2.new(0.441379309, 0, 1.31818175, 0)
KillRoblox.Size = UDim2.new(0, 127, 0, 22)
KillRoblox.ZIndex = 4
KillRoblox.AutoButtonColor = false
KillRoblox.Font = Enum.Font.SourceSans
KillRoblox.Text = "                  Kill Roblox"
KillRoblox.TextColor3 = Color3.fromRGB(255, 255, 255)
KillRoblox.TextSize = 14.000
KillRoblox.TextXAlignment = Enum.TextXAlignment.Left

Credits.Name = "Credits"
Credits.Parent = Tabs
Credits.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credits.BackgroundTransparency = 1.000
Credits.LayoutOrder = 2
Credits.Size = UDim2.new(0, 54, 0, 24)
Credits.ZIndex = 2

Credits_2.Name = "Credits"
Credits_2.Parent = Credits
Credits_2.AnchorPoint = Vector2.new(0.5, 0.5)
Credits_2.BackgroundColor3 = Color3.fromRGB(181, 215, 243)
Credits_2.BackgroundTransparency = 1.000
Credits_2.BorderColor3 = Color3.fromRGB(0, 120, 215)
Credits_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Credits_2.Size = UDim2.new(0, 54, 0, 18)
Credits_2.ZIndex = 2
Credits_2.AutoButtonColor = false
Credits_2.Font = Enum.Font.SourceSans
Credits_2.Text = "Credits"
Credits_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Credits_2.TextSize = 15.000

Games.Name = "Games"
Games.Parent = Tabs
Games.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Games.BackgroundTransparency = 1.000
Games.LayoutOrder = 3
Games.Size = UDim2.new(0, 56, 0, 24)
Games.ZIndex = 2

Games_2.Name = "Games"
Games_2.Parent = Games
Games_2.AnchorPoint = Vector2.new(0.5, 0.5)
Games_2.BackgroundColor3 = Color3.fromRGB(181, 215, 243)
Games_2.BackgroundTransparency = 1.000
Games_2.BorderColor3 = Color3.fromRGB(0, 120, 215)
Games_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Games_2.Size = UDim2.new(0, 53, 0, 18)
Games_2.ZIndex = 2
Games_2.AutoButtonColor = false
Games_2.Font = Enum.Font.SourceSans
Games_2.Text = "Games"
Games_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Games_2.TextSize = 15.000

HotScripts.Name = "HotScripts"
HotScripts.Parent = Tabs
HotScripts.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HotScripts.BackgroundTransparency = 1.000
HotScripts.LayoutOrder = 4
HotScripts.Size = UDim2.new(0, 82, 0, 24)
HotScripts.ZIndex = 2

HotScripts_2.Name = "HotScripts"
HotScripts_2.Parent = HotScripts
HotScripts_2.AnchorPoint = Vector2.new(0.5, 0.5)
HotScripts_2.BackgroundColor3 = Color3.fromRGB(181, 215, 243)
HotScripts_2.BackgroundTransparency = 1.000
HotScripts_2.BorderColor3 = Color3.fromRGB(0, 120, 215)
HotScripts_2.Position = UDim2.new(0.5, 0, 0.5, 0)
HotScripts_2.Size = UDim2.new(0, 80, 0, 18)
HotScripts_2.ZIndex = 2
HotScripts_2.AutoButtonColor = false
HotScripts_2.Font = Enum.Font.SourceSans
HotScripts_2.Text = "Hot-Scripts"
HotScripts_2.TextColor3 = Color3.fromRGB(255, 255, 255)
HotScripts_2.TextSize = 15.000

Dropdown_2.Name = "Dropdown"
Dropdown_2.Parent = HotScripts_2
Dropdown_2.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
Dropdown_2.BorderColor3 = Color3.fromRGB(40, 40, 40)
Dropdown_2.BorderSizePixel = 0
Dropdown_2.Position = UDim2.new(0, 0, 1, 0)
Dropdown_2.Size = UDim2.new(0, 145, 0, 154)
Dropdown_2.Visible = false
Dropdown_2.ZIndex = 3

UIListLayout_3.Parent = Dropdown_2
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder

DarkDex.Name = "DarkDex"
DarkDex.Parent = Dropdown_2
DarkDex.BackgroundColor3 = Color3.fromRGB(181, 215, 243)
DarkDex.BackgroundTransparency = 1.000
DarkDex.BorderColor3 = Color3.fromRGB(0, 120, 215)
DarkDex.Position = UDim2.new(0.441379309, 0, 1.31818175, 0)
DarkDex.Size = UDim2.new(0, 145, 0, 22)
DarkDex.ZIndex = 4
DarkDex.AutoButtonColor = false
DarkDex.Font = Enum.Font.SourceSans
DarkDex.Text = "                  DarkDex"
DarkDex.TextColor3 = Color3.fromRGB(255, 255, 255)
DarkDex.TextSize = 14.000
DarkDex.TextXAlignment = Enum.TextXAlignment.Left

OpenGui.Name = "OpenGui"
OpenGui.Parent = Dropdown_2
OpenGui.BackgroundColor3 = Color3.fromRGB(181, 215, 243)
OpenGui.BackgroundTransparency = 1.000
OpenGui.BorderColor3 = Color3.fromRGB(0, 120, 215)
OpenGui.Position = UDim2.new(0.441379309, 0, 1.31818175, 0)
OpenGui.Size = UDim2.new(0, 145, 0, 22)
OpenGui.ZIndex = 4
OpenGui.AutoButtonColor = false
OpenGui.Font = Enum.Font.SourceSans
OpenGui.Text = "                  OpenGui"
OpenGui.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenGui.TextSize = 14.000
OpenGui.TextXAlignment = Enum.TextXAlignment.Left

RemoteSpy.Name = "RemoteSpy"
RemoteSpy.Parent = Dropdown_2
RemoteSpy.BackgroundColor3 = Color3.fromRGB(181, 215, 243)
RemoteSpy.BackgroundTransparency = 1.000
RemoteSpy.BorderColor3 = Color3.fromRGB(0, 120, 215)
RemoteSpy.Position = UDim2.new(0.441379309, 0, 1.31818175, 0)
RemoteSpy.Size = UDim2.new(0, 145, 0, 22)
RemoteSpy.ZIndex = 4
RemoteSpy.AutoButtonColor = false
RemoteSpy.Font = Enum.Font.SourceSans
RemoteSpy.Text = "                  Remote Spy"
RemoteSpy.TextColor3 = Color3.fromRGB(255, 255, 255)
RemoteSpy.TextSize = 14.000
RemoteSpy.TextXAlignment = Enum.TextXAlignment.Left

GameSense.Name = "GameSense"
GameSense.Parent = Dropdown_2
GameSense.BackgroundColor3 = Color3.fromRGB(181, 215, 243)
GameSense.BackgroundTransparency = 1.000
GameSense.BorderColor3 = Color3.fromRGB(0, 120, 215)
GameSense.Position = UDim2.new(0.441379309, 0, 1.31818175, 0)
GameSense.Size = UDim2.new(0, 145, 0, 22)
GameSense.ZIndex = 4
GameSense.AutoButtonColor = false
GameSense.Font = Enum.Font.SourceSans
GameSense.Text = "                  Game Sense"
GameSense.TextColor3 = Color3.fromRGB(255, 255, 255)
GameSense.TextSize = 14.000
GameSense.TextXAlignment = Enum.TextXAlignment.Left

UnnamedESP.Name = "UnnamedESP"
UnnamedESP.Parent = Dropdown_2
UnnamedESP.BackgroundColor3 = Color3.fromRGB(181, 215, 243)
UnnamedESP.BackgroundTransparency = 1.000
UnnamedESP.BorderColor3 = Color3.fromRGB(0, 120, 215)
UnnamedESP.Position = UDim2.new(0.441379309, 0, 1.31818175, 0)
UnnamedESP.Size = UDim2.new(0, 145, 0, 22)
UnnamedESP.ZIndex = 4
UnnamedESP.AutoButtonColor = false
UnnamedESP.Font = Enum.Font.SourceSans
UnnamedESP.Text = "                  Unnamed ESP"
UnnamedESP.TextColor3 = Color3.fromRGB(255, 255, 255)
UnnamedESP.TextSize = 14.000
UnnamedESP.TextXAlignment = Enum.TextXAlignment.Left

InfiniteYield.Name = "InfiniteYield"
InfiniteYield.Parent = Dropdown_2
InfiniteYield.BackgroundColor3 = Color3.fromRGB(181, 215, 243)
InfiniteYield.BackgroundTransparency = 1.000
InfiniteYield.BorderColor3 = Color3.fromRGB(0, 120, 215)
InfiniteYield.Position = UDim2.new(0.441379309, 0, 1.31818175, 0)
InfiniteYield.Size = UDim2.new(0, 145, 0, 22)
InfiniteYield.ZIndex = 4
InfiniteYield.AutoButtonColor = false
InfiniteYield.Font = Enum.Font.SourceSans
InfiniteYield.Text = "                  Infinite Yield"
InfiniteYield.TextColor3 = Color3.fromRGB(255, 255, 255)
InfiniteYield.TextSize = 14.000
InfiniteYield.TextXAlignment = Enum.TextXAlignment.Left

CMDX.Name = "CMDX"
CMDX.Parent = Dropdown_2
CMDX.BackgroundColor3 = Color3.fromRGB(181, 215, 243)
CMDX.BackgroundTransparency = 1.000
CMDX.BorderColor3 = Color3.fromRGB(0, 120, 215)
CMDX.Position = UDim2.new(0.441379309, 0, 1.31818175, 0)
CMDX.Size = UDim2.new(0, 145, 0, 22)
CMDX.ZIndex = 4
CMDX.AutoButtonColor = false
CMDX.Font = Enum.Font.SourceSans
CMDX.Text = "                  CMD-X"
CMDX.TextColor3 = Color3.fromRGB(255, 255, 255)
CMDX.TextSize = 14.000
CMDX.TextXAlignment = Enum.TextXAlignment.Left

space.Name = "space"
space.Parent = Tabs
space.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
space.BorderSizePixel = 0
space.Size = UDim2.new(0, 3, 0, 24)
space.ZIndex = 2

Others.Name = "Others"
Others.Parent = Tabs
Others.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Others.BackgroundTransparency = 1.000
Others.LayoutOrder = 5
Others.Size = UDim2.new(0, 50, 0, 24)
Others.ZIndex = 2

Others_2.Name = "Others"
Others_2.Parent = Others
Others_2.AnchorPoint = Vector2.new(0.5, 0.5)
Others_2.BackgroundColor3 = Color3.fromRGB(181, 215, 243)
Others_2.BackgroundTransparency = 1.000
Others_2.BorderColor3 = Color3.fromRGB(0, 120, 215)
Others_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Others_2.Size = UDim2.new(0, 48, 0, 18)
Others_2.ZIndex = 2
Others_2.AutoButtonColor = false
Others_2.Font = Enum.Font.SourceSans
Others_2.Text = "Others"
Others_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Others_2.TextSize = 15.000

Dropdown_3.Name = "Dropdown"
Dropdown_3.Parent = Others_2
Dropdown_3.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
Dropdown_3.BorderColor3 = Color3.fromRGB(40, 40, 40)
Dropdown_3.BorderSizePixel = 0
Dropdown_3.Position = UDim2.new(0, 0, 1, 0)
Dropdown_3.Size = UDim2.new(0, 170, 0, 44)
Dropdown_3.Visible = false
Dropdown_3.ZIndex = 3

UIListLayout_4.Parent = Dropdown_3
UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder

GetKey.Name = "GetKey"
GetKey.Parent = Dropdown_3
GetKey.BackgroundColor3 = Color3.fromRGB(181, 215, 243)
GetKey.BackgroundTransparency = 1.000
GetKey.BorderColor3 = Color3.fromRGB(0, 120, 215)
GetKey.Position = UDim2.new(0.441379309, 0, 1.31818175, 0)
GetKey.Size = UDim2.new(0, 170, 0, 22)
GetKey.ZIndex = 4
GetKey.AutoButtonColor = false
GetKey.Font = Enum.Font.SourceSans
GetKey.Text = "                  Get Key"
GetKey.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKey.TextSize = 14.000
GetKey.TextXAlignment = Enum.TextXAlignment.Left

Discord.Name = "Discord"
Discord.Parent = Dropdown_3
Discord.BackgroundColor3 = Color3.fromRGB(181, 215, 243)
Discord.BackgroundTransparency = 1.000
Discord.BorderColor3 = Color3.fromRGB(0, 120, 215)
Discord.Position = UDim2.new(0.441379309, 0, 1.31818175, 0)
Discord.Size = UDim2.new(0, 170, 0, 22)
Discord.ZIndex = 4
Discord.AutoButtonColor = false
Discord.Font = Enum.Font.SourceSans
Discord.Text = "                  Join Discord Server"
Discord.TextColor3 = Color3.fromRGB(255, 255, 255)
Discord.TextSize = 14.000
Discord.TextXAlignment = Enum.TextXAlignment.Left

BlueLine.Name = "BlueLine"
BlueLine.Parent = Topbar
BlueLine.BackgroundColor3 = Color3.fromRGB(30, 85, 196)
BlueLine.BorderSizePixel = 0
BlueLine.Size = UDim2.new(0, 690, 0, 2)
BlueLine.ZIndex = 2

Title.Name = "Title"
Title.Parent = Topbar
Title.AnchorPoint = Vector2.new(0.5, 0)
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.5, 2, 0, 2)
Title.Size = UDim2.new(0, 200, 0, 31)
Title.Font = Enum.Font.SourceSans
Title.Text = "KRNL"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20.000

ScriptsBox.Name = "ScriptsBox"
ScriptsBox.Parent = Topbar
ScriptsBox.Active = true
ScriptsBox.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
ScriptsBox.BorderSizePixel = 0
ScriptsBox.Position = UDim2.new(0, 565, 0, 59)
ScriptsBox.Size = UDim2.new(0, 121, 0, 259)
ScriptsBox.ZIndex = 2
ScriptsBox.ScrollBarThickness = 8

UIListLayout_5.Parent = ScriptsBox

Example.Name = "Example"
Example.Parent = ScriptsBox
Example.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Example.BackgroundTransparency = 1.000
Example.BorderColor3 = Color3.fromRGB(0, 120, 215)
Example.BorderSizePixel = 0
Example.Size = UDim2.new(0, 120, 0, 16)
Example.ZIndex = 3
Example.Font = Enum.Font.SourceSans
Example.Text = "   Example.lua"
Example.TextColor3 = Color3.fromRGB(255, 255, 255)
Example.TextSize = 14.000
Example.TextXAlignment = Enum.TextXAlignment.Left

Execute.Name = "Execute"
Execute.Parent = Topbar
Execute.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
Execute.BorderSizePixel = 0
Execute.Position = UDim2.new(0, 4, 0, 321)
Execute.Size = UDim2.new(0, 99, 0, 24)
Execute.AutoButtonColor = false
Execute.Font = Enum.Font.Gotham
Execute.Text = "EXECUTE"
Execute.TextColor3 = Color3.fromRGB(255, 255, 255)
Execute.TextSize = 14.000

Clear.Name = "Clear"
Clear.Parent = Topbar
Clear.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
Clear.BorderSizePixel = 0
Clear.Position = UDim2.new(0, 107, 0, 321)
Clear.Size = UDim2.new(0, 99, 0, 24)
Clear.AutoButtonColor = false
Clear.Font = Enum.Font.Gotham
Clear.Text = "CLEAR"
Clear.TextColor3 = Color3.fromRGB(255, 255, 255)
Clear.TextSize = 14.000

OpenFile.Name = "OpenFile"
OpenFile.Parent = Topbar
OpenFile.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
OpenFile.BorderSizePixel = 0
OpenFile.Position = UDim2.new(0, 210, 0, 321)
OpenFile.Size = UDim2.new(0, 99, 0, 24)
OpenFile.AutoButtonColor = false
OpenFile.Font = Enum.Font.Gotham
OpenFile.Text = "OPEN FILE"
OpenFile.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenFile.TextSize = 14.000

SaveFile.Name = "SaveFile"
SaveFile.Parent = Topbar
SaveFile.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
SaveFile.BorderSizePixel = 0
SaveFile.Position = UDim2.new(0, 313, 0, 321)
SaveFile.Size = UDim2.new(0, 99, 0, 24)
SaveFile.AutoButtonColor = false
SaveFile.Font = Enum.Font.Gotham
SaveFile.Text = "SAVE FILE"
SaveFile.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveFile.TextSize = 14.000

Inject_2.Name = "Inject"
Inject_2.Parent = Topbar
Inject_2.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
Inject_2.BorderSizePixel = 0
Inject_2.Position = UDim2.new(0, 416, 0, 321)
Inject_2.Size = UDim2.new(0, 99, 0, 24)
Inject_2.AutoButtonColor = false
Inject_2.Font = Enum.Font.Gotham
Inject_2.Text = "INJECT"
Inject_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Inject_2.TextSize = 14.000

Options.Name = "Options"
Options.Parent = Topbar
Options.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
Options.BorderSizePixel = 0
Options.Position = UDim2.new(0, 586, 0, 321)
Options.Size = UDim2.new(0, 99, 0, 24)
Options.AutoButtonColor = false
Options.Font = Enum.Font.Gotham
Options.Text = "OPTIONS"
Options.TextColor3 = Color3.fromRGB(255, 255, 255)
Options.TextSize = 14.000

Editor.Name = "Editor"
Editor.Parent = Topbar
Editor.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
Editor.BorderSizePixel = 0
Editor.Position = UDim2.new(0, 5, 0, 76)
Editor.Size = UDim2.new(0, 554, 0, 241)

Line.Name = "Line"
Line.Parent = Editor
Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Line.Position = UDim2.new(0, 32, 0.00800000038, 0)
Line.Size = UDim2.new(0, 1, 0, 235)
Line.Visible = false

EditorScroll.Name = "EditorScroll"
EditorScroll.Parent = Editor
EditorScroll.Active = true
EditorScroll.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
EditorScroll.BorderSizePixel = 0
EditorScroll.Position = UDim2.new(0, 36, 0, 3)
EditorScroll.Size = UDim2.new(0, 515, 0, 235)
EditorScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
EditorScroll.ScrollBarThickness = 6

Editor_2.Name = "Editor"
Editor_2.Parent = EditorScroll
Editor_2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Editor_2.BorderSizePixel = 0
Editor_2.Size = UDim2.new(0, 515, 0, 235)
Editor_2.ZIndex = 2
Editor_2.ClearTextOnFocus = false
Editor_2.Font = Enum.Font.Code
Editor_2.MultiLine = true
Editor_2.Text = ""
Editor_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Editor_2.TextSize = 14.000
Editor_2.TextXAlignment = Enum.TextXAlignment.Left
Editor_2.TextYAlignment = Enum.TextYAlignment.Top

NumberScroll.Name = "NumberScroll"
NumberScroll.Parent = Editor
NumberScroll.Active = true
NumberScroll.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
NumberScroll.BorderSizePixel = 0
NumberScroll.Position = UDim2.new(0, 3, 0, 3)
NumberScroll.Size = UDim2.new(0, 33, 0, 235)
NumberScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
NumberScroll.ScrollBarThickness = 0

Numbers.Name = "Numbers"
Numbers.Parent = NumberScroll
Numbers.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Numbers.BorderSizePixel = 0
Numbers.Size = UDim2.new(0, 33, 0, 235)
Numbers.ZIndex = 2
Numbers.Font = Enum.Font.Code
Numbers.Text = "1"
Numbers.TextColor3 = Color3.fromRGB(255, 255, 255)
Numbers.TextSize = 14.000
Numbers.TextYAlignment = Enum.TextYAlignment.Top

OptionsBox.Name = "OptionsBox"
OptionsBox.Parent = Topbar
OptionsBox.Active = true
OptionsBox.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
OptionsBox.BorderSizePixel = 0
OptionsBox.Position = UDim2.new(1, 4, 0, 0)
OptionsBox.Size = UDim2.new(0, 247, 0, 33)
OptionsBox.ZIndex = 3

UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent = OptionsBox

Main_2.Name = "Main"
Main_2.Parent = OptionsBox
Main_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main_2.BorderSizePixel = 0
Main_2.Position = UDim2.new(0, 0, 1.030303, 0)
Main_2.Size = UDim2.new(0, 247, 0, 195)
Main_2.ZIndex = 3

UICorner_2.CornerRadius = UDim.new(0, 4)
UICorner_2.Parent = Main_2

Install.Name = "Install"
Install.Parent = Main_2
Install.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
Install.BorderSizePixel = 0
Install.Position = UDim2.new(0, 155, 0, 161)
Install.Size = UDim2.new(0, 62, 0, 23)
Install.ZIndex = 4
Install.Font = Enum.Font.SourceSans
Install.Text = "INSTALL"
Install.TextColor3 = Color3.fromRGB(255, 255, 255)
Install.TextSize = 14.000

InstallText.Name = "InstallText"
InstallText.Parent = Main_2
InstallText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InstallText.BackgroundTransparency = 1.000
InstallText.BorderSizePixel = 0
InstallText.Position = UDim2.new(0, 14, 0, 161)
InstallText.Size = UDim2.new(0, 141, 0, 23)
InstallText.ZIndex = 4
InstallText.Font = Enum.Font.SourceSans
InstallText.Text = "Install missing files"
InstallText.TextColor3 = Color3.fromRGB(255, 255, 255)
InstallText.TextSize = 16.000
InstallText.TextXAlignment = Enum.TextXAlignment.Left

Toggle_Monaco.Name = "Toggle_Monaco"
Toggle_Monaco.Parent = Main_2
Toggle_Monaco.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Toggle_Monaco.BorderSizePixel = 0
Toggle_Monaco.Position = UDim2.new(0, 172, 0, 134)
Toggle_Monaco.Size = UDim2.new(0, 32, 0, 11)
Toggle_Monaco.ZIndex = 4
Toggle_Monaco.AutoButtonColor = false
Toggle_Monaco.Font = Enum.Font.SourceSans
Toggle_Monaco.Text = ""
Toggle_Monaco.TextColor3 = Color3.fromRGB(0, 0, 0)
Toggle_Monaco.TextSize = 14.000

Circle.Name = "Circle"
Circle.Parent = Toggle_Monaco
Circle.AnchorPoint = Vector2.new(0, 0.5)
Circle.BackgroundColor3 = Color3.fromRGB(91, 91, 91)
Circle.BorderSizePixel = 0
Circle.Position = UDim2.new(0, 0, 0.5, 0)
Circle.Size = UDim2.new(0, 19, 0, 19)
Circle.ZIndex = 4

UICorner_3.CornerRadius = UDim.new(0, 100)
UICorner_3.Parent = Circle

UICorner_4.Parent = Toggle_Monaco

MonacoText.Name = "MonacoText"
MonacoText.Parent = Main_2
MonacoText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MonacoText.BackgroundTransparency = 1.000
MonacoText.BorderSizePixel = 0
MonacoText.Position = UDim2.new(0, 12, 0, 128)
MonacoText.Size = UDim2.new(0, 141, 0, 23)
MonacoText.ZIndex = 4
MonacoText.Font = Enum.Font.SourceSans
MonacoText.Text = "Toggle Monaco"
MonacoText.TextColor3 = Color3.fromRGB(255, 255, 255)
MonacoText.TextSize = 16.000
MonacoText.TextXAlignment = Enum.TextXAlignment.Left

CrashLogsText.Name = "CrashLogsText"
CrashLogsText.Parent = Main_2
CrashLogsText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CrashLogsText.BackgroundTransparency = 1.000
CrashLogsText.BorderSizePixel = 0
CrashLogsText.Position = UDim2.new(0, 12, 0, 100)
CrashLogsText.Size = UDim2.new(0, 141, 0, 23)
CrashLogsText.ZIndex = 4
CrashLogsText.Font = Enum.Font.SourceSans
CrashLogsText.Text = "Remove Crash Logs"
CrashLogsText.TextColor3 = Color3.fromRGB(255, 255, 255)
CrashLogsText.TextSize = 16.000
CrashLogsText.TextXAlignment = Enum.TextXAlignment.Left

Toggle_CrashLogs.Name = "Toggle_CrashLogs"
Toggle_CrashLogs.Parent = Main_2
Toggle_CrashLogs.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Toggle_CrashLogs.BorderSizePixel = 0
Toggle_CrashLogs.Position = UDim2.new(0, 172, 0, 106)
Toggle_CrashLogs.Size = UDim2.new(0, 32, 0, 11)
Toggle_CrashLogs.ZIndex = 4
Toggle_CrashLogs.AutoButtonColor = false
Toggle_CrashLogs.Font = Enum.Font.SourceSans
Toggle_CrashLogs.Text = ""
Toggle_CrashLogs.TextColor3 = Color3.fromRGB(0, 0, 0)
Toggle_CrashLogs.TextSize = 14.000

Circle_2.Name = "Circle"
Circle_2.Parent = Toggle_CrashLogs
Circle_2.AnchorPoint = Vector2.new(0, 0.5)
Circle_2.BackgroundColor3 = Color3.fromRGB(91, 91, 91)
Circle_2.BorderSizePixel = 0
Circle_2.Position = UDim2.new(0, 0, 0.5, 0)
Circle_2.Size = UDim2.new(0, 19, 0, 19)
Circle_2.ZIndex = 4

UICorner_5.CornerRadius = UDim.new(0, 100)
UICorner_5.Parent = Circle_2

UICorner_6.Parent = Toggle_CrashLogs

OpacityText.Name = "OpacityText"
OpacityText.Parent = Main_2
OpacityText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OpacityText.BackgroundTransparency = 1.000
OpacityText.BorderSizePixel = 0
OpacityText.Position = UDim2.new(0, 12, 0, 72)
OpacityText.Size = UDim2.new(0, 141, 0, 23)
OpacityText.ZIndex = 4
OpacityText.Font = Enum.Font.SourceSans
OpacityText.Text = "Opacity Fade-in/out"
OpacityText.TextColor3 = Color3.fromRGB(255, 255, 255)
OpacityText.TextSize = 16.000
OpacityText.TextXAlignment = Enum.TextXAlignment.Left

Toggle_Opacity.Name = "Toggle_Opacity"
Toggle_Opacity.Parent = Main_2
Toggle_Opacity.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Toggle_Opacity.BorderSizePixel = 0
Toggle_Opacity.Position = UDim2.new(0, 172, 0, 78)
Toggle_Opacity.Size = UDim2.new(0, 32, 0, 11)
Toggle_Opacity.ZIndex = 4
Toggle_Opacity.AutoButtonColor = false
Toggle_Opacity.Font = Enum.Font.SourceSans
Toggle_Opacity.Text = ""
Toggle_Opacity.TextColor3 = Color3.fromRGB(0, 0, 0)
Toggle_Opacity.TextSize = 14.000

Circle_3.Name = "Circle"
Circle_3.Parent = Toggle_Opacity
Circle_3.AnchorPoint = Vector2.new(0, 0.5)
Circle_3.BackgroundColor3 = Color3.fromRGB(91, 91, 91)
Circle_3.BorderSizePixel = 0
Circle_3.Position = UDim2.new(0, 0, 0.5, 0)
Circle_3.Size = UDim2.new(0, 19, 0, 19)
Circle_3.ZIndex = 4

UICorner_7.CornerRadius = UDim.new(0, 100)
UICorner_7.Parent = Circle_3

UICorner_8.Parent = Toggle_Opacity

TopMostText.Name = "TopMostText"
TopMostText.Parent = Main_2
TopMostText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TopMostText.BackgroundTransparency = 1.000
TopMostText.BorderSizePixel = 0
TopMostText.Position = UDim2.new(0, 14, 0, 44)
TopMostText.Size = UDim2.new(0, 141, 0, 23)
TopMostText.ZIndex = 4
TopMostText.Font = Enum.Font.SourceSans
TopMostText.Text = "Top Most"
TopMostText.TextColor3 = Color3.fromRGB(255, 255, 255)
TopMostText.TextSize = 16.000
TopMostText.TextXAlignment = Enum.TextXAlignment.Left

AutoAttachText.Name = "AutoAttachText"
AutoAttachText.Parent = Main_2
AutoAttachText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoAttachText.BackgroundTransparency = 1.000
AutoAttachText.BorderSizePixel = 0
AutoAttachText.Position = UDim2.new(0, 14, 0, 18)
AutoAttachText.Size = UDim2.new(0, 141, 0, 23)
AutoAttachText.ZIndex = 4
AutoAttachText.Font = Enum.Font.SourceSans
AutoAttachText.Text = "Auto Attach"
AutoAttachText.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoAttachText.TextSize = 16.000
AutoAttachText.TextXAlignment = Enum.TextXAlignment.Left

Toggle_AutoAttach.Name = "Toggle_AutoAttach"
Toggle_AutoAttach.Parent = Main_2
Toggle_AutoAttach.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Toggle_AutoAttach.BorderSizePixel = 0
Toggle_AutoAttach.Position = UDim2.new(0, 172, 0, 24)
Toggle_AutoAttach.Size = UDim2.new(0, 32, 0, 11)
Toggle_AutoAttach.ZIndex = 4
Toggle_AutoAttach.AutoButtonColor = false
Toggle_AutoAttach.Font = Enum.Font.SourceSans
Toggle_AutoAttach.Text = ""
Toggle_AutoAttach.TextColor3 = Color3.fromRGB(0, 0, 0)
Toggle_AutoAttach.TextSize = 14.000

Circle_4.Name = "Circle"
Circle_4.Parent = Toggle_AutoAttach
Circle_4.AnchorPoint = Vector2.new(0, 0.5)
Circle_4.BackgroundColor3 = Color3.fromRGB(91, 91, 91)
Circle_4.BorderSizePixel = 0
Circle_4.Position = UDim2.new(0, 0, 0.5, 0)
Circle_4.Size = UDim2.new(0, 19, 0, 19)
Circle_4.ZIndex = 4

UICorner_9.CornerRadius = UDim.new(0, 100)
UICorner_9.Parent = Circle_4

UICorner_10.Parent = Toggle_AutoAttach

Toggle_TopMost.Name = "Toggle_TopMost"
Toggle_TopMost.Parent = Main_2
Toggle_TopMost.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Toggle_TopMost.BorderSizePixel = 0
Toggle_TopMost.Position = UDim2.new(0, 172, 0, 50)
Toggle_TopMost.Size = UDim2.new(0, 32, 0, 11)
Toggle_TopMost.ZIndex = 4
Toggle_TopMost.AutoButtonColor = false
Toggle_TopMost.Font = Enum.Font.SourceSans
Toggle_TopMost.Text = ""
Toggle_TopMost.TextColor3 = Color3.fromRGB(0, 0, 0)
Toggle_TopMost.TextSize = 14.000

Circle_5.Name = "Circle"
Circle_5.Parent = Toggle_TopMost
Circle_5.AnchorPoint = Vector2.new(0, 0.5)
Circle_5.BackgroundColor3 = Color3.fromRGB(91, 91, 91)
Circle_5.BorderSizePixel = 0
Circle_5.Position = UDim2.new(0, 0, 0.5, 0)
Circle_5.Size = UDim2.new(0, 19, 0, 19)
Circle_5.ZIndex = 4

UICorner_11.CornerRadius = UDim.new(0, 100)
UICorner_11.Parent = Circle_5

UICorner_12.Parent = Toggle_TopMost

Line_2.Name = "Line"
Line_2.Parent = OptionsBox
Line_2.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Line_2.BorderSizePixel = 0
Line_2.Position = UDim2.new(0, 0, 1, 0)
Line_2.Size = UDim2.new(0, 247, 0, 1)
Line_2.ZIndex = 4

Logo.Name = "Logo"
Logo.Parent = OptionsBox
Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo.BackgroundTransparency = 1.000
Logo.BorderSizePixel = 0
Logo.Position = UDim2.new(0, 8, 0, 8)
Logo.Size = UDim2.new(0, 19, 0, 19)
Logo.ZIndex = 4
Logo.Image = "rbxassetid://6763472970"

Title_2.Name = "Title"
Title_2.Parent = OptionsBox
Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_2.BackgroundTransparency = 1.000
Title_2.BorderSizePixel = 0
Title_2.Position = UDim2.new(0.295546561, 0, 0, 0)
Title_2.Size = UDim2.new(0, 100, 0, 33)
Title_2.ZIndex = 4
Title_2.Font = Enum.Font.SourceSans
Title_2.Text = "Settings"
Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_2.TextSize = 16.000

Fill.Name = "Fill"
Fill.Parent = OptionsBox
Fill.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Fill.BorderSizePixel = 0
Fill.Position = UDim2.new(0, 0, 0.75757575, 0)
Fill.Size = UDim2.new(0, 247, 0, 15)
Fill.ZIndex = 2

Close.Name = "Close"
Close.Parent = OptionsBox
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0, 219, 0, 0)
Close.Size = UDim2.new(0, 25, 0, 33)
Close.ZIndex = 4
Close.Image = "rbxassetid://6763474542"

Minimize.Name = "Minimize"
Minimize.Parent = OptionsBox
Minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Minimize.BorderSizePixel = 0
Minimize.Position = UDim2.new(0, 192, 0, 0)
Minimize.Size = UDim2.new(0, 25, 0, 33)
Minimize.ZIndex = 4
Minimize.Image = "rbxassetid://6763473487"

Logo_2.Name = "Logo"
Logo_2.Parent = Topbar
Logo_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo_2.BackgroundTransparency = 1.000
Logo_2.BorderSizePixel = 0
Logo_2.Position = UDim2.new(0, 5, 0, 6)
Logo_2.Size = UDim2.new(0, 22, 0, 22)
Logo_2.ZIndex = 2
Logo_2.Image = "rbxassetid://6763472823"

Close_2.Name = "Close"
Close_2.Parent = Topbar
Close_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close_2.BorderSizePixel = 0
Close_2.Position = UDim2.new(0, 655, 0, 2)
Close_2.Size = UDim2.new(0, 35, 0, 31)
Close_2.Image = "rbxassetid://6763508136"

Minimize_2.Name = "Minimize"
Minimize_2.Parent = Topbar
Minimize_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Minimize_2.BorderSizePixel = 0
Minimize_2.Position = UDim2.new(0, 620, 0, 2)
Minimize_2.Size = UDim2.new(0, 35, 0, 31)
Minimize_2.Image = "rbxassetid://6763473140"

ScriptTabs.Name = "ScriptTabs"
ScriptTabs.Parent = Topbar
ScriptTabs.BackgroundColor3 = Color3.fromRGB(45, 45, 48)
ScriptTabs.BorderSizePixel = 0
ScriptTabs.ClipsDescendants = true
ScriptTabs.Position = UDim2.new(0, 5, 0, 60)
ScriptTabs.Size = UDim2.new(0, 522, 0, 16)

UIListLayout_6.Parent = ScriptTabs
UIListLayout_6.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder

Example1.Name = "Example1"
Example1.Parent = ScriptTabs
Example1.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
Example1.BorderSizePixel = 0
Example1.Size = UDim2.new(0, 84, 0, 16)

Close_3.Name = "Close"
Close_3.Parent = Example1
Close_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close_3.BackgroundTransparency = 1.000
Close_3.BorderSizePixel = 0
Close_3.Position = UDim2.new(0, 68, 0, 0)
Close_3.Size = UDim2.new(0, 16, 0, 16)
Close_3.AutoButtonColor = false
Close_3.Font = Enum.Font.SourceSans
Close_3.Text = "X"
Close_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Close_3.TextSize = 16.000

Selecter.Name = "Selecter"
Selecter.Parent = Example1
Selecter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Selecter.BackgroundTransparency = 1.000
Selecter.BorderSizePixel = 0
Selecter.Size = UDim2.new(0, 68, 0, 16)
Selecter.ZIndex = 2
Selecter.AutoButtonColor = false
Selecter.Font = Enum.Font.SourceSans
Selecter.Text = "Untitled.lua"
Selecter.TextColor3 = Color3.fromRGB(255, 255, 255)
Selecter.TextSize = 14.000

NewTab.Name = "NewTab"
NewTab.Parent = ScriptTabs
NewTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NewTab.BorderSizePixel = 0
NewTab.LayoutOrder = 1
NewTab.Size = UDim2.new(0, 16, 0, 16)
NewTab.AutoButtonColor = false
NewTab.Image = "rbxassetid://6763830018"

Fill_2.Name = "Fill"
Fill_2.Parent = Topbar
Fill_2.BackgroundColor3 = Color3.fromRGB(45, 45, 48)
Fill_2.BorderSizePixel = 0
Fill_2.Position = UDim2.new(0, 527, 0, 60)
Fill_2.Size = UDim2.new(0, 32, 0, 16)

CreditsBox.Name = "CreditsBox"
CreditsBox.Parent = Topbar
CreditsBox.Active = true
CreditsBox.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
CreditsBox.BorderSizePixel = 0
CreditsBox.Position = UDim2.new(1, 5, 0, 0)
CreditsBox.Size = UDim2.new(0, 320, 0, 33)
CreditsBox.ZIndex = 5

Main_3.Name = "Main"
Main_3.Parent = CreditsBox
Main_3.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
Main_3.BorderSizePixel = 0
Main_3.Position = UDim2.new(0, 0, 0, 33)
Main_3.Size = UDim2.new(0, 320, 0, 158)
Main_3.ZIndex = 5

Close_4.Name = "Close"
Close_4.Parent = CreditsBox
Close_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close_4.BorderSizePixel = 0
Close_4.Position = UDim2.new(1, -35, 0, 0)
Close_4.Size = UDim2.new(0, 35, 0, 33)
Close_4.ZIndex = 6
Close_4.Image = "rbxassetid://6763508136"
Close_4.ScaleType = Enum.ScaleType.Crop

ImageLabel.Parent = CreditsBox
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0, 8, 0, 39)
ImageLabel.Size = UDim2.new(0, 125, 0, 128)
ImageLabel.ZIndex = 6
ImageLabel.Image = "rbxassetid://6763472970"

_1.Name = "1"
_1.Parent = CreditsBox
_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_1.BackgroundTransparency = 1.000
_1.BorderSizePixel = 0
_1.Position = UDim2.new(0, 133, 0, 62)
_1.Size = UDim2.new(0, 187, 0, 12)
_1.ZIndex = 6
_1.Font = Enum.Font.SourceSans
_1.Text = "   UI Design and Components"
_1.TextColor3 = Color3.fromRGB(255, 255, 255)
_1.TextSize = 16.000
_1.TextXAlignment = Enum.TextXAlignment.Left

_2.Name = "2"
_2.Parent = CreditsBox
_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_2.BackgroundTransparency = 1.000
_2.BorderSizePixel = 0
_2.Position = UDim2.new(0, 133, 0, 80)
_2.Size = UDim2.new(0, 187, 0, 12)
_2.ZIndex = 6
_2.Font = Enum.Font.SourceSans
_2.Text = "   Iris  Littensy  XV  0x00  King"
_2.TextColor3 = Color3.fromRGB(150, 150, 150)
_2.TextSize = 16.000
_2.TextXAlignment = Enum.TextXAlignment.Left

_3.Name = "3"
_3.Parent = CreditsBox
_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_3.BackgroundTransparency = 1.000
_3.BorderSizePixel = 0
_3.Position = UDim2.new(0, 133, 0, 98)
_3.Size = UDim2.new(0, 187, 0, 12)
_3.ZIndex = 6
_3.Font = Enum.Font.SourceSans
_3.Text = "   Exploit Developer"
_3.TextColor3 = Color3.fromRGB(255, 255, 255)
_3.TextSize = 16.000
_3.TextXAlignment = Enum.TextXAlignment.Left

_4.Name = "4"
_4.Parent = CreditsBox
_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_4.BackgroundTransparency = 1.000
_4.BorderSizePixel = 0
_4.Position = UDim2.new(0, 133, 0, 118)
_4.Size = UDim2.new(0, 187, 0, 12)
_4.ZIndex = 6
_4.Font = Enum.Font.SourceSans
_4.Text = "   Ice Bear"
_4.TextColor3 = Color3.fromRGB(150, 150, 150)
_4.TextSize = 16.000
_4.TextXAlignment = Enum.TextXAlignment.Left

_5.Name = "5"
_5.Parent = CreditsBox
_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_5.BackgroundTransparency = 1.000
_5.BorderSizePixel = 0
_5.Position = UDim2.new(0, 133, 0, 138)
_5.Size = UDim2.new(0, 187, 0, 12)
_5.ZIndex = 6
_5.Font = Enum.Font.SourceSans
_5.Text = "   Credits"
_5.TextColor3 = Color3.fromRGB(255, 255, 255)
_5.TextSize = 16.000
_5.TextXAlignment = Enum.TextXAlignment.Left

_6.Name = "6"
_6.Parent = CreditsBox
_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_6.BackgroundTransparency = 1.000
_6.BorderSizePixel = 0
_6.Position = UDim2.new(0, 133, 0, 156)
_6.Size = UDim2.new(0, 187, 0, 12)
_6.ZIndex = 6
_6.Font = Enum.Font.SourceSans
_6.Text = "   Customality      KowalskiFX"
_6.TextColor3 = Color3.fromRGB(150, 150, 150)
_6.TextSize = 16.000
_6.TextXAlignment = Enum.TextXAlignment.Left

Filesystem.Name = "Filesystem"
Filesystem.Parent = KRNL
Filesystem.Active = true
Filesystem.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Filesystem.BorderSizePixel = 0
Filesystem.Position = UDim2.new(0.385350317, 0, 0.470326394, 0)
Filesystem.Size = UDim2.new(0, 250, 0, 33)
Filesystem.Visible = false
Filesystem.ZIndex = 5

Main_4.Name = "Main"
Main_4.Parent = Filesystem
Main_4.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main_4.BorderSizePixel = 0
Main_4.Position = UDim2.new(0, 0, 1, 0)
Main_4.Size = UDim2.new(0, 250, 0, 80)
Main_4.ZIndex = 5

UICorner_13.CornerRadius = UDim.new(0, 4)
UICorner_13.Parent = Main_4

FileName.Name = "FileName"
FileName.Parent = Main_4
FileName.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
FileName.BorderSizePixel = 0
FileName.Position = UDim2.new(0, 10, 0, 10)
FileName.Size = UDim2.new(0, 180, 0, 25)
FileName.ZIndex = 6
FileName.ClearTextOnFocus = false
FileName.Font = Enum.Font.SourceSans
FileName.PlaceholderText = "File Name"
FileName.Text = ""
FileName.TextColor3 = Color3.fromRGB(255, 255, 255)
FileName.TextSize = 14.000

Extension.Name = "Extension"
Extension.Parent = Main_4
Extension.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
Extension.BorderSizePixel = 0
Extension.Position = UDim2.new(0, 200, 0, 10)
Extension.Size = UDim2.new(0, 40, 0, 25)
Extension.ZIndex = 6
Extension.ClearTextOnFocus = false
Extension.Font = Enum.Font.SourceSans
Extension.PlaceholderText = ".lua"
Extension.Text = ""
Extension.TextColor3 = Color3.fromRGB(255, 255, 255)
Extension.TextSize = 14.000

Button.Name = "Button"
Button.Parent = Main_4
Button.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
Button.BorderSizePixel = 0
Button.Position = UDim2.new(0, 10, 0, 45)
Button.Size = UDim2.new(0, 230, 0, 25)
Button.ZIndex = 6
Button.AutoButtonColor = false
Button.Font = Enum.Font.Gotham
Button.Text = "SAVE"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextSize = 14.000

Success.Name = "Success"
Success.Parent = Main_4
Success.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Success.BackgroundTransparency = 1.000
Success.BorderSizePixel = 0
Success.Position = UDim2.new(0, 10, 0, 35)
Success.Size = UDim2.new(0, 230, 0, 10)
Success.ZIndex = 6
Success.Font = Enum.Font.SourceSans
Success.Text = ""
Success.TextColor3 = Color3.fromRGB(0, 255, 0)
Success.TextSize = 13.000

Error.Name = "Error"
Error.Parent = Main_4
Error.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Error.BackgroundTransparency = 1.000
Error.BorderSizePixel = 0
Error.Position = UDim2.new(0, 10, 0, 35)
Error.Size = UDim2.new(0, 230, 0, 10)
Error.ZIndex = 6
Error.Font = Enum.Font.SourceSans
Error.Text = ""
Error.TextColor3 = Color3.fromRGB(255, 0, 0)
Error.TextSize = 13.000

UICorner_14.CornerRadius = UDim.new(0, 4)
UICorner_14.Parent = Filesystem

Fill_3.Name = "Fill"
Fill_3.Parent = Filesystem
Fill_3.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Fill_3.BorderSizePixel = 0
Fill_3.Position = UDim2.new(0, 0, 0.75757575, 0)
Fill_3.Size = UDim2.new(0, 250, 0, 15)
Fill_3.ZIndex = 2

Title_3.Name = "Title"
Title_3.Parent = Filesystem
Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_3.BackgroundTransparency = 1.000
Title_3.BorderSizePixel = 0
Title_3.Position = UDim2.new(0.295546561, 0, 0, 0)
Title_3.Size = UDim2.new(0, 100, 0, 33)
Title_3.ZIndex = 6
Title_3.Font = Enum.Font.SourceSans
Title_3.Text = "Save File"
Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_3.TextSize = 16.000

Close_5.Name = "Close"
Close_5.Parent = Filesystem
Close_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close_5.BackgroundTransparency = 1.000
Close_5.BorderSizePixel = 0
Close_5.Position = UDim2.new(0, 222, 0, 0)
Close_5.Size = UDim2.new(0, 25, 0, 33)
Close_5.ZIndex = 6
Close_5.Image = "rbxassetid://6763474542"

Line_3.Name = "Line"
Line_3.Parent = Filesystem
Line_3.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Line_3.BorderSizePixel = 0
Line_3.Position = UDim2.new(0, 0, 1, 0)
Line_3.Size = UDim2.new(0, 250, 0, 1)
Line_3.ZIndex = 6

Open.Name = "Open"
Open.Parent = KRNL
Open.AnchorPoint = Vector2.new(0.5, 0.5)
Open.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Open.BorderSizePixel = 0
Open.Position = UDim2.new(0.5, 0, 0.5, 0)
Open.Size = UDim2.new(0, 50, 0, 50)
Open.Visible = false
Open.ZIndex = 20
Open.AutoButtonColor = false
Open.Image = "rbxassetid://6763472823"

UICorner_15.CornerRadius = UDim.new(0, 6)
UICorner_15.Parent = Open

ScriptsDropdown.Name = "ScriptsDropdown"
ScriptsDropdown.Parent = KRNL
ScriptsDropdown.BackgroundColor3 = Color3.fromRGB(253, 253, 253)
ScriptsDropdown.BorderColor3 = Color3.fromRGB(128, 128, 128)
ScriptsDropdown.Position = UDim2.new(0, 5, 0, 5)
ScriptsDropdown.Size = UDim2.new(0, 157, 0, 115)
ScriptsDropdown.ZIndex = 3

UIListLayout_7.Parent = ScriptsDropdown
UIListLayout_7.SortOrder = Enum.SortOrder.LayoutOrder

Execute_2.Name = "Execute"
Execute_2.Parent = ScriptsDropdown
Execute_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Execute_2.BorderColor3 = Color3.fromRGB(255, 255, 255)
Execute_2.Position = UDim2.new(0.441379309, 0, 1.31818175, 0)
Execute_2.Size = UDim2.new(0, 157, 0, 23)
Execute_2.ZIndex = 4
Execute_2.AutoButtonColor = false
Execute_2.Font = Enum.Font.SourceSans
Execute_2.Text = "                     Execute"
Execute_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Execute_2.TextSize = 14.000
Execute_2.TextXAlignment = Enum.TextXAlignment.Left

Load.Name = "Load"
Load.Parent = ScriptsDropdown
Load.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Load.BorderColor3 = Color3.fromRGB(255, 255, 255)
Load.Position = UDim2.new(0.441379309, 0, 1.31818175, 0)
Load.Size = UDim2.new(0, 157, 0, 23)
Load.ZIndex = 4
Load.AutoButtonColor = false
Load.Font = Enum.Font.SourceSans
Load.Text = "                     Load Into Editor"
Load.TextColor3 = Color3.fromRGB(0, 0, 0)
Load.TextSize = 14.000
Load.TextXAlignment = Enum.TextXAlignment.Left

Delete.Name = "Delete"
Delete.Parent = ScriptsDropdown
Delete.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Delete.BorderColor3 = Color3.fromRGB(255, 255, 255)
Delete.Position = UDim2.new(0.441379309, 0, 1.31818175, 0)
Delete.Size = UDim2.new(0, 157, 0, 23)
Delete.ZIndex = 4
Delete.AutoButtonColor = false
Delete.Font = Enum.Font.SourceSans
Delete.Text = "                     Delete File"
Delete.TextColor3 = Color3.fromRGB(0, 0, 0)
Delete.TextSize = 14.000
Delete.TextXAlignment = Enum.TextXAlignment.Left

Change.Name = "Change"
Change.Parent = ScriptsDropdown
Change.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Change.BorderColor3 = Color3.fromRGB(255, 255, 255)
Change.Position = UDim2.new(0.441379309, 0, 1.31818175, 0)
Change.Size = UDim2.new(0, 157, 0, 23)
Change.ZIndex = 4
Change.AutoButtonColor = false
Change.Font = Enum.Font.SourceSans
Change.Text = "                     Change Path"
Change.TextColor3 = Color3.fromRGB(0, 0, 0)
Change.TextSize = 14.000
Change.TextXAlignment = Enum.TextXAlignment.Left

Reload.Name = "Reload"
Reload.Parent = ScriptsDropdown
Reload.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Reload.BorderColor3 = Color3.fromRGB(255, 255, 255)
Reload.Position = UDim2.new(0.441379309, 0, 1.31818175, 0)
Reload.Size = UDim2.new(0, 157, 0, 23)
Reload.ZIndex = 4
Reload.AutoButtonColor = false
Reload.Font = Enum.Font.SourceSans
Reload.Text = "                     Reload"
Reload.TextColor3 = Color3.fromRGB(0, 0, 0)
Reload.TextSize = 14.000
Reload.TextXAlignment = Enum.TextXAlignment.Left

-- Scripts:

local function UWCJURS_fake_script() -- Topbar.MainScript 
	local script = Instance.new('LocalScript', Topbar)

	script.Parent.Visible = false
	script.Parent.Draggable = true
	script.Parent.CreditsBox.Draggable = true
	script.Parent.OptionsBox.Draggable = true
	script.Parent.Parent.Filesystem.Draggable = true
	script.Parent.Parent.Open.Draggable = true
	
	function hint(text,duration)
		local h = Instance.new("Hint",game.CoreGui)
		h.Text = text
		wait(duration)
		h:Destroy()
	end
	local missingfunctions = {}
	if not game:GetService("RunService"):IsStudio() then
		if not setclipboard then
			table.insert(missingfunctions,#missingfunctions+1,"setclipboard")
		elseif not writefile then
			table.insert(missingfunctions,#missingfunctions+1,"writefile")
		elseif not readfile then
			table.insert(missingfunctions,#missingfunctions+1,"readfile")
		elseif not isfile then
			table.insert(missingfunctions,#missingfunctions+1,"isfile")
		elseif not isfolder then
			table.insert(missingfunctions,#missingfunctions+1,"isfolder")
		elseif not makefolder then
			table.insert(missingfunctions,#missingfunctions+1,"makefolder")
		elseif not listfiles then
			table.insert(missingfunctions,#missingfunctions+1,"listfiles")
		elseif not messagebox then
			table.insert(missingfunctions,#missingfunctions+1,"messagebox")
		elseif not rconsoleprint then
			table.insert(missingfunctions,#missingfunctions+1,"rconsoleprint")
		elseif not rconsoleinfo then
			table.insert(missingfunctions,#missingfunctions+1,"rconsoleinfo")
		elseif not rconsoleinput then
			table.insert(missingfunctions,#missingfunctions+1,"rconsoleinput")
		elseif not rconsoleclear then
			table.insert(missingfunctions,#missingfunctions+1,"rconsoleclear")
		elseif not rconsoleclose then
			table.insert(missingfunctions,#missingfunctions+1,"rconsoleclose")
		elseif not getgenv then
			table.insert(missingfunctions,#missingfunctions+1,"getgenv")
		end
		
		if #missingfunctions ~= 0 then
			local m = Instance.new("Message",game.CoreGui)
			m.Text = "Your exploit is missing some functions!\n"
			for i,v in ipairs(missingfunctions) do
				m.Text = m.Text..v.."\n"
			end
			wait(5)
			m:Destroy()
		end
		if not isfolder("KI_Scripts") then
			makefolder("KI_Scripts")
		end
		if not isfile("KI_Scripts\\Welcome.txt") then
			writefile("KI_Scripts\\Welcome.txt","Welcome to Krnl Internal!\nPlease read 'KI_README.txt' in your workspace folder.")
		end
		writefile("KI_README.txt","Welcome to Krnl Internal\nMade by zzerexx#3970\n\nPut your scripts in the KI_Scripts folder to use them in Krnl Internal. Must use .txt or .lua files!")
	end
	
	local characters = { "A","B","C","D","E","F","G","H","I","J","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","0"}
	for i = 1,math.random(18,22) do
		--script.Parent.Parent.PermaKey.Value = script.Parent.Parent.PermaKey.Value..characters[math.random(1,#characters)]
	end
	if not game:GetService("RunService"):IsStudio() and getgenv().KrnlDebugMode then 
		setclipboard(script.Parent.Parent.PermaKey.Value)
	end
	
	script.Parent.OptionsBox.Visible = false
	
	-- BUTTONS
	script.Parent.Execute.MouseButton1Click:Connect(function()
		if script.Parent.Parent.Injected.Value then
			loadstring(script.Parent.Editor.EditorScroll.Editor.Text)()
		else
			messagebox("Please Inject To Execute Scripts","krnl",0)
		end
	end)
	script.Parent.Clear.MouseButton1Click:Connect(function()
		script.Parent.Editor.EditorScroll.Editor.Text = ""
	end)
	script.Parent.OpenFile.MouseButton1Click:Connect(function()
		script.Parent.Parent.Filesystem.Visible = true
		script.Parent.Parent.Filesystem.Title.Text = "Open File"
		script.Parent.Parent.Filesystem.Main.Button.Text = "OPEN"
		script.Parent.Parent.Filesystem.Action.Value = "Open"
	end)
	script.Parent.SaveFile.MouseButton1Click:Connect(function()
		script.Parent.Parent.Filesystem.Visible = true
		script.Parent.Parent.Filesystem.Title.Text = "Save File"
		script.Parent.Parent.Filesystem.Main.Button.Text = "SAVE"
		script.Parent.Parent.Filesystem.Action.Value = "Save"
	end)
	script.Parent.Options.MouseButton1Click:Connect(function()
		script.Parent.OptionsBox.Visible = true
	end)
	script.Parent.Minimize.MouseButton1Click:Connect(function()
		script.Parent.Visible = false
		script.Parent.Parent.Open.Visible = true
	end)
	script.Parent.Close.MouseButton1Click:Connect(function()
		if messagebox("Are you sure you want to exit Krnl?","Krnl Internal",4) == 6 then
			script.Parent.Parent:Destroy()
		end
	end)
	script.Parent.Parent.Open.MouseButton1Click:Connect(function()
		script.Parent.Parent.Open.Visible = false
		script.Parent.Visible = true
	end)
	
	-- READY
	script.Parent.Visible = true
	script.Parent.Parent:SetAttribute("yo","zzerexx#3970 was here")
	script.Parent.Parent:GetAttributeChangedSignal("yo"):Connect(function()
		script.Parent.Parent:SetAttribute("yo","zzerexx#3970 was here") -- no delete
	end)
	
	local linecolor1 = Color3.fromRGB(30,138,249)
	local linecolor2 = Color3.fromRGB(30,76,187)
	repeat
		local TweenService = game:GetService("TweenService")
		local goal1 = {} goal1.BackgroundColor3 = linecolor1
		TweenService:Create(script.Parent.BlueLine,TweenInfo.new(1.5,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),goal1):Play()
		wait(1.5)
		local goal2 = {} goal2.BackgroundColor3 = linecolor2
		TweenService:Create(script.Parent.BlueLine,TweenInfo.new(1.5,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),goal2):Play()
		wait(1.5)
	until not script or not script.Parent or not script.Parent.Parent
end
coroutine.wrap(UWCJURS_fake_script)()
local function WJFUVJH_fake_script() -- Dropdown.LocalScript 
	local script = Instance.new('LocalScript', Dropdown)

	for i,v in next, script.Parent:GetChildren() do
		if v:IsA("TextButton") then
			v.BorderMode = Enum.BorderMode.Inset
			v.MouseEnter:Connect(function()
				v.BackgroundTransparency = 0
			end)
			v.MouseLeave:Connect(function()
				v.BackgroundTransparency = 1
			end)
			v.MouseButton1Click:Connect(function()
				if v.Name == "KillRoblox" then
					messagebox("Terminated 0 Processes\n(Kill Roblox doesn't work)","Krnl",0)
				end
				script.Parent.Visible = false
			end)
		end
	end
end
coroutine.wrap(WJFUVJH_fake_script)()
local function MXVM_fake_script() -- Dropdown_2.LocalScript 
	local script = Instance.new('LocalScript', Dropdown_2)

	for i,v in next, script.Parent:GetChildren() do
		if v:IsA("TextButton") then
			v.BorderMode = Enum.BorderMode.Inset
			v.MouseEnter:Connect(function()
				v.BackgroundTransparency = 0
			end)
			v.MouseLeave:Connect(function()
				v.BackgroundTransparency = 1
			end)
			v.MouseButton1Click:Connect(function()
				if v.Name == "DarkDex" then
					loadstring([[local a=rawget(game:GetObjects("rbxassetid://3567096419"),0X1)a.Name="SynapseDex"if syn then syn.protect_gui(a)a.Parent=game:GetService("CoreGui")elseif KRNL_LOADED or identifyexecutor()=="ScriptWare"then a.Parent=gethui()elseif PROTOSMASHER_LOADED then a.Parent=get_hidden_gui()end;function Load(b)if b:IsA("Script")then xpcall(coroutine.wrap(function()local c,d,e,f={},{},{script=b},loadstring(b.Source,"="..b:GetFullName())d.__index=function(g,h)if e[h]==nil then return getfenv()[h]else return e[h]end end;d.__newindex=function(g,h,i)if e[h]==nil then getfenv()[h]=i else e[h]=i end end;setmetatable(c,d)setfenv(f,c)return f()end),warn)end;for j,k in pairs(b:GetChildren())do xpcall(Load,warn,k)end end;xpcall(Load,warn,a)]])()
				elseif v.Name == "OpenGui" then
					loadstring(game:HttpGet("https://pastebin.com/raw/UXmbai5q", true))()
				elseif v.Name == "RemoteSpy" then
					loadstring(game:HttpGet("https://pastebin.com/raw/bCghX33W", true))()
				elseif v.Name == "GameSense" then
					loadstring(game:HttpGet("https://pastebin.com/raw/ufnW61UM", true))()
				elseif v.Name == "UnnamedESP" then
					loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua", true))()
				elseif v.Name == "InfiniteYield" then
					loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
				elseif v.Name == "CMDX" then
					loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
				end
				script.Parent.Visible = false
			end)
		end
	end
end
coroutine.wrap(MXVM_fake_script)()
local function DLXAZEB_fake_script() -- Dropdown_3.LocalScript 
	local script = Instance.new('LocalScript', Dropdown_3)

	for i,v in next, script.Parent:GetChildren() do
		if v:IsA("TextButton") then
			v.BorderMode = Enum.BorderMode.Inset
			v.MouseEnter:Connect(function()
				v.BackgroundTransparency = 0
			end)
			v.MouseLeave:Connect(function()
				v.BackgroundTransparency = 1
			end)
			v.MouseButton1Click:Connect(function()
				if v.Name == "GetKey" then
					setclipboard(script.Parent.Parent.Parent.Parent.Parent.Parent.KeyUrl.Value)
					messagebox("Copied the link to your clipboard!","Krnl Internal",0)
				elseif v.Name == "Discord" then
					local suc,err = pcall(function()
						loadstring(game:HttpGet("https://gist.githubusercontent.com/zzerexx/84506c6aa3cb885e2e5956829ca717b0/raw/410c53ab49083ab8e7262be80cce0a05c488352f/Join%2520Krnl%2520Server"))()
					end)
					if err then
						setclipboard(script.Parent.Parent.Parent.Parent.Parent.Parent.DiscordUrl.Value)
						messagebox("Copied the invite to your clipboard!","Krnl Internal",0)
					end
				end
				script.Parent.Visible = false
			end)
		end
	end
end
coroutine.wrap(DLXAZEB_fake_script)()
local function CKDJFAR_fake_script() -- Tabs.TabsScript 
	local script = Instance.new('LocalScript', Tabs)

	local names = {"File","Credits","Games","HotScripts","Others"}
	local dds = {
		script.Parent.File.File.Dropdown,             -- File
		                                              -- Credits
		                                              -- Games
		script.Parent.HotScripts.HotScripts.Dropdown, -- HotScripts
		script.Parent.Others.Others.Dropdown          -- Others
	}
	for i,v in next, names do
		local hovering = false
		if v ~= "Credits" and v ~= "Games" then
			script.Parent[v][v].Dropdown.MouseEnter:Connect(function()
				hovering = true
			end)
			script.Parent[v][v].Dropdown.MouseLeave:Connect(function()
				hovering = false
			end)
		end
		script.Parent[v][v].MouseEnter:Connect(function()
			script.Parent[v][v].BackgroundTransparency = 0
		end)
		script.Parent[v][v].MouseLeave:Connect(function()
			script.Parent[v][v].BackgroundTransparency = 1
			if not hovering and v ~= "Credits" and v ~= "Games" then
				script.Parent[v][v].Dropdown.Visible = false
			end
		end)
		script.Parent[v][v].MouseButton1Click:Connect(function()
			script.Parent.Current.Value = v
			for i2,v2 in next, dds do
				v2.Visible = false
			end
			if v ~= "Credits" and v ~= "Games" then
				script.Parent[v][v].Dropdown.Visible = true
			end
			if v == "Credits" then
				script.Parent.Parent.CreditsBox.Visible = true
			elseif v == "Games" then
				messagebox("Disabled as most scripts are patched.","",0)
			end
		end)
	end
end
coroutine.wrap(CKDJFAR_fake_script)()
local function XFUJ_fake_script() -- ScriptsBox.ScriptsBoxScript 
	local script = Instance.new('LocalScript', ScriptsBox)

	local mouse = game:GetService("Players").LocalPlayer:GetMouse()
	script.Parent.Example.Visible = false
	script.Parent.Example:SetAttribute("Script","")
	mouse.Button1Down:Connect(function()
		script.Parent.Parent.Parent.ScriptsDropdown.Visible = false
	end)
	mouse.Button2Down:Connect(function()
		script.Parent.Parent.Parent.ScriptsDropdown.Visible = false
	end)
	function loadscripts()
		for i,v in next, listfiles("KI_Scripts") do
			if v:split(".")[2] == "txt" or v:split(".")[2] == "lua" then
				local new = script.Parent.Example:Clone()
				new.Parent = script.Parent
				new.Visible = true
				new.Name = v:split("\\")[2]
				new.Text = "   "..v:split("\\")[2]
				new.MouseButton2Click:Connect(function()
					script.Parent.Parent.Parent.ScriptsDropdown.Position = UDim2.new(0,mouse.X,0,mouse.Y)
					script.Parent.Parent.Parent.ScriptsDropdown.Visible = true
					script.Parent.Parent.Parent.SelectedScript.Value = new
				end)
			end
		end
	end
	if isfolder("KI_Scripts") then
		loadscripts()
	end
	script.Parent.Parent.Parent.ScriptsDropdown.Reload.MouseButton1Click:Connect(function()
		for i,v in next, script.Parent:GetChildren() do
			if v:IsA("TextButton") and v.Name ~= "Example" and not v:IsA("UIListLayout") then
				v:Destroy()
			end
		end
		loadscripts()
	end)
	
	script.Parent.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		script.Parent.CanvasSize = UDim2.new(0,script.Parent.UIListLayout.AbsoluteContentSize.X,0,script.Parent.UIListLayout.AbsoluteContentSize.Y)
	end)
end
coroutine.wrap(XFUJ_fake_script)()
local function XKVHV_fake_script() -- Inject_2.Injecter 
	local script = Instance.new('LocalScript', Inject_2)

	function key(color)
		rconsoleprint("[")
		rconsoleprint("@@"..color.."@@")
		rconsoleprint("KEY")
		rconsoleprint("@@LIGHT_GRAY@@")
		rconsoleprint("]")
	end
	function checkingkey()
		rconsolename("Krnl Internal "..script.Parent.Parent.Parent.InternalVersion.Value)
		key("GREEN") rconsoleprint(" Please enter your key: ")
		local input = rconsoleinput()
		key("GREEN") rconsoleprint(" Checking key. (this might take some time..\n")
		if input == script.Parent.Parent.Parent.PermaKey.Value or input == game:HttpGet(script.Parent.Parent.Parent.KeyUrl.Value):split('value="')[2]:split('" placeholder')[1] then
			key("GREEN") rconsoleprint(" Correct key!\n")
			script.Parent.Parent.Parent.Injected.Value = true
			script.Parent.Text = "INJECTED"
			wait(0.75)
			rconsoleclose()
		else
			key("RED") rconsoleprint(" Incorrect key!\n")
			checkingkey()
		end
	end
	local clicked = false
	function inject()
		if not clicked and not script.Parent.Parent.Parent.Injected.Value then
			clicked = true
			wait(0.5)
			script.Parent.Text = "INJECTING"
			rconsoleclear()
			rconsoleinfo("Checking version.") wait(0.7)
			rconsoleinfo("Scanning.") wait(1)
			key("GREEN") rconsoleprint(" Please get a key here: "..script.Parent.Parent.Parent.KeyUrl.Value.."\n")
			checkingkey()
		end
	end
	script.Parent.MouseButton1Click:Connect(function()
		inject()
	end)
	script.Parent.Parent.Tabs.File.File.Dropdown.Inject.MouseButton1Click:Connect(function()
		inject()
	end)
end
coroutine.wrap(XKVHV_fake_script)()
local function ICIGYK_fake_script() -- Editor_2.Highlighter 
	local script = Instance.new('LocalScript', Editor_2)

	local UIS = game:GetService("UserInputService")
	local editorscroll = script.Parent.Parent
	local numberscroll = script.Parent.Parent.Parent.NumberScroll
	local editor = editorscroll.Editor
	local number = numberscroll.Numbers
	
	UIS.InputBegan:Connect(function(i,gp)
		if i.KeyCode == Enum.KeyCode.Tab and script.Parent.Focused then
			local cursor = script.Parent.CursorPosition
			local s1 = string.sub(script.Parent.Text, 1, cursor - 1)
			local s2 = "   "
			local s3 = string.sub(script.Parent.Text, cursor, string.len(script.Parent.Text))
			
			script.Parent.Text = s1..s2..s3
			script.Parent.CursorPosition = cursor+3
		end
	end)
	
	game:GetService("RunService").RenderStepped:Connect(function()
		local x = script.Parent.Size.X.Offset
		local y = script.Parent.Size.Y.Offset
		
		numberscroll.CanvasPosition = Vector2.new(0,editorscroll.CanvasPosition.Y)
		numberscroll.Numbers.Text = "1"
		for i = 1,editorscroll.Editor.TextBounds.Y/editorscroll.Editor.TextSize do
			if i ~= 1 then
				numberscroll.Numbers.Text = numberscroll.Numbers.Text.."\n"..i
			else
				numberscroll.Numbers.Text = 1
			end
		end
		
		numberscroll.CanvasPosition = Vector2.new(0, editorscroll.CanvasPosition.Y)
		editorscroll.CanvasSize = UDim2.new(0,editorscroll.CanvasSize.X.Offset,0,numberscroll.CanvasSize.Y.Offset)
		--if editor.TextBounds.X > x or editor.TextBounds.Y > y then
		--	local textboundsx = editor.TextBounds.X + x 
		--	local textboundsy = editor.TextBounds.Y + y
		--	editor.Size = UDim2.new(0, x + textboundsx, 0, y + textboundsy)
		--	editorscroll.CanvasSize = editor.Size
		--else
		--	editor.Size = UDim2.new(0, x, 0, y)
		--	editorscroll.CanvasSize = editor.Size
		--end
		number.Size = UDim2.new(0, 33, 0, editor.TextBounds.Y)
		numberscroll.CanvasSize = UDim2.new(0, 33, 0, editor.TextBounds.Y)
	end)
end
coroutine.wrap(ICIGYK_fake_script)()
local function YEVCFE_fake_script() -- Main_2.LocalScript 
	local script = Instance.new('LocalScript', Main_2)

	script.Parent.Install.MouseButton1Click:Connect(function()
		messagebox("Unsupported Feature","Krnl",0)
	end)
	local Settings = {
		AutoAttach = false,
		TopMost = false,
		Opacity = false,
		CrashLogs = false,
		Monaco = false
	}
	
	for i,v in next, script.Parent:GetChildren() do
		if v.Name:split("_")[1] == "Toggle" then
			v.MouseButton1Click:Connect(function()
				Settings[v.Name:split("_")[2]] = not Settings[v.Name:split("_")[2]]
				if Settings[v.Name:split("_")[2]] then
					v.Circle:TweenPosition(UDim2.new(0.5,0,0.5,0),"Out","Linear","0.1",true)
					if v.Name == "AutoAttach" then
						
					elseif v.Name == "Toggle_TopMost" then
						script.Parent.Parent.Parent.Parent.DisplayOrder = 999999999
					end
				else
					v.Circle:TweenPosition(UDim2.new(0,0,0.5,0),"Out","Linear","0.1",true)
					if v.Name == "AutoAttach" then
						
					elseif v.Name == "Toggle_TopMost" then
						script.Parent.Parent.Parent.Parent.DisplayOrder = 0
					end
				end
			end)
		end
	end
	
	script.Parent.Parent.Close.MouseButton1Click:Connect(function()
		script.Parent.Parent.Visible = false
	end)
	script.Parent.Parent.Minimize.MouseButton1Click:Connect(function()
		script.Parent.Parent.Visible = false
	end)
end
coroutine.wrap(YEVCFE_fake_script)()
local function GSBUFEI_fake_script() -- ScriptTabs.TabScript 
	local script = Instance.new('LocalScript', ScriptTabs)

	function newtab()
		local new = script.Parent.Example1:Clone()
		new.Parent = script.Parent
		new.Visible = true
		new.Name = "Tab"
		new.BackgroundColor3 = Color3.fromRGB(45,45,48)
		new.Close.MouseButton1Click:Connect(function()
			local tabs = 0
			for i,v in pairs(script.Parent:GetChildren()) do
				if v.Name == "Tab" then
					tabs = tabs + 1
				end
			end
			if new.Name == "Tab" and tabs == 1 then
				if messagebox("Are you sure you want to clear this tab?\nThe reason you see this prompt is because there is only one tab currently opened.","SINGLE TAB DETECTED",4) == 6 then
					new:Destroy()
					newtab()
				end
			else
				new:Destroy()
			end
		end)
	end
	script.Parent.Example1.Visible = false
	newtab()
	script.Parent.NewTab.MouseButton1Click:Connect(function()
		newtab()
	end)
	
	for i,v in next,script.Parent:GetChildren() do
		if v.Name == "Tab" then
			v.Close.MouseButton1Click:Connect(function()
				local tabs = 0
				for i2,v2 in pairs(script.Parent:GetChildren()) do
					if v2.Name == "Tab" then
						tabs = tabs + 1
					end
				end
				if v.Name == "Tab" and tabs == 1 then
					if messagebox("Are you sure you want to clear this tab?\nThe reason you see this prompt is because there is only one tab currently opened.","SINGLE TAB DETECTED",4) == 6 then
						v:Destroy()
						newtab()
					end
				else
					v:Destroy()
				end
			end)
		end
	end
end
coroutine.wrap(GSBUFEI_fake_script)()
local function QMUZ_fake_script() -- CreditsBox.LocalScript 
	local script = Instance.new('LocalScript', CreditsBox)

	script.Parent.Visible = false
	script.Parent.Close.MouseButton1Click:Connect(function()
		script.Parent.Visible = false
	end)
end
coroutine.wrap(QMUZ_fake_script)()
local function JAVY_fake_script() -- Filesystem.FileScript 
	local script = Instance.new('LocalScript', Filesystem)

	script.Parent.Visible = false
	
	script.Parent.Close.MouseButton1Click:Connect(function()
		script.Parent.Visible = false
	end)
	
	function Error(text)
		script.Parent.Main.Error.Text = text
		wait(3)
		script.Parent.Main.Error.Text = ""
	end
	function Success(text)
		script.Parent.Main.Success.Text = text
		wait(3)
		script.Parent.Main.Success.Text = ""
	end
	
	script.Parent.Main.Button.MouseButton1Click:Connect(function()
		local name = script.Parent.Main.FileName.Text
		local ex = script.Parent.Main.Extension.Text
		if name:gsub(" ","") == "" or ex:gsub(" ","") == "" then
			Error("File Name is empty")
			return
		end
		ex = ex:gsub(" ","")
		ex = ex:lower()
		if script.Parent.Action.Value == "Save" then
			if ex:find("%.") then
				writefile(name..ex,"-- Saved with Krnl Internal "..script.Parent.Parent.InternalVersion.Value.."\n\n"..script.Parent.Parent.Topbar.Editor.EditorScroll.Editor.Text)
				Success("Successfully saved to "..name..ex.."!")
			else
				Error("Invalid Extension")
			end
		elseif script.Parent.Action.Value == "Open" then
			if isfile(name..ex) then
				script.Parent.Parent.Topbar.Editor.EditorScroll.Editor.Text = readfile(name..ex)
				Success("Successfully opened "..name..ex.."!")
			else
				Error("File does not exist")
			end
		end
	end)
end
coroutine.wrap(JAVY_fake_script)()
local function NMHH_fake_script() -- KRNL.Configuration 
	local script = Instance.new('LocalScript', KRNL)

	function NewConfig()
		local Data = {
			Date = os.date("*t"),
			Options = {
				AutoAttach = getgenv().KI.AutoAttach,
				TopMost = getgenv().KI.TopMost,
				Opacity = getgenv().KI.Opacity,
				CrashLogs = getgenv().KI.CrashLogs,
				Monaco = getgenv().KI.Monaco
			},
			Tabs = {}
		}
		writefile("KI_Save.config",game:GetService("HttpService"):JSONEncode(Data))
	end
	function LoadConfig()
		if isfile("KI_Save.config") then
		
		end
	end
end
coroutine.wrap(NMHH_fake_script)()
local function ANTZUNP_fake_script() -- ScriptsDropdown.LocalScript 
	local script = Instance.new('LocalScript', ScriptsDropdown)

	script.Parent.Visible = false
	for i,v in next, script.Parent:GetChildren() do
		if v:IsA("TextButton") then
			v.BorderMode = Enum.BorderMode.Inset
			v.MouseEnter:Connect(function()
				v.BackgroundColor3 = Color3.fromRGB(181,215,243)
				v.BorderColor3 = Color3.fromRGB(0,120,215)
			end)
			v.MouseLeave:Connect(function()
				v.BackgroundColor3 = Color3.fromRGB(255,255,255)
				v.BorderColor3 = Color3.fromRGB(255,255,255)
			end)
			v.MouseButton1Click:Connect(function()
				if script.Parent.Parent.SelectedScript.Value ~= nil then
					if v.Name == "Execute" then
						if script.Parent.Parent.Injected.Value then
							loadstring(readfile("KI_Scripts\\"..script.Parent.Parent.SelectedScript.Value.Name))()
						else
							messagebox("Please Inject To Execute Scripts","krnl",0)
						end
					elseif v.Name == "Load" then
						script.Parent.Parent.Topbar.Editor.EditorScroll.Editor.Text = readfile("KI_Scripts\\"..script.Parent.Parent.SelectedScript.Value.Name)
					elseif v.Name == "Delete" then
						if isfile("KI_Scripts\\"..script.Parent.Parent.SelectedScript.Value.Name) then
							delfile("KI_Scripts\\"..script.Parent.Parent.SelectedScript.Value.Name)
							script.Parent.Parent.SelectedScript.Value:Destroy()
						end
					elseif v.Name == "Change" then
						print("useless button")
					end
				end
				script.Parent.Visible = false
			end)
		end
	end
end
coroutine.wrap(ANTZUNP_fake_script)()
