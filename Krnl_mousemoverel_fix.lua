function getwindowinset()
	if UserSettings():GetService("UserGameSettings").Fullscreen then
		return 0
	end
	repeat task.wait() until isrbxactive()
	local viewport = workspace.CurrentCamera.ViewportSize
	local text = Drawing.new("Text")
	text.Visible = true
	text.Color = Color3.fromRGB(255,0,0)
	text.Text = "Getting your window inset in 5s...\nPlease do not move your mouse."
	text.Size = 64
	text.Center = true
	text.Outline = true
	text.OutlineColor = Color3.fromRGB(0,0,0)
	text.Position = Vector2.new(viewport.X / 2, viewport.Y / 5)
	text.Font = Drawing.Fonts.UI

	task.wait(5)

	local pos, clicked = 0, false
	local gui = Instance.new("ScreenGui")
	gui.IgnoreGuiInset = true
	gui.Parent = gethui()
	local button = Instance.new("TextButton")
	button.BackgroundTransparency = 1
	button.Size = UDim2.new(1,0,1,0)
	button.Text = ""
	button.Parent = gui
	local conn;conn = button.MouseButton2Click:Connect(function()
		task.spawn(function()
			clicked = true
			text.Color = Color3.fromRGB(0,255,0)
			text.Text = "Successfully retrieved your window inset. ("..pos..")"
			task.wait(3)
			text:Remove()
			gui:Destroy()
			conn:Disconnect()
		end)
	end)

	local function move()
		mousemoveabs(0, pos)
		mouse2click()
		mousemoverel(200,0)
		mouse2click()
		pos += 1
	end
	repeat
		move()
		task.wait()
	until clicked
	return pos
end

local uis = game:GetService("UserInputService")
local mouse = uis:GetMouseLocation()
local inset = getwindowinset()

hookfunction(mousemoverel, function(x,y)
	mouse = uis:GetMouseLocation()

	mousemoveabs(mouse.X + x, inset + mouse.Y + y)
end)
