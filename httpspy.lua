assert(rconsoleprint ~= nil, "your exploit doesnt have rconsoleprint")

if import then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/SynapseToScriptWare.lua"))()
end

local uis = game:GetService("UserInputService")
local methodcolors = {
	GET = "light blue",
	POST = "light green",
	PATCH = "orange",
	HEAD = "magenta",
	DELETE = "red"
}
local hooks = {}
local loaded = false

local BLOCK_WEBHOOKS = false
local BLOCK_REQUESTS = false
local PAUSED = false

local print = rconsoleprint
local function color(c)
	print("@@"..c:upper():gsub(" ", "_").."@@")
end
local function prefix(text, _color, spaced, newline)
	color("light gray")
	print("[")
	print(spaced and " " or "")
	color(_color)
	print(text)
	print(spaced and " " or "")
	color("light gray")
	print("] ")
	print(newline and "\n" or "")
end
local function nameprefix(name, method)
	local spaces1 = 7 - method:len()
	local spaces2 = 21 - method:len() - spaces1 - name:len()
	for _ = 1, spaces1 do
		print(" ")
	end
	print(name)
	for _ = 1, spaces2 do
		print(" ")
	end
end
local function isblocked(url)
	return (BLOCK_WEBHOOKS and (url:find("webhook") or url:find("websec"))) or BLOCK_REQUESTS
end
local function hook(func, name, method, requestfunc)
	local old;old = hookfunction(func, requestfunc and function(data)
		local blocked = isblocked(data.Url)
		if not PAUSED then
			prefix(blocked and "BLOCKED" or "ALLOWED", blocked and "red" or "green")
			prefix(data.Method, methodcolors[data.Method])
			nameprefix(name, data.Method)
			print(" | "..data.Url.."\n")
		end
		if blocked then
			return {
				StatusMessage = "Bad request",
				Success = false,
				StatusCode = 400,
				Body = "",
				Headers = {}
			}
		end
		return old(data)
	end or function(self, url)
		local blocked = isblocked(url)
		if not PAUSED then
			prefix(blocked and "BLOCKED" or "ALLOWED", blocked and "red" or "green")
			prefix(method, methodcolors[method])
			nameprefix(name, method)
			print(" | "..url.."\n")
		end
		if blocked then
			return nil
		end
		return old(self, url)
	end)
	hooks[func] = old
end
local loading = false
local function start()
	if loading then return end
	loading = true
	rconsoleclear()
	prefix("http spy by zzerexx#3970", "cyan", true) prefix("v1.0.0", "cyan", true, true) print("\n")

	prefix("controls", "cyan", true, true)
	prefix("-", "green") prefix("focus on the roblox window to use these controls", "yellow", true, true)
	prefix("!", "red") prefix("toggling any of the settings will clear your logs", "yellow", true, true)

	prefix("CTRL + 1", "light green", true)  print("         clear logs\n")
	prefix("CTRL + 2", "light green", true)  print("         pause/resume log        ") prefix(PAUSED and "PAUSED" or "RUNNING", PAUSED and "red" or "green") print("\n")
	prefix("CTRL + 3", "light green", true)  print("         block discord webhooks  ") prefix(BLOCK_WEBHOOKS and "YES" or "NO", BLOCK_WEBHOOKS and "green" or "red") print("\n")
	prefix("CTRL + 4", "light green", true)  print("         block all requests      ") prefix(BLOCK_REQUESTS and "YES" or "NO", BLOCK_REQUESTS and "green" or "red") print("\n")
	prefix("CTRL + BACKSPACE", "light green", true)  print(" unload http spy\n\n")
	
	prefix("request log", "cyan", true, true)
	loading = false
end

rconsolename("Http Spy // zzerexx#3970")
start()

hook(game.HttpGet, "HttpGet", "GET", false)
hook(game.HttpGetAsync, "HttpGetAsync", "GET", false)
hook(game.HttpPost, "HttpPost", "POST", false)
hook(game.HttpPostAsync, "HttpPostAsync", "POST", false)
if syn then
	hook(syn.request, "syn.request", "", true)
end
if http then
	hook(http.request, "http.request", "", true)
end
for _,v in next, {"request", "http_request"} do
	if getgenv()[v] then
		hook(getgenv()[v], v, "", true)
	end
end
loaded = true

local CTRL_DOWN = false
uis.InputBegan:Connect(function(i, gp)
	if not gp then
		local key = i.KeyCode.Name
		if key:find("Control") then
			CTRL_DOWN = true
		end
		if loaded and CTRL_DOWN then
			if key == "One" then
				start()
			elseif key == "Two" then
				PAUSED = not PAUSED
				start()
				--prefix("request log has been "..(PAUSED and "paused" or "resumed"), "cyan", true) print("\n")
			elseif key == "Three" then
				BLOCK_WEBHOOKS = not BLOCK_WEBHOOKS
				start()
			elseif key == "Four" then
				BLOCK_REQUESTS = not BLOCK_REQUESTS
				start()
			elseif key == "Backspace" then
				for func,original in next, hooks do
					loaded = false
					hookfunction(func, original)
				end
				if rconsoleclose then
					rconsoleclose()
				else
					prefix("http spy has been unloaded", "red", true)
				end
			end
		end
	end
end)
uis.InputEnded:Connect(function(i, gp)
	if not gp then
		if i.KeyCode.Name:find("Control") then
			CTRL_DOWN = false
		end
	end
end)
