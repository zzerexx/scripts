--[[
	Pen Library by zzerexx#3970

	----- ----- ----- ----- ----- ----- ----- ----- ----- -----

	local pen = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/Libraries/Pen.lua"))()

	> pen:moverel(x: number, y: number)
	Moves the Pen by x and y pixels relative to it's current position.

	> pen:moveabs(x: number, y: number)
	Moves the Pen to position x and y relative to the top-left corner of the window.

	> pen:down()
	Enables the Pen.

	> pen:up()
	Disables the Pen.

	> pen:color(c: Color3)
	Changes the Pen's color to c.

	> pen:opacity(o: float)
	Changes the Pen's opacity to o.

	> pen:size(px: number)
	Changes the Pen's size to px.

	> pen:layer(l: number)
	Changes the layer that the Pen draws on to l.

	> pen:undo()
	Reverts the last Pen drawing.

	> pen:erase()
	Erases all drawings.

	> pen:pointer(visible: boolean?)
	Toggles the pointer's visibility.
	If an argument is provided it will be set to the value provided.

	> pen:circle(origin: Vector2, radius: number, sides: number)

	> pen:square(origin: Vector2, size: Vector2)

	> pen:quad(a: Vector2, b: Vector2, c: Vector2, d: Vector2)

	> pen:triangle(a: Vector2, b: Vector2, c: Vector2)
]]

local index = 0
local drawhistory = {}
local lastpos = Vector2.zero

local pointerobj = Drawing.new("Circle")
pointerobj.ZIndex = 2147483647
pointerobj.Visible = true
pointerobj.Transparency = 1
pointerobj.Filled = false
pointerobj.Position = lastpos
pointerobj.Radius = 1
pointerobj.Thickness = 1
pointerobj.Color = Color3.new(0, 0, 0)
pointerobj.Position = lastpos

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
	draw = function(self)
		local props = self.props
		if not props.down then return end

		index += 1
	
		local obj = Drawing.new("Line")
		obj.ZIndex = props.layer
		obj.Visible = true
		obj.Transparency = props.opacity
		obj.Color = props.color
		obj.Thickness = props.size
		obj.From = lastpos
		obj.To = Vector2.new(props.x, props.y)
	
		drawhistory[index] = obj
	end
}

local funcs = {
	moverel = function(self, x, y)
		if typeof(x) == "Vector2" then
			y = x.Y
			x = x.X
		end
		local props = self.props
		props.x += x
		props.y += y
		self:draw()
		lastpos = Vector2.new(props.x, props.y)
		pointerobj.Position = lastpos
	end,
	moveabs = function(self, x, y)
		if typeof(x) == "Vector2" then
			y = x.Y
			x = x.X
		end
		local props = self.props
		props.x = x
		props.y = y
		self:draw()
		lastpos = Vector2.new(props.x, props.y)
		pointerobj.Position = lastpos
	end,
	down = function(self)
		self.props.down = true
	end,
	up = function(self)
		self.props.down = false
	end,
	color = function(self, r, g, b)
		if typeof(r) == "Color3" then
			g = r.G * 255
			b = r.B * 255
			r = r.R * 255
		end
		local color = Color3.fromRGB(r, g, b)
		self.props.color = color
		local _, _, v = color:ToHSV()
		if v <= 0.5 then
			pointerobj.Color = Color3.new(1, 1, 1)
		else
			pointerobj.Color = Color3.new(0, 0, 0)
		end
	end,
	opacity = function(self, value)
		self.props.opacity = value
	end,
	size = function(self, value)
		self.props.size = value
		pointerobj.Radius = value / 2
	end,
	layer = function(self, value)
		self.props.layer = math.clamp(value, -2147483647, 2147483646)
	end,
	undo = function()
		local obj = drawhistory[index]
		if obj then
			obj:Destroy()
			table.remove(drawhistory, index)
			index -= 1
		end
	end,
	erase = function()
		for _,v in next, drawhistory do
			v:Destroy()
		end
		table.clear(drawhistory)
		index = 0
	end,
	pointer = function(self, visible)
		if visible ~= nil then
			pointerobj.Visible = visible
		else
			pointerobj.Visible = not pointerobj.Visible
		end
	end
}

local sin = math.sin
local cos = math.cos
local clamp = math.clamp
local r = math.pi / 180
local shapes = {
	circle = function(self, origin, radius, sides)
		self:up()
		for i = 0, 360, 360 / clamp(sides, 0, 360) do
			local x = origin.X + sin(i * r) * radius
			local y = origin.Y + cos(i * r) * radius

			self:moveabs(x, y)
			self:down()
		end
		self:up()
	end,
	square = function(self, origin, size)
		self:up()
		self:moveabs(origin)
		self:down()
		self:moverel(size.X, 0)
		self:moverel(0, size.Y)
		self:moverel(-size.X, 0)
		self:moverel(0, -size.Y)
		self:up()
	end,
	quad = function(self, a, b, c, d)
		self:up()
		self:moveabs(a)
		self:down()
		self:moveabs(b)
		self:moveabs(c)
		self:moveabs(d)
		self:moveabs(a)
		self:up()
	end,
	triangle = function(self, a, b, c)
		self:up()
		self:moveabs(a)
		self:down()
		self:moveabs(b)
		self:moveabs(c)
		self:moveabs(a)
		self:up()
	end
}

for i,v in next, funcs do
	pen[i] = v
end
for i,v in next, shapes do
	pen[i] = v
end
getgenv().Pen = pen
return pen
