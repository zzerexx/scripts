-- idk if its fully secure but it returns the same results as synapse
local old;old = hookfunction(getrenv().debug.traceback,function(lol)
	if checkcaller() then
		return lol.."\n"..old():split("\n")[2].."\n"
	end
	return old()
end)
return function(func,env,...)
	return coroutine.wrap(function(...)
		setfenv(0,getsenv(env))
		setfenv(1,getsenv(env))
		return func(...)
	end)(...)
end
