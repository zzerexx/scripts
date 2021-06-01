getgenv().protected = {}
local mt = getrawmetatable(game)
local oldnc = mt.__namecall
setreadonly(mt,false)
mt.__namecall = newcclosure(function(self,...)
	local args = {...}
	if self == game and getnamecallmethod() == "FindFirstChild" and args[2] ~= nil and args[2] == true then
		for i,v in next, protected do
			if args[1] == v.Name then
				return false
			end
		end
	end
	return oldnc(self,...)
end)
setreadonly(mt,true)
return {
	cache_replace = cache.replace,
	cache_invalidate = cache.invalidate,
	is_cached = cache.iscached,
	set_thread_identity = setthreadidentity,
	write_clipboard = setclipboard,
	queue_on_teleport = queue_on_teleport,
	protect_gui = function(obj)
		if typeof(obj) ~= "Instance" then
        		error("Attempted to protect a "..typeof(obj))
    	end
    	table.insert(getgenv().protected,#getgenv().protected+1,obj)
    	for i,v in next, obj:GetDescendants() do
        	table.insert(getgenv().protected,#getgenv().protected+1,v)
    	end
	end,
	unprotect_gui = function(obj)
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
	is_beta = function()
		return false
	end,
	request = request,
	crypt = {
		encrypt = crypt.encrypt,
		decrypt = crypt.decrypt,
		base64 =  {
			encode = crypt.base64encode,
			decode = crypt.base64decode
		},
		hash = crypt.hash,
		derive = function(value,len)
			return crypt.generatebytes(len)
		end,
		random = crypt.generatekey,
		custom = {
			encrypt = function(cipher,data,key,nonce)
				return crypt.custom_encrypt(data,key,nonce,cipher)
			end,
			decrypt = function(cipher,data,key,nonce)
				return crypt.custom_decrypt(data,key,nonce,cipher)
			end,
			hash = function(alg,data)
				return crypt.hash(data,alg)
			end
		},
	},
	websocket = {
		connect = WebSocket.connect
	}
}
