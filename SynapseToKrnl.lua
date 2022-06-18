assert(KRNL_LOADED, "you are not using krnl")

local _, version;_, version = xpcall(function()
	return game:GetService("HttpService"):JSONDecode(game:HttpGet("https://api.whatexploitsare.online/status/Synapse"))[1].Synapse.exploit_version
end, function()
	version = "2.16.4"
end)

loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisInstanceProtect.lua"))() -- credit to iris (this is for protect_gui and unprotect_gui)
local oldmt = getrawmetatable(game)
local none = newcclosure(function() end)

local function define(name, value, parent)
	local lol = (typeof(value) == "function" and islclosure(value) and newcclosure(value)) or value
	if parent ~= nil then
		parent[name] = lol
	else
		getgenv()[name] = lol
	end
end
local function connection(conn, enabled)
	for _,v in next, getconnections(conn) do
		if enabled then
			v:Enable()
		else
			v:Disable()
		end
	end
end

do -- hooks
	local headers = game:GetService("HttpService"):JSONDecode(request({Url = "https://httpbin.org/get"}).Body).headers
	local Fingerprint = headers['Krnl-Hwid']
	local UserIdentifier = headers['Krnl-Hwid']
	local UserAgent = "synx/"..version
	local oldr;oldr = hookfunction(request, function(options)
		local h = options.Headers or {}
		h['Syn-Fingerprint'] = KRNLHWID or Fingerprint
		h['Syn-User-Identifier'] = KRNLUID or UserIdentifier
		h['User-Agent'] = UserAgent
		return oldr({
			Url = options.Url,
			Method = options.Method or "GET",
			Headers = h,
			Cookies = options.Cookies or {},
			Body = options.Body or ""
		})
	end)
	hookfunction(http_request, request)

	--[[ -- unused since its useless, but its cool ig
	local oldd;oldd = hookfunction(Drawing.new, function(class) -- same drawing object functionality
		local obj = oldd(class)
		local t = {
			['__OBJECT'] = obj,
			['__OBJECT_EXISTS'] = true
		}
		local function remove()
			obj:Remove()
			t.__OBJECT_EXISTS = false
		end
		function t:Remove()
			remove()
		end
		function t:Destroy()
			remove()
		end

		setmetatable(t, {
			__index = function(_, i)
				if t.__OBJECT_EXISTS then
					if i == ("__OBJECT" or "__OBJECT_EXISTS") then
						return t
					else
						return obj[i]
					end
				end
			end,
			__newindex = function(_, i, v)
				if t.__OBJECT_EXISTS then
					obj[i] = v
				end
			end
		})
		return t
	end)
	]]

	local olds;olds = hookfunction(saveinstance, function(t) -- same saveinstance functionality
		local s = {
			Decompile = false,
			NilInstances = false,
			RemovePlayerCharacters = true,
			SavePlayers = false,
			DecompileTimeout = 10,
		}
		if typeof(t) == "table" then
			local mode, noscripts, timeout = t.mode, t.noscripts, t.timeout
			if typeof(mode) == "string" then
				mode = mode:lower()
				if mode == "optimized" then
					s.Decompile = true
					s.NilInstances = true
					s.SavePlayers = false
				elseif mode == "full" then
					s.Decompile = true
					s.NilInstances = true
					s.RemovePlayerCharacters = false
					s.SavePlayers = true
				elseif mode == "scripts" then
					s.Decompile = true
				end
			end
			if noscripts then
				s.Decompile = false
			end
			if typeof(timeout) == "number" then
				s.DecompileTimeout = timeout
			end
		end
		local name = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name:gsub("%s%z", "_")
		return olds(game, s, name)
	end)

	local oldt;oldt = hookfunction(getrenv().debug.traceback, function(lol) -- secure_call thing
		if checkcaller() then
			return lol.."\n"..oldt():split("\n")[2].."\n"
		end
		return oldt()
	end)

	hookfunction(identifyexecutor, function()
		return "Synapse X", version
	end)
end

do -- syn_ filesystem
	define("syn_io_read", readfile)
	define("syn_io_write", writefile)
	define("syn_io_append", appendfile)
	define("syn_io_makefolder", makefolder)
	define("syn_io_listdir", listfiles)
	define("syn_io_isfile", isfile)
	define("syn_io_isfolder", isfolder)
	define("syn_io_delfile", delfile)
	define("syn_io_delfolder", delfolder)
end

do -- syn_ input
	define("syn_mouse1click", mouse1click)
	define("syn_mouse1press", mouse1press)
	define("syn_mouse1release", mouse1release)

	define("syn_mouse2click", mouse2click)
	define("syn_mouse2press", mouse2press)
	define("syn_mouse2release", mouse2release)

	define("syn_mousescroll", mousescroll)
	define("syn_mousemoverel", mousemoverel)
	define("syn_mousemoveabs", mousemoveabs)

	define("syn_keypress", keypress)
	define("syn_keyrelease", keyrelease)
end

do -- syn_ crypt
	define("syn_crypt_encrypt", none)
	define("syn_crypt_decrypt", none)
	define("syn_crypt_b64_encode", base64_encode)
	define("syn_crypt_b64_decode", base64_decode)
	define("syn_crypt_random", none)
	define("syn_crypt_hash", sha384_hash)
	define("syn_crypt_derive", none)
end

do -- syn_
	define("syn_getgenv", getgenv)
	define("syn_getrenv", getrenv)
	define("syn_getsenv", getsenv)
	define("syn_getmenv", getmenv)
	define("syn_getreg", getreg)
	define("syn_getgc", getgc)
	define("syn_getinstances", getinstances)
	define("syn_context_get", getthreadcontext)
	define("syn_context_set", setthreadcontext)
	define("syn_setfflag", setfflag)
	define("syn_dumpstring", none)
	define("syn_islclosure", islclosure)
	define("syn_checkcaller", checkcaller)
	define("syn_clipboard_set", setclipboard)
	define("syn_newcclosure", newcclosure)
	define("syn_decompile", decompile)
	define("syn_getloadedmodules", getloadedmodules)
	define("syn_getcallingscript", getcallingscript)
	define("syn_isactive", isrbxactive)
	define("syn_websocket_connect", function(a)
		return WebSocket.connect(a)
	end)
	define("syn_websocket_close", function(a)
		a:Close()
	end)
end

do -- misc
	define("is_synapse_function", iskrnlclosure)
	define("is_protosmasher_closure", iskrnlclosure)
	define("is_protosmasher_caller", checkcaller)
	define("is_lclosure", islclosure)
	define("iswindowactive", isrbxactive)
	define("validfgwindow", isrbxactive)
	define("getprops", getproperties)
	define("gethiddenprop", gethiddenproperty)
	define("gethiddenprops", none)
	define("sethiddenprop", sethiddenproperty)
	define("getpcdprop", none)
	define("getsynasset", getcustomasset)
	define("htgetf", function(url)
		return game:HttpGet(url)
	end)
	define("gbmt", function()
		return oldmt
	end)
	define("getpropvalue", function(obj, prop)
		return cloneref(obj)[prop]
	end)
	define("setpropvalue", function(obj, prop, value)
		obj = cloneref(obj)
		local conn1 = obj:GetPropertyChangedSignal(prop)
		local conn2 = obj.Changed
		connection(conn1, false)
		connection(conn2, false)
		obj[prop] = value
		connection(conn1, true)
		connection(conn2, true)
	end)
	define("getstates", none)
	define("getstateenv", none)
	define("getinstancefromstate", none)
	define("is_redirection_enabled", function()
		return false
	end)
end

do -- get_ (who even uses these??)
	define("get_calling_script", getcallingscript)
	define("get_instances", getinstances)
	define("get_nil_instances", getnilinstances)
	define("get_scripts", getscripts)
	define("get_loaded_modules", getloadedmodules)
end

do -- rconsole
	local function ArgsToMsg(...)
		local msg = {...}
		for i,v in next, msg do
			msg[i] = tostring(v)
		end
		return table.concat(msg, " ")
	end
	define("rconsoleinputasync", function()
		consolecreate()
		
		task.spawn(function()
			return rconsoleinput()
		end)
	end)
	define("printconsole", function(...)
		local msg = ArgsToMsg(...)
		rconsoleprint(msg)
	end)
end

do -- unavailable (this is only to put them into the environment, they dont actually do anything)
	-- there are other unavailable functions but cba to move them here
	local funcs = {
		"getlocal",
		"getlocals",
		"setlocal",
		"getcallstack",
		"isuntouched",
		"setuntouched",
		"setupvaluename",
		"XPROTECT",
		"getpointerfromstate",
		"setnonreplicatedproperty",
		"readbinarystring"
	}
	for _,v in next, funcs do
		define(v, none)
	end
end

do -- syn library
	local t = {}

	define("cache_replace", cache.replace, t)
	define("cache_invalidate", cache.invalidate, t)
	define("is_cached", cache.iscached, t)

	define("get_thread_identity", getthreadcontext, t)
	define("set_thread_identity", setthreadcontext, t)

	define("write_clipboard", setclipboard, t)
	define("queue_on_teleport", queue_on_teleport, t)

	define("protect_gui", ProtectInstance, t) -- credit to iris (https://api.irisapp.ca/Scripts/docs/IrisProtectInstance)
	define("unprotect_gui", UnProtectInstance, t)
	--[[local Protected = {}
	define("protect_gui", function(obj)
		assert(typeof(obj) == "Instance", "bad argument #1 to 'protect_gui' (Instance expected, got "..typeof(obj)..")")
		local p = obj.parent
		if p then
			Protected[obj] = p
		end

		obj.Parent = gethui()
		task.spawn(function()
			local conn;conn = obj.AncestryChanged:Connect(function(_, p)
				-- most scripts parent it to coregui right after protecting (cuz thats how ur supposed to use it)
				task.wait()
				obj.Parent = gethui()
				Protected[obj] = p -- save the original parent for unprotecting
			end)
			task.wait(2)
			conn:Disconnect()
		end)
	end, t)
	define("unprotect_gui", function(obj)
		assert(typeof(obj) == "Instance", "bad argument #1 to 'protect_gui' (Instance expected, got "..typeof(obj)..")")
		local p = Protected[obj]
		if p then
			obj.Parent = p
		end
	end, t)]]
	
	define("is_beta", function()
		return false
	end, t)
	define("request", request, t)

	local c = crypt
	local crypt = {}
	define("encrypt", none, crypt)
	define("decrypt", none, crypt)
	define("hash", sha384_hash, crypt)
	define("derive", none, t)
	define("random", none, crypt)

	local base64 = {}
	define("encode", base64_encode, base64)
	define("decode", base64_decode, base64)
	define("base64", base64, crypt)

	local lz4 = {}
	define("compress", lz4compress, lz4)
	--define("decompress", lz4decompress, lz4)
	define("lz4", lz4, crypt)

	local custom = {}
	define("encrypt", none, custom)
	define("decrypt", none, custom)
	define("hash", sha384_hash, custom)
	define("custom", custom, crypt)
	define("crypt", crypt, t)
	define("crypto", crypt, t)

	define("websocket", WebSocket, t)

	define("secure_call", function(func, env, ...)
		assert(typeof(func) == "function", "bad argument to #1 to 'secure_call' (function expected, got "..typeof(func)..")")
		assert(typeof(env) == "Instance", "bad argument to #2 to 'secure_call' (Instance expected, got"..typeof(env)..")")
		assert(env.ClassName == "LocalScript" or env.ClassName == "ModuleScript", "bad argument to #2 to 'secure_call' (LocalScript or ModuleScript expected, got "..env.ClassName..")")
		return coroutine.wrap(function(...)
			setthreadcontext(2)
			setfenv(0, getsenv(env))
			setfenv(1, getsenv(env))
			return func(...)
		end)(...)
	end, t)

	local unavailable = {
		"create_secure_function",
		"run_secure_function",
		"run_secure_lua",
		"secrun"
	}
	for _,v in next, unavailable do
		define(v, none, t)
	end

	define("syn", t)
end

setreadonly(syn, true)

define("ror", bit.rrotate, bit)
define("rol", bit.lrotate, bit)
define("tohex", function(a)
	return tonumber(string.format("%08x", a % 4294967296))
end, bit)

-- pasted from synapse to scriptware
