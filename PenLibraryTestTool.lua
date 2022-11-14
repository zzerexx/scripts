local function Load(file)
    return loadstring(game:HttpGet(string.format("https://raw.githubusercontent.com/zzerexx/scripts/main/%s.lua", file)), file)()
end

local Pen = Pen or Load("Libraries/Pen")
getgenv().Pen = Pen
local Material = Load("MaterialLuaRemake")
local UI = Material.Load({
	Title = "Pen Library Test Tool",
	SizeX = 400,
	SizeY = 400,
	Style = 3
})

local color = Color3.new(1,1,1)
local opacity = 1
local size = 2
local layer = 0

local b = UI.new("control")

local movestep = 1
b.Slider({
	Text = "move relative step",
	Callback = function(value)
		movestep = value
	end,
	Min = 1,
	Max = 100,
	Def = 1
})
b.Dropdown({
	Text = "move relative",
	Callback = function(value)
		if value == "up" then
			Pen:moverel(0, -movestep)
		elseif value == "down" then
			Pen:moverel(0, movestep)
		elseif value == "left" then
			Pen:moverel(-movestep, 0)
		elseif value == "right" then
			Pen:moverel(movestep, 0)
		end
	end,
	Options = {
		"up",
		"down",
		"left",
		"right"
	}
})
b.TextField({
	Text = "x position",
	Type = "Default",
	Callback = function(value)
		Pen:moveabs(value, Pen.props.y)
	end
})
b.TextField({
	Text = "y position",
	Type = "Default",
	Callback = function(value)
		Pen:moveabs(Pen.props.x, value)
	end
})
b.Toggle({
	Text = "pen down",
	Callback = function(value)
		if value then
			Pen:down()
		else
			Pen:up()
		end
	end,
	Enabled = false
})
b.ColorPicker({
	Text = "color",
	Callback = function(value)
		color = value
	end,
	Def = color
})
b.Slider({
	Text = "opacity",
	Callback = function(value)
		opacity = value
	end,
	Min = 0,
	Max = 1,
	Def = 1,
	Decimals = 2
})
b.Slider({
	Text = "size",
	Callback = function(value)
		size = value
	end,
	Min = 1,
	Max = 100,
	Def = size
})
b.Slider({
	Text = "layer",
	Callback = function(value)
		layer = value
	end,
	Min = 0,
	Max = 999,
	Def = layer
})
b.Button({
	Text = "undo",
	Callback = function()
		Pen:undo()
	end
})
b.Button({
	Text = "erase",
	Callback = function()
		Pen:erase()
	end
})
b.Toggle({
	Text = "pointer visible",
	Callback = function(value)
		Pen:pointer(value)
	end,
	Enabled = true
})
local mousecontrol = true
b.Toggle({
	Text = "mouse control",
	Callback = function(value)
		mousecontrol = value
		if value == false then
			Pen:up()
		end
	end,
	Enabled = true
})

local mouse = game.Players.LocalPlayer:GetMouse()

mouse.Button1Down:Connect(function()
	if mousecontrol then
		Pen:down()
	end
end)
mouse.Button1Up:Connect(function()
	if mousecontrol then
		Pen:up()
	end
end)

while true do
	if mousecontrol then
		Pen:color(color)
		Pen:opacity(opacity)
		Pen:size(size)
		Pen:layer(layer)
		Pen:moveabs(mouse.X, mouse.Y + 36)
	end
	task.wait()
end
