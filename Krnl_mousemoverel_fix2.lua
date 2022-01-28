local old;old = hookfunction(mousemoverel,function(x,y)
	if x < 0 then
		task.spawn(function()
			for _ = 1,math.abs(x) do
				old(-1,0)
				task.wait()
			end
		end)
	end
	if y < 0 then
		task.spawn(function()
			for _ = 1,math.abs(y) do
				old(0,-1)
				task.wait()
			end
		end)
	end
	return old(x,y)
end)
