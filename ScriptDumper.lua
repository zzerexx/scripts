return function(name,notify)
	if not (identifyexecutor or getexecutorname) or not decompile or not getscripts then
		return
	end
	if name == nil or name:gsub(" ","") == "" then
		name = "Scripts for "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
	end
	if notify == nil then
		notify = true
	end
	if isfolder(name) then
		delfolder(name)
	end
	if not isfolder(name) then
		makefolder(name)
	end
	local ignore = load("CoreScripts.lua")
	function round(num, numDecimalPlaces)
		return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
	end
	function GetFullName(script)
		return 'game:GetService("'..script:GetFullName():split(".")[1]..'")'..script:GetFullName():split(script:GetFullName():split(".")[1])[2]:gsub(game:GetService("Players").LocalPlayer.Name,"LocalPlayer")
	end
	local timer = tick()
	warn("Decompiling scripts...")
	for i,v in next, getscripts() do
		if not table.find(ignore,v.Name) then
			pcall(function()
				local timer2 = tick()
				writefile(
					name.."\\"..v.Parent.Name:gsub(game:GetService("Players").LocalPlayer.Name,"LocalPlayer").."."..v.Name.."_"..math.random(0,9)..math.random(0,9)..math.random(0,9)..math.random(0,9)..math.random(0,9)..math.random(0,9)..".lua",
					"-- Decompiled with the "..(identifyexecutor() or getexecutorname()).." decompiler\n-- Game: "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.." | "..game.PlaceId.."\n-- Path: "..GetFullName(v).."\n-- Type: "..v.ClassName.."\n\n"..decompile(v)
				)
				if notify then
					warn("Decompiled "..v.Parent.Name:gsub(game:GetService("Players").LocalPlayer.Name,"LocalPlayer").."."..v.Name.."! Took "..round(tick()-timer2,2).." seconds.")
				end
			end)
		end
	end
	warn("Successfully decompiled all scripts! Took "..round(tick()-timer,2).." seconds. Saved to Workspace\\"..name)

	local text = Drawing.new("Text")
	text.Visible = true
	text.Transparency = 1
	text.Color = Color3.fromRGB(255,255,255)
	text.Text = "Successfully decompiled all scripts! Took "..round(tick()-timer,2).." seconds. Saved to Workspace\\"..name
	text.Size = 36
	text.Center = true
	text.Outline = true
	text.OutlineColor = Color3.fromRGB(0,0,0)
	text.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2,workspace.CurrentCamera.ViewportSize.Y / 7.5)
	text.Font = Drawing.Fonts.UI
	wait(5)
	for i = 100,1,-1 do
		text.Transparency = i / 100
		game:GetService("RunService").RenderStepped:Wait()
	end
	text:Remove()
end
