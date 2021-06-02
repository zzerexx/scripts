local mt = getrawmetatable(game)
local oldnc = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(self,...)
    local args = {...}
    if getnamecallmethod() == "FindFirstChild" and args[2] and args[2] == true then
        return false
    end
    return oldnc(self,...)
end)
setreadonly(mt, true)
getconnections(game.DescendantAdded)[1]:Disable()

local CustomOutput = Instance.new("ScreenGui")
local Topbar = Instance.new("Frame")
local Background = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Log = Instance.new("ScrollingFrame")
local Example = Instance.new("TextLabel")
local UIListLayout = Instance.new("UIListLayout")
local Buttons = Instance.new("Frame")
local UIListLayout_2 = Instance.new("UIListLayout")
local Output = Instance.new("TextButton")
local Icon = Instance.new("ImageLabel")
local Info = Instance.new("TextButton")
local Icon_2 = Instance.new("ImageLabel")
local Warning = Instance.new("TextButton")
local Icon_3 = Instance.new("ImageLabel")
local Error = Instance.new("TextButton")
local Icon_4 = Instance.new("ImageLabel")
local Search = Instance.new("Frame")
local Box = Instance.new("TextBox")
local Search_2 = Instance.new("ImageButton")
local Clear = Instance.new("TextButton")
local Close = Instance.new("ImageButton")

--Properties:

CustomOutput.Name = "CustomOutput"
CustomOutput.Parent = game.CoreGui
CustomOutput.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
CustomOutput.DisplayOrder = 1000
CustomOutput.ResetOnSpawn = false

Topbar.Name = "Topbar"
Topbar.Parent = CustomOutput
Topbar.Active = true
Topbar.AnchorPoint = Vector2.new(0.5, 0.5)
Topbar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Topbar.BackgroundTransparency = 0.800
Topbar.BorderSizePixel = 0
Topbar.Position = UDim2.new(0.5, 0, 0.15, 0)
Topbar.Size = UDim2.new(0, 700, 0, 30)
Topbar.Visible = true

Background.Name = "Background"
Background.Parent = Topbar
Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Background.BackgroundTransparency = 0.600
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0, -10, 0, -10)
Background.Size = UDim2.new(0, 720, 0, 500)
Background.ZIndex = 0

Title.Name = "Title"
Title.Parent = Topbar
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderSizePixel = 0
Title.Size = UDim2.new(0, 175, 0, 30)
Title.ZIndex = 2
Title.Font = Enum.Font.Gotham
Title.Text = "   Developer Console"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14.000
Title.TextXAlignment = Enum.TextXAlignment.Left

Log.Name = "Log"
Log.Parent = Topbar
Log.Active = true
Log.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Log.BackgroundTransparency = 1.000
Log.BorderSizePixel = 0
Log.Position = UDim2.new(0, 0, 0, 80)
Log.Size = UDim2.new(0, 700, 0, 400)
Log.ScrollBarThickness = 8

Example.Name = "Example"
Example.Parent = Log
Example.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Example.BackgroundTransparency = 1.000
Example.BorderSizePixel = 0
Example.Size = UDim2.new(0, 695, 0, 18)
Example.Visible = false
Example.Font = Enum.Font.Code
Example.Text = "00:00:00 -- Example"
Example.TextColor3 = Color3.fromRGB(255, 255, 255)
Example.TextSize = 15.000
Example.TextWrapped = true
Example.TextXAlignment = Enum.TextXAlignment.Left

UIListLayout.Parent = Log
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

Buttons.Name = "Buttons"
Buttons.Parent = Topbar
Buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Buttons.BackgroundTransparency = 1.000
Buttons.BorderSizePixel = 0
Buttons.Position = UDim2.new(0, 0, 0, 45)
Buttons.Size = UDim2.new(0, 345, 0, 20)

UIListLayout_2.Parent = Buttons
UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0, 10)

Output.Name = "Output"
Output.Parent = Buttons
Output.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Output.BackgroundTransparency = 1.000
Output.BorderSizePixel = 0
Output.Size = UDim2.new(0, 75, 0, 20)
Output.Font = Enum.Font.Gotham
Output.Text = "Output"
Output.TextColor3 = Color3.fromRGB(255, 255, 255)
Output.TextSize = 13.000
Output.TextXAlignment = Enum.TextXAlignment.Right

Icon.Name = "Icon"
Icon.Parent = Output
Icon.BackgroundColor3 = Color3.fromRGB(50, 181, 255)
Icon.BorderColor3 = Color3.fromRGB(255, 255, 255)
Icon.BorderSizePixel = 0
Icon.Size = UDim2.new(0, 20, 0, 20)
Icon.Image = "rbxasset://textures/ui/LuaChat/icons/ic-check.png"

Info.Name = "Info"
Info.Parent = Buttons
Info.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Info.BackgroundTransparency = 1.000
Info.BorderSizePixel = 0
Info.Size = UDim2.new(0, 100, 0, 20)
Info.Font = Enum.Font.Gotham
Info.Text = "Information"
Info.TextColor3 = Color3.fromRGB(255, 255, 255)
Info.TextSize = 13.000
Info.TextXAlignment = Enum.TextXAlignment.Right

Icon_2.Name = "Icon"
Icon_2.Parent = Info
Icon_2.BackgroundColor3 = Color3.fromRGB(50, 181, 255)
Icon_2.BorderColor3 = Color3.fromRGB(255, 255, 255)
Icon_2.BorderSizePixel = 0
Icon_2.Size = UDim2.new(0, 20, 0, 20)
Icon_2.Image = "rbxasset://textures/ui/LuaChat/icons/ic-check.png"

Warning.Name = "Warning"
Warning.Parent = Buttons
Warning.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Warning.BackgroundTransparency = 1.000
Warning.BorderSizePixel = 0
Warning.Size = UDim2.new(0, 80, 0, 20)
Warning.Font = Enum.Font.Gotham
Warning.Text = "Warning"
Warning.TextColor3 = Color3.fromRGB(255, 255, 255)
Warning.TextSize = 13.000
Warning.TextXAlignment = Enum.TextXAlignment.Right

Icon_3.Name = "Icon"
Icon_3.Parent = Warning
Icon_3.BackgroundColor3 = Color3.fromRGB(50, 181, 255)
Icon_3.BorderColor3 = Color3.fromRGB(255, 255, 255)
Icon_3.BorderSizePixel = 0
Icon_3.Size = UDim2.new(0, 20, 0, 20)
Icon_3.Image = "rbxasset://textures/ui/LuaChat/icons/ic-check.png"

Error.Name = "Error"
Error.Parent = Buttons
Error.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Error.BackgroundTransparency = 1.000
Error.BorderSizePixel = 0
Error.Size = UDim2.new(0, 60, 0, 20)
Error.Font = Enum.Font.Gotham
Error.Text = "Error"
Error.TextColor3 = Color3.fromRGB(255, 255, 255)
Error.TextSize = 13.000
Error.TextXAlignment = Enum.TextXAlignment.Right

Icon_4.Name = "Icon"
Icon_4.Parent = Error
Icon_4.BackgroundColor3 = Color3.fromRGB(50, 181, 255)
Icon_4.BorderColor3 = Color3.fromRGB(255, 255, 255)
Icon_4.BorderSizePixel = 0
Icon_4.Size = UDim2.new(0, 20, 0, 20)
Icon_4.Image = "rbxasset://textures/ui/LuaChat/icons/ic-check.png"

Search.Name = "Search"
Search.Parent = Topbar
Search.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Search.BackgroundTransparency = 0.800
Search.BorderSizePixel = 0
Search.Position = UDim2.new(0, 500, 0, 40)
Search.Size = UDim2.new(0, 200, 0, 30)

Box.Name = "Box"
Box.Parent = Search
Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Box.BackgroundTransparency = 1.000
Box.BorderSizePixel = 0
Box.Position = UDim2.new(0, 40, 0, 0)
Box.Size = UDim2.new(0, 160, 0, 30)
Box.Font = Enum.Font.Gotham
Box.PlaceholderText = "Search"
Box.Text = ""
Box.TextColor3 = Color3.fromRGB(255, 255, 255)
Box.TextSize = 14.000
Box.TextXAlignment = Enum.TextXAlignment.Left

Search_2.Name = "Search"
Search_2.Parent = Search
Search_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Search_2.BackgroundTransparency = 1.000
Search_2.BorderSizePixel = 0
Search_2.Position = UDim2.new(0, 5, 0, 5)
Search_2.Size = UDim2.new(0, 20, 0, 20)
Search_2.AutoButtonColor = false
Search_2.Image = "rbxasset://textures/DevConsole/Search.png"

Clear.Name = "Clear"
Clear.Parent = Topbar
Clear.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Clear.BackgroundTransparency = 0.800
Clear.BorderSizePixel = 0
Clear.Position = UDim2.new(0, 355, 0, 40)
Clear.Size = UDim2.new(0, 135, 0, 30)
Clear.Font = Enum.Font.Gotham
Clear.Text = "Clear Output"
Clear.TextColor3 = Color3.fromRGB(255, 255, 255)
Clear.TextSize = 14.000

Close.Name = "Close"
Close.Parent = Topbar
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.BorderSizePixel = 0
Close.Position = UDim2.new(1, -22, 0, 9)
Close.Size = UDim2.new(0, 13, 0, 13)
Close.Image = "rbxasset://textures/DevConsole/Close.png"

-- Scripts:

local function FUZQ_fake_script() -- Topbar.MainScript 
	local script = Instance.new('LocalScript', Topbar)

	local UIS = game:GetService("UserInputService")
	local StarterGui = game:GetService("StarterGui")
	local LogService = game:GetService("LogService")
	
	script.Parent.Draggable = true
	script.Parent.Log.Example.AutomaticSize = Enum.AutomaticSize.Y
	
	UIS.InputBegan:Connect(function(i,gp)
		if i.KeyCode == Enum.KeyCode.F9 then
			StarterGui:SetCore("DevConsoleVisible", false)
			script.Parent.Visible = not script.Parent.Visible
		end
	end)
	
	script.Parent.Close.MouseButton1Click:Connect(function()
		script.Parent.Visible = false
	end)
	
	LogService.MessageOut:Connect(function(msg,msgtype)
		local new = script.Parent.Log.Example:Clone()
		new.Parent = script.Parent.Log
		new.Visible = true
		new.Name = "Output"
		new.Text = os.date():split(" ")[4].." -- "..msg:gsub("\n","\n            ")
		if msgtype == Enum.MessageType.MessageOutput then
			new.TextColor3 = Color3.fromRGB(255,255,255)
		elseif msgtype == Enum.MessageType.MessageInfo then
			new.TextColor3 = Color3.fromRGB(0,150,255)
			new.Name = "Info"
		elseif msgtype == Enum.MessageType.MessageWarning then
			new.TextColor3 = Color3.fromRGB(255,255,0)
			new.Name = "Warning"
		elseif msgtype == Enum.MessageType.MessageError then
			new.TextColor3 = Color3.fromRGB(255,0,0)
			new.Name = "Error"
		end
	end)
	
	script.Parent.Log.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		script.Parent.Log.CanvasSize = UDim2.new(0,0,0,script.Parent.Log.UIListLayout.AbsoluteContentSize.Y)
	end)
	
	local stuff = {
		Output = true,
		Info = true,
		Warning = true,
		Error = true
	}
	for i,v in next, script.Parent.Buttons:GetChildren() do
		if v:IsA("TextButton") then
			v.MouseButton1Click:Connect(function()
				stuff[v.Name] = not stuff[v.Name]
				if stuff[v.Name] then
					v.Icon.Image = "rbxasset://textures/ui/LuaChat/icons/ic-check.png"
					v.Icon.BackgroundColor3 = Color3.fromRGB(50,181,255)
					for i2,v2 in next, script.Parent.Log:GetChildren() do
						if v2.Name == v.Name then
							v2.Visible = true
						end
					end
				else
					v.Icon.Image = ""
					v.Icon.BackgroundColor3 = Color3.fromRGB(78,84,96)
					for i2,v2 in next, script.Parent.Log:GetChildren() do
						if v2.Name == v.Name then
							v2.Visible = false
						end
					end
				end
			end)
		end
	end
	
	script.Parent.Clear.MouseButton1Click:Connect(function()
		for i,v in next, script.Parent.Log:GetChildren() do
			if v:IsA("TextLabel") then
				v:Destroy()
			end
		end
	end)
	
	script.Parent.Search.Search.MouseButton1Click:Connect(function()
		if script.Parent.Search.Box.Text:gsub(" ","") ~= "" then
			for i,v in next, script.Parent.Log:GetChildren() do
				if v:IsA("TextLabel") then
					if string.match(v.Text,script.Parent.Search.Box.Text) and v.Name ~= "Example" then
						v.Visible = true
					else
						v.Visible = false
					end
				end
			end
		else
			for i,v in next, script.Parent.Log:GetChildren() do
				if v:IsA("TextLabel") then
					if v.Name ~= "Example" then
						v.Visible = true
					end
				end
			end
		end
	end)
end
coroutine.wrap(FUZQ_fake_script)()
