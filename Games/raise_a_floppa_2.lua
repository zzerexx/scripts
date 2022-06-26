-- code looks like shit and could be improved but idc

getgenv().stop = true
task.wait(0.5)
getgenv().stop = nil

if not isfile("raise a floppa 2.jpeg") then
	writefile("raise a floppa 2.jpeg", game:HttpGet("https://tr.rbxcdn.com/a56397c41c8e3efda482ac607844aa53/150/150/Image/Jpeg"))
end

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/MaterialLuaRemake.lua"))()
local UI = Material.Load({
	Title = "raise a floppa 2",
	SubTitle = "yo",
	Icon = "raise a floppa 2.jpeg",
	ShowInNavigator = true,
	Style = 3,
	SizeX = 400,
	SizeY = 535,
	Theme = "Dark"
})

local rs = game:GetService("ReplicatedStorage")
local plr = game:GetService("Players").LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")
local events = rs:WaitForChild("Events")
local unlock = events:WaitForChild("Unlock")
local brew = events:WaitForChild("Brew")
local floppa = workspace:WaitForChild("Floppa")
local dj = workspace.Unlocks:FindFirstChild("DJ El Gato") and workspace.Unlocks['DJ El Gato'].Primary or nil
local unlocks = require(rs.Modules.Unlocks).the_interwebs
local vars = {
	autobuy = false,
	autopet = false,
	autoclick = false,
	automoney = false,
	autofeed = false,
	autopoop = false,
	autoplant = false,
	automilk = false,
	autoparty = false,
	autometeor = false,
}
plr.CharacterAdded:Connect(function(a)
	char = a
	root = a:WaitForChild("HumanoidRootPart")
end)
workspace.Unlocks.ChildAdded:Connect(function(a)
	if a.Name == "DJ El Gato" then
		dj = a.Primary
	end
end)

local function buyitem(item)
	unlock:FireServer(item, "the_interwebs")
end
local function getplanter()
	for _,v in next, workspace.Unlocks:GetChildren() do
		if v.Name == "Planter" and v.Plant.Value == "" then
			return v
		end
	end
end

local auto = UI.new("Automatics")
local other = UI.new("Other")
local items = UI.new("Items")
local character = UI.new("Character")

auto.Toggle({
	Text = "Auto Buy Items",
	Callback = function(value)
		vars.autobuy = value
	end,
	Enabled = false
})
auto.Toggle({
	Text = "Auto Pet",
	Callback = function(value)
		vars.autopet = value
	end,
	Enabled = false
})
auto.Toggle({
	Text = "Auto Click Floppa(s)",
	Callback = function(value)
		vars.autoclick = value
	end,
	Enabled = false
})
auto.Toggle({
	Text = "Auto Collect Money",
	Callback = function(value)
		vars.automoney = value
	end,
	Enabled = false
})
auto.Toggle({
	Text = "Auto Feed",
	Callback = function(value)
		vars.autofeed = value
	end,
	Enabled = false
})
auto.Toggle({
	Text = "Auto Clean Poop",
	Callback = function(value)
		vars.autopoop = value
	end,
	Enabled = false
})
auto.Toggle({
	Text = "Auto Collect Plants",
	Callback = function(value)
		vars.autoplant = value
	end,
	Enabled = false
})
auto.Toggle({
	Text = "Auto Collect Milk",
	Callback = function(value)
		vars.automilk = value
	end,
	Enabled = false
})
auto.Toggle({
	Text = "Auto Throw Party",
	Callback = function(value)
		vars.autoparty = value
	end,
	Enabled = false
})
auto.Toggle({
	Text = "Auto Collect Meteorites",
	Callback = function(value)
		vars.autometeor = value
	end,
	Enabled = false
})

other.Button({
	Text = "Collect Seeds",
	Callback = function()
		if #workspace.Seeds:GetChildren() < 1 then
			return UI.Banner("No seeds found")
		end

		local pos = char:GetPivot().Position
		for _,v in next, workspace.Seeds:GetChildren() do
			char:MoveTo(v.CFrame.Position)
			task.wait(0.25)
			fireproximityprompt(v.ProximityPrompt, 0)
			task.wait(0.1)
		end
		char:MoveTo(pos)
	end
})
other.Button({
	Text = "Plant Seeds",
	Callback = function()
		local seeds = {}
		for i,v in next, plr.Backpack:GetChildren() do
			if v.Name:find("Seed") or v.Name:find("Spore") then
				table.insert(seeds, v)
			end
		end
		if #seeds < 1 then
			return UI.Banner("You don't have any seeds")
		end

		local pos = char:GetPivot().Position
		for _,v in next, seeds do
			local planter = getplanter()
			char:MoveTo(planter:GetPivot().Position)
			char.Humanoid:EquipTool(v)
			task.wait(0.25)
			fireproximityprompt(planter.Soil.ProximityPrompt, 0)
			task.wait(0.25)
		end
		char:MoveTo(pos)
	end
})
other.Button({
	Text = "Enable Anti AFK",
	Callback = function()
		local v = game:GetService("VirtualUser")
		local zero = Vector2.zero
		local camera = workspace.CurrentCamera
		plr.Idled:Connect(function()
			v:Button2Down(zero, camera.CFrame)
			task.wait(1)
			v:Button2Up(zero, camera.CFrame)
		end)
	end
})
other.Button({
	Text = "Destroy Gui",
	Callback = function()
		UI.Banner({
			Text = "Are you sure you want to destroy the gui?",
			Callback = function(value)
				if value == "Yes" then
					getgenv().stop = true
					UI:Destroy()
				end
			end,
			Options = {"Yes", "No"}
		})
	end
})


local computeritems = {}
for _,v in next, unlocks do
	table.insert(computeritems, v.Name)
end
table.sort(computeritems, function(a, b)
	return a < b
end)
items.Dropdown({
	Text = "Buy Item",
	Callback = function(value)
		buyitem(value)
	end,
	Options = computeritems,
	Def = ""
})
items.Dropdown({
	Text = "Brew Potion",
	Callback = function(value)
		brew:FireServer(value)
	end,
	Options = {
		"Speed Potion",
		"Healing Potion",
		"Sanity Potion"
	},
	Def = ""
})

character.Slider({
	Text = "Walk Speed",
	Callback = function(value)
		char.Humanoid.WalkSpeed = value
	end,
	Min = 0,
	Max = 256,
	Def = char.Humanoid.WalkSpeed
})
character.Slider({
	Text = "Jump Power",
	Callback = function(value)
		char.Humanoid.JumpPower = value
	end,
	Min = 0,
	Max = 200,
	Def = char.Humanoid.JumpPower
})

while true do
	if getgenv().stop then
		break
	end
	if vars.autobuy then
		local money = plr.Money.Value
		for i,v in next, unlocks do
			if i ~= "Floppa Food" and v.Price < money then
				buyitem(i)
			end
		end
	end
	if vars.autopet and floppa.Configuration.Happiness.Value < 75 then
		local pos = char:GetPivot().Position
		char:MoveTo(floppa:GetPivot().Position)
		task.wait(0.25)
		fireproximityprompt(floppa.HumanoidRootPart.ProximityPrompt, 0)
		task.wait(0.25)
		char:MoveTo(pos)
	end
	if vars.autoclick then
		fireclickdetector(floppa.ClickDetector)
		for _,v in next, workspace.Unlocks:GetChildren() do
			if v.Name == "Baby Floppa" then
				fireclickdetector(v.ClickDetector)
			end
		end
	end
	if vars.automoney then
		for _,v in next, workspace:GetChildren() do
			if v.Name == "Money" or v.Name == "Money Bag" then
				firetouchinterest(v, root, 0)
			end
		end
	end
	if vars.autofeed then
		if not plr.Backpack:FindFirstChild("Floppa Food") then
			buyitem("Floppa Food")
			task.wait(0.25)
		end
		
		local bowl = workspace['Key Parts'].Bowl
		local pos = char:GetPivot().Position
		char:MoveTo(bowl:GetPivot().Position)
		task.wait(0.25)
		fireproximityprompt(bowl.Part.ProximityPrompt, 0)
		task.wait(0.25)
		char:MoveTo(pos)
	end
	if vars.autopoop then
		local pos = char:GetPivot().Position
		for _,v in next, workspace:GetChildren() do
			if v.Name == "Poop" then
				char:MoveTo(v:GetPivot().Position)
				task.wait(0.25)
				fireproximityprompt(v.ProximityPrompt, 0)
				task.wait(0.1)
			end
		end
		for _,v in next, workspace["Key Parts"]["Litter Box"]:GetChildren() do
			if v.Name == "Poop" then
				char:MoveTo(v:GetPivot().Position)
				task.wait(0.25)
				fireproximityprompt(v.ProximityPrompt, 0)
				task.wait(0.1)
			end
		end
		char:MoveTo(pos)
		task.wait(0.5)
		char.Humanoid.Sit = false
	end
	if vars.autoplant then
		local plants = {}
		for _,v in next, workspace.Unlocks:GetChildren() do
			if v.Name == "Planter" and v:FindFirstChild("Plant Model") and v.Growth.Value == 100 then
				table.insert(plants, v)
			end
		end

		if #plants > 0 then
			local pos = char:GetPivot().Position
			for _,v in next, plants do
				if v.Name == "Planter" and v:FindFirstChild("Plant Model") and v.Growth.Value == 100 then
					char:MoveTo(v:GetPivot().Position)
					task.wait(0.25)
					fireproximityprompt(v.Soil.ProximityPrompt, 0)
					task.wait(0.25)
				end
			end
			task.wait(0.25)
			char:MoveTo(pos)
			task.wait(0.5)
		end
	end
	if vars.automilk and workspace:FindFirstChild("Milk Delivery") then
		local milk = workspace['Milk Delivery']
		local pos = char:GetPivot().Position
		char:MoveTo(milk:GetPivot().Position)
		task.wait(0.25)
		fireproximityprompt(milk.Crate.ProximityPrompt, 0)
		task.wait(0.1)
		char:MoveTo(pos)
	end
	if vars.autoparty and dj and not dj.ProximityPrompt.ActionText:find("Wait") and not dj.Music.IsPlaying then
		local pos = char:GetPivot().Position
		char:MoveTo(dj.Position)
		task.wait(0.25)
		fireproximityprompt(dj.ProximityPrompt, 0)
		task.wait(0.25)
		char:MoveTo(pos)
	end
	if vars.autometeor then
		for _,v in next, workspace:GetChildren() do
			if v.Name == "Meteorite" then
				firetouchinterest(v, root, 0)
				task.wait(0.1)
			end
		end
	end
	task.wait(0.1)
end
