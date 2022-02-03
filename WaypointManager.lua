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
local Close_2 = Instance.new("TextButton")
local LineEffect = Instance.new("Frame")

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
Main.ClipsDescendants = true
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
Title_2.Size = UDim2.new(0.699999988, 0, 0, 20)
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
Created.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Created.BackgroundTransparency = 1.000
Created.BorderSizePixel = 0
Created.ClipsDescendants = true
Created.Position = UDim2.new(1, 0, 0, 0)
Created.Size = UDim2.new(0.300000012, 0, 0, 12)
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
Ripple.ZIndex = 10

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
Modify_2.Size = UDim2.new(0, 250, 0, 190)
Modify_2.Visible = false
Modify_2.ZIndex = 5

Title_3.Name = "Title"
Title_3.Parent = Modify_2
Title_3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Title_3.BorderColor3 = Color3.fromRGB(100, 100, 100)
Title_3.Size = UDim2.new(1, 0, 0, 20)
Title_3.ZIndex = 6
Title_3.Font = Enum.Font.Gotham
Title_3.Text = "Title"
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

-- Scripts:

local function FRHQMD_fake_script() -- Buttons.ButtonsScript 
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
coroutine.wrap(FRHQMD_fake_script)()
local function MIWIMIK_fake_script() -- Main.Init 
	local script = Instance.new('LocalScript', Main)

	-- apply properties that gui to lua doesnt convert
	
	local main = script.Parent
	local scroll = main.Scroll
	local atend = Enum.TextTruncate.AtEnd
	
	scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scroll.Example.Title.TextTruncate = atend
	scroll.Example.Created.TextTruncate = atend
	scroll.Example:SetAttribute("Name", "Placeholder")
	scroll.Example:SetAttribute("Position", Vector3.new())
	scroll.Example:SetAttribute("Color", Color3.fromRGB(255,255,255))
	scroll.Example:SetAttribute("BeamWidth", 3)
	--scroll.Example:SetAttribute("Object", nil)
	
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
end
coroutine.wrap(MIWIMIK_fake_script)()
local function MTWZT_fake_script() -- Main.RippleEffect 
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
coroutine.wrap(MTWZT_fake_script)()
local function ZWBHD_fake_script() -- Main.Dragify 
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
			game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.1), {Position = Position}):Play()
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
coroutine.wrap(ZWBHD_fake_script)()
local function UTBMBXX_fake_script() -- Main.Waypoints 
	local script = Instance.new('LocalScript', Main)

	local folder = Instance.new("Folder", workspace)
	folder.Name = ""
	for _ = 1, math.random(8,16) do
		folder.Name = folder.Name..string.char(math.random(97, 122))
	end
	script.Parent:SetAttribute("Folder", folder.Name)
	
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
		Label.TextColor3 = Color3.fromRGB(255, 255, 255)
		Label.TextSize = 18 
		Label.TextStrokeTransparency = 0 
		
		return Model
	end
	
	local mod = script.Parent.Modify
	local player = game:GetService("Players").LocalPlayer
	local id = 1
	script.Parent.Create.Activated:Connect(function()
		if player.Character == nil then return end
		local name = "Waypoint "..id
		local pos = player.Character:GetPivot().Position
		local color = Color3.fromRGB(255,255,255)
		local width = 3
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
		
		new:SetAttribute("Name", name)
		new:SetAttribute("Position", pos)
		new:SetAttribute("Color", color)
		new:SetAttribute("BeamWidth", width)
		--new:SetAttribute("Object", m)
		
		new.Buttons.Teleport.Activated:Connect(function()
			if player.Character ~= nil then
				player.Character:MoveTo(new:GetAttribute("Position"))
			end
		end)
		new.Buttons.Modify.Activated:Connect(function()
			mod.Visible = true
			mod.Title.Text = new:GetAttribute("Name")
			mod:SetAttribute("Listener", new.Name)
			-- do shit
		end)
		new.Buttons.Delete.Activated:Connect(function()
			folder[new.Name]:Destroy()
			new:Destroy()
		end)
		
		id += 1
	end)
end
coroutine.wrap(UTBMBXX_fake_script)()
local function XFYDBC_fake_script() -- Content.Modifier 
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
			mod.Title.Text = t
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
end
coroutine.wrap(XFYDBC_fake_script)()
local function RVGFBQP_fake_script() -- Main.TextBoxEffect 
	local script = Instance.new('LocalScript', Main)

	local ts = game:GetService("TweenService")
	local uis = game:GetService("UserInputService")
	local duration = 0.25
	local line = script.Parent.LineEffect
	local sine = Enum.EasingStyle.Sine
	local out = Enum.EasingDirection.Out
	local info = TweenInfo.new(duration, sine, out)
	
	function addeffect(a)
		local targetsize = UDim2.new(1, 2, 0, 1)
		
		local new = line:Clone()
		new.Parent = a
		new.Visible = true
		
		ts:Create(new, info, {Size = targetsize}):Play()
	end
	function removeeffect(a)
		local obj = a.LineEffect
		local targetsize = UDim2.new(0, 0, 0, 1)
		
		ts:Create(obj, info, {Size = targetsize, Transparency = 1}):Play()
		
		task.wait(duration)
		
		obj:Destroy()
	end
	
	uis.TextBoxFocused:Connect(addeffect)
	uis.TextBoxFocusReleased:Connect(removeeffect)
end
coroutine.wrap(RVGFBQP_fake_script)()
