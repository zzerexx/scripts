# Universal Esp Documentation  
coming soon  
  
## Loading Universal Esp  
```
local esp = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEsp.lua"))
```  
  
## Toggle Esp  
```
local esp = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEsp.lua"))

Esp:Toggle(type)
```  
`type` must be a valid Esp type. (such as Boxes, Tracers, Names, etc)  
  
## Get Option Value  
```
local esp = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEsp.lua"))

esp:Get(type, option)
```  
`type` must be a valid Esp type. (such as Boxes, Tracers, Names, etc)  
`option` must be a valid Esp option. (such as Transparency, Color, etc)  
  
## Set Option Value  
```
local esp = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEsp.lua"))

esp:Set(type, option, value)
```  
`type` must be a valid Esp type. (such as Boxes, Tracers, Names, etc)  
`option` must be a valid Esp option. (such as Transparency, Color, etc)  
`value` is whatever you want to set the option's value to.  
