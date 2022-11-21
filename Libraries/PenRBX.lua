--[[
	Pen Library by zzerexx#3970
	Roblox Version

	----- ----- ----- ----- ----- ----- ----- ----- ----- -----

	local pen = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/Libraries/PenRBX.lua"), "PenRBX")()

	> pen:moverel(x: number, y: number)
	Moves the Pen by x and y pixels relative to it's current position.

	> pen:moveabs(x: number, y: number)
	Moves the Pen to position x and y relative to the top-left corner of the window.

	> pen:down()
	Enables the Pen.

	> pen:up()
	Disables the Pen.

	> pen:color(c: Color3)
	Sets the Pen's color to c.

	> pen:opacity(o: float)
	Sets the Pen's opacity to o.

	> pen:size(px: number)
	Sets the Pen's size to px.

	> pen:layer(l: number)
	Sets the layer that the Pen draws on to l.

	> pen:undo()
	Reverts the last drawing.

	> pen:erase()
	Erases all drawings.

	> pen:pointer(visible: boolean?)
	Toggles the pointer's visibility.
	If visible is provided it will be set to the value provided.

	> pen:circle(origin: Vector2, radius: number, sides: number)
	Draws a circle.

	> pen:square(origin: Vector2, size: Vector2)
	Draws a square.

	> pen:quad(a: Vector2, b: Vector2, c: Vector2, d: Vector2)
	Draws a quadrilateral.

	> pen:triangle(a: Vector2, b: Vector2, c: Vector2)
	Draws a triangle.

	> pen:gethistory()
	Returns the drawing history.
	This is NOT the action history, this table contains all of the drawing objects.

	> pen:colorall(color: Color3)
	Sets all drawings' color to color.

	> pen:opacityall(opacity: number)
	Sets all drawings' opacity to opacity.

	> pen:sizeall(size: number)
	Sets all drawings' size to size.

	> pen:saverecording(beautified: boolean)
	Saves a recording of all actions and copies it to your clipboard.
	If beautified is true, there will be a new line between every action.

	> pen:playrecording(data: string, delay: boolean?, duration: number?)
	Plays the recording from data.
	If delay is true, there will be a delay between actions.
	If duration is provided, that duration will be used instead.
	Actions that have been performed by a recording will not be recorded in the action history.

	> pen:toggleactionhistory(enabled: boolean)
	Toggles whether actions are tracked in the action history or not.
	If enabled is provided it will be set to the value provided.

	> pen:clearactionhistory()
	Clears the action history.
	Any actions that have been performed before calling this function will be cleared and will not be saved in the next recording.

	> pen:Destroy()
	Destroys Pen Library and all objects created.
]]

if Pen then
	Pen:Destroy()
end

local function notify(text)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Pen Library",
		Text = text,
		Duration = 3
	})
end

local index = 0
local drawhistory = {}
local lastpos = Vector2.zero
local recordingplaying = false
local historydisabled = false
local destroyed = false

local deg = math.deg
local atan2 = math.atan2
local sqrt = math.sqrt
local Vector2new = Vector2.new
local fromOffset = UDim2.fromOffset
local gethui = gethui or get_hidden_ui or get_hidden_gui or hiddenUI or nil

local function GetAngle(a1, a2)
	return deg(atan2(a2.Y - a1.Y, a2.X - a1.X))
end
local function GetDistance(a1, a2)
	return sqrt((a2.X - a1.X) ^ 2 + (a2.Y - a1.Y) ^ 2)
end

local Gui = Instance.new("ScreenGui")
Gui.DisplayOrder = 999999999
Gui.IgnoreGuiInset = true
Gui.Name = game:GetService("HttpService"):GenerateGUID(false)
Gui.ResetOnSpawn = false
if getgenv then
	if syn then
		syn.protect_gui(Gui)
	end
	Gui.Parent = (gethui and gethui()) or game:GetService("CoreGui")
else
	Gui.Parent = game:GetService("Players").LocalPlayer.PlayerGui
end

local pointer = Instance.new("Frame", Gui)
pointer.AnchorPoint = Vector2.new(0.5, 0.5)
pointer.BackgroundTransparency = 1
pointer.Name = "Pointer"
pointer.Position = fromOffset(lastpos.X, lastpos.Y)
pointer.Size = fromOffset(1, 1)
pointer.ZIndex = 2147483647
local circle = Instance.new("UIStroke", pointer)
circle.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
circle.Color = Color3.new(0, 0, 0)
circle.Thickness = 1
circle.Transparency = 0

local function Set(self, i, v)
	if not self.Exists then return end
	local obj = self.Object
	local line = obj.Line
	if i == "Transparency" then
		line.BackgroundTransparency = 1 - v
	elseif i == "Color" then
		line.BackgroundColor3 = v
	elseif i == "Thickness" then
		line.Size = fromOffset(line.Size.X.Offset, v)
	elseif i == "From" then
		local from = v
		local to = self.To
		
		local angle = GetAngle(from, to)
		local distance = GetDistance(from, to)

		local pos = fromOffset(from.X, from.Y)
		local rot = angle
		local size = fromOffset(distance, self.Thickness)
		
		obj.Position = pos
		obj.Rotation = rot
		line.Size = size
	elseif i == "To" then
		local from = self.From
		local to = v
		
		local angle = GetAngle(from, to)
		local distance = GetDistance(from, to)
		
		local pos = fromOffset(from.X, from.Y)
		local rot = angle
		local size = fromOffset(distance, self.Thickness)
		
		obj.Position = pos
		obj.Rotation = rot
		line.Size = size
	elseif line[i] ~= nil then
		line[i] = v
	end
	self[i] = v
end

local pen = {
	props = {
		x = 0,
		y = 0,
		down = false,
		color = Color3.new(1, 1, 1),
		opacity = 1,
		size = 2,
		layer = 0,
	},
	actionhistory = {},
	draw = function(self)
		if destroyed then return end

		local props = self.props
		if not props.down then return end

		index += 1
	
		local offset = Instance.new("Frame", Gui)
		local line = Instance.new("Frame", offset)

		offset.AnchorPoint = Vector2new(0.5, 0.5)
		offset.BackgroundTransparency = 1
		offset.Name = "Line"
		offset.Size = fromOffset(0, 0)
		offset.Visible = true

		line.AnchorPoint = Vector2new(0, 0.5)
		line.BackgroundColor3 = Color3.new(1, 1, 1)
		line.BorderSizePixel = 0
		line.Name = "Line"
		line.Size = fromOffset(100, 1)
		line.ZIndex = 0

		local obj = {
			Object = offset,
			Exists = true,
			Visible = true,
			ZIndex = props.layer,
			Transparency = 1 - props.opacity,
			Color = Color3.new(1, 1, 1),
			Thickness = props.size,
			From = lastpos,
			To = Vector2.new(props.x, props.y),
			Destroy = function(self)
				self.Object:Destroy()
				self.Exists = false
			end
		}

		Set(obj, "ZIndex", props.layer)
		Set(obj, "Visible", true)
		Set(obj, "Transparency", props.opacity)
		Set(obj, "Color", props.color)
		Set(obj, "Thickness", props.size)
		Set(obj, "From", lastpos)
		Set(obj, "To", Vector2new(props.x, props.y))
	
		drawhistory[index] = obj
	end,
	pointer = pointer
}

local function addtohistory(self, action, ...)
	if not recordingplaying and not historydisabled then
		table.insert(self.actionhistory, string.format(action, ...))
	end
end

local funcs = {
	moverel = function(self, x, y)
		if destroyed then return end
		
		if typeof(x) == "Vector2" then
			y = x.Y
			x = x.X
		end
		local props = self.props
		props.x += x
		props.y += y
		self:draw()
		lastpos = Vector2.new(props.x, props.y)
		pointer.Position = fromOffset(lastpos.X, lastpos.Y)
		addtohistory(self, "moverel:%s,%s", x, y)
	end,
	moveabs = function(self, x, y)
		if destroyed then return end
		
		if typeof(x) == "Vector2" then
			y = x.Y
			x = x.X
		end
		local props = self.props
		props.x = x
		props.y = y
		self:draw()
		lastpos = Vector2.new(props.x, props.y)
		pointer.Position = fromOffset(lastpos.X, lastpos.Y)
		addtohistory(self, "moveabs:%s,%s", x, y)
	end,
	down = function(self)
		if destroyed then return end
		
		self.props.down = true
		addtohistory(self, "down:")
	end,
	up = function(self)
		if destroyed then return end
		
		self.props.down = false
		addtohistory(self, "up:")
	end,
	color = function(self, r, g, b)
		if destroyed then return end
		
		if typeof(r) == "Color3" then
			g = r.G * 255
			b = r.B * 255
			r = r.R * 255
		end
		local color = Color3.fromRGB(r, g, b)
		self.props.color = color
		local _, _, v = color:ToHSV()
		if v <= 0.5 then
			pointer.BackgroundColor3 = Color3.new(1, 1, 1)
		else
			pointer.BackgroundColor3 = Color3.new(0, 0, 0)
		end
		addtohistory(self, "color:%s,%s,%s", r, g, b)
	end,
	opacity = function(self, value)
		if destroyed then return end
		
		self.props.opacity = value
		addtohistory(self, "opacity:%s", value)
	end,
	size = function(self, value)
		if destroyed then return end
		
		self.props.size = value
		pointer.Size = fromOffset(value, value)
		addtohistory(self, "size:%s", value)
	end,
	layer = function(self, value)
		if destroyed then return end
		
		self.props.layer = math.clamp(value, -2147483647, 2147483646)
		addtohistory(self, "layer:%s", value)
	end,
	undo = function(self)
		if destroyed then return end
		
		local obj = drawhistory[index]
		if obj then
			obj:Destroy()
			table.remove(drawhistory, index)
			index -= 1
		end
		addtohistory(self, "undo:")
	end,
	erase = function(self)
		if destroyed then return end
		
		for _,v in next, drawhistory do
			v:Destroy()
		end
		table.clear(drawhistory)
		index = 0
		addtohistory(self, "erase:")
	end,
	pointer = function(self, value)
		if destroyed then return end
		
		if value ~= nil then
			pointer.Visible = value
			addtohistory(self, "pointer:%s", tostring(value))
		else
			pointer.Visible = not pointer.Visible
			addtohistory(self, "pointer:")
		end
	end,
	gethistory = function()
		if destroyed then return end
		
		return drawhistory
	end,
	colorall = function(self, r, g, b)
		if destroyed then return end
		
		if typeof(r) == "Color3" then
			g = r.G * 255
			b = r.B * 255
			r = r.R * 255
		end
		local color = Color3.fromRGB(r, g, b)
		for _,v in next, drawhistory do
			v.Color = color
		end
		addtohistory(self, "colorall:%s,%s,%s", r, g, b)
	end,
	opacityall = function(self, value)
		if destroyed then return end
		
		for _,v in next, drawhistory do
			Set(v, "Transparency", value)
		end
		addtohistory(self, "opacityall:%s", value)
	end,
	sizeall = function(self, value)
		if destroyed then return end
		
		for _,v in next, drawhistory do
			Set(v, "Thickness", value)
		end
		addtohistory(self, "sizeall:%s", value)
	end,
	saverecording = function(self, beautified)
		if destroyed then return end
		
		if setclipboard then
			local history = self.actionhistory
			setclipboard(table.concat(history, beautified and "=\n" or "="))
			notify("Copied recording to clipboard!\n# of actions: "..(#history))
		end
	end,
	playrecording = function(self, data, delay, duration)
		if destroyed then return end
		
		if recordingplaying then
			notify("A recording is currently playing. Please wait until it finishes.")
			return
		end
		recordingplaying = true

		local suc,err = pcall(function()
			for _,v in next, data:gsub("\n", ""):split("=") do
				local a = v:split(":")
				local action = a[1]
				local args = {}
				for _,v2 in next, a[2]:split(",") do
					if not v2:match("%a") then
						v2 = tonumber(v2)
					end
					if v2 == "true" then
						v2 = true
					end
					if v2 == "false" then
						v2 = false
					end
					table.insert(args, v2)
				end
				self[action](self, unpack(args))
				if delay then
					task.wait(duration or 0)
				end
			end
		end)

		if not suc then
			notify("An error(s) occurred while playing a recording. Please check your recording data for any errors.")
			local printuiconsole = printuiconsole or printconsole or function(...) end
			printuiconsole(err)
		end

		recordingplaying = false
		addtohistory(self, "replayrecording:%s", data)
	end,
	toggleactionhistory = function(self, value)
		if value ~= nil then
			historydisabled = value
			addtohistory(self, "toggleactionhistory:%s", tostring(value))
		else
			historydisabled = not historydisabled
			addtohistory(self, "toggleactionhistory:")
		end
	end,
	clearactionhistory = function(self)
		if destroyed then return end
		
		table.clear(self.actionhistory)
		notify("Action history has been cleared.")
	end,
	Destroy = function(self)
		if destroyed then return end
		
		self:erase()
		pointer:Destroy()
		table.clear(self)
		destroyed = true
	end
}

local sin = math.sin
local cos = math.cos
local clamp = math.clamp
local r = math.pi / 180
local shapes = {
	circle = function(self, origin, radius, sides)
		local old = historydisabled
		historydisabled = true
		self:up()
		local originx = origin.X
		local originy = origin.Y
		for i = 0, 360, 360 / clamp(sides, 0, 360) do
			local x = originx + sin(i * r) * radius
			local y = originy + cos(i * r) * radius

			self:moveabs(x, y)
			self:down()
		end
		self:up()
		historydisabled = old
	end,
	square = function(self, origin, size)
		local old = historydisabled
		historydisabled = true
		self:up()
		self:moveabs(origin)
		self:down()
		self:moverel(size.X, 0)
		self:moverel(0, size.Y)
		self:moverel(-size.X, 0)
		self:moverel(0, -size.Y)
		self:up()
		historydisabled = old
	end,
	shape = function(self, ...)
		local old = historydisabled
		historydisabled = true
		local args = {...}
		self:up()
		self:moveabs(args[1])
		self:down()
		for i,v in next, args do
			if i == 1 then
				continue
			end
			self:moveabs(v)
		end
		self:up()
		historydisabled = old
	end,
	quad = function(self, a, b, c, d)
		self:shape(a, b, c, d)
	end,
	triangle = function(self, a, b, c)
		self:shape(a, b, c)
	end,
}

for i,v in next, funcs do
	pen[i] = v
end
for i,v in next, shapes do
	pen[i] = v
end
if getgenv then
	getgenv().Pen = pen
end
return pen
