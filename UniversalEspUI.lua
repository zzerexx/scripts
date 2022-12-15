--[[
	Custom Game Features
	- Phantom Forces
		- Dropped Weapon Esp
			- Show Ammo
			- Duration Indicator
		- Grenade Esp
			- Check Grenade Radius
		- Dog Tag Esp
		- Flag Esp
			- a lil buggy
	- Bad Business
		- Grenade Esp
			- Check Grenade Radius
		- there arent that many things that i could add to bad business
	- Rush Point
		- Dropped Weapon Esp
			- Show Ammo
			- Show Skin
			- Show Owner
		- Ability Esp
			- Enable specific abilities
			- Ignore teammate abilities
		- Bomb Esp
			- also checks if the bomb is being defused!
	- Murder Mystery 2
		- Gun Esp
]]
repeat
	task.wait(0.5)
until not UAIM_LOADING
getgenv().UESP_LOADING = true
if not EspSettings then
	getgenv().EspSettings = {
		TeamCheck = false,
		ToggleKey = "RightAlt",
		RefreshRate = 10, -- how fast the esp updates (milliseconds)
		MaximumDistance = 500, -- only renders players within this distance
		FaceCamera = false, -- Makes esp appear 2D
		AlignPoints = false, -- Improves 2D effect; only works while FaceCamera is enabled
		-- AlignPoints: This may cause esp to have abnormal behavior when looking from certain angles
		MouseVisibility = {
			Enabled = true, -- makes any drawing objects transparent when they are near your mouse
			Radius = 60,
			Transparency = 0.3,
			Method = "Hover", -- "Radius" or "Hover"
			HoverRadius = 50,
			Selected = { -- set any of these to false to ignore them
				Boxes = true,
				Tracers = true,
				Names = true,
				Skeletons = true,
				HealthBars = true,
				HeadDots = true,
				LookTracers = true
			}
		},
		Highlights = {
			Enabled = false,
			Players = {}, -- put player usernames into this table to 'highlight' them
			Transparency = 1,
			Color = Color3.fromRGB(255, 150, 0),
			AlwaysOnTop = true
		},
		NPC = {
			Color = Color3.fromRGB(150,150,150),
			Transparency = 1,
			RainbowColor = false,
			Overrides = {
				Boxes = true,
				Tracers = true,
				Names = true,
				Skeletons = true,
				HealthBars = true,
				HeadDots = true,
				LookTracers = true
			}
		},
		Boxes = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			RainbowColor = false,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
			OutlineThickness = 1,
			Thickness = 1
		},
		Tracers = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			RainbowColor = false,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
			OutlineThickness = 1,
			Origin = "Top", -- "Top" or "Center" or "Bottom" or "Mouse"
			Thickness = 1
		},
		Names = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			RainbowColor = false,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
			Font = Drawing.Fonts.UI, -- UI or System or Plex or Monospace
			Size = 18,
			ShowDistance = false,
			ShowHealth = true,
			UseDisplayName = false,
			DistanceDataType = "m", -- what it says after the distance (ex. 100m)
			HealthDataType = "Percentage" -- "Percentage" or "Value"
		},
		Skeletons = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			RainbowColor = false,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
			OutlineThickness = 1,
			Thickness = 1
		},
		HealthBars = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(0,255,0),
			UseTeamColor = true,
			RainbowColor = false,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
			OutlineThickness = 1,
			Origin = "None", -- "None" or "Left" or "Right"
			OutlineBarOnly = true
		},
		HeadDots = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			RainbowColor = false,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
			OutlineThickness = 1,
			Thickness = 1,
			Filled = false,
			Scale = 1
		},
		LookTracers = {
			Enabled = true,
			Transparency = 1,
			Color = Color3.fromRGB(255,255,255),
			UseTeamColor = true,
			RainbowColor = false,
			Outline = true,
			OutlineColor = Color3.fromRGB(0,0,0),
			OutlineThickness = 1,
			Thickness = 1,
			Length = 5
		}
	}
end

if UESP then
	return
end
getgenv().OldInstance = nil
getgenv().EspSettings.Names.OutlineThickness = 0 -- prevent error

local function Load(file)
	return loadstring(game:HttpGet(string.format("https://raw.githubusercontent.com/zzerexx/scripts/main/%s.lua", file)), file)()
end

local UI
--[[ old icons
local icons = {
	['UI'] = "https://i.imgur.com/xW3CaYL.png",
	['Boxes'] = "https://i.imgur.com/c62mH5p.png",
	['Tracers'] = "https://i.imgur.com/MSNjSVv.png",
	['Names'] = "https://i.imgur.com/HLiXuos.png",
	['Skeletons'] = "https://i.imgur.com/kzwPzjl.png",
	['Health Bars'] = "https://i.imgur.com/nD3lltT.png",
	['Head Dots'] = "https://i.imgur.com/HGAgY9G.png",
	['Look Tracers'] = "https://i.imgur.com/XZqC7pF.png",
	['All'] = "https://i.imgur.com/JRo82rH.png",
	['Mouse Visibility'] = "https://i.imgur.com/3FKHkB8.png",
	['Other'] = "https://i.imgur.com/Lwl0iV7.png",
	['Configs'] = "https://i.imgur.com/bcuIP5f.png",
	['Players'] = "https://i.imgur.com/EB8OOKv.png",
	['NPC'] = "",
	['Statistics'] = "https://i.imgur.com/X0IblqN.png",
	['Feedback'] = "https://i.imgur.com/FYbAIod.png"
}]]
local icons = {
	['UI'] = "https://i.imgur.com/xW3CaYL.png",
	['Boxes'] = "https://i.imgur.com/xSNPrjN.png",
	['Tracers'] = "https://i.imgur.com/oshO9nY.png",
	['Names'] = "https://i.imgur.com/dtVPsyX.png",
	['Skeletons'] = "https://i.imgur.com/HL57Z76.png",
	['Health Bars'] = "https://i.imgur.com/cPnbeKo.png",
	['Head Dots'] = "https://i.imgur.com/AWvYuRI.png",
	['Look Tracers'] = "https://i.imgur.com/GSBE57c.png",
	['All'] = "https://i.imgur.com/ChRDF9E.png",
	['Mouse Visibility'] = "https://i.imgur.com/YtB9EMq.png",
	['Other'] = "https://i.imgur.com/2HCDHHU.png",
	['Configs'] = "https://i.imgur.com/AAiWa00.png",
	['Players'] = "https://i.imgur.com/rSSostV.png",
	['NPC'] = "https://i.imgur.com/vnQqvnZ.png",
	['Statistics'] = "https://i.imgur.com/l12YZmJ.png",
	['Feedback'] = "https://i.imgur.com/rnLY3CC.png",
	['Game'] = "https://i.imgur.com/GyzezXx.png"
}
for i,v in next, icons do
	local folder = "UESP_Icons"
	if not isfolder("UESP_Icons") then
		makefolder("UESP_Icons")
	end
	local path = folder.."\\"..i..".png"
	if not isfile(path) then
		writefile(path, game:HttpGet(v))
	end
end

function page(title)
	return UI.new({Title = title, ImageId = "UESP_Icons\\"..title..".png", ImageSize = Vector2.new(20, 20)})
end

local version = "v1.6.14"
local esp = esp or Load("UniversalEsp")
local cfg = Load("ConfigManager")
local Material = Load("MaterialLuaRemake")
UI = Material.Load({
	Title = "Universal Esp",
	SubTitle = "zzerexx was here",
	Icon = "UESP_Icons\\UI.png",
	ShowInNavigator = true,
	Style = 3,
	SizeX = 400,
	SizeY = 535,
	Theme = "Dark"
})
local players = game:GetService("Players")
local camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local uis = game:GetService("UserInputService")

local gids = { -- game ids
	['arsenal'] = 111958650,
	['pf'] = 113491250,
	['pft'] = 115272207, -- pf test place
	['pfu'] = 1256867479, -- pf unstable branch
	['bb'] = 1168263273,
	['rp'] = 2162282815, -- rush point
	['mm2'] = 66654135
}
local gid = game.GameId 
local Game, GamePage = nil, nil
if gid == (gids.pf or gids.pft or gids.pfu) then
	Game = "Phantom Forces"
elseif gid == gids.bb then
	Game = "Bad Business"
elseif gid == gids.rp then
	Game = "Rush Point"
elseif gid == gids.mm2 then
	Game = "Murder Mystery 2"
end
if Game then
	GamePage = UI.new({Title = Game, ImageId = "UESP_Icons\\Game.png", ImageSize = Vector2.new(20, 20)})
end

local Boxes = page("Boxes")
local Tracers = page("Tracers")
local Names = page("Names")
local Skeletons = page("Skeletons")
local HealthBars = page("Health Bars")
local HeadDots = page("Head Dots")
local LookTracers = page("Look Tracers")
local All = page("All")
local MouseVisibility = page("Mouse Visibility")
local Other = page("Other")
local Configs = page("Configs")
local Players = page("Players")
local NPC = page("NPC")
local Stats = page("Statistics")
local Feedback = page("Feedback")
local ss = getgenv().EspSettings
local loaded = false
local connections = {}
local cfgname,selectedcfg = "",""
local addtonew = true
local addtonpcs = false
local togglekey = Enum.KeyCode.RightControl
local esptogglebtn, uitogglebtn
local SettingsLoaded = Instance.new("BindableEvent")
local gamesettings = {
	['Phantom Forces'] = nil,
	['Bad Business'] = nil,
	['Rush Point'] = nil
}

local newsettings = {
	FaceCamera = false,
	AlignPoints = false,
	HealthBars = {
		Origin = "None",
		OutlineBarOnly = true
	},
	HeadDots = {
		Scale = 1
	},
	MouseVisibility = {
		Method = "Hover",
		HoverRadius = 50,
	},
	Highlights = {
		Enabled = false,
		Players = {},
		Transparency = 1,
		Color = Color3.fromRGB(255, 150, 0),
		AlwaysOnTop = true
	},
	NPC = {
		Color = Color3.fromRGB(150,150,150),
		Transparency = 1,
		RainbowColor = false,
		Overrides = {
			Boxes = true,
			Tracers = true,
			Names = true,
			Skeletons = true,
			HealthBars = true,
			HeadDots = true,
			LookTracers = true
		}
	},
}
for i,v in next, newsettings do
	if ss[i] == nil then
		ss[i] = v
	end
	if typeof(v) == "table" then
		for i2,v2 in next, v do
			if ss[i][i2] == nil then
				ss[i][i2] = v2
			end
		end
	end
end

local function save(a)
	cfg.Save(a, {
		settings = ss,
		ui = {
			ToggleKey = togglekey.Name,
			AddToNew = addtonew
		},
		gamesettings = gamesettings
	})
end
local function load(a)
	local data = (a.Data or (a.settings ~= nil and a.settings)) or a
	for i,v in next, data.settings do
		if typeof(v) == "table" then
			for i2,v2 in next, v do
				esp:Set(i, i2, v2)
			end
		else
			esp:Set("Other", i, v)
		end
	end
	if data.gamesettings ~= nil then
		gamesettings = data.gamesettings
		SettingsLoaded:Fire(gamesettings)
	end
	task.spawn(function()
		repeat task.wait(0.25) until esptogglebtn ~= nil and uitogglebtn ~= nil
		local key = data.settings.ToggleKey
		esptogglebtn:SetBind((typeof(key) == "EnumItem" and key) or Enum.KeyCode[key])
		if a.Data ~= nil and a.Data.ui ~= nil then
			local b,c = data.ui.ToggleKey, data.ui.AddToNew
			if b then
				togglekey = Enum.KeyCode[b]
				uitogglebtn:SetBind(togglekey)
			end
			if c then
				addtonew = c
			end
		end
	end)
end

cfg.Init("UESP", {
	settings = ss,
	ui = {
		ToggleKey = togglekey.Name,
		AddToNew = addtonew
	}
}, load)

function destroy()
	for _,v in next, connections do
		v:Disconnect()
	end
	esp:Destroy()
	UI:Destroy()
	getgenv().UESP = nil
end
local script = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEspUI.lua"), "UniversalEspUI")
function reload(safemode)
	destroy()
	task.wait(0.5)
	if safemode then
		pcall(script)
	else
		script()
	end
end

do -- Game Specific
	local objects = {}
	local label = setmetatable({
		Transparency = 1,
		Color = Color3.new(1, 1, 1),
		RainbowColor = false,
		Size = 13,
		Outline = true,
		OutlineColor = Color3.new(0, 0, 0),
		Font = (import and Drawing.Fonts.System) or Drawing.Fonts.Plex,
		Offset = Vector2.zero
	}, {
		__call = function(self, obj, text, color)
			local obj = esp.Label(obj, self)
			table.insert(objects, obj)
			obj:SetProp("Text", text)
			if color then
				obj:SetProp("Color", color)
			end
			return obj
		end
	})
	local cham = setmetatable({
		Transparency = 0.5,
		Color = Color3.new(1, 1, 1),
		RainbowColor = false,
		Thickness = 1,
		Filled = true
	}, {
		__call = function(self, obj, color)
			local obj = esp.Cham(obj, self)
			table.insert(objects, obj)
			if color then
				obj:SetProp("Color", color)
			end
			return obj
		end
	})
	local white, red, orange, yellow, green = Color3.new(1, 1, 1), Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 150, 0), Color3.fromRGB(255, 255, 0), Color3.fromRGB(0, 255, 0)
	local function SetProp(name, type, prop, value)
		for _,v in next, objects do
			if (name == "" or v.Part.Name:find(name)) and v.Type == type then
				v:SetProp(prop, value)
			end
		end
	end
	local function Remove(name, type)
		for _,v in next, objects do
			if (name == "" or v.Part.Name:find(name)) and v.Type == type then
				v:Remove()
			end
		end
	end
	if Game == "Phantom Forces" then
		local content = game:GetService("ReplicatedStorage"):WaitForChild("Content")
		local db = content:WaitForChild("ProductionContent"):WaitForChild("WeaponDatabase")
		local tdb = content:WaitForChild("TestContent"):WaitForChild("WeaponDatabase")
		local drops = workspace:WaitForChild("Ignore"):WaitForChild("GunDrop")
		local misc = workspace:WaitForChild("Ignore"):WaitForChild("Misc")
		local cache = {}
		local settings = setmetatable({
			Weapons = {
				DroppedWeapons = false,
				DroppedWeaponsChams = false,
				ShowAmmo = false,
				Duration = false,
				Grenades = false,
				CheckGrenadeRadius = false,
			},
			Misc = {
				DogTags = false,
				DogTagsChams = false,
				Flags = false
			},
			Custom = {
				LabelTransparency = 1,
				ChamsTransparency = 1
			}
		}, {
			__newindex = function(self)
				gamesettings[Game] = self
			end
		})
		gamesettings[Game] = settings
		table.insert(connections, SettingsLoaded.Event:Connect(function(a)
			local data = a[Game]
			if data then
				settings = a[Game]
			end
		end))

		GamePage.Label({
			Text = "━━ Weapons ━━",
			Center = true,
			Transparent = true
		})
		GamePage.Toggle({
			Text = "Dropped Weapon Esp (Label)",
			Callback = function(value)
				settings.Weapons.DroppedWeapons = value
				if value == false then
					Remove("Dropped", "Labels")
				end
			end,
			Enabled = settings.Weapons.DroppedWeapons
		})
		GamePage.Toggle({
			Text = "Dropped Weapon Esp (Chams)",
			Callback = function(value)
				settings.Weapons.DroppedWeaponsChams = value
				if value == false then
					Remove("Dropped", "Chams")
				end
			end,
			Enabled = settings.Weapons.DroppedWeaponsChams,
			Menu = {
				Info = function()
					UI.Banner("You may experience performance drops with this enabled.")
				end
			}
		})
		GamePage.Toggle({
			Text = "Show Ammo",
			Callback = function(value)
				settings.Weapons.ShowAmmo = value
			end,
			Enabled = settings.Weapons.ShowAmmo
		})
		GamePage.Toggle({
			Text = "Duration Indicator",
			Callback = function(value)
				settings.Weapons.Duration = value
			end,
			Enabled = settings.Weapons.Duration,
			Menu = {
				Info = function()
					UI.Banner("Visualizes how much time the weapon has left until it despawns.\n<font color='rgb(255, 0, 0)'>Red</font> = 5s left\n<font color='rgb(255, 150, 0)'>Orange</font> = 10s left\n<font color='rgb(255, 255, 0)'>Yellow</font> = 15s left\n<font color='rgb(0, 255, 0)'>Green</font> = More than 20s left")
				end
			}
		})
		GamePage.Toggle({
			Text = "Grenade Esp",
			Callback = function(value)
				settings.Weapons.Grenades = value
				if value == false then
					Remove("Trigger", "Labels")
					Remove("Trigger", "Chams")
				end
			end,
			Enabled = settings.Weapons.Grenades
		})
		GamePage.Toggle({
			Text = "Check Grenade Radius",
			Callback = function(value)
				settings.Weapons.CheckGrenadeRadius = value
			end,
			Enabled = settings.Weapons.CheckGrenadeRadius,
			Menu = {
				Info = function()
					UI.Banner("When you're within a grenade's blast radius, the esp color will change to red.")
				end
			}
		})

		GamePage.Label({
			Text = "━━ Misc ━━",
			Center = true,
			Transparent = true
		})
		GamePage.Toggle({
			Text = "Dog Tag Esp (Label)",
			Callback = function(value)
				settings.Misc.DogTags = value
				if value == false then
					Remove("DogTag", "Labels")
				end
			end,
			Enabled = settings.Misc.DogTags
		})
		GamePage.Toggle({
			Text = "Dog Tag Esp (Chams)",
			Callback = function(value)
				settings.Misc.DogTagsChams = value
				if value == false then
					Remove("DogTag", "Chams")
				end
			end,
			Enabled = settings.Misc.DogTagsChams
		})
		GamePage.Toggle({
			Text = "Flag Esp (Label)",
			Callback = function(value)
				settings.Misc.Flags = value
			end,
			Enabled = settings.Misc.Flags
		})

		GamePage.Label({
			Text = "━━ Customize ━━",
			Center = true,
			Transparent = true
		})
		GamePage.Slider({
			Text = "Label Transparency",
			Callback = function(value)
				SetProp("Dropped", "Labels", "Transparency", value)
				SetProp("DogTag", "Labels", "Transparency", value)
				SetProp("FlagDrop", "Labels", "Transparency", value)
				settings.Custom.LabelTransparency = value
				label.Transparency = value
			end,
			Min = 0,
			Max = 1,
			Def = settings.Custom.LabelTransparency,
			Decimals = 2
		})
		GamePage.Slider({
			Text = "Chams Transparency",
			Callback = function(value)
				SetProp("Dropped", "Chams", "Transparency", value)
				SetProp("DogTag", "Chams", "Transparency", value)
				settings.Custom.ChamsTransparency = value
				cham.Transparency = value
			end,
			Min = 0,
			Max = 1,
			Def = settings.Custom.ChamsTransparency,
			Decimals = 2
		})

		table.insert(connections, drops.ChildAdded:Connect(function(v)
			local dropped = settings.Weapons.DroppedWeapons
			local droppedchams = settings.Weapons.DroppedWeaponsChams
			local showammo = settings.Weapons.ShowAmmo
			local duration = settings.Weapons.Duration
			local tags = settings.Misc.DogTags
			local tagschams = settings.Misc.DogTagsChams
			local flags = settings.Misc.Flags
			
			if v.Name == "Dropped" and (dropped or droppedchams) then
				local gun = v:WaitForChild("Gun", 1)
				local ammo = v:WaitForChild("Spare", 1)
				if (not gun) or (not ammo) then return end
				gun = gun.Value
				ammo = ammo.Value

				local module = db:FindFirstChild(gun, true) or tdb:FindFirstChild(gun, true)
				local data = cache[gun] or require(module:FindFirstChildOfClass("ModuleScript"))
				local totalammo = data.sparerounds + data.magsize
				if not cache[gun] then
					cache[gun] = data
				end

				if dropped then
					local l = nil
					local text = string.format("[ %s ]\n", gun)
					if showammo then
						text ..= string.format("[ %s/%s ]", ammo, totalammo)
					end
					if duration then
						local timer = os.clock()
						task.spawn(function()
							repeat task.wait(0.1) until l ~= nil
							repeat
								local elapsed = os.clock() - timer
								if elapsed <= 10 then
									l:SetProp("Color", green)
								elseif elapsed <= 15 then
									l:SetProp("Color", yellow)
								elseif elapsed <= 20 then
									l:SetProp("Color", orange)
								elseif elapsed >= 25 then
									l:SetProp("Color", red)
								end
								task.wait(1)
							until v == nil
						end)
					end
					l = label(v, text)
				end
				if droppedchams then
					cham(v)
				end
			elseif v.Name == "DogTag" and (tags or tagschams) then
				local color = v:WaitForChild("TeamColor", 1).Value.Color
				if not color then return end

				if tags then
					label(v.Tag, "[ Tag ]", color)
				end
				if tagschams then
					cham(v.Tag, color)
				end
			elseif v.Name == "FlagDrop" and flags then
				local color = v:WaitForChild("TeamColor", 1).Value.Color
				if not color then return end

				label(v, "[ Dropped Flag ]", color)
			end
		end))
		table.insert(connections, misc.ChildAdded:Connect(function(v)
			local grenades = settings.Weapons.Grenades
			local flags = settings.Misc.Flags
			local checkradius = settings.Weapons.CheckGrenadeRadius

			if v.Name == "Trigger" and grenades then
				v.Name ..= math.random(0, 999)

				local meshid = v.MeshId
				local radius = cache[meshid] or nil
				if not cache[meshid] then
					for _,v2 in next, db:GetDescendants() do
						if v2:IsA("MeshPart") and meshid == v2.MeshId then
							radius = require(v2.Parent.Parent:FindFirstChildOfClass("ModuleScript")).blastradius
							cache[meshid] = radius
						end
					end
					if not radius then
						for _,v2 in next, tdb:GetDescendants() do
							if v2:IsA("MeshPart") and meshid == v2.MeshId then
								radius = require(v2.Parent.Parent:FindFirstChildOfClass("ModuleScript")).blastradius
								cache[meshid] = radius
							end
						end
					end
				end

				local l = label(v, "[ Grenade ]", green)
				local c = cham(v, green)
				if checkradius then
					task.spawn(function()
						repeat
							local mag = (camera.CFrame.Position - v.Position).Magnitude
							if mag <= radius then
								l:SetProp("Color", red)
								l:SetProp("Text", "[ Grenade ]\n[!]")
								c:SetProp("Color", red)
							else
								l:SetProp("Color", green)
								l:SetProp("Text", "[ Grenade ]")
								c:SetProp("Color", green)
							end
							task.wait(0.1)
						until v == nil
					end)
				end
			elseif v.Name == "FlagCarry" and flags then
				local color = v:WaitForChild("Base", 1):WaitForChild("PointLight", 1).Color
				if not color then return end

				label(v, "[ Flag Carry ]", color)
			end
		end))
	elseif Game == "Bad Business" then
		local throwables = workspace:WaitForChild("Throwables")
		local items = game:GetService("ReplicatedStorage"):WaitForChild("Items")
		local configs = items:WaitForChild("Base")
		local equipment = configs:WaitForChild("Equipment")
		local cache = {}
		local settings = setmetatable({
			Weapons = {
				Grenades = false,
				CheckGrenadeRadius = false,
			},
			Custom = {
				LabelTransparency = 1,
				ChamsTransparency = 1
			}
		}, {
			__newindex = function(self)
				gamesettings[Game] = self
			end
		})
		gamesettings[Game] = settings
		table.insert(connections, SettingsLoaded.Event:Connect(function(a)
			local data = a[Game]
			if data then
				settings = a[Game]
			end
		end))

		GamePage.Label({
			Text = "━━ Weapons ━━",
			Center = true,
			Transparent = true
		})
		GamePage.Toggle({
			Text = "Grenade Esp",
			Callback = function(value)
				settings.Weapons.Grenades = value
				if value == false then
					for _,v in next, equipment:GetChildren() do
						Remove(v.Name, "Labels")
						Remove(v.Name, "Chams")
					end
				end
			end,
			Enabled = settings.Weapons.Grenades
		})
		GamePage.Toggle({
			Text = "Check Grenade Radius",
			Callback = function(value)
				settings.Weapons.CheckGrenadeRadius = value
			end,
			Enabled = settings.Weapons.CheckGrenadeRadius,
			Menu = {
				Info = function()
					UI.Banner("When you're within a grenade's blast radius, the esp color will change to red.")
				end
			}
		})

		GamePage.Label({
			Text = "━━ Customize ━━",
			Center = true,
			Transparent = true
		})
		GamePage.Slider({
			Text = "Label Transparency",
			Callback = function(value)
				for _,v in next, equipment:GetChildren() do
					SetProp(v.Name, "Labels", "Transparency", value)
				end
				settings.Custom.LabelTransparency = value
				label.Transparency = value
			end,
			Min = 0,
			Max = 1,
			Def = settings.Custom.LabelTransparency,
			Decimals = 2
		})
		GamePage.Slider({
			Text = "Chams Transparency",
			Callback = function(value)
				for _,v in next, equipment:GetChildren() do
					SetProp(v.Name, "Chams", "Transparency", value)
				end
				settings.Custom.ChamsTransparency = value
				cham.Transparency = value
			end,
			Min = 0,
			Max = 1,
			Def = settings.Custom.ChamsTransparency,
			Decimals = 2
		})

		table.insert(connections, throwables.ChildAdded:Connect(function(v)
			local grenades = settings.Weapons.Grenades
			local checkradius = settings.Weapons.CheckGrenadeRadius

			local name = v.Name
			local item = equipment:FindFirstChild(name)
			if item and grenades then
				v.Name ..= math.random(0, 999)

				local radius = cache[name] or nil
				if not cache[name] then
					radius = require(item.Config).Damage.Radius
					cache[name] = radius
				end

				local l = label(v, "[ Grenade ]", green)
				local c = cham(v, green)
				if checkradius then
					task.spawn(function()
						repeat
							local mag = (camera.CFrame.Position - v:GetPivot().Position).Magnitude
							if mag <= radius then
								l:SetProp("Color", red)
								l:SetProp("Text", "[ Grenade ]\n[!]")
								c:SetProp("Color", red)
							else
								l:SetProp("Color", green)
								l:SetProp("Text", "[ Grenade ]")
								c:SetProp("Color", green)
							end
							task.wait(0.1)
						until v == nil
					end)
				end
			end
		end))
	elseif Game == "Rush Point" then
		local weapons = workspace:WaitForChild("DroppedWeapons")
		local mapfolder = workspace:WaitForChild("MapFolder")
		local bombfolder = mapfolder:WaitForChild("Bomb", 1) if not bombfolder then bombfolder = game end
		local raycastignore = workspace:WaitForChild("RaycastIgnore", 1)
		local myname = players.LocalPlayer.Name
		local settings = setmetatable({
			Weapons = {
				DroppedWeapons = false,
				DroppedWeaponsChams = false,
				DroppedWeaponsData = {
					Ammo = false,
					Skin = false,
					Owner = false,
				}
			},
			Misc = {
				Abilities = false,
				EnabledAbilities = {
					Proto = true,
					Zyla = true,
					Kane = true,
					Sentient = true
				},
				IgnoreTeamAbilities = false,
				Bomb = false
			},
			Custom = {
				LabelTransparency = 1,
				ChamsTransparency = 1
			}
		}, {
			__newindex = function(self)
				gamesettings[Game] = self
			end
		})
		gamesettings[Game] = settings
		table.insert(connections, SettingsLoaded.Event:Connect(function(a)
			local data = a[Game]
			if data then
				settings = a[Game]
			end
		end))

		local function IsTeamAbility(v)
			local myteam = players[myname]:WaitForChild("Team", 1) if not myteam then return "" end
			local team = v:WaitForChild("Team", 1) if not team then return "" end
			return myteam.Value == team.Value
		end
		local function GetTeamColor(v)
			local owner = v:WaitForChild("Owner", 1) if not owner then return white end
			local character = mapfolder.Players:FindFirstChild(owner.Value.Name) if not character then return white end
			local outline = character:FindFirstChild("OutlineESP") if not outline then return white end
			return outline.OutlineColor
		end

		GamePage.Label({
			Text = "━━ Weapons ━━",
			Center = true,
			Transparent = true
		})
		GamePage.Toggle({
			Text = "Dropped Weapon Esp (Labels)",
			Callback = function(value)
				settings.Weapons.DroppedWeapons = value
			end,
			Enabled = settings.Weapons.DroppedWeapons
		})
		GamePage.Toggle({
			Text = "Dropped Weapon Esp (Chams)",
			Callback = function(value)
				settings.Weapons.DroppedWeaponsChams = value
			end,
			Enabled = settings.Weapons.DroppedWeaponsChams
		})
		GamePage.ChipSet({
			Text = "Dropped Weapon Esp Data",
			Callback = function(value)
				settings.Weapons.DroppedWeaponsData = value
			end,
			Options = settings.Weapons.DroppedWeaponsData
		})

		GamePage.Label({
			Text = "━━ Misc ━━",
			Center = true,
			Transparent = true
		})
		GamePage.Toggle({
			Text = "Ability Esp",
			Callback = function(value)
				settings.Misc.Abilities = value
			end,
			Enabled = settings.Misc.Abilities
		})
		GamePage.ChipSet({
			Text = "Enabled Abilities",
			Callback = function(value)
				settings.Misc.EnabledAbilities = value
			end,
			Options = settings.Misc.EnabledAbilities
		})
		GamePage.Toggle({
			Text = "Ignore Team Abilities",
			Callback = function(value)
				settings.Misc.IgnoreTeamAbilities = value
			end,
			Enabled = settings.Misc.IgnoreTeamAbilities
		})
		GamePage.Toggle({
			Text = "Bomb Esp",
			Callback = function(value)
				settings.Misc.Bomb = value
			end,
			Enabled = settings.Misc.Bomb
		})

		GamePage.Label({
			Text = "━━ Customize ━━",
			Center = true,
			Transparent = true
		})
		GamePage.Slider({
			Text = "Label Transparency",
			Callback = function(value)
				SetProp("", "Labels", "Transparency", value)
				settings.Custom.LabelTransparency = value
				label.Transparency = value
			end,
			Min = 0,
			Max = 1,
			Def = settings.Custom.LabelTransparency,
			Decimals = 2
		})
		GamePage.Slider({
			Text = "Chams Transparency",
			Callback = function(value)
				SetProp("", "Chams", "Transparency", value)
				settings.Custom.ChamsTransparency = value
				cham.Transparency = value
			end,
			Min = 0,
			Max = 1,
			Def = settings.Custom.ChamsTransparency,
			Decimals = 2
		})

		table.insert(connections, weapons.ChildAdded:Connect(function(v)
			local dropped = settings.Weapons.DroppedWeapons
			local droppedchams = settings.Weapons.DroppedWeaponsChams
			local droppeddata = settings.Weapons.DroppedWeaponsData

			local name = v.Name
			if dropped then
				local text = string.format("[ %s ]", name)
				if name ~= "Bomb" then
					if droppeddata.Ammo then
						local ammo = v:WaitForChild("Bullets", 1).Value
						local reserve = v:WaitForChild("ReserveAmmo", 1).Value
						text ..= string.format("\n[ %s ]", ammo.."/"..reserve)
					end
					if droppeddata.Skin then
						local skin = v:WaitForChild("Skin", 1).Value
						text ..= string.format("\n[ %s ]", skin)
					end
					if droppeddata.Owner then
						local owner = v:WaitForChild("Owner", 1).Value.Name
						text ..= string.format("\n[ %s ]", owner)
					end
				end
				label(v, text)
			end
			if droppedchams then
				cham(v:WaitForChild("HitBox", 1))
			end
		end))
		local length = 6 -- turret things
		local size = Vector3.new(0.075, 0.075, length)
		local offset = CFrame.new(0, 0, -(length / 2))
		table.insert(connections, mapfolder:WaitForChild("Players").ChildAdded:Connect(function(v)
			local name = v.Name
			local enabled = settings.Misc.EnabledAbilities
			local ignoreteam = settings.Misc.IgnoreTeamAbilities
			if settings.Misc.Abilities and (ignoreteam and not IsTeamAbility(v) or not ignoreteam) then
				if enabled.Proto and name == "Humbug" then -- Proto's Scan
					local teamcolor = GetTeamColor(v)
					local scan = v:WaitForChild("Scan", 1)
					local l = label(scan, "[ Humbug ]")
					local c = cham(scan)
					l:SetProp("Color", teamcolor)
					c:SetProp("Color", teamcolor)
				elseif enabled.Zyla and v:FindFirstChild("CloneTag") then -- Zyla's Clone
					
				elseif enabled.Kane and name == "Kane Explosive" then -- Kane's Explosives
					local teamcolor = GetTeamColor(v)
					local part = v:WaitForChild("Part", 1)
					local l = label(part, "[ Kane Explosive ]")
					local c = cham(part)
					l:SetProp("Color", teamcolor)
					c:SetProp("Color", teamcolor)
				elseif enabled.Sentient and name == "Combat Turret" then -- Sentient's Turret
					local teamcolor = GetTeamColor(v)
					local l = label(v, "[ Turret ]")
					local c = cham(v)
					l:SetProp("Color", teamcolor)
					c:SetProp("Color", teamcolor)

					local gun = v:WaitForChild("Object", 1):WaitForChild("Gun", 1)
					local a = Instance.new("Part")
					a.Anchored = true
					a.CanCollide = false
					a.Transparency = 1
					a.Size = size
					a.CFrame = gun.CFrame:ToWorldSpace(offset)
					a.Name = ""
					a.Parent = raycastignore
					local c2 = cham(a)
					c2:SetProp("Color", teamcolor)
					local changed = v:GetPropertyChangedSignal("CFrame"):Connect(function()
						a.CFrame = gun.CFrame:ToWorldSpace(offset)
					end)
					local conn;conn = v.AncestryChanged:Connect(function()
						c2:Remove()
						a:Destroy()
						changed:Disconnect()
						conn:Disconnect()
					end)
				end
			end
		end))
		table.insert(connections, bombfolder.ChildAdded:Connect(function(v)
			if v.Name == "Bomb" then
				local l = label(v, "[ Bomb Planted ]")
				local c = cham(v)
				local defusing = v:WaitForChild("Defusing", 1)
				local changed = defusing:GetPropertyChangedSignal("Value"):Connect(function()
					local d = defusing.Value
					l:SetProp("Color", d and red or white)
					l:SetProp("Text", d and "[ Bomb Planted ]\n[ DEFUSING ]" or "[ Bomb Planted ]")
					c:SetProp("Color", d and red or white)
				end)
				local conn;conn = v.AncestryChanged:Connect(function()
					changed:Disconnect()
					conn:Disconnect()
				end)
			end
		end))
	elseif Game == "Murder Mystery 2" then
		local settings = setmetatable({
			Misc = {
				GunEsp = false,
				GunEspChams = false,
			},
			Custom = {
				LabelTransparency = 1,
				ChamsTransparency = 1
			}
		}, {
			__newindex = function(self)
				gamesettings[Game] = self
			end
		})
		gamesettings[Game] = settings
		table.insert(connections, SettingsLoaded.Event:Connect(function(a)
			local data = a[Game]
			if data then
				settings = a[Game]
			end
		end))

		GamePage.Label({
			Text = "━━ Misc ━━",
			Center = true,
			Transparent = true
		})
		GamePage.Toggle({
			Text = "Gun Esp (Labels)",
			Callback = function(value)
				settings.Misc.GunEsp = value
				if value then
					local gun = workspace:FindFirstChild("GunDrop")
					if gun then
						label(gun, "Gun")
					end
				end
			end,
			Enabled = settings.Misc.GunEsp
		})
		GamePage.Toggle({
			Text = "Gun Esp (Chams)",
			Callback = function(value)
				settings.Misc.GunEspChams = value
				if value then
					local gun = workspace:FindFirstChild("GunDrop")
					if gun then
						cham(gun)
					end
				end
			end,
			Enabled = settings.Misc.GunEspChams
		})

		GamePage.Label({
			Text = "━━ Customize ━━",
			Center = true,
			Transparent = true
		})
		GamePage.Slider({
			Text = "Label Transparency",
			Callback = function(value)
				SetProp("", "Labels", "Transparency", value)
				settings.Custom.LabelTransparency = value
				label.Transparency = value
			end,
			Min = 0,
			Max = 1,
			Def = settings.Custom.LabelTransparency,
			Decimals = 2
		})
		GamePage.Slider({
			Text = "Chams Transparency",
			Callback = function(value)
				SetProp("", "Chams", "Transparency", value)
				settings.Custom.ChamsTransparency = value
				cham.Transparency = value
			end,
			Min = 0,
			Max = 1,
			Def = settings.Custom.ChamsTransparency,
			Decimals = 2
		})

		table.insert(connections, workspace.ChildAdded:Connect(function(v)
			local gun = settings.Misc.GunEsp
			local gunchams = settings.Misc.GunEspChams

			if v.Name == "GunDrop" then
				if gun then
					label(v, "Gun")
				end
				if gunchams then
					cham(v)
				end
			end
		end))
	end
end

do -- Boxes
	local type = "Boxes"
	local s = ss[type]
	Boxes.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled
	})
	Boxes.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set(type, "Transparency", value)
		end,
		Min = 0,
		Max = 1,
		Def = s.Transparency,
		Decimals = 2
	})
	Boxes.ColorPicker({
		Text = "Color",
		Default = s.Color,
		Callback = function(value)
			esp:Set(type, "Color", value)
		end
	})
	Boxes.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set(type, "UseTeamColor", value)
		end,
		Enabled = s.UseTeamColor
	})
	Boxes.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set(type, "RainbowColor", value)
		end,
		Enabled = s.RainbowColor
	})
	Boxes.Toggle({
		Text = "Outline",
		Callback = function(value)
			esp:Set(type, "Outline", value)
		end,
		Enabled = s.Outline
	})
	Boxes.ColorPicker({
		Text = "Outline Color",
		Default = s.OutlineColor,
		Callback = function(value)
			esp:Set(type, "OutlineColor", value)
		end
	})
	Boxes.Slider({
		Text = "Outline Thickness",
		Callback = function(value)
			esp:Set(type, "OutlineThickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.OutlineThickness,
		Decimals = 2,
		Suffix = " px"
	})
	Boxes.Slider({
		Text = "Thickness",
		Callback = function(value)
			esp:Set(type, "Thickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.Thickness,
		Decimals = 2,
		Suffix = " px"
	})
end

do -- Tracers
	local type = "Tracers"
	local s = ss[type]
	Tracers.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled
	})
	Tracers.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set(type, "Transparency", value)
		end,
		Min = 0,
		Max = 1,
		Def = s.Transparency,
		Decimals = 2
	})
	Tracers.ColorPicker({
		Text = "Color",
		Default = s.Color,
		Callback = function(value)
			esp:Set(type, "Color", value)
		end
	})
	Tracers.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set(type, "UseTeamColor", value)
		end,
		Enabled = s.UseTeamColor
	})
	Tracers.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set(type, "RainbowColor", value)
		end,
		Enabled = s.RainbowColor
	})
	Tracers.Toggle({
		Text = "Outline",
		Callback = function(value)
			esp:Set(type, "Outline", value)
		end,
		Enabled = s.Outline
	})
	Tracers.ColorPicker({
		Text = "Outline Color",
		Default = s.OutlineColor,
		Callback = function(value)
			esp:Set(type, "OutlineColor", value)
		end
	})
	Tracers.Slider({
		Text = "Outline Thickness",
		Callback = function(value)
			esp:Set(type, "OutlineThickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.OutlineThickness,
		Decimals = 2,
		Suffix = " px"
	})
	Tracers.Dropdown({
		Text = "Origin",
		Callback = function(value)
			esp:Set(type, "Origin", value)
		end,
		Options = {"Top","Center","Bottom","Mouse"},
		Def = s.Origin
	})
	Tracers.Slider({
		Text = "Thickness",
		Callback = function(value)
			esp:Set(type, "Thickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.Thickness,
		Decimals = 2,
		Suffix = " px"
	})
end

do -- Names
	local type = "Names"
	local s = ss[type]
	Names.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled
	})
	Names.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set(type, "Transparency", value)
		end,
		Min = 0,
		Max = 1,
		Def = s.Transparency,
		Decimals = 2
	})
	Names.ColorPicker({
		Text = "Color",
		Default = s.Color,
		Callback = function(value)
			esp:Set(type, "Color", value)
		end
	})
	Names.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set(type, "UseTeamColor", value)
		end,
		Enabled = s.UseTeamColor
	})
	Names.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set(type, "RainbowColor", value)
		end,
		Enabled = s.RainbowColor
	})
	Names.Toggle({
		Text = "Outline",
		Callback = function(value)
			esp:Set(type, "Outline", value)
		end,
		Enabled = s.Outline
	})
	Names.ColorPicker({
		Text = "Outline Color",
		Default = s.OutlineColor,
		Callback = function(value)
			esp:Set(type, "OutlineColor", value)
		end
	})
	local def
	for i,v in next, Drawing.Fonts do
		if v == s.Font then
			def = i
		end
	end
	Names.Dropdown({
		Text = "Font",
		Callback = function(value)
			esp:Set(type, "Font", Drawing.Fonts[value])
		end,
		Options = {"UI","System","Plex","Monospace"},
		Def = def
	})
	Names.Slider({
		Text = "Text Size",
		Callback = function(value)
			esp:Set(type, "Size",value)
		end,
		Min = 1,
		Max = 32,
		Def = s.Size
	})
	Names.Toggle({
		Text = "Show Distance",
		Callback = function(value)
			esp:Set(type, "ShowDistance", value)
		end,
		Enabled = s.ShowDistance
	})
	Names.Toggle({
		Text = "Show Health",
		Callback = function(value)
			esp:Set(type, "ShowHealth", value)
		end,
		Enabled = s.ShowHealth
	})
	Names.Toggle({
		Text = "Use Display Name",
		Callback = function(value)
			esp:Set(type, "UseDisplayName", value)
		end,
		Enabled = s.UseDisplayName
	})
	Names.TextField({
		Text = "Distance Data Type",
		Type = "Default",
		Callback = function(value)
			esp:Set(type, "DistanceDataType", value)
		end,
		Menu = {
			Info = function()
				UI.Banner("This is the Distance measurement. For example, if this is <b>studs</b> then it will show <b>100studs</b>")
			end
		}
	})
	Names.Dropdown({
		Text = "Health Data Type",
		Callback = function(value)
			esp:Set(type, "HealthDataType", value)
		end,
		Options = {
			"Percentage",
			"Value"
		},
		Def = s.HealthDataType,
		Menu = {
			Info = function()
				UI.Banner("This changes the format the health is shown in.\n- Percentage: [ 100% ]\n- Value: [ 100/100 ]")
			end
		}
	})
end

do -- Skeletons
	local type = "Skeletons"
	local s = ss[type]
	Skeletons.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled
	})
	Skeletons.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set(type, "Transparency", value)
		end,
		Min = 0,
		Max = 1,
		Def = s.Transparency,
		Decimals = 2
	})
	Skeletons.ColorPicker({
		Text = "Color",
		Default = s.Color,
		Callback = function(value)
			esp:Set(type, "Color", value)
		end
	})
	Skeletons.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set(type, "UseTeamColor", value)
		end,
		Enabled = s.UseTeamColor
	})
	Skeletons.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set(type, "RainbowColor",value)
		end,
		Enabled = s.RainbowColor
	})
	Skeletons.Toggle({
		Text = "Outline",
		Callback = function(value)
			esp:Set(type, "Outline", value)
		end,
		Enabled = s.Outline
	})
	Skeletons.ColorPicker({
		Text = "Outline Color",
		Default = s.OutlineColor,
		Callback = function(value)
			esp:Set(type, "OutlineColor", value)
		end
	})
	Skeletons.Slider({
		Text = "Outline Thickness",
		Callback = function(value)
			esp:Set(type, "OutlineThickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.OutlineThickness,
		Decimals = 2,
		Suffix = " px"
	})
	Skeletons.Slider({
		Text = "Thickness",
		Callback = function(value)
			esp:Set(type, "Thickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.Thickness,
		Decimals = 2,
		Suffix = " px"
	})
end

do -- HealthBars
	local type = "HealthBars"
	local s = ss[type]
	HealthBars.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled
	})
	HealthBars.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set(type, "Transparency", value)
		end,
		Min = 0,
		Max = 1,
		Def = s.Transparency,
		Decimals = 2
	})
	HealthBars.ColorPicker({
		Text = "Color",
		Default = s.Color,
		Callback = function(value)
			esp:Set(type, "Color", value)
		end
	})
	HealthBars.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set(type, "UseTeamColor", value)
		end,
		Enabled = s.UseTeamColor
	})
	HealthBars.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set(type, "RainbowColor", value)
		end,
		Enabled = s.RainbowColor
	})
	HealthBars.Toggle({
		Text = "Outline",
		Callback = function(value)
			esp:Set(type, "Outline", value)
		end,
		Enabled = s.Outline
	})
	HealthBars.ColorPicker({
		Text = "Outline Color",
		Default = s.OutlineColor,
		Callback = function(value)
			esp:Set(type, "OutlineColor", value)
		end
	})
	HealthBars.Slider({
		Text = "Outline Thickness",
		Callback = function(value)
			esp:Set(type, "OutlineThickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.OutlineThickness,
		Decimals = 2,
		Suffix = " px"
	})
	HealthBars.Dropdown({
		Text = "Origin",
		Callback = function(value)
			esp:Set(type, "Origin", value)
		end,
		Options = {"None","Left","Right"},
		Def = s.Origin
	})
	HealthBars.Toggle({
		Text = "Outline Bar Only",
		Callback = function(value)
			esp:Set(type, "OutlineBarOnly", value)
		end,
		Enabled = s.OutlineBarOnly
	})
end

do -- HeadDots
	local type = "HeadDots"
	local s = ss[type]
	HeadDots.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled,
		Menu = {
			Info = function()
				UI.Banner("This works best on 70 camera fov! Anything higher can make the circle look larger when closer to the player.")
			end
		}
	})
	HeadDots.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set(type, "Transparency", value)
		end,
		Min = 0,
		Max = 1,
		Def = s.Transparency,
		Decimals = 2
	})
	HeadDots.ColorPicker({
		Text = "Color",
		Default = s.Color,
		Callback = function(value)
			esp:Set(type, "Color", value)
		end
	})
	HeadDots.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set(type, "UseTeamColor", value)
		end,
		Enabled = s.UseTeamColor
	})
	HeadDots.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set(type, "RainbowColor", value)
		end,
		Enabled = s.RainbowColor
	})
	HeadDots.Toggle({
		Text = "Outline",
		Callback = function(value)
			esp:Set(type, "Outline", value)
		end,
		Enabled = s.Outline
	})
	HeadDots.ColorPicker({
		Text = "Outline Color",
		Default = s.OutlineColor,
		Callback = function(value)
			esp:Set(type, "OutlineColor", value)
		end
	})
	HeadDots.Slider({
		Text = "Outline Thickness",
		Callback = function(value)
			esp:Set(type, "OutlineThickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.OutlineThickness,
		Decimals = 2,
		Suffix = " px"
	})
	HeadDots.Slider({
		Text = "Thickness",
		Callback = function(value)
			esp:Set(type, "Thickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.Thickness,
		Decimals = 2,
		Suffix = " px"
	})
	HeadDots.Toggle({
		Text = "Filled",
		Callback = function(value)
			esp:Set(type, "Filled", value)
		end,
		Enabled = s.Filled
	})
	HeadDots.Slider({
		Text = "Scale",
		Callback = function(value)
			esp:Set(type, "Scale", value)
		end,
		Min = 0.5,
		Max = 2,
		Def = s.Scale,
		Decimals = 2,
		Suffix = "x"
	})
end

do -- LookTracers
	local type = "LookTracers"
	local s = ss[type]
	LookTracers.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled
	})
	LookTracers.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set(type, "Transparency", value)
		end,
		Min = 0,
		Max = 1,
		Def = s.Transparency,
		Decimals = 2
	})
	LookTracers.ColorPicker({
		Text = "Color",
		Default = s.Color,
		Callback = function(value)
			esp:Set(type, "Color", value)
		end
	})
	LookTracers.Toggle({
		Text = "Use Team Color",
		Callback = function(value)
			esp:Set(type, "UseTeamColor", value)
		end,
		Enabled = s.UseTeamColor
	})
	LookTracers.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set(type, "RainbowColor", value)
		end,
		Enabled = s.RainbowColor
	})
	LookTracers.Toggle({
		Text = "Outline",
		Callback = function(value)
			esp:Set(type, "Outline", value)
		end,
		Enabled = s.Outline
	})
	LookTracers.ColorPicker({
		Text = "Outline Color",
		Default = s.OutlineColor,
		Callback = function(value)
			esp:Set(type, "OutlineColor", value)
		end
	})
	LookTracers.Slider({
		Text = "Outline Thickness",
		Callback = function(value)
			esp:Set(type, "OutlineThickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.OutlineThickness,
		Decimals = 2
	})
	LookTracers.Slider({
		Text = "Thickness",
		Callback = function(value)
			esp:Set(type, "Thickness", value)
		end,
		Min = 1,
		Max = 5,
		Def = s.Thickness,
		Decimals = 2
	})
	LookTracers.Slider({
		Text = "Length",
		Callback = function(value)
			esp:Set(type, "Length", value)
		end,
		Min = 3,
		Max = 25,
		Def = s.Length,
		Suffix = " studs"
	})
end

do -- All
	All.Toggle({
		Text = "Enabled (All)",
		Callback = function(value)
			if loaded then
				esp:SetAll("Enabled", value)
			end
		end,
		Enabled = false,
		Menu = {
			Info = function()
				UI.Banner("Changes the 'Enabled' setting for all types.")
			end
		}
	})
	All.Slider({
		Text = "Transparency (All)",
		Callback = function(value)
			if loaded then
				esp:SetAll("Transparency", value)
			end
		end,
		Min = 0,
		Max = 1,
		Def = 1,
		Decimals = 2,
		Menu = {
			Info = function()
				UI.Banner("Changes the 'Transparency' setting for all types.")
			end
		}
	})
	All.ColorPicker({
		Text = "Color (All)",
		Default = Color3.fromRGB(255,255,255),
		Callback = function(value)
			if loaded then
				esp:SetAll("Color", value)
			end
		end,
		Menu = {
			Info = function()
				UI.Banner("Changes the 'Color' setting for all types.")
			end
		}
	})
	All.Toggle({
		Text = "Use Team Color (All)",
		Callback = function(value)
			if loaded then
				esp:SetAll("UseTeamColor", value)
			end
		end,
		Enabled = true,
		Menu = {
			Info = function()
				UI.Banner("Changes the 'Use Team Color' setting for all types.")
			end
		}
	})
	All.Toggle({
		Text = "Rainbow Color (All)",
		Callback = function(value)
			if loaded then
				esp:SetAll("RainbowColor", value)
			end
		end,
		Enabled = false,
		Menu = {
			Info = function()
				UI.Banner("Changes the 'RainbowColor' setting for all types.")
			end
		}
	})
	All.Toggle({
		Text = "Outline (All)",
		Callback = function(value)
			if loaded then
				esp:SetAll("Outline", value)
			end
		end,
		Enabled = true,
		Menu = {
			Info = function()
				UI.Banner("Changes the 'Outline' setting for all types.")
			end
		}
	})
	All.ColorPicker({
		Text = "Outline Color (All)",
		Default = Color3.fromRGB(0,0,0),
		Callback = function(value)
			if loaded then
				esp:SetAll("OutlineColor", value)
			end
		end,
		Menu = {
			Info = function()
				UI.Banner("Changes the 'OutlineColor' setting for all types.")
			end
		}
	})
	All.Slider({
		Text = "Outline Thickness (All)",
		Callback = function(value)
			if loaded then
				esp:SetAll("OutlineThickness", value)
			end
		end,
		Min = 1,
		Max = 5,
		Def = 3,
		Suffix = " px",
		Menu = {
			Info = function()
				UI.Banner("Changes the 'OutlineThickness' setting for all types. (except for Names)")
			end
		}
	})
end

do -- MouseVisibility
	local type = "MouseVisibility"
	local s = ss[type]
	MouseVisibility.Toggle({
		Text = "Enabled",
		Callback = function(value)
			esp:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled,
		Menu = {
			Info = function()
				UI.Banner("Makes any drawing objects transparent when they are near your mouse.")
			end
		}
	})
	MouseVisibility.Slider({
		Text = "Radius",
		Callback = function(value)
			esp:Set(type, "Radius", value)
		end,
		Min = 10,
		Max = 150,
		Def = s.Radius,
		Suffix = " px",
		Menu = {
			Info = function()
				UI.Banner("This only takes effect when <b>Method</b> is set to <b>Radius</b>.")
			end
		}
	})
	MouseVisibility.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set(type, "Transparency", value)
		end,
		Min = 0,
		Max = 1,
		Def = s.Transparency,
		Decimals = 2
	})
	MouseVisibility.Dropdown({
		Text = "Method",
		Callback = function(value)
			esp:Set(type, "Method", value)
		end,
		Options = {
			"Hover",
			"Radius"
		},
		Def = s.Method,
		Menu = {
			Info = function()
				UI.Banner("<b>Hover</b> is recommended. <b>Radius</b> is an older method which has flaws.")
			end
		}
	})
	MouseVisibility.Slider({
		Text = "Hover Radius",
		Callback = function(value)
			esp:Set(type, "HoverRadius", value)
		end,
		Min = 0,
		Max = 150,
		Def = s.HoverRadius,
		Suffix = " px",
		Menu = {
			Info = function()
				UI.Banner("This only takes effect when <b>Method</b> is set to <b>Hover</b>.")
			end
		}
	})
	local conn, obj = nil
	MouseVisibility.Toggle({
		Text = "Show Hover Radius",
		Callback = function(value)
			if value and not conn and not obj then
				obj = Drawing.new("Square")
				obj.Visible = true
				obj.Color = Color3.new(0, 1, 0)
				obj.Transparency = 1
				obj.ZIndex = 1000
				obj.Thickness = 1
				conn = RunService.Heartbeat:Connect(function()
					local size = esp:Get(type, "HoverRadius")
					obj.Size = Vector2.new(size * 2, size * 2)

					local mouse = uis:GetMouseLocation()
					obj.Position = Vector2.new(mouse.X - size, mouse.Y - size)
				end)
			else
				if conn then
					conn:Disconnect()
					conn = nil
				end
				if obj then
					obj:Remove()
					obj = nil
				end
			end
		end,
		Enabled = false
	})
	local selected = s.Selected
	MouseVisibility.ChipSet({
		Text = "Selected",
		Callback = function(value)
			esp:Set(type, "Selected", value)
		end,
		Options = {
			Boxes = selected.Boxes,
			Tracers = selected.Tracers,
			Names = selected.Names,
			Skeletons = selected.Skeletons,
			HealthBars = selected.HealthBars,
			HeadDots = selected.HeadDots,
			LookTracers = selected.LookTracers
		}
	})
end

do -- Other
	local type = "Other"
	Other.Toggle({
		Text = "Team Check",
		Callback = function(value)
			esp:Set(type, "TeamCheck", value)
		end,
		Enabled = ss.TeamCheck
	})
	esptogglebtn = Other.Keybind({
		Text = "Esp Toggle Key",
		Callback = function(value)
			esp:Set(type, "ToggleKey", value.Name)
		end,
		Def = Enum.KeyCode[esp:Get("Other", "ToggleKey")],
		AllowMouse = false
	})
	Other.Slider({
		Text = "Refresh Rate",
		Callback = function(value)
			esp:Set(type, "RefreshRate", value)
		end,
		Min = 0,
		Max = 50,
		Def = ss.RefreshRate,
		Suffix = " ms",
		Menu = {
			Info = function()
				UI.Banner("How fast the esp updates. This is in milliseconds.")
			end
		}
	})
	Other.Slider({
		Text = "Maximum Distance",
		Callback = function(value)
			esp:Set(type, "MaximumDistance", value)
		end,
		Min = 50,
		Max = 2000,
		Def = ss.MaximumDistance,
		Suffix = " studs"
	})
	Other.Toggle({
		Text = "Face Camera",
		Callback = function(value)
			esp:Set(type, "FaceCamera", value)
		end,
		Enabled = ss.FaceCamera,
		Menu = {
			Info = function()
				UI.Banner("Makes Boxes and Health Bars appear 2D.")
			end
		}
	})
	Other.Toggle({
		Text = "Align Points",
		Callback = function(value)
			esp:Set(type, "AlignPoints", value)
		end,
		Enabled = ss.AlignPoints,
		Menu = {
			Info = function()
				UI.Banner("Further improves 2D effect. Only works while 'Face Camera' is enabled.\nNote that this may cause esp to have abnormal behavior when looking from certain angles.")
			end
		}
	})
	Other.Button({
		Text = "Destroy Esp",
		Callback = destroy,
		Menu = {
			Info = function()
				UI.Banner("This will completely remove Universal Esp, including the UI.")
			end
		}
	})
	Other.Button({
		Text = "Load Performance Version",
		Callback = function()
			UI.Banner({
				Text = "Are you sure you want to load the Performance version?",
				Callback = function(value)
					if value == "Yes" then
						destroy()
						loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEspPerformance.lua"))()
					end
				end,
				Options = {"Yes", "No"}
			})
		end,
		Menu = {
			Info = function()
				UI.Banner("This will replace the current esp with an optimized version made for performance which can offer more fps. Note that this version does NOT have any customizability.")
			end
		}
	})
	Other.Button({
		Text = "Re-Load UI",
		Callback = function()
			UI.Banner({
				Text = "Are you sure you want to re-load the UI?",
				Callback = function(value)
					if value == "Yes" then
						reload()
					end
				end,
				Options = {"Yes", "No"}
			})
		end
	})
	Other.Button({
		Text = "Load Safe Mode",
		Callback = function()
			UI.Banner({
				Text = "Are you sure you want to load the UI in Safe Mode?",
				Callback = function(value)
					if value == "Yes" then
						reload(true)
					end
				end,
				Options = {"Yes", "No"}
			})
		end,
		Menu = {
			Info = function()
				UI.Banner("Re-loads the ui in Safe Mode. (prevents detection via script errors)\nNote that this <b>does not</b> prevent <i>all</i> detections.")
			end
		}
	})
	uitogglebtn = Other.Keybind({
		Text = "UI Toggle Key",
		Callback = function(value)
			togglekey = value
		end,
		Def = togglekey,
		AllowMouse = false
	})
	Other.Button({
		Text = "Hide UI",
		Callback = function()
			UI.Toggle(false)
		end
	})
	Other.Label({
		Text = "Made by zzerexx#3970 | "..version,
		Center = true,
		Transparent = true
	})
end

do -- Configs
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
				save(cfgname)
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
			cfg.Load(selectedcfg, load)
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
			save(selectedcfg)
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

do -- Players
	local plr = players.LocalPlayer.Name
	local dd = Players.Dropdown({
		Text = "Player List",
		Callback = function(value)
			plr = value
		end,
		Options = {},
		Def = players.LocalPlayer.Name
	})
	local function update()
		local t = {}
		for _,v in next, players:GetPlayers() do
			table.insert(t, v.Name)
		end
		table.sort(t, function(a,b)
			return a < b
		end)
		dd:SetOptions(t)
	end
	update()
	table.insert(connections, players.PlayerAdded:Connect(update))
	table.insert(connections, players.PlayerRemoving:Connect(update))

	Players.Label({
		Text = "━━ Esp Manager ━━",
		Center = true,
		Transparent = true
	})
	Players.Button({
		Text = "Add esp to the selected player",
		Callback = function()
			if not players:FindFirstChild(plr) then
				UI.Banner(plr.." is not in the game.")
				return
			end

			esp:Add(plr)
		end
	})
	Players.Button({
		Text = "Remove esp from the selected player",
		Callback = function()
			if not players:FindFirstChild(plr) then
				UI.Banner(plr.." is not in the game")
				return
			end

			esp:Remove(plr)
		end
	})
	Players.Button({
		Text = "Add esp to all players",
		Callback = function()
			for _,v in next, players:GetPlayers() do
				esp:Add(v)
			end
		end
	})
	Players.Button({
		Text = "Remove esp from all players",
		Callback = function()
			for _,v in next, players:GetPlayers() do
				esp:Remove(v)
			end
		end
	})
	Players.Toggle({
		Text = "Add esp to players upon joining",
		Callback = function(value)
			addtonew = value
		end,
		Enabled = true,
		Menu = {
			Info = function()
				UI.Banner("Adds esp to players when they join the game.")
			end
		}
	})

	local type = "Highlights"
	local s = ss[type]
	Players.Label({
		Text = "━━ Highlights ━━",
		Center = true,
		Transparent = true
	})
	Players.Toggle({
		Text = "Highlights",
		Callback = function(value)
			esp:Set(type, "Enabled", value)
		end,
		Enabled = s.Enabled
	})
	Players.Slider({
		Text = "Highlights: Transparency",
		Callback = function(value)
			esp:Set(type, "Transparency", value)
		end,
		Min = 0,
		Max = 1,
		Def = s.Transparency,
		Decimals = 2
	})
	Players.ColorPicker({
		Text = "Highlights: Color",
		Callback = function(value)
			esp:Set(type, "Color", value)
		end,
		Def = s.Color
	})
	Players.Toggle({
		Text = "Highlights: Always On Top",
		Callback = function(value)
			esp:Set(type, "AlwaysOnTop", value)
		end,
		Enabled = s.AlwaysOnTop
	})
	Players.Button({
		Text = "Highlight the selected player",
		Callback = function()
			if not players:FindFirstChild(plr) then
				UI.Banner(plr.." is not in the game.")
				return
			end

			local t = esp:Get("Highlights", "Players")
			if table.find(t, plr) then
				UI.Banner(plr.." is already highlighted")
				return
			end
			table.insert(t, plr)
			esp:Set("Highlights", "Players", t)
		end
	})
	Players.Button({
		Text = "Un-highlight the selected player",
		Callback = function()
			if not players:FindFirstChild(plr) then
				UI.Banner(plr.." is not in the game.")
				return
			end

			local t = esp:Get("Highlights", "Players")
			local index = table.find(t, plr)
			if not index then
				UI.Banner(plr.." is not highlighted")
				return
			end
			table.remove(t, index)
			esp:Set("Highlights", "Players", t)
		end
	})
end

do -- NPC
	local type = "NPC"
	local s = ss[type]

	NPC.Button({
		Text = "Add esp to all NPCs",
		Callback = function()
			for _,v in next, workspace:GetDescendants() do
				local model = v:FindFirstAncestorOfClass("Model")
				if v:IsA("Humanoid") and model and not players:GetPlayerFromCharacter(model) then
					esp:Add(model)
				end
			end
		end
	})
	NPC.Button({
		Text = "Remove esp from all NPCs",
		Callback = function()
			for _,v in next, workspace:GetDescendants() do
				local model = v:FindFirstAncestorOfClass("Model")
				if v:IsA("Humanoid") and model and not players:GetPlayerFromCharacter(model) then
					esp:Remove(model)
				end
			end
		end
	})
	NPC.Toggle({
		Text = "Add esp to NPCs when created",
		Callback = function(value)
			addtonpcs = value
		end,
		Enabled = false,
		Menu = {
			Info = function()
				UI.Banner("When NPCs are created, esp will automatically be added to them.")
			end
		}
	})

	NPC.ColorPicker({
		Text = "Color",
		Callback = function(value)
			esp:Set(type, "Color", value)
		end,
		Def = s.Color
	})
	NPC.Slider({
		Text = "Transparency",
		Callback = function(value)
			esp:Set(type, "Transparency", value)
		end,
		Min = 0,
		Max = 1,
		Def = s.Transparency,
		Decimals = 2
	})
	NPC.Toggle({
		Text = "Rainbow Color",
		Callback = function(value)
			esp:Set(type, "RainbowColor", value)
		end,
		Enabled = s.RainbowColor
	})
	local o = s.Overrides
	NPC.ChipSet({
		Text = "Overrides",
		Callback = function(value)
			esp:Set(type, "Overrides", value)
		end,
		Options = {
			Boxes = o.Boxes,
			Tracers = o.Tracers,
			Names = o.Names,
			Skeletons = o.Skeletons,
			HealthBars = o.HealthBars,
			HeadDots = o.HeadDots,
			LookTracers = o.LookTracers
		},
		Menu = {
			Info = function()
				UI.Banner("If a type is enabled, the options above will be used instead. Otherwise, it will use the corresponding type's option.")
			end
		}
	})
end

do -- Stats
	local stats = Stats.Table({
		Text = "Esp Statistics",
		Key = "Type",
		Value = "# of Objects",
		ShowInfo = true,
		Data = esp:GetTotalObjects()
	})
	Stats.Button({
		Text = "Update Statistics",
		Callback = function()
			stats:SetData(esp:GetTotalObjects())
		end
	})
end

do -- Feedback
	local url = "https://carsick-welds.000webhostapp.com"
	local script = "Esp"

	local Http = game:GetService("HttpService")
	local request = request or http_request or (http and http.request) or (syn and syn.request) or nil
	local Hash
	local information = {
		"The name of the game you're in",
		"The name of the exploit you're currently using",
		"Your <b>hashed</b> user id"
	}

	local HashedId
	local GameIcon
	local GameName
	local GameUrl

	if request then
		local msg = nil
		local sending = false
		local bug = false
		Feedback.TextBox({
			Text = "Your message here",
			Callback = function(value)
				msg = value
			end,
			ClearOnFocus = false
		})
		Feedback.Toggle({
			Text = "Is this a bug report?",
			Callback = function(value)
				bug = value
			end,
			Enabled = false
		})
		Feedback.Button({
			Text = "Send Feedback",
			Callback = function()
				if sending then return end
				sending = true
				UI.Banner("Sending feedback...")

				if not Hash then
					Hash = Load("Libraries/Hash")
				end
				if not HashedId then
					HashedId = Hash.sha384(tostring(players.LocalPlayer.UserId))
				end
				if not GameIcon then
					GameIcon = Http:JSONDecode(game:HttpGet(string.format("https://thumbnails.roblox.com/v1/places/gameicons?placeIds=%s&size=128x128&format=Png&isCircular=false", game.PlaceId))).data[1].imageUrl
				end
				if not GameName then
					GameName = "Game: "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
				end
				if not GameUrl then
					GameUrl = "https://roblox.com/games/"..game.PlaceId
				end

				local req = request({
					Url = url,
					Method = "POST",
					Headers = {
						['Content-Type'] = "application/json"
					},
					Body = Http:JSONEncode({
						content = "",
						embeds = {{
							title = string.format("Universal %s %s", script, bug and "Bug Report" or "Feedback"),
							description = string.format("`%s`%s", msg, (HashedId and ("\n\n`UserId Hash\n"..HashedId.."`") or "")),
							timestamp = DateTime.now():ToIsoDate(),
							color = bug and 0xFF0000 or 0x00FFFF,
							image = {
								url = GameIcon
							},
							author = {
								name = GameName,
								url = GameUrl
							},
							footer = {
								text = "Exploit: <agent>"
							}
						}}
					})
				})

				if not req.Success then
					sending = false
					UI.Banner(string.format("Failed to send feedback; Request failed\n<b>Status:</b> %s\n<b>Code:</b> %s", req.StatusMessage, req.StatusCode))
					return
				end
				
				UI.Banner("Thank you for your feedback.")
				sending = false
			end,
			Menu = {
				Info = function()
					UI.Banner("Sending feedback will also send the following information:\n- "..table.concat(information, "\n- "))
				end
			}
		})
		Feedback.Label({
			Text = "Only use this for feedback and/or bug reporting.",
			Center = true,
			Transparent = true
		})
	else
		Feedback.Label({
			Text = "Your exploit doesn't support HTTP requests.",
			Center = true,
			Transparent = true
		})
	end
end

table.insert(connections, uis.InputBegan:Connect(function(i, gp)
	if not gp and i.KeyCode == togglekey then
		UI.Toggle()
	end
end))
table.insert(connections, players.PlayerAdded:Connect(function(plr)
	if not addtonew then
		task.wait(0.5)
		esp:Remove(plr)
	end
end))
table.insert(connections, workspace.DescendantAdded:Connect(function(obj)
	if addtonpcs then
		local model = obj:FindFirstAncestorOfClass("Model")
		if obj:IsA("Humanoid") and model then
			esp:Add(model)
		end
	end
end))

loaded = true
getgenv().UESP_LOADING = false
