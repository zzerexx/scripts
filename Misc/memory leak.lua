while true do
	for _ = 1,100 do
		local a = Instance.new("Part")
		a.Touched:Connect(function() a.Archivable = true end)
	end
	task.wait()
end
