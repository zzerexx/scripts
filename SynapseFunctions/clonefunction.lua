return function(f)
	local lol = xpcall(setfenv, function(a,b)
		return a,b
	end, f, getfenv(f))
	if lol then
		return function(...)
			return f(...)
		end
	end
	return coroutine.wrap(function(...)
		while true do
			f = coroutine.yield(f(...))
		end
	end)
end
