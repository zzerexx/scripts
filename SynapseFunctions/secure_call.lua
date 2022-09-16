-- security is not guaranteed
local oldt;oldt = hookfunction(getrenv().debug.traceback, function(lol)
	local traceback = oldt(lol)
	if checkcaller() then
		local a = traceback:split("\n")
		return string.format("%s\n%s\n", a[1], a[3])
	end
	return traceback
end)
local oldi;oldi = hookfunction(getrenv().debug.info, function(lvl, a)
	if checkcaller() then
		return oldi(3, a)
	end
	return oldi(lvl, a)
end)

local setidentity = setidentity or setthreadidentity or set_thread_identity or setthreadcontext or set_thread_context or (syn and syn.set_thread_identity)
local function secure_call(func, env, ...)
	local functype = typeof(func) 
	local envtype = typeof(env)
	assert(functype == "function", string.format("bad argument to #1 'secure_call' (function expected, got %s)", functype))
	assert(envtype == "Instance", string.format("bad argument to #2 'secure_call' (Instance expected, got %s)", envtype))
	local envclass = env.ClassName
	assert(envclass == "LocalScript" or envclass == "ModuleScript", string.format("bad argument to #2 'secure_call' (LocalScript or ModuleScript expected, got %s)", envclass))
	local _, fenv = xpcall(function()
		return getsenv(env)
	end, function()
		return getfenv(func)
	end)
	return coroutine.wrap(function(...)
		setidentity(2)
		setfenv(0, fenv)
		setfenv(1, fenv)
		return func(...)
	end)(...)
end

return secure_call
