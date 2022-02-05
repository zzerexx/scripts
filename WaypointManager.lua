-- Gui to Lua
-- Version: 3.2

-- Instances:

local Waypoints = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Scroll = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local Example = Instance.new("Frame")
local Title_2 = Instance.new("TextLabel")
local UIPadding = Instance.new("UIPadding")
local UICorner = Instance.new("UICorner")
local Created = Instance.new("TextLabel")
local Buttons = Instance.new("Frame")
local UIListLayout_2 = Instance.new("UIListLayout")
local Teleport = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local Modify = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local Delete = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local UIPadding_2 = Instance.new("UIPadding")
local Ripple = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local UICorner_6 = Instance.new("UICorner")
local Minimize = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")
local Close = Instance.new("TextButton")
local UICorner_8 = Instance.new("UICorner")
local ResizeY = Instance.new("Frame")
local ResizeX = Instance.new("Frame")
local Resize = Instance.new("TextButton")
local Create = Instance.new("TextButton")
local UICorner_9 = Instance.new("UICorner")
local Modify_2 = Instance.new("Frame")
local Title_3 = Instance.new("TextLabel")
local Content = Instance.new("Frame")
local UIPadding_3 = Instance.new("UIPadding")
local _Name = Instance.new("TextBox")
local UIListLayout_3 = Instance.new("UIListLayout")
local Width = Instance.new("TextBox")
local _Position = Instance.new("Frame")
local Box = Instance.new("TextBox")
local Set = Instance.new("TextButton")
local Color = Instance.new("Frame")
local Box_2 = Instance.new("TextBox")
local Preview = Instance.new("Frame")
local Keybind = Instance.new("TextButton")
local Close_2 = Instance.new("TextButton")
local LineEffect = Instance.new("Frame")
local Configs = Instance.new("TextButton")
local UICorner_10 = Instance.new("UICorner")
local ImageLabel = Instance.new("ImageLabel")
local ConfigMenu = Instance.new("Frame")
local Title_4 = Instance.new("TextLabel")
local Content_2 = Instance.new("Frame")
local UIPadding_4 = Instance.new("UIPadding")
local ConfigName = Instance.new("TextBox")
local UIListLayout_4 = Instance.new("UIListLayout")
local Save = Instance.new("TextButton")
local Configs_2 = Instance.new("Frame")
local Toggle = Instance.new("TextButton")
local Label = Instance.new("TextLabel")
local UIPadding_5 = Instance.new("UIPadding")
local Items = Instance.new("Frame")
local Example_2 = Instance.new("TextButton")
local UIListLayout_5 = Instance.new("UIListLayout")
local lol = Instance.new("TextButton")
local Load = Instance.new("TextButton")
local Delete_2 = Instance.new("TextButton")
local Close_3 = Instance.new("TextButton")
local Version = Instance.new("TextLabel")
local UIPadding_6 = Instance.new("UIPadding")
local Outline = Instance.new("Frame")
local UICorner_11 = Instance.new("UICorner")

if syn then
	syn.protect_gui(Waypoints)
end

--Properties:

Waypoints.Name = "Waypoints"
Waypoints.Parent = (gethui and gethui()) or (get_hidden_ui and get_hidden_ui()) or game.CoreGui

Main.Name = "Main"
Main.Parent = Waypoints
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.BorderColor3 = Color3.fromRGB(27, 42, 53)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0, 350, 0, 180)
Main.Size = UDim2.new(0, 400, 0, 300)
Main.ZIndex = 0

Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, 0, 0, 25)
Title.Font = Enum.Font.Gotham
Title.Text = "Waypoint Manager"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24.000
Title.TextXAlignment = Enum.TextXAlignment.Left

Scroll.Name = "Scroll"
Scroll.Parent = Main
Scroll.Active = true
Scroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Scroll.BackgroundTransparency = 1.000
Scroll.BorderSizePixel = 0
Scroll.Position = UDim2.new(0, 0, 0, 34)
Scroll.Size = UDim2.new(1, 0, 1, -34)
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.ScrollBarThickness = 0

UIListLayout.Parent = Scroll
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

Example.Name = "Example"
Example.Parent = Scroll
Example.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Example.BorderSizePixel = 0
Example.ClipsDescendants = true
Example.Size = UDim2.new(1, 0, 0, 50)
Example.Visible = false

Title_2.Name = "Title"
Title_2.Parent = Example
Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_2.BackgroundTransparency = 1.000
Title_2.BorderSizePixel = 0
Title_2.ClipsDescendants = true
Title_2.Size = UDim2.new(1, 0, 0, 20)
Title_2.Font = Enum.Font.Gotham
Title_2.Text = "Placeholder"
Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_2.TextSize = 16.000
Title_2.TextXAlignment = Enum.TextXAlignment.Left
Title_2.TextYAlignment = Enum.TextYAlignment.Top

UIPadding.Parent = Example
UIPadding.PaddingBottom = UDim.new(0, 5)
UIPadding.PaddingLeft = UDim.new(0, 5)
UIPadding.PaddingRight = UDim.new(0, 5)
UIPadding.PaddingTop = UDim.new(0, 5)

UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent = Example

Created.Name = "Created"
Created.Parent = Example
Created.AnchorPoint = Vector2.new(1, 0)
Created.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Created.BorderSizePixel = 0
Created.ClipsDescendants = true
Created.Position = UDim2.new(1, 0, 0, 0)
Created.Size = UDim2.new(0, 120, 0, 20)
Created.Font = Enum.Font.Gotham
Created.Text = "Jan 1, 2022 | 12:00"
Created.TextColor3 = Color3.fromRGB(100, 100, 100)
Created.TextSize = 12.000
Created.TextXAlignment = Enum.TextXAlignment.Right
Created.TextYAlignment = Enum.TextYAlignment.Top

Buttons.Name = "Buttons"
Buttons.Parent = Example
Buttons.AnchorPoint = Vector2.new(0, 1)
Buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Buttons.BackgroundTransparency = 1.000
Buttons.BorderSizePixel = 0
Buttons.ClipsDescendants = true
Buttons.Position = UDim2.new(0, 0, 1, 0)
Buttons.Size = UDim2.new(1, 0, 0, 20)

UIListLayout_2.Parent = Buttons
UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0, 5)

Teleport.Name = "Teleport"
Teleport.Parent = Buttons
Teleport.AnchorPoint = Vector2.new(0, 1)
Teleport.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Teleport.BorderSizePixel = 0
Teleport.ClipsDescendants = true
Teleport.Position = UDim2.new(0, 0, 1, 0)
Teleport.Size = UDim2.new(0, 120, 0, 20)
Teleport.AutoButtonColor = false
Teleport.Font = Enum.Font.Gotham
Teleport.Text = "Teleport"
Teleport.TextColor3 = Color3.fromRGB(255, 255, 255)
Teleport.TextSize = 14.000

UICorner_2.CornerRadius = UDim.new(0, 4)
UICorner_2.Parent = Teleport

Modify.Name = "Modify"
Modify.Parent = Buttons
Modify.AnchorPoint = Vector2.new(0, 1)
Modify.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Modify.BorderSizePixel = 0
Modify.ClipsDescendants = true
Modify.Position = UDim2.new(0, 105, 1, 0)
Modify.Size = UDim2.new(0, 120, 0, 20)
Modify.AutoButtonColor = false
Modify.Font = Enum.Font.Gotham
Modify.Text = "Modify"
Modify.TextColor3 = Color3.fromRGB(255, 255, 255)
Modify.TextSize = 14.000

UICorner_3.CornerRadius = UDim.new(0, 4)
UICorner_3.Parent = Modify

Delete.Name = "Delete"
Delete.Parent = Buttons
Delete.AnchorPoint = Vector2.new(0, 1)
Delete.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Delete.BorderSizePixel = 0
Delete.ClipsDescendants = true
Delete.Position = UDim2.new(0, 210, 1, 0)
Delete.Size = UDim2.new(0, 120, 0, 20)
Delete.AutoButtonColor = false
Delete.Font = Enum.Font.Gotham
Delete.Text = "Delete"
Delete.TextColor3 = Color3.fromRGB(255, 255, 255)
Delete.TextSize = 14.000

UICorner_4.CornerRadius = UDim.new(0, 4)
UICorner_4.Parent = Delete

UIPadding_2.Parent = Main
UIPadding_2.PaddingBottom = UDim.new(0, 10)
UIPadding_2.PaddingLeft = UDim.new(0, 10)
UIPadding_2.PaddingRight = UDim.new(0, 10)
UIPadding_2.PaddingTop = UDim.new(0, 10)

Ripple.Name = "Ripple"
Ripple.Parent = Main
Ripple.AnchorPoint = Vector2.new(0.5, 0.5)
Ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Ripple.BackgroundTransparency = 0.800
Ripple.BorderSizePixel = 0
Ripple.ZIndex = 20

UICorner_5.CornerRadius = UDim.new(1, 0)
UICorner_5.Parent = Ripple

UICorner_6.CornerRadius = UDim.new(0, 4)
UICorner_6.Parent = Main

Minimize.Name = "Minimize"
Minimize.Parent = Main
Minimize.AnchorPoint = Vector2.new(1, 0)
Minimize.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Minimize.BorderSizePixel = 0
Minimize.ClipsDescendants = true
Minimize.Position = UDim2.new(1, -30, 0, 0)
Minimize.Size = UDim2.new(0, 25, 0, 25)
Minimize.AutoButtonColor = false
Minimize.Font = Enum.Font.Gotham
Minimize.Text = "-"
Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
Minimize.TextSize = 24.000

UICorner_7.CornerRadius = UDim.new(0, 4)
UICorner_7.Parent = Minimize

Close.Name = "Close"
Close.Parent = Main
Close.AnchorPoint = Vector2.new(1, 0)
Close.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Close.BorderSizePixel = 0
Close.ClipsDescendants = true
Close.Position = UDim2.new(1, 0, 0, 0)
Close.Size = UDim2.new(0, 25, 0, 25)
Close.AutoButtonColor = false
Close.Font = Enum.Font.GothamBold
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 16.000

UICorner_8.CornerRadius = UDim.new(0, 4)
UICorner_8.Parent = Close

ResizeY.Name = "ResizeY"
ResizeY.Parent = Main
ResizeY.AnchorPoint = Vector2.new(0, 1)
ResizeY.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
ResizeY.BorderSizePixel = 0
ResizeY.Position = UDim2.new(1, 5, 1, 5)
ResizeY.Size = UDim2.new(0, 1, 0, 10)

ResizeX.Name = "ResizeX"
ResizeX.Parent = Main
ResizeX.AnchorPoint = Vector2.new(1, 0)
ResizeX.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
ResizeX.BorderSizePixel = 0
ResizeX.Position = UDim2.new(1, 5, 1, 5)
ResizeX.Size = UDim2.new(0, 10, 0, 1)

Resize.Name = "Resize"
Resize.Parent = Main
Resize.AnchorPoint = Vector2.new(1, 1)
Resize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Resize.BackgroundTransparency = 1.000
Resize.BorderSizePixel = 0
Resize.Position = UDim2.new(1, 10, 1, 10)
Resize.Size = UDim2.new(0, 15, 0, 15)
Resize.AutoButtonColor = false
Resize.Font = Enum.Font.SourceSans
Resize.Text = ""
Resize.TextColor3 = Color3.fromRGB(0, 0, 0)
Resize.TextSize = 14.000

Create.Name = "Create"
Create.Parent = Main
Create.AnchorPoint = Vector2.new(1, 0)
Create.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Create.BorderSizePixel = 0
Create.ClipsDescendants = true
Create.Position = UDim2.new(1, -60, 0, 0)
Create.Size = UDim2.new(0, 25, 0, 25)
Create.AutoButtonColor = false
Create.Font = Enum.Font.Gotham
Create.Text = "+"
Create.TextColor3 = Color3.fromRGB(255, 255, 255)
Create.TextSize = 25.000

UICorner_9.CornerRadius = UDim.new(0, 4)
UICorner_9.Parent = Create

Modify_2.Name = "Modify"
Modify_2.Parent = Main
Modify_2.AnchorPoint = Vector2.new(0.5, 0.5)
Modify_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Modify_2.BorderColor3 = Color3.fromRGB(100, 100, 100)
Modify_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Modify_2.Size = UDim2.new(0, 250, 0, 230)
Modify_2.Visible = false
Modify_2.ZIndex = 5

Title_3.Name = "Title"
Title_3.Parent = Modify_2
Title_3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Title_3.BorderColor3 = Color3.fromRGB(100, 100, 100)
Title_3.Size = UDim2.new(1, 0, 0, 20)
Title_3.ZIndex = 6
Title_3.Font = Enum.Font.Gotham
Title_3.Text = "Waypoint Modifier"
Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_3.TextSize = 14.000

Content.Name = "Content"
Content.Parent = Modify_2
Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Content.BackgroundTransparency = 1.000
Content.BorderSizePixel = 0
Content.ClipsDescendants = true
Content.Position = UDim2.new(0, 0, 0, 20)
Content.Size = UDim2.new(1, 0, 1, -20)

UIPadding_3.Parent = Content
UIPadding_3.PaddingBottom = UDim.new(0, 10)
UIPadding_3.PaddingLeft = UDim.new(0, 10)
UIPadding_3.PaddingRight = UDim.new(0, 10)
UIPadding_3.PaddingTop = UDim.new(0, 10)

_Name.Name = "_Name"
_Name.Parent = Content
_Name.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
_Name.BorderColor3 = Color3.fromRGB(100, 100, 100)
_Name.LayoutOrder = 1
_Name.Size = UDim2.new(1, 0, 0, 30)
_Name.ZIndex = 6
_Name.ClearTextOnFocus = false
_Name.Font = Enum.Font.Gotham
_Name.PlaceholderText = "Name"
_Name.Text = ""
_Name.TextColor3 = Color3.fromRGB(255, 255, 255)
_Name.TextSize = 14.000

UIListLayout_3.Parent = Content
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_3.Padding = UDim.new(0, 10)

Width.Name = "Width"
Width.Parent = Content
Width.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Width.BorderColor3 = Color3.fromRGB(100, 100, 100)
Width.LayoutOrder = 4
Width.Size = UDim2.new(1, 0, 0, 30)
Width.ZIndex = 6
Width.ClearTextOnFocus = false
Width.Font = Enum.Font.Gotham
Width.PlaceholderText = "Beam Width"
Width.Text = ""
Width.TextColor3 = Color3.fromRGB(255, 255, 255)
Width.TextSize = 14.000

_Position.Name = "_Position"
_Position.Parent = Content
_Position.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_Position.LayoutOrder = 2
_Position.Size = UDim2.new(1, 0, 0, 30)

Box.Name = "Box"
Box.Parent = _Position
Box.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Box.BorderColor3 = Color3.fromRGB(100, 100, 100)
Box.LayoutOrder = 2
Box.Size = UDim2.new(1, -40, 0, 30)
Box.ZIndex = 6
Box.ClearTextOnFocus = false
Box.Font = Enum.Font.Gotham
Box.PlaceholderText = "Position"
Box.Text = ""
Box.TextColor3 = Color3.fromRGB(255, 255, 255)
Box.TextSize = 14.000
Box.TextWrapped = true

Set.Name = "Set"
Set.Parent = _Position
Set.AnchorPoint = Vector2.new(1, 0)
Set.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Set.BorderColor3 = Color3.fromRGB(100, 100, 100)
Set.ClipsDescendants = true
Set.Position = UDim2.new(1, 0, 0, 0)
Set.Size = UDim2.new(0, 30, 0, 30)
Set.ZIndex = 6
Set.AutoButtonColor = false
Set.Font = Enum.Font.Gotham
Set.Text = "Set"
Set.TextColor3 = Color3.fromRGB(255, 255, 255)
Set.TextSize = 14.000

Color.Name = "Color"
Color.Parent = Content
Color.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Color.LayoutOrder = 3
Color.Size = UDim2.new(1, 0, 0, 30)

Box_2.Name = "Box"
Box_2.Parent = Color
Box_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Box_2.BorderColor3 = Color3.fromRGB(100, 100, 100)
Box_2.LayoutOrder = 3
Box_2.Size = UDim2.new(1, -40, 0, 30)
Box_2.ZIndex = 6
Box_2.ClearTextOnFocus = false
Box_2.Font = Enum.Font.Gotham
Box_2.PlaceholderText = "Color"
Box_2.Text = ""
Box_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Box_2.TextSize = 14.000

Preview.Name = "Preview"
Preview.Parent = Color
Preview.AnchorPoint = Vector2.new(1, 0)
Preview.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Preview.BorderColor3 = Color3.fromRGB(100, 100, 100)
Preview.Position = UDim2.new(1, 0, 0, 0)
Preview.Size = UDim2.new(0, 30, 0, 30)
Preview.ZIndex = 6

Keybind.Name = "Keybind"
Keybind.Parent = Content
Keybind.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Keybind.BorderColor3 = Color3.fromRGB(100, 100, 100)
Keybind.ClipsDescendants = true
Keybind.LayoutOrder = 5
Keybind.Size = UDim2.new(1, 0, 0, 30)
Keybind.ZIndex = 6
Keybind.AutoButtonColor = false
Keybind.Font = Enum.Font.Gotham
Keybind.Text = "Keybind: N/A"
Keybind.TextColor3 = Color3.fromRGB(255, 255, 255)
Keybind.TextSize = 14.000
Keybind.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)

Close_2.Name = "Close"
Close_2.Parent = Modify_2
Close_2.AnchorPoint = Vector2.new(1, 0)
Close_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Close_2.BorderColor3 = Color3.fromRGB(100, 100, 100)
Close_2.ClipsDescendants = true
Close_2.Position = UDim2.new(1, 0, 0, 0)
Close_2.Size = UDim2.new(0, 20, 0, 20)
Close_2.ZIndex = 6
Close_2.AutoButtonColor = false
Close_2.Font = Enum.Font.GothamBold
Close_2.Text = "X"
Close_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Close_2.TextSize = 14.000

LineEffect.Name = "LineEffect"
LineEffect.Parent = Main
LineEffect.AnchorPoint = Vector2.new(0.5, 1)
LineEffect.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LineEffect.BorderSizePixel = 0
LineEffect.Position = UDim2.new(0.5, 0, 1, 1)
LineEffect.Size = UDim2.new(0, 0, 0, 1)
LineEffect.Visible = false
LineEffect.ZIndex = 10

Configs.Name = "Configs"
Configs.Parent = Main
Configs.AnchorPoint = Vector2.new(1, 0)
Configs.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Configs.BorderSizePixel = 0
Configs.ClipsDescendants = true
Configs.Position = UDim2.new(1, -90, 0, 0)
Configs.Size = UDim2.new(0, 25, 0, 25)
Configs.AutoButtonColor = false
Configs.Font = Enum.Font.Gotham
Configs.Text = ""
Configs.TextColor3 = Color3.fromRGB(255, 255, 255)
Configs.TextSize = 25.000

UICorner_10.CornerRadius = UDim.new(0, 4)
UICorner_10.Parent = Configs

ImageLabel.Parent = Configs
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel.Size = UDim2.new(1, -4, 1, -4)
ImageLabel.Image = "rbxassetid://8723242071"

ConfigMenu.Name = "ConfigMenu"
ConfigMenu.Parent = Main
ConfigMenu.AnchorPoint = Vector2.new(0.5, 0.5)
ConfigMenu.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ConfigMenu.BorderColor3 = Color3.fromRGB(100, 100, 100)
ConfigMenu.Position = UDim2.new(0.5, 0, 0.5, 0)
ConfigMenu.Size = UDim2.new(0, 250, 0, 230)
ConfigMenu.Visible = false
ConfigMenu.ZIndex = 10

Title_4.Name = "Title"
Title_4.Parent = ConfigMenu
Title_4.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Title_4.BorderColor3 = Color3.fromRGB(100, 100, 100)
Title_4.Size = UDim2.new(1, 0, 0, 20)
Title_4.ZIndex = 11
Title_4.Font = Enum.Font.Gotham
Title_4.Text = "Config Menu"
Title_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_4.TextSize = 14.000

Content_2.Name = "Content"
Content_2.Parent = ConfigMenu
Content_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Content_2.BackgroundTransparency = 1.000
Content_2.BorderSizePixel = 0
Content_2.Position = UDim2.new(0, 0, 0, 20)
Content_2.Size = UDim2.new(1, 0, 1, -20)

UIPadding_4.Parent = Content_2
UIPadding_4.PaddingBottom = UDim.new(0, 10)
UIPadding_4.PaddingLeft = UDim.new(0, 10)
UIPadding_4.PaddingRight = UDim.new(0, 10)
UIPadding_4.PaddingTop = UDim.new(0, 10)

ConfigName.Name = "ConfigName"
ConfigName.Parent = Content_2
ConfigName.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ConfigName.BorderColor3 = Color3.fromRGB(100, 100, 100)
ConfigName.LayoutOrder = 1
ConfigName.Size = UDim2.new(1, 0, 0, 30)
ConfigName.ZIndex = 11
ConfigName.ClearTextOnFocus = false
ConfigName.Font = Enum.Font.Gotham
ConfigName.PlaceholderText = "Name"
ConfigName.Text = ""
ConfigName.TextColor3 = Color3.fromRGB(255, 255, 255)
ConfigName.TextSize = 14.000

UIListLayout_4.Parent = Content_2
UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_4.Padding = UDim.new(0, 10)

Save.Name = "Save"
Save.Parent = Content_2
Save.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Save.BorderColor3 = Color3.fromRGB(100, 100, 100)
Save.ClipsDescendants = true
Save.LayoutOrder = 2
Save.Size = UDim2.new(1, 0, 0, 30)
Save.ZIndex = 11
Save.AutoButtonColor = false
Save.Font = Enum.Font.Gotham
Save.Text = "Save Config"
Save.TextColor3 = Color3.fromRGB(255, 255, 255)
Save.TextSize = 14.000

Configs_2.Name = "Configs"
Configs_2.Parent = Content_2
Configs_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Configs_2.BackgroundTransparency = 1.000
Configs_2.LayoutOrder = 3
Configs_2.Size = UDim2.new(1, 0, 0, 30)
Configs_2.ZIndex = 13

Toggle.Name = "Toggle"
Toggle.Parent = Configs_2
Toggle.AnchorPoint = Vector2.new(1, 0)
Toggle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Toggle.BorderColor3 = Color3.fromRGB(100, 100, 100)
Toggle.ClipsDescendants = true
Toggle.Position = UDim2.new(1, 0, 0, 0)
Toggle.Size = UDim2.new(0, 30, 0, 30)
Toggle.ZIndex = 13
Toggle.AutoButtonColor = false
Toggle.Font = Enum.Font.Gotham
Toggle.Text = ">"
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.TextSize = 18.000

Label.Name = "Label"
Label.Parent = Configs_2
Label.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Label.BorderColor3 = Color3.fromRGB(100, 100, 100)
Label.Size = UDim2.new(1, -30, 0, 30)
Label.ZIndex = 13
Label.Font = Enum.Font.Gotham
Label.Text = "Your Configs"
Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Label.TextSize = 14.000
Label.TextXAlignment = Enum.TextXAlignment.Left

UIPadding_5.Parent = Label
UIPadding_5.PaddingLeft = UDim.new(0, 8)

Items.Name = "Items"
Items.Parent = Configs_2
Items.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Items.BorderColor3 = Color3.fromRGB(100, 100, 100)
Items.ClipsDescendants = true
Items.Position = UDim2.new(0, 0, 0, 30)
Items.Size = UDim2.new(1, 0, 0, 0)
Items.ZIndex = 12

Example_2.Name = "Example"
Example_2.Parent = Items
Example_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Example_2.BorderColor3 = Color3.fromRGB(100, 100, 100)
Example_2.Size = UDim2.new(1, 0, 0, 30)
Example_2.Visible = false
Example_2.ZIndex = 12
Example_2.Font = Enum.Font.Gotham
Example_2.Text = "Config"
Example_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Example_2.TextSize = 14.000

UIListLayout_5.Parent = Items
UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder

lol.Name = "lol"
lol.Parent = Items
lol.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
lol.BorderColor3 = Color3.fromRGB(100, 100, 100)
lol.Size = UDim2.new(1, 0, 0, 30)
lol.ZIndex = 12
lol.Font = Enum.Font.Gotham
lol.Text = "Config"
lol.TextColor3 = Color3.fromRGB(255, 255, 255)
lol.TextSize = 14.000

Load.Name = "Load"
Load.Parent = Content_2
Load.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Load.BorderColor3 = Color3.fromRGB(100, 100, 100)
Load.ClipsDescendants = true
Load.LayoutOrder = 4
Load.Size = UDim2.new(1, 0, 0, 30)
Load.ZIndex = 11
Load.AutoButtonColor = false
Load.Font = Enum.Font.Gotham
Load.Text = "Load Selected Config"
Load.TextColor3 = Color3.fromRGB(255, 255, 255)
Load.TextSize = 14.000

Delete_2.Name = "Delete"
Delete_2.Parent = Content_2
Delete_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Delete_2.BorderColor3 = Color3.fromRGB(100, 100, 100)
Delete_2.ClipsDescendants = true
Delete_2.LayoutOrder = 5
Delete_2.Size = UDim2.new(1, 0, 0, 30)
Delete_2.ZIndex = 11
Delete_2.AutoButtonColor = false
Delete_2.Font = Enum.Font.Gotham
Delete_2.Text = "Delete Selected Config"
Delete_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Delete_2.TextSize = 14.000

Close_3.Name = "Close"
Close_3.Parent = ConfigMenu
Close_3.AnchorPoint = Vector2.new(1, 0)
Close_3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Close_3.BorderColor3 = Color3.fromRGB(100, 100, 100)
Close_3.ClipsDescendants = true
Close_3.Position = UDim2.new(1, 0, 0, 0)
Close_3.Size = UDim2.new(0, 20, 0, 20)
Close_3.ZIndex = 11
Close_3.AutoButtonColor = false
Close_3.Font = Enum.Font.GothamBold
Close_3.Text = "X"
Close_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Close_3.TextSize = 14.000

Version.Name = "Version"
Version.Parent = Main
Version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Version.BackgroundTransparency = 1.000
Version.BorderSizePixel = 0
Version.Position = UDim2.new(0, 212, 0, 0)
Version.Size = UDim2.new(0, 40, 0, 25)
Version.Font = Enum.Font.Gotham
Version.Text = "v0.3.0"
Version.TextColor3 = Color3.fromRGB(50, 50, 50)
Version.TextSize = 12.000
Version.TextXAlignment = Enum.TextXAlignment.Left
Version.TextYAlignment = Enum.TextYAlignment.Bottom

UIPadding_6.Parent = Version
UIPadding_6.PaddingBottom = UDim.new(0, 3)

Outline.Name = "Outline"
Outline.Parent = Main
Outline.AnchorPoint = Vector2.new(0.5, 0.5)
Outline.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Outline.BorderSizePixel = 0
Outline.Position = UDim2.new(0.5, 0, 0.5, 0)
Outline.Size = UDim2.new(1, 22, 1, 22)
Outline.ZIndex = -1

UICorner_11.CornerRadius = UDim.new(0, 4)
UICorner_11.Parent = Outline

-- Scripts:

local function KKQRAO_fake_script() -- Buttons.ButtonsScript 
	local script = Instance.new('LocalScript', Buttons)

	local player = game:GetService("Players").LocalPlayer
	script.Parent.Teleport.Activated:Connect(function()
		player.Character:MoveTo(script.Parent.Parent:GetAttribute("Position"))
	end)
	script.Parent.Modify.Activated:Connect(function()
		
	end)
	script.Parent.Delete.Activated:Connect(function()
	
	end)
end
coroutine.wrap(KKQRAO_fake_script)()
local function SETYU_fake_script() -- Main.Init 
	local script = Instance.new('LocalScript', Main)

	--[[
		defined globals
		WP_GETDATE = Init
		WP_ADDATT = Init
		WP_UIOPENED = Init
		WP_ADD = Init
		WP_CLEAR = Init
		WP_CLEARWP = Init
		WP_FOLDER = Waypoints
		WP_NEW = Waypoints
		WP_ADDCONNS = Waypoints
		WP_LOADCFGS = ConfigUI
	]]
	
	local months = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"}
	function getdate()
		local a = os.date("*t")
		local month = months[a.month]
		local day = a.day
		local year = a.year
		local time = a.hour..":"..(#tostring(a.min) == 1 and 0 or "")..a.min
		
		return string.format("%s %s, %s | %s", month, day, year, time)
	end
	shared.WP_GETDATE = getdate
	
	-- apply properties that gui to lua doesnt convert
	
	local main = script.Parent
	local scroll = main.Scroll
	local atend = Enum.TextTruncate.AtEnd
	local vp = workspace.CurrentCamera.ViewportSize
	main.Position = UDim2.new(0, vp.X / 2 - 200, 0, vp.Y / 2 - 150)
	main.Parent.IgnoreGuiInset = true
	
	scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scroll.Example.Title.TextTruncate = atend
	scroll.Example.Created.TextTruncate = atend
	function addattributes(a,t)
		local b = t ~= nil
		a:SetAttribute("Name", (b and t.Name) or "Placeholder")
		a:SetAttribute("Position", (b and t.Position) or Vector3.new())
		a:SetAttribute("Color", (b and t.Color) or Color3.fromRGB(255,255,255))
		a:SetAttribute("BeamWidth", (b and t.BeamWidth) or 3)
		a:SetAttribute("Created", (b and t.Created) or getdate())
		a:SetAttribute("Keybind", (b and t.Keybind) or "Unknown")
	end
	addattributes(scroll.Example)
	shared.WP_ADDATT = addattributes
	
	script.Parent.Modify:SetAttribute("Listener", "")
	
	script.Parent.Modify.Title.TextTruncate = atend
	
	script.Parent.Modify.Content._Name.TextTruncate = atend
	script.Parent.Modify.Content._Name.TextWrapped = true
	
	script.Parent.Modify.Content._Position.Box.TextTruncate = atend
	script.Parent.Modify.Content._Position.Box.TextWrapped = true
	
	script.Parent.Modify.Content.Color.Box.TextTruncate = atend
	script.Parent.Modify.Content.Color.Box.TextWrapped = true
	
	script.Parent.Modify.Content.Width.TextTruncate = atend
	script.Parent.Modify.Content.Width.TextWrapped = true
	
	for i,v in next, script.Parent:GetDescendants() do
		if v:IsA("TextButton") or v:IsA("ImageButton") then
			v.AutoButtonColor = false
			v.ClipsDescendants = true
		end
	end
	
	script.Parent.DescendantAdded:Connect(function(v)
		if v:IsA("TextButton") or v:IsA("ImageButton") then
			v.AutoButtonColor = false
			v.ClipsDescendants = true
		end
	end)
	
	--------------------
	
	local _mouse = game:GetService("Players").LocalPlayer:GetMouse()
	local ts = game:GetService("TweenService")
	local uis = game:GetService("UserInputService")
	local down = false
	
	uis.InputEnded:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 then
			down = false
		end
	end)
	main.Resize.MouseButton1Down:Connect(function()
		down = true
		local mouse = uis:GetMouseLocation()
		repeat
			mouse = uis:GetMouseLocation()
			local abs = main.AbsoluteSize
			local abp = main.AbsolutePosition
			main.Size = UDim2.new(0, math.clamp(mouse.X - abp.X, 400, math.huge), 0, math.clamp(mouse.Y - abp.Y - 36, 300, math.huge))
			task.wait()
		until not down
	end)
	
	shared.WP_UIOPENED = true
	local tweening = false
	local args = {"Out", "Sine", 0.3, true}
	local oldsize = UDim2.new(0, 400, 0, 300)
	main.Minimize.Activated:Connect(function()
		if not tweening then
			shared.WP_UIOPENED = not shared.WP_UIOPENED
			if shared.WP_UIOPENED then
				tweening = true
				main:TweenSize(oldsize, unpack(args))
				task.wait(0.3)
				main.ResizeX.Visible = true
				main.ResizeY.Visible = true
				main.Resize.Visible = true
				tweening = false
			else
				tweening = true
				oldsize = main.Size
				main:TweenSize(UDim2.new(0, main.Size.X.Offset, 0, 44), unpack(args))
				main.ResizeX.Visible = false
				main.ResizeY.Visible = false
				main.Resize.Visible = false
				
				main.Modify.Visible = false
				main.ConfigMenu.Visible = false
				task.wait(0.3)
				tweening = false
			end
		end
	end)
	
	main.Configs.Activated:Connect(function()
		if shared.WP_UIOPENED then
			main.ConfigMenu.Visible = not main.ConfigMenu.Visible
		end
	end)
	
	function additem(data)
		local new = scroll.Example:Clone()
		new.Parent = scroll
		new.Visible = true
		new.Name = data.Name
		new.Title.Text = data.Name
		new.Created.Text = data.Created
		shared.WP_ADDATT(new, data)
		shared.WP_ADDCONNS(new)
	end
	function clearitems()
		for i,v in next, scroll:GetChildren() do
			if v.Name ~= "UIListLayout" and v.Name ~= "Example" then
				v:Destroy()
			end
		end
	end
	function clearwaypoints()
		for i,v in next, shared.WP_FOLDER:GetChildren() do
			v:Destroy()
		end
	end
	
	shared.WP_ADD = additem
	shared.WP_CLEAR = clearitems
	shared.WP_CLEARWP = clearwaypoints
	
	main.Close.Activated:Connect(function()
		main.Parent:Destroy()
		shared.WP_FOLDER:Destroy()
	end)
end
coroutine.wrap(SETYU_fake_script)()
local function DIWX_fake_script() -- Main.RippleEffect 
	local script = Instance.new('LocalScript', Main)

	local ts = game:GetService("TweenService")
	local uis = game:GetService("UserInputService")
	local duration = 0.4
	local ripple = script.Parent.Ripple
	local sine = Enum.EasingStyle.Sine
	local out = Enum.EasingDirection.Out
	local info = TweenInfo.new(duration, sine, out)
	
	function Ripple(a)
		local mouse = uis:GetMouseLocation()
		local abs = a.AbsoluteSize
		local abp = a.AbsolutePosition
		local targetsize = UDim2.new(0, abs.X * 2, 0, abs.X * 2)
		
		local new = ripple:Clone()
		new.Parent = a 
		new.Position = UDim2.new(0, mouse.X - abp.X, 0, mouse.Y - abp.Y - 36)
		new.Visible = true
		
		ts:Create(new, info, {Size = targetsize, Transparency = 1}):Play()
		
		task.wait(duration)
		
		new:Destroy()
	end
	
	for i,v in next, script.Parent:GetDescendants() do
		if v:IsA("TextButton") or v:IsA("ImageButton") then
			v.MouseButton1Down:Connect(function()
				Ripple(v)
			end)
		end
	end
	
	script.Parent.DescendantAdded:Connect(function(v)
		if v:IsA("TextButton") or v:IsA("ImageButton") then
			v.MouseButton1Down:Connect(function()
				Ripple(v)
			end)
		end
	end)
end
coroutine.wrap(DIWX_fake_script)()
local function YRBS_fake_script() -- Main.Dragify 
	local script = Instance.new('LocalScript', Main)

	local UIS = game:GetService("UserInputService")
	function dragify(Frame)
		local dragToggle = nil
		local dragSpeed = 0
		local dragInput = nil
		local dragStart = nil
		local dragPos = nil
		local startPos = nil
		local function updateInput(input)
			local Delta = input.Position - dragStart
			local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
			game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.075), {Position = Position}):Play()
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
coroutine.wrap(YRBS_fake_script)()
local function MFKVEE_fake_script() -- Main.Waypoints 
	local script = Instance.new('LocalScript', Main)

	local folder = Instance.new("Folder", workspace)
	folder.Name = ""
	for _ = 1, math.random(8,16) do
		folder.Name = folder.Name..string.char(math.random(97, 122))
	end
	script.Parent:SetAttribute("Folder", folder.Name)
	shared.WP_FOLDER = folder
	
	function ApplyPartProps(p)
		p.Transparency = 1
		p.Size = Vector3.new(0.1, 0.1, 0.1)
		p.CanCollide = false
		p.Anchored = true
	end
	function NewWaypoint(cfg)
		cfg.Name = cfg.Name or "Waypoint"
		cfg.Position = cfg.Position or workspace.CurrentCamera.CFrame.Position
		cfg.Color = cfg.Color or Color3.fromRGB(255, 255, 255)
		cfg.BeamWidth = cfg.BeamWidth or 3
	
		local Model = Instance.new("Model", folder)
	
		local Beam = Instance.new("Beam", Model)
		local BeamStart = Instance.new("Part", Model)
		local BeamDest = Instance.new("Part", Model)
		local BeamAtt0 = Instance.new("Attachment", BeamStart)
		local BeamAtt1 = Instance.new("Attachment", BeamDest)
	
		local LightPart = Instance.new("Part", Model)
		local Light1 = Instance.new("SpotLight", LightPart)
		local Light2 = Instance.new("SpotLight", LightPart)
	
		local Billboard = Instance.new("BillboardGui", Model)
		local Label = Instance.new("TextLabel", Billboard)
	
		Model.Name = cfg.Name
	
		Beam.Brightness = 1
		Beam.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, cfg.Color),
			ColorSequenceKeypoint.new(1, cfg.Color)
		})
		Beam.LightEmission = 0
		Beam.LightInfluence = 0
		Beam.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0,	0  ),
			NumberSequenceKeypoint.new(0.85, 0.5),
			NumberSequenceKeypoint.new(1,	1  )
		})
		Beam.Attachment0 = BeamAtt0
		Beam.Attachment1 = BeamAtt1
		Beam.FaceCamera = true
		Beam.Width0 = cfg.BeamWidth
		Beam.Width1 = 1
		Beam.Parent = Model
	
		ApplyPartProps(BeamStart)
		BeamStart.Name = "BeamStart"
		BeamStart.Position = cfg.Position - Vector3.new(0, 500, 0)
	
		ApplyPartProps(BeamDest)
		BeamDest.Name = "BeamDest"
		BeamDest.Position = cfg.Position + Vector3.new(0, 500, 0)
	
		ApplyPartProps(LightPart)
		LightPart.Name = "LightPart"
		LightPart.Position = cfg.Position
		
		Light1.Name = "Light1"
		Light1.Angle = 180
		Light1.Brightness = 4 
		Light1.Color = cfg.Color 
		Light1.Face = Enum.NormalId.Top
		Light1.Range = 16 
		Light1.Shadows = true
		
		Light2.Name = "Light2"
		Light2.Angle = 180
		Light2.Brightness = 4 
		Light2.Color = cfg.Color 
		Light2.Face = Enum.NormalId.Bottom
		Light2.Range = 16 
		Light2.Shadows = true
	
		Billboard.Adornee = LightPart
		Billboard.AlwaysOnTop = true
		Billboard.LightInfluence = 0 
		Billboard.MaxDistance = math.huge
		Billboard.ResetOnSpawn = false
		Billboard.Size = UDim2.new(0, 100, 0, 25)
	
		Label.BackgroundTransparency = 1
		Label.Size = UDim2.new(1, 0, 1, 0)
		Label.Font = Enum.Font.Gotham
		Label.Text = cfg.Name 
		Label.TextColor3 = cfg.Color
		Label.TextSize = 18 
		Label.TextStrokeTransparency = 0 
		
		return Model
	end
	shared.WP_NEW = NewWaypoint
	
	local mod = script.Parent.Modify
	local content = mod.Content
	local player = game:GetService("Players").LocalPlayer
	local id = 1
	
	function addconnections(a)
		local function teleport()
			if player.Character ~= nil then
				player.Character:MoveTo(a:GetAttribute("Position"))
			end
		end
		a.Buttons.Teleport.Activated:Connect(teleport)
		a.Buttons.Modify.Activated:Connect(function()
			local name = a:GetAttribute("Name")
			local color = a:GetAttribute("Color")
			local bind = a:GetAttribute("Keybind")
			mod.Visible = true
			content._Name.Text = name
			content._Position.Box.Text = tostring(a:GetAttribute("Position"))
			content.Color.Box.Text = string.format("%s, %s, %s", math.floor(color.R * 255), math.floor(color.G * 255), math.floor(color.B * 255))
			content.Color.Preview.BackgroundColor3 = color
			content.Width.Text = a:GetAttribute("BeamWidth")
			content.Keybind.Text = "Keybind: "..(bind ~= nil and bind or "Unknown")
			mod:SetAttribute("Listener", name)
		end)
		a.Buttons.Delete.Activated:Connect(function()
			folder[a.Name]:Destroy()
			a:Destroy()
		end)
	end
	shared.WP_ADDCONNS = addconnections
	
	script.Parent.Create.Activated:Connect(function()
		if player.Character == nil then return end
		local name = "Waypoint "..id
		local pos = player.Character:GetPivot().Position
		local color = Color3.fromRGB(255,255,255)
		local width = 3
		local date = shared.WP_GETDATE()
		local m = NewWaypoint({
			Name = name,
			Position = pos,
			Color = color,
			BeamWidth = width
		})
		local new = script.Parent.Scroll.Example:Clone()
		new.Parent = script.Parent.Scroll
		new.Visible = true
		new.Name = name
		new.Title.Text = name
		new.Created.Text = date
		
		shared.WP_ADDATT(new, {
			Name = name,
			Position = pos,
			Color = color,
			BeamWidth = width,
			Created = date,
			Keybind = "Unknown"
		})
		--new:SetAttribute("Object", m)
		
		addconnections(new)
		
		id += 1
	end)
end
coroutine.wrap(MFKVEE_fake_script)()
local function BLIFI_fake_script() -- Content.Modifier 
	local script = Instance.new('LocalScript', Content)

	function focuslost(obj,func)
		local a = (script.Parent[obj].ClassName == "Frame" and script.Parent[obj].Box) or script.Parent[obj]
		a.FocusLost:Connect(function(ep)
			if ep then
				func(a)
			end
		end)
	end
	function isempty(s)
		return s:gsub(" ","") == ""
	end
	function setwaypointpos(a,pos)
		a.BeamStart.Position = pos - Vector3.new(0,500,0)
		a.BeamDest.Position = pos + Vector3.new(0,500,0)
		a.LightPart.Position = pos
	end
	function setwaypointcolor(a,color)
		a.Beam.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, color),
			ColorSequenceKeypoint.new(1, color)
		})
		a.LightPart.Light1.Color = color
		a.LightPart.Light2.Color = color
		a.BillboardGui.TextLabel.TextColor3 = color
	end
	function setwaypointwidth(a,width)
		a.Beam.Width0 = width
	end
	
	local player = game:GetService("Players").LocalPlayer
	local uis = game:GetService("UserInputService")
	local mod = script.Parent.Parent
	local ui = script.Parent.Parent.Parent.Scroll
	local folder = workspace[script.Parent.Parent.Parent:GetAttribute("Folder")]
	
	local obj = nil
	local name = ""
	
	mod.Close.Activated:Connect(function()
		mod.Visible = false
	end)
	
	focuslost("_Name", function(self)
		local t = self.Text
		if not isempty(t) then
			name = mod:GetAttribute("Listener")
			obj = ui[name]
			
			obj.Name = t
			obj.Title.Text = t
			obj:SetAttribute("Name", t)
			
			folder[name].Name = t
			obj = folder[t]
			obj.BillboardGui.TextLabel.Text = t
			
			mod:SetAttribute("Listener", t)
		end
	end)
	
	focuslost("_Position", function(self)
		local t = self.Text
		if not isempty(t) then
			local pos = self.Text:gsub(" ",""):split(",")
			pos = Vector3.new(pos[1], pos[2], pos[3])
			
			name = mod:GetAttribute("Listener")
			obj = ui[name]
			obj:SetAttribute("Position", pos)
			
			setwaypointpos(folder[name], pos)
		end
	end)
	local position = script.Parent._Position
	position.Set.Activated:Connect(function()
		if player.Character == nil then return end
		name = mod:GetAttribute("Listener")
		local pos = player.Character:GetPivot().Position
		ui[name]:SetAttribute("Position", pos)
		setwaypointpos(folder[name], pos)
		mod.Content._Position.Box.Text = tostring(pos)
	end)
	position.Box:GetPropertyChangedSignal("Text"):Connect(function()
		position.Box.TextScaled = false
		position.Box.TextScaled = not position.Box.TextFits
	end)
	
	focuslost("Color", function(self)
		local t = self.Text
		if not isempty(t) then
			local color = self.Text:gsub(" ",""):split(",")
			if self.Text:find("#") then
				color = Color3.fromHex(self.Text)
			else
				color = Color3.fromRGB(color[1], color[2], color[3])
			end
			
			name = mod:GetAttribute("Listener")
			ui[name]:SetAttribute("Color", color)
			setwaypointcolor(folder[name], color)
			mod.Content.Color.Box.Text = math.floor(color.R * 255)..", "..math.floor(color.G * 255)..", "..math.floor(color.B * 255)
			mod.Content.Color.Preview.BackgroundColor3 = color
		end
	end)
	
	focuslost("Width", function(self)
		local t = self.Text
		if not isempty(t) then
			local width = tonumber(self.Text)
			name = mod:GetAttribute("Listener")
			ui[name]:SetAttribute("BeamWidth", width)
			setwaypointwidth(folder[name], width)
		end
	end)
	
	local checking = false
	script.Parent.Keybind.Activated:Connect(function()
		checking = true
		script.Parent.Keybind.Text = "Keybind: ..."
	end)
	
	uis.InputBegan:Connect(function(i)
		if checking and i.KeyCode ~= nil then
			local key = i.KeyCode.Name
			script.Parent.Keybind.Text = "Keybind: "..key
			ui[mod:GetAttribute("Listener")]:SetAttribute("Keybind", key)
			checking = false
		end
	end)
end
coroutine.wrap(BLIFI_fake_script)()
local function CEDMA_fake_script() -- Main.TextBoxEffect 
	local script = Instance.new('LocalScript', Main)

	local ts = game:GetService("TweenService")
	local uis = game:GetService("UserInputService")
	local duration = 0.25
	local line = script.Parent.LineEffect
	local sine = Enum.EasingStyle.Sine
	local out = Enum.EasingDirection.Out
	local info = TweenInfo.new(duration, sine, out)
	
	function addeffect(a)
		if a:FindFirstAncestor("Waypoints") then
			local targetsize = UDim2.new(1, 2, 0, 1)
	
			local new = line:Clone()
			new.Parent = a
			new.Visible = true
			new.ZIndex = 20
	
			ts:Create(new, info, {Size = targetsize}):Play()
		end
	end
	function removeeffect(a)
		if a:FindFirstAncestor("Waypoints") then
			local obj = a.LineEffect
			local targetsize = UDim2.new(0, 0, 0, 1)
	
			ts:Create(obj, info, {Size = targetsize, Transparency = 1}):Play()
	
			task.wait(duration)
	
			obj:Destroy()
		end
	end
	
	uis.TextBoxFocused:Connect(addeffect)
	uis.TextBoxFocusReleased:Connect(removeeffect)
end
coroutine.wrap(CEDMA_fake_script)()
local function CKKHMT_fake_script() -- Content_2.ConfigUI 
	local script = Instance.new('LocalScript', Content_2)

	function focuslost(obj,func)
		local a = (script.Parent[obj].ClassName == "Frame" and script.Parent[obj].Box) or script.Parent[obj]
		a.FocusLost:Connect(function(ep)
			if ep then
				func(a)
			end
		end)
	end
	function isempty(s)
		return s:gsub(" ","") == ""
	end
	
	local player = game:GetService("Players").LocalPlayer
	local set = script.Parent.Parent
	local ui = script.Parent.Parent.Parent.Scroll
	local folder = workspace[script.Parent.Parent.Parent:GetAttribute("Folder")]
	
	local cfgs = script.Parent.Configs
	local args = {"Out", "Sine", 0.2, true}
	local isopen = false
	
	function opendropdown(a)
		local abs = a.Items.UIListLayout.AbsoluteContentSize
		a.Toggle.Text = "v"
		a.Items:TweenSize(UDim2.new(1, 0, 0, abs.Y), unpack(args))
	end
	function closedropdown(a)
		a.Toggle.Text = ">"
		a.Items:TweenSize(UDim2.new(1, 0, 0, 0), unpack(args))
	end
	function updatedropdown(a)
		if isopen then
			opendropdown(a)
		end
	end
	
	set.Close.Activated:Connect(function()
		set.Visible = false
	end)
	
	cfgs.Toggle.Activated:Connect(function()
		isopen = not isopen
		if isopen then
			opendropdown(cfgs)
		else
			closedropdown(cfgs)
		end
	end)
	cfgs.Items.ChildAdded:Connect(function()
		updatedropdown(cfgs)
	end)
	cfgs.Items.ChildRemoved:Connect(function()
		updatedropdown(cfgs)
	end)
	
	function loadconfigs()
		for _,v in next, cfgs.Items:GetChildren() do
			if v.Name ~= "UIListLayout" and v.Name ~= "Example" then
				v:Destroy()
			end
		end
		for _,v in next, listfiles("WaypointManager") do
			local name = v:sub(17, -1)
			local new = cfgs.Items.Example:Clone()
			new.Visible = true
			new.Parent = cfgs.Items
			new.Name = name
			new.Text = name
			new.Activated:Connect(function()
				script.Parent:SetAttribute("Selected", name)
			end)
		end
	end
	shared.WP_LOADCFGS = loadconfigs
	if not game:GetService("RunService"):IsStudio() and isfolder("WaypointManager") then
		loadconfigs()
	end
end
coroutine.wrap(CKKHMT_fake_script)()
local function VEURQFF_fake_script() -- Content_2.ConfigManager 
	local script = Instance.new('LocalScript', Content_2)

	local scroll = script.Parent.Parent.Parent.Scroll
	local http = game:GetService("HttpService")
	script.Parent:SetAttribute("Selected", "")
	function isempty(s)
		return s:gsub(" ","") == ""
	end
	function encode(s)
		return http:JSONEncode(s)
	end
	function decode(s)
		local a = http:JSONDecode(s)
		a.Position = Vector3.new(unpack(a.Position))
		a.Color = Color3.new(unpack(a.Color))
		return a
	end
	function totable(a)
		if typeof(a) == "Vector3" then
			return {a.X, a.Y, a.Z}
		elseif typeof(a) == "Color3" then
			return {a.R, a.G, a.B}
		end
	end
	function save()
		local t = script.Parent.ConfigName.Text
		local s = script.Parent:GetAttribute("Selected")
		if not isempty(t) then
			if not isfolder("WaypointManager") then
				makefolder("WaypointManager")
			end
			
			local path = "WaypointManager\\"..t
			makefolder(path)
			
			for i,v in next, scroll:GetChildren() do
				if v.Name ~= "UIListLayout" and v.Name ~= "Example" then
					local name = v:GetAttribute("Name")
					local data = {
						Name = name,
						Position = totable(v:GetAttribute("Position")),
						Color = totable(v:GetAttribute("Color")),
						BeamWidth = v:GetAttribute("BeamWidth"),
						Created = v:GetAttribute("Created"),
						Keybind = v:GetAttribute("Keybind")
					}
					writefile(path.."\\"..name..".json", encode(data))
				end
			end
			shared.WP_LOADCFGS()
		end
	end
	function load()
		local s = script.Parent:GetAttribute("Selected")
		local path = "WaypointManager\\"..s
		if isfolder(path) and s ~= "" then
			shared.WP_CLEAR()
			shared.WP_CLEARWP()
			for i,v in next, listfiles(path) do
				local data = decode(readfile(v))
				shared.WP_NEW(data)
				shared.WP_ADD(data)
			end
		end
	end
	function delete()
		local s = script.Parent:GetAttribute("Selected")
		local path = "WaypointManager\\"..s
		if isfolder(path) and s ~= "" then
			delfolder(path)
			script.Parent.Configs.Items[s]:Destroy()
		end
	end
	
	script.Parent.Save.Activated:Connect(save)
	script.Parent.Load.Activated:Connect(load)
	script.Parent.Delete.Activated:Connect(delete)
end
coroutine.wrap(VEURQFF_fake_script)()
