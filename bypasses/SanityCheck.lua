-- bypasses their "dex detection" (memory detection LOL)
-- https://www.roblox.com/games/7194689865/
local old;old = hookmetamethod(game, "__namecall", function(...)
	local args = {...}
	
	if getnamecallmethod() == "GetMemoryUsageMbForTag" and args[1] == game:GetService("Stats") and args[2] == "LuaHeap" then
		return math.random(19000,22000) / 1000
	end
	
	return old(...)
end)
