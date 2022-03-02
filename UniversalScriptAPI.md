# Table of Contents  
- [Universal Script API](#universal-script-api)
  - [Loading Universal Script](#loading-universal-script)
  - [Toggle Type](#toggle-type)
  - [Get Option Value](#get-option-value)
  - [Set Option Value](#set-option-value)
  - [Set Function](#set-function)
    - [Base Functions](#base-functions)
    - [Esp Functions](#esp-functions)
    - [Aimbot Functions](#aimbot-functions)
  - [Reset Function](#reset-function)
  - [Destroy](#destroy)
- [Universal Esp Functions](#universal-esp-functions)
  - [Add Label](#add-label)
  - [Add Cham](#add-cham)
    - [Set Part](#set-part)
    - [Set Property](#set-property)
  - [Set All](#set-all)
  - [Get Objects](#get-objects)
  - [Get Total Objects](#get-total-objects)
  - [Add Esp](#add-esp)
  - [Remove Esp](#remove-esp)
  - [Remove](#remove)
- [Esp Types & Options](#esp-types--options)
  - [All Types](#all)
  - [Boxes](#boxes)
  - [Tracers](#tracers)
  - [Names](#names)
  - [Skeletons](#skeletons)
  - [Health Bars](#health-bars)
  - [Head Dots](#head-dots)
  - [Look Tracers](#look-tracers)
  - [Mouse Visibility](#mouse-visibility)
  - [Other](#other)
- [Aimbot Types & Options](#aimbot-types--options)
  - [Aimbot](#aimbot)
  - [Aim Assist](#aim-assist)
  - [Fov Circle](#fov-circle)
  - [Trigger Bot](#trigger-bot)
  - [Other](#other)
- [Script Errors](#script-errors)
  - [Invalid Type](#invalid-type)
  - [Invalid Option](#invalid-option)
  
---
  
# Universal Script API  
This applies to Universal Esp and Aimbot  
  
## Loading Universal Script  
```lua
local esp = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEsp.lua"))()
-- You can also access the esp table with getgenv().UESP

local aimbot = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalAimbot.lua"))()
-- You can also access the aimbot table with getgenv().UAIM
```  
  
---
  
## Toggle Type  
Toggles the specified type.  
```
void api:Toggle(type)
```  
### Example  
```lua
esp:Toggle("Boxes")
aimbot:Toggle("Aimbot")
```  
  
---
  
## Get Option Value  
Returns the specified options' value. 
```
variant api:Get(type, option)
```  
### Example  
```lua
print(esp:Get("Boxes", "Enabled"))
print(aimbot:Get("Aimbot", "Enabled"))
```  
  
---
  
## Set Option Value  
Sets the specified options' value.  
```
void api:Set(type, option, value)
```  
### Example  
```lua
esp:Set("Boxes", "Enabled", true)
aimbot:Set("Aimbot", "Enabled", true)
```  
  
---
  
## Set Function  
Replaces script functions.  
This can allow custom compatibility for unsupported games.  
```
void api:SetFunction(function, newfunction)
```  
### Example  
```lua
api:SetFunction("Alive", function(plr)
  return plr.Character:FindFirstChild("Humanoid").Health > 0
  -- make sure to return a boolean
end)
api:SetFunction("Character", function(plr)
  return plr.Character
  -- make sure to return the player's CHARACTER OBJECT WITH THEIR BODY PARTS
end)
api:SetFunction("Team", function(plr)
  return plr.Team
  -- this does not have to be the team object, it can be the team name or whatever
end)
api:SetFunction("FFA", function()
  return game:GetService("Players").LocalPlayer.Team == nil
  -- make sure to return a boolean
end)

esp:SetFunction("Health", function(plr)
  local hum = plr.Character.Humanoid
  return {hum.Health, hum.MaxHealth}
  -- make sure to put the player's HEALTH before MAX HEALTH {health, maxhealth}
end)

aimbot:SetFunction("Closest", function()
  -- return the closest player
  -- make sure to return the player OBJECT, not player name
end)
aimbot:SetFunction("Visible", function(plr)
  -- return if plr is visible or not
  -- make sure to return a boolean
end)
```  
### Base Functions  
Universal Esp and Aimbot both have these.  
| Name | Description | Arguments |
|:-----|:------------|:----------|
|Alive|Returns a boolean indicating if the player is alive|Player|
|Character|Returns the player's character|Player|
|Health|Returns the player's health in a table|Player|
|Team|Returns the player's team|Player|
  
### Esp Functions  
| Name | Description | Arguments |
|:-----|:------------|:----------|
|Health|Returns the player's health in a table|Player|
  
### Aimbot Functions  
| Name | Description | Arguments |
|:-----|:------------|:----------|
|Closest|Returns the closest player|None|
|Visible|Returns true if the player is visible|Player|
  
---
  
## Reset Function  
Resets the specified function back to its original function 
```
void esp:ResetFunction(function)
```  
### Example  
```lua
esp:SetFunction("Character", function(plr)
  return workspace[plr.Name]
end)

task.wait(3)

esp:ResetFunction("Character")
```  
  
## Destroy  
Removes all drawing objects and disconnects all connections.  
```
void api:Destroy()
```  
### Example  
```lua
esp:Destroy()
aimbot:Destroy()
```  
  
---
  
# Universal Esp Functions  
These are only available on Universal Esp!  
  
## Add Label  
Adds a Label on the specified part.  
Note: You don't need to set all of the options. If they aren't provided, they will be set to the default option.  
```
object esp.Label(part, options)
```  
### Example  
```lua
local label = esp.Label(workspace.Part, {
  Text = "Part",
  Transparency = 1,
  Color = Color3.fromRGB(255, 255, 255),
  RainbowColor = false,
  Size = 18,
  Outline = true,
  OutlineColor = Color3.fromRGB(0, 0, 0),
  Font = Drawing.Fonts.UI,
  Offset = Vector2.new()
})

task.wait(3)
label:Remove()
```  
  
---
  
## Add Cham  
Adds Chams on the specified part.  
Note: You don't need to set all of the options. If they aren't provided, they will be set to the default option.  
```
object esp.Cham(part, options)
```  
### Example  
```lua
local cham = esp.Cham(workspace.Part, {
  Transparency = 1,
  Color = Color3.fromRGB(255, 255, 255),
  RainbowColor = false,
  Thickness = 2,
  Filled = true
})

task.wait(3)
cham:Remove()
```  
  
---
  
## Set Part  
Sets the label/cham's target part to the specified part.  
This is only available for Labels and Chams!  
```
void object:SetPart(part)
```  
### Example  
```lua
local label = esp.Label(workspace.Part)

task.wait(3)

label:SetPart(workspace.OtherPart)
```  
  
---
  
## Set Property  
Sets the label/cham's property.  
This is only available for Labels and Chams!  
```
void object:SetProp(property, value)
```
### Example  
```lua
local label = esp.Label(workspace.Part)

task.wait(3)

label:SetProp("Font", Drawing.Fonts.Plex)
```  
  
---
  
## Set All  
Sets all options to a value.  
Note that this only works for options that are on all types. (Enabled, Transparency, Color, UseTeamColor)  
```
void esp:SetAll(option, value)
```  
### Example  
```lua
esp:SetAll("Color", Color3.fromRGB(0, 255, 0)) -- sets all colors to green
```  
  
---
  
## Get Objects  
Returns a table of objects for the specified player.  
You can use either the Player object, or the player's username as a string.  
Calling this function without arguments will return all objects.  
```
table esp:GetObjects(player)
```  
### Example  
```lua
table.foreach(esp:GetObjects("Roblox"), print)

-- You can also use this function to remove specific objects on players
esp:GetObjects("Roblox").Box:Remove() -- Only call :Remove on the table
```  
  
---
  
## Get Total Objects  
Returns a table of data.  
```
table esp:GetTotalObjects()
```  
### Example  
```lua
local data = esp:GetTotalObjects()
table.foreach(data, print)
```  
  
---
  
## Add Esp  
Adds Esp on the specified player.  
You can use either the Player object, or the player's username as a string.  
```
void esp:Add(player)
```  
### Example  
```lua
esp:Add("Roblox")
```  
  
---
  
## Remove Esp  
Removes Esp from the specified player.  
You can use either the Player object, or the player's username as a string.  
```
void esp:Remove(player)
```  
### Example  
```lua
esp:Remove("Roblox")
```  
  
---
  
## Remove  
Removes specific object(s).  
```
void table:Remove()
```  
### Example  
```lua
esp:GetObjects(game.Players.Roblox).Box:Remove() -- Only call :Remove on the table
```  
  
---
  
# Esp Types & Options  
### All  
All types have these options  
| Name | Type | Default |
|:------|:-----|:------|
|Enabled|Boolean|true|
|Transparency|Number|1|
|Color|Color3|255,255,255|
|UseTeamColor|Boolean|true|
|RainbowColor|Boolean|false|
|Outline|Boolean|true|
|OutlineColor|Color3|0,0,0|
|OutlineThickness|Number|3|  
  
### Boxes  
| Name | Type | Default |
|:------|:-----|:------|
|Thickness|Number|1|
  
### Tracers  
| Name | Type | Default |
|:------|:-----|:------|
|Origin|String|Top|
|Thickness|Number|1|
  
### Names  
| Name | Type | Default |
|:------|:-----|:------|
|Font|Font|Drawing.Fonts.UI|
|Size|Number|18|
|Outline|Boolean|true|
|OutlineColor|Color3|0,0,0|
|ShowDistance|Boolean|false|
|ShowHealth|Boolean|true|
|UseDisplayName|Boolean|false|
|DistanceDataType|String|m|
|HealthDataType|String|Percentage|  
  
### Skeletons
| Name | Type | Default |
|:------|:-----|:------|
|Thickness|Number|1|
  
### Health Bars
| Name | Type | Default |
|:------|:-----|:------|
|Origin|String|None|
|OutlineBarOnly|Boolean|true|
  
### Head Dots  
| Name | Type | Default |
|:------|:-----|:------|
|Thickness|Number|1|
|Filled|Boolean|false|
|Scale|Number|1|
  
### Look Tracers  
| Name | Type | Default |
|:------|:-----|:------|
|Thickness|Number|1|
|Length|Number|5|
  
### Mouse Visibility  
| Name | Type | Default |
|:------|:-----|:------|
|Enabled|Boolean|true|
|Radius|Number|60|
|Transparency|Number|0.3|
|Selected|Table|All true|
  
### Other
| Name | Type | Default |
|:-----|:-----|:--------|
|TeamCheck|Boolean|false|
|ToggleKey|String|RightAlt|
|RefreshRate|Number|10|
|MaximumDistance|Number|500|
|FaceCamera|Boolean|false|
  
---
  
# Aimbot Types & Options  
### Aimbot  
| Name | Type | Default |
|:-----|:-----|:--------|
|Enabled|Boolean|true|
|TargetPart|String|Head|
|Use_mousemoverel|Boolean|true|
|Strength|Number|100|
|AimType|String|Hold|
  
### Aim Assist  
| Name | Type | Default |
|:-----|:-----|:--------|
|Enabled|Boolean|false|
|MinFov|Number|15|
|MaxFov|Number|80|
|DynamicFov|Boolean|true|
|ShowFov|Boolean|false|
|Strength|Number|55|
|SlowSensitivity|Boolean|true|
|SlowFactor|Number|1.75|
|RequireMovement|Boolean|true|  
  
### Fov Circle  
| Name | Type | Default |
|:-----|:-----|:--------|
|Enabled|Boolean|true|
|Dynamic|Boolean|true|
|Radius|Number|100|
|Transparency|Number|1|
|Color|Color3|255,255,255|
|NumSides|Number|64|
  
### Trigger Bot
| Name | Type | Default |
|:-----|:-----|:--------|
|Enabled|Boolean|true|
|Delay|Number|60|
|Spam|Boolean|true|
|ClicksPerSecond|Number|10|
  
### Other  
| Name | Type | Default |
|:-----|:-----|:--------|
|TeamCheck|Boolean|true|
|VisibleCheck|Boolean|true|
|RefreshRate|Number|10|
|Keybind|String|MouseButton2|
|ToggleKey|String|RightShift|
|MaximumDistance|Number|300|
|AlwaysActive|Boolean|false|
|Whitelisted|Table|{}|
|WhitelistFriends|Boolean|true|
|Ignore|Table|{}|  
  
---
  
# Script Errors  

## Invalid Type  
The type you provided is invalid. Check for spelling or capitalization mistakes. Types are case sensitive.  
  
## Invalid Option  
The option you provided is invalid. Check for spelling or capitalization mistakes. Options are case sensitive.  
