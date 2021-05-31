local hooked = false
local mt = getrawmetatable(game)
local oldnc = mt.__namecall
setreadonly(mt,false)
mt.__namecall = newcclosure(function(self,...)
	local args = {...}
	if hooked and self == game and getnamecallmethod() == "FindFirstChild" and args[2] ~= nil and args[2] == true then
		return false
	end
	return oldnc(self,...)
end)
setreadonly(mt,true)
local syn =  {
	cache_replace = cache.replace,
	cache_invalidate = cache.invalidate,
	is_cached = cache.iscached,
	set_thread_identity = setthreadidentity,
	write_clipboard = setclipboard,
	queue_on_teleport = queue_on_teleport,
	protect_gui = function()
		hooked = true
	end,
	unprotect_gui = function()
		hooked = false
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
