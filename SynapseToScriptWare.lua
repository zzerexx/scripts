getgenv().protected = {}
local mt = getrawmetatable(game)
local oldnc = mt.__namecall
setreadonly(mt,false)
mt.__namecall = newcclosure(function(self,...) -- protect_gui thing
	local args = {...}
	if self == game and getnamecallmethod() == "FindFirstChild" and args[2] ~= nil and args[2] == true then
		for i,v in next, getgenv().protected do
			if args[1] == v.Name then
				return false
			end
		end
	end
	return oldnc(self,...)
end)
setreadonly(mt,true)

local functions = {
	['syn_websocket_connect'] = WebSocket.connect,
	['syn_websocket_send'] = WebSocket.Send,
	['syn_websocket_close'] = WebSocket.Close,
	
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
	['syn_dumpstring'] = function(script)
		return disassemble(getscriptbytecode(script)) -- i think thats how it works?
	end,
	['syn_islclosure'] = islclosure,
	['syn_checkcaller'] = checkcaller,
	['syn_clipboard_set'] = setclipboard,
	['syn_newcclosure'] = newcclosure,
	['syn_decompile'] = decompile,
	['syn_getloadedmodules'] = getloadedmodules,
	['syn_getcallingscript'] = getcallingscript,
	['syn_isactive'] = isrbxactive,
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
	['get_calling_script'] = getcallingscript,
	--['clonefunction'] = nil,
	['getpcdprop'] = getpcd,
	--['setupvaluename'] = nil,

}

for i,v in next, functions do
    getgenv()[i] = v
end

getgenv().syn = {
	['cache_replace'] = cache.replace,
	['cache_invalidate'] = cache.invalidate,
	['is_cached'] = cache.iscached,
	['set_thread_identity'] = setthreadidentity,
	['write_clipboard'] = setclipboard,
	['queue_on_teleport'] = queue_on_teleport,
	['protect_gui'] = function(obj)
		if typeof(obj) ~= "Instance" then
        		error("Attempted to protect a "..typeof(obj))
    		end
		table.insert(getgenv().protected,#getgenv().protected+1,obj)
    		for i,v in next, obj:GetDescendants() do
        		table.insert(getgenv().protected,#getgenv().protected+1,v)
    		end
		obj.DescendantAdded:Connect(function(d)
        		if table.find(getgenv().protected,obj) then
            			table.insert(getgenv().protected,#getgenv().protected+1,d)
        		end
    		end)
	end,
	['unprotect_gui'] = function(obj)
		if typeof(obj) ~= "Instance" then
        		error("Attempted to unprotect a "..typeof(obj))
    		end
		table.remove(getgenv().protected,table.find(getgenv().protected,obj))
    		for i,v in next, obj:GetDescendants() do
        		if table.find(getgenv().protected,v) then
            			table.remove(getgenv().protected,table.find(getgenv().protected,v))
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
	--['secure_call'] = nil,
	--['create_secure_function'] = nil,
	--['run_secure_function'] = nil,
}
warn("Synapse To Script-Ware has loaded!")
