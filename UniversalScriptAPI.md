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
table esp.Label(part, options)
```  
### Example  
```lua
local label = esp.Label(workspace.Part, {
  Text = "Part",
  Transparency = 1,
  Color = Color3.fromRGB(255, 255, 255),
  Size = 18,
  Outline = true,
  OutlineColor = Color3.fromRGB(0, 0, 0),
  Font = Drawing.Fonts.UI
})

task.wait(3)
label:Remove()
```  
  
---
  
## Add Cham  
Adds Chams on the specified part.  
Note: You don't need to set all of the options. If they aren't provided, they will be set to the default option.  
```
table esp.Cham(part, options)
```  
### Example  
```lua
local cham = esp.Cham(workspace.Part, {
  Transparency = 1,
  Color = Color3.fromRGB(255, 255, 255),
  Thickness = 2,
  Filled = true
})

task.wait(3)
cham:Remove()
```  
  
---
  
## Set Part  
Sets the label's/cham's target part to the specified part.
This is only available for Labels and Chams!  
```
void table:SetPart(part)
```  
### Example  
```lua
local label = esp.Label(workspace.Part)

task.wait(3)

label:SetPart(workspace.OtherPart)
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
```
table esp:GetObjects(player)
```  
### Example  
```lua
table.foreach(esp:GetObjects(game.Players.Roblox), print)

-- You can also use this function to remove specific objects on players
esp:GetObjects(game.Players.Roblox).Box:Remove() -- Only call :Remove on the table
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
  
### Boxes  
Boxes do not have any additional options  
  
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
  
### HealthBars
| Name | Type | Default |
|:------|:-----|:------|
|OutlineColor|Color3|0,255,0|  
  
### Other
| Name | Type | Default |
|:-----|:-----|:--------|
|TeamCheck|Boolean|false|
|ToggleKey|Enum.KeyCode|Enum.KeyCode.RightAlt|
|AntiDetection|Boolean|true|
|RefreshRate|Number|10|  
  
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
