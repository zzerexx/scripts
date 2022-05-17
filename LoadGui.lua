local function LoadScript(x)
	if x:IsA("Script") then
		xpcall(coroutine.wrap(function()
			local Fenv, FenvMt, RealFenv, Func = {}, {}, {
				script = x
			}, loadstring(x.Source, "=" .. x:GetFullName())
			FenvMt.__index = function(a, b)
				if RealFenv[b] == nil then
					return getfenv()[b]
				else
					return RealFenv[b]
				end
			end
			FenvMt.__newindex = function(a, b, c)
				if RealFenv[b] == nil then
					getfenv()[b] = c
				else
					RealFenv[b] = c
				end
			end
			setmetatable(Fenv, FenvMt)
			setfenv(Func, Fenv)
			return Func()
		end), warn)
	end
	for _, v in pairs(x:GetChildren()) do
		xpcall(LoadScript, warn, v)
	end
end
local function LoadGui(id, objectname)
	local success, object = xpcall(function()
		return game:GetObjects("rbxassetid://"..id)[1]
	end, warn)
	if not success then return end
	
	local name = ""
	for _ = 1, 16 do
		name ..= string.char(math.random(97, 122))
	end
	
	if syn then
		syn.protect_gui(object)
	end
	object.Name = objectname or name
	object.Parent = (gethui and gethui()) or (get_hidden_ui and get_hidden_ui()) or game.CoreGui
	xpcall(LoadScript, warn, object)
	
	return object
end

return LoadGui
