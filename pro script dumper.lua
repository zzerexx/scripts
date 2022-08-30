local s = { -- pro script dumper settings
	decompile = true,
	dump_debug = false, -- output will include debug info such as constants, upvalues, protos, etc
	threads = 5, -- how many scripts can be decompiled at a time
	timeout = 5, -- if decompilation takes longer than this duration (seconds), it will skip that script
	delay = 0.05,
	include_nil = false, -- set to true if u want to include nil scripts
	replace_username = true, -- replaces the localplayer's username in any objects with LocalPlayer
	disable_render = true, -- disables 3d rendering while dumping scripts
}

local decompile = decompile or disassemble
local getnilinstances = getnilinstances or get_nil_instances
local getscriptclosure = getscriptclosure
local getconstants = getconstants or debug.getconstants
local getupvalues = getupvalues or debug.getupvalues
local getprotos = getprotos or debug.getprotos

local threads = 0
local scriptsdumped = 0
local timedoutscripts = {}
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
local placename = game:GetService("MarketplaceService"):GetProductInfo(placeid).Name
local foldername = string.format("%s/[%s] %s", maindir, placeid, placename)

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
			local filename = string.format("%s/%s (%s).lua", foldername, path, id)

			-- Script Output
			local time = os.clock()
			local _, output
			if s.decompile then
				_, output = xpcall(decompile, function()
					return "-- Failed to decompile script"
				end, v)
				repeat
					if output == "-- Failed to decompile script" then
						_, output = xpcall(decompile, function()
							return "-- Failed to decompile script"
						end, v)
					end
					if (os.clock() - time) > s.timeout then
						output = "-- Decompilation timed out"
						table.insert(timedoutscripts, string.format("Name: %s\nPath: %s\nClass: %s\nDebug Id: %s", name, path, v.ClassName, id))
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
			local exploit, version = (identifyexecutor and identifyexecutor()) or "Unknown Exploit"

			local content = {
				[1] = "-- Name: %s",
				[2] = "-- Path: %s",
				[3] = "-- Class: %s",
				[4] = "-- Exploit: %s %s",
				[5] = "-- Time to decompile: %s",
				[6] = "\n%s"
			}

			local closure = getscriptclosure and getscriptclosure(v)
			local constants, upvalues, protos

			if s.dump_debug and closure then
				content[6] = "\n-- Debug Info"
				content[7] = "-- # of Constants: %s"
				content[8] = "-- # of Upvalues: %s"
				content[9] = "-- # of Protos: %s"
				content[10] = "\n%s"

				constants = #getconstants(closure)
				upvalues = #getupvalues(closure)
				protos = #getprotos(closure)
			end
			
			--local content = string.format("-- Name: %s\n-- Path: %s\n-- Class: %s\n-- Exploit: %s %s\n-- Time to decompile: %s\n\n%s", name, path, class, exploit, version or "", os.clock() - time.." seconds", output)

			writefile(filename, string.format(table.concat(content, "\n"), name, path, class, exploit, version or "", os.clock() - time.." seconds", s.dump_debug and constants or output, upvalues, protos, output))
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
	SizeY = 480,
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

		local result = string.format("Successfully dumped scripts, took %s seconds.%s", os.clock() - time, #timedoutscripts > 0 and "\n"..#timedoutscripts.." scripts timed out while decompiling." or "")
		UI.Banner(result)
		
		if #timedoutscripts > 0 then
			writefile(string.format("%s/! Timed out scripts.txt", foldername), table.concat(timedoutscripts, "\n\n"))
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
