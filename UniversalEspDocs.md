# Universal Esp Documentation  
universal aimbot is literally the same so yea  
  
## Loading Universal Esp  
```
local esp = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEsp.lua"))
```  
  
## Toggle Esp  
```
esp:Toggle(type)
```  
`type` must be a valid Esp type. (such as Boxes, Tracers, Names, etc)  
  
## Get Option Value  
```
esp:Get(type, option)
```  
`type` must be a valid Esp type. (such as Boxes, Tracers, Names, etc)  
`option` must be a valid Esp option. (such as Transparency, Color, etc)  
  
## Set Option Value  
```
esp:Set(type, option, value)
```  
`type` must be a valid Esp type. (such as Boxes, Tracers, Names, etc)  
`option` must be a valid Esp option. (such as Transparency, Color, etc)  
`value` is whatever you want to set the option's value to.  
  
# Script Errors  

## Invalid Esp Type  
The type you provided is invalid. Check for spelling or capitalization mistakes. Types are case sensitive.  
  
## Invalid Option  
The option you provided is invalid. Check for spelling or capitalization mistakes. Options are case sensitive.  
