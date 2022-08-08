-- Adds a 'Center' property on Square drawing objects which makes the square's 'anchor point' in the center instead of the top left corner
-- Additionally, there's also an 'AbsolutePosition' property which just returns the square's actual position

-- this was tested with script-ware (idk if it works on other exploits)
-- :Destroy on some drawing objects does not work on synapse for some dumb fucking reason idfk why
-- do not use with your actual scripts cuz stability is *not guaranteed*
-- this is just something i made for fun ! (you can improve on it if you want to)

assert((Drawing and Drawing.new) and (debug and debug.getmetatable and debug.setmetatable), "missing required functions (Drawing.new, debug.getmetatable, debug.setmetatable)")

local getmt, setmt, v2 = debug.getmetatable, debug.setmetatable, Vector2.new
local old;old = hookfunction((Drawing.new or createrenderobj), function(class)
	local obj = old(class)
	if class:lower() == "square" then
		local center = false
		local oldmt = getmt(obj)
		local get = oldmt.__index -- these are needed to get/set properties cuz if you just index the object it will continuously loop because we are setting a new metatable
		local set = oldmt.__newindex
		local removefunc = obj.Remove -- need this cuz dumb synapse thinks :Destroy is a fucking __index
		
		local function centerobj()
			local p = get(obj, "Position")
			local s = get(obj, "Size")
			
			if center then
				set(obj, "Position", v2(p.X - (s.X / 2), p.Y - (s.Y / 2)))
			else
				set(obj, "Position", v2(p.X + (s.X / 2), p.Y + (s.Y / 2)))
			end
		end
		setmt(obj, {
			__index = function(_, i)
				if i == "Center" then
					return center
				elseif i == "AbsolutePosition" then
					local p = get(obj, "Position")
					local s = get(obj, "Size")
					if center then
						p = v2(p.X + s.X / 2, p.Y + (s.Y / 2))
					end
					return p
				end
				if i == "Remove" or i == "Destroy" then
					return removefunc
				end
				return get(obj, i)
			end,
			__newindex = function(_, i, v)
				if i ~= "Center" then
					set(obj, i, v)
				end
				if i == "Center" and typeof(v) == "boolean" then
					if v == center then -- to prevent it from "centering" while its already centered
						return
					end
					
					center = v
					centerobj()
				elseif (i == "Position" or i == "Size") and center == true then
					centerobj()
				end
			end
		})
	end
	return obj
end)

getgenv().undo_drawing_hook = function() -- incase you would like to undo the hook
	getgenv().Drawing.new = old
end
