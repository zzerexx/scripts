# Universal Script API  
This applies to Universal Esp and Aimbot  
  
## Loading Universal Script  
```
local esp = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEsp.lua"))()

local aimbot = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalAimbot.lua"))()
```  
  
## Toggle Type  
Toggles the specified type.  
```
void script:Toggle(type)

Example
esp:Toggle("Boxes")
aimbot:Toggle("Aimbot")
```  
`type` must be a valid type.  
  
## Get Option Value  
Returns the specified options' value. 
```
variant script:Get(type, option)

Example
print(esp:Get("Boxes","Transparency"))
print(aimbot:Get("Aimbot","TargetPart"))
```  
`type` must be a valid type.  
`option` must be a valid option.  
  
## Set Option Value  
Sets the specified options' value.  
```
void script:Set(type, option, value)

Example
esp:Set("Boxes","Transparency",1)
aimbot:Set("Aimbot","VisibleCheck",true)
```  
`type` must be a valid type.  
`option` must be a valid option.  
`value` is whatever you want to set the option's value to.  
  
If you want to use Get or Set on anything that isn't in a table, set `type` to `"Other"`  
You don't have to do this for Toggle.  
```
Example
esp:Toggle("TeamCheck")
esp:Get("Other","TeamCheck")
esp:Set("Other","TeamCheck",true)

aimbot:Get("Other","Whitelisted")
aimbot:Set("Other","Ignore",workspace.Ignore)
```  

# Add Label (Universal Esp)  
Adds a Label on the specified part.  
```
esp.Label(part, options)

esp.Label(workspace.Part,{
  Text = "Label",
  Transparency = 1,
  Color = Color3.fromRGB(255,255,255),
  Size = 18,
  Outline = true,
  OutlineColor = Color3.fromRGB(0,0,0),
  Font = Drawing.Fonts.UI
})
```  
  
# Add Cham (Universal Esp)  
Adds Chams on the specified part.  
```
esp.Cham(part, options)

esp.Cham(workspace.Part,{
  Transparency = 1,
  Color = Color3.fromRGB(255,255,255),
  Thickness = 2,
  Filled = true
})
```  

  
# Script Errors  

## Invalid Type  
The type you provided is invalid. Check for spelling or capitalization mistakes. Types are case sensitive.  
  
## Invalid Option  
The option you provided is invalid. Check for spelling or capitalization mistakes. Options are case sensitive.  
