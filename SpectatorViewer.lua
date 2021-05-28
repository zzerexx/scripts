local SpectatorViewer = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local Example = Instance.new("TextLabel")

--Properties:

SpectatorViewer.Name = "SpectatorViewer"
SpectatorViewer.Parent = game.CoreGui
SpectatorViewer.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SpectatorViewer.DisplayOrder = 999999999
SpectatorViewer.ResetOnSpawn = false

Main.Name = "Main"
Main.Parent = SpectatorViewer
Main.Active = true
Main.AnchorPoint = Vector2.new(0.5, 0)
Main.AutomaticSize = Enum.AutomaticSize.XY
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, 0, 0, 10)
Main.Size = UDim2.new(0, 150, 0, 30)

UIListLayout.Parent = Main

Example.Name = "Example"
Example.Parent = Main
Example.AnchorPoint = Vector2.new(0.5, 0)
Example.AutomaticSize = Enum.AutomaticSize.X
Example.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Example.BackgroundTransparency = 1.000
Example.BorderSizePixel = 0
Example.Size = UDim2.new(0, 150, 0, 30)
Example.Font = Enum.Font.Gotham
Example.Text = "Player Name"
Example.TextColor3 = Color3.fromRGB(255, 255, 255)
Example.TextSize = 14.000
Example.Visible = false

-- Scripts:

local function LCIFE_fake_script() -- Main.LocalScript 
	local script = Instance.new('LocalScript', Main)

	script.Parent.Draggable = true
	
	local function GetSpectators()
		local CurrentSpectators = {}
	
		for i,v in pairs(game:GetService("Players"):GetChildren()) do 
			if v ~= game:GetService("Players").LocalPlayer then
				if not v.Character and v:FindFirstChild("CameraCF") and (v.CameraCF.Value.Position - workspace.CurrentCamera.CFrame.p).Magnitude < 10 then 
					table.insert(CurrentSpectators, #CurrentSpectators+1, v)
				end
			end
		end
	
		return CurrentSpectators
	end
	
	while wait(0.25) do
		for i,v in next, script.Parent:GetChildren() do
			if v.Name ~= "Example" and not v:IsA("UIListLayout") and not v:IsA("LocalScript") then
				v:Destroy()
			end
		end
		for i,v in next, GetSpectators() do
			local new = script.Parent.Example:Clone()
			new.Parent = script.Parent
			new.Visible = true
			new.Name = v.Name
			new.Text = v.Name
			new.TextColor3 = v.TeamColor.Color
		end
	end
end
coroutine.wrap(LCIFE_fake_script)()
