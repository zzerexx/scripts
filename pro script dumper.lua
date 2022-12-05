local s = { -- pro script dumper settings
	decompile = true,
	dump_debug = false, -- output will include debug info such as constants, upvalues, protos, etc
	detailed_info = false, -- if dump_debug is enabled, it will dump more, detailed debug info
	threads = 5, -- how many scripts can be decompiled at a time
	timeout = 5, -- if decompilation takes longer than this duration (seconds), it will skip that script
	delay = 0.05,
	include_nil = false, -- set to true if u want to include nil scripts
	replace_username = true, -- replaces the localplayer's username in any objects with LocalPlayer
	disable_render = true, -- disables 3d rendering while dumping scripts
}

local decompile = decompile or disassemble
local getnilinstances = getnilinstances or get_nil_instances
local getscripthash = getscripthash or get_script_hash
local getscriptclosure = getscriptclosure
local getconstants = getconstants or debug.getconstants
local getprotos = getprotos or debug.getprotos
local getinfo = getinfo or debug.getinfo
local format = string.format
local concat = table.concat

local threads = 0
local scriptsdumped = 0
local timedoutscripts = {}
local decompilecache = {}
local progressbind = Instance.new("BindableEvent")
local plr = game:GetService("Players").LocalPlayer.Name
local ignoredservices = {"Chat", "CoreGui", "CorePackages"}
local ignored = {"PlayerModule", "RbxCharacterSounds", "PlayerScriptsLoader", "ChatScript", "BubbleChat"}
local RunService = game:GetService("RunService")
local overlay = Instance.new("Frame", game:GetService("CoreGui").RobloxGui)
overlay.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
overlay.Size = UDim2.fromScale(1, 1)
overlay.Visible = false

local maindir = "Pro Script Dumper"
local placeid = game.PlaceId
local placename = game:GetService("MarketplaceService"):GetProductInfo(placeid).Name:gsub("[\\/:*?\"<>|\n\r]", " ")
local foldername = format("%s/[%s] %s", maindir, placeid, placename)
local exploit, version = (identifyexecutor and identifyexecutor()) or "Unknown Exploit"

local function checkdirectories()
	if not isfolder(maindir) then
		makefolder(maindir)
	end
	if not isfolder(foldername) then
		makefolder(foldername)
	end
end
local function isignored(a)
	for _,v in next, ignoredservices do
		if a:FindFirstAncestor(v) then
			return true
		end
	end
	for _,v in next, ignored do
		if a.Name == v or a:FindFirstAncestor(v) then
			return true
		end
	end
	return false
end
local function delay()
	repeat task.wait(s.delay) until threads < s.threads
end
local function decomp(a)
	local hash = getscripthash(a)
	local cached = decompilecache[hash]
	if cached then
		return cached
	end

	local output = decompile(a)
	decompilecache[hash] = output
	return output
end
local function getfullname(a)
	local name = a:GetFullName()
	local split = name:split(".")
	if not a:IsDescendantOf(game) then -- this means its a nil script
		return name
	end
	for i,v in next, split do -- for instances with spaces or hyphens in the name
		if v:find("[%s%-]+") then
			split[i] = format("['%s']", v)
		end
	end
	name = concat(split, ".")
	local service = split[1]
	local fullname = format("game:GetService(\"%s\")%s", service, name:sub(service:len() + 1, -1))
	fullname = fullname:gsub("(%.%[)", function() -- remove period from .[]
		return "["
	end)
	if s.replace_username then
		fullname = fullname:gsub(plr, "LocalPlayer")
	end
	return fullname
end
local function dumpscript(v, isnil)
	checkdirectories()
	task.spawn(function()
		local function dump()
			threads += 1

			-- File Name
			local id = v:GetDebugId()
			local name = v.Name
			local path = (isnil and "[nil] " or "")..v:GetFullName()
			if s.replace_username then
				path = path:gsub(plr, "LocalPlayer")
			end
			local filename = format("%s/%s (%s).lua", foldername, path:gsub("[\\/:*?\"<>|\n\r]", " "), id)
			if filename:len() > 199 then
				filename = filename:sub(0, 195)..".lua"
			end
			filename = filename:gsub("%.%.", ". .") -- prevent it from trying to escape directory

			-- Script Output
			local time = os.clock()
			local _, output
			if s.decompile then
				_, output = xpcall(decomp, function()
					return "-- Failed to decompile script"
				end, v)
				repeat
					if output == "-- Failed to decompile script" then
						_, output = xpcall(decomp, function()
							return "-- Failed to decompile script"
						end, v)
					end
					if (os.clock() - time) > s.timeout then
						output = "-- Decompilation timed out"
						table.insert(timedoutscripts, format("Name: %s\nPath: %s\nClass: %s\nDebug Id: %s", name, path, v.ClassName, id))
						break
					end
					task.wait(0.25)
				until output ~= "-- Failed to decompile script"
				if output:gsub(" ", "") == "" then
					output = "-- Decompiler returned nothing. This script may not have bytecode or has anti-decompile implemented."
				end
			else
				output = "-- Script decompilation is disabled"
			end

			-- Information
			local class = v.ClassName

			local content = {
				[1] = "-- Name: %s",
				[2] = "-- Path: %s",
				[3] = "-- Class: %s",
				[4] = "-- Exploit: %s %s",
				[5] = "-- Time to decompile: %s",
				[6] = "\n%s"
			}

			local closure = getscriptclosure and getscriptclosure(v)
			local constants, constantsnum, protos, protosnum

			if s.dump_debug and closure then
				content[6] = "\n-- Debug Info"
				content[7] = "-- # of Constants: %s"
				content[8] = "-- # of Protos: %s"
				content[9] = "\n%s"

				constants = getconstants(closure)
				constantsnum = #constants
				protos = getprotos(closure)
				protosnum = #protos

				if s.detailed_info then
					content[9] = "\n-- Constants"
					local function searchconstants(t, count)
						for i,v in next, t do
							local i_type = typeof(i)
							local v_type = typeof(v)
							if v_type ~= "table" then
								v = tostring(v):gsub("%%", "%%%%")
							end
							content[#content + 1] = format("-- %s[%s%s%s] (%s) = %s (%s)",
								string.rep("  ", count),
								(i_type == "string" and "'" or ""),
								(i_type == "Instance" and getfullname(i) or tostring(i)),
								(i_type == "string" and "'" or ""),
								i_type,
								tostring(v),
								v_type
							)

							if v_type == "table" then
								searchconstants(v, count + 1)
							end
						end
					end
					searchconstants(constants, 0)

					content[#content + 1] = "\n-- Proto Info"
					local function getprotoinfo(t)
						for _,v in next, t do
							local info = getinfo(v)
							content[#content + 1] = "-- '"..info.name.."'"
							for i2,v2 in next, info do
								v2 = tostring(v2):gsub("%%", "%%%%")
								content[#content + 1] = format("--   ['%s'] = %s",
									i2,
									v2
								)
							end
						end
					end
					getprotoinfo(protos)

					content[#content + 1] = "\n%s"
				end
			end
			
			--local content = format("-- Name: %s\n-- Path: %s\n-- Class: %s\n-- Exploit: %s %s\n-- Time to decompile: %s\n\n%s", name, path, class, exploit, version or "", os.clock() - time.." seconds", output)

			--print(format(concat(content, "\n"), name, path, class, exploit, version or "", os.clock() - time.." seconds", s.dump_debug and constantsnum or output, protosnum, output))
			writefile(filename, format(concat(content, "\n"),
				name,
				getfullname(v),
				class,
				exploit,
				version or "",
				os.clock() - time.." seconds",
				s.dump_debug and constantsnum or output,
				protosnum,
				output,
				"",
				"",
				""
			))
			scriptsdumped += 1
			progressbind:Fire(scriptsdumped)
			threads -= 1
		end

		if threads < s.threads then
			dump()
		else
			local function queue()
				delay()
				if threads < s.threads then
					dump()
				else
					queue()
				end
			end
			queue()
		end
	end)
	delay()
end

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/MaterialLuaRemake.lua"))()
local UI = Material.Load({
	Title = "Script Dumper",
	Style = 3,
	SizeX = 400,
	SizeY = 515,
	Theme = "Dark"
})

local page = UI.new("zzerexx was here")

page.Toggle({
	Text = "Decompile Scripts",
	Callback = function(value)
		s.decompile = value
	end,
	Enabled = s.decompile
})
page.Toggle({
	Text = "Dump Debug Info",
	Callback = function(value)
		s.dump_debug = value
	end,
	Enabled = s.dump_debug,
	Menu = {
		Info = function()
			UI.Banner("If enabled, output will include debug info such as constants, upvalues, and protos.")
		end
	}
})
page.Toggle({
	Text = "Detailed Debug Info",
	Callback = function(value)
		s.detailed_info = value
	end,
	Enabled = s.detailed_info,
	Menu = {
		Info = function()
			UI.Banner("<b>This feature may crash the game. Increase the <u>Delay</u> and decrease the # of <u>Max Threads</u> if needed.</b><br />If <b>Dump Debug Info</b> is enabled, it will dump more, detailed debug info.")
		end
	}
})
page.Slider({
	Text = "Max Threads",
	Callback = function(value)
		s.threads = value
	end,
	Min = 1,
	Max = 20,
	Def = s.threads,
	Suffix = " threads",
	Menu = {
		Info = function()
			UI.Banner("This determines how many scripts can be decompiled at the same time.\n<b>Having more threads active at once will utilize more of your computer's resources and may increase the amount of timed-out decompilations.</b>")
		end
	}
})
page.Slider({
	Text = "Delay",
	Callback = function(value)
		s.delay = value
	end,
	Min = 0,
	Max = 1,
	Def = s.delay,
	Decimals = 2,
	Suffix = " seconds"
})
page.Slider({
	Text = "Decompile Timeout",
	Callback = function(value)
		s.timeout = value
	end,
	Min = 5,
	Max = 30,
	Def = s.timeout,
	Suffix = " seconds",
	Decimals = 2,
	Menu = {
		Info = function()
			UI.Banner("If the decompile time exceeds this duration, it will be skipped.")
		end
	}
})
page.Toggle({
	Text = "Include Nil Scripts",
	Callback = function(value)
		s.include_nil = value
	end,
	Enabled = s.include_nil,
	Menu = {
		Info = function()
			UI.Banner("If enabled, scripts parented to nil will also be decompiled.")
		end
	}
})
page.Toggle({
	Text = "Replace Username",
	Callback = function(value)
		s.replace_username = value
	end,
	Enabled = s.replace_username,
	Menu = {
		Info = function()
			UI.Banner("If enabled, all objects that contain your username will be replaced to <b>LocalPlayer</b>.")
		end
	}
})
page.Toggle({
	Text = "Disable 3D Rendering",
	Callback = function(value)
		s.disable_render = value
	end,
	Enabled = s.disable_render,
	Menu = {
		Info = function()
			UI.Banner("If enabled, 3D rendering will be disabled temporarily while the script dumper is active. Allows more resources to be utilized towards decompiling.")
		end
	}
})

local progressbar = nil
local threadbind = Instance.new("BindableEvent")
page.Button({
	Text = "Start Dumping",
	Callback = function()
		if progressbar then UI.Banner("A script dump is still currently in progress!") return end

		if s.disable_render then
			overlay.Visible = true
			RunService:Set3dRenderingEnabled(false)
		end

		local scripts = {}
		local nilscripts = {}
		timedoutscripts = {}
		scriptsdumped = 0

		for _,v in next, game:GetDescendants() do
			if (v:IsA("LocalScript") or v:IsA("ModuleScript")) and not isignored(v) then
				table.insert(scripts, v)
			end
		end
		if s.include_nil then
			for _,v in next, getnilinstances() do
				if (v:IsA("LocalScript") or v:IsA("ModuleScript")) and not isignored(v) then
					table.insert(nilscripts, v)
				end
			end
		end

		task.spawn(function()
			repeat
				threadbind:Fire("Active Threads:", threads)
				task.wait()
			until progressbar == nil
		end)

		local total = #scripts + #nilscripts
		progressbar = page.ProgressBar({
			Text = "Progress",
			Event = progressbind,
			Min = 0,
			Max = total,
			Def = 0,
			Suffix = "/"..total.." scripts",
			Percent = false
		})

		UI.Banner(total.." scripts found. Dumping scripts...")

		local time = os.clock()

		for _,v in next, scripts do
			dumpscript(v)
		end
		delay()

		if s.include_nil and getnilinstances then
			for _,v in next, nilscripts do
				dumpscript(v, true)
			end
			delay()
		end

		repeat task.wait() until threads == 0

		local result = format("Successfully dumped scripts, took %s seconds.%s", os.clock() - time, #timedoutscripts > 0 and "\n"..#timedoutscripts.." scripts timed out while decompiling." or "")
		UI.Banner(result)
		
		if #timedoutscripts > 0 then
			writefile(format("%s/! Timed out scripts.txt", foldername), concat(timedoutscripts, "\n\n"))
		end

		if s.disable_render then
			RunService:Set3dRenderingEnabled(true)
			overlay.Visible = false
		end
		
		task.wait(1)
		progressbar:Destroy()
		progressbar = nil
	end
})
page.Label({
	Text = "Active Threads: 0",
	Event = threadbind
})
