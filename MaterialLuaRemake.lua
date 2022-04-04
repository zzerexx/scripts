if getgenv().MLRemake ~= nil then
	return MLRemake
end
local MLRemake = {
	MLRemake = Instance.new("ScreenGui"),
	Topbar = Instance.new("Frame"),
	Main = Instance.new("Frame"),
	UICorner = Instance.new("UICorner"),
	Navigator = Instance.new("Frame"),
	UICorner_2 = Instance.new("UICorner"),
	Buttons = Instance.new("ScrollingFrame"),
	UIListLayout = Instance.new("UIListLayout"),
	Example = Instance.new("TextButton"),
	UIPadding = Instance.new("UIPadding"),
	Selection = Instance.new("Frame"),
	UICorner_3 = Instance.new("UICorner"),
	Line = Instance.new("Frame"),
	Icon = Instance.new("ImageLabel"),
	Fill = Instance.new("Frame"),
	Line_2 = Instance.new("Frame"),
	Title = Instance.new("TextLabel"),
	Icon_2 = Instance.new("ImageLabel"),
	SubTitle = Instance.new("TextLabel"),
	Pages = Instance.new("Frame"),
	UIPadding_2 = Instance.new("UIPadding"),
	Example_2 = Instance.new("ScrollingFrame"),
	Button = Instance.new("TextButton"),
	UICorner_4 = Instance.new("UICorner"),
	UIPadding_3 = Instance.new("UIPadding"),
	Menu = Instance.new("ImageButton"),
	UIListLayout_2 = Instance.new("UIListLayout"),
	Toggle = Instance.new("TextButton"),
	UICorner_5 = Instance.new("UICorner"),
	UIPadding_4 = Instance.new("UIPadding"),
	Toggle_2 = Instance.new("Frame"),
	UICorner_6 = Instance.new("UICorner"),
	Indicator = Instance.new("Frame"),
	UICorner_7 = Instance.new("UICorner"),
	Menu_2 = Instance.new("ImageButton"),
	Dropdown = Instance.new("Frame"),
	UIPadding_5 = Instance.new("UIPadding"),
	UICorner_8 = Instance.new("UICorner"),
	Label = Instance.new("TextLabel"),
	Option = Instance.new("TextLabel"),
	Dropdown_2 = Instance.new("Frame"),
	UICorner_9 = Instance.new("UICorner"),
	UIPadding_6 = Instance.new("UIPadding"),
	UIListLayout_3 = Instance.new("UIListLayout"),
	Option_2 = Instance.new("TextButton"),
	UICorner_10 = Instance.new("UICorner"),
	UIPadding_7 = Instance.new("UIPadding"),
	Button_2 = Instance.new("TextButton"),
	Fill_2 = Instance.new("Frame"),
	RippleHolder = Instance.new("Frame"),
	Indicator_2 = Instance.new("Frame"),
	UICorner_11 = Instance.new("UICorner"),
	Menu_3 = Instance.new("ImageButton"),
	TextBox = Instance.new("TextBox"),
	UIPadding_8 = Instance.new("UIPadding"),
	UICorner_12 = Instance.new("UICorner"),
	Hidden = Instance.new("TextBox"),
	Menu_4 = Instance.new("ImageButton"),
	Label_2 = Instance.new("TextLabel"),
	UIPadding_9 = Instance.new("UIPadding"),
	UICorner_13 = Instance.new("UICorner"),
	Menu_5 = Instance.new("ImageButton"),
	Slider = Instance.new("Frame"),
	UIPadding_10 = Instance.new("UIPadding"),
	UICorner_14 = Instance.new("UICorner"),
	Label_3 = Instance.new("TextLabel"),
	Bar = Instance.new("Frame"),
	Indicator_3 = Instance.new("Frame"),
	UICorner_15 = Instance.new("UICorner"),
	Slider_2 = Instance.new("TextButton"),
	Toggle_3 = Instance.new("Frame"),
	UICorner_16 = Instance.new("UICorner"),
	Indicator_4 = Instance.new("Frame"),
	UICorner_17 = Instance.new("UICorner"),
	Button_3 = Instance.new("TextButton"),
	Input = Instance.new("TextBox"),
	UICorner_18 = Instance.new("UICorner"),
	Menu_6 = Instance.new("ImageButton"),
	Value = Instance.new("TextLabel"),
	ColorPicker = Instance.new("Frame"),
	UIPadding_11 = Instance.new("UIPadding"),
	UICorner_19 = Instance.new("UICorner"),
	Label_4 = Instance.new("TextLabel"),
	Color = Instance.new("TextLabel"),
	Picker = Instance.new("Frame"),
	UICorner_20 = Instance.new("UICorner"),
	UIPadding_12 = Instance.new("UIPadding"),
	UIListLayout_4 = Instance.new("UIListLayout"),
	Hue = Instance.new("Frame"),
	Bar_2 = Instance.new("Frame"),
	UICorner_21 = Instance.new("UICorner"),
	UIGradient = Instance.new("UIGradient"),
	Slider_3 = Instance.new("TextButton"),
	Indicator_5 = Instance.new("Frame"),
	UICorner_22 = Instance.new("UICorner"),
	Label_5 = Instance.new("TextLabel"),
	UICorner_23 = Instance.new("UICorner"),
	UIPadding_13 = Instance.new("UIPadding"),
	Value_2 = Instance.new("TextLabel"),
	UICorner_24 = Instance.new("UICorner"),
	UIPadding_14 = Instance.new("UIPadding"),
	Saturation = Instance.new("Frame"),
	Bar_3 = Instance.new("Frame"),
	UICorner_25 = Instance.new("UICorner"),
	UIGradient_2 = Instance.new("UIGradient"),
	Slider_4 = Instance.new("TextButton"),
	Indicator_6 = Instance.new("Frame"),
	UICorner_26 = Instance.new("UICorner"),
	Label_6 = Instance.new("TextLabel"),
	UICorner_27 = Instance.new("UICorner"),
	UIPadding_15 = Instance.new("UIPadding"),
	Value_3 = Instance.new("TextLabel"),
	UICorner_28 = Instance.new("UICorner"),
	UIPadding_16 = Instance.new("UIPadding"),
	Value_4 = Instance.new("Frame"),
	Bar_4 = Instance.new("Frame"),
	UICorner_29 = Instance.new("UICorner"),
	UIGradient_3 = Instance.new("UIGradient"),
	Slider_5 = Instance.new("TextButton"),
	Indicator_7 = Instance.new("Frame"),
	UICorner_30 = Instance.new("UICorner"),
	Label_7 = Instance.new("TextLabel"),
	UICorner_31 = Instance.new("UICorner"),
	UIPadding_17 = Instance.new("UIPadding"),
	Value_5 = Instance.new("TextLabel"),
	UICorner_32 = Instance.new("UICorner"),
	UIPadding_18 = Instance.new("UIPadding"),
	Custom = Instance.new("Frame"),
	HEX = Instance.new("TextBox"),
	UICorner_33 = Instance.new("UICorner"),
	RGB = Instance.new("TextBox"),
	UICorner_34 = Instance.new("UICorner"),
	Rainbow = Instance.new("TextButton"),
	UICorner_35 = Instance.new("UICorner"),
	RainbowText = Instance.new("TextLabel"),
	UIGradient_4 = Instance.new("UIGradient"),
	Button_4 = Instance.new("TextButton"),
	Fill_3 = Instance.new("Frame"),
	Preview = Instance.new("Frame"),
	UICorner_36 = Instance.new("UICorner"),
	RippleHolder_2 = Instance.new("Frame"),
	Menu_7 = Instance.new("ImageButton"),
	Keybind = Instance.new("TextButton"),
	UICorner_37 = Instance.new("UICorner"),
	UIPadding_19 = Instance.new("UIPadding"),
	Bind_old = Instance.new("TextLabel"),
	Menu_8 = Instance.new("ImageButton"),
	Bind = Instance.new("Frame"),
	UICorner_38 = Instance.new("UICorner"),
	Label_8 = Instance.new("TextLabel"),
	UICorner_39 = Instance.new("UICorner"),
	ChipSet = Instance.new("Frame"),
	UIPadding_20 = Instance.new("UIPadding"),
	UICorner_40 = Instance.new("UICorner"),
	Label_9 = Instance.new("TextLabel"),
	Dropdown_3 = Instance.new("Frame"),
	UICorner_41 = Instance.new("UICorner"),
	UIPadding_21 = Instance.new("UIPadding"),
	UIListLayout_5 = Instance.new("UIListLayout"),
	Option_3 = Instance.new("Frame"),
	Button_5 = Instance.new("TextButton"),
	UICorner_42 = Instance.new("UICorner"),
	UIPadding_22 = Instance.new("UIPadding"),
	Enabled = Instance.new("ImageButton"),
	UICorner_43 = Instance.new("UICorner"),
	Menu_9 = Instance.new("ImageButton"),
	Button_6 = Instance.new("TextButton"),
	Fill_4 = Instance.new("Frame"),
	RippleHolder_3 = Instance.new("Frame"),
	Indicator_8 = Instance.new("Frame"),
	UICorner_44 = Instance.new("UICorner"),
	Menu_10 = Instance.new("ImageButton"),
	Table = Instance.new("Frame"),
	UIPadding_23 = Instance.new("UIPadding"),
	UICorner_45 = Instance.new("UICorner"),
	Label_10 = Instance.new("TextLabel"),
	Dropdown_4 = Instance.new("Frame"),
	UICorner_46 = Instance.new("UICorner"),
	UIPadding_24 = Instance.new("UIPadding"),
	UIListLayout_6 = Instance.new("UIListLayout"),
	Info = Instance.new("Frame"),
	UIPadding_25 = Instance.new("UIPadding"),
	UICorner_47 = Instance.new("UICorner"),
	Key = Instance.new("TextLabel"),
	Value_6 = Instance.new("TextLabel"),
	UIPadding_26 = Instance.new("UIPadding"),
	Line_3 = Instance.new("Frame"),
	Button_7 = Instance.new("TextButton"),
	Fill_5 = Instance.new("Frame"),
	RippleHolder_4 = Instance.new("Frame"),
	Indicator_9 = Instance.new("Frame"),
	UICorner_48 = Instance.new("UICorner"),
	Menu_11 = Instance.new("ImageButton"),
	BackgroundDim = Instance.new("Frame"),
	Banner = Instance.new("Frame"),
	UICorner_49 = Instance.new("UICorner"),
	Label_11 = Instance.new("TextLabel"),
	UIPadding_27 = Instance.new("UIPadding"),
	UICorner_50 = Instance.new("UICorner"),
	UIPadding_28 = Instance.new("UIPadding"),
	Buttons_2 = Instance.new("ScrollingFrame"),
	Example_3 = Instance.new("TextButton"),
	UICorner_51 = Instance.new("UICorner"),
	UIListLayout_7 = Instance.new("UIListLayout"),
	BackgroundDim2 = Instance.new("Frame"),
	Tabs = Instance.new("Frame"),
	UICorner_52 = Instance.new("UICorner"),
	Buttons_3 = Instance.new("ScrollingFrame"),
	UIListLayout_8 = Instance.new("UIListLayout"),
	Example_4 = Instance.new("TextButton"),
	UICorner_53 = Instance.new("UICorner"),
	ObjectMenu = Instance.new("Frame"),
	UIListLayout_9 = Instance.new("UIListLayout"),
	Example_5 = Instance.new("TextButton"),
	UIPadding_29 = Instance.new("UIPadding"),
	UICorner_54 = Instance.new("UICorner"),
	UICorner_55 = Instance.new("UICorner"),
	FillMain = Instance.new("Frame"),
	FillTopbar = Instance.new("Frame"),
	Title_2 = Instance.new("TextLabel"),
	UIPadding_30 = Instance.new("UIPadding"),
	Minimize = Instance.new("TextButton"),
	UICorner_56 = Instance.new("UICorner"),
	Menu_12 = Instance.new("ImageButton"),
	Ripple = Instance.new("Frame"),
	UICorner_57 = Instance.new("UICorner"),
	Focus = Instance.new("Frame"),
	Overlay = Instance.new("Frame"),
	UICorner_58 = Instance.new("UICorner"),
	SubTitle_2 = Instance.new("TextLabel"),
	UIPadding_31 = Instance.new("UIPadding"),
	Notifications = Instance.new("Frame"),
	UIListLayout_10 = Instance.new("UIListLayout"),
	Notif = Instance.new("Frame"),
	UICorner_59 = Instance.new("UICorner"),
	UIPadding_32 = Instance.new("UIPadding"),
	Title_3 = Instance.new("TextLabel"),
	Label_12 = Instance.new("TextLabel"),
	Line_4 = Instance.new("Frame"),
	Buttons_4 = Instance.new("ScrollingFrame"),
	UIListLayout_11 = Instance.new("UIListLayout"),
	Button_8 = Instance.new("TextButton"),
	UICorner_60 = Instance.new("UICorner"),
}
local library

if syn then
	syn.protect_gui(MLRemake.MLRemake)
end

MLRemake.MLRemake.Name = "MLRemake"
MLRemake.MLRemake.Parent = (gethui and gethui()) or (get_hidden_ui and get_hidden_ui()) or game.CoreGui

MLRemake.Topbar.Name = "Topbar"
MLRemake.Topbar.Parent = MLRemake.MLRemake
MLRemake.Topbar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MLRemake.Topbar.BorderSizePixel = 0
MLRemake.Topbar.Position = UDim2.new(0, 375, 0, 45)
MLRemake.Topbar.Size = UDim2.new(0, 400, 0, 30)
MLRemake.Topbar.ZIndex = 5

MLRemake.Main.Name = "Main"
MLRemake.Main.Parent = MLRemake.Topbar
MLRemake.Main.AnchorPoint = Vector2.new(0.5, 0)
MLRemake.Main.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MLRemake.Main.BorderSizePixel = 0
MLRemake.Main.ClipsDescendants = true
MLRemake.Main.Position = UDim2.new(0.5, 0, 0, 30)
MLRemake.Main.Size = UDim2.new(0, 400, 0, 490)
MLRemake.Main.ZIndex = 0

MLRemake.UICorner.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner.Parent = MLRemake.Main

MLRemake.Navigator.Name = "Navigator"
MLRemake.Navigator.Parent = MLRemake.Main
MLRemake.Navigator.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
MLRemake.Navigator.BorderSizePixel = 0
MLRemake.Navigator.Position = UDim2.new(0, -200, 0, 0)
MLRemake.Navigator.Size = UDim2.new(0, 200, 1, 0)
MLRemake.Navigator.ZIndex = 8

MLRemake.UICorner_2.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_2.Parent = MLRemake.Navigator

MLRemake.Buttons.Name = "Buttons"
MLRemake.Buttons.Parent = MLRemake.Navigator
MLRemake.Buttons.Active = true
MLRemake.Buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Buttons.BackgroundTransparency = 1.000
MLRemake.Buttons.BorderSizePixel = 0
MLRemake.Buttons.Size = UDim2.new(1, 0, 1, 0)
MLRemake.Buttons.ZIndex = 8
MLRemake.Buttons.CanvasSize = UDim2.new(0, 0, 0, 0)
MLRemake.Buttons.ScrollBarThickness = 0

MLRemake.UIListLayout.Parent = MLRemake.Buttons
MLRemake.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

MLRemake.Example.Name = "Example"
MLRemake.Example.Parent = MLRemake.Buttons
MLRemake.Example.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Example.BackgroundTransparency = 1.000
MLRemake.Example.BorderSizePixel = 0
MLRemake.Example.Size = UDim2.new(1, 0, 0, 30)
MLRemake.Example.Visible = false
MLRemake.Example.ZIndex = 8
MLRemake.Example.AutoButtonColor = false
MLRemake.Example.Font = Enum.Font.Gotham
MLRemake.Example.Text = "Page"
MLRemake.Example.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Example.TextSize = 14.000
MLRemake.Example.TextTransparency = 0.400
MLRemake.Example.TextXAlignment = Enum.TextXAlignment.Left

MLRemake.UIPadding.Parent = MLRemake.Example
MLRemake.UIPadding.PaddingLeft = UDim.new(0, 8)

MLRemake.Selection.Name = "Selection"
MLRemake.Selection.Parent = MLRemake.Example
MLRemake.Selection.AnchorPoint = Vector2.new(0, 0.5)
MLRemake.Selection.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
MLRemake.Selection.BackgroundTransparency = 0.500
MLRemake.Selection.BorderSizePixel = 0
MLRemake.Selection.Position = UDim2.new(0, -5, 0.5, 0)
MLRemake.Selection.Size = UDim2.new(1, 1, 1, -5)
MLRemake.Selection.Visible = false
MLRemake.Selection.ZIndex = 8

MLRemake.UICorner_3.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_3.Parent = MLRemake.Selection

MLRemake.Line.Name = "Line"
MLRemake.Line.Parent = MLRemake.Example
MLRemake.Line.AnchorPoint = Vector2.new(0, 1)
MLRemake.Line.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
MLRemake.Line.BorderSizePixel = 0
MLRemake.Line.Position = UDim2.new(0, 0, 1, 0)
MLRemake.Line.Size = UDim2.new(1, -8, 0, 1)
MLRemake.Line.ZIndex = 8

MLRemake.Icon.Name = "Icon"
MLRemake.Icon.Parent = MLRemake.Example
MLRemake.Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Icon.BackgroundTransparency = 1.000
MLRemake.Icon.BorderSizePixel = 0
MLRemake.Icon.Position = UDim2.new(0, -34, 0, 0)
MLRemake.Icon.Size = UDim2.new(0, 30, 0, 30)
MLRemake.Icon.Visible = false
MLRemake.Icon.ZIndex = 8
MLRemake.Icon.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

MLRemake.Fill.Name = "Fill"
MLRemake.Fill.Parent = MLRemake.Navigator
MLRemake.Fill.AnchorPoint = Vector2.new(1, 0)
MLRemake.Fill.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
MLRemake.Fill.BorderSizePixel = 0
MLRemake.Fill.Position = UDim2.new(1, 0, 0, 0)
MLRemake.Fill.Size = UDim2.new(0, 5, 1, 0)
MLRemake.Fill.ZIndex = 7

MLRemake.Line_2.Name = "Line"
MLRemake.Line_2.Parent = MLRemake.Navigator
MLRemake.Line_2.AnchorPoint = Vector2.new(1, 0)
MLRemake.Line_2.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
MLRemake.Line_2.BorderSizePixel = 0
MLRemake.Line_2.Position = UDim2.new(1, 0, 0, 0)
MLRemake.Line_2.Size = UDim2.new(0, 1, 1, 0)
MLRemake.Line_2.ZIndex = 7

MLRemake.Title.Name = "Title"
MLRemake.Title.Parent = MLRemake.Navigator
MLRemake.Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Title.BackgroundTransparency = 1.000
MLRemake.Title.BorderSizePixel = 0
MLRemake.Title.Position = UDim2.new(0, 50, 0, 5)
MLRemake.Title.Size = UDim2.new(1, -50, 0, 20)
MLRemake.Title.ZIndex = 8
MLRemake.Title.Font = Enum.Font.GothamSemibold
MLRemake.Title.Text = "Material Lua"
MLRemake.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Title.TextSize = 16.000
MLRemake.Title.TextXAlignment = Enum.TextXAlignment.Left

MLRemake.Icon_2.Name = "Icon"
MLRemake.Icon_2.Parent = MLRemake.Navigator
MLRemake.Icon_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Icon_2.BorderSizePixel = 0
MLRemake.Icon_2.Position = UDim2.new(0, 5, 0, 5)
MLRemake.Icon_2.Size = UDim2.new(0, 40, 0, 40)
MLRemake.Icon_2.ZIndex = 8
MLRemake.Icon_2.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

MLRemake.SubTitle.Name = "SubTitle"
MLRemake.SubTitle.Parent = MLRemake.Navigator
MLRemake.SubTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.SubTitle.BackgroundTransparency = 1.000
MLRemake.SubTitle.BorderSizePixel = 0
MLRemake.SubTitle.Position = UDim2.new(0, 50, 0, 28)
MLRemake.SubTitle.Size = UDim2.new(1, -50, 0, 20)
MLRemake.SubTitle.ZIndex = 8
MLRemake.SubTitle.Font = Enum.Font.Gotham
MLRemake.SubTitle.Text = "Remake Version"
MLRemake.SubTitle.TextColor3 = Color3.fromRGB(150, 150, 150)
MLRemake.SubTitle.TextSize = 14.000
MLRemake.SubTitle.TextXAlignment = Enum.TextXAlignment.Left
MLRemake.SubTitle.TextYAlignment = Enum.TextYAlignment.Top

MLRemake.Pages.Name = "Pages"
MLRemake.Pages.Parent = MLRemake.Main
MLRemake.Pages.AnchorPoint = Vector2.new(0, 1)
MLRemake.Pages.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Pages.BackgroundTransparency = 1.000
MLRemake.Pages.BorderSizePixel = 0
MLRemake.Pages.Position = UDim2.new(0, 0, 1, 0)
MLRemake.Pages.Size = UDim2.new(1, 0, 1, -35)
MLRemake.Pages.ZIndex = 0

MLRemake.UIPadding_2.Parent = MLRemake.Pages
MLRemake.UIPadding_2.PaddingBottom = UDim.new(0, 10)
MLRemake.UIPadding_2.PaddingLeft = UDim.new(0, 10)
MLRemake.UIPadding_2.PaddingRight = UDim.new(0, 10)
MLRemake.UIPadding_2.PaddingTop = UDim.new(0, 10)

MLRemake.Example_2.Name = "Example"
MLRemake.Example_2.Parent = MLRemake.Pages
MLRemake.Example_2.Active = true
MLRemake.Example_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Example_2.BackgroundTransparency = 1.000
MLRemake.Example_2.BorderSizePixel = 0
MLRemake.Example_2.Size = UDim2.new(1, 0, 1, 0)
MLRemake.Example_2.CanvasSize = UDim2.new(0, 0, 0, 0)
MLRemake.Example_2.ScrollBarThickness = 0

MLRemake.Button.Name = "Button"
MLRemake.Button.Parent = MLRemake.Example_2
MLRemake.Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MLRemake.Button.BorderSizePixel = 0
MLRemake.Button.Size = UDim2.new(1, 0, 0, 30)
MLRemake.Button.ZIndex = 2
MLRemake.Button.AutoButtonColor = false
MLRemake.Button.Font = Enum.Font.Gotham
MLRemake.Button.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Button.TextSize = 14.000
MLRemake.Button.TextXAlignment = Enum.TextXAlignment.Left

MLRemake.UICorner_4.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_4.Parent = MLRemake.Button

MLRemake.UIPadding_3.Parent = MLRemake.Button
MLRemake.UIPadding_3.PaddingLeft = UDim.new(0, 8)
MLRemake.UIPadding_3.PaddingRight = UDim.new(0, 10)

MLRemake.Menu.Name = "Menu"
MLRemake.Menu.Parent = MLRemake.Button
MLRemake.Menu.AnchorPoint = Vector2.new(1, 0)
MLRemake.Menu.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Menu.BackgroundTransparency = 1.000
MLRemake.Menu.BorderSizePixel = 0
MLRemake.Menu.Position = UDim2.new(1, 0, 0, 5)
MLRemake.Menu.Size = UDim2.new(0, 20, 0, 20)
MLRemake.Menu.Visible = false
MLRemake.Menu.ZIndex = 3
MLRemake.Menu.Image = "http://www.roblox.com/asset/?id=9147554930"

MLRemake.UIListLayout_2.Parent = MLRemake.Example_2
MLRemake.UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
MLRemake.UIListLayout_2.Padding = UDim.new(0, 5)

MLRemake.Toggle.Name = "Toggle"
MLRemake.Toggle.Parent = MLRemake.Example_2
MLRemake.Toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MLRemake.Toggle.BorderSizePixel = 0
MLRemake.Toggle.Size = UDim2.new(1, 0, 0, 30)
MLRemake.Toggle.ZIndex = 2
MLRemake.Toggle.AutoButtonColor = false
MLRemake.Toggle.Font = Enum.Font.Gotham
MLRemake.Toggle.Text = "Toggle"
MLRemake.Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Toggle.TextSize = 14.000
MLRemake.Toggle.TextXAlignment = Enum.TextXAlignment.Left

MLRemake.UICorner_5.CornerRadius = UDim.new(0, 6)
MLRemake.UICorner_5.Parent = MLRemake.Toggle

MLRemake.UIPadding_4.Parent = MLRemake.Toggle
MLRemake.UIPadding_4.PaddingLeft = UDim.new(0, 8)
MLRemake.UIPadding_4.PaddingRight = UDim.new(0, 10)

MLRemake.Toggle_2.Name = "Toggle"
MLRemake.Toggle_2.Parent = MLRemake.Toggle
MLRemake.Toggle_2.AnchorPoint = Vector2.new(1, 0.5)
MLRemake.Toggle_2.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MLRemake.Toggle_2.BorderSizePixel = 0
MLRemake.Toggle_2.Position = UDim2.new(1, 0, 0, 15)
MLRemake.Toggle_2.Size = UDim2.new(0, 32, 0, 16)
MLRemake.Toggle_2.ZIndex = 2

MLRemake.UICorner_6.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_6.Parent = MLRemake.Toggle_2

MLRemake.Indicator.Name = "Indicator"
MLRemake.Indicator.Parent = MLRemake.Toggle_2
MLRemake.Indicator.AnchorPoint = Vector2.new(0, 0.5)
MLRemake.Indicator.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
MLRemake.Indicator.Position = UDim2.new(0, 0, 0.5, 0)
MLRemake.Indicator.Size = UDim2.new(0, 16, 0, 16)
MLRemake.Indicator.ZIndex = 2

MLRemake.UICorner_7.CornerRadius = UDim.new(0, 6)
MLRemake.UICorner_7.Parent = MLRemake.Indicator

MLRemake.Menu_2.Name = "Menu"
MLRemake.Menu_2.Parent = MLRemake.Toggle
MLRemake.Menu_2.AnchorPoint = Vector2.new(1, 0)
MLRemake.Menu_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Menu_2.BackgroundTransparency = 1.000
MLRemake.Menu_2.BorderSizePixel = 0
MLRemake.Menu_2.Position = UDim2.new(1, 0, 0, 5)
MLRemake.Menu_2.Size = UDim2.new(0, 20, 0, 20)
MLRemake.Menu_2.Visible = false
MLRemake.Menu_2.ZIndex = 3
MLRemake.Menu_2.Image = "http://www.roblox.com/asset/?id=9147554930"

MLRemake.Dropdown.Name = "Dropdown"
MLRemake.Dropdown.Parent = MLRemake.Example_2
MLRemake.Dropdown.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MLRemake.Dropdown.Size = UDim2.new(1, 0, 0, 30)
MLRemake.Dropdown.ZIndex = 2

MLRemake.UIPadding_5.Parent = MLRemake.Dropdown
MLRemake.UIPadding_5.PaddingLeft = UDim.new(0, 8)
MLRemake.UIPadding_5.PaddingRight = UDim.new(0, 10)

MLRemake.UICorner_8.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_8.Parent = MLRemake.Dropdown

MLRemake.Label.Name = "Label"
MLRemake.Label.Parent = MLRemake.Dropdown
MLRemake.Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Label.BackgroundTransparency = 1.000
MLRemake.Label.BorderSizePixel = 0
MLRemake.Label.Size = UDim2.new(1, 0, 0, 30)
MLRemake.Label.ZIndex = 2
MLRemake.Label.Font = Enum.Font.Gotham
MLRemake.Label.Text = "Dropdown"
MLRemake.Label.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Label.TextSize = 14.000
MLRemake.Label.TextXAlignment = Enum.TextXAlignment.Left

MLRemake.Option.Name = "Option"
MLRemake.Option.Parent = MLRemake.Dropdown
MLRemake.Option.AnchorPoint = Vector2.new(1, 0)
MLRemake.Option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Option.BackgroundTransparency = 1.000
MLRemake.Option.BorderSizePixel = 0
MLRemake.Option.Position = UDim2.new(1, -25, 0, 0)
MLRemake.Option.Size = UDim2.new(0.25, 0, 0, 30)
MLRemake.Option.ZIndex = 2
MLRemake.Option.Font = Enum.Font.Gotham
MLRemake.Option.Text = "Option"
MLRemake.Option.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Option.TextSize = 14.000
MLRemake.Option.TextXAlignment = Enum.TextXAlignment.Right

MLRemake.Dropdown_2.Name = "Dropdown"
MLRemake.Dropdown_2.Parent = MLRemake.Dropdown
MLRemake.Dropdown_2.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
MLRemake.Dropdown_2.BorderSizePixel = 0
MLRemake.Dropdown_2.ClipsDescendants = true
MLRemake.Dropdown_2.Position = UDim2.new(0, -8, 0, 30)
MLRemake.Dropdown_2.Size = UDim2.new(1, 18, 1, -30)
MLRemake.Dropdown_2.ZIndex = 3

MLRemake.UICorner_9.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_9.Parent = MLRemake.Dropdown_2

MLRemake.UIPadding_6.Parent = MLRemake.Dropdown_2
MLRemake.UIPadding_6.PaddingBottom = UDim.new(0, 5)
MLRemake.UIPadding_6.PaddingLeft = UDim.new(0, 5)
MLRemake.UIPadding_6.PaddingRight = UDim.new(0, 5)
MLRemake.UIPadding_6.PaddingTop = UDim.new(0, 5)

MLRemake.UIListLayout_3.Parent = MLRemake.Dropdown_2
MLRemake.UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
MLRemake.UIListLayout_3.Padding = UDim.new(0, 5)

MLRemake.Option_2.Name = "Option"
MLRemake.Option_2.Parent = MLRemake.Dropdown_2
MLRemake.Option_2.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MLRemake.Option_2.BorderSizePixel = 0
MLRemake.Option_2.Size = UDim2.new(1, 0, 0, 30)
MLRemake.Option_2.Visible = false
MLRemake.Option_2.ZIndex = 3
MLRemake.Option_2.AutoButtonColor = false
MLRemake.Option_2.Font = Enum.Font.Gotham
MLRemake.Option_2.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Option_2.TextSize = 14.000
MLRemake.Option_2.TextXAlignment = Enum.TextXAlignment.Left

MLRemake.UICorner_10.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_10.Parent = MLRemake.Option_2

MLRemake.UIPadding_7.Parent = MLRemake.Option_2
MLRemake.UIPadding_7.PaddingLeft = UDim.new(0, 8)

MLRemake.Button_2.Name = "Button"
MLRemake.Button_2.Parent = MLRemake.Dropdown
MLRemake.Button_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Button_2.BackgroundTransparency = 1.000
MLRemake.Button_2.BorderSizePixel = 0
MLRemake.Button_2.Size = UDim2.new(1, 0, 0, 30)
MLRemake.Button_2.ZIndex = 3
MLRemake.Button_2.AutoButtonColor = false
MLRemake.Button_2.Font = Enum.Font.SourceSans
MLRemake.Button_2.Text = ""
MLRemake.Button_2.TextColor3 = Color3.fromRGB(0, 0, 0)
MLRemake.Button_2.TextSize = 14.000

MLRemake.Fill_2.Name = "Fill"
MLRemake.Fill_2.Parent = MLRemake.Dropdown
MLRemake.Fill_2.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
MLRemake.Fill_2.BorderSizePixel = 0
MLRemake.Fill_2.Position = UDim2.new(0, -8, 0, 30)
MLRemake.Fill_2.Size = UDim2.new(1, 18, 0, 5)
MLRemake.Fill_2.Visible = false
MLRemake.Fill_2.ZIndex = 2

MLRemake.RippleHolder.Name = "RippleHolder"
MLRemake.RippleHolder.Parent = MLRemake.Dropdown
MLRemake.RippleHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.RippleHolder.BackgroundTransparency = 1.000
MLRemake.RippleHolder.BorderSizePixel = 0
MLRemake.RippleHolder.Position = UDim2.new(0, -8, 0, 0)
MLRemake.RippleHolder.Size = UDim2.new(0, 380, 0, 30)
MLRemake.RippleHolder.ZIndex = 2

MLRemake.Indicator_2.Name = "Indicator"
MLRemake.Indicator_2.Parent = MLRemake.Dropdown
MLRemake.Indicator_2.AnchorPoint = Vector2.new(1, 0)
MLRemake.Indicator_2.BackgroundColor3 = Color3.fromRGB(250, 170, 75)
MLRemake.Indicator_2.Position = UDim2.new(1, 0, 0, 5)
MLRemake.Indicator_2.Size = UDim2.new(0, 20, 0, 20)
MLRemake.Indicator_2.ZIndex = 2

MLRemake.UICorner_11.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_11.Parent = MLRemake.Indicator_2

MLRemake.Menu_3.Name = "Menu"
MLRemake.Menu_3.Parent = MLRemake.Dropdown
MLRemake.Menu_3.AnchorPoint = Vector2.new(1, 0)
MLRemake.Menu_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Menu_3.BackgroundTransparency = 1.000
MLRemake.Menu_3.BorderSizePixel = 0
MLRemake.Menu_3.Position = UDim2.new(1, 0, 0, 5)
MLRemake.Menu_3.Size = UDim2.new(0, 20, 0, 20)
MLRemake.Menu_3.Visible = false
MLRemake.Menu_3.ZIndex = 3
MLRemake.Menu_3.Image = "http://www.roblox.com/asset/?id=9147554930"

MLRemake.TextBox.Parent = MLRemake.Example_2
MLRemake.TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MLRemake.TextBox.Size = UDim2.new(1, 0, 0, 30)
MLRemake.TextBox.ZIndex = 2
MLRemake.TextBox.ClearTextOnFocus = false
MLRemake.TextBox.Font = Enum.Font.Gotham
MLRemake.TextBox.PlaceholderText = "Text Box"
MLRemake.TextBox.Text = ""
MLRemake.TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.TextBox.TextSize = 14.000
MLRemake.TextBox.TextXAlignment = Enum.TextXAlignment.Left

MLRemake.UIPadding_8.Parent = MLRemake.TextBox
MLRemake.UIPadding_8.PaddingLeft = UDim.new(0, 8)
MLRemake.UIPadding_8.PaddingRight = UDim.new(0, 10)

MLRemake.UICorner_12.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_12.Parent = MLRemake.TextBox

MLRemake.Hidden.Name = "Hidden"
MLRemake.Hidden.Parent = MLRemake.TextBox
MLRemake.Hidden.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Hidden.BackgroundTransparency = 1.000
MLRemake.Hidden.BorderSizePixel = 0
MLRemake.Hidden.Size = UDim2.new(1, 0, 1, 0)
MLRemake.Hidden.Visible = false
MLRemake.Hidden.ZIndex = 2
MLRemake.Hidden.ClearTextOnFocus = false
MLRemake.Hidden.Font = Enum.Font.SourceSans
MLRemake.Hidden.Text = ""
MLRemake.Hidden.TextColor3 = Color3.fromRGB(0, 0, 0)
MLRemake.Hidden.TextSize = 14.000

MLRemake.Menu_4.Name = "Menu"
MLRemake.Menu_4.Parent = MLRemake.TextBox
MLRemake.Menu_4.AnchorPoint = Vector2.new(1, 0)
MLRemake.Menu_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Menu_4.BackgroundTransparency = 1.000
MLRemake.Menu_4.BorderSizePixel = 0
MLRemake.Menu_4.Position = UDim2.new(1, 0, 0, 5)
MLRemake.Menu_4.Size = UDim2.new(0, 20, 0, 20)
MLRemake.Menu_4.Visible = false
MLRemake.Menu_4.ZIndex = 3
MLRemake.Menu_4.Image = "http://www.roblox.com/asset/?id=9147554930"

MLRemake.Label_2.Name = "Label"
MLRemake.Label_2.Parent = MLRemake.Example_2
MLRemake.Label_2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MLRemake.Label_2.Size = UDim2.new(1, 0, 0, 30)
MLRemake.Label_2.ZIndex = 2
MLRemake.Label_2.Font = Enum.Font.Gotham
MLRemake.Label_2.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Label_2.TextSize = 14.000
MLRemake.Label_2.TextXAlignment = Enum.TextXAlignment.Left

MLRemake.UIPadding_9.Parent = MLRemake.Label_2
MLRemake.UIPadding_9.PaddingLeft = UDim.new(0, 8)
MLRemake.UIPadding_9.PaddingRight = UDim.new(0, 10)

MLRemake.UICorner_13.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_13.Parent = MLRemake.Label_2

MLRemake.Menu_5.Name = "Menu"
MLRemake.Menu_5.Parent = MLRemake.Label_2
MLRemake.Menu_5.AnchorPoint = Vector2.new(1, 0)
MLRemake.Menu_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Menu_5.BackgroundTransparency = 1.000
MLRemake.Menu_5.BorderSizePixel = 0
MLRemake.Menu_5.Position = UDim2.new(1, 0, 0, 5)
MLRemake.Menu_5.Size = UDim2.new(0, 20, 0, 20)
MLRemake.Menu_5.Visible = false
MLRemake.Menu_5.ZIndex = 3
MLRemake.Menu_5.Image = "http://www.roblox.com/asset/?id=9147554930"

MLRemake.Slider.Name = "Slider"
MLRemake.Slider.Parent = MLRemake.Example_2
MLRemake.Slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MLRemake.Slider.Size = UDim2.new(1, 0, 0, 50)
MLRemake.Slider.ZIndex = 2

MLRemake.UIPadding_10.Parent = MLRemake.Slider
MLRemake.UIPadding_10.PaddingLeft = UDim.new(0, 8)
MLRemake.UIPadding_10.PaddingRight = UDim.new(0, 10)

MLRemake.UICorner_14.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_14.Parent = MLRemake.Slider

MLRemake.Label_3.Name = "Label"
MLRemake.Label_3.Parent = MLRemake.Slider
MLRemake.Label_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Label_3.BackgroundTransparency = 1.000
MLRemake.Label_3.BorderSizePixel = 0
MLRemake.Label_3.Size = UDim2.new(0.699999988, 0, 0, 30)
MLRemake.Label_3.ZIndex = 2
MLRemake.Label_3.Font = Enum.Font.Gotham
MLRemake.Label_3.Text = "Slider"
MLRemake.Label_3.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Label_3.TextSize = 14.000
MLRemake.Label_3.TextXAlignment = Enum.TextXAlignment.Left

MLRemake.Bar.Name = "Bar"
MLRemake.Bar.Parent = MLRemake.Slider
MLRemake.Bar.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MLRemake.Bar.BorderSizePixel = 0
MLRemake.Bar.Position = UDim2.new(0, 0, 0, 33)
MLRemake.Bar.Size = UDim2.new(1, 0, 0, 4)
MLRemake.Bar.ZIndex = 2

MLRemake.Indicator_3.Name = "Indicator"
MLRemake.Indicator_3.Parent = MLRemake.Bar
MLRemake.Indicator_3.AnchorPoint = Vector2.new(0, 0.5)
MLRemake.Indicator_3.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
MLRemake.Indicator_3.BorderSizePixel = 0
MLRemake.Indicator_3.Position = UDim2.new(0, 0, 0.5, 0)
MLRemake.Indicator_3.Size = UDim2.new(0, 6, 0, 16)
MLRemake.Indicator_3.ZIndex = 2

MLRemake.UICorner_15.CornerRadius = UDim.new(0, 3)
MLRemake.UICorner_15.Parent = MLRemake.Indicator_3

MLRemake.Slider_2.Name = "Slider"
MLRemake.Slider_2.Parent = MLRemake.Bar
MLRemake.Slider_2.AnchorPoint = Vector2.new(0, 0.5)
MLRemake.Slider_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Slider_2.BackgroundTransparency = 1.000
MLRemake.Slider_2.BorderSizePixel = 0
MLRemake.Slider_2.Position = UDim2.new(0, 0, 0, 2)
MLRemake.Slider_2.Size = UDim2.new(1, 0, 0, 24)
MLRemake.Slider_2.ZIndex = 3
MLRemake.Slider_2.AutoButtonColor = false
MLRemake.Slider_2.Font = Enum.Font.SourceSans
MLRemake.Slider_2.Text = ""
MLRemake.Slider_2.TextColor3 = Color3.fromRGB(0, 0, 0)
MLRemake.Slider_2.TextSize = 14.000

MLRemake.Toggle_3.Name = "Toggle"
MLRemake.Toggle_3.Parent = MLRemake.Slider
MLRemake.Toggle_3.AnchorPoint = Vector2.new(1, 0.5)
MLRemake.Toggle_3.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MLRemake.Toggle_3.BorderSizePixel = 0
MLRemake.Toggle_3.LayoutOrder = 1
MLRemake.Toggle_3.Position = UDim2.new(1, 0, 0, 15)
MLRemake.Toggle_3.Size = UDim2.new(0, 32, 0, 16)
MLRemake.Toggle_3.ZIndex = 2

MLRemake.UICorner_16.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_16.Parent = MLRemake.Toggle_3

MLRemake.Indicator_4.Name = "Indicator"
MLRemake.Indicator_4.Parent = MLRemake.Toggle_3
MLRemake.Indicator_4.AnchorPoint = Vector2.new(0, 0.5)
MLRemake.Indicator_4.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
MLRemake.Indicator_4.Position = UDim2.new(0, 0, 0.5, 0)
MLRemake.Indicator_4.Size = UDim2.new(0, 16, 0, 16)
MLRemake.Indicator_4.ZIndex = 2

MLRemake.UICorner_17.CornerRadius = UDim.new(0, 6)
MLRemake.UICorner_17.Parent = MLRemake.Indicator_4

MLRemake.Button_3.Name = "Button"
MLRemake.Button_3.Parent = MLRemake.Toggle_3
MLRemake.Button_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Button_3.BackgroundTransparency = 1.000
MLRemake.Button_3.BorderSizePixel = 0
MLRemake.Button_3.Size = UDim2.new(1, 0, 1, 0)
MLRemake.Button_3.ZIndex = 3
MLRemake.Button_3.AutoButtonColor = false
MLRemake.Button_3.Font = Enum.Font.SourceSans
MLRemake.Button_3.Text = ""
MLRemake.Button_3.TextColor3 = Color3.fromRGB(0, 0, 0)
MLRemake.Button_3.TextSize = 14.000

MLRemake.Input.Name = "Input"
MLRemake.Input.Parent = MLRemake.Slider
MLRemake.Input.AnchorPoint = Vector2.new(1, 0.5)
MLRemake.Input.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MLRemake.Input.Position = UDim2.new(1, -38, 0, 15)
MLRemake.Input.Size = UDim2.new(0, 70, 0, 16)
MLRemake.Input.ZIndex = 2
MLRemake.Input.ClearTextOnFocus = false
MLRemake.Input.Font = Enum.Font.Gotham
MLRemake.Input.PlaceholderText = "Value"
MLRemake.Input.Text = "0"
MLRemake.Input.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Input.TextSize = 12.000

MLRemake.UICorner_18.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_18.Parent = MLRemake.Input

MLRemake.Menu_6.Name = "Menu"
MLRemake.Menu_6.Parent = MLRemake.Slider
MLRemake.Menu_6.AnchorPoint = Vector2.new(1, 0)
MLRemake.Menu_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Menu_6.BackgroundTransparency = 1.000
MLRemake.Menu_6.BorderSizePixel = 0
MLRemake.Menu_6.Position = UDim2.new(1, 0, 0, 5)
MLRemake.Menu_6.Size = UDim2.new(0, 20, 0, 20)
MLRemake.Menu_6.Visible = false
MLRemake.Menu_6.ZIndex = 3
MLRemake.Menu_6.Image = "http://www.roblox.com/asset/?id=9147554930"

MLRemake.Value.Name = "Value"
MLRemake.Value.Parent = MLRemake.Slider
MLRemake.Value.AnchorPoint = Vector2.new(1, 0)
MLRemake.Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Value.BackgroundTransparency = 1.000
MLRemake.Value.BorderSizePixel = 0
MLRemake.Value.Position = UDim2.new(1, -115, 0, 0)
MLRemake.Value.Size = UDim2.new(0, 70, 0, 30)
MLRemake.Value.ZIndex = 2
MLRemake.Value.Font = Enum.Font.Gotham
MLRemake.Value.Text = "0"
MLRemake.Value.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Value.TextSize = 14.000
MLRemake.Value.TextXAlignment = Enum.TextXAlignment.Right

MLRemake.ColorPicker.Name = "ColorPicker"
MLRemake.ColorPicker.Parent = MLRemake.Example_2
MLRemake.ColorPicker.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MLRemake.ColorPicker.Size = UDim2.new(1, 0, 0, 30)
MLRemake.ColorPicker.ZIndex = 2

MLRemake.UIPadding_11.Parent = MLRemake.ColorPicker
MLRemake.UIPadding_11.PaddingLeft = UDim.new(0, 8)
MLRemake.UIPadding_11.PaddingRight = UDim.new(0, 10)

MLRemake.UICorner_19.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_19.Parent = MLRemake.ColorPicker

MLRemake.Label_4.Name = "Label"
MLRemake.Label_4.Parent = MLRemake.ColorPicker
MLRemake.Label_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Label_4.BackgroundTransparency = 1.000
MLRemake.Label_4.BorderSizePixel = 0
MLRemake.Label_4.Size = UDim2.new(1, 0, 0, 30)
MLRemake.Label_4.ZIndex = 2
MLRemake.Label_4.Font = Enum.Font.Gotham
MLRemake.Label_4.Text = "Color Picker"
MLRemake.Label_4.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Label_4.TextSize = 14.000
MLRemake.Label_4.TextXAlignment = Enum.TextXAlignment.Left

MLRemake.Color.Name = "Color"
MLRemake.Color.Parent = MLRemake.ColorPicker
MLRemake.Color.AnchorPoint = Vector2.new(1, 0)
MLRemake.Color.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Color.BackgroundTransparency = 1.000
MLRemake.Color.BorderSizePixel = 0
MLRemake.Color.Position = UDim2.new(1, -25, 0, 0)
MLRemake.Color.Size = UDim2.new(0.25, 0, 0, 30)
MLRemake.Color.ZIndex = 2
MLRemake.Color.Font = Enum.Font.Gotham
MLRemake.Color.Text = "255, 255, 255"
MLRemake.Color.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Color.TextSize = 14.000
MLRemake.Color.TextXAlignment = Enum.TextXAlignment.Right

MLRemake.Picker.Name = "Picker"
MLRemake.Picker.Parent = MLRemake.ColorPicker
MLRemake.Picker.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
MLRemake.Picker.BorderSizePixel = 0
MLRemake.Picker.ClipsDescendants = true
MLRemake.Picker.Position = UDim2.new(0, -8, 0, 30)
MLRemake.Picker.Size = UDim2.new(1, 18, 1, -30)
MLRemake.Picker.ZIndex = 3

MLRemake.UICorner_20.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_20.Parent = MLRemake.Picker

MLRemake.UIPadding_12.Parent = MLRemake.Picker
MLRemake.UIPadding_12.PaddingBottom = UDim.new(0, 5)
MLRemake.UIPadding_12.PaddingLeft = UDim.new(0, 5)
MLRemake.UIPadding_12.PaddingRight = UDim.new(0, 5)
MLRemake.UIPadding_12.PaddingTop = UDim.new(0, 5)

MLRemake.UIListLayout_4.Parent = MLRemake.Picker
MLRemake.UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
MLRemake.UIListLayout_4.Padding = UDim.new(0, 5)

MLRemake.Hue.Name = "Hue"
MLRemake.Hue.Parent = MLRemake.Picker
MLRemake.Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Hue.BackgroundTransparency = 1.000
MLRemake.Hue.Size = UDim2.new(1, 0, 0, 20)
MLRemake.Hue.ZIndex = 3

MLRemake.Bar_2.Name = "Bar"
MLRemake.Bar_2.Parent = MLRemake.Hue
MLRemake.Bar_2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
MLRemake.Bar_2.BorderSizePixel = 0
MLRemake.Bar_2.Position = UDim2.new(0, 35, 0, 0)
MLRemake.Bar_2.Size = UDim2.new(1, -70, 0, 20)
MLRemake.Bar_2.ZIndex = 3

MLRemake.UICorner_21.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_21.Parent = MLRemake.Bar_2

MLRemake.UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.16, Color3.fromRGB(255, 244, 0)), ColorSequenceKeypoint.new(0.28, Color3.fromRGB(81, 255, 0)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 10, 255)), ColorSequenceKeypoint.new(0.75, Color3.fromRGB(127, 0, 255)), ColorSequenceKeypoint.new(0.85, Color3.fromRGB(255, 0, 229)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 153)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))}
MLRemake.UIGradient.Parent = MLRemake.Bar_2

MLRemake.Slider_3.Name = "Slider"
MLRemake.Slider_3.Parent = MLRemake.Bar_2
MLRemake.Slider_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Slider_3.BackgroundTransparency = 1.000
MLRemake.Slider_3.BorderSizePixel = 0
MLRemake.Slider_3.Size = UDim2.new(1, 0, 1, 0)
MLRemake.Slider_3.ZIndex = 3
MLRemake.Slider_3.Font = Enum.Font.SourceSans
MLRemake.Slider_3.Text = ""
MLRemake.Slider_3.TextColor3 = Color3.fromRGB(0, 0, 0)
MLRemake.Slider_3.TextSize = 14.000

MLRemake.Indicator_5.Name = "Indicator"
MLRemake.Indicator_5.Parent = MLRemake.Bar_2
MLRemake.Indicator_5.AnchorPoint = Vector2.new(0, 0.5)
MLRemake.Indicator_5.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
MLRemake.Indicator_5.BorderSizePixel = 0
MLRemake.Indicator_5.Position = UDim2.new(0, 0, 0.5, 0)
MLRemake.Indicator_5.Size = UDim2.new(0, 6, 0, 20)
MLRemake.Indicator_5.ZIndex = 3

MLRemake.UICorner_22.CornerRadius = UDim.new(0, 3)
MLRemake.UICorner_22.Parent = MLRemake.Indicator_5

MLRemake.Label_5.Name = "Label"
MLRemake.Label_5.Parent = MLRemake.Hue
MLRemake.Label_5.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MLRemake.Label_5.Size = UDim2.new(0, 30, 0, 20)
MLRemake.Label_5.ZIndex = 3
MLRemake.Label_5.Font = Enum.Font.GothamBold
MLRemake.Label_5.Text = "H"
MLRemake.Label_5.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Label_5.TextSize = 14.000

MLRemake.UICorner_23.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_23.Parent = MLRemake.Label_5

MLRemake.UIPadding_13.Parent = MLRemake.Label_5
MLRemake.UIPadding_13.PaddingLeft = UDim.new(0, 1)

MLRemake.Value_2.Name = "Value"
MLRemake.Value_2.Parent = MLRemake.Hue
MLRemake.Value_2.AnchorPoint = Vector2.new(1, 0)
MLRemake.Value_2.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MLRemake.Value_2.Position = UDim2.new(1, 0, 0, 0)
MLRemake.Value_2.Size = UDim2.new(0, 30, 0, 20)
MLRemake.Value_2.ZIndex = 3
MLRemake.Value_2.Font = Enum.Font.GothamBold
MLRemake.Value_2.Text = "0"
MLRemake.Value_2.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Value_2.TextSize = 14.000

MLRemake.UICorner_24.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_24.Parent = MLRemake.Value_2

MLRemake.UIPadding_14.Parent = MLRemake.Value_2
MLRemake.UIPadding_14.PaddingLeft = UDim.new(0, 1)

MLRemake.Saturation.Name = "Saturation"
MLRemake.Saturation.Parent = MLRemake.Picker
MLRemake.Saturation.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Saturation.BackgroundTransparency = 1.000
MLRemake.Saturation.Size = UDim2.new(1, 0, 0, 20)
MLRemake.Saturation.ZIndex = 3

MLRemake.Bar_3.Name = "Bar"
MLRemake.Bar_3.Parent = MLRemake.Saturation
MLRemake.Bar_3.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
MLRemake.Bar_3.BorderSizePixel = 0
MLRemake.Bar_3.Position = UDim2.new(0, 35, 0, 0)
MLRemake.Bar_3.Size = UDim2.new(1, -70, 0, 20)
MLRemake.Bar_3.ZIndex = 3

MLRemake.UICorner_25.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_25.Parent = MLRemake.Bar_3

MLRemake.UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))}
MLRemake.UIGradient_2.Parent = MLRemake.Bar_3

MLRemake.Slider_4.Name = "Slider"
MLRemake.Slider_4.Parent = MLRemake.Bar_3
MLRemake.Slider_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Slider_4.BackgroundTransparency = 1.000
MLRemake.Slider_4.BorderSizePixel = 0
MLRemake.Slider_4.Size = UDim2.new(1, 0, 1, 0)
MLRemake.Slider_4.ZIndex = 3
MLRemake.Slider_4.Font = Enum.Font.SourceSans
MLRemake.Slider_4.Text = ""
MLRemake.Slider_4.TextColor3 = Color3.fromRGB(0, 0, 0)
MLRemake.Slider_4.TextSize = 14.000

MLRemake.Indicator_6.Name = "Indicator"
MLRemake.Indicator_6.Parent = MLRemake.Bar_3
MLRemake.Indicator_6.AnchorPoint = Vector2.new(0, 0.5)
MLRemake.Indicator_6.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
MLRemake.Indicator_6.BorderSizePixel = 0
MLRemake.Indicator_6.Position = UDim2.new(0, 0, 0.5, 0)
MLRemake.Indicator_6.Size = UDim2.new(0, 6, 0, 20)
MLRemake.Indicator_6.ZIndex = 3

MLRemake.UICorner_26.CornerRadius = UDim.new(0, 3)
MLRemake.UICorner_26.Parent = MLRemake.Indicator_6

MLRemake.Label_6.Name = "Label"
MLRemake.Label_6.Parent = MLRemake.Saturation
MLRemake.Label_6.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MLRemake.Label_6.Size = UDim2.new(0, 30, 0, 20)
MLRemake.Label_6.ZIndex = 3
MLRemake.Label_6.Font = Enum.Font.GothamBold
MLRemake.Label_6.Text = "S"
MLRemake.Label_6.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Label_6.TextSize = 14.000

MLRemake.UICorner_27.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_27.Parent = MLRemake.Label_6

MLRemake.UIPadding_15.Parent = MLRemake.Label_6
MLRemake.UIPadding_15.PaddingLeft = UDim.new(0, 1)

MLRemake.Value_3.Name = "Value"
MLRemake.Value_3.Parent = MLRemake.Saturation
MLRemake.Value_3.AnchorPoint = Vector2.new(1, 0)
MLRemake.Value_3.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MLRemake.Value_3.Position = UDim2.new(1, 0, 0, 0)
MLRemake.Value_3.Size = UDim2.new(0, 30, 0, 20)
MLRemake.Value_3.ZIndex = 3
MLRemake.Value_3.Font = Enum.Font.GothamBold
MLRemake.Value_3.Text = "0"
MLRemake.Value_3.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Value_3.TextSize = 14.000

MLRemake.UICorner_28.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_28.Parent = MLRemake.Value_3

MLRemake.UIPadding_16.Parent = MLRemake.Value_3
MLRemake.UIPadding_16.PaddingLeft = UDim.new(0, 1)

MLRemake.Value_4.Name = "Value"
MLRemake.Value_4.Parent = MLRemake.Picker
MLRemake.Value_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Value_4.BackgroundTransparency = 1.000
MLRemake.Value_4.Size = UDim2.new(1, 0, 0, 20)
MLRemake.Value_4.ZIndex = 3

MLRemake.Bar_4.Name = "Bar"
MLRemake.Bar_4.Parent = MLRemake.Value_4
MLRemake.Bar_4.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
MLRemake.Bar_4.BorderSizePixel = 0
MLRemake.Bar_4.Position = UDim2.new(0, 35, 0, 0)
MLRemake.Bar_4.Size = UDim2.new(1, -70, 0, 20)
MLRemake.Bar_4.ZIndex = 3

MLRemake.UICorner_29.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_29.Parent = MLRemake.Bar_4

MLRemake.UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
MLRemake.UIGradient_3.Parent = MLRemake.Bar_4

MLRemake.Slider_5.Name = "Slider"
MLRemake.Slider_5.Parent = MLRemake.Bar_4
MLRemake.Slider_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Slider_5.BackgroundTransparency = 1.000
MLRemake.Slider_5.BorderSizePixel = 0
MLRemake.Slider_5.Size = UDim2.new(1, 0, 1, 0)
MLRemake.Slider_5.ZIndex = 3
MLRemake.Slider_5.Font = Enum.Font.SourceSans
MLRemake.Slider_5.Text = ""
MLRemake.Slider_5.TextColor3 = Color3.fromRGB(0, 0, 0)
MLRemake.Slider_5.TextSize = 14.000

MLRemake.Indicator_7.Name = "Indicator"
MLRemake.Indicator_7.Parent = MLRemake.Bar_4
MLRemake.Indicator_7.AnchorPoint = Vector2.new(1, 0.5)
MLRemake.Indicator_7.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
MLRemake.Indicator_7.BorderSizePixel = 0
MLRemake.Indicator_7.Position = UDim2.new(1, 0, 0.5, 0)
MLRemake.Indicator_7.Size = UDim2.new(0, 6, 0, 20)
MLRemake.Indicator_7.ZIndex = 3

MLRemake.UICorner_30.CornerRadius = UDim.new(0, 3)
MLRemake.UICorner_30.Parent = MLRemake.Indicator_7

MLRemake.Label_7.Name = "Label"
MLRemake.Label_7.Parent = MLRemake.Value_4
MLRemake.Label_7.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MLRemake.Label_7.Size = UDim2.new(0, 30, 0, 20)
MLRemake.Label_7.ZIndex = 3
MLRemake.Label_7.Font = Enum.Font.GothamBold
MLRemake.Label_7.Text = "V"
MLRemake.Label_7.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Label_7.TextSize = 14.000

MLRemake.UICorner_31.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_31.Parent = MLRemake.Label_7

MLRemake.UIPadding_17.Parent = MLRemake.Label_7
MLRemake.UIPadding_17.PaddingLeft = UDim.new(0, 1)

MLRemake.Value_5.Name = "Value"
MLRemake.Value_5.Parent = MLRemake.Value_4
MLRemake.Value_5.AnchorPoint = Vector2.new(1, 0)
MLRemake.Value_5.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MLRemake.Value_5.Position = UDim2.new(1, 0, 0, 0)
MLRemake.Value_5.Size = UDim2.new(0, 30, 0, 20)
MLRemake.Value_5.ZIndex = 3
MLRemake.Value_5.Font = Enum.Font.GothamBold
MLRemake.Value_5.Text = "1"
MLRemake.Value_5.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Value_5.TextSize = 14.000

MLRemake.UICorner_32.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_32.Parent = MLRemake.Value_5

MLRemake.UIPadding_18.Parent = MLRemake.Value_5
MLRemake.UIPadding_18.PaddingLeft = UDim.new(0, 1)

MLRemake.Custom.Name = "Custom"
MLRemake.Custom.Parent = MLRemake.Picker
MLRemake.Custom.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Custom.BackgroundTransparency = 1.000
MLRemake.Custom.Size = UDim2.new(1, 0, 0, 20)
MLRemake.Custom.ZIndex = 3

MLRemake.HEX.Name = "HEX"
MLRemake.HEX.Parent = MLRemake.Custom
MLRemake.HEX.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MLRemake.HEX.Size = UDim2.new(0.333000004, -3, 1, 0)
MLRemake.HEX.ZIndex = 3
MLRemake.HEX.ClearTextOnFocus = false
MLRemake.HEX.Font = Enum.Font.Gotham
MLRemake.HEX.PlaceholderText = "HEX"
MLRemake.HEX.Text = ""
MLRemake.HEX.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.HEX.TextSize = 12.000

MLRemake.UICorner_33.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_33.Parent = MLRemake.HEX

MLRemake.RGB.Name = "RGB"
MLRemake.RGB.Parent = MLRemake.Custom
MLRemake.RGB.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MLRemake.RGB.Position = UDim2.new(0.333000004, 3, 0, 0)
MLRemake.RGB.Size = UDim2.new(0.333000004, -6, 1, 0)
MLRemake.RGB.ZIndex = 3
MLRemake.RGB.ClearTextOnFocus = false
MLRemake.RGB.Font = Enum.Font.Gotham
MLRemake.RGB.PlaceholderText = "RGB"
MLRemake.RGB.Text = ""
MLRemake.RGB.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.RGB.TextSize = 12.000

MLRemake.UICorner_34.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_34.Parent = MLRemake.RGB

MLRemake.Rainbow.Name = "Rainbow"
MLRemake.Rainbow.Parent = MLRemake.Custom
MLRemake.Rainbow.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MLRemake.Rainbow.Position = UDim2.new(0.666999996, 3, 0, 0)
MLRemake.Rainbow.Size = UDim2.new(0.333000004, -3, 0, 20)
MLRemake.Rainbow.ZIndex = 3
MLRemake.Rainbow.AutoButtonColor = false
MLRemake.Rainbow.Font = Enum.Font.Gotham
MLRemake.Rainbow.Text = ""
MLRemake.Rainbow.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Rainbow.TextSize = 12.000

MLRemake.UICorner_35.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_35.Parent = MLRemake.Rainbow

MLRemake.RainbowText.Name = "RainbowText"
MLRemake.RainbowText.Parent = MLRemake.Rainbow
MLRemake.RainbowText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.RainbowText.BackgroundTransparency = 1.000
MLRemake.RainbowText.BorderSizePixel = 0
MLRemake.RainbowText.Size = UDim2.new(1, 0, 1, 0)
MLRemake.RainbowText.ZIndex = 3
MLRemake.RainbowText.Font = Enum.Font.Gotham
MLRemake.RainbowText.Text = "Rainbow"
MLRemake.RainbowText.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.RainbowText.TextSize = 12.000
MLRemake.RainbowText.TextStrokeTransparency = 0.000

MLRemake.UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.16, Color3.fromRGB(255, 244, 0)), ColorSequenceKeypoint.new(0.28, Color3.fromRGB(81, 255, 0)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 10, 255)), ColorSequenceKeypoint.new(0.75, Color3.fromRGB(127, 0, 255)), ColorSequenceKeypoint.new(0.85, Color3.fromRGB(255, 0, 229)), ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 153)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))}
MLRemake.UIGradient_4.Offset = Vector2.new(-0.00999999978, 0.5)
MLRemake.UIGradient_4.Rotation = 30
MLRemake.UIGradient_4.Parent = MLRemake.RainbowText

MLRemake.Button_4.Name = "Button"
MLRemake.Button_4.Parent = MLRemake.ColorPicker
MLRemake.Button_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Button_4.BackgroundTransparency = 1.000
MLRemake.Button_4.BorderSizePixel = 0
MLRemake.Button_4.Size = UDim2.new(1, 0, 0, 30)
MLRemake.Button_4.ZIndex = 3
MLRemake.Button_4.AutoButtonColor = false
MLRemake.Button_4.Font = Enum.Font.SourceSans
MLRemake.Button_4.Text = ""
MLRemake.Button_4.TextColor3 = Color3.fromRGB(0, 0, 0)
MLRemake.Button_4.TextSize = 14.000

MLRemake.Fill_3.Name = "Fill"
MLRemake.Fill_3.Parent = MLRemake.ColorPicker
MLRemake.Fill_3.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
MLRemake.Fill_3.BorderSizePixel = 0
MLRemake.Fill_3.Position = UDim2.new(0, -8, 0, 30)
MLRemake.Fill_3.Size = UDim2.new(1, 18, 0, 5)
MLRemake.Fill_3.Visible = false
MLRemake.Fill_3.ZIndex = 2

MLRemake.Preview.Name = "Preview"
MLRemake.Preview.Parent = MLRemake.ColorPicker
MLRemake.Preview.AnchorPoint = Vector2.new(1, 0)
MLRemake.Preview.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Preview.Position = UDim2.new(1, 0, 0, 5)
MLRemake.Preview.Size = UDim2.new(0, 20, 0, 20)
MLRemake.Preview.ZIndex = 2

MLRemake.UICorner_36.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_36.Parent = MLRemake.Preview

MLRemake.RippleHolder_2.Name = "RippleHolder"
MLRemake.RippleHolder_2.Parent = MLRemake.ColorPicker
MLRemake.RippleHolder_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.RippleHolder_2.BackgroundTransparency = 1.000
MLRemake.RippleHolder_2.BorderSizePixel = 0
MLRemake.RippleHolder_2.Position = UDim2.new(0, -8, 0, 0)
MLRemake.RippleHolder_2.Size = UDim2.new(1, 18, 0, 30)
MLRemake.RippleHolder_2.ZIndex = 2

MLRemake.Menu_7.Name = "Menu"
MLRemake.Menu_7.Parent = MLRemake.ColorPicker
MLRemake.Menu_7.AnchorPoint = Vector2.new(1, 0)
MLRemake.Menu_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Menu_7.BackgroundTransparency = 1.000
MLRemake.Menu_7.BorderSizePixel = 0
MLRemake.Menu_7.Position = UDim2.new(1, 0, 0, 5)
MLRemake.Menu_7.Size = UDim2.new(0, 20, 0, 20)
MLRemake.Menu_7.Visible = false
MLRemake.Menu_7.ZIndex = 3
MLRemake.Menu_7.Image = "http://www.roblox.com/asset/?id=9147554930"

MLRemake.Keybind.Name = "Keybind"
MLRemake.Keybind.Parent = MLRemake.Example_2
MLRemake.Keybind.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MLRemake.Keybind.BorderSizePixel = 0
MLRemake.Keybind.Size = UDim2.new(1, 0, 0, 30)
MLRemake.Keybind.ZIndex = 2
MLRemake.Keybind.AutoButtonColor = false
MLRemake.Keybind.Font = Enum.Font.Gotham
MLRemake.Keybind.Text = "Keybind"
MLRemake.Keybind.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Keybind.TextSize = 14.000
MLRemake.Keybind.TextXAlignment = Enum.TextXAlignment.Left

MLRemake.UICorner_37.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_37.Parent = MLRemake.Keybind

MLRemake.UIPadding_19.Parent = MLRemake.Keybind
MLRemake.UIPadding_19.PaddingLeft = UDim.new(0, 8)
MLRemake.UIPadding_19.PaddingRight = UDim.new(0, 10)

MLRemake.Bind_old.Name = "Bind_old"
MLRemake.Bind_old.Parent = MLRemake.Keybind
MLRemake.Bind_old.AnchorPoint = Vector2.new(1, 0)
MLRemake.Bind_old.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Bind_old.BackgroundTransparency = 1.000
MLRemake.Bind_old.BorderSizePixel = 0
MLRemake.Bind_old.Position = UDim2.new(1, 0, 0, 0)
MLRemake.Bind_old.Size = UDim2.new(0.349999994, 0, 1, 0)
MLRemake.Bind_old.Visible = false
MLRemake.Bind_old.ZIndex = 2
MLRemake.Bind_old.Font = Enum.Font.Gotham
MLRemake.Bind_old.Text = "Unknown"
MLRemake.Bind_old.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Bind_old.TextSize = 14.000
MLRemake.Bind_old.TextXAlignment = Enum.TextXAlignment.Right

MLRemake.Menu_8.Name = "Menu"
MLRemake.Menu_8.Parent = MLRemake.Keybind
MLRemake.Menu_8.AnchorPoint = Vector2.new(1, 0)
MLRemake.Menu_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Menu_8.BackgroundTransparency = 1.000
MLRemake.Menu_8.BorderSizePixel = 0
MLRemake.Menu_8.Position = UDim2.new(1, 0, 0, 5)
MLRemake.Menu_8.Size = UDim2.new(0, 20, 0, 20)
MLRemake.Menu_8.Visible = false
MLRemake.Menu_8.ZIndex = 3
MLRemake.Menu_8.Image = "http://www.roblox.com/asset/?id=9147554930"

MLRemake.Bind.Name = "Bind"
MLRemake.Bind.Parent = MLRemake.Keybind
MLRemake.Bind.AnchorPoint = Vector2.new(1, 0.5)
MLRemake.Bind.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
MLRemake.Bind.BorderSizePixel = 0
MLRemake.Bind.Position = UDim2.new(1, 0, 0, 15)
MLRemake.Bind.Size = UDim2.new(0, 80, 0, 20)
MLRemake.Bind.ZIndex = 2

MLRemake.UICorner_38.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_38.Parent = MLRemake.Bind

MLRemake.Label_8.Name = "Label"
MLRemake.Label_8.Parent = MLRemake.Bind
MLRemake.Label_8.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
MLRemake.Label_8.Position = UDim2.new(0, 2, 0, 2)
MLRemake.Label_8.Size = UDim2.new(1, -4, 0, 16)
MLRemake.Label_8.ZIndex = 2
MLRemake.Label_8.Font = Enum.Font.GothamBold
MLRemake.Label_8.Text = "Unknown"
MLRemake.Label_8.TextColor3 = Color3.fromRGB(0, 0, 0)
MLRemake.Label_8.TextSize = 12.000

MLRemake.UICorner_39.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_39.Parent = MLRemake.Label_8

MLRemake.ChipSet.Name = "ChipSet"
MLRemake.ChipSet.Parent = MLRemake.Example_2
MLRemake.ChipSet.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MLRemake.ChipSet.Size = UDim2.new(1, 0, 0, 30)
MLRemake.ChipSet.ZIndex = 2

MLRemake.UIPadding_20.Parent = MLRemake.ChipSet
MLRemake.UIPadding_20.PaddingLeft = UDim.new(0, 8)
MLRemake.UIPadding_20.PaddingRight = UDim.new(0, 10)

MLRemake.UICorner_40.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_40.Parent = MLRemake.ChipSet

MLRemake.Label_9.Name = "Label"
MLRemake.Label_9.Parent = MLRemake.ChipSet
MLRemake.Label_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Label_9.BackgroundTransparency = 1.000
MLRemake.Label_9.BorderSizePixel = 0
MLRemake.Label_9.Size = UDim2.new(1, 0, 0, 30)
MLRemake.Label_9.ZIndex = 2
MLRemake.Label_9.Font = Enum.Font.Gotham
MLRemake.Label_9.Text = "Chip Set"
MLRemake.Label_9.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Label_9.TextSize = 14.000
MLRemake.Label_9.TextXAlignment = Enum.TextXAlignment.Left

MLRemake.Dropdown_3.Name = "Dropdown"
MLRemake.Dropdown_3.Parent = MLRemake.ChipSet
MLRemake.Dropdown_3.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
MLRemake.Dropdown_3.BorderSizePixel = 0
MLRemake.Dropdown_3.ClipsDescendants = true
MLRemake.Dropdown_3.Position = UDim2.new(0, -8, 0, 30)
MLRemake.Dropdown_3.Size = UDim2.new(1, 18, 1, -30)
MLRemake.Dropdown_3.ZIndex = 3

MLRemake.UICorner_41.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_41.Parent = MLRemake.Dropdown_3

MLRemake.UIPadding_21.Parent = MLRemake.Dropdown_3
MLRemake.UIPadding_21.PaddingBottom = UDim.new(0, 5)
MLRemake.UIPadding_21.PaddingLeft = UDim.new(0, 5)
MLRemake.UIPadding_21.PaddingRight = UDim.new(0, 5)
MLRemake.UIPadding_21.PaddingTop = UDim.new(0, 5)

MLRemake.UIListLayout_5.Parent = MLRemake.Dropdown_3
MLRemake.UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
MLRemake.UIListLayout_5.Padding = UDim.new(0, 5)

MLRemake.Option_3.Name = "Option"
MLRemake.Option_3.Parent = MLRemake.Dropdown_3
MLRemake.Option_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Option_3.BackgroundTransparency = 1.000
MLRemake.Option_3.BorderSizePixel = 0
MLRemake.Option_3.Size = UDim2.new(1, 0, 0, 30)
MLRemake.Option_3.Visible = false

MLRemake.Button_5.Name = "Button"
MLRemake.Button_5.Parent = MLRemake.Option_3
MLRemake.Button_5.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MLRemake.Button_5.BorderSizePixel = 0
MLRemake.Button_5.Position = UDim2.new(0, 35, 0, 0)
MLRemake.Button_5.Size = UDim2.new(1, -35, 1, 0)
MLRemake.Button_5.ZIndex = 3
MLRemake.Button_5.AutoButtonColor = false
MLRemake.Button_5.Font = Enum.Font.Gotham
MLRemake.Button_5.Text = "Option"
MLRemake.Button_5.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Button_5.TextSize = 14.000
MLRemake.Button_5.TextXAlignment = Enum.TextXAlignment.Left

MLRemake.UICorner_42.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_42.Parent = MLRemake.Button_5

MLRemake.UIPadding_22.Parent = MLRemake.Button_5
MLRemake.UIPadding_22.PaddingLeft = UDim.new(0, 8)

MLRemake.Enabled.Name = "Enabled"
MLRemake.Enabled.Parent = MLRemake.Option_3
MLRemake.Enabled.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MLRemake.Enabled.Size = UDim2.new(0, 30, 0, 30)
MLRemake.Enabled.ZIndex = 3
MLRemake.Enabled.AutoButtonColor = false
MLRemake.Enabled.Image = "rbxassetid://9122106066"

MLRemake.UICorner_43.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_43.Parent = MLRemake.Enabled

MLRemake.Menu_9.Name = "Menu"
MLRemake.Menu_9.Parent = MLRemake.Option_3
MLRemake.Menu_9.AnchorPoint = Vector2.new(1, 0)
MLRemake.Menu_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Menu_9.BackgroundTransparency = 1.000
MLRemake.Menu_9.BorderSizePixel = 0
MLRemake.Menu_9.Position = UDim2.new(1, -5, 0, 5)
MLRemake.Menu_9.Size = UDim2.new(0, 20, 0, 20)
MLRemake.Menu_9.Visible = false
MLRemake.Menu_9.ZIndex = 3
MLRemake.Menu_9.Image = "http://www.roblox.com/asset/?id=9147554930"

MLRemake.Button_6.Name = "Button"
MLRemake.Button_6.Parent = MLRemake.ChipSet
MLRemake.Button_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Button_6.BackgroundTransparency = 1.000
MLRemake.Button_6.BorderSizePixel = 0
MLRemake.Button_6.Size = UDim2.new(1, 0, 0, 30)
MLRemake.Button_6.ZIndex = 3
MLRemake.Button_6.AutoButtonColor = false
MLRemake.Button_6.Font = Enum.Font.SourceSans
MLRemake.Button_6.Text = ""
MLRemake.Button_6.TextColor3 = Color3.fromRGB(0, 0, 0)
MLRemake.Button_6.TextSize = 14.000

MLRemake.Fill_4.Name = "Fill"
MLRemake.Fill_4.Parent = MLRemake.ChipSet
MLRemake.Fill_4.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
MLRemake.Fill_4.BorderSizePixel = 0
MLRemake.Fill_4.Position = UDim2.new(0, -8, 0, 30)
MLRemake.Fill_4.Size = UDim2.new(1, 18, 0, 5)
MLRemake.Fill_4.Visible = false
MLRemake.Fill_4.ZIndex = 2

MLRemake.RippleHolder_3.Name = "RippleHolder"
MLRemake.RippleHolder_3.Parent = MLRemake.ChipSet
MLRemake.RippleHolder_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.RippleHolder_3.BackgroundTransparency = 1.000
MLRemake.RippleHolder_3.BorderSizePixel = 0
MLRemake.RippleHolder_3.Position = UDim2.new(0, -8, 0, 0)
MLRemake.RippleHolder_3.Size = UDim2.new(0, 380, 0, 30)
MLRemake.RippleHolder_3.ZIndex = 2

MLRemake.Indicator_8.Name = "Indicator"
MLRemake.Indicator_8.Parent = MLRemake.ChipSet
MLRemake.Indicator_8.AnchorPoint = Vector2.new(1, 0)
MLRemake.Indicator_8.BackgroundColor3 = Color3.fromRGB(250, 170, 75)
MLRemake.Indicator_8.Position = UDim2.new(1, 0, 0, 5)
MLRemake.Indicator_8.Size = UDim2.new(0, 20, 0, 20)
MLRemake.Indicator_8.ZIndex = 2

MLRemake.UICorner_44.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_44.Parent = MLRemake.Indicator_8

MLRemake.Menu_10.Name = "Menu"
MLRemake.Menu_10.Parent = MLRemake.ChipSet
MLRemake.Menu_10.AnchorPoint = Vector2.new(1, 0)
MLRemake.Menu_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Menu_10.BackgroundTransparency = 1.000
MLRemake.Menu_10.BorderSizePixel = 0
MLRemake.Menu_10.Position = UDim2.new(1, 0, 0, 5)
MLRemake.Menu_10.Size = UDim2.new(0, 20, 0, 20)
MLRemake.Menu_10.Visible = false
MLRemake.Menu_10.ZIndex = 3
MLRemake.Menu_10.Image = "http://www.roblox.com/asset/?id=9147554930"

MLRemake.Table.Name = "Table"
MLRemake.Table.Parent = MLRemake.Example_2
MLRemake.Table.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MLRemake.Table.Size = UDim2.new(1, 0, 0, 30)
MLRemake.Table.ZIndex = 2

MLRemake.UIPadding_23.Parent = MLRemake.Table
MLRemake.UIPadding_23.PaddingLeft = UDim.new(0, 8)
MLRemake.UIPadding_23.PaddingRight = UDim.new(0, 10)

MLRemake.UICorner_45.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_45.Parent = MLRemake.Table

MLRemake.Label_10.Name = "Label"
MLRemake.Label_10.Parent = MLRemake.Table
MLRemake.Label_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Label_10.BackgroundTransparency = 1.000
MLRemake.Label_10.BorderSizePixel = 0
MLRemake.Label_10.Size = UDim2.new(1, 0, 0, 30)
MLRemake.Label_10.ZIndex = 2
MLRemake.Label_10.Font = Enum.Font.Gotham
MLRemake.Label_10.Text = "Table"
MLRemake.Label_10.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Label_10.TextSize = 14.000
MLRemake.Label_10.TextXAlignment = Enum.TextXAlignment.Left

MLRemake.Dropdown_4.Name = "Dropdown"
MLRemake.Dropdown_4.Parent = MLRemake.Table
MLRemake.Dropdown_4.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
MLRemake.Dropdown_4.BorderSizePixel = 0
MLRemake.Dropdown_4.ClipsDescendants = true
MLRemake.Dropdown_4.Position = UDim2.new(0, -8, 0, 30)
MLRemake.Dropdown_4.Size = UDim2.new(1, 18, 1, -30)
MLRemake.Dropdown_4.ZIndex = 3

MLRemake.UICorner_46.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_46.Parent = MLRemake.Dropdown_4

MLRemake.UIPadding_24.Parent = MLRemake.Dropdown_4
MLRemake.UIPadding_24.PaddingBottom = UDim.new(0, 5)
MLRemake.UIPadding_24.PaddingLeft = UDim.new(0, 5)
MLRemake.UIPadding_24.PaddingRight = UDim.new(0, 5)
MLRemake.UIPadding_24.PaddingTop = UDim.new(0, 5)

MLRemake.UIListLayout_6.Parent = MLRemake.Dropdown_4
MLRemake.UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder
MLRemake.UIListLayout_6.Padding = UDim.new(0, 5)

MLRemake.Info.Name = "Info"
MLRemake.Info.Parent = MLRemake.Dropdown_4
MLRemake.Info.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MLRemake.Info.BorderSizePixel = 0
MLRemake.Info.Size = UDim2.new(1, 0, 0, 30)
MLRemake.Info.ZIndex = 3

MLRemake.UIPadding_25.Parent = MLRemake.Info
MLRemake.UIPadding_25.PaddingLeft = UDim.new(0, 8)

MLRemake.UICorner_47.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_47.Parent = MLRemake.Info

MLRemake.Key.Name = "Key"
MLRemake.Key.Parent = MLRemake.Info
MLRemake.Key.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Key.BackgroundTransparency = 1.000
MLRemake.Key.BorderSizePixel = 0
MLRemake.Key.Size = UDim2.new(0.5, 0, 0, 30)
MLRemake.Key.ZIndex = 3
MLRemake.Key.Font = Enum.Font.Gotham
MLRemake.Key.Text = "Key"
MLRemake.Key.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Key.TextSize = 14.000
MLRemake.Key.TextXAlignment = Enum.TextXAlignment.Left

MLRemake.Value_6.Name = "Value"
MLRemake.Value_6.Parent = MLRemake.Info
MLRemake.Value_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Value_6.BackgroundTransparency = 1.000
MLRemake.Value_6.BorderSizePixel = 0
MLRemake.Value_6.Position = UDim2.new(0.5, 0, 0, 0)
MLRemake.Value_6.Size = UDim2.new(0.5, 0, 0, 30)
MLRemake.Value_6.ZIndex = 3
MLRemake.Value_6.Font = Enum.Font.Gotham
MLRemake.Value_6.Text = "Value"
MLRemake.Value_6.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Value_6.TextSize = 14.000
MLRemake.Value_6.TextXAlignment = Enum.TextXAlignment.Left

MLRemake.UIPadding_26.Parent = MLRemake.Value_6
MLRemake.UIPadding_26.PaddingLeft = UDim.new(0, 8)

MLRemake.Line_3.Name = "Line"
MLRemake.Line_3.Parent = MLRemake.Info
MLRemake.Line_3.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
MLRemake.Line_3.BorderSizePixel = 0
MLRemake.Line_3.Position = UDim2.new(0.5, 0, 0, 5)
MLRemake.Line_3.Size = UDim2.new(0, 1, 0, 20)
MLRemake.Line_3.ZIndex = 3

MLRemake.Button_7.Name = "Button"
MLRemake.Button_7.Parent = MLRemake.Table
MLRemake.Button_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Button_7.BackgroundTransparency = 1.000
MLRemake.Button_7.BorderSizePixel = 0
MLRemake.Button_7.Size = UDim2.new(1, 0, 0, 30)
MLRemake.Button_7.ZIndex = 3
MLRemake.Button_7.AutoButtonColor = false
MLRemake.Button_7.Font = Enum.Font.SourceSans
MLRemake.Button_7.Text = ""
MLRemake.Button_7.TextColor3 = Color3.fromRGB(0, 0, 0)
MLRemake.Button_7.TextSize = 14.000

MLRemake.Fill_5.Name = "Fill"
MLRemake.Fill_5.Parent = MLRemake.Table
MLRemake.Fill_5.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
MLRemake.Fill_5.BorderSizePixel = 0
MLRemake.Fill_5.Position = UDim2.new(0, -8, 0, 30)
MLRemake.Fill_5.Size = UDim2.new(1, 18, 0, 5)
MLRemake.Fill_5.Visible = false
MLRemake.Fill_5.ZIndex = 2

MLRemake.RippleHolder_4.Name = "RippleHolder"
MLRemake.RippleHolder_4.Parent = MLRemake.Table
MLRemake.RippleHolder_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.RippleHolder_4.BackgroundTransparency = 1.000
MLRemake.RippleHolder_4.BorderSizePixel = 0
MLRemake.RippleHolder_4.Position = UDim2.new(0, -8, 0, 0)
MLRemake.RippleHolder_4.Size = UDim2.new(0, 380, 0, 30)
MLRemake.RippleHolder_4.ZIndex = 2

MLRemake.Indicator_9.Name = "Indicator"
MLRemake.Indicator_9.Parent = MLRemake.Table
MLRemake.Indicator_9.AnchorPoint = Vector2.new(1, 0)
MLRemake.Indicator_9.BackgroundColor3 = Color3.fromRGB(250, 170, 75)
MLRemake.Indicator_9.Position = UDim2.new(1, 0, 0, 5)
MLRemake.Indicator_9.Size = UDim2.new(0, 20, 0, 20)
MLRemake.Indicator_9.ZIndex = 2

MLRemake.UICorner_48.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_48.Parent = MLRemake.Indicator_9

MLRemake.Menu_11.Name = "Menu"
MLRemake.Menu_11.Parent = MLRemake.Table
MLRemake.Menu_11.AnchorPoint = Vector2.new(1, 0)
MLRemake.Menu_11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Menu_11.BackgroundTransparency = 1.000
MLRemake.Menu_11.BorderSizePixel = 0
MLRemake.Menu_11.Position = UDim2.new(1, 0, 0, 5)
MLRemake.Menu_11.Size = UDim2.new(0, 20, 0, 20)
MLRemake.Menu_11.Visible = false
MLRemake.Menu_11.ZIndex = 3
MLRemake.Menu_11.Image = "http://www.roblox.com/asset/?id=9147554930"

MLRemake.BackgroundDim.Name = "BackgroundDim"
MLRemake.BackgroundDim.Parent = MLRemake.Main
MLRemake.BackgroundDim.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MLRemake.BackgroundDim.BackgroundTransparency = 1.000
MLRemake.BackgroundDim.BorderSizePixel = 0
MLRemake.BackgroundDim.Size = UDim2.new(1, 0, 1, 0)
MLRemake.BackgroundDim.ZIndex = 7

MLRemake.Banner.Name = "Banner"
MLRemake.Banner.Parent = MLRemake.Main
MLRemake.Banner.AnchorPoint = Vector2.new(0.5, 1)
MLRemake.Banner.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MLRemake.Banner.Position = UDim2.new(0.5, 0, 1, -10)
MLRemake.Banner.Size = UDim2.new(1, -20, 0, 100)
MLRemake.Banner.Visible = false
MLRemake.Banner.ZIndex = 6

MLRemake.UICorner_49.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_49.Parent = MLRemake.Banner

MLRemake.Label_11.Name = "Label"
MLRemake.Label_11.Parent = MLRemake.Banner
MLRemake.Label_11.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MLRemake.Label_11.BorderSizePixel = 0
MLRemake.Label_11.Size = UDim2.new(1, 0, 1, 0)
MLRemake.Label_11.ZIndex = 6
MLRemake.Label_11.Font = Enum.Font.Gotham
MLRemake.Label_11.Text = "Banner"
MLRemake.Label_11.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Label_11.TextSize = 12.000
MLRemake.Label_11.TextWrapped = true
MLRemake.Label_11.TextXAlignment = Enum.TextXAlignment.Left
MLRemake.Label_11.TextYAlignment = Enum.TextYAlignment.Top

MLRemake.UIPadding_27.Parent = MLRemake.Label_11
MLRemake.UIPadding_27.PaddingBottom = UDim.new(0, 5)
MLRemake.UIPadding_27.PaddingLeft = UDim.new(0, 6)
MLRemake.UIPadding_27.PaddingRight = UDim.new(0, 5)
MLRemake.UIPadding_27.PaddingTop = UDim.new(0, 5)

MLRemake.UICorner_50.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_50.Parent = MLRemake.Label_11

MLRemake.UIPadding_28.Parent = MLRemake.Banner
MLRemake.UIPadding_28.PaddingBottom = UDim.new(0, 30)
MLRemake.UIPadding_28.PaddingLeft = UDim.new(0, 5)
MLRemake.UIPadding_28.PaddingRight = UDim.new(0, 5)
MLRemake.UIPadding_28.PaddingTop = UDim.new(0, 5)

MLRemake.Buttons_2.Name = "Buttons"
MLRemake.Buttons_2.Parent = MLRemake.Banner
MLRemake.Buttons_2.Active = true
MLRemake.Buttons_2.AnchorPoint = Vector2.new(0, 1)
MLRemake.Buttons_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Buttons_2.BackgroundTransparency = 1.000
MLRemake.Buttons_2.Position = UDim2.new(0, 0, 1, 25)
MLRemake.Buttons_2.Size = UDim2.new(1, 0, 0, 20)
MLRemake.Buttons_2.ZIndex = 6
MLRemake.Buttons_2.CanvasSize = UDim2.new(0, 0, 0, 0)
MLRemake.Buttons_2.ScrollBarThickness = 0

MLRemake.Example_3.Name = "Example"
MLRemake.Example_3.Parent = MLRemake.Buttons_2
MLRemake.Example_3.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MLRemake.Example_3.BorderSizePixel = 0
MLRemake.Example_3.Size = UDim2.new(0, 40, 0, 20)
MLRemake.Example_3.Visible = false
MLRemake.Example_3.ZIndex = 6
MLRemake.Example_3.AutoButtonColor = false
MLRemake.Example_3.Font = Enum.Font.GothamBold
MLRemake.Example_3.Text = "OK"
MLRemake.Example_3.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Example_3.TextSize = 14.000

MLRemake.UICorner_51.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_51.Parent = MLRemake.Example_3

MLRemake.UIListLayout_7.Parent = MLRemake.Buttons_2
MLRemake.UIListLayout_7.FillDirection = Enum.FillDirection.Horizontal
MLRemake.UIListLayout_7.HorizontalAlignment = Enum.HorizontalAlignment.Right
MLRemake.UIListLayout_7.SortOrder = Enum.SortOrder.LayoutOrder
MLRemake.UIListLayout_7.Padding = UDim.new(0, 5)

MLRemake.BackgroundDim2.Name = "BackgroundDim2"
MLRemake.BackgroundDim2.Parent = MLRemake.Main
MLRemake.BackgroundDim2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MLRemake.BackgroundDim2.BackgroundTransparency = 1.000
MLRemake.BackgroundDim2.BorderSizePixel = 0
MLRemake.BackgroundDim2.Size = UDim2.new(1, 0, 1, 0)
MLRemake.BackgroundDim2.ZIndex = 3

MLRemake.Tabs.Name = "Tabs"
MLRemake.Tabs.Parent = MLRemake.Main
MLRemake.Tabs.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
MLRemake.Tabs.BackgroundTransparency = 1.000
MLRemake.Tabs.Position = UDim2.new(0, 10, 0, 10)
MLRemake.Tabs.Size = UDim2.new(1, -20, 0, 25)
MLRemake.Tabs.Visible = false

MLRemake.UICorner_52.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_52.Parent = MLRemake.Tabs

MLRemake.Buttons_3.Name = "Buttons"
MLRemake.Buttons_3.Parent = MLRemake.Tabs
MLRemake.Buttons_3.Active = true
MLRemake.Buttons_3.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
MLRemake.Buttons_3.BackgroundTransparency = 1.000
MLRemake.Buttons_3.BorderSizePixel = 0
MLRemake.Buttons_3.Size = UDim2.new(1, 0, 1, 0)
MLRemake.Buttons_3.ZIndex = 2
MLRemake.Buttons_3.ScrollBarThickness = 0

MLRemake.UIListLayout_8.Parent = MLRemake.Buttons_3
MLRemake.UIListLayout_8.FillDirection = Enum.FillDirection.Horizontal
MLRemake.UIListLayout_8.SortOrder = Enum.SortOrder.LayoutOrder
MLRemake.UIListLayout_8.Padding = UDim.new(0, 5)

MLRemake.Example_4.Name = "Example"
MLRemake.Example_4.Parent = MLRemake.Buttons_3
MLRemake.Example_4.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MLRemake.Example_4.Size = UDim2.new(0, 72, 0, 25)
MLRemake.Example_4.Visible = false
MLRemake.Example_4.ZIndex = 2
MLRemake.Example_4.Font = Enum.Font.Gotham
MLRemake.Example_4.Text = "Tab"
MLRemake.Example_4.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Example_4.TextSize = 14.000

MLRemake.UICorner_53.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_53.Parent = MLRemake.Example_4

MLRemake.ObjectMenu.Name = "ObjectMenu"
MLRemake.ObjectMenu.Parent = MLRemake.Main
MLRemake.ObjectMenu.AnchorPoint = Vector2.new(1, 0)
MLRemake.ObjectMenu.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
MLRemake.ObjectMenu.BorderSizePixel = 0
MLRemake.ObjectMenu.ClipsDescendants = true
MLRemake.ObjectMenu.Position = UDim2.new(0, -10, 0, 0)
MLRemake.ObjectMenu.Size = UDim2.new(0, 100, 0, 0)
MLRemake.ObjectMenu.ZIndex = 4

MLRemake.UIListLayout_9.Parent = MLRemake.ObjectMenu
MLRemake.UIListLayout_9.SortOrder = Enum.SortOrder.LayoutOrder

MLRemake.Example_5.Name = "Example"
MLRemake.Example_5.Parent = MLRemake.ObjectMenu
MLRemake.Example_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Example_5.BackgroundTransparency = 1.000
MLRemake.Example_5.BorderSizePixel = 0
MLRemake.Example_5.Size = UDim2.new(1, 0, 0, 30)
MLRemake.Example_5.Visible = false
MLRemake.Example_5.ZIndex = 4
MLRemake.Example_5.Font = Enum.Font.Gotham
MLRemake.Example_5.TextColor3 = Color3.fromRGB(0, 0, 0)
MLRemake.Example_5.TextSize = 12.000
MLRemake.Example_5.TextXAlignment = Enum.TextXAlignment.Left

MLRemake.UIPadding_29.Parent = MLRemake.Example_5
MLRemake.UIPadding_29.PaddingLeft = UDim.new(0, 10)

MLRemake.UICorner_54.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_54.Parent = MLRemake.ObjectMenu

MLRemake.UICorner_55.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_55.Parent = MLRemake.Topbar

MLRemake.FillMain.Name = "FillMain"
MLRemake.FillMain.Parent = MLRemake.Topbar
MLRemake.FillMain.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MLRemake.FillMain.BorderSizePixel = 0
MLRemake.FillMain.Position = UDim2.new(0, 0, 1, 0)
MLRemake.FillMain.Size = UDim2.new(1, 0, 0, 10)
MLRemake.FillMain.ZIndex = 0

MLRemake.FillTopbar.Name = "FillTopbar"
MLRemake.FillTopbar.Parent = MLRemake.Topbar
MLRemake.FillTopbar.AnchorPoint = Vector2.new(0, 1)
MLRemake.FillTopbar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MLRemake.FillTopbar.BorderSizePixel = 0
MLRemake.FillTopbar.Position = UDim2.new(0, 0, 1, 0)
MLRemake.FillTopbar.Size = UDim2.new(1, 0, 0, 10)
MLRemake.FillTopbar.ZIndex = 5

MLRemake.Title_2.Name = "Title"
MLRemake.Title_2.Parent = MLRemake.Topbar
MLRemake.Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Title_2.BackgroundTransparency = 1.000
MLRemake.Title_2.BorderSizePixel = 0
MLRemake.Title_2.Size = UDim2.new(0, 346, 0, 30)
MLRemake.Title_2.ZIndex = 6
MLRemake.Title_2.Font = Enum.Font.Gotham
MLRemake.Title_2.Text = "Material Lua"
MLRemake.Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Title_2.TextSize = 16.000
MLRemake.Title_2.TextXAlignment = Enum.TextXAlignment.Left

MLRemake.UIPadding_30.Parent = MLRemake.Title_2
MLRemake.UIPadding_30.PaddingLeft = UDim.new(0, 8)

MLRemake.Minimize.Name = "Minimize"
MLRemake.Minimize.Parent = MLRemake.Topbar
MLRemake.Minimize.AnchorPoint = Vector2.new(1, 0)
MLRemake.Minimize.BackgroundColor3 = Color3.fromRGB(150, 250, 150)
MLRemake.Minimize.BorderSizePixel = 0
MLRemake.Minimize.Position = UDim2.new(1, -5, 0, 5)
MLRemake.Minimize.Size = UDim2.new(0, 20, 0, 20)
MLRemake.Minimize.ZIndex = 6
MLRemake.Minimize.AutoButtonColor = false
MLRemake.Minimize.Font = Enum.Font.SourceSans
MLRemake.Minimize.Text = ""
MLRemake.Minimize.TextColor3 = Color3.fromRGB(0, 0, 0)
MLRemake.Minimize.TextSize = 14.000

MLRemake.UICorner_56.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_56.Parent = MLRemake.Minimize

MLRemake.Menu_12.Name = "Menu"
MLRemake.Menu_12.Parent = MLRemake.Topbar
MLRemake.Menu_12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Menu_12.BackgroundTransparency = 1.000
MLRemake.Menu_12.BorderSizePixel = 0
MLRemake.Menu_12.Position = UDim2.new(0, 3, 0, 3)
MLRemake.Menu_12.Size = UDim2.new(0, 24, 0, 24)
MLRemake.Menu_12.Visible = false
MLRemake.Menu_12.ZIndex = 6
MLRemake.Menu_12.AutoButtonColor = false
MLRemake.Menu_12.Image = "rbxassetid://9087103499"

MLRemake.Ripple.Name = "Ripple"
MLRemake.Ripple.Parent = MLRemake.Topbar
MLRemake.Ripple.AnchorPoint = Vector2.new(0.5, 0.5)
MLRemake.Ripple.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
MLRemake.Ripple.BackgroundTransparency = 0.500
MLRemake.Ripple.BorderSizePixel = 0
MLRemake.Ripple.Size = UDim2.new(0, 100, 0, 100)
MLRemake.Ripple.Visible = false
MLRemake.Ripple.ZIndex = 5

MLRemake.UICorner_57.CornerRadius = UDim.new(1, 0)
MLRemake.UICorner_57.Parent = MLRemake.Ripple

MLRemake.Focus.Name = "Focus"
MLRemake.Focus.Parent = MLRemake.Topbar
MLRemake.Focus.AnchorPoint = Vector2.new(0.5, 1)
MLRemake.Focus.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
MLRemake.Focus.BorderSizePixel = 0
MLRemake.Focus.Position = UDim2.new(0.5, 0, 1, 0)
MLRemake.Focus.Size = UDim2.new(0, 0, 0, 1)
MLRemake.Focus.Visible = false
MLRemake.Focus.ZIndex = 5

MLRemake.Overlay.Name = "Overlay"
MLRemake.Overlay.Parent = MLRemake.Topbar
MLRemake.Overlay.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MLRemake.Overlay.BorderSizePixel = 0
MLRemake.Overlay.Size = UDim2.new(1, 0, 1, 490)
MLRemake.Overlay.Visible = false
MLRemake.Overlay.ZIndex = 11

MLRemake.UICorner_58.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_58.Parent = MLRemake.Overlay

MLRemake.SubTitle_2.Name = "SubTitle"
MLRemake.SubTitle_2.Parent = MLRemake.Topbar
MLRemake.SubTitle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.SubTitle_2.BackgroundTransparency = 1.000
MLRemake.SubTitle_2.BorderSizePixel = 0
MLRemake.SubTitle_2.Position = UDim2.new(0, 96, 0, 0)
MLRemake.SubTitle_2.Size = UDim2.new(0, 275, 0, 30)
MLRemake.SubTitle_2.ZIndex = 6
MLRemake.SubTitle_2.Font = Enum.Font.Gotham
MLRemake.SubTitle_2.Text = "Remake Version"
MLRemake.SubTitle_2.TextColor3 = Color3.fromRGB(150, 150, 150)
MLRemake.SubTitle_2.TextSize = 14.000
MLRemake.SubTitle_2.TextXAlignment = Enum.TextXAlignment.Left
MLRemake.SubTitle_2.TextYAlignment = Enum.TextYAlignment.Bottom

MLRemake.UIPadding_31.Parent = MLRemake.SubTitle_2
MLRemake.UIPadding_31.PaddingBottom = UDim.new(0, 6)
MLRemake.UIPadding_31.PaddingLeft = UDim.new(0, 8)

MLRemake.Notifications.Name = "Notifications"
MLRemake.Notifications.Parent = MLRemake.MLRemake
MLRemake.Notifications.AnchorPoint = Vector2.new(1, 1)
MLRemake.Notifications.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Notifications.BackgroundTransparency = 1.000
MLRemake.Notifications.BorderSizePixel = 0
MLRemake.Notifications.Position = UDim2.new(1, -10, 1, -10)
MLRemake.Notifications.Size = UDim2.new(0, 200, 1, -20)
MLRemake.Notifications.Visible = false
MLRemake.Notifications.ZIndex = 20

MLRemake.UIListLayout_10.Parent = MLRemake.Notifications
MLRemake.UIListLayout_10.SortOrder = Enum.SortOrder.LayoutOrder
MLRemake.UIListLayout_10.VerticalAlignment = Enum.VerticalAlignment.Bottom
MLRemake.UIListLayout_10.Padding = UDim.new(0, 10)

MLRemake.Notif.Name = "Notif"
MLRemake.Notif.Parent = MLRemake.Notifications
MLRemake.Notif.AnchorPoint = Vector2.new(1, 1)
MLRemake.Notif.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MLRemake.Notif.BorderSizePixel = 0
MLRemake.Notif.Position = UDim2.new(1, -10, 1, -10)
MLRemake.Notif.Size = UDim2.new(0, 200, 0, 100)
MLRemake.Notif.ZIndex = 20

MLRemake.UICorner_59.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_59.Parent = MLRemake.Notif

MLRemake.UIPadding_32.Parent = MLRemake.Notif
MLRemake.UIPadding_32.PaddingBottom = UDim.new(0, 8)
MLRemake.UIPadding_32.PaddingLeft = UDim.new(0, 8)
MLRemake.UIPadding_32.PaddingRight = UDim.new(0, 8)
MLRemake.UIPadding_32.PaddingTop = UDim.new(0, 8)

MLRemake.Title_3.Name = "Title"
MLRemake.Title_3.Parent = MLRemake.Notif
MLRemake.Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Title_3.BackgroundTransparency = 1.000
MLRemake.Title_3.BorderSizePixel = 0
MLRemake.Title_3.Size = UDim2.new(1, 0, 0, 16)
MLRemake.Title_3.ZIndex = 21
MLRemake.Title_3.Font = Enum.Font.GothamSemibold
MLRemake.Title_3.Text = "Material Lua Remake"
MLRemake.Title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Title_3.TextSize = 16.000
MLRemake.Title_3.TextXAlignment = Enum.TextXAlignment.Left
MLRemake.Title_3.TextYAlignment = Enum.TextYAlignment.Top

MLRemake.Label_12.Name = "Label"
MLRemake.Label_12.Parent = MLRemake.Notif
MLRemake.Label_12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Label_12.BackgroundTransparency = 1.000
MLRemake.Label_12.BorderSizePixel = 0
MLRemake.Label_12.Position = UDim2.new(0, 0, 0, 24)
MLRemake.Label_12.Size = UDim2.new(1, 0, 1, -48)
MLRemake.Label_12.ZIndex = 21
MLRemake.Label_12.Font = Enum.Font.Gotham
MLRemake.Label_12.Text = "Notification"
MLRemake.Label_12.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Label_12.TextSize = 14.000
MLRemake.Label_12.TextXAlignment = Enum.TextXAlignment.Left
MLRemake.Label_12.TextYAlignment = Enum.TextYAlignment.Top

MLRemake.Line_4.Name = "Line"
MLRemake.Line_4.Parent = MLRemake.Notif
MLRemake.Line_4.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
MLRemake.Line_4.BorderSizePixel = 0
MLRemake.Line_4.Position = UDim2.new(0, 0, 0, 20)
MLRemake.Line_4.Size = UDim2.new(1, 0, 0, 1)
MLRemake.Line_4.ZIndex = 21

MLRemake.Buttons_4.Name = "Buttons"
MLRemake.Buttons_4.Parent = MLRemake.Notif
MLRemake.Buttons_4.Active = true
MLRemake.Buttons_4.AnchorPoint = Vector2.new(0, 1)
MLRemake.Buttons_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Buttons_4.BackgroundTransparency = 1.000
MLRemake.Buttons_4.BorderSizePixel = 0
MLRemake.Buttons_4.Position = UDim2.new(0, 0, 1, 0)
MLRemake.Buttons_4.Size = UDim2.new(1, 0, 0, 20)
MLRemake.Buttons_4.ZIndex = 21
MLRemake.Buttons_4.CanvasSize = UDim2.new(0, 0, 0, 0)
MLRemake.Buttons_4.ScrollBarThickness = 0

MLRemake.UIListLayout_11.Parent = MLRemake.Buttons_4
MLRemake.UIListLayout_11.FillDirection = Enum.FillDirection.Horizontal
MLRemake.UIListLayout_11.HorizontalAlignment = Enum.HorizontalAlignment.Right
MLRemake.UIListLayout_11.SortOrder = Enum.SortOrder.LayoutOrder

MLRemake.Button_8.Name = "Button"
MLRemake.Button_8.Parent = MLRemake.Buttons_4
MLRemake.Button_8.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MLRemake.Button_8.Size = UDim2.new(0, 40, 0, 20)
MLRemake.Button_8.Visible = false
MLRemake.Button_8.ZIndex = 21
MLRemake.Button_8.Font = Enum.Font.GothamBold
MLRemake.Button_8.Text = "OK"
MLRemake.Button_8.TextColor3 = Color3.fromRGB(255, 255, 255)
MLRemake.Button_8.TextSize = 14.000
MLRemake.Button_8.TextWrapped = true

MLRemake.UICorner_60.CornerRadius = UDim.new(0, 4)
MLRemake.UICorner_60.Parent = MLRemake.Button_8

-- Module Scripts:

local fake_module_scripts = {}

do -- MLRemake.MLRemake.UI
	local script = Instance.new('ModuleScript', MLRemake.MLRemake)
	script.Name = "UI"
	local function module_script()
		-- shitty code !
		
		local uis = game:GetService("UserInputService")
		local ts = game:GetService("TweenService")
		local mouse = game:GetService("Players").LocalPlayer:GetMouse()
		
		-- ui stuffs
		local topbar = script.Parent.Topbar
		local main = topbar.Main
		local pages = main.Pages
		local ex = pages.Example
		local navigator = main.Navigator
		local pagebtns = navigator.Buttons
		local tabs = main.Tabs
		local pagetabs = tabs.Buttons
		local ripple = topbar.Ripple
		local focus = topbar.Focus
		local minimize = topbar.Minimize
		local filltop = topbar.FillTopbar
		local fillmain = topbar.FillMain
		local menubtn = topbar.Menu
		local dim1 = main.BackgroundDim
		local dim2 = main.BackgroundDim2
		local banner = main.Banner
		local notification = topbar.Parent.Notifications.Notif
		
		-- constants / placeholders
		local sine = Enum.EasingStyle.Sine
		local out = Enum.EasingDirection.Out
		local nofunc = function() end
		local bind = Instance.new("BindableEvent")
		local nocolor = Color3.fromRGB(255, 255, 255)
		local inf = math.huge
		
		-- variables
		local UI_LOADED = false
		local UI_SIZE_X = 400
		local UI_SIZE_Y = 500
		local FIRST_PAGE = true
		local ENABLED_IMAGE = "rbxassetid://9122106066"
		local DISABLED_IMAGE = "rbxassetid://9122119502"
		local mousedown = false
		
		-- aliases
		local clamp = math.clamp
		local floor = math.floor 
		local format = string.format
		local Color3new = Color3.new
		local fromRGB = Color3.fromRGB
		local fromHSV = Color3.fromHSV
		local UDim2new = UDim2.new
		local Vector2new = Vector2.new
		local taskwait = task.wait
		local taskdelay = task.delay
		local TweenInfonew = TweenInfo.new
		local CSnew = ColorSequence.new
		local CSKnew = ColorSequenceKeypoint.new
		
		local defaults = {
			Load = {
				Title = "Material Lua Remake",
				SubTitle = "",
				Icon = nil,
				ShowInNavigator = false,
				Style = 1,
				SizeX = 400,
				SizeY = 505,
				NavigatorSize = 200
			},
			Banner = {
				Text = "Banner",
				Callback = nofunc,
				Options = {"OK"}
			},
			Notify = {
				Title = "Material Lua Remake",
				Text = "Notification",
				Duration = 3,
				Callback = nofunc,
				Options = {"OK"}
			},
			Button = {
				Text = "Button",
				Callback = nofunc,
				Center = false
			},
			Toggle = {
				Text = "Toggle",
				Callback = nofunc,
				Enabled = false
			},
			Dropdown = {
				Text = "Dropdown",
				Callback = nofunc,
				Options = {"Option"},
				Def = "Option"
			},
			TextBox = {
				Text = "Text Box",
				Callback = nofunc,
				Type = "Default",
				ClearOnFocus = false,
				Center = false
			},
			Label = {
				Text = "Label",
				Event = bind,
				Center = false,
				Transparent = false
			},
			Slider = {
				Text = "Slider",
				Callback = nofunc,
				Min = 0,
				Max = 10,
				Def = 5,
				Prefix = "",
				Suffix = "",
				ReturnWithAffixes = false,
				ReturnAsPercent = false,
				Toggle = false,
				Enabled = false,
				ToggleCallback = nofunc
			},
			ColorPicker = {
				Text = "Color Picker",
				Callback = nofunc,
				Def = nocolor,
				Rainbow = false
			},
			Keybind = {
				Text = "Keybind",
				Callback = nofunc,
				Def = Enum.KeyCode.Unknown,
				AllowKeyboard = true,
				AllowMouse = false
			},
			ChipSet = {
				Text = "Chip Set",
				Callback = nofunc,
				Options = {
					['Option 1'] = true,
					['Option 2'] = false
				}
			},
			Table = {
				Text = "Table",
				Event = bind,
				Key = "Key",
				Value = "Value",
				ShowInfo = true,
				Data = {
					['Key'] = "Value"
				}
			}
		}
		
		topbar.Visible = false
		
		function CheckInvalidProps(a, b)
			for i,v in next, defaults[a] do
				if b[i] ~= nil and typeof(b[i]) ~= typeof(v) then
					error("Failed to load "..a.." (Invalid value type)")
				end
			end
		end
		
		function ApplyDefaultProps(a,b)
			for i,v in next, defaults[a] do
				if b[i] == nil then
					b[i] = v
				end
			end
		end
		function Round(num, dec)
			return tonumber(format("%." .. (dec or 0) .. "f", num))
		end
		
		local ToggleOn = UDim2new(0.5, 0, 0.5, 0)
		local ToggleOff = UDim2new(0, 0, 0.5, 0)
		
		local ID = 0
		local ui = {}
		
		uis.InputEnded:Connect(function(i,gp)
			if i.UserInputType.Name == "MouseButton1" then
				mousedown = false
			end
		end)
		
		do -- UI Effects
			local GeneralInfo = TweenInfo.new(0.25, sine, out)
			function ui.Tween(object, properties, tweeninfo, callback)
				ts:Create(object, tweeninfo or GeneralInfo, properties):Play()
			end
			
			local RIPPLE_DURATION = 0.65
			function ui.Ripple(a, p)
				a.AutoButtonColor = false
				a.ClipsDescendants = true
				if p then
					p.ClipsDescendants = true
				end
				a.Activated:Connect(function()
					local abp = a.AbsolutePosition
					local abs = a.AbsoluteSize
		
					local new = ripple:Clone()
					new.Size = UDim2new(0, 0, 0, 0)
					new.Position = UDim2new(
						0,
						mouse.X - abp.X,
						0,
						mouse.Y - abp.Y
					)
					new.Visible = true
					new.Parent = p or a
					new:TweenSize(UDim2new(0, abs.X * 2.25, 0, abs.X * 2.25), "Out", "Quad", RIPPLE_DURATION)
					ts:Create(new, TweenInfonew(RIPPLE_DURATION, sine, out), {BackgroundTransparency = 1}):Play()
					taskwait(RIPPLE_DURATION)
					new:Destroy()
				end)
			end
			
			local FOCUS_DURATION = 0.225
			function ui.Focus(a, p)
				a.Focused:Connect(function()
					local new = focus:Clone()
					new.Visible = true
					new.Parent = p or a
					
					local padding = (p ~= nil and p.Parent:FindFirstChild("UIPadding")) or a.Parent:FindFirstChild("UIPadding")
					padding = (padding ~= nil and padding.PaddingLeft.Offset + padding.PaddingRight.Offset) or 0
					new:TweenSize(UDim2new(1, padding, 0, 1), "Out", "Quad", FOCUS_DURATION, true)
					local conn;conn = a.FocusLost:Connect(function()
						new:TweenSize(UDim2new(0, 0, 0, 1), "Out", "Quad", FOCUS_DURATION, true)
						taskwait(FOCUS_DURATION)
						new:Destroy()
						conn:Disconnect()
					end)
				end)
			end
			
			function ui.Dim1(value, main)
				ui.Tween(main.BackgroundDim, {BackgroundTransparency = (value and 0.75) or 1})
			end
			function ui.Dim2(value, main)
				ui.Tween(main.BackgroundDim2, {BackgroundTransparency = (value and 0.75) or 1})
			end
			
			local DRAG_SPEED = 0.075
			local DRAG_INFO = TweenInfo.new(DRAG_SPEED)
			function ui.SmoothDrag(a)
				local toggle = nil
				local input = nil
				local start = nil
				local pos = nil
				local startpos = nil
		
				local function Update(i)
					local delta = i.Position - start
					local pos = UDim2new(startpos.X.Scale, startpos.X.Offset + delta.X, startpos.Y.Scale, startpos.Y.Offset + delta.Y)
					ui.Tween(a, {Position = pos}, DRAG_INFO)
				end
		
				a.InputBegan:Connect(function(i)
					if i.UserInputType.Name == "MouseButton1" and uis:GetFocusedTextBox() == nil then
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
				uis.InputChanged:Connect(function(i)
					if i == input and toggle then
						Update(i)
					end
				end)
			end
		end
		
		do -- Banner
			local BANNER_TRANSPARENCY = 0.75
			local BANNER_TWEENINFO = TweenInfonew(0.45, sine, out)
			local BANNER_VISIBLE = false
			local LAST_BANNER = nil
			
			local function show(a)
				for _,v in next, a.Buttons:GetChildren() do
					if v:IsA("TextButton") then
						taskdelay(0.1, function()
							ui.Tween(v, {BackgroundTransparency = 0, TextTransparency = 0}, BANNER_TWEENINFO)
						end)
					end
				end
				taskdelay(0.1, function()
					a:TweenPosition(UDim2new(0.5, 0, 1, -10), "Out", "Sine", 0.35)
					ui.Tween(a, {BackgroundTransparency = 0}, BANNER_TWEENINFO)
					ui.Tween(a.Label, {BackgroundTransparency = 0, TextTransparency = 0}, BANNER_TWEENINFO)
				end)
			end
			local function hide(a)
				for _,v in next, a.Buttons:GetChildren() do
					if v:IsA("TextButton") then
						ui.Tween(v, {BackgroundTransparency = BANNER_TRANSPARENCY, TextTransparency = BANNER_TRANSPARENCY}, BANNER_TWEENINFO)
					end
				end
				if a.AnchorPoint.X == 0 then
					a:TweenPosition(UDim2new(0, a.Position.X.Offset, 1, 20), "Out", "Sine", 0.35)
				else
					a:TweenPosition(UDim2new(0.5, 0, 1, 20), "Out", "Sine", 0.35)
				end
				ui.Tween(a, {BackgroundTransparency = BANNER_TRANSPARENCY}, BANNER_TWEENINFO)
				ui.Tween(a.Label, {BackgroundTransparency = BANNER_TRANSPARENCY, TextTransparency = BANNER_TRANSPARENCY}, BANNER_TWEENINFO)
				taskdelay(0.375, function()
					a:Destroy()
				end)
			end
			function ui.Banner(t, p, style, navsize)
				if typeof(t) == "string" then
					t = {Text = t}
				end
				ApplyDefaultProps("Banner", t)
				
				if LAST_BANNER and BANNER_VISIBLE then
					hide(LAST_BANNER)
				end
				
				local new = banner:Clone()
				new.Name = "Banner"
				new.Label.Text = t.Text
				new.Parent = p or main
		
				ui.Dim2(true, p)
				BANNER_VISIBLE = true
				LAST_BANNER = new
		
				for _,v in next, t.Options do
					local new2 = new.Buttons.Example:Clone()
					new2.Name = v
					new2.Visible = true
					new2.Text = v
					new2.BackgroundTransparency = BANNER_TRANSPARENCY
					new2.TextTransparency = BANNER_TRANSPARENCY
					new2.Parent = new.Buttons
					
					taskwait()
					
					new2.Size = UDim2new(0, new2.TextBounds.X + 20, 0, 20)
					new2.Activated:Connect(function()
						t.Callback(v)
						ui.Dim2(false, p)
						BANNER_VISIBLE = false
						LAST_BANNER = nil
						hide(new)
					end)
		
					taskdelay(0.1, function()
						ui.Tween(new2, {BackgroundTransparency = 0, TextTransparency = 0}, BANNER_TWEENINFO)
					end)
		
					ui.Ripple(new2)
				end
		
				if style == 4 then
					new.AnchorPoint = Vector2new(0, 1)
					new.Position = UDim2new(0, navsize + 10, 1, 0)
				else
					new.Position = UDim2new(0.5, 0, 1, 0)
				end
				new.BackgroundTransparency = BANNER_TRANSPARENCY
				new.Label.BackgroundTransparency = BANNER_TRANSPARENCY
				new.Label.TextTransparency = BANNER_TRANSPARENCY
				new.Label.Size = UDim2new(1, 0, 10, 0)
				local bound = new.Label.TextBounds.Y
				new.Label.Size = UDim2new(1, 0, 1, 0)
				new.Size = UDim2new(1, -20 - ((style == 4 and navsize) or 0), 0, clamp(bound + 45, 100, inf))
		
				taskdelay(0.1, function()
					if style == 4 then
						new:TweenPosition(UDim2new(0, navsize + 10, 1, -10), "Out", "Sine", 0.35)
					else
						new:TweenPosition(UDim2new(0.5, 0, 1, -10), "Out", "Sine", 0.35)
					end
					ui.Tween(new, {BackgroundTransparency = 0}, BANNER_TWEENINFO)
					ui.Tween(new.Label, {BackgroundTransparency = 0, TextTransparency = 0}, BANNER_TWEENINFO)
				end)
				new.Visible = true
			end
		end
		
		do -- Notify incomplete
			local NOTIF_TWEENINFO = TweenInfonew(0.35, sine, out)
			local NOTIF_VISIBLE = false
			local NOTIFS = {}
			local NOTIF_COUNT = 0
			
			local function show(a)
				if NOTIF_COUNT > 0 then
					for _,v in next, NOTIFS do
						v:TweenPosition(UDim2new())
					end
				else
					
				end
			end
			local function hide(a)
				
			end
			function ui.Notify(t, p)
				if typeof(t) == "string" then
					t = {Text = t}
				end
				ApplyDefaultProps("Banner", t)
		
				local new = notification:Clone()
				new.Name = "Notification"
				new.Title.Text = t.Title
				new.Label.Text = t.Text
				new.Parent = p or main
			end
		end
		
		do -- UI Core
			function ui.UpdateCanvasSize(page)
				task.spawn(function()
					for _ = 1,30 do -- repeat to update while tweening
						page.CanvasSize = UDim2new(0, 0, 0, page.UIListLayout.AbsoluteContentSize.Y)
						taskwait(0.01)
					end
				end)
			end
			local MENU_INFO = {"Out", "Sine", 0.15, true}
			local LAST_BUTTON = nil
			function ui.InitMenu(t, p, o)
				table.sort(t, function(a,b)
					return a < b
				end)
			
				local menubtn = p.Menu
				local main = p:FindFirstAncestor("Main")
				local menu = main.ObjectMenu
				local list = menu.UIListLayout
				
				menubtn.Visible = true
				menubtn.Activated:Connect(function()
					if LAST_BUTTON ~= menubtn then
						LAST_BUTTON = menubtn
						menu.Visible = true
						menu.Size = UDim2new(0, 100, 0, 0)
						menu.Position = UDim2new(0, mouse.X - main.AbsolutePosition.X - 2, 0, mouse.Y - main.AbsolutePosition.Y + 2)
						for _,v in next, menu:GetChildren() do
							if v:IsA("TextButton") and v.Name ~= "Example" then
								v:Destroy()
							end
						end
						for i,v in next, t do
							local new = menu.Example:Clone()
							new.Parent = menu
							new.Visible = true
							new.Name = "BUTTON_"..i
							new.Text = i 
							new.Activated:Connect(function()
								v({Object = menubtn})
								menu:TweenSize(UDim2new(0, 100, 0, 0), unpack(MENU_INFO))
								LAST_BUTTON = nil
							end)
							ui.Ripple(new)
						end
						menu:TweenSize(UDim2new(0, 100, 0, list.AbsoluteContentSize.Y), unpack(MENU_INFO))
						menu.AnchorPoint = Vector2new(1, 0)
						if menu.AbsolutePosition.Y + list.AbsoluteContentSize.Y >= main.AbsolutePosition.Y + main.AbsoluteSize.Y then
							menu.AnchorPoint = Vector2new(1, 1)
						end
					else
						LAST_BUTTON = nil
						menu:TweenSize(UDim2new(0, 100, 0, 0), unpack(MENU_INFO))
						taskwait(0.15)
						menu.Visible = false
					end
				end)
				
				taskdelay(0.5, function()
					for _,v in next, o do
						local pos = v.Position
						v.Position = UDim2new(pos.X.Scale, pos.X.Offset - 32, pos.Y.Scale, pos.Y.Offset)
					end
				end)
			end
			
			function ui.Load(t)
				UI_LOADED = false
				ApplyDefaultProps("Load", t)
				
				local new = script.Parent:Clone()
				if getgenv then
					if syn then syn.protect_gui(new) end
					new.Parent = (gethui and gethui()) or (get_hidden_ui and get_hidden_ui()) or game.CoreGui
					if OldInstance ~= nil then
						OldInstance:Destroy()
					end
					getgenv().OldInstance = new
				else
					new.Parent = game:GetService("Players").LocalPlayer.PlayerGui
				end
				new.Name = "MATERIAL_"..t.Title
		
				local topbar = new.Topbar
				local main = topbar.Main
				local pages = main.Pages
				local ex = pages.Example
				local overlay = topbar.Overlay
				local navigator = main.Navigator
				local pagebtns = navigator.Buttons
				local tabs = main.Tabs
				local pagetabs = tabs.Buttons
				local ripple = topbar.Ripple
				local focus = topbar.Focus
				local minimize = topbar.Minimize
				local filltop = topbar.FillTopbar
				local fillmain = topbar.FillMain
				local menubtn = topbar.Menu
				local dim1 = main.BackgroundDim
				local dim2 = main.BackgroundDim2
				local banner = main.Banner
				local notification = topbar.Parent.Notifications.Notif
				
				local Theme = {
					MainFrame = main,
		
					Minimise = minimize,
					MinimiseAccent = nil,
					Maximise = nil,
					MaximiseAccent = nil,
		
					NavBar = {{navigator, "BackgroundColor3"}},
					NavBarAccent = nil,
					NavBarInvert = nil,
		
					TitleBar = topbar,
					TitleBarAccent = {{topbar.Title, "BackgroundColor3"}},
		
					Overlay = nil,
		
					Banner = main.Banner,
					BannerAccent = {main.BackgroundDim2, main.Banner.Label},
		
					Content = nil,
		
					Button = ex.Button,
					ButtonAccent = nil,
		
					ChipSet = Color3.fromRGB(219, 68, 103),
					ChipSetAccent = Color3.fromRGB(255,255,255),
		
					DataTable = Color3.fromRGB(219, 68, 103),
					DataTableAccent = Color3.fromRGB(255,255,255),
		
					Slider = Color3.fromRGB(255,255,255),
					SliderAccent = Color3.fromRGB(219, 68, 103),
		
					Toggle = Color3.fromRGB(219, 68, 103),
					ToggleAccent = Color3.fromRGB(255,255,255),
		
					Dropdown = Color3.fromRGB(255,255,255),
					DropdownAccent = Color3.fromRGB(219, 68, 103),
		
					ColorPicker = Color3.fromRGB(255,255,255),
					ColorPickerAccent = Color3.fromRGB(219, 68, 103),
		
					TextField = Color3.fromRGB(175,175,175),
					TextFieldAccent = Color3.fromRGB(255,255,255)
				}
				
				local function ColorOverride(t) -- not finished
					for _,info in next, t do
						if info ~= nil then
							for i,v in next, info do
								local Object = v[1]
								local Property = v[2]
								local Value = v[3]
		
								Object[Property] = Value
							end
						end
					end
				end
				
				local UI_SIZE_X = clamp(t.SizeX, 275, inf)
				local UI_SIZE_Y = t.SizeY
				local FIRST_PAGE = true
				local FIRST_PAGE_OBJ = nil
				local MIN_BTN_COLOR = fromRGB(250, 170, 75)
				local MAX_BTN_COLOR = fromRGB(150, 250, 170)
				local STYLE = clamp(t.Style, 1, 4)
				local NAV_SIZE = clamp(t.NavigatorSize, 0, UI_SIZE_X)
				
				local res = workspace.CurrentCamera.ViewportSize
				topbar.Visible = true
				topbar.Position = UDim2new(0, (res.X / 2) - (UI_SIZE_X / 2), 0, (res.Y / 2) - ((UI_SIZE_Y + 30) / 2))
				topbar.Size = UDim2new(0, 0, 0, 30)
				topbar.Main.Size = UDim2new(0, 0, 0, UI_SIZE_Y)
				
				topbar.Title.TextTransparency = 1
				topbar.Title.Text = t.Title
				topbar.SubTitle.TextTransparency = 1
				topbar.SubTitle.Text = t.SubTitle
				topbar.SubTitle.Visible = false
				taskdelay(2, function()
					topbar.SubTitle.Position = UDim2new(0, topbar.Title.TextBounds.X + 4 +( (t.Style == 3 and 24) or 0), 0, 0)
					topbar.SubTitle.Visible = not t.ShowInNavigator
					ui.Tween(topbar.SubTitle, {TextTransparency = 0}, TweenInfonew(0.75, sine, out))
				end)
				
				navigator.Size = UDim2new(0, NAV_SIZE, 1, 0)
				navigator.Position = UDim2new(0, -NAV_SIZE, 0, 0)
				navigator.Icon.Visible = t.ShowInNavigator
				navigator.Title.Visible = t.ShowInNavigator
				navigator.SubTitle.Visible = t.ShowInNavigator
				navigator.Title.Text = t.Title
				navigator.SubTitle.Text = t.SubTitle
				if t.ShowInNavigator then
					topbar.SubTitle.Visible = false
					navigator.Buttons.Position = UDim2new(0, 0, 0, 50)
				end
				if t.Icon ~= nil then
					local img = t.Icon
					local icon = navigator.Icon
					if tonumber(img) ~= nil then
						icon.Image = "rbxassetid://"..img
					elseif type == "string" then
						if img:find("rbxassetid://") then
							icon.Image = img
						elseif isfile(img) and (getcustomasset or getsynasset) then
							icon.Image = (getcustomasset and getcustomasset(img)) or (getsynasset and getsynasset(img))
						end
					else
						icon.Image = img
					end
				else
					navigator.Icon.Visible = false
					navigator.Title.Position = UDim2new(0, 8, 0, 5)
					navigator.SubTitle.Position = UDim2new(0, 8, 0, 28)
				end
				
				
				menubtn.ImageTransparency = 1
				minimize.BackgroundTransparency = 1
				
				tabs.Visible = false
				pages.Visible = false
				overlay.Visible = true
				overlay.Size = UDim2new(1, 0, 1, UI_SIZE_Y)
				for _,v in next, ex:GetChildren() do
					if not v:IsA("UIListLayout") then
						v.Visible = false
					end
				end
				ui.SmoothDrag(topbar)
				
				if STYLE == 1 or STYLE == 2 then
					menubtn.Visible = false
					topbar.Title.Position = UDim2new(0, 0, 0, 0)
					if STYLE == 2 then
						pagetabs.Example.BackgroundColor3 = fromRGB(90, 90, 90)
					end
				elseif STYLE == 3 then
					menubtn.Visible = true
					tabs.Visible = false
					pages.Size = UDim2new(1, 0, 1, 0)
				elseif STYLE == 4 then
					menubtn.Visible = false
					banner.Size = UDim2new(1, -20 - NAV_SIZE, 0, 100)
					UI_SIZE_X += NAV_SIZE
				end
				
				task.spawn(function() -- loading animation
					local fadeinfo = TweenInfonew(0.75, sine, out)
					local info = {"Out", "Sine", 1.25, true}
					topbar:TweenSize(UDim2new(0, UI_SIZE_X, 0, 30), unpack(info))
					main:TweenSize(UDim2new(0, UI_SIZE_X, 0, UI_SIZE_Y), unpack(info))
					
					taskwait(1.25)
					ui.Tween(overlay, {BackgroundTransparency = 1}, TweenInfonew(0.5, sine, out))
					ui.Tween(topbar.Title, {TextTransparency = 0}, fadeinfo)
					ui.Tween(minimize, {BackgroundTransparency = 0}, fadeinfo)
					
					if STYLE == 1 or STYLE == 2 then
						tabs.Visible = true
						tabs.Position = UDim2new(0, 10, 0, 35)
						tabs:TweenPosition(UDim2new(0, 10, 0, 10), "Out", "Sine", 0.75)
					elseif STYLE == 3 then
						ui.Tween(menubtn, {ImageTransparency = 0}, fadeinfo)
						topbar.Title:TweenPosition(UDim2new(0, 24, 0, 0), "Out", "Sine", 0.75)
					elseif STYLE == 4 then
						pages.Size = UDim2new(1, 0, 1, 0)
						navigator.Line.Visible = false
						main:TweenPosition(UDim2new(0.5, 0, 0, 30), unpack(info))
						navigator:TweenPosition(UDim2new(0, 0, 0, 0), "Out", "Sine", 0.75)
						pages:TweenPosition(UDim2new(0, NAV_SIZE, 1, 0), "Out", "Sine", 0.75)
						pages:TweenSize(UDim2new(1, -NAV_SIZE, 1, 0))
					end
					
					pages.Visible = true
					pages.Position = UDim2new(0, 0, 1, 25)
					pages:TweenPosition(UDim2new(0, 0, 1, 0), "Out", "Sine", 0.75)
					taskwait(0.8)
					UI_LOADED = true
				end)
				
				local Minimized = false
				minimize.Activated:Connect(function()
					Minimized = not Minimized
					if Minimized then
						ui.Tween(minimize, {BackgroundColor3 = fromRGB(250, 170, 75)})
						main:TweenSize(UDim2new(0, UI_SIZE_X, 0, 0), "Out", "Sine", 0.2, true)
						taskwait(0.15)
						if Minimized then
							filltop.Visible = false
							fillmain.Visible = false
						end
					else
						ui.Tween(minimize, {BackgroundColor3 = fromRGB(150, 250, 170)})
						main:TweenSize(UDim2new(0, UI_SIZE_X, 0, UI_SIZE_Y), "Out", "Sine", 0.2, true)
						filltop.Visible = true
						fillmain.Visible = true
					end
				end)
		
				local Navigating = false
				menubtn.Activated:Connect(function()
					Navigating = not Navigating
					navigator:TweenPosition(UDim2new(0, (not Navigating and -NAV_SIZE) or 0, 0, 0), "Out", "Sine", 0.2, true)
					ui.Dim1(Navigating, main)
				end)
				
				
				
				local UI = {}
				
				local PAGE_INDEX = 0
				local OPEN_PAGE_INFO = TweenInfonew(0.2, sine, out)
				function UI.OpenPage(t)
					for _,v in next, pages:GetChildren() do
						if v:IsA("ScrollingFrame") then
							v.Visible = (v.Name == t and true) or (v.Name == "PAGE_"..t and true) or false
						end
					end
					for _,v in next, pagebtns:GetChildren() do
						if v:IsA("TextButton") then
							ui.Tween(v.Line, {BackgroundColor3 = (v.Name == t and fromRGB(120, 120, 120)) or fromRGB(75, 75, 75)}, OPEN_PAGE_INFO)
							ui.Tween(v, {TextTransparency = (v.Name == t and 0) or 0.4}, OPEN_PAGE_INFO)
						end
					end
				end
				function UI.new(t)
					local title = "Page"
					if typeof(t) == "table" then
						if t.Title ~= nil then
							title = t.Title
						else
							PAGE_INDEX += 1
							title = t.." "..PAGE_INDEX..""
						end
					end
					
					local discriminator = ""
					if pages:FindFirstChild("PAGE_"..title) then
						discriminator = "_"
						for _ = 1,8 do
							discriminator = discriminator..string.char(math.random(97, 122))
						end
					end
					
					local function open()
						UI.OpenPage("PAGE_"..title..discriminator)
						if STYLE ~= 4 and STYLE ~= 5 then
							navigator:TweenPosition(UDim2new(0, -NAV_SIZE, 0, 0), "Out", "Sine", 0.2, true)
						end
						Navigating = false
						ui.Dim1(false, main)
					end
		
					local newnav = pagebtns.Example:Clone()
					newnav.Visible = true
					newnav.Parent = pagebtns
					newnav.Name = "PAGE_"..title..discriminator
					newnav.Text = title
					newnav.Activated:Connect(open)
					pagebtns.CanvasSize = UDim2new(0, 0, 0, pagebtns.UIListLayout.AbsoluteContentSize.Y + 3)
					
					local img = t.ImageId or t.ImageID
					if img ~= nil then
						local type = typeof(img)
						local icon = newnav.Icon
						icon.Visible = true
						if tonumber(img) ~= nil then
							icon.Image = "rbxassetid://"..img
						elseif type == "string" then
							if img:find("rbxassetid://") then
								icon.Image = img
							elseif isfile(img) and (getcustomasset or getsynasset) then
								icon.Image = (getcustomasset and getcustomasset(img)) or (getsynasset and getsynasset(img))
							end
						end
						newnav.UIPadding.PaddingLeft = UDim.new(0, 38)
						
						local size = t.ImageSize
						if size ~= nil then
							local x = clamp(size.X, 0, 30)
							local y = clamp(size.Y, 0, 30)
							newnav.Icon.Size = UDim2new(0, x, 0, y)
							newnav.Icon.Position = UDim2new(0, -34 + ((30 - x) / 2), 0, (30 - y) / 2)
						end
					end
					
					local newtab = pagetabs.Example:Clone()
					newtab.Visible = true
					newtab.Parent = pagetabs
					newtab.Name = "PAGE_"..title..discriminator
					newtab.Text = title
					newtab.Size = UDim2new(0, clamp(newtab.TextBounds.X + 10, 72, inf), 0, 25)
					newtab.Activated:Connect(open)
					ui.Ripple(newtab)
					pagetabs.CanvasSize = UDim2new(0, pagetabs.UIListLayout.AbsoluteContentSize.X, 0, 0)
		
					local newpage = ex:Clone()
					newpage.Parent = pages
					newpage.Visible = FIRST_PAGE
					newpage.Name = "PAGE_"..title..discriminator
					
					if FIRST_PAGE then
						FIRST_PAGE = false
						FIRST_PAGE_OBJ = newpage
						newnav.TextTransparency = 0
						newnav.Line.BackgroundColor3 = fromRGB(120, 120, 120)
					end
					
					for _,v in next, newpage:GetChildren() do
						if not v:IsA("UIListLayout") then
							v.Visible = false
						end
					end
					
		
					local function newfunc(name)
						return function(t)
							return ui[name](t, newpage, ex)
						end
					end
					local funcs = {
						Button = newfunc("Button"),
						Toggle = newfunc("Toggle"),
						Dropdown = newfunc("Dropdown"),
						TextBox = newfunc("TextBox"),
						TextField = newfunc("TextBox"),
						Label = newfunc("Label"),
						Slider = newfunc("Slider"),
						ColorPicker = newfunc("ColorPicker"),
						Keybind = newfunc("Keybind"),
						ChipSet = newfunc("ChipSet"),
						DataTable = newfunc("ChipSet"),
						Table = newfunc("Table"),
						Remove = function()
							newnav:Destroy()
							newtab:Destroy()
							newpage:Destroy()
						end,
					}
					
					return funcs
				end
				function UI.Toggle(vis)
					if vis ~= nil then
						topbar.Visible = vis
					else
						topbar.Visible = not topbar.Visible
					end
				end
				function UI.Banner(t)
					return ui.Banner(t, main, STYLE, NAV_SIZE)
				end
				function UI.Notify(t)
					
				end
		
				UI.New = UI.new
				UI.UI = new
				
				return UI
			end
		end
		
		do -- Button
			function ui.Button(t, p, ex)
				ID += 1
				local id = ID
				ApplyDefaultProps("Button", t)
		
				local new = ex.Button:Clone()
				new.Name = "Button#"..id
				new.Parent = p or ex
				new.Visible = true
				new.Text = t.Text
				new.TextXAlignment = Enum.TextXAlignment[(t.Center and "Center" or "Left")]
				new.Activated:Connect(t.Callback)
				
				ui.Ripple(new)
				ui.UpdateCanvasSize(p or ex)
				
				if t.Menu ~= nil then
					ui.InitMenu(t.Menu, new, {})
				end
				
				local a = {Destroyed = false}
				
				function a:SetText(text)
					if a.Destroyed then return end
					new.Text = text
				end
				function a:GetText()
					if a.Destroyed then return end
					return new.Text
				end
				function a:GetId()
					if a.Destroyed then return end
					return id
				end
				function a:Destroy()
					if a.Destroyed then return end
					new:Destroy()
					a.Destroyed = true
				end
				
				return a
			end
		end
		
		do -- Toggle
			function ui.Toggle(t, p, ex)
				ID += 1
				local id = ID
				ApplyDefaultProps("Toggle", t)
		
				local toggled = t.Enabled
		
				local new = ex.Toggle:Clone()
				local toggle = new.Toggle
				new.Name = "Toggle#"..id
				new.Parent = p or ex
				new.Visible = true
				new.Text = t.Text
				toggle.Indicator.Position = (t.Enabled and UDim2new(0.5, 0, 0.5, 0)) or UDim2new(0, 0, 0.5, 0)
				new.Activated:Connect(function()
					toggled = not toggled
					t.Callback(toggled)
					if toggled then
						toggle.Indicator:TweenPosition(ToggleOn, "Out", "Sine", 0.15, true)
					else
						toggle.Indicator:TweenPosition(ToggleOff, "Out", "Sine", 0.15, true)
					end
				end)
				
				ui.Ripple(new)
				ui.UpdateCanvasSize(p or ex)
				t.Callback(toggled)
				
				if t.Menu ~= nil then
					ui.InitMenu(t.Menu, new, {new.Toggle})
				end
				
				local a = {Destroyed = false}
				
				function a:SetText(text)
					if a.Destroyed then return end
					new.Text = text
				end
				function a:GetText()
					if a.Destroyed then return end
					return new.Text
				end
				function a:GetId()
					if a.Destroyed then return end
					return id
				end
				function a:SetState(value)
					if a.Destroyed then return end
					toggled = value
					toggle.Indicator.Position = (t.Enabled and UDim2new(0.5, 0, 0.5, 0)) or UDim2new(0, 0, 0.5, 0)
					t.Callback(value)
				end
				function a:GetState()
					if a.Destroyed then return end
					return toggled
				end
				function a:Destroy()
					if a.Destroyed then return end
					new:Destroy()
					a.Destroyed = true
				end
		
				return a
			end
		end
		
		do -- Dropdown
			function ui.Dropdown(t, p, ex)
				ID += 1
				local id = ID
				ApplyDefaultProps("Dropdown", t)
				
				local toggled = false
				local options = t.Options
				local amount = #options
				local selected = t.Def
				
				local new = ex.Dropdown:Clone()
				local dropdown = new.Dropdown
				new.Name = "Dropdown#"..id
				new.Parent = p or ex
				new.Visible = true
				new.Label.Text = t.Text
				new.Option.Text = t.Def
				
				local function refresh()
					for _,v in next, dropdown:GetChildren() do
						if v:IsA("TextButton") and v.Name ~= "Option" then
							v:Destroy()
						end
					end
					for _,v in next, options do
						if dropdown:FindFirstChild("Option") then
							local new2 = dropdown.Option:Clone()
							new2.Parent = dropdown
							new2.Visible = true
							new2.Name = v
							new2.Text = v
							new2.Activated:Connect(function()
								selected = v
								new.Option.Text = v
								ui.UpdateCanvasSize(p or ex)
								t.Callback(v)
							end)
		
							ui.Ripple(new2)
						end
					end
					if toggled then
						new:TweenSize(UDim2new(1, 0, 0, 30 + 5 + (35 * amount)), "Out", "Sine", 0.15, true)
						ui.UpdateCanvasSize(new.Parent)
					end
				end
				refresh()
				
				local list = dropdown.UIListLayout
				new.Button.Activated:Connect(function()
					toggled = not toggled
					if toggled then
						new.Fill.Visible = true
						new:TweenSize(UDim2new(1, 0, 0, 30 + 5 + (35 * amount)), "Out", "Sine", 0.15, true)
						ui.Tween(new.Indicator, {BackgroundColor3 = fromRGB(150, 250, 170)})
					else
						new.Fill.Visible = false
						new:TweenSize(UDim2new(1, 0, 0, 30), "Out", "Sine", 0.15, true)
						ui.Tween(new.Indicator, {BackgroundColor3 = fromRGB(250, 170, 75)})
					end
					ui.UpdateCanvasSize(new.Parent)
				end)
				
				ui.Ripple(new.Button, new.RippleHolder)
				ui.UpdateCanvasSize(p or ex)
				--t.Callback(selected)]]
				
				if t.Menu ~= nil then
					ui.InitMenu(t.Menu, new, {new.Option, new.Indicator})
				end
				
				local a = {Destroyed = false}
		
				function a:SetText(text)
					if a.Destroyed then return end
					new.Label.Text = text
				end
				function a:GetText()
					if a.Destroyed then return end
					return new.Label.Text
				end
				function a:GetId()
					if a.Destroyed then return end
					return id
				end
				function a:SetOptions(value)
					if a.Destroyed then return end
					options = value
					amount = #value
					refresh()
				end
				function a:GetOptions()
					if a.Destroyed then return end
					return options
				end
				function a:Destroy()
					if a.Destroyed then return end
					new:Destroy()
					a.Destroyed = false
				end
		
				return a
			end
		end
		
		do -- Text Box / Text Field
			function ui.TextBox(t, p, ex)
				ID += 1
				local id = ID
				ApplyDefaultProps("TextBox", t)
				
				local type = t.Type:lower()
				
				local new = ex.TextBox:Clone()
				local hidden = new.Hidden
				new.Name = "TextBox#"..id
				new.Parent = p or ex
				new.Visible = true
				new.PlaceholderText = t.Text
				new.ClearTextOnFocus = t.ClearOnFocus
				new.TextXAlignment = Enum.TextXAlignment[(t.Center and "Center" or "Left")]
				hidden.ClearTextOnFocus = t.ClearOnFocus
				new.Focused:Connect(function()
					local cursor = new.CursorPosition
					new:ReleaseFocus()
					hidden:CaptureFocus()
					hidden.CursorPosition = cursor
				end)
				hidden:GetPropertyChangedSignal("Text"):Connect(function()
					if type == "hidden" or type == "password" then
						new.Text = hidden.Text:gsub(".", "•")
					elseif type == "default" then
						new.Text = hidden.Text
					end
				end)
				hidden.FocusLost:Connect(function()
					t.Callback(hidden.Text)
				end)
				
				ui.Focus(hidden, new)
				ui.UpdateCanvasSize(p or ex)
				
				if t.Menu ~= nil then
					ui.InitMenu(t.Menu, new, {})
				end
				
				local a = {Destroyed = false}
		
				function a:SetText(text)
					if a.Destroyed then return end
					new.PlaceholderText = text
				end
				function a:GetText()
					if a.Destroyed then return end
					return new.PlaceholderText
				end
				function a:GetId()
					if a.Destroyed then return end
					return id
				end
				function a:Destroy()
					if a.Destroyed then return end
					new:Destroy()
					a.Destroyed = true
				end
		
				return a
			end
		end
		
		do -- Label
			function ui.Label(t, p, ex)
				ID += 1
				local id = ID
				ApplyDefaultProps("Label", t)
				
				local new = ex.Label:Clone()
				new.Name = "Label#"..id
				new.Parent = p or ex
				new.Visible = true
				new.Text = t.Text
				new.TextXAlignment = Enum.TextXAlignment[(t.Center and "Center" or "Left")]
				new.BackgroundTransparency = (t.Transparent and 1) or 0
				local conn
				conn = t.Event.Event:Connect(function(...)
					local args = {...}
					for i,v in next, args do
						args[i] = tostring(v)
						print(typeof(args[i]))
					end
					
					local suc, str = pcall(function()
						return table.concat(args, " ")
					end)
					
					if suc and str then
						new.Text = str
					else
						conn:Disconnect()
						error("Failed to convert value to string on Label #"..id)
					end
				end)
				
				ui.UpdateCanvasSize(p or ex)
				
				if t.Menu ~= nil then
					ui.InitMenu(t.Menu, new, {})
				end
				
				local a = {Destroyed = false}
		
				function a:SetText(text)
					if a.Destroyed then return end
					new.Text = text
				end
				function a:GetText()
					if a.Destroyed then return end
					return new.Text
				end
				function a:GetId()
					if a.Destroyed then return end
					return id
				end
				function a:Destroy()
					if a.Destroyed then return end
					new:Destroy()
					a.Destroyed = true
				end
		
				return a
			end
		end
		
		do -- Slider
			local function AddAffixes(value, t, ignore)
				if t.ReturnAsPercent then
					value = t.Max * (value / 100)
				end
				if t.ReturnAsAffixes or ignore then
					value = (t.Prefix or "")..value..(t.Suffix or "")
				end
				return value
			end
			
			local SLIDER_TWEEN_TIME = 0.05
			local SLIDER_SET_TWEEN_TIME = 0.4
			
			function ui.SetSliderValue(s, value, t)
				task.spawn(function()
					repeat
						taskwait()
					until UI_LOADED
					if not t then t = {} end
					local bar = s.Bar
					local indicator = bar.Indicator
					local max = t.Max or 100
		
					local pos = UDim2new(0, clamp(bar.AbsoluteSize.X / (max / value), 0, bar.AbsoluteSize.X), 0.5, 0)
					if t.Tween then
						indicator:TweenPosition(pos, "Out", "Sine", SLIDER_SET_TWEEN_TIME, true)
					else
						indicator.Position = pos
					end
					local afv = AddAffixes(value, t)
					s.Value.Text = AddAffixes(value, t, true)
					if s:FindFirstChild("Input") then
						s.Input.Text = value
					end
					indicator.AnchorPoint = Vector2new(value / max, 0.5)
					if t.Callback then
						t.Callback(afv)
					end
				end)
			end
			function ui.InitSlider(s, t, callback)
				if not t then t = {} end
				local bar = s.Bar
				local slider = bar.Slider
				local indicator = bar.Indicator
				local max = t.Max or 100
				local lastvalue = nil
				local lastpercent = nil
				
				local pre, suf = t.Prefix or "", t.Suffix or ""
				
				local conn;conn = slider.MouseButton1Down:Connect(function()
					mousedown = true
					while true do
						if not mousedown then break end
						
						local pos = clamp(mouse.X - bar.AbsolutePosition.X, 0, bar.AbsoluteSize.X)
						
						indicator.Position = UDim2new(
							0,
							clamp(mouse.X - bar.AbsolutePosition.X, 0, bar.AbsoluteSize.X),
							0.5,
							0
						)
						--indicator:TweenPosition(UDim2new(0, pos, 0.5, 0), "Out", "Sine", SLIDER_TWEEN_TIME, true)
						local value = Round((floor(indicator.Position.X.Offset / bar.AbsoluteSize.X * 1000) / 1000) * max, 0)
						local percent = (value / max)
						indicator.AnchorPoint = Vector2new(percent, 0.5)
						
						s.Value.Text = AddAffixes(value, t, true)
		
						lastvalue = value
						lastpercent = percent
						taskwait()
					end
					callback(s, lastvalue, lastpercent)
				end)
			end
			function ui.Slider(t, p, ex)
				ID += 1
				local id = ID
				ApplyDefaultProps("Slider", t)
				
				local toggled = t.Enabled
				local def, min, max = t.Def, t.Min, t.Max
				local lastvalue = t.Def
				local pre, suf = t.Prefix, t.Suffix
				
				local new = ex.Slider:Clone()
				local toggle = new.Toggle
				local indicator = toggle.Indicator
				local bar = new.Bar 
				local slider = bar.Indicator
				local val = new.Value
				local input = new.Input
				new.Name = "Slider#"..id
				new.Parent = p or ex
				new.Visible = true
				new.Label.Text = t.Text
				new.Value.Text = t.Def
				
				ui.SetSliderValue(new, def, t)
				ui.UpdateCanvasSize(p or ex)
				
				if t.Menu ~= nil then
					ui.InitMenu(t.Menu, new, (t.Toggle and t.Enabled and {new.Value, new.Toggle}) or {new.Value})
				end
				
				-- toggle stuff
				if not t.Toggle then
					toggle.Visible = false
					input.Position = UDim2new(1, 0, 0, 15)
					val.Position = UDim2new(1, -77, 0, 0)
				else
					if t.Enabled then
						indicator.Position = UDim2new(0.5, 0, 0.5, 0)
					end
					toggle.Button.Activated:Connect(function()
						toggled = not toggled
						t.ToggleCallback(toggled)
						if toggled then
							indicator:TweenPosition(ToggleOn, "Out", "Sine", 0.15, true)
						else
							indicator:TweenPosition(ToggleOff, "Out", "Sine", 0.15, true)
						end
					end)
				end
				
				t.Tween = true
				input.FocusLost:Connect(function() -- notes so i dont forget
					local a = input.Text:gsub("%a%p%s%c%x%z", "") -- Removes all letters (a), punctuation (p), spaces (s), hexadecimals (x), and null characters (z)
					if a == "" then return end -- If all characters were removed, end thread
					
					local value = a:gsub("%D", "") -- Removes all other characters except for numbers
					value = tonumber(value) -- Convert to number
					
					if a:match("%%$") then -- Checks if last character is a %
						value = max * (value / 100)
					end
					
					value = clamp(value, min, max)
					ui.SetSliderValue(new, value, t)
				end)
				
				-- slider stuff
				ui.InitSlider(new, t, function(self, value, percent)
					lastvalue = value
					val.Text = AddAffixes(value, t, true)
					input.Text = value
					t.Callback(AddAffixes(value, t))
				end)
				
				local a = {Destroyed = false}
		
				function a:SetText(text)
					if a.Destroyed then return end
					new.Label.Text = text
				end
				function a:GetText()
					if a.Destroyed then return end
					return new.Label.Text
				end
				function a:GetId()
					if a.Destroyed then return end
					return id
				end
				function a:SetMin(value)
					if a.Destroyed then return end
					min = value
				end
				function a:SetMax(value)
					if a.Destroyed then return end
					max = value
				end
				function a:SetValue(value)
					if a.Destroyed then return end
					lastvalue = value
					val.Text = AddAffixes(value, t)
					t.Callback(value)
				end
				function a:GetMin()
					if a.Destroyed then return end
					return min
				end
				function a:GetMax()
					if a.Destroyed then return end
					return max
				end
				function a:Destroy()
					if a.Destroyed then return end
					new:Destroy()
					a.Destroyed = true
				end
		
				return a
			end
		end
		
		do -- Color Picker
			function ui.SetPickerPreview(s, color, tween, toggled)
				s.Color.Text = format("%s, %s, %s", floor(color.R * 255), floor(color.G * 255), floor(color.B * 255))
				s.Preview.BackgroundColor3 = color
				if toggled then
					local hue, sat, val = color:ToHSV()
					s.Picker.Saturation.Bar.UIGradient.Color = CSnew{
						CSKnew(0, Color3new(val, val, val)),
						CSKnew(1, fromHSV(hue, 1, 1))
					}
					ui.SetSliderValue(s.Picker.Hue, floor(hue * 360), {Tween = tween, Max = 360})
					ui.SetSliderValue(s.Picker.Saturation, floor(sat * 100), {Tween = tween})
					ui.SetSliderValue(s.Picker.Value, floor(val * 100), {Tween = tween})
				end
			end
			function ui.ColorPicker(t, p, ex)
				ID += 1
				local id = ID
				ApplyDefaultProps("ColorPicker", t)
				
				if t.Default ~= nil then
					t.Def = t.Default
				end
		
				local toggled = false
				local color = t.Def
				local hue, sat, val = color:ToHSV()
		
				local new = ex.ColorPicker:Clone()
				local picker = new.Picker
				new.Name = "ColorPicker#"..id
				new.Parent = p or ex
				new.Visible = true
				new.Label.Text = t.Text
				new.Color.Text = format("%s, %s, %s", floor(color.R * 255), floor(color.G * 255), floor(color.B * 255))
				new.Preview.BackgroundColor3 = color
				
				ui.SetSliderValue(picker.Hue, floor(hue * 360), {Max = 360})
				ui.SetSliderValue(picker.Saturation, floor(sat * 100))
				ui.SetSliderValue(picker.Value, floor(val * 100))
				
				-- dropdown
				new.Button.Activated:Connect(function()
					toggled = not toggled
					if toggled then
						new.Fill.Visible = true
						new:TweenSize(UDim2new(1, 0, 0, 135), "Out", "Sine", 0.15, true)
					else
						new.Fill.Visible = false
						new:TweenSize(UDim2new(1, 0, 0, 30), "Out", "Sine", 0.15, true)
					end
					ui.UpdateCanvasSize(new.Parent)
				end)
				
				-- HSV bars
				ui.InitSlider(picker.Hue, {Max = 360}, function(_, value, percent)
					hue = percent
					ui.SetPickerPreview(new, fromHSV(hue, sat, val), false)
					t.Callback(fromHSV(hue, sat, val))
				end)
				ui.InitSlider(picker.Saturation, {Max = 100}, function(_, _, percent)
					sat = percent
					ui.SetPickerPreview(new, fromHSV(hue, sat, val), false)
					t.Callback(fromHSV(hue, sat, val))
				end)
				ui.InitSlider(picker.Value, {Max = 100}, function(_, _, percent)
					val = percent
					ui.SetPickerPreview(new, fromHSV(hue, sat, val), false)
					t.Callback(fromHSV(hue, sat, val))
				end)
				
				-- custom section
				local hex = picker.Custom.HEX
				local rgb = picker.Custom.RGB
				local rainbow = picker.Custom.Rainbow
				hex.FocusLost:Connect(function()
					local suc, color = pcall(Color3.fromHex, hex.Text)
					if suc then
						ui.SetPickerPreview(new, color, true)
						t.Callback(color)
					end
				end)
				rgb.FocusLost:Connect(function()
					local _, amount = rgb.Text:gsub(",", ",")
					if amount == 2 then
						local color = rgb.Text:gsub(" ",""):split(",")
						for i,v in next, color do
							color[i] = clamp(tonumber(v), 0, 255)
						end
						color = fromRGB(color[1], color[2], color[3])
						ui.SetPickerPreview(new, color, true)
						t.Callback(color)
					end
				end)
				local rgbenabled = t.Rainbow
				rainbow.Activated:Connect(function()
					rgbenabled = not rgbenabled
				end)
				
				ui.Ripple(new.Button, new.RippleHolder)
				ui.Ripple(picker.Custom.Rainbow)
				ui.Focus(picker.Custom.HEX)
				ui.Focus(picker.Custom.RGB)
				ui.UpdateCanvasSize(p or ex)
				t.Callback(color)
				
				if t.Menu ~= nil then
					ui.InitMenu(t.Menu, new, {new.Color, new.Preview})
				end
				
				task.spawn(function()
					while true do
						if rgbenabled then
							local c = fromHSV(tick() % 5 / 5, 1, 1)
							t.Callback(c)
							ui.SetPickerPreview(new, c, false, toggled)
						end
						taskwait()
					end
				end)
				
				local a = {Destroyed = false}
		
				function a:SetText(text)
					if a.Destroyed then return end
					new.Label.Text = text
				end
				function a:GetText()
					if a.Destroyed then return end
					return new.Label.Text
				end
				function a:GetId()
					if a.Destroyed then return end
					return id
				end
				function a:SetColor(value)
					if a.Destroyed then return end
					color = value
					hue, sat, val = value:ToHSV()
					ui.SetPickerPreview(new, color, true)
					t.Callback(value)
				end
				function a:GetColor()
					if a.Destroyed then return end
					return fromHSV(hue, sat, val)
				end
				function a:Destroy()
					if a.Destroyed then return end
					new:Destroy()
					a.Destroyed = true
				end
		
				return a
			end
		end
		
		do -- Keybind
			local ignore = {
				"None",
				"MouseMovement",
				"Focus"
			}
			function ui.SetBindLabel(b, bind)
				b.Bind.Label.Text = (typeof(bind) == "EnumItem" and bind.Name) or bind
				b.Bind:TweenSize(UDim2new(0, b.Bind.Label.TextBounds.X + 26, 0, 20), "Out", "Sine", 0.125, true)
			end
			function ui.Keybind(t, p, ex)
				ID += 1
				local id = ID
				ApplyDefaultProps("Keybind", t)
				
				local listening = false
				local keybind = t.Def
		
				local new = ex.Keybind:Clone()
				new.Name = "Keybind#"..id
				new.Parent = p or ex
				new.Visible = true
				new.Text = t.Text
				ui.SetBindLabel(new, keybind)
				
				new.Activated:Connect(function()
					if not listening then
						listening = true
						ui.SetBindLabel(new, ". . .")
						
						local conn;conn = uis.InputBegan:Connect(function(i)
							local keyboard = i.UserInputType.Name == "Keyboard"
							local mouse = i.UserInputType.Name:find("Mouse")
							local bind = (keyboard and i.KeyCode) or (mouse and i.UserInputType)
							if (t.AllowKeyboard and keyboard and i.KeyCode.Name ~= "Unknown") or (t.AllowMouse and mouse and not table.find(ignore, i.UserInputType.Name)) then
								t.Callback(bind)
								ui.SetBindLabel(new, bind)
								keybind = bind
								listening = false
								conn:Disconnect()
							end
						end)
					end
				end)
				
				ui.Ripple(new)
				ui.UpdateCanvasSize(p or ex)
				t.Callback(t.Def)
				
				if t.Menu ~= nil then
					ui.InitMenu(t.Menu, new, {new.Bind})
				end
				
				local a = {Destroyed = false}
		
				function a:SetText(text)
					if a.Destroyed then return end
					new.Text = text
				end
				function a:GetText()
					if a.Destroyed then return end
					return new.Text
				end
				function a:GetId()
					if a.Destroyed then return end
					return id
				end
				function a:SetBind(value)
					if a.Destroyed then return end
					keybind = value
					new.Bind.Label.Text = value.Name
					t.Callback(value)
				end
				function a:GetBind()
					if a.Destroyed then return end
					return keybind
				end
				function a:Destroy()
					if a.Destroyed then return end
					new:Destroy()
					a.Destroyed = true
				end
		
				return a
			end
		end
		
		do -- Chip Set / Data Table
			function ui.ChipSet(t, p, ex)
				ID += 1
				local id = ID
				ApplyDefaultProps("ChipSet", t)
		
				local toggled = false
				local amount = 0
				local data = t.Options
				
				for i,v in next, t.Options do
					amount += 1
					if typeof(v) == "table" then
						data[i] = v.Enabled
					end
				end
				table.sort(t.Options, function(a,b)
					return a < b
				end)
		
				local new = ex.ChipSet:Clone()
				local dropdown = new.Dropdown
				new.Name = "ChipSet#"..id
				new.Parent = p or ex
				new.Visible = true
				new.Label.Text = t.Text
				
				local function refresh()
					for _,v in next, dropdown:GetChildren() do
						if v:IsA("Frame") and v.Name ~= "Option" then
							v:Destroy()
						end
					end
					for i,v in next, data do
						if dropdown:FindFirstChild("Option") then
							local name = i
							local enabled = true
							local menu = false
							if typeof(v) == "table" then
								enabled = v.Enabled
								menu = v.Menu ~= nil
							else
								enabled = v
							end
							local new2 = dropdown.Option:Clone()
							new2.Parent = dropdown
							new2.Visible = true
							new2.Name = i
							new2.Enabled.Image = (enabled and ENABLED_IMAGE) or DISABLED_IMAGE
							new2.Button.Text = i
							local function activated()
								enabled = not enabled
								new2.Enabled.Image = (enabled and ENABLED_IMAGE) or DISABLED_IMAGE
								ui.UpdateCanvasSize(p or ex)
								t.Callback(data)
							end
							new2.Enabled.Activated:Connect(activated)
							new2.Button.Activated:Connect(activated)
		
							ui.Ripple(new2.Enabled, new2.Button)
							ui.Ripple(new2.Button)
							
							if menu then
								ui.InitMenu(v.Menu, new2, {})
							end
						end
					end
					if toggled then
						new:TweenSize(UDim2new(1, 0, 0, 30 + 5 + (35 * amount)), "Out", "Sine", 0.15, true)
						ui.UpdateCanvasSize(new.Parent)
					end
				end
				refresh()
		
				local list = dropdown.UIListLayout
				new.Button.Activated:Connect(function()
					toggled = not toggled
					if toggled then
						new.Fill.Visible = true
						new:TweenSize(UDim2new(1, 0, 0, 30 + 5 + (35 * amount)), "Out", "Sine", 0.15, true)
						ui.Tween(new.Indicator, {BackgroundColor3 = fromRGB(150, 250, 170)})
					else
						new.Fill.Visible = false
						new:TweenSize(UDim2new(1, 0, 0, 30), "Out", "Sine", 0.15, true)
						ui.Tween(new.Indicator, {BackgroundColor3 = fromRGB(250, 170, 75)})
					end
					ui.UpdateCanvasSize(new.Parent)
				end)
				
				ui.UpdateCanvasSize(p or ex)
				ui.Ripple(new.Button, new.RippleHolder)
				t.Callback(data)
				
				if t.Menu ~= nil then
					ui.InitMenu(t.Menu, new, {new.Indicator})
				end
				
				local a = {Destroyed = false}
		
				function a:SetText(text)
					if a.Destroyed then return end
					new.Label.Text = text
				end
				function a:GetText()
					if a.Destroyed then return end
					return new.Label.Text
				end
				function a:GetId()
					if a.Destroyed then return end
					return id
				end
				function a:SetData(value)
					if a.Destroyed then return end
					table.sort(value, function(a,b)
						return a < b
					end)
					data = value
					amount = 0
					for i,v in next, value do
						amount += 1
						if typeof(v) == "table" then
							data[i] = v.Enabled
						end
					end
					t.Callback(value)
					refresh()
				end
				function a:GetData()
					if a.Destroyed then return end
					return data
				end
				function a:Destroy()
					if a.Destroyed then return end
					new:Destroy()
					a.Destroyed = true
				end
		
				return a
			end
		end
		
		do -- Table
			function ui.Table(t, p, ex)
				ID += 1
				local id = ID
				ApplyDefaultProps("Table", t)
		
				local toggled = false
				local data = t.Data
				local amount = 0
				
				for _,_ in next, data do
					amount += 1
				end
				table.sort(data, function(a,b)
					return a < b
				end)
		
				local new = ex.Table:Clone()
				local dropdown = new.Dropdown
				new.Name = "Table#"..id
				new.Parent = p or ex
				new.Visible = true
				new.Label.Text = t.Text
				dropdown.Info.Visible = t.ShowInfo
				dropdown.Info.Key.Text = t.Key
				dropdown.Info.Value.Text = t.Value
		
				local function refresh()
					for _,v in next, dropdown:GetChildren() do
						if v:IsA("Frame") and v.Name ~= "Info" then
							v:Destroy()
						end
					end
					for i,v in next, data do
						if dropdown:FindFirstChild("Info") then
							local new2 = dropdown.Info:Clone()
							new2.Parent = dropdown
							new2.Visible = true
							new2.Name = "DATA_"..i
							new2.Key.Text = tostring(i)
							new2.Value.Text = tostring(v)
						end
					end
					if toggled then
						new:TweenSize(UDim2new(1, 0, 0, 30 + 5 + (35 * (amount + (t.ShowInfo and 1 or 0)))), "Out", "Sine", 0.15, true)
						ui.UpdateCanvasSize(new.Parent)
					end
				end
				refresh()
		
				local list = dropdown.UIListLayout
				new.Button.Activated:Connect(function()
					toggled = not toggled
					if toggled then
						new.Fill.Visible = true
						new:TweenSize(UDim2new(1, 0, 0, 30 + 5 + (35 * (amount + (t.ShowInfo and 1 or 0)))), "Out", "Sine", 0.15, true)
						ui.Tween(new.Indicator, {BackgroundColor3 = fromRGB(150, 250, 170)})
					else
						new.Fill.Visible = false
						new:TweenSize(UDim2new(1, 0, 0, 30), "Out", "Sine", 0.15, true)
						ui.Tween(new.Indicator, {BackgroundColor3 = fromRGB(250, 170, 75)})
					end
					ui.UpdateCanvasSize(new.Parent)
				end)
		
				ui.Ripple(new.Button, new.RippleHolder)
				ui.UpdateCanvasSize(p or ex)
		
				if t.Menu ~= nil then
					ui.InitMenu(t.Menu, new, {new.Option, new.Indicator})
				end
		
				local a = {Destroyed = false}
		
				function a:SetText(text)
					if a.Destroyed then return end
					new.Label.Text = text
				end
				function a:GetText()
					if a.Destroyed then return end
					return new.Label.Text
				end
				function a:GetId()
					if a.Destroyed then return end
					return id
				end
				function a:SetData(value)
					if a.Destroyed then return end
					table.sort(value, function(a,b)
						return a < b
					end)
					data = value
					amount = 0
					for _,_ in next, value do
						amount += 1
					end
					refresh()
				end
				function a:GetData()
					if a.Destroyed then return end
					return data
				end
				function a:Destroy()
					if a.Destroyed then return end
					new:Destroy()
					a.Destroyed = true
				end
		
				return a
			end
		end
		
		return ui
	end
	fake_module_scripts[script] = module_script
	library = module_script()
end

getgenv().MLRemake = library
return library
