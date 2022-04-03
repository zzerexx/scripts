local region, ping, fps = Drawing.new("Text"), Drawing.new("Text"), Drawing.new("Text")

region.Visible = true
region.Transparency = 1
region.Color = Color3.fromRGB(255,255,255)
region.Size = 24
region.Center = false
region.Outline = true
region.OutlineColor = Color3.fromRGB(0,0,0)
region.Position = Vector2.new(110, 8)
region.Font = Drawing.Fonts.UI
region.Text = "Server Region: Unknown"

ping.Visible = true
ping.Transparency = 1
ping.Color = Color3.fromRGB(255,255,255)
ping.Size = 24
ping.Center = false
ping.Outline = true
ping.OutlineColor = Color3.fromRGB(0,0,0)
ping.Position = Vector2.new(330, 8)
ping.Font = Drawing.Fonts.UI
ping.Text = "Ping: 100ms"

fps.Visible = true
fps.Transparency = 1
fps.Color = Color3.fromRGB(255,255,255)
fps.Size = 24
fps.Center = false
fps.Outline = true
fps.OutlineColor = Color3.fromRGB(0,0,0)
fps.Position = Vector2.new(445, 8)
fps.Font = Drawing.Fonts.UI
fps.Text = "FPS: 0"


local Network = game:GetService("NetworkClient")
local Stats = game:GetService("Stats")
local Http = game:GetService("HttpService")

-- Server Region
Network.ConnectionAccepted:Connect(function(server)
	local data = Http:JSONDecode(game:HttpGet(string.format("https://ipinfo.io/%s/json", server:split("|")[1])))
	region.Text = "Server Region: "..string.format("%s/%s", data.country, data.region)
end)

game.Loaded:Wait()

-- Ping
ping.Position = Vector2.new(region.Position.X + region.TextBounds.X + 30, 8)
task.spawn(function()
	while true do
		local p = tonumber(string.split(Stats:WaitForChild("Network"):WaitForChild("ServerStatsItem"):WaitForChild("Data Ping"):GetValueString(), " ")[1])
		if p ~= nil then
			ping.Text = "Ping: "..math.floor(p).."ms"
		end
		task.wait(1)
	end
end)

-- FPS
fps.Position = Vector2.new(ping.Position.X + ping.TextBounds.X + 30, 8)
local _fps = 0
game:GetService("RunService").RenderStepped:Connect(function()
	fps.Text = "FPS: ".._fps
	_fps += 1
	task.wait(1)
	_fps -= 1
end)
