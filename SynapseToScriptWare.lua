assert(import, "you are not using script ware")

local hash = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/HashLib.lua"))() -- for sha3-384
local hashalgs = {"md2","md5","sha1","sha256","sha384","sha512","sha3-224","sha3-256","sha3-512","haval","ripemd128","ripemd160","ripemd256","ripemd320"}
local hashlibalgs = {"md5","sha1","sha224","sha256","sha512-224","sha512-256","sha384","sha512","sha3-224","sha3-256","sha3-384","sha3-512","hmac"}
local version = "v2.15.5"
local consolecolor, colors = "white", {
	['black'] = "black",
	['blue'] = "blue",
	['green'] = "green",
	['cyan'] = "cyan",
	['red'] = "red",
	['magenta'] = "magenta",
	['brown'] = "white",
	['light_gray'] = "white",
	['dark_gray'] = "white",
	['light_blue'] = "blue",
	['light_green'] = "green",
	['light_cyan'] = "cyan",
	['light_red'] = "red",
	['light_magenta'] = "magenta",
	['yellow'] = "yellow",
}
local ciphers = {
	['aes-cbc'] = "CBC",
	['aes-cfb'] = "CFB",
	['aes-ctr'] = "CTR",
	['aes-ofb'] = "OFB",
	['aes-gcm'] = "GCM"
	-- no aes-eax, bf-cbc, bf-cfb, bf-ofb
}
local specialinfo = {
	MeshPart = {
		"PhysicsData",
		"InitialSize"
	},
	UnionOperation = {
		"AssetId",
		"ChildData",
		"FormFactor",
		"InitialSize",
		"MeshData",
		"PhysicsData"
	},
	Terrain = {
		"SmoothGrid",
		"MaterialColors"
	}
}
getgenv().Drawing.Fonts = {
	['UI'] = 0,
	['System'] = 0,
	['Plex'] = 1,
	['Monospace'] = 2
}
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
	local Fingerprint = headers['Sw-Fingerprint']
	local UserIdentifier = headers['Sw-User-Identifier']
	local oldr;oldr = hookfunction(request, function(options)
		local h = options.Headers or {}
		h['Syn-Fingerprint'] = SWHWID or Fingerprint
		h['Syn-User-Identifier'] = SWUID or UserIdentifier
		h['User-Agent'] = "synx/"..version
		return oldr({
			Url = options.Url,
			Method = options.Method or "GET",
			Headers = h,
			Cookies = options.Cookies or {},
			Body = options.Body or ""
		})
	end)

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
		local name = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
		return olds(game, s, name)
	end)

	hookfunction(decompile, function(a) -- decompile fix thing
		return "-- Disassembled with the Script-Ware disassembler.\n\n"..disassemble(getscriptbytecode(a))
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
	define("syn_crypt_encrypt", crypt.encrypt)
	define("syn_crypt_decrypt", crypt.decrypt)
	define("syn_crypt_b64_encode", crypt.base64encode)
	define("syn_crypt_b64_decode", crypt.base64decode)
	define("syn_crypt_random", crypt.generatekey)
	define("syn_crypt_hash", function(data)
		return crypt.hash(data, "sha384")
	end)
	define("syn_crypt_derive", function(_, len)
		return crypt.generatebytes(len)
	end)
end

do -- syn_
	define("syn_getgenv", getgenv)
	define("syn_getrenv", getrenv)
	define("syn_getsenv", getsenv)
	define("syn_getmenv", getmenv)
	define("syn_getreg", getreg)
	define("syn_getgc", getgc)
	define("syn_getinstances", getinstances)
	define("syn_context_set", setidentity)
	define("syn_context_get", getidentity)
	define("syn_setfflag", setfflag)
	define("syn_dumpstring", dumpstring)
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
	define("is_synapse_function", isourclosure)
	define("is_protosmasher_closure", isourclosure)
	define("is_protosmasher_caller", checkcaller)
	define("is_lclosure", islclosure)
	define("iswindowactive", isrbxactive)
	define("validfgwindow", isrbxactive)
	define("getprops", getproperties)
	define("gethiddenprop", gethiddenproperty)
	define("gethiddenprops", gethiddenproperties)
	define("sethiddenprop", sethiddenproperty)
	define("getpcdprop", getpcd)
	define("getsynasset", getcustomasset)
	define("htgetf", function(url)
		return game:HttpGet(url)
	end)
	define("gbmt", function()
		return oldmt
	end)
	define("getpropvalue", function(obj,prop)
		return obj[prop]
	end)
	define("setpropvalue", function(obj,prop,value)
		local conn1 = obj:GetPropertyChangedSignal(prop)
		local conn2 = obj.Changed
		connection(conn1, false)
		connection(conn2, false)
		obj[prop] = value
		connection(conn1, true)
		connection(conn2, true)
	end)
	define("getstates", getallthreads)
	define("getstateenv", gettenv)
	define("getinstancefromstate", function(state)
		return gettenv(state).script
	end)
	define("is_redirection_enabled", function()
		return false
	end)
	define("getspecialinfo", function(obj)
		assert(typeof(obj) == "Instance", "bad argument to #1 'getspecialinfo' (Instance expected, got "..typeof(obj)..")")
		local info = specialinfo[obj.ClassName]
		local props = {}
		if info then
			for _,v in next, info do
				props[v] = gethiddenproperty(obj, v)
			end
		end
		return props
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
	define("rconsoleprint", function(...)
		consolecreate()

		local msg = ArgsToMsg(...)
		if msg:find("@@") then
			consolecolor = msg:gsub("@@", ""):lower()
			consolecolor = consolecolor:gsub(consolecolor, colors[consolecolor])
		else
			consoleprint(msg, consolecolor)
		end
	end)
	define("rconsoleinfo", function(...)
		consolecreate()

		consoleprint("\n[*]: ", "white")
		consoleprint(ArgsToMsg(...).."\n", consolecolor)
	end)
	define("rconsolewarn", function(...)
		consolecreate()

		consoleprint("\n[", "white")
		consoleprint("*", "yellow")
		consoleprint("]: ", "white")
		consoleprint(ArgsToMsg(...).."\n", consolecolor)
	end)
	define("rconsoleerr", function(...)
		consolecreate()

		consoleprint("\n[", "white")
		consoleprint("*", "red")
		consoleprint("]: ", "white")
		consoleprint(ArgsToMsg(...).."\n", consolecolor)
	end)
	define("rconsolename", function(...)
		consolecreate()

		consolesettitle(ArgsToMsg(...))
	end)
	define("rconsoleinputasync", function()
		consolecreate()
		
		task.spawn(function()
			return consoleinput()
		end)
	end)
	define("printconsole", function(...)
		local msg = ArgsToMsg(...)
		printuiconsole(msg)
	end)
	define("rconsoleclose", consoledestroy)
end

do -- unavailable (this is only to put them into the environment, they dont actually do anything)
	local funcs = {
		"getlocal",
		"setlocal",
		"getlocals",
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

	define("set_thread_identity", setidentity, t)
	define("get_thread_identity", getidentity, t)

	define("write_clipboard", setclipboard)
	define("queue_on_teleport", queue_on_teleport)

	local Protected = {}
	define("protect_gui", function(obj)
		assert(typeof(obj) == "Instance", "bad argument #1 to 'protect_gui' (Instance expected, got "..typeof(obj)..")")
		obj.Parent = gethui()
		task.spawn(function()
			local conn;conn = obj.AncestryChanged:Connect(function(_,p)
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
	end, t)
	
	define("is_beta", function()
		return false
	end, t)
	define("request", request, t)

	local c = crypt
	local crypt = {}
	define("encrypt", c.encrypt, crypt)
	define("decrypt", c.decrypt, crypt)
	define("hash", function(data)
		return c.hash(data, "sha384")
	end, crypt)
	define("derive", function(_, len)
		return c.generatebytes(len)
	end)
	define("random", c.generatekey, crypt)

	local base64 = {}
	define("encode", c.base64encode, base64)
	define("decode", c.base64decode, base64)
	define("base64", base64, crypt)

	local lz4 = {}
	define("compress", lz4compress, lz4)
	define("decompress", lz4decompress, lz4) -- ik synapse doesnt have this but idc it should have it
	define("lz4", lz4, crypt)

	local custom = {}
	define("encrypt", function(cipher, data, key, nonce)
		assert(cipher:find("eax"), "aes-eax is not supported")
		assert(cipher:find("bf"), "Blowfish ciphers are not supported")
		return crypt.custom_encrypt(data, key, nonce, ciphers[cipher:gsub("_", "-")])
	end, custom)
	define("decrypt", function(cipher, data, key, nonce)
		assert(cipher:find("eax"), "aes-eax is not supported")
		assert(cipher:find("bf"), "Blowfish ciphers are not supported")
		return crypt.custom_decrypt(data, key, nonce, ciphers[cipher:gsub("_", "-")])
	end, custom)
	define("hash", function(alg, data)
		alg = alg:lower():gsub("_", "-")
		local a,b = table.find(hashalgs, alg), table.find(hashlibalgs, alg)
		assert(a or b,"bad argument #1 to 'hash' (non-existant hash algorithm)")
		if a then
			return crypt.hash(data, alg):lower()
		elseif b then
			alg = alg:gsub("-","_")
			return hash[alg](data)
		end
	end, custom)
	define("crypt", crypt, t)

	define("websocket", WebSocket, t)

	define("secure_call", function(func, env, ...)
		assert(typeof(func) == "function", "bad argument to #1 to 'secure_call' (function expected, got "..typeof(func)..")")
		assert(typeof(env) == "Instance", "bad argument to #2 to 'secure_call' (Instance expected, got"..typeof(env)..")")
		assert(env.ClassName == "LocalScript" or env.ClassName == "ModuleScript", "bad argument to #2 to 'secure_call' (LocalScript or ModuleScript expected, got "..env.ClassName..")")
		return coroutine.wrap(function(...)
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

define("crypto", syn.crypt, syn)

define("ror", bit.rrotate, bit)
define("rol", bit.lrotate, bit)
define("tohex", function(a)
	return tonumber(string.format("%08x", a % 4294967296))
end, bit)
