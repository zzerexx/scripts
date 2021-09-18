if getgenv().SYNTOSW_LOADED then return end
getgenv().protected = protected or {}
local consolecolor, colors = "white", {
	['brown'] = "white",
	['light_gray'] = "white",
	['dark_gray'] = "white",
	['light_blue'] = "blue",
	['light_green'] = "green",
	['light_cyan'] = "cyan",
	['light_red'] = "red",
	['light_magenta'] = "magenta"
}
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

function encrypt(data,key)
	local nonce = crypt.generatekey()
	local a = crypt.custom_encrypt(data,key,nonce,"CBC")
	return crypt.base64encode(a.."::"..nonce)
end
function decrypt(data,key)
	return crypt.custom_decrypt(crypt.base64decode(data):split("::")[1],key,crypt.base64decode(data):split("::")[2],"CBC")
end

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
	['syn_crypt_encrypt'] = encrypt,
	['syn_crypt_decrypt'] = decrypt,
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
	['getspecialinfo'] = function(obj)
		assert(typeof(obj) == "Instance","bad argument #1 to 'getspecialinfo' (Instance expected, got "..typeof(obj)..")")
		if obj.ClassName == "MeshPart" then
			return {
				['PhysicsData'] = gethiddenproperty(obj,"PhysicsData"),
				['InitialSize'] = gethiddenproperty(obj,"InitialSize")
			}
		elseif obj.ClassName == "UnionOperations" then
			return {
				['AssetId'] = gethiddenproperty(obj,"AssetId"),
				['ChildData'] = gethiddenproperty(obj,"ChildData"),
				['FormFactor'] = gethiddenproperty(obj,"FormFactor"),
				['InitialSize'] = gethiddenproperty(obj,"InitialSize"),
				['MeshData'] = gethiddenproperty(obj,"MeshData"),
				['PhysicsData'] = gethiddenproperty(obj,"PhysicsData")
			}
		elseif obj.ClassName == "Terrain" then
			return {
				['SmoothGrid'] = gethiddenproperty(obj,"SmoothGrid"),
				['MaterialColors'] = gethiddenproperty(obj,"MaterialColors")
			}
		end
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
			consolecolor = consolecolor:gsub(consolecolor,colors[consolecolor] or "white")
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
	--['setscriptable'] = nil,
	--['getlocal'] = nil,
	--['getlocals'] = nil,
	--['getpropvalue'] = nil,
	--['setpropvalue'] = nil,
	--['getstates'] = nil,
	--['readbinarystring'] = nil,
	--['isuntouched'] = nil,
	--['setuntouched'] = nil,
	--['setupvaluename'] = nil,
	--['XPROTECT'] = nil,
	--['is_redirection_enabled'] = nil,
	--['getpointerfromstate'] = nil,
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
		['encrypt'] = encrypt,
		['decrypt'] = decrypt,
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
				return crypt.custom_encrypt(data,key,nonce,cipher)
			end,
			['decrypt'] = function(cipher,data,key,nonce)
				return crypt.custom_decrypt(data,key,nonce,cipher)
			end,
			['hash'] = function(alg,data)
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
	--['secure_call'] = function(func,s,...)
	--	assert(typeof(func) == "function","bad argument to #1 to 'secure_call' (function expected, got "..typeof(func)..")")
	--	assert(s.ClassName == ("LocalScript" or "ModuleScript"),"bad argument to #2 to 'secure_call' (LocalScript or ModuleScript expected, got "..s.ClassName..")")
	--end,
	--['create_secure_function'] = nil,
	--['run_secure_function'] = nil,
	--['run_secure_lua'] = nil,
	--['secrun'] = nil,
}
getgenv().bit.ror = bit.rrotate
getgenv().bit.rol = bit.lrotate
getgenv().bit.tohex = function(a)
	return tonumber(string.format("%08x", a % 4294967296))
end

getgenv().SYNTOSW_LOADED = true
