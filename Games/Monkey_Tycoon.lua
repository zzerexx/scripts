local function Load(file)
	return loadstring(game:HttpGet(string.format("https://raw.githubusercontent.com/zzerexx/scripts/main/%s.lua", file)), file)()
end

local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GTycoonClient = ReplicatedStorage:WaitForChild("GTycoonClient")
local Remotes = GTycoonClient:WaitForChild("Remotes")

local DropsFolder = workspace:WaitForChild("Drops")
local GrabDrops = Remotes:WaitForChild("GrabDrops")
local DepositDrops = Remotes:WaitForChild("DepositDrops")
local BuyDropper = Remotes:WaitForChild("BuyDropper")
local MergeDroppers = Remotes:WaitForChild("MergeDroppers")
local BuySpeed = Remotes:WaitForChild("BuySpeed")

local Material = Load("MaterialLuaRemake")
local UI = Material.Load({
	Title = "Monkey Tycoon",
	Style = 3,
	SizeX = 400,
	SizeY = 535,
	Theme = "Dark"
})

local heartbeat
local ss = {
	collect = false,
	deposit = false,
	monkey = false,
	monkeycount = 1,
	merge = false,
	rate = false,

	refresh = false,
	refreshrate = 0,
	render = true
}
local cfg = Load("ConfigManager")
cfg.Init("MonkeyTycoon", ss)

local function newtoggle(page, text, name, callback)
	return page.Toggle({
		Text = text,
		Callback = function(value)
			ss[name] = value
			if callback then
				callback(value)
			end
		end,
		Enabled = ss[name]
	})
end

do -- auto farm
	local page = UI.new("Auto Farm")
	newtoggle(page, "Auto Collect Bananas", "collect")
	newtoggle(page, "Auto Deposit Bananas", "deposit")
	newtoggle(page, "Auto Buy Monkeys", "monkey")
	page.Slider({
		Text = "# of Monkeys to Buy",
		Callback = function(value)
			ss.monkeycount = value
		end,
		Def = ss.monkeycount,
		Min = 0,
		Max = 100,
		Suffix = " Monkeys"
	})
	newtoggle(page, "Auto Merge Monkeys", "merge")
	newtoggle(page, "Auto Buy Rate", "rate")
end
do -- other
	local page = UI.new("Other")
	page.Slider({
		Text = "Refresh Rate",
		Callback = function(value)
			ss.refreshrate = value
		end,
		Def = ss.refreshrate,
		Min = 0,
		Max = 2000,
		Suffix = " ms",
		Toggle = true,
		ToggleCallback = function(value)
			ss.refresh = value
		end,
		Enabled = ss.refresh
	})
	newtoggle(page, "3D Rendering Enabled", "render", function(value)
		RunService:Set3dRenderingEnabled(value)
	end)
	page.Button({
		Text = "Destroy Monkey Tycoon Gui",
		Callback = function()
			heartbeat:Disconnect()
			UI:Destroy()
		end
	})
end
do -- Configs
	local Configs = UI.new("Configs")
	local selectedcfg = nil
	local cfgname = ""
	local list
	local function isempty(s)
		return s:gsub(" ","") == ""
	end
	local function refresh()
		list:SetOptions(cfg.Get())
	end

	Configs.TextField({
		Text = "Config Name",
		Type = "Default",
		Callback = function(value)
			if not isempty(value) then
				cfgname = value
			end
		end
	})
	Configs.Button({
		Text = "Create New Config",
		Callback = function()
			if not isempty(cfgname) then
				cfg.Save(cfgname, ss)
				UI.Banner("Successfully created <b>"..cfgname.."</b>.")
				refresh()
			else
				UI.Banner("Please enter a name for your config in the text box above.")
			end 
		end
	})
	list = Configs.Dropdown({
		Text = "Your Configs",
		Callback = function(value)
			selectedcfg = value
		end,
		Options = {},
		Def = "Default"
	})
	refresh()
	Configs.Button({
		Text = "Load Selected Config",
		Callback = function()
			ss = cfg.Load(selectedcfg).Data
		end,
		Menu = {
			Info = function()
				UI.Banner("Your settings will not apply to the UI. (cuz im lazy)")
			end
		}
	})
	Configs.Button({
		Text = "Overwrite Selected Config",
		Callback = function()
			cfg.Save(selectedcfg, ss)
			UI.Banner("Successfully overwritten <b>"..selectedcfg.."</b>.")
		end
	})
	Configs.Button({
		Text = "Delete Selected Config",
		Callback = function()
			if cfg.Valid(selectedcfg) then
				UI.Banner({
					Text = "Are you sure you want to delete <b>"..selectedcfg.."</b>?",
					Options = {"Yes", "No"},
					Callback = function(value)
						if value == "Yes" then
							cfg.Delete(selectedcfg)
							UI.Banner("Successfully deleted <b>"..selectedcfg.."</b>.")
							refresh()
						end
					end
				})
			else
				UI.Banner("<b>"..selectedcfg.."</b> does not exist.")
			end
		end
	})
	Configs.Button({
		Text = "Set Selected Config as Default",
		Callback = function()
			cfg.SetDefault(selectedcfg)
		end,
		Menu = {
			Info = function()
				UI.Banner("This will overwrite your current default config!")
			end
		}
	})
	Configs.Button({
		Text = "Refresh Config List",
		Callback = refresh
	})
end

local last = os.clock()
heartbeat = RunService.Heartbeat:Connect(function()
	local clock = os.clock()
	if ss.refresh and (clock - last) < (ss.refreshrate / 1000) then
		return
	end
	last = clock
	if ss.collect then
		task.spawn(function()
			for _,v in next, DropsFolder:GetChildren() do
				if v.Name ~= "EXPIRED LOL" then
					GrabDrops:FireServer(v:GetAttribute("TotalValue"))
				end
				v:Destroy()
			end
		end)
	end
	if ss.deposit then
		DepositDrops:FireServer()
	end
	if ss.monkey then
		BuyDropper:FireServer(ss.monkeycount)
	end
	if ss.merge then
		MergeDroppers:FireServer()
	end
	if ss.rate then
		BuySpeed:FireServer()
	end
end)
