-- Gui to Lua
-- Version: 3.3

-- Instances:

local FakeInternal = Instance.new("ScreenGui")
local Dim = Instance.new("Frame")
local Executor = Instance.new("CanvasGroup")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local Scripts = Instance.new("ScrollingFrame")
local Editor = Instance.new("Frame")
local Lines = Instance.new("ScrollingFrame")
local Content = Instance.new("TextLabel")
local UIPadding = Instance.new("UIPadding")
local Code = Instance.new("ScrollingFrame")
local Content_2 = Instance.new("TextBox")
local UIPadding_2 = Instance.new("UIPadding")
local Buttons = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local Execute = Instance.new("TextButton")
local UIStroke = Instance.new("UIStroke")
local UICorner_3 = Instance.new("UICorner")
local Clear = Instance.new("TextButton")
local UIStroke_2 = Instance.new("UIStroke")
local UICorner_4 = Instance.new("UICorner")
local UIStroke_3 = Instance.new("UIStroke")
local Console = Instance.new("CanvasGroup")
local UICorner_5 = Instance.new("UICorner")
local UIStroke_4 = Instance.new("UIStroke")
local Log = Instance.new("ScrollingFrame")
local UICorner_6 = Instance.new("UICorner")
local UIListLayout_2 = Instance.new("UIListLayout")
local Item = Instance.new("Frame")
local Message = Instance.new("TextLabel")
local UIPadding_3 = Instance.new("UIPadding")
local Time = Instance.new("TextLabel")
local UIPadding_4 = Instance.new("UIPadding")
local Buttons_2 = Instance.new("Frame")
local UIListLayout_3 = Instance.new("UIListLayout")
local ClearLog = Instance.new("TextButton")
local UIStroke_5 = Instance.new("UIStroke")
local Label = Instance.new("TextLabel")
local UICorner_7 = Instance.new("UICorner")
local AutoScroll = Instance.new("TextButton")
local UIStroke_6 = Instance.new("UIStroke")
local Toggle = Instance.new("Frame")
local UICorner_8 = Instance.new("UICorner")
local State = Instance.new("Frame")
local UICorner_9 = Instance.new("UICorner")
local Label_2 = Instance.new("TextLabel")
local UICorner_10 = Instance.new("UICorner")
local Title_2 = Instance.new("TextLabel")
local UICorner_11 = Instance.new("UICorner")
local Settings = Instance.new("CanvasGroup")
local UICorner_12 = Instance.new("UICorner")
local Title_3 = Instance.new("TextLabel")
local UICorner_13 = Instance.new("UICorner")
local UIStroke_7 = Instance.new("UIStroke")
local Buttons_3 = Instance.new("ScrollingFrame")
local UIListLayout_4 = Instance.new("UIListLayout")
local Keybind = Instance.new("TextButton")
local UIStroke_8 = Instance.new("UIStroke")
local Bind = Instance.new("Frame")
local UICorner_14 = Instance.new("UICorner")
local Bind_2 = Instance.new("TextLabel")
local UIPadding_5 = Instance.new("UIPadding")
local Label_3 = Instance.new("TextLabel")
local UICorner_15 = Instance.new("UICorner")
local UIPadding_6 = Instance.new("UIPadding")
local SavePosition = Instance.new("TextButton")
local UIStroke_9 = Instance.new("UIStroke")
local Label_4 = Instance.new("TextLabel")
local UICorner_16 = Instance.new("UICorner")
local Button = Instance.new("Frame")
local UICorner_17 = Instance.new("UICorner")
local Bind_3 = Instance.new("TextLabel")
local UIPadding_7 = Instance.new("UIPadding")
local LoadPosition = Instance.new("TextButton")
local UIStroke_10 = Instance.new("UIStroke")
local Label_5 = Instance.new("TextLabel")
local UICorner_18 = Instance.new("UICorner")
local Button_2 = Instance.new("Frame")
local UICorner_19 = Instance.new("UICorner")
local Bind_4 = Instance.new("TextLabel")
local UIPadding_8 = Instance.new("UIPadding")
local ResetPosition = Instance.new("TextButton")
local UIStroke_11 = Instance.new("UIStroke")
local Label_6 = Instance.new("TextLabel")
local UICorner_20 = Instance.new("UICorner")
local Button_3 = Instance.new("Frame")
local UICorner_21 = Instance.new("UICorner")
local Bind_5 = Instance.new("TextLabel")
local UIPadding_9 = Instance.new("UIPadding")
local Version = Instance.new("TextLabel")
local ScriptHub = Instance.new("CanvasGroup")
local UICorner_22 = Instance.new("UICorner")
local Title_4 = Instance.new("TextLabel")
local UICorner_23 = Instance.new("UICorner")
local UIStroke_12 = Instance.new("UIStroke")
local Popular = Instance.new("ScrollingFrame")
local UIListLayout_5 = Instance.new("UIListLayout")
local UIPadding_10 = Instance.new("UIPadding")
local Item_2 = Instance.new("Frame")
local UICorner_24 = Instance.new("UICorner")
local Icon = Instance.new("ImageLabel")
local UIStroke_13 = Instance.new("UIStroke")
local UICorner_25 = Instance.new("UICorner")
local Title_5 = Instance.new("TextLabel")
local Description = Instance.new("TextLabel")
local Author = Instance.new("TextLabel")
local Button_4 = Instance.new("TextButton")
local UICorner_26 = Instance.new("UICorner")
local UIStroke_14 = Instance.new("UIStroke")
local Buttons_4 = Instance.new("Frame")
local UIListLayout_6 = Instance.new("UIListLayout")
local Popular_2 = Instance.new("TextButton")
local UIStroke_15 = Instance.new("UIStroke")
local UICorner_27 = Instance.new("UICorner")
local Personal = Instance.new("TextButton")
local UIStroke_16 = Instance.new("UIStroke")
local UICorner_28 = Instance.new("UICorner")
local Personal_2 = Instance.new("ScrollingFrame")
local UIListLayout_7 = Instance.new("UIListLayout")
local Item_3 = Instance.new("Frame")
local UICorner_29 = Instance.new("UICorner")
local Title_6 = Instance.new("TextLabel")
local Path = Instance.new("TextLabel")
local Button_5 = Instance.new("TextButton")
local UICorner_30 = Instance.new("UICorner")
local UIStroke_17 = Instance.new("UIStroke")
local UIPadding_11 = Instance.new("UIPadding")

if syn then
	syn.protect_gui(FakeInternal)
end

--Properties:

FakeInternal.Name = "FakeInternal"
FakeInternal.Parent = (gethui and gethui()) or (get_hidden_ui and get_hidden_ui()) or game.CoreGui
FakeInternal.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
FakeInternal.IgnoreGuiInset = true

Dim.Name = "Dim"
Dim.Parent = FakeInternal
Dim.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Dim.BackgroundTransparency = 0.350
Dim.BorderSizePixel = 0
Dim.Size = UDim2.new(1, 0, 1, 0)
Dim.Visible = false
Dim.ZIndex = 0

Executor.Name = "Executor"
Executor.Parent = FakeInternal
Executor.AnchorPoint = Vector2.new(0.5, 0.5)
Executor.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Executor.BorderSizePixel = 0
Executor.Position = UDim2.new(0.5, 0, 0.5, -155)
Executor.Size = UDim2.new(0, 500, 0, 300)

UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent = Executor

Title.Name = "Title"
Title.Parent = Executor
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, 0, 0, 30)
Title.ZIndex = 2
Title.Font = Enum.Font.Gotham
Title.Text = "Executor"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14.000

UICorner_2.CornerRadius = UDim.new(0, 4)
UICorner_2.Parent = Title

Scripts.Name = "Scripts"
Scripts.Parent = Executor
Scripts.Active = true
Scripts.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Scripts.BorderSizePixel = 0
Scripts.Position = UDim2.new(0, 380, 0, 40)
Scripts.Size = UDim2.new(0, 110, 1, -90)
Scripts.Visible = false
Scripts.AutomaticCanvasSize = Enum.AutomaticSize.XY
Scripts.CanvasSize = UDim2.new(0, 0, 0, 0)
Scripts.ScrollBarThickness = 8

Editor.Name = "Editor"
Editor.Parent = Executor
Editor.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Editor.BorderSizePixel = 0
Editor.ClipsDescendants = true
Editor.Position = UDim2.new(0, 10, 0, 40)
Editor.Size = UDim2.new(1, -20, 1, -90)

Lines.Name = "Lines"
Lines.Parent = Editor
Lines.Active = true
Lines.AutomaticSize = Enum.AutomaticSize.X
Lines.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Lines.BorderSizePixel = 0
Lines.Size = UDim2.new(0, 15, 1, 0)
Lines.ZIndex = 2
Lines.AutomaticCanvasSize = Enum.AutomaticSize.Y
Lines.CanvasSize = UDim2.new(0, 0, 0, 0)
Lines.ScrollingDirection = Enum.ScrollingDirection.Y
Lines.ScrollBarThickness = 0

Content.Name = "Content"
Content.Parent = Lines
Content.AutomaticSize = Enum.AutomaticSize.XY
Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Content.BackgroundTransparency = 1.000
Content.BorderSizePixel = 0
Content.Size = UDim2.new(1, 0, 1, 0)
Content.ZIndex = 2
Content.Font = Enum.Font.Code
Content.Text = "1"
Content.TextColor3 = Color3.fromRGB(150, 150, 150)
Content.TextSize = 14.000
Content.TextXAlignment = Enum.TextXAlignment.Right
Content.TextYAlignment = Enum.TextYAlignment.Top

UIPadding.Parent = Content
UIPadding.PaddingLeft = UDim.new(0, 4)
UIPadding.PaddingRight = UDim.new(0, 3)
UIPadding.PaddingTop = UDim.new(0, 5)

Code.Name = "Code"
Code.Parent = Editor
Code.Active = true
Code.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Code.BackgroundTransparency = 1.000
Code.BorderSizePixel = 0
Code.Position = UDim2.new(0, 22, 0, 0)
Code.Size = UDim2.new(1, -22, 1, 0)
Code.AutomaticCanvasSize = Enum.AutomaticSize.XY
Code.CanvasSize = UDim2.new(0, 0, 0, 0)
Code.ScrollBarThickness = 6

Content_2.Name = "Content"
Content_2.Parent = Code
Content_2.AutomaticSize = Enum.AutomaticSize.XY
Content_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Content_2.BackgroundTransparency = 1.000
Content_2.BorderSizePixel = 0
Content_2.Size = UDim2.new(1, 0, 1, 0)
Content_2.ClearTextOnFocus = false
Content_2.Font = Enum.Font.Code
Content_2.MultiLine = true
Content_2.Text = ""
Content_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Content_2.TextSize = 14.000
Content_2.TextXAlignment = Enum.TextXAlignment.Left
Content_2.TextYAlignment = Enum.TextYAlignment.Top

UIPadding_2.Parent = Content_2
UIPadding_2.PaddingLeft = UDim.new(0, 8)
UIPadding_2.PaddingTop = UDim.new(0, 5)

Buttons.Name = "Buttons"
Buttons.Parent = Executor
Buttons.AnchorPoint = Vector2.new(0, 1)
Buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Buttons.BackgroundTransparency = 1.000
Buttons.BorderSizePixel = 0
Buttons.Position = UDim2.new(0, 10, 1, -10)
Buttons.Size = UDim2.new(1, -20, 0, 30)

UIListLayout.Parent = Buttons
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)

Execute.Name = "Execute"
Execute.Parent = Buttons
Execute.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Execute.BorderSizePixel = 0
Execute.LayoutOrder = 1
Execute.Size = UDim2.new(0, 80, 1, 0)
Execute.Font = Enum.Font.Gotham
Execute.Text = "Execute"
Execute.TextColor3 = Color3.fromRGB(255, 255, 255)
Execute.TextSize = 14.000

UIStroke.Parent = Execute
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Color = Color3.fromRGB(150, 150, 150)
UIStroke.Transparency = 1.000

UICorner_3.CornerRadius = UDim.new(0, 4)
UICorner_3.Parent = Execute

Clear.Name = "Clear"
Clear.Parent = Buttons
Clear.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Clear.BorderSizePixel = 0
Clear.LayoutOrder = 2
Clear.Size = UDim2.new(0, 80, 1, 0)
Clear.Font = Enum.Font.Gotham
Clear.Text = "Clear"
Clear.TextColor3 = Color3.fromRGB(255, 255, 255)
Clear.TextSize = 14.000

UIStroke_2.Parent = Clear
UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_2.Color = Color3.fromRGB(150, 150, 150)
UIStroke_2.Transparency = 1.000

UICorner_4.CornerRadius = UDim.new(0, 4)
UICorner_4.Parent = Clear

UIStroke_3.Parent = Executor
UIStroke_3.Color = Color3.fromRGB(120, 120, 120)

Console.Name = "Console"
Console.Parent = FakeInternal
Console.AnchorPoint = Vector2.new(0.5, 0.5)
Console.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Console.BorderSizePixel = 0
Console.Position = UDim2.new(0.5, 0, 0.5, 155)
Console.Size = UDim2.new(0, 500, 0, 300)

UICorner_5.CornerRadius = UDim.new(0, 4)
UICorner_5.Parent = Console

UIStroke_4.Parent = Console
UIStroke_4.Color = Color3.fromRGB(120, 120, 120)

Log.Name = "Log"
Log.Parent = Console
Log.Active = true
Log.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Log.BorderSizePixel = 0
Log.Position = UDim2.new(0, 10, 0, 40)
Log.Size = UDim2.new(1, -20, 1, -90)
Log.CanvasSize = UDim2.new(0, 0, 0, 5)
Log.ScrollingDirection = Enum.ScrollingDirection.Y
Log.ScrollBarThickness = 6

UICorner_6.CornerRadius = UDim.new(0, 4)
UICorner_6.Parent = Log

UIListLayout_2.Parent = Log
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0, -5)

Item.Name = "Item"
Item.Parent = Log
Item.AutomaticSize = Enum.AutomaticSize.Y
Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Item.BackgroundTransparency = 1.000
Item.BorderSizePixel = 0
Item.Size = UDim2.new(1, 0, 0, 25)
Item.Visible = false

Message.Name = "Message"
Message.Parent = Item
Message.AutomaticSize = Enum.AutomaticSize.Y
Message.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Message.BackgroundTransparency = 1.000
Message.BorderSizePixel = 0
Message.Position = UDim2.new(0, 70, 0, 0)
Message.Size = UDim2.new(1, -70, 0, 10)
Message.Font = Enum.Font.Code
Message.Text = "Message"
Message.TextColor3 = Color3.fromRGB(230, 230, 230)
Message.TextSize = 14.000
Message.TextTruncate = Enum.TextTruncate.AtEnd
Message.TextWrapped = true
Message.TextXAlignment = Enum.TextXAlignment.Left
Message.TextYAlignment = Enum.TextYAlignment.Top

UIPadding_3.Parent = Message
UIPadding_3.PaddingBottom = UDim.new(0, 5)
UIPadding_3.PaddingLeft = UDim.new(0, 8)
UIPadding_3.PaddingTop = UDim.new(0, 5)

Time.Name = "Time"
Time.Parent = Item
Time.AutomaticSize = Enum.AutomaticSize.Y
Time.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Time.BackgroundTransparency = 1.000
Time.BorderSizePixel = 0
Time.Size = UDim2.new(0, 70, 0, 10)
Time.Font = Enum.Font.Code
Time.Text = "00:00:00"
Time.TextColor3 = Color3.fromRGB(150, 150, 150)
Time.TextSize = 14.000
Time.TextXAlignment = Enum.TextXAlignment.Left
Time.TextYAlignment = Enum.TextYAlignment.Top

UIPadding_4.Parent = Time
UIPadding_4.PaddingLeft = UDim.new(0, 8)
UIPadding_4.PaddingTop = UDim.new(0, 5)

Buttons_2.Name = "Buttons"
Buttons_2.Parent = Console
Buttons_2.AnchorPoint = Vector2.new(0, 1)
Buttons_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Buttons_2.BackgroundTransparency = 1.000
Buttons_2.BorderSizePixel = 0
Buttons_2.Position = UDim2.new(0, 10, 1, -10)
Buttons_2.Size = UDim2.new(1, -20, 0, 30)

UIListLayout_3.Parent = Buttons_2
UIListLayout_3.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_3.Padding = UDim.new(0, 10)

ClearLog.Name = "ClearLog"
ClearLog.Parent = Buttons_2
ClearLog.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ClearLog.BorderSizePixel = 0
ClearLog.LayoutOrder = 1
ClearLog.Size = UDim2.new(0, 85, 1, 0)
ClearLog.Font = Enum.Font.Gotham
ClearLog.Text = ""
ClearLog.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearLog.TextSize = 14.000

UIStroke_5.Parent = ClearLog
UIStroke_5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_5.Color = Color3.fromRGB(150, 150, 150)
UIStroke_5.Transparency = 1.000

Label.Name = "Label"
Label.Parent = ClearLog
Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label.BackgroundTransparency = 1.000
Label.BorderSizePixel = 0
Label.Position = UDim2.new(0, 10, 0, 0)
Label.Size = UDim2.new(1, -20, 1, 0)
Label.Font = Enum.Font.Gotham
Label.Text = "Clear Log"
Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Label.TextSize = 14.000
Label.TextXAlignment = Enum.TextXAlignment.Left

UICorner_7.CornerRadius = UDim.new(0, 4)
UICorner_7.Parent = ClearLog

AutoScroll.Name = "AutoScroll"
AutoScroll.Parent = Buttons_2
AutoScroll.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
AutoScroll.BackgroundTransparency = 1.000
AutoScroll.BorderSizePixel = 0
AutoScroll.LayoutOrder = 1
AutoScroll.Size = UDim2.new(0, 120, 1, 0)
AutoScroll.Font = Enum.Font.Gotham
AutoScroll.Text = ""
AutoScroll.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoScroll.TextSize = 14.000

UIStroke_6.Parent = AutoScroll
UIStroke_6.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_6.Color = Color3.fromRGB(150, 150, 150)
UIStroke_6.Transparency = 1.000

Toggle.Name = "Toggle"
Toggle.Parent = AutoScroll
Toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Toggle.BorderSizePixel = 0
Toggle.Size = UDim2.new(0, 30, 1, 0)

UICorner_8.CornerRadius = UDim.new(0, 4)
UICorner_8.Parent = Toggle

State.Name = "State"
State.Parent = Toggle
State.AnchorPoint = Vector2.new(0.5, 0.5)
State.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
State.BackgroundTransparency = 1.000
State.BorderSizePixel = 0
State.Position = UDim2.new(0.5, 0, 0.5, 0)
State.Size = UDim2.new(0, 24, 0, 24)

UICorner_9.CornerRadius = UDim.new(0, 4)
UICorner_9.Parent = State

Label_2.Name = "Label"
Label_2.Parent = AutoScroll
Label_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label_2.BackgroundTransparency = 1.000
Label_2.BorderSizePixel = 0
Label_2.Position = UDim2.new(0, 40, 0, 0)
Label_2.Size = UDim2.new(1, -40, 1, 0)
Label_2.Font = Enum.Font.Gotham
Label_2.Text = "Auto Scroll"
Label_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Label_2.TextSize = 14.000
Label_2.TextXAlignment = Enum.TextXAlignment.Left

UICorner_10.CornerRadius = UDim.new(0, 4)
UICorner_10.Parent = AutoScroll

Title_2.Name = "Title"
Title_2.Parent = Console
Title_2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title_2.BorderSizePixel = 0
Title_2.Size = UDim2.new(1, 0, 0, 30)
Title_2.ZIndex = 2
Title_2.Font = Enum.Font.Gotham
Title_2.Text = "Console"
Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_2.TextSize = 14.000

UICorner_11.CornerRadius = UDim.new(0, 4)
UICorner_11.Parent = Title_2

Settings.Name = "Settings"
Settings.Parent = FakeInternal
Settings.AnchorPoint = Vector2.new(0.5, 0.5)
Settings.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Settings.BorderSizePixel = 0
Settings.Position = UDim2.new(0.5, 410, 0.5, 0)
Settings.Size = UDim2.new(0, 300, 0, 300)

UICorner_12.CornerRadius = UDim.new(0, 4)
UICorner_12.Parent = Settings

Title_3.Name = "Title"
Title_3.Parent = Settings
Title_3.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title_3.BorderSizePixel = 0
Title_3.Size = UDim2.new(1, 0, 0, 30)
Title_3.ZIndex = 2
Title_3.Font = Enum.Font.Gotham
Title_3.Text = "Settings"
Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_3.TextSize = 14.000

UICorner_13.CornerRadius = UDim.new(0, 4)
UICorner_13.Parent = Title_3

UIStroke_7.Parent = Settings
UIStroke_7.Color = Color3.fromRGB(120, 120, 120)
UIStroke_7.Transparency = 1.000

Buttons_3.Name = "Buttons"
Buttons_3.Parent = Settings
Buttons_3.Active = true
Buttons_3.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Buttons_3.BackgroundTransparency = 1.000
Buttons_3.BorderSizePixel = 0
Buttons_3.Position = UDim2.new(0, 5, 0, 35)
Buttons_3.Size = UDim2.new(1, -10, 1, -65)
Buttons_3.CanvasSize = UDim2.new(0, 0, 0, 0)
Buttons_3.ScrollingDirection = Enum.ScrollingDirection.Y
Buttons_3.ScrollBarThickness = 0

UIListLayout_4.Parent = Buttons_3
UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_4.Padding = UDim.new(0, 5)

Keybind.Name = "Keybind"
Keybind.Parent = Buttons_3
Keybind.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Keybind.BackgroundTransparency = 1.000
Keybind.BorderSizePixel = 0
Keybind.LayoutOrder = 1
Keybind.Size = UDim2.new(1, 0, 0, 30)
Keybind.Font = Enum.Font.Gotham
Keybind.Text = ""
Keybind.TextColor3 = Color3.fromRGB(255, 255, 255)
Keybind.TextSize = 14.000

UIStroke_8.Parent = Keybind
UIStroke_8.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_8.Color = Color3.fromRGB(150, 150, 150)
UIStroke_8.Transparency = 1.000

Bind.Name = "Bind"
Bind.Parent = Keybind
Bind.AnchorPoint = Vector2.new(1, 0)
Bind.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Bind.BorderSizePixel = 0
Bind.Position = UDim2.new(1, 0, 0, 0)
Bind.Size = UDim2.new(0, 50, 1, 0)

UICorner_14.CornerRadius = UDim.new(0, 4)
UICorner_14.Parent = Bind

Bind_2.Name = "Bind"
Bind_2.Parent = Bind
Bind_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Bind_2.BackgroundTransparency = 1.000
Bind_2.BorderSizePixel = 0
Bind_2.Size = UDim2.new(1, 0, 1, 0)
Bind_2.Font = Enum.Font.GothamBold
Bind_2.Text = "Insert"
Bind_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Bind_2.TextSize = 14.000

UIPadding_5.Parent = Bind_2
UIPadding_5.PaddingLeft = UDim.new(0, 6)
UIPadding_5.PaddingRight = UDim.new(0, 5)

Label_3.Name = "Label"
Label_3.Parent = Keybind
Label_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label_3.BackgroundTransparency = 1.000
Label_3.BorderSizePixel = 0
Label_3.Position = UDim2.new(0, 5, 0, 0)
Label_3.Size = UDim2.new(1, 0, 1, 0)
Label_3.Font = Enum.Font.Gotham
Label_3.Text = "UI Toggle Keybind"
Label_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Label_3.TextSize = 14.000
Label_3.TextXAlignment = Enum.TextXAlignment.Left

UICorner_15.CornerRadius = UDim.new(0, 4)
UICorner_15.Parent = Keybind

UIPadding_6.Parent = Buttons_3
UIPadding_6.PaddingBottom = UDim.new(0, 5)
UIPadding_6.PaddingLeft = UDim.new(0, 5)
UIPadding_6.PaddingRight = UDim.new(0, 5)
UIPadding_6.PaddingTop = UDim.new(0, 5)

SavePosition.Name = "SavePosition"
SavePosition.Parent = Buttons_3
SavePosition.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SavePosition.BackgroundTransparency = 1.000
SavePosition.BorderSizePixel = 0
SavePosition.LayoutOrder = 1
SavePosition.Size = UDim2.new(1, 0, 0, 30)
SavePosition.Font = Enum.Font.Gotham
SavePosition.Text = ""
SavePosition.TextColor3 = Color3.fromRGB(255, 255, 255)
SavePosition.TextSize = 14.000

UIStroke_9.Parent = SavePosition
UIStroke_9.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_9.Color = Color3.fromRGB(150, 150, 150)
UIStroke_9.Transparency = 1.000

Label_4.Name = "Label"
Label_4.Parent = SavePosition
Label_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label_4.BackgroundTransparency = 1.000
Label_4.BorderSizePixel = 0
Label_4.Position = UDim2.new(0, 5, 0, 0)
Label_4.Size = UDim2.new(1, 0, 1, 0)
Label_4.Font = Enum.Font.Gotham
Label_4.Text = "Save UI Position"
Label_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Label_4.TextSize = 14.000
Label_4.TextXAlignment = Enum.TextXAlignment.Left

UICorner_16.CornerRadius = UDim.new(0, 4)
UICorner_16.Parent = SavePosition

Button.Name = "Button"
Button.Parent = SavePosition
Button.AnchorPoint = Vector2.new(1, 0)
Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Button.BorderSizePixel = 0
Button.Position = UDim2.new(1, 0, 0, 0)
Button.Size = UDim2.new(0, 46, 1, 0)

UICorner_17.CornerRadius = UDim.new(0, 4)
UICorner_17.Parent = Button

Bind_3.Name = "Bind"
Bind_3.Parent = Button
Bind_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Bind_3.BackgroundTransparency = 1.000
Bind_3.BorderSizePixel = 0
Bind_3.Size = UDim2.new(1, 0, 1, 0)
Bind_3.Font = Enum.Font.GothamBold
Bind_3.Text = "Save"
Bind_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Bind_3.TextSize = 14.000

UIPadding_7.Parent = Bind_3
UIPadding_7.PaddingLeft = UDim.new(0, 6)
UIPadding_7.PaddingRight = UDim.new(0, 5)

LoadPosition.Name = "LoadPosition"
LoadPosition.Parent = Buttons_3
LoadPosition.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
LoadPosition.BackgroundTransparency = 1.000
LoadPosition.BorderSizePixel = 0
LoadPosition.LayoutOrder = 1
LoadPosition.Size = UDim2.new(1, 0, 0, 30)
LoadPosition.Font = Enum.Font.Gotham
LoadPosition.Text = ""
LoadPosition.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadPosition.TextSize = 14.000

UIStroke_10.Parent = LoadPosition
UIStroke_10.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_10.Color = Color3.fromRGB(150, 150, 150)
UIStroke_10.Transparency = 1.000

Label_5.Name = "Label"
Label_5.Parent = LoadPosition
Label_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label_5.BackgroundTransparency = 1.000
Label_5.BorderSizePixel = 0
Label_5.Position = UDim2.new(0, 5, 0, 0)
Label_5.Size = UDim2.new(1, 0, 1, 0)
Label_5.Font = Enum.Font.Gotham
Label_5.Text = "Load Saved UI Position"
Label_5.TextColor3 = Color3.fromRGB(255, 255, 255)
Label_5.TextSize = 14.000
Label_5.TextXAlignment = Enum.TextXAlignment.Left

UICorner_18.CornerRadius = UDim.new(0, 4)
UICorner_18.Parent = LoadPosition

Button_2.Name = "Button"
Button_2.Parent = LoadPosition
Button_2.AnchorPoint = Vector2.new(1, 0)
Button_2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Button_2.BorderSizePixel = 0
Button_2.Position = UDim2.new(1, 0, 0, 0)
Button_2.Size = UDim2.new(0, 46, 1, 0)

UICorner_19.CornerRadius = UDim.new(0, 4)
UICorner_19.Parent = Button_2

Bind_4.Name = "Bind"
Bind_4.Parent = Button_2
Bind_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Bind_4.BackgroundTransparency = 1.000
Bind_4.BorderSizePixel = 0
Bind_4.Size = UDim2.new(1, 0, 1, 0)
Bind_4.Font = Enum.Font.GothamBold
Bind_4.Text = "Load"
Bind_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Bind_4.TextSize = 14.000

UIPadding_8.Parent = Bind_4
UIPadding_8.PaddingLeft = UDim.new(0, 6)
UIPadding_8.PaddingRight = UDim.new(0, 5)

ResetPosition.Name = "ResetPosition"
ResetPosition.Parent = Buttons_3
ResetPosition.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ResetPosition.BackgroundTransparency = 1.000
ResetPosition.BorderSizePixel = 0
ResetPosition.LayoutOrder = 1
ResetPosition.Size = UDim2.new(1, 0, 0, 30)
ResetPosition.Font = Enum.Font.Gotham
ResetPosition.Text = ""
ResetPosition.TextColor3 = Color3.fromRGB(255, 255, 255)
ResetPosition.TextSize = 14.000

UIStroke_11.Parent = ResetPosition
UIStroke_11.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_11.Color = Color3.fromRGB(150, 150, 150)
UIStroke_11.Transparency = 1.000

Label_6.Name = "Label"
Label_6.Parent = ResetPosition
Label_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label_6.BackgroundTransparency = 1.000
Label_6.BorderSizePixel = 0
Label_6.Position = UDim2.new(0, 5, 0, 0)
Label_6.Size = UDim2.new(1, 0, 1, 0)
Label_6.Font = Enum.Font.Gotham
Label_6.Text = "Reset UI Position"
Label_6.TextColor3 = Color3.fromRGB(255, 255, 255)
Label_6.TextSize = 14.000
Label_6.TextXAlignment = Enum.TextXAlignment.Left

UICorner_20.CornerRadius = UDim.new(0, 4)
UICorner_20.Parent = ResetPosition

Button_3.Name = "Button"
Button_3.Parent = ResetPosition
Button_3.AnchorPoint = Vector2.new(1, 0)
Button_3.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Button_3.BorderSizePixel = 0
Button_3.Position = UDim2.new(1, 0, 0, 0)
Button_3.Size = UDim2.new(0, 49, 1, 0)

UICorner_21.CornerRadius = UDim.new(0, 4)
UICorner_21.Parent = Button_3

Bind_5.Name = "Bind"
Bind_5.Parent = Button_3
Bind_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Bind_5.BackgroundTransparency = 1.000
Bind_5.BorderSizePixel = 0
Bind_5.Size = UDim2.new(1, 0, 1, 0)
Bind_5.Font = Enum.Font.GothamBold
Bind_5.Text = "Reset"
Bind_5.TextColor3 = Color3.fromRGB(255, 255, 255)
Bind_5.TextSize = 14.000

UIPadding_9.Parent = Bind_5
UIPadding_9.PaddingLeft = UDim.new(0, 6)
UIPadding_9.PaddingRight = UDim.new(0, 5)

Version.Name = "Version"
Version.Parent = Settings
Version.AnchorPoint = Vector2.new(0, 1)
Version.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Version.BackgroundTransparency = 1.000
Version.LayoutOrder = 100
Version.Position = UDim2.new(0, 0, 1, -5)
Version.Size = UDim2.new(1, 0, 0, 20)
Version.Font = Enum.Font.Gotham
Version.Text = "v1.0.0 | made by zzerexx#3970"
Version.TextColor3 = Color3.fromRGB(255, 255, 255)
Version.TextSize = 14.000

ScriptHub.Name = "ScriptHub"
ScriptHub.Parent = FakeInternal
ScriptHub.AnchorPoint = Vector2.new(0.5, 0.5)
ScriptHub.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ScriptHub.BorderSizePixel = 0
ScriptHub.Position = UDim2.new(0.5, -410, 0.5, 0)
ScriptHub.Size = UDim2.new(0, 300, 0, 300)

UICorner_22.CornerRadius = UDim.new(0, 4)
UICorner_22.Parent = ScriptHub

Title_4.Name = "Title"
Title_4.Parent = ScriptHub
Title_4.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title_4.BorderSizePixel = 0
Title_4.Size = UDim2.new(1, 0, 0, 30)
Title_4.ZIndex = 2
Title_4.Font = Enum.Font.Gotham
Title_4.Text = "Script Hub"
Title_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_4.TextSize = 14.000

UICorner_23.CornerRadius = UDim.new(0, 4)
UICorner_23.Parent = Title_4

UIStroke_12.Parent = ScriptHub
UIStroke_12.Color = Color3.fromRGB(120, 120, 120)

Popular.Name = "Popular"
Popular.Parent = ScriptHub
Popular.Active = true
Popular.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Popular.BackgroundTransparency = 1.000
Popular.BorderSizePixel = 0
Popular.Position = UDim2.new(0, 5, 0, 65)
Popular.Size = UDim2.new(1, -10, 1, -70)
Popular.CanvasSize = UDim2.new(0, 0, 0, 0)
Popular.ScrollingDirection = Enum.ScrollingDirection.Y
Popular.ScrollBarThickness = 0

UIListLayout_5.Parent = Popular
UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_5.Padding = UDim.new(0, 10)

UIPadding_10.Parent = Popular
UIPadding_10.PaddingBottom = UDim.new(0, 5)
UIPadding_10.PaddingLeft = UDim.new(0, 5)
UIPadding_10.PaddingRight = UDim.new(0, 5)
UIPadding_10.PaddingTop = UDim.new(0, 5)

Item_2.Name = "Item"
Item_2.Parent = Popular
Item_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Item_2.BackgroundTransparency = 1.000
Item_2.Size = UDim2.new(1, 0, 0, 60)
Item_2.Visible = false

UICorner_24.CornerRadius = UDim.new(0, 4)
UICorner_24.Parent = Item_2

Icon.Name = "Icon"
Icon.Parent = Item_2
Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon.BackgroundTransparency = 1.000
Icon.BorderSizePixel = 0
Icon.Size = UDim2.new(0, 60, 0, 60)
Icon.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

UIStroke_13.Parent = Icon
UIStroke_13.Color = Color3.fromRGB(120, 120, 120)
UIStroke_13.Enabled = false

UICorner_25.CornerRadius = UDim.new(0, 4)
UICorner_25.Parent = Icon

Title_5.Name = "Title"
Title_5.Parent = Item_2
Title_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_5.BackgroundTransparency = 1.000
Title_5.BorderSizePixel = 0
Title_5.Position = UDim2.new(0, 70, 0, 0)
Title_5.Size = UDim2.new(1, -70, 0, 20)
Title_5.Font = Enum.Font.GothamBold
Title_5.Text = "Example Script"
Title_5.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_5.TextSize = 16.000
Title_5.TextXAlignment = Enum.TextXAlignment.Left

Description.Name = "Description"
Description.Parent = Item_2
Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Description.BackgroundTransparency = 1.000
Description.BorderSizePixel = 0
Description.Position = UDim2.new(0, 70, 0, 34)
Description.Size = UDim2.new(1, -75, 0, 26)
Description.Font = Enum.Font.Gotham
Description.Text = "A short description about the script."
Description.TextColor3 = Color3.fromRGB(160, 160, 160)
Description.TextSize = 12.000
Description.TextTruncate = Enum.TextTruncate.AtEnd
Description.TextWrapped = true
Description.TextXAlignment = Enum.TextXAlignment.Left
Description.TextYAlignment = Enum.TextYAlignment.Top

Author.Name = "Author"
Author.Parent = Item_2
Author.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Author.BackgroundTransparency = 1.000
Author.BorderSizePixel = 0
Author.Position = UDim2.new(0, 70, 0, 20)
Author.Size = UDim2.new(1, -70, 0, 14)
Author.Font = Enum.Font.Gotham
Author.Text = "By: Creator"
Author.TextColor3 = Color3.fromRGB(255, 255, 255)
Author.TextSize = 12.000
Author.TextTruncate = Enum.TextTruncate.AtEnd
Author.TextXAlignment = Enum.TextXAlignment.Left
Author.TextYAlignment = Enum.TextYAlignment.Top

Button_4.Name = "Button"
Button_4.Parent = Item_2
Button_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Button_4.BackgroundTransparency = 1.000
Button_4.BorderSizePixel = 0
Button_4.Size = UDim2.new(1, 0, 1, 0)
Button_4.Font = Enum.Font.SourceSans
Button_4.Text = ""
Button_4.TextColor3 = Color3.fromRGB(0, 0, 0)
Button_4.TextSize = 14.000

UICorner_26.CornerRadius = UDim.new(0, 4)
UICorner_26.Parent = Button_4

UIStroke_14.Parent = Button_4
UIStroke_14.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_14.Color = Color3.fromRGB(150, 150, 150)
UIStroke_14.Transparency = 1.000

Buttons_4.Name = "Buttons"
Buttons_4.Parent = ScriptHub
Buttons_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Buttons_4.BackgroundTransparency = 1.000
Buttons_4.BorderSizePixel = 0
Buttons_4.Position = UDim2.new(0, 10, 0, 40)
Buttons_4.Size = UDim2.new(1, -20, 0, 20)

UIListLayout_6.Parent = Buttons_4
UIListLayout_6.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_6.Padding = UDim.new(0, 10)

Popular_2.Name = "Popular"
Popular_2.Parent = Buttons_4
Popular_2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Popular_2.BorderSizePixel = 0
Popular_2.LayoutOrder = 1
Popular_2.Size = UDim2.new(0.5, -5, 1, 0)
Popular_2.Font = Enum.Font.Gotham
Popular_2.Text = "Popular"
Popular_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Popular_2.TextSize = 14.000

UIStroke_15.Parent = Popular_2
UIStroke_15.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_15.Color = Color3.fromRGB(150, 150, 150)
UIStroke_15.Transparency = 1.000

UICorner_27.CornerRadius = UDim.new(0, 4)
UICorner_27.Parent = Popular_2

Personal.Name = "Personal"
Personal.Parent = Buttons_4
Personal.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Personal.BorderSizePixel = 0
Personal.LayoutOrder = 2
Personal.Size = UDim2.new(0.5, -5, 1, 0)
Personal.Font = Enum.Font.Gotham
Personal.Text = "Personal"
Personal.TextColor3 = Color3.fromRGB(255, 255, 255)
Personal.TextSize = 14.000

UIStroke_16.Parent = Personal
UIStroke_16.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_16.Color = Color3.fromRGB(150, 150, 150)
UIStroke_16.Transparency = 1.000

UICorner_28.CornerRadius = UDim.new(0, 4)
UICorner_28.Parent = Personal

Personal_2.Name = "Personal"
Personal_2.Parent = ScriptHub
Personal_2.Active = true
Personal_2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Personal_2.BackgroundTransparency = 1.000
Personal_2.BorderSizePixel = 0
Personal_2.Position = UDim2.new(0, 5, 0, 65)
Personal_2.Size = UDim2.new(1, -10, 1, -70)
Personal_2.Visible = false
Personal_2.CanvasSize = UDim2.new(0, 0, 0, 0)
Personal_2.ScrollingDirection = Enum.ScrollingDirection.Y
Personal_2.ScrollBarThickness = 0

UIListLayout_7.Parent = Personal_2
UIListLayout_7.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_7.Padding = UDim.new(0, 2)

Item_3.Name = "Item"
Item_3.Parent = Personal_2
Item_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Item_3.BackgroundTransparency = 1.000
Item_3.Size = UDim2.new(1, 0, 0, 36)
Item_3.Visible = false

UICorner_29.CornerRadius = UDim.new(0, 4)
UICorner_29.Parent = Item_3

Title_6.Name = "Title"
Title_6.Parent = Item_3
Title_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_6.BackgroundTransparency = 1.000
Title_6.BorderSizePixel = 0
Title_6.Position = UDim2.new(0, 5, 0, 0)
Title_6.Size = UDim2.new(1, -5, 0, 20)
Title_6.Font = Enum.Font.GothamBold
Title_6.Text = "Example Script"
Title_6.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_6.TextSize = 16.000
Title_6.TextXAlignment = Enum.TextXAlignment.Left

Path.Name = "Path"
Path.Parent = Item_3
Path.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Path.BackgroundTransparency = 1.000
Path.BorderSizePixel = 0
Path.Position = UDim2.new(0, 5, 0, 20)
Path.Size = UDim2.new(1, -5, 0, 14)
Path.Font = Enum.Font.Gotham
Path.Text = "Example Script.lua"
Path.TextColor3 = Color3.fromRGB(160, 160, 160)
Path.TextSize = 12.000
Path.TextTruncate = Enum.TextTruncate.AtEnd
Path.TextXAlignment = Enum.TextXAlignment.Left
Path.TextYAlignment = Enum.TextYAlignment.Top

Button_5.Name = "Button"
Button_5.Parent = Item_3
Button_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Button_5.BackgroundTransparency = 1.000
Button_5.BorderSizePixel = 0
Button_5.Size = UDim2.new(1, 0, 1, 0)
Button_5.Font = Enum.Font.SourceSans
Button_5.Text = ""
Button_5.TextColor3 = Color3.fromRGB(0, 0, 0)
Button_5.TextSize = 14.000

UICorner_30.CornerRadius = UDim.new(0, 4)
UICorner_30.Parent = Button_5

UIStroke_17.Parent = Button_5
UIStroke_17.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke_17.Color = Color3.fromRGB(150, 150, 150)
UIStroke_17.Transparency = 1.000

UIPadding_11.Parent = Personal_2
UIPadding_11.PaddingBottom = UDim.new(0, 5)
UIPadding_11.PaddingLeft = UDim.new(0, 5)
UIPadding_11.PaddingRight = UDim.new(0, 5)
UIPadding_11.PaddingTop = UDim.new(0, 5)

-- Scripts:

local function XCSQJ_fake_script() -- Editor.EditorScript 
	local script = Instance.new('LocalScript', Editor)

	if not shared.FakeInternal then
		shared.FakeInternal = {}
	end
	
	local uis = game:GetService("UserInputService")
	local lines = script.Parent.Lines
	local code = script.Parent.Code
	
	-- EDITOR SETTINGS
	local SettingChanged = Instance.new("BindableEvent")
	local Editor = setmetatable({
		Font = "Code",
		TextSize = 14,
		IndentSize = 4
	}, {
		__newindex = function(...)
			SettingChanged:Fire(...)
		end
	})
	
	local Utils = {
		Settings = Editor
	}
	
	function Utils:GetEditorText()
		return code.Content.Text
	end
	function Utils:SetEditorText(text)
		code.Content.Text = text
	end
	
	shared.FakeInternal.Editor = Utils
	
	-----
	
	local function PropertyChanged(obj, property, func)
		return obj:GetPropertyChangedSignal(property):Connect(function()
			func(obj, obj[property])
		end)
	end
	
	PropertyChanged(code, "CanvasPosition", function(self, canvaspos)
		lines.CanvasPosition = Vector2.new(0, canvaspos.Y)
	end)
	PropertyChanged(lines, "CanvasPosition", function(self, canvaspos)
		code.CanvasPosition = Vector2.new(code.CanvasPosition.X, canvaspos.Y)
	end)
	
	PropertyChanged(code.Content, "Text", function(self, text)
		local _, NewLines = text:gsub("\n", "\n")
		local LineCount = 1 + NewLines
		local LineText = ""
		for i = 1, LineCount do
			LineText ..= i.."\n"
		end
		lines.Content.Text = LineText
		
		local TabSize = Editor.IndentSize
		local TabPosition = text:find("\t")
		local NoTabs, TabCount = text:gsub("\t", string.rep(" ", TabSize))
		self.Text = NoTabs
		if TabCount > 0 then
			self.CursorPosition = TabPosition + TabSize
		end
	end)
	
	SettingChanged.Event:Connect(function(self, i, v)
		lines.Content[i] = v 
		code.Content[i] = v
	end)
end
coroutine.wrap(XCSQJ_fake_script)()
local function QCCDVTQ_fake_script() -- Buttons.ButtonsScript 
	local script = Instance.new('LocalScript', Buttons)

	local TweenService = game:GetService("TweenService")
	local ButtonHover = Color3.fromRGB(120, 120, 120)
	local ButtonDown = Color3.fromRGB(170, 170, 170)
	
	local info = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local function Tween(obj, props)
		TweenService:Create(obj, info, props):Play()
	end
	
	local Editor = shared.FakeInternal.Editor
	local Activated = {
		Execute = function()
			xpcall(function()
				local code = Editor:GetEditorText()
				loadstring(code)()
			end, function(err)
				shared.FakeInternal.Console:NewItem(err, Enum.MessageType.MessageError)
			end)
		end,
		Clear = function()
			Editor:SetEditorText("")
		end
	}
	
	for i,v in next, script.Parent:GetChildren() do
		if v:IsA("TextButton") then
			v.AutoButtonColor = false
			
			local Stroke = v.UIStroke
			v.MouseEnter:Connect(function()
				Stroke.Transparency = 1
				Stroke.Color = ButtonHover
				Tween(Stroke, {Transparency = 0})
			end)
			v.MouseLeave:Connect(function()
				Tween(Stroke, {Transparency = 1})
			end)
			v.MouseButton1Down:Connect(function()
				Tween(Stroke, {Color = ButtonDown})
			end)
			v.MouseButton1Up:Connect(function()
				Tween(Stroke, {Color = ButtonHover})
			end)
			v.Activated:Connect(Activated[v.Name])
		end
	end
end
coroutine.wrap(QCCDVTQ_fake_script)()
local function SIPZBJ_fake_script() -- FakeInternal.MainScript 
	local script = Instance.new('LocalScript', FakeInternal)

	if not shared.FakeInternal then
		shared.FakeInternal = {}
	end
	
	shared.FakeInternal.Version = "v1.0.0"
	
	local UserInputService = game:GetService("UserInputService")
	local ContextActionService = game:GetService("ContextActionService")
	local TweenService = game:GetService("TweenService")
	local Camera = workspace.CurrentCamera
	local FieldOfView = Camera.FieldOfView
	local ButtonHover = Color3.fromRGB(120, 120, 120)
	local ButtonDown = Color3.fromRGB(170, 170, 170)
	
	local BlurName = ""
	for _ = 1, math.random(16, 32) do
		BlurName ..= string.char(math.random(97, 122))
	end
	local Blur = Instance.new("BlurEffect")
	Blur.Enabled = true
	Blur.Name = BlurName
	Blur.Size = 0
	Blur.Parent = game:GetService("Lighting")
	
	local info = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local function Tween(obj, props, duration)
		if duration then
			TweenService:Create(obj, TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), props):Play()
			return
		end
		TweenService:Create(obj, info, props):Play()
	end
	
	local DRAG_SPEED = 0.075
	local DRAG_INFO = TweenInfo.new(DRAG_SPEED)
	local function SmoothDrag(a)
		local toggle = nil
		local input = nil
		local start = nil
		local pos = nil
		local startpos = nil
	
		local function Update(i)
			local delta = i.Position - start
			local pos = UDim2.new(startpos.X.Scale, startpos.X.Offset + delta.X, startpos.Y.Scale, startpos.Y.Offset + delta.Y)
			TweenService:Create(a, DRAG_INFO, {Position = pos}):Play()
		end
	
		a.InputBegan:Connect(function(i)
			if i.UserInputType.Name == "MouseButton1" and UserInputService:GetFocusedTextBox() == nil then
				toggle = true
				start = i.Position
				startpos = a.Position
				i.Changed:Connect(function()
					if i.UserInputState.Name == "End" then
						toggle = false
					end
				end)
			end
		end)
		a.InputChanged:Connect(function(i)
			if i.UserInputType.Name == "MouseMovement" then
				input = i
			end
		end)
		UserInputService.InputChanged:Connect(function(i)
			if i == input and toggle then
				Update(i)
			end
		end)
	end
	local function Ternary(condition, iftrue, iffalse)
		if condition then
			return iftrue
		end
		return iffalse
	end
	
	local Dim = script.Parent.Dim
	local Executor = script.Parent.Executor
	local Console = script.Parent.Console
	local Settings = script.Parent.Settings
	local ScriptHub = script.Parent.ScriptHub
	local Windows = {Executor, Console, Settings, ScriptHub}
	Dim.Visible = true
	Dim.BackgroundTransparency = 1
	for _,v in next, Windows do
		v.Visible = false
		v.GroupTransparency = 1
		v.UIStroke.Transparency = 1
		SmoothDrag(v)
	end
	
	local ActionName = "Toggle Internal"
	local UIState = false
	local PopularVisible = true
	local PersonalVisible = false
	local function ToggleUI(action, state, i)
		if action == ActionName and state == Enum.UserInputState.End then
			UIState = not UIState
			if UIState then
				for _,v in next, Windows do
					v.Visible = true
				end
			end
			local Transparency = UIState and 0 or 1
			Tween(Dim, {BackgroundTransparency = UIState and 0.35 or 1})
			Tween(Camera, {FieldOfView = UIState and FieldOfView - 10 or FieldOfView})
			Tween(Blur, {Size = (UIState and 12 or 0)})
			for _,v in next, Windows do
				Tween(v, {GroupTransparency = Transparency})
				Tween(v.UIStroke, {Transparency = Transparency})
				if not UIState then
					task.delay(0.2, function()
						v.Visible = false
					end)
				end
			end
		end
	end
	local function BindToggle(key)
		ContextActionService:UnbindAction(ActionName)
		ContextActionService:BindAction(ActionName, ToggleUI, true, key)
		if UserInputService.TouchEnabled then
			local ActionButton = ContextActionService:GetButton(ActionName)
			ContextActionService:SetTitle(ActionName, "Internal UI")
			ContextActionService:SetPosition(ActionName, UDim2.new(1, -220, -1, 5))
			ActionButton.Size = UDim2.fromOffset(80, 80)
		end
	end
	BindToggle(Enum.KeyCode.Insert)
	
	shared.FakeInternal.BindToggle = BindToggle
end
coroutine.wrap(SIPZBJ_fake_script)()
local function WJDT_fake_script() -- Buttons_2.ButtonsScript_Console 
	local script = Instance.new('LocalScript', Buttons_2)

	local TweenService = game:GetService("TweenService")
	local ButtonHover = Color3.fromRGB(120, 120, 120)
	local ButtonDown = Color3.fromRGB(170, 170, 170)
	
	local info = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local function Tween(obj, props)
		TweenService:Create(obj, info, props):Play()
	end
	
	-- CONSOLE SETTINGS
	local SettingChanged = Instance.new("BindableEvent")
	local Console = setmetatable({
		Check = false,
		AutoScroll = false
	}, {
		__newindex = function(...)
			SettingChanged:Fire(...)
		end
	})
	
	local Utils = shared.FakeInternal.Console
	
	if not shared.FakeInternal.Console then
		shared.FakeInternal.Console = {}
	end
	shared.FakeInternal.ConsoleSettings = Console
	
	local States = {}
	local Activated = {
		AutoScroll = function()
			-- brah
		end,
		ClearLog = function()
			for _,v in next, script.Parent.Parent.Log:GetChildren() do
				if v:IsA("Frame") and v.Name ~= "Item" then
					v:Destroy()
				end
			end
		end,
	}
	
	for i,v in next, script.Parent:GetChildren() do
		if v:IsA("TextButton") then
			v.AutoButtonColor = false
			local Toggle = v:FindFirstChild("Toggle")
			if Toggle then
				States[v] = v.Toggle.State.Transparency == 0
			end
			
			local Stroke = v.UIStroke
			v.MouseEnter:Connect(function()
				Stroke.Transparency = 1
				Stroke.Color = ButtonHover
				Tween(Stroke, {Transparency = 0})
			end)
			v.MouseLeave:Connect(function()
				Tween(Stroke, {Transparency = 1})
			end)
			v.MouseButton1Down:Connect(function()
				Tween(Stroke, {Color = ButtonDown})
			end)
			v.MouseButton1Up:Connect(function()
				Tween(Stroke, {Color = ButtonHover})
			end)
			v.Activated:Connect(function()
				if Toggle then
					local state = Toggle.State
					States[v] = not States[v]
					Tween(state, {Transparency = States[v] and 0 or 1})
					Console[v.Name] = not Console[v.Name]
				end
				Activated[v.Name]()
			end)
		end
	end
end
coroutine.wrap(WJDT_fake_script)()
local function NXBCNDY_fake_script() -- Console.ConsoleScript 
	local script = Instance.new('LocalScript', Console)

	if not shared.FakeInternal then
		shared.FakeInternal = {}
	end
	
	local LogService = game:GetService("LogService")
	local ScriptContext = game:GetService("ScriptContext")
	local Types = {
		[0] = Color3.fromRGB(230, 230, 230), -- Output
		[1] = Color3.fromRGB(50, 180, 255), -- Info
		[2] = Color3.fromRGB(250, 170, 0), -- Warning
		[3] = Color3.fromRGB(250, 50, 0) -- Error
	}
	local Log = script.Parent.Log
	local LastLog = nil
	local LastLogMsg = ""
	local LogRepeats = 1
	
	local Utils = {}
	
	if not shared.FakeInternal.Console then
		shared.FakeInternal.Console = {}
	end
	shared.FakeInternal.Console = Utils
	
	function Utils:NewItem(message, type)
		if message == nil then
			message = "Error occurred, no output from Lua."
		end
		
		if message == LastLogMsg then
			LogRepeats += 1
			
			LastLog.Message.Text = LastLog.Message.Text:gsub(" %(x%d+%)$", "")..string.format(" (x%s)", LogRepeats)
			return
		end
		LogRepeats = 1
		
		local new = Log.Item:Clone()
		new.Parent = Log
		new.Visible = true
		
		local color = Types[type.Value]
		local h, s, v = color:ToHSV()
		local darkercolor = Color3.fromHSV(h, s, 0.6)
		
		local date = os.date("*t")
		local hour = date.hour
		local min = date.min
		local sec = date.sec
		if #tostring(hour) == 1 then
			hour = "0"..hour
		end
		if #tostring(min) == 1 then
			min = "0"..min
		end
		if #tostring(sec) == 1 then
			sec = "0"..sec
		end
		local time = string.format("%s:%s:%s", hour, min, sec)
		new.Time.Text = time
		new.Time.TextColor3 = darkercolor
		new.Name = time
		
		new.Message.Text = message
		new.Message.TextColor3 = color
		
		if shared.FakeInternal.ConsoleSettings.AutoScroll then
			local abs = Log.AbsoluteCanvasSize
			Log.CanvasPosition = Vector2.new(0, abs.Y + 100)
		end
		
		LastLog = new
		LastLogMsg = message
	end
	
	local function PropertyChanged(obj, property, func)
		return obj:GetPropertyChangedSignal(property):Connect(function()
			func(obj, obj[property])
		end)
	end
	
	LogService.MessageOut:Connect(function(message, type)
		Utils:NewItem(message, type)
	end)
	
	PropertyChanged(Log.UIListLayout, "AbsoluteContentSize", function(self, abs)
		Log.CanvasSize = UDim2.fromOffset(abs.X, abs.Y)
	end)
end
coroutine.wrap(NXBCNDY_fake_script)()
local function CLAL_fake_script() -- Settings.SettingsScript 
	local script = Instance.new('LocalScript', Settings)

	local UserInputService = game:GetService("UserInputService")
	local TextService = game:GetService("TextService")
	local HttpService = game:GetService("HttpService")
	local ContextActionService = game:GetService("ContextActionService")
	local Buttons = script.Parent.Buttons
	
	local TweenService = game:GetService("TweenService")
	local ButtonHover = Color3.fromRGB(120, 120, 120)
	local ButtonDown = Color3.fromRGB(170, 170, 170)
	
	local info = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local function Tween(obj, props)
		TweenService:Create(obj, info, props):Play()
	end
	local function StrokeEffect(v)
		local Stroke = v.UIStroke
		v.AutoButtonColor = false
		v.MouseEnter:Connect(function()
			Stroke.Transparency = 1
			Stroke.Color = ButtonHover
			Tween(Stroke, {Transparency = 0})
		end)
		v.MouseLeave:Connect(function()
			Tween(Stroke, {Transparency = 1})
		end)
		v.MouseButton1Down:Connect(function()
			Tween(Stroke, {Color = ButtonDown})
		end)
		v.MouseButton1Up:Connect(function()
			Tween(Stroke, {Color = ButtonHover})
		end)
	end
	
	Buttons.CanvasSize = UDim2.fromOffset(0, Buttons.UIListLayout.AbsoluteContentSize.Y + 10)
	
	
	local Keybind = Buttons.Keybind
	local CheckingBind = false
	local function SetBind(bind)
		Keybind.Bind.Bind.Text = bind
		local bounds = Keybind.Bind.Bind.TextBounds
		local size = UDim2.new(0, math.max(bounds.X + 12, 30), 1, 0)
		Tween(Keybind.Bind, {Size = size})
	
		shared.FakeInternal.BindToggle(Enum.KeyCode[bind])
	end
	Keybind.Activated:Connect(function()
		if CheckingBind then return end
		CheckingBind = true
		
		Tween(Keybind.Bind, {Size = UDim2.new(0, 30, 1, 0)})
		Keybind.Bind.Bind.Text = "..."
	end)
	
	UserInputService.InputEnded:Connect(function(i, gp)
		if CheckingBind and i.UserInputType == Enum.UserInputType.Keyboard then
			SetBind(i.KeyCode.Name)
			CheckingBind = false
		end
	end)
	
	local MainDirectory = "Internal UI"
	local SaveDirectory = "Internal UI\\UI.json"
	local main = script.Parent.Parent
	local defaultpos = {
		Executor = {
			X = 0,
			Y = -155
		},
		Console = {
			X = 0,
			Y = 155
		},
		ScriptHub = {
			X = -410,
			Y = 0
		},
		Settings = {
			X = 410,
			Y = 0
		}
	}
	local function GetPosition(window)
		local window = main:FindFirstChild(window)
		if window then
			return {
				X = window.Position.X.Offset,
				Y = window.Position.Y.Offset
			}
		end
	end
	local function SaveUIPositions()
		if getgenv then
			if not isfolder(MainDirectory) then
				makefolder(MainDirectory)
			end
			local data = {
				Executor = GetPosition("Executor"),
				Console = GetPosition("Console"),
				ScriptHub = GetPosition("ScriptHub"),
				Settings = GetPosition("Settings"),
				Toggle = ContextActionService:GetBoundActionInfo("Toggle Internal").inputTypes[1].Name
			}
			local encoded = HttpService:JSONEncode(data)
			writefile(SaveDirectory, encoded)
		end
	end
	local function LoadUIPositions()
		if getgenv then
			if isfile(SaveDirectory) then
				local encoded = readfile(SaveDirectory)
				local data = HttpService:JSONDecode(encoded)
				for i,v in next, data do
					local window = main:FindFirstChild(i)
					if window then
						Tween(main[i], {Position = UDim2.new(0.5, v.X, 0.5, v.Y)})
					end
				end
				
				SetBind(data.Toggle)
			else
				SaveUIPositions()
			end
		end
	end
	local function ResetUIPositions()
		for i,v in next, main:GetChildren() do
			if v:FindFirstChild("UIStroke") then
				local pos = defaultpos[v.Name]
				Tween(v, {Position = UDim2.new(0.5, pos.X, 0.5, pos.Y)})
			end
		end
	end
	
	Buttons.SavePosition.Activated:Connect(SaveUIPositions)
	Buttons.LoadPosition.Activated:Connect(LoadUIPositions)
	Buttons.ResetPosition.Activated:Connect(ResetUIPositions)
	
	LoadUIPositions()
	
	for i,v in next, Buttons:GetChildren() do
		if v:IsA("TextButton") then
			StrokeEffect(v)
		end
	end
	
	task.spawn(function()
		repeat
			task.wait(0.1)
		until shared.FakeInternal.Version ~= nil
	
		script.Parent.Version.Text = string.format("%s | made by zzerexx#3970", shared.FakeInternal.Version)
	end)
end
coroutine.wrap(CLAL_fake_script)()
local function MFJYB_fake_script() -- Popular.ScriptHubScript 
	local script = Instance.new('LocalScript', Popular)

	if not getgenv then
		return
	end
	
	local Items = script.Parent
	local Item = Items.Item
	local Directory = "Internal UI Scripts"
	local DirectoryPattern = string.format("^%s\\(.+).lua$", Directory)
	
	if not isfolder(Directory) then
		makefolder(Directory)
	end
	
	local function NewItem(name)
		local new = Item:Clone()
		new.Parent = Items
		new.Visible = true
		new.Name = name
		
		new.Icon.Image = ""
		new.Title.Text = ""
		new.Author.Text = ""
		new.Description.Text = ""
	end
	local function Refresh()
		for i,v in next, listfiles(Directory) do
			local ScriptName = v:gsub(DirectoryPattern, function(a)
				return a
			end)
			NewItem(ScriptName)
		end
	end
	
	-- Internal UI Scripts\Script.lua
end
coroutine.wrap(MFJYB_fake_script)()
local function NYMIRF_fake_script() -- ScriptHub.ScriptHubScript 
	local script = Instance.new('LocalScript', ScriptHub)

	local HttpService = game:GetService("HttpService")
	local TextService = game:GetService("TextService")
	local Buttons = script.Parent.Buttons
	local PopularItems = script.Parent.Popular
	local PopularItem = PopularItems.Item
	local PersonalItems = script.Parent.Personal
	local PersonalItem = PersonalItems.Item
	local MainDirectory = "Internal UI"
	local ScriptsDirectory = "Internal UI\\Scripts"
	local DirectoryPatternLua = string.format("^%s\\(.+).lua$", ScriptsDirectory) -- "^Internal UI\\Scripts\\(.+).lua$"
	local DirectoryPatternTxt = string.format("^%s\\(.+).txt$", ScriptsDirectory) -- "^Internal UI\\Scripts\\(.+).txt$"
	local AssetsDirectory = "Internal UI\\Assets"
	local getcustomasset = getcustomasset or getsynasset or function()
		return "rbxasset://textures/ui/GuiImagePlaceholder.png"
	end
	
	local TweenService = game:GetService("TweenService")
	local ButtonHover = Color3.fromRGB(120, 120, 120)
	local ButtonDown = Color3.fromRGB(170, 170, 170)
	
	local info = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local info2 = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local function Tween(obj, props)
		TweenService:Create(obj, info, props):Play()
	end
	local function Tween2(obj, props)
		TweenService:Create(obj, info2, props):Play()
	end
	local function StrokeEffect(v)
		local Stroke = v.UIStroke
		v.AutoButtonColor = false
		v.MouseEnter:Connect(function()
			Stroke.Transparency = 1
			Stroke.Color = ButtonHover
			Tween(Stroke, {Transparency = 0})
		end)
		v.MouseLeave:Connect(function()
			Tween(Stroke, {Transparency = 1})
		end)
		v.MouseButton1Down:Connect(function()
			Tween(Stroke, {Color = ButtonDown})
		end)
		v.MouseButton1Up:Connect(function()
			Tween(Stroke, {Color = ButtonHover})
		end)
	end
	
	local function CheckDirectory()
		if getgenv then
			if not isfolder(MainDirectory) then
				makefolder(MainDirectory)
			end
			if not isfolder(ScriptsDirectory) then
				makefolder(ScriptsDirectory)
			end
			if not isfolder(AssetsDirectory) then
				makefolder(AssetsDirectory)
			end
		end
	end
	local function GetScript(file)
		if not getgenv then
			return ""
		end
		
		local url = string.format("https://raw.githubusercontent.com/zzerexx/scripts/main/Popular/%s.lua", file)
		local code = game:HttpGet(url)
		return loadstring(code, file)
	end
	local function GetImage(name, url)
		if getgenv then
			CheckDirectory()
			
			local path = string.format("%s\\%s.png", AssetsDirectory, name)
			if not isfile(path) then
				local content = game:HttpGet(url)
				writefile(path, content)
			end
			
			return getcustomasset(path)
		end
	end
	local scripts = {
		{
			Name = "Domain X",
			Script = GetScript("DomainX"),
			Author = "Shlex Softworks",
			Description = "The smartest script hub on Roblox.",
			Image = GetImage("DomainX", "https://i.imgur.com/tkNvWlW.png")
		},
		{
			Name = "V.G Hub",
			Script = GetScript("V.GHub"),
			Author = "DekuDimz",
			Description = "A script hub that supports more than 145 games!",
			Image = GetImage("V.GHub", "https://i.imgur.com/gPWKbhS.png")
		},
		{
			Name = "Fates Admin",
			Script = GetScript("FatesAdmin"),
			Author = "fate",
			Description = "a roblox admin script with fe features undetected to the client",
			Image = GetImage("FatesAdmin", "https://i.imgur.com/uYJYkdN.png")
		},
		{
			Name = "Infinite Yield",
			Script = GetScript("InfiniteYield"),
			Author = "Edge",
			Description = "The best command line script for roblox.",
			Image = GetImage("InfiniteYield", "https://i.imgur.com/zsvlYCe.png")
		},
		{
			Name = "Orca",
			Script = GetScript("Orca"),
			Author = "0866",
			Description = "Orca is a general-purpose Roblox script hub.",
			Image = GetImage("Orca", "https://i.imgur.com/TQFjjYp.png")
		},
		{
			Name = "Hydroxide",
			Script = GetScript("Hydroxide"),
			Author = "Upbolt",
			Description = "General purpose pen-testing tool for Roblox.",
			Image = GetImage("Hydroxide", "https://i.imgur.com/6zjhfEh.png")
		},
		{
			Name = "Secure Dex v3",
			Script = GetScript("SecureDexV3"),
			Author = "Babyhamsta/Hamstagang",
			Description = "Dark Dex v3 with various bypasses.",
			Image = GetImage("SecureDexV3", "https://i.imgur.com/aJWoz5B.png")
		},
		{
			Name = "Universal Esp",
			Script = GetScript("UniversalEsp"),
			Author = "zzerexx",
			Description = "esp for most games with many customizable settings",
			Image = GetImage("UniversalEsp", "https://i.imgur.com/X4vjIuQ.png")
		},
		{
			Name = "Universal Aimbot",
			Script = GetScript("UniversalAimbot"),
			Author = "zzerexx",
			Description = "aimbot for most games with many customizable settings",
			Image = GetImage("UniversalAimbot", "https://i.imgur.com/VFdn5p4.png")
		},
		{
			Name = "Spotify Player",
			Script = GetScript("SpotifyPlayer"),
			Author = "zzerexx",
			Description = "in-game spotify player with media controls and more",
			Image = GetImage("SpotifyPlayer", "https://i.imgur.com/bY3uRvq.png")
		}
	}
	
	local function NewItem(name, path, dir, data)
		local Items = (dir == "Popular" and PopularItems) or (dir == "Personal" and PersonalItems)
		local new = Items.Item:Clone()
		new.Parent = Items
		new.Visible = true
		new.Name = name
		
		new.Title.Text = name
		local abs = new.Title.AbsoluteSize
		if TextService:GetTextSize(name, 16, Enum.Font.Gotham, abs).X > abs.X then
			new.Title.TextScaled = true
		end
		
		if dir == "Popular" then
			new.Icon.Image = data.Image
			new.Author.Text = data.Author
			new.Description.Text = data.Description
			new.Button.Activated:Connect(function()
				if not data.Executed then
					xpcall(data.Script, function(err)
						shared.FakeInternal.Console:NewItem(err, Enum.MessageType.MessageError)
					end)
				end
				data.Executed = true
			end)
		end
		if dir == "Personal" then
			new.Path.Text = name..(data and ".lua" or ".txt")
			new.Button.Activated:Connect(function()
				xpcall(function()
					local code = readfile(path)
					loadstring(code, name)()
				end, function(err)
					shared.FakeInternal.Console:NewItem(err, Enum.MessageType.MessageError)
				end)
			end)
		end
		Items.CanvasSize = UDim2.new(0, 0, 0, Items.UIListLayout.AbsoluteContentSize.Y + 10)
		
		StrokeEffect(new.Button)
	end
	local function RefreshPopular()
		if getgenv then
			for i,v in ipairs(scripts) do
				NewItem(v.Name, "", "Popular", v)
			end
		end
	end
	local function RefreshPersonal()
		if getgenv then
			CheckDirectory()
			
			for _,v in next, PersonalItems:GetChildren() do
				if v:IsA("Frame") and v.Name ~= "Item" then
					v:Destroy()
				end
			end
			for i,v in next, listfiles(ScriptsDirectory) do
				local lua = false
				local ScriptName = v:gsub(DirectoryPatternLua, function(a)
					lua = true
					return a
				end)
				if ScriptName:find("Internal UI\\Scripts") then
					ScriptName = v:gsub(DirectoryPatternTxt, function(a)
						lua = false
						return a
					end)
				end
				if not ScriptName:find("Internal UI\\Scripts") then
					NewItem(ScriptName, v, "Personal", lua)
				end
			end
		end
	end
	RefreshPopular()
	RefreshPersonal()
	
	for i,v in next, script.Parent:GetDescendants() do
		if v:IsA("TextButton") then
			StrokeEffect(v)
		end
	end
	
	local Left = UDim2.new(-1, 5, 0, 65)
	local Center = UDim2.new(0, 5, 0, 65)
	local Right = UDim2.new(1, 5, 0, 65)
	local CurrentPage = "Popular"
	Buttons.Popular.Activated:Connect(function()
		if CurrentPage ~= "Popular" then
			Tween2(PopularItems, {Position = Center})
			Tween2(PersonalItems, {Position = Right})
			CurrentPage = "Popular"
		end
		PopularItems.Visible = true
		PersonalItems.Visible = true
	end)
	Buttons.Personal.Activated:Connect(function()
		if CurrentPage ~= "Personal" then
			RefreshPersonal()
			Tween2(PersonalItems, {Position = Center})
			Tween2(PopularItems, {Position = Left})
			CurrentPage = "Personal"
		end
		RefreshPersonal()
		PersonalItems.Visible = true
		PopularItems.Visible = true
	end)
	PersonalItems.Position = Right
end
coroutine.wrap(NYMIRF_fake_script)()
