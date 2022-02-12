-- bypasses their "dex detection" (memory detection LOL)
-- https://www.roblox.com/games/7194689865/
local old;old = hookmetamethod(game, "__namecall", function(...)
	local args = {...}
	
	if getnamecallmethod() == "GetMemoryUsageMbForTag" and args[1] == game:GetService("Stats") and args[2] == "LuaHeap" then
		return math.random(19000,22000) / 1000
	end
	
	return old(...)
end)


--[[
	info
	LocalPlayer.PlayerScripts.SLOCK -- decompiled: https://pastebin.com/raw/8c3Z66PV
	LocalPlayer.PlayerScripts.Sprint -- decompiled: https://pastebin.com/raw/eS1t7CsD
	LocalPlayer.PlayerGui.MessageText.LocalScript -- decompiled: https://pastebin.com/raw/LcAXGehN

	ReplicatedStorage.RemoteEvents.ClientKick -- just kicks the player (lol?)
	ReplicatedStorage.RemoteEvents.RemoveCharacter -- removes the character (lol??)
	ReplicatedStorage.RemoteEvents.removecserver -- removes the character but on the server (lol???)
]]
