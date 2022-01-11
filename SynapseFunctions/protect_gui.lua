local protected = {}
local oldnc;oldnc = hookmetamethod(game,"__namecall",function(...)
	local args = {...}
	if not checkcaller() and args[1] == game and getnamecallmethod() == "FindFirstChild" and args[3] == true then
		for _,v in next, protected do
			if v.Name == args[2] then
				return nil
			end
		end
	end
	return oldnc(...)
end)

return {
	['protect_gui'] = function(a)
		table.insert(protected,a)
		for _,v in next, a:GetDescendants() do
			table.insert(protected,v)
		end
		local c;c = a.DescendantAdded:Connect(function(d)
			if table.find(protected,a) then
				table.insert(protected,d)
			else
				c:Disconnect()
			end
		end)
	end,
	['unprotect_gui'] = function(a)
		table.remove(protected,table.find(protected,a))
		for _,v in next, a:GetDescendants() do
			if table.find(protected,v) then
				table.remove(protected,table.find(protected,v))
			end
		end
	end
}
