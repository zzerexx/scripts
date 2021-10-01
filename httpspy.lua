assert(rconsoleprint ~= nil,"your exploit doesnt have rconsoleprint")

rconsolename("Http Spy")
rconsoleprint("@@LIGHT_CYAN@@")
rconsoleprint(" http spy made by zzerexx#3970\n")
rconsoleprint("@@LIGHT_GRAY@@")

get = hookfunction(game.HttpGet,function(self,url,...)
	rconsoleprint("@@LIGHT_GRAY@@")
	rconsoleprint("[")
	rconsoleprint("@@LIGHT_BLUE@@")
	rconsoleprint("GET")
	rconsoleprint("@@LIGHT_GRAY@@")
	rconsoleprint("]")
	rconsoleprint(" game:HttpGet	   | "..url.."\n")
	return get(self,url,...)
end)

getasync = hookfunction(game.HttpGetAsync,function(self,url,...)
	rconsoleprint("@@LIGHT_GRAY@@")
	rconsoleprint("[")
	rconsoleprint("@@LIGHT_BLUE@@")
	rconsoleprint("GET")
	rconsoleprint("@@LIGHT_GRAY@@")
	rconsoleprint("]")
	rconsoleprint(" game:HttpGetAsync  | "..url.."\n")
	return getasync(self,url,...)
end)

post = hookfunction(game.HttpPost,function(self,url,...)
	rconsoleprint("@@LIGHT_GRAY@@")
	rconsoleprint("[")
	rconsoleprint("@@LIGHT_GREEN@@")
	rconsoleprint("POST")
	rconsoleprint("@@LIGHT_GRAY@@")
	rconsoleprint("]")
	rconsoleprint(" game:HttpPost	  | "..url.."\n")
	return post(self,url,...)
end)

postasync = hookfunction(game.HttpPostAsync,function(self,url,...)
	rconsoleprint("@@LIGHT_GRAY@@")
	rconsoleprint("[")
	rconsoleprint("@@LIGHT_GREEN@@")
	rconsoleprint("POST")
	rconsoleprint("@@LIGHT_GRAY@@")
	rconsoleprint("]")
	rconsoleprint(" game:HttpPostAsync | "..url.."\n")
	return postasync(self,url,...)
end)

if syn then
	synreq = hookfunction(request,function(data)
		rconsoleprint("@@LIGHT_GRAY@@")
		rconsoleprint("[")
		rconsoleprint(
			(data.Method == "GET" and "@@LIGHT_BLUE@@") or
			(data.Method == "POST" and "@@LIGHT_GREEN@@") or
			(data.Method == "PATCH" and "@@ORANGE@@") or
			"@@LIGHT_BLUE@@"
		)
		rconsoleprint(data.Method or "GET")
		rconsoleprint("@@LIGHT_GRAY@@")
		rconsoleprint(((data.Method == nil or #data.Method == 3) and "] ") or (#data.Method > 3 and "]"))
		rconsoleprint(" syn.request		| "..data.Url.."\n")
		return synreq(data)
	end)
end

if request then
	req = hookfunction(request,function(data)
		rconsoleprint("@@LIGHT_GRAY@@")
		rconsoleprint("[")
		rconsoleprint(
			(data.Method == "GET" and "@@LIGHT_BLUE@@") or
			(data.Method == "POST" and "@@LIGHT_GREEN@@") or
			(data.Method == "PATCH" and "@@MAGENTA@@") or 
			"@@LIGHT_BLUE@@"
		)
		rconsoleprint(data.Method or "GET")
		rconsoleprint("@@LIGHT_GRAY@@")
		rconsoleprint(((data.Method == nil or #data.Method == 3) and "] ") or (#data.Method > 3 and "]"))
		rconsoleprint(" request			| "..data.Url.."\n")
		return req(data)
	end)
end
