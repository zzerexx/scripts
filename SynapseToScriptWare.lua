local syn = {
	cache_replace = cache.replace,
	cache_invalidate = cache.invalidate,
	is_cached = cache.iscached,
	set_thread_identity = setthreadidentity,
	write_clipboard = setclipboard,
	queue_on_teleport = queue_on_teleport,
	protect_gui = function(obj)
		obj.Parent = gethui()
	end,
	unprotect_gui = function(obj)
		obj.Parent = game.CoreGui
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
function getsynasset(path)
	return getcustomasset(path)
end
