local getmt = debug.getmetatable or getrawmetatable
local setmt = debug.setmetatable or setrawmetatable
local hookfunction = hookfunction or hookfunc
local firesignal = firesignal or function(signal, ...)
	for _,v in next, getconnections(signal) do
		v:Fire(...)
	end
end

local DataTypes = {
	"nil",
	"boolean",
	"number",
	"string",
	"userdata",
	"function",
	"thread",
	"table",

	"Axes",
	"BrickColor",
	"CFrame",
	"CatalogSearchParams",
	"Color3",
	"ColorSequence",
	"ColorSequenceKeypoint",
	"Content",
	"DateTime",
	"DockWidgetPluginGuiInfo",
	"Enum",
	"EnumItem",
	"Enums",
	"Faces",
	"FloatCurveKey",
	"Font",
	"Instance",
	"NumberRange",
	"NumberSequence",
	"NumberSequenceKeypoint",
	"OverlapParams",
	"PathWaypoint",
	"PhysicalProperties",
	"RBXScriptConnection",
	"RBXScriptSignal",
	"Random",
	"Ray",
	"RaycastParams",
	"RaycastResult",
	"Rect",
	"Region3",
	"TweenInfo",
	"UDim",
	"UDim2",
	"Vector2",
	"Vector2int16",
	"Vector3",
	"Vector3int16"
}
local function CheckDataTypes(t)
	if typeof(t) ~= "table" then return end

	for _,v in next, t do
		if not table.find(DataTypes, v) then
			return false
		end
	end
	return true
end
local ChangedSignals = {}
local function HookPropertyChangedSignal(object, prop)
	if typeof(object) == "Instance" then
		local signal = ChangedSignals[object]
		if signal then
			return signal.Event
		end
		signal = Instance.new("BindableEvent")
		ChangedSignals[object] = signal

		local old;old = hookfunction(object.GetPropertyChangedSignal, function(self, property)
			if property == prop then
				return signal.Event
			end
			return old(self, property)
		end)
		return signal
	end
end
local function AddProperty(object, prop, datatypes, readonly)
	assert(typeof(prop) == "string", "bad argument #2 to 'AddProperty' (string expected, got "..typeof(prop)..")")
	assert(CheckDataTypes(datatypes), "bad argument #3 to 'AddProperty' (invalid data type(s) passed)")

	local instance = typeof(object) == "Instance"
	local signal = HookPropertyChangedSignal(object, prop)
	local oldmt = getmt(object)
	local value = nil
	setmt(object, {
		__index = function(self, i)
			if i == prop then
				return value
			end
			return oldmt.__index(self, i)
		end,
		__newindex = function(self, i, v)
			if i == prop then
				assert(not readonly, "Unable to assign property "..i..". Property is read only")
				value = v
				if instance then
					firesignal(object.Changed, prop)
					signal:Fire(prop)
				end
				return
			end
			oldmt.__newindex(self, i, v)
		end
	})
end

return AddProperty
