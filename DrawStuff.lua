local uis = game:GetService("UserInputService")
local mouse = uis:GetMouseLocation()
local camera = workspace.CurrentCamera

-- variables
local down = false
local ctrldown = false
local shiftdown = false
local zdown = false
local filled = false

-- enums
local mb1 = Enum.UserInputType.MouseButton1
local m = Enum.KeyCode.M
local f = Enum.KeyCode.F
local c = Enum.KeyCode.C
local z = Enum.KeyCode.Z
local g = Enum.KeyCode.G
local s = Enum.KeyCode.S
local lctrl = Enum.KeyCode.LeftControl
local lshift = Enum.KeyCode.LeftShift
local aup, adown, aleft, aright = Enum.KeyCode.U, Enum.KeyCode.J, Enum.KeyCode.H, Enum.KeyCode.K 

-- aliases
local taskwait = task.wait
local Vector2new = Vector2.new
local insert = table.insert
local remove = table.remove
local dnew = Drawing.new

-- remove previous shit
if DRAW then
	DRAW:Destroy()
end

-- more shit
local drawings = {}
function applytextprops(v)
	v.Visible = true
	v.Transparency = 1
	v.Color = Color3.fromRGB(255,255,255)
	v.ZIndex = 3
	v.Size = 24
	v.Center = false
	v.Outline = true
	v.OutlineColor = Color3.fromRGB(0,0,0)
	v.Font = Drawing.Fonts.UI
end
local YPOS = 56
local mode, fill, color, undo, adjust, gridt, removeall, coords = dnew("Text"), dnew("Text"), dnew("Text"), dnew("Text"), dnew("Text"), dnew("Text"), dnew("Text"), dnew("Text")
for _,v in next, {mode,fill,color,undo,adjust,gridt,removeall} do
	applytextprops(v)
	v.Position = Vector2new(20,YPOS)
	YPOS += 30
	insert(drawings,v)
end
mode.Text = "Mode: Line (CTRL + M)"
fill.Text = "Fill: false (CTRL + F)"
color.Text = "Color: White (CTRL + C)"
adjust.Text = "Micro Adjust: U, H, J, K"
gridt.Text = "Grid: false (CTRL + G)"
undo.Text = "Undo: CTRL + Z"
removeall.Text = "Remove Drawings: CTRL + SHIFT + Z"

applytextprops(coords)
coords.Text = "X: N/A | Y: N/A"
coords.Size = 16

-- pointer shit
local pl, pr, pt, pb = dnew("Square"), dnew("Square"), dnew("Square"), dnew("Square")
for _,v in next, {pl,pr,pt,pb} do
	v.Visible = true
	v.Transparency = 1
	v.Color = Color3.fromRGB(150,150,150)
	v.Thickness = 1
	v.ZIndex = 2
	insert(drawings,v)
end
pl.Size = Vector2new(10,2)
pr.Size = Vector2new(10,2)
pt.Size = Vector2new(2,10)
pb.Size = Vector2new(2,10)

-- stuff shit
local objhistory = {}
local values = {
	[1] = "Line",
	[2] = "Square",
	[3] = "Circle",
}
local t = 1

-- color shit
local colornames = {
	[1] = "White",
	[2] = "Black",
	[3] = "Red",
	[4] = "Orange",
	[5] = "Yellow",
	[6] = "Green",
	[7] = "Cyan",
	[8] = "Blue",
	[9] = "Magenta",
	[10] = "Purple",
	[11] = "Pink"
}
local colors = {
	[1] = Color3.fromRGB(255,255,255),
	[2] = Color3.fromRGB(0,0,0),
	[3] = Color3.fromRGB(255,0,0),
	[4] = Color3.fromRGB(255, 150, 100),
	[5] = Color3.fromRGB(255,255,0),
	[6] = Color3.fromRGB(0,255,0),
	[7] = Color3.fromRGB(0,255,255),
	[8] = Color3.fromRGB(0,0,255),
	[9] = Color3.fromRGB(255,0,255),
	[10] = Color3.fromRGB(150,0,255),
	[11] = Color3.fromRGB(255,175,255),
}
local cv = 1

-- grid shit
local sqsize = 40
local gridlines = {}
local viewport = workspace.CurrentCamera.ViewportSize
local xaxis = viewport.Y / sqsize
local yaxis = viewport.X / sqsize

local xval, yval = 1, 1
for _ = 1,math.floor(xaxis) do
	local Y = xval * sqsize
	local new = dnew("Line")
	new.Visible = false
	new.Transparency = 0.5
	new.Color = Color3.fromRGB(100,100,100)
	new.ZIndex = 1
	new.From = Vector2new(0, Y)
	new.To = Vector2new(viewport.X, Y)
	insert(gridlines,{Object = new, Axis = "X"})
	insert(drawings,new)
	xval += 1
	taskwait()
end
for _ = 1,math.floor(yaxis) do
	local X = yval * sqsize
	local new = dnew("Line")
	new.Visible = false
	new.Transparency = 0.5
	new.Color = Color3.fromRGB(100,100,100)
	new.ZIndex = 1
	new.From = Vector2new(X, 0)
	new.To = Vector2new(X, viewport.Y)
	insert(gridlines,{Object = new, Axis = "Y"})
	insert(drawings,new)
	yval += 1
	taskwait()
end
local gridval,gridtexts = 1,{
	[1] = "false",
	[2] = "true",
	[3] = "X Only",
	[4] = "Y Only"
}

function gridvis()
	if gridval == #gridtexts then
		gridval = 1
	else
		gridval += 1
	end
	for _,v in next, gridlines do
		local obj, axis = v.Object, v.Axis
		if gridval == 1 then
			obj.Visible = false
		elseif gridval == 2 then
			obj.Visible = true
		elseif gridval == 3 then
			obj.Visible = (axis == "X" and true or false)
		elseif gridval == 4 then
			obj.Visible = (axis == "Y" and true or false)
		end
	end
end

local conn1 = uis.InputBegan:Connect(function(i,gp)
	local uit, kc = i.UserInputType, i.KeyCode
	if uit == mb1 then
		down = true
		local a = dnew(values[t])
		a.Visible = true
		a.Transparency = 1
		a.Color = colors[cv]
		a.ZIndex = 0
		insert(drawings,a)
		insert(objhistory,a)
		if t == 1 then
			a.Thickness = 1
			a.From = mouse
		elseif t == 2 then
			a.Thickness = 1
			a.Position = mouse
			a.Filled = filled
		elseif t == 3 then
			a.Thickness = 1
			a.NumSides = 128
			a.Radius = 0
			a.Filled = filled
			a.Position = mouse
		end
		repeat
			if t == 1 then
				a.To = mouse
			elseif t == 2 then
				a.Size = Vector2new(mouse.X - a.Position.X, mouse.Y - a.Position.Y)
			elseif t == 3 then
				a.Radius = (mouse - a.Position).Magnitude
			end
			taskwait()
		until not down
	end
	if not gp then
		if kc == lctrl then
			ctrldown = true
		elseif kc == lshift then
			shiftdown = true
		end
		if kc == aup then
			mousemoverel(0,-1)
		elseif kc == adown then
			mousemoverel(0,1)
		elseif kc == aleft then
			mousemoverel(-1,0)
		elseif kc == aright then
			mousemoverel(1,0)
		end
		if ctrldown and not down then
			if shiftdown then
				if kc == z then
					for _,v in next, objhistory do
						v:Remove()
					end
					table.clear(objhistory)
				end
			end
			if kc == m then
				if t == #values then
					t = 1
				else
					t += 1
				end
				mode.Text = "Mode: "..values[t].." (CTRL + M)"
			elseif kc == f then
				filled = not filled
				fill.Text = "Fill: "..tostring(filled).." (CTRL + F)"
			elseif kc == c then
				if cv == #colors then
					cv = 1
				else
					cv += 1
				end
				color.Text = "Color: "..colornames[cv].." (CTRL + C)"
			elseif kc == z then
				zdown = true
				local i = #objhistory
				if i > 0 then
					objhistory[i]:Remove()
					remove(objhistory,i)
				end
				taskwait(0.5)
				local holdtime = 0
				if zdown then
					repeat
						holdtime += 0.075
						i = #objhistory
						if i > 0 then
							objhistory[i]:Remove()
							remove(objhistory,i)
						end
						taskwait(holdtime > 2 and 0.025 or 0.075)
					until not zdown
				end
			elseif kc == g then
				gridvis()
				gridt.Text = "Grid: "..gridtexts[gridval].." (CTRL + G)"
			end
		end
	end
end)
local conn2 = uis.InputEnded:Connect(function(i)
	if i.UserInputType == mb1 then
		down = false
	elseif i.KeyCode == lctrl then
		ctrldown = false
	elseif i.KeyCode == lshift then
		shiftdown = false
	elseif i.KeyCode == z then
		zdown = false
	end
end)
local conn3 = game:GetService("RunService").RenderStepped:Connect(function()
	mouse = uis:GetMouseLocation()
	viewport = camera.ViewportSize
	local x, y = mouse.X, mouse.Y

	pl.Position = Vector2new(x - 11, y)
	pr.Position = Vector2new(x + 3, y)
	pt.Position = Vector2new(x, y - 11)
	pb.Position = Vector2new(x, y + 3)

	local coordsx, coordsy, boundsx, boundsy = x + 15, y + 15, coords.TextBounds.X, coords.TextBounds.Y
	coords.Text = "X: "..x.." | Y: "..y

	
	if coordsx + boundsx > viewport.X then
		coordsx = x - (boundsx + 15)
	end
	if coordsy + boundsy > viewport.Y then
		coordsy = y - (boundsy + 15)
	end

	coords.Position = Vector2new(coordsx, coordsy)
end)

local draw = {}
local destroyed = false

function draw:Destroy()
	if destroyed then return end
	for _,v in next, drawings do
		v:Remove()
	end

	conn1:Disconnect()
	conn2:Disconnect()
	conn3:Disconnect()
	destroyed = true
end

getgenv().DRAW = draw
