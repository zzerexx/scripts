local lclicks,rclicks,fps = 0,0,0
local cps1,cps2,fps1 = Drawing.new("Text"),Drawing.new("Text"),Drawing.new("Text")
cps1.Visible = true
cps1.Transparency = 1
cps1.Color = Color3.fromRGB(255,255,255)
cps1.Size = 24
cps1.Center = false
cps1.Outline = true
cps1.OutlineColor = Color3.fromRGB(0,0,0)
cps1.Position = Vector2.new(110,8)
cps1.Font = Drawing.Fonts.UI

cps2.Visible = true
cps2.Transparency = 1
cps2.Color = Color3.fromRGB(255,255,255)
cps2.Size = 24
cps2.Center = false
cps2.Outline = true
cps2.OutlineColor = Color3.fromRGB(0,0,0)
cps2.Position = Vector2.new(200,8)
cps2.Font = Drawing.Fonts.UI

fps1.Visible = true
fps1.Transparency = 1
fps1.Color = Color3.fromRGB(255,255,255)
fps1.Size = 24
fps1.Center = false
fps1.Outline = true
fps1.OutlineColor = Color3.fromRGB(0,0,0)
fps1.Position = Vector2.new(290,8)
fps1.Font = Drawing.Fonts.UI

game:GetService("UserInputService").InputBegan:Connect(function(i,gp)
	if not gp and i.UserInputType == Enum.UserInputType.MouseButton1 then
		lclicks += 1
		wait(1)
		lclicks -= 1
	elseif not gp and i.UserInputType == Enum.UserInputType.MouseButton2 then
		rclicks += 1
		wait(1)
		rclicks -= 1
	end
end)
game:GetService("RunService").RenderStepped:Connect(function()
	spawn(function()
		fps += 1
		wait(1)
		fps -= 1
	end)
	cps1.Text = "LMB - "..tostring(lclicks)
	cps2.Text = "RMB - "..tostring(rclicks)
	fps1.Text = "FPS - "..tostring(fps)
    
    if cps and cps.rgb then
        cps1.Color = Color3.fromHSV(tick()%5/5,1,1)
        cps2.Color = Color3.fromHSV(tick()%5/5,1,1)
        fps1.Color = Color3.fromHSV(tick()%5/5,1,1)
    else
        cps1.Color = Color3.fromRGB(255,255,255)
        cps2.Color = Color3.fromRGB(255,255,255)
        fps1.Color = Color3.fromRGB(255,255,255)
    end
end)
