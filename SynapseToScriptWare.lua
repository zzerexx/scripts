assert(identifyexecutor():find("ScriptWare"),"you are not using script ware")
getgenv().protected = protected or {}
getgenv().temp = temp or {}
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
getgenv().Drawing.Fonts = {
	['UI'] = 0,
	['System'] = 0,
	['Plex'] = 1,
	['Monospace'] = 2
}

local headers = game:GetService("HttpService"):JSONDecode(request({Url = "https://httpbin.org/get"}).Body).headers
oldr = hookfunction(request,function(options)
	local h = options.Headers or {}
	h['Syn-Fingerprint'] = headers['Sw-Fingerprint']
	h['Syn-User-Identifier'] = headers['Sw-User-Identifier']
	h['User-Agent'] = headers['User-Agent']
	return oldr({
		Url = options.Url,
		Method = options.Method or "GET",
		Headers = h,
		Cookies = options.Cookies or {},
		Body = options.Body or ""
	})
end)
oldd = hookfunction(Drawing.new,function(class)
	local obj = oldd(class)
	local t = {
		['__OBJECT'] = obj,
		['__OBJECT_EXISTS'] = true
	}
	function t:Remove()
		obj:Remove()
		t.__OBJECT_EXISTS = false
	end
	setmetatable(t,{
		__index = function(_,i)
			if i == ("__OBJECT" or "__OBJECT_EXISTS") then
				return obj
			else
				return obj[i]
			end
		end,
		__newindex = function(_,i,v)
			obj[i] = v
		end
	})
	return t
end)

local oldmt = getrawmetatable(game)

oldnc = hookmetamethod(game,"__namecall",function(...)
    local args = {...}
    if args[1] == game and getnamecallmethod() == "FindFirstChild" and args[3] == true then
		for _,v in next, protected do
			if v.Name == args[2] then
				return nil
			end
		end
    end
    return oldnc(...)
end)
oldidx = hookmetamethod(game,"__index",function(...)
	local self = ({...})[1]
	for _,v in next, temp do
		if self:GetFullName() == v then
			return nil
		end
	end
	return oldidx(...)
end)
oldnew = hookmetamethod(game,"__newindex",function(...)
	local self = ({...})[1]
	for _,v in next, temp do
		if self:GetFullName() == v then
			return nil
		end
	end
	return oldnew(...)
end)

local functions = {
	-- syn_ filesystem
	['syn_io_read'] = readfile,
	['syn_io_write'] = writefile,
	['syn_io_append'] = appendfile,
	['syn_io_makefolder'] = makefolder,
	['syn_io_listdir'] = listfiles,
	['syn_io_isfile'] = isfile,
	['syn_io_isfolder'] = isfolder,
	['syn_io_delfile'] = delfile,
	['syn_io_delfolder'] = delfolder,
	-- syn_ input
	['syn_mouse1click'] = mouse1click,
	['syn_mouse1press'] = mouse1press,
	['syn_mouse1release'] = mouse1release,
	['syn_mouse2click'] = mouse2click,
	['syn_mouse2press'] = mouse2press,
	['syn_mouse2release'] = mouse2release,
	['syn_mousescroll'] = mousescroll,
	['syn_mousemoverel'] = mousemoverel,
	['syn_mousemoveabs'] = mousemoveabs,
	['syn_keypress'] = keypress,
	['syn_keyrelease'] = keyrelease,
	-- syn_ crypt
	['syn_crypt_encrypt'] = crypt.encrypt,
	['syn_crypt_decrypt'] = crypt.decrypt,
	['syn_crypt_b64_encode'] = crypt.base64encode,
	['syn_crypt_b64_decode'] = crypt.base64decode,
	['syn_crypt_random'] = crypt.generatekey,
	['syn_crypt_hash'] = function(data)
		return crypt.hash(data,"sha384")
	end,
	['syn_crypt_derive'] = function(_,len)
		return crypt.generatebytes(len)
	end,
	-- syn_
	['syn_getgenv'] = getgenv,
	['syn_getrenv'] = getrenv,
	['syn_getsenv'] = getsenv,
	['syn_getmenv'] = getmenv,
	['syn_getreg'] = getreg,
	['syn_getgc'] = getgc,
	['syn_getinstances'] = getinstances,
	['syn_context_set'] = setthreadidentity,
	['syn_context_get'] = getthreadidentity,
	['syn_setfflag'] = setfflag,
	['syn_dumpstring'] = dumpstring,
	['syn_islclosure'] = islclosure,
	['syn_checkcaller'] = checkcaller,
	['syn_clipboard_set'] = setclipboard,
	['syn_newcclosure'] = newcclosure,
	['syn_decompile'] = function(s)
		return disassemble(getscriptbytecode(s))
	end,
	['syn_getloadedmodules'] = getloadedmodules,
	['syn_getcallingscript'] = getcallingscript,
	['syn_isactive'] = isrbxactive,
	-- stuff
	['is_synapse_function'] = isourclosure,
	['is_protosmasher_closure'] = isourclosure,
	['is_protosmasher_caller'] = checkcaller,
	['is_lclosure'] = islclosure,
	['iswindowactive'] = isrbxactive,
	['validfgwindow'] = isrbxactive,
	['getprops'] = getproperties,
	['gethiddenprop'] = gethiddenproperty,
	['gethiddenprops'] = gethiddenproperties,
	['sethiddenprop'] = sethiddenproperty,
	['getpcdprop'] = getpcd,
	['getsynasset'] = getcustomasset,
	['htgetf'] = game.HttpGet,
	['gbmt'] = function()
		return oldmt
	end,
	['setscriptable'] = sethidden,
	['getpropvalue'] = function(obj,prop)
		table.insert(temp,obj:GetFullName())
		delay(0,function() table.remove(temp,table.find(temp,obj:GetFullName())) end)
		return obj[prop]
	end,
	['setpropvalue'] = function(obj,prop,value)
		table.insert(temp,obj:GetFullName())
		obj[prop] = value
		table.remove(temp,table.find(temp,obj:GetFullName()))
	end,
	-- get_
	['get_calling_script'] = getcallingscript,
	['get_instances'] = getinstances,
	['get_nil_instances'] = getnilinstances,
	['get_scripts'] = getscripts,
	['get_loaded_modules'] = getloadedmodules,
	-- rconsole
	['rconsoleprint'] = function(msg)
		consolecreate()
		if string.find(msg,"@@") then
			consolecolor = msg:gsub("@@",""):lower()
			consolecolor = consolecolor:gsub(consolecolor,colors[consolecolor])
		else
			consoleprint(msg,consolecolor)
		end
	end,
	['rconsoleinfo'] = function(msg)
		consolecreate()
		consoleprint("\n[*]: ","white")
		consoleprint(msg.."\n",consolecolor)
	end,
	['rconsolewarn'] = function(msg)
		consolecreate()
		consoleprint("\n[","white")
		consoleprint("*","yellow")
		consoleprint("]: ","white")
		consoleprint(msg.."\n",consolecolor)
	end,
	['rconsoleerr'] = function(msg)
		consolecreate()
		consoleprint("\n[","white")
		consoleprint("*","red")
		consoleprint("]: ","white")
		consoleprint(msg.."\n",consolecolor)
	end,
	['rconsolename'] = function(title)
		consolecreate()
		consolesettitle(title)
	end,
	['rconsoleinputasync'] = function()
		return spawn(consoleinput)
	end,
	['printconsole'] = output,
	['rconsoleclose'] = consoledestroy,
	-- unavailable
	--['getlocal'] = nil,
	--['getlocals'] = nil,
	--['getstates'] = nil,
	--['readbinarystring'] = nil,
	--['isuntouched'] = nil,
	--['setuntouched'] = nil,
	--['setupvaluename'] = nil,
	--['XPROTECT'] = nil,
	--['is_redirection_enabled'] = nil,
	--['getpointerfromstate'] = nil,
	--['getinstancefromstate'] = nil,
	--['getstates'] = nil,
	--['getstateenv'] = nil,
	--['setnonreplicatedproperty'] = nil,
}

for i,v in next, functions do
    getgenv()[i] = v
end

getgenv().syn = {
	['cache_replace'] = cache.replace,
	['cache_invalidate'] = cache.invalidate,
	['is_cached'] = cache.iscached,
	['set_thread_identity'] = setthreadidentity,
	['get_thread_identity'] = getthreadidentity,
	['write_clipboard'] = setclipboard,
	['queue_on_teleport'] = queue_on_teleport,
	['protect_gui'] = function(obj)
		assert(typeof(obj) == "Instance","bad argument #1 to 'protect_gui' (Instance expected, got "..typeof(obj)..")")
		assert(table.find(protected,obj) == nil,tostring(obj.Name).." is already protected")
		table.insert(protected,obj)
    	for i,v in next, obj:GetDescendants() do
        	table.insert(protected,v)
    	end
		local c
		c = obj.DescendantAdded:Connect(function(d)
			if table.find(protected,obj) then
				table.insert(protected,d)
			else
				c:Disconnect()
			end
		end)
	end,
	['unprotect_gui'] = function(obj)
		assert(typeof(obj) == "Instance","bad argument #1 to 'unprotect_gui' (Instance expected, got "..typeof(obj)..")")
		assert(table.find(protected,obj) ~= nil,obj.Name.." is not protected")
		table.remove(protected,table.find(protected,obj))
		for _,v in next, obj:GetDescendants() do
			if table.find(protected,v) then
				table.remove(protected,table.find(protected,v))
			end
		end
	end,
	['is_beta'] = function()
		return false
	end,
	['request'] = request,
	['crypt'] = {
		['encrypt'] = crypt.encrypt,
		['decrypt'] = crypt.decrypt,
		['base64'] =  {
			['encode'] = crypt.base64encode,
			['decode'] = crypt.base64decode
		},
		['hash'] = function(data)
			return crypt.hash(data,"sha384")
		end,
		['derive'] = function(_,len)
			return crypt.generatebytes(len)
		end,
		['random'] = crypt.generatekey,
		['custom'] = {
			['encrypt'] = function(cipher,data,key,nonce)
				assert(cipher:find("eax"),"aes-eax is not supported")
				assert(cipher:find("bf"),"Blowfish ciphers are not supported")
				return crypt.custom_encrypt(data,key,nonce,ciphers[cipher:gsub("_","-")])
			end,
			['decrypt'] = function(cipher,data,key,nonce)
				assert(cipher:find("eax"),"aes-eax is not supported")
				assert(cipher:find("bf"),"Blowfish ciphers are not supported")
				return crypt.custom_decrypt(data,key,nonce,ciphers[cipher:gsub("_","-")])
			end,
			['hash'] = function(alg,data)
				assert(alg ~= ("sha224" or "sha3-384"),alg.." is not supported")
				return crypt.hash(data,alg)
			end
		},
		['lz4'] = {
			['compress'] = lz4compress
		}
	},
	['websocket'] = {
		['connect'] = WebSocket.connect
	},
	['secure_call'] = function(func,env,...)
		assert(typeof(func) == "function","bad argument to #1 to 'secure_call' (function expected, got "..typeof(func)..")")
		assert(env.ClassName == ("LocalScript" or "ModuleScript"),"bad argument to #2 to 'secure_call' (LocalScript or ModuleScript expected, got "..env.ClassName..")")
		setfenv(0,getsenv(env))
		setfenv(1,getsenv(env))
		return func(...)
	end,
	--['create_secure_function'] = nil,
	--['run_secure_function'] = nil,
	--['run_secure_lua'] = nil,
	--['secrun'] = nil,
}
getgenv().decompile = function(s)
	return disassemble(getscriptbytecode(s))
end
getgenv().syn.crypto = syn.crypt
getgenv().bit.ror = bit.rrotate
getgenv().bit.rol = bit.lrotate
getgenv().bit.tohex = function(a)
	return tonumber(string.format("%08x", a % 4294967296))
end
