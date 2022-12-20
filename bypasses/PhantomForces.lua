-- credit: https://v3rmillion.net/showthread.php?tid=1195926
if not bypassloaded and (game.PlaceId == 292439477 or game.PlaceId == 299659045) then
	local ReplicatedFirst = game:GetService("ReplicatedFirst")
	ReplicatedFirst.ChildAdded:Connect(function(a)
		if a:IsA("Actor") then
			ReplicatedFirst.ChildAdded:Wait()
			for _, v in next, a:GetChildren() do
				v.Parent = ReplicatedFirst
			end
		end
	end)
	local old;old = hookmetamethod(RunService.Stepped, "__index", function(self, i)
		local indexed = old(self, i)
		if i == "ConnectParallel" and not checkcaller() then
			hookfunction(indexed, newcclosure(function(signal, callback)
				return old(self, "Connect")(signal, function()
					return self:Wait() and callback()
				end)
			end))
		end
		return indexed
	end)
	task.spawn(function()
		local shared = getrenv().shared
		repeat task.wait() until shared.close
		hookfunction(shared.close, function() end)
	end)
	getgenv().bypassloaded = true
end
