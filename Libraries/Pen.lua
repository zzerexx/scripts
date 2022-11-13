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
]]

local index = 0
local drawhistory = {}
local lastpos = Vector2.zero

local pointerobj = Drawing.new("Circle")
pointerobj.ZIndex = 1000
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
		local props = self.props
		props.x += x
		props.y += y
		self:draw()
		lastpos = Vector2.new(props.x, props.y)
		pointerobj.Position = lastpos
	end,
	moveabs = function(self, x, y)
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
	color = function(self, value)
		self.props.color = value
		local _, _, v = value:ToHSV()
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
		self.props.layer = value
	end,
	undo = function()
		local obj = drawhistory[index]
		if obj then
			obj:Destroy()
			index -= 1
		end
	end,
	erase = function()
		for _,v in next, drawhistory do
			v:Destroy()
		end
		index = 0
	end
}

for i,v in next, funcs do
	pen[i] = v
end

return pen
