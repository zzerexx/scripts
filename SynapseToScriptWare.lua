if getgenv().SYNTOSW_LOADED then return end
local protected = {}
local consolecolor = "white"
local newline = false
local oldnc
oldnc = hookmetamethod(game,"__namecall",function(...) -- protect_gui thing
    local args = {...}
    if args[1] == game and getnamecallmethod() == "FindFirstChild" and args[3] == true then
		if table.find(protected,args[2]) then
			return false
		end
    end
    return oldnc(...)
end)

local functions = {
	['syn_websocket_connect'] = WebSocket.connect,
	['syn_websocket_send'] = function(socket,msg)
		socket:Send(msg)	
	end,
	['syn_websocket_close'] = function(socket)
		socket:Close()	
	end,
	
	['syn_io_read'] = readfile,
	['syn_io_write'] = writefile,
	['syn_io_append'] = appendfile,
	['syn_io_makefolder'] = makefolder,
	['syn_io_listdir'] = listfiles,
	['syn_io_isfile'] = isfile,
	['syn_io_isfolder'] = isfolder,
	['syn_io_delfile'] = delfile,
	['syn_io_delfolder'] = delfolder,
	
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
	
	['syn_crypt_encrypt'] = crypt.encrypt,
	['syn_crypt_decrypt'] = crypt.decrypt,
	['syn_crypt_b64_encode'] = crypt.base64encode,
	['syn_crypt_b64_decode'] = crypt.base64decode,
	['syn_crypt_random'] = crypt.generatekey,
	['syn_crypt_hash'] = crypt.hash,
	['syn_crypt_derive'] = function(_,len)
		return crypt.generatebytes(len)
	end,
	
	['syn_getgenv'] = getgenv,
	['syn_getrenv'] = getrenv,
	['syn_getsenv'] = getsenv,
	['syn_getmenv'] = getmenv,
	['syn_getreg'] = getreg,
	['syn_getgc'] = getgc,
	['syn_getinstances'] = getinstances,
	['getsynasset'] = getcustomasset,
	['syn_context_set'] = setthreadidentity,
	['syn_context_get'] = getthreadidentity,
	['syn_setfflag'] = setfflag,
	['syn_dumpstring'] = dumpstring,
	['syn_islclosure'] = islclosure,
	['syn_checkcaller'] = checkcaller,
	['syn_clipboard_set'] = setclipboard,
	['syn_newcclosure'] = newcclosure,
	['syn_decompile'] = decompile,
	['syn_getloadedmodules'] = getloadedmodules,
	['syn_getcallingscript'] = getcallingscript,
	['syn_isactive'] = isrbxactive,
	['get_calling_script'] = getcallingscript,
	['is_synapse_function'] = isourclosure,

	['iswindowactive'] = isrbxactive,
	['gethiddenprop'] = gethiddenproperty,
	['gethiddenprops'] = gethiddenproperties,
	['sethiddenprop'] = sethiddenproperty,
	['getlocals'] = debug.getlocals,
	--['getstates'] = nil,
	--['validfgwindow'] = nil,
	--['readbinarystring'] = nil,
	--['isuntouched'] = nil,
	--['setuntouched'] = nil,
	--['clonefunction'] = nil,
	['getpcdprop'] = getpcd,
	--['setupvaluename'] = nil,
	['rconsoleprint'] = function(msg)
		consolecreate()
		if string.find(msg,"@@") then
			consolecolor = msg:gsub("@@",""):lower()
			consolecolor = consolecolor:gsub("brown","white"):gsub("light_gray","white"):gsub("dark_gray","white"):gsub("light_blue","blue"):gsub("light_green","green"):gsub("light_cyan","cyan"):gsub("light_red","red"):gsub("light_magenta","magenta")
		else
			if newline then
				consoleprint("\n"..msg,consolecolor)
			else
				consoleprint(msg,consolecolor)
			end
		end
		newline = false
	end,
	['rconsoleinfo'] = function(msg)
		consolecreate()
		consoleprint("\n[","white")
		consoleprint("INFO","cyan")
		consoleprint("] ","white")
		consoleprint(msg,consolecolor)
		newline = true
	end,
	['rconsolewarn'] = function(msg)
		consolecreate()
		consoleprint("\n[","white")
		consoleprint("WARNING","yellow")
		consoleprint("] ","white")
		consoleprint(msg,consolecolor)
		newline = true
	end,
	['rconsoleerr'] = function(msg)
		consolecreate()
		consoleprint("\n[","white")
		consoleprint("ERROR","red")
		consoleprint("] ","white")
		consoleprint(msg,consolecolor)
		newline = true
	end,
	['rconsolename'] = function(title)
		consolecreate()
		consolesettitle(title)
	end,
	['printconsole'] = output,
	['rconsoleclose'] = function() return "lol" end
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
		if typeof(obj) ~= "Instance" then
        	error("Attempted to protect a "..typeof(obj))
    	end
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
		if typeof(obj) ~= "Instance" then
        	error("Attempted to unprotect a "..typeof(obj))
    	end
		table.remove(protected,table.find(protected,obj))
		for i,v in next, obj:GetDescendants() do
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
		['hash'] = crypt.hash,
		['derive'] = function(value,len)
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
	},
	['websocket'] = {
		['connect'] = WebSocket.connect
	},
}

getgenv().SYNTOSW_LOADED = true
