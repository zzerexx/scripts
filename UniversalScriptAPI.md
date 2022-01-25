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
  
## Set Prop  
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
  
## Set Function  
Replaces universal esp's functions.  
This can allow custom compatibility for unsupported games.  
```
void esp:SetFunction(function, newfunction)
```  
### Example  
```lua
esp:SetFunction("Alive", function(player)
  if player.Character:FindFirstChild("Humanoid").Health > 0 then
      return true
  end
  return false
end)
esp:SetFunction("Character", function(player)
  return player.Character
end)
esp:SetFunction("Health", function(player)
  local hum = player.Character.Humanoid
  return {hum.Health, hum.MaxHealth} -- Make sure to put the player's HEALTH before MAX HEALTH
end)
esp:SetFunction("Team", function(player)
  return player.Team
end)
```  
### Functions  
| Name | Description |
|:-----|:------------|
|Alive|Returns a boolean indicating if the player is alive|
|Character|Returns the player's character|
|Health|Returns the player's health in a table|
|Team|Returns the player's team|
  
---
  
## Reset Function  
Resets the specified function back to its original function 
```
void esp:ResetFunction(function)
```  
### Example  
```lua
esp:SetFunction("Character", function(player)
  return workspace[player.Name]
end)

task.wait(3)

esp:ResetFunction("Character")
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
### All - All types have these options  
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
Health Bars do not have any additional options.  
  
### Head Dots  
| Name | Type | Default |
|:------|:-----|:------|
|Thickness|Number|1|
|Filled|Boolean|false|
  
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
  
### Other
| Name | Type | Default |
|:-----|:-----|:--------|
|TeamCheck|Boolean|false|
|ToggleKey|String|RightAlt|
|RefreshRate|Number|10|
|MaximumDistance|Number|500|
  
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
  
### AimAssist  
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
  
### FovCircle  
| Name | Type | Default |
|:-----|:-----|:--------|
|Enabled|Boolean|true|
|Dynamic|Boolean|true|
|Radius|Number|100|
|Transparency|Number|1|
|Color|Color3|255,255,255|
|NumSides|Number|64|
  
### Other  
| Name | Type | Default |
|:-----|:-----|:--------|
|TeamCheck|Boolean|true|
|VisibleCheck|Boolean|true|
|RefreshRate|Number|10|
|Keybind|Enum.UserInputType/KeyCode|Enum.UserInputType.MouseButton2|
|ToggleKey|Enum.KeyCode|Enum.KeyCode.RightShift|
|MaximumDistance|Number|300|
|AlwaysActive|Boolean|false|
|Whitelisted|Table|{}|
|WhitelistFriends|Boolean|true|
|Ignore|Instance|nil|  
  
---
  
# Script Errors  

## Invalid Type  
The type you provided is invalid. Check for spelling or capitalization mistakes. Types are case sensitive.  
  
## Invalid Option  
The option you provided is invalid. Check for spelling or capitalization mistakes. Options are case sensitive.  
