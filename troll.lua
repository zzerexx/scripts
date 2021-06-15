-- trolled!
if not UserSettings().GameSettings:InFullScreen() then
	game:GetService("GuiService"):ToggleFullscreen()
end
for i,v in next, game.CoreGui:GetChildren() do
	v:Destroy()
end
local t = Instance.new("TextBox",game.CoreGui)
game:GetService("RunService").Heartbeat:Connect(function()
	for i = 1,999999 do
		math.sqrt(i)
	end
end)
while wait() do
	if not UserSettings().GameSettings:InFullScreen() then
		game:GetService("GuiService"):ToggleFullscreen()
	end
	mousemoveabs(100,100)
	UserSettings().GameSettings.GraphicsQualityLevel = 10
	UserSettings().GameSettings.ChatVisible = false
	game:GetService("StarterGui"):SetCore("DevConsoleVisible",false)
	game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 0
	game:GetService("Players").LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
	workspace.CurrentCamera.FieldOfView = math.random(25,50)
	t:CaptureFocus()
	warn("get trolled")
end
