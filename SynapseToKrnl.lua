if getgenv().SYNTOKRNL_LOADED then return end
getgenv().protected = protected or {}
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

local functions = {
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
	
	['syn_crypt_b64_encode'] = base64_encode,
	['syn_crypt_b64_decode'] = base64_decode,
	['syn_crypt_hash'] = sha384_hash,
	
	['syn_getgenv'] = getgenv,
	['syn_getrenv'] = getrenv,
	['syn_getsenv'] = getsenv,
	['syn_getreg'] = getreg,
	['syn_getgc'] = getgc,
	['syn_getinstances'] = getinstances,
	['getsynasset'] = getcustomasset,
	['syn_context_set'] = setthreadcontext,
	['syn_context_get'] = getthreadcontext,
	['syn_setfflag'] = setfflag,
	['syn_islclosure'] = islclosure,
	['syn_checkcaller'] = checkcaller,
	['syn_clipboard_set'] = setclipboard,
	['syn_newcclosure'] = newcclosure,
	['syn_decompile'] = decompile,
	['syn_getloadedmodules'] = getloadedmodules,
	['syn_getcallingscript'] = getcallingscript,
	['syn_isactive'] = isrbxactive,
	['get_calling_script'] = getcallingscript,
	['is_synapse_function'] = iskrnlclosure,

	['iswindowactive'] = isrbxactive,
	['gethiddenprop'] = gethiddenproperty,
	['sethiddenprop'] = sethiddenproperty,
}

for i,v in next, functions do
    getgenv()[i] = v
end

getgenv().syn = {
	['set_thread_identity'] = setthreadcontext,
	['get_thread_identity'] = getthreadcontext,
	['write_clipboard'] = setclipboard,
	['queue_on_teleport'] = queue_on_teleport,
	['protect_gui'] = function(obj)
		assert(typeof(obj) == "Instance","bad argument #1 to 'protect_gui' (Instance expected, got "..typeof(obj)..")")
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
		assert(table.find(protected,obj) ~= nil,obj.." is already protected")
		assert(typeof(obj) == "Instance","bad argument #1 to 'unprotect_gui' (Instance expected, got "..typeof(obj)..")")
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
		['base64'] =  {
			['encode'] = base64_encode,
			['decode'] = base64_decode
		},
		['hash'] = sha384_hash,
	},
	['websocket'] = {
		['connect'] = WebSocket.connect
	},
}

getgenv().SYNTOKRNL_LOADED = true
