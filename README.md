# Scripts  
my cool scripts  
  
---
  
# Universal Esp  
Updated January 25, 2022  
v1.6.5  
- Box Esp  
- Tracers  
- Name Esp  
- Skeleton Esp  
- Health Bars  
- Head Dots  
- Look Tracers  
  
```
https://pastebin.com/raw/5zw0rLH9
```  
### UI Version  
Updated January 25, 2022  
```
loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEspUI.lua"))()
```  
### Performance Version  
Updated January 26, 2022  
Boxes, Names, zero customizability, optimized asf  
Supports `SetFunction` and `ResetFunction` for compatibility!  
```
loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEspPerformance.lua"))()
```  
  
## Update v1.6.5  
Main Changes  
- Re-added Look Tracers; no longer uses raycasts, instead uses a preset length
- Added `Outline` option for all types
- Added `OutlineColor` option for all types
- Added `OutlineThickness` option for all types (except for Names)
- Fixed the random square on ScriptWare
- Removed `AntiDetection`, it will now apply by default
- Toggling esp off should allow higher fps  
  
Misc Changes  
- Added `Offset` option for Labels (Vector2)
- Added `RainbowColor` option for Labels and Chams
- Labels and Chams now support Model objects
  
Function Changes
- Added `Add(<string, Instance> Player)`; adds esp to the specified Player
- Added `Remove(<string, Instance> Player)`; remoevs esp from the specified Player
- Added `SetFunction(<string> Function, <function> New)`; replaces Function with New, this can allow custom compatibility for unsupported games
- Added `ResetFunction(<string> Function)`; sets the specified Function to its original function
- Fixed `GetObjects`
- Calling `GetObjects` without arguments returns all objects
- Fixed `GetTotalObjects`  
  
UI Changes  
- Added configs, currently only supports 1 config at a time
- If you execute your setting before executing the UI, it will load your settings instead of overwriting it  
  
---
  
# Universal Aimbot  
Updated December 31, 2021  
v1.1.11  
```
https://pastebin.com/raw/nwqE7v07
```  
**UI Version**  
Updated January 2, 2022  
```
loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalAimbotUI.lua"))()
```  
## Update v1.1.11  
- Optimizations  
- Added `RefreshRate`; allows you to control how fast the aimbot updates, which can save on performance   
- Moved the following settings to the AimbotSettings table:  
  - TeamCheck  
  - VisibleCheck  
  - Keybind  
  - ToggleKey  
  - MaximumDistance  
  - AlwaysActive  
These have been moved since they are shared between Aimbot and Aim Assist  
  
## NOTICE  
```
You are allowed to use Universal Esp and Aimbot in your script as long as you credit me (zzerexx or zzerexx#3970)
Read UniversalScriptAPI.md for more info
```  
  
---
  
# Keystrokes  
Updated November 24, 2021  
minecraft keystrokes  
shows W, A, S, D, LMB, RMB, Space, CPS, and FPS  
  
---
  
# Waypoint Manager  
Updated February 2, 2022  
unfinished  
todo: configs, creation dates, ability to close/minimize ui (forgot to add lol)  
  
---
  
# Draw Stuff  
Updated January 7, 2022  
draw stuff with the drawing library  
circles are shit but idc  
  
---

# Advanced Message Box Generator  
Updated January 10, 2022  
A gui that can assist in generating advanced message boxes  
  
---
  
# Krnl mousemoverel Fix  
an attempt to fix krnl's broken mousemoverel  
`#1` works like normal mousemoverel, but **does not work** with aimbot scripts (instantly moves to destination)  
`#2` is similar to mousemoverel and **works** with aimbot scripts (slowly moves to destination)  
  
---
  
# Custom Crosshair v1  
Updated June 4, 2021  
v1.2.1  
Create your own custom crosshair using the Drawing Library  
```
https://pastebin.com/raw/eGiC2jPg
```  
  
---
  
# Synapse Functions  
synapse functions for everyone  
cannot guarantee that protect gui is fully secure (works against recursive ffc tho)  
```
secure_call
protect_gui
clonefunction
```  
  
---
  
# Custom Crosshair v2  
Updated November 25, 2021  
v1.0.2  
A better version of Custom Crosshair v1  
This version does not use the drawing library  
  
## Update v1.0.2  
Added Rainbow Color.  
Movement Error now supports Climbing and Swimming.  
Fixed some issues with configs.  
Fixed show/hide for the preset colors and config part of the ui.  
  
---
  
# Aimblox Gui (PATCHED)
Updated July 24, 2021  
v2  
```
loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/Aimblox.lua"))()
```  
  
---
  
# Murder Mystery 2 Utilities  
Updated April 10, 2021  
v1.0.3  
Check the settings for features  
```
https://pastebin.com/raw/FwYmgtCX
```  
  
---
  
# More Color3  
Updated July 25, 2021  
Provides more Color3 functions.  
  
---
  
# Aimblox Silent Aim (PATCHED)  
Updated May 26, 2021  
v1.0.0  
basic silent aim  
  
---
  
# Custom Output  
Updated June 9, 2021  
v1.1.0  
basically just the developer console  
F9 to toggle  
  
---
  
# Synapse to Script-Ware  
Updated February 1, 2022  
Allows you to use Synapse functions on Script-Ware!  
  
**Loader**  
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/SynapseToScriptWare.lua"))()
```  
  
**Supported Functions**  
```
https://pastebin.com/raw/WeFREykX
```  
  
---
  
# Synapse to Krnl
Updated January 3, 2022  
Allows you to use Synapse functions on Krnl!  
  
**Loader**  
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/SynapseToKrnl.lua"))()
```  
  
**Supported Functions**  
```
https://pastebin.com/raw/T78hpe3S
```  
  
---
  
# Counter Blox Spectator Viewer  
see who is spectating you  
u can drag it anywhere too very cool  
skidded from hexagon btw  
  
---
  
# Trigger Bot
Clicks whenever your mouse is hovering over a player  
press H to toggle  
  
---
  
# CPS Counter  
shows your cps and fps  
works best on 60 fps, anything higher or lower can be inaccurate  
  
---
  
# Lowest Ping  
Finds a server with the lowest ping  
Takes longer on larger games due to the amount of servers  
i think this only works if you live in the EST timezone  
  
---
  
# Phantom Forces Rainbow Gun  
basic rainbow gun script  
  
---
  
# owo-ify  
owo-ifier  
  
---
  
# prison life  
work in progress  
  
---
  
# encrypt  
custom encrypter  
Updated December 17, 2021  
- optimized encryption/decryption (slightly faster)  
```lua
zz.encrypt(data,key,accesskey)
zz.decrypt(data,key)
```  
  
---
  
# Synapse XI  
Updated March 12, 2021  
v1.0.0   
syanpse in roblos  
not updating cuz boring
  
---
  
# Krnl Internal
Updated ???  
krnl in roblos  
not everything works  
i made this a while ago just wanted to release it now  
