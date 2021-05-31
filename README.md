# Scripts  
my cool scripts  
  
# Custom Crosshair  
Updated May 5, 2021  
v1.2.0  
Create your own custom crosshair using the Drawing Library  
Open a new issue to request a game for HideGameCrosshair  
```
Script: https://pastebin.com/raw/eGiC2jPg
```  
**Updates**  
v1.1.0  
```
New Setting: RainbowColor
```  
v1.2.0  
```
New Setting: ToggleKey
```  
  
# Murder Mystery 2 Utilities  
Updated April 10, 2021  
v1.0.3  
Check the settings for features  
```
Script: https://pastebin.com/raw/FwYmgtCX
```   
**Updates**  
v1.0.1  
```
Toggling xray/noclip shouldn't interfere with typing anymore
Removed the "Ok" button from notifications
```  
v1.0.2  
```
New Setting: XrayTransparency
Minor improvements
```   
v1.0.3  
```
New Setting: InfiniteJump
Script will now check if you are using an outdated version
```  
  
# Universal Esp  
Updated May 29, 2021  
v1.0.2  
- Box Esp  
- Tracers  
- Name Esp (with Distance and Health)  
  
REQUIRES DRAWING LIBRARY  
executing multiple times will cause fps drops  
```
Script: https://pastebin.com/raw/5zw0rLH9
```  
v1.0.2  
```
Fixed "HumanoidRootPart is not a valid member of ____" error
```  
  
# Aimblox Silent Aim  
Updated May 26, 2021  
v1.0.0  
basic silent aim  

# Custom Output  
Updated May 28, 2021  
v1.0.0  
basically just the developer console since the roblox one is broken lol  
works the same as the developer console  
F9 to toggle  

# Synapse to Script-Ware  
Updated May 31, 2021  
Allows you to use Synapse exclusive functions with Script-Ware v2  
Example  
```lua
local syn = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/SynapseToScriptWare.lua", true))()

local enc = syn.crypt.custom.encrypt(
	"aes-gcm",
	"hi gamers!",
	"$nLliCMdi7gcynsFCK9u0aVNdtkNIiZG",
	"Agd13KuKIL2$")

print(enc) -- iQg5LoK5GmWmkO7HtuHH4Q==

local dec = syn.crypt.custom.decrypt(
	"aes-gcm",
	enc,
	"$nLliCMdi7gcynsFCK9u0aVNdtkNIiZG",
	"Agd13KuKIL2$"
)

print(dec) -- hi gamers!
```  
If you need to use `getsynasset` then use this:  
```
function getsynasset(path)
	return getcustomasset(path)
end
```  
  
# Counter Blox Spectator Viewer  
see who is spectating you  
u can drag it anywhere too very cool  
skidded from hexagon btw  
  
# Trigger Bot
Clicks whenever your mouse is hovering over a player  
press H to toggle  
  
# Lowest Ping  
Finds a server with the lowest ping  
Takes longer on larger games due to the amount of servers  
i think this only works if you live in the EST timezone  
  
# Phantom Forces Rainbow Gun  
basic rainbow gun script  
  
# owo-ify  
owo-ifier  
  
# Synapse XI  
Updated March 12, 2021  
v1.0.0   
Synapse X, recreated in Roblox.  
Execute **:settings** for the secret settings menu. (buggy)  
```
To-Do List:
Script Hub           DONE
Options Menu         DONE
Loader               DONE
Maximize             
Open                 DONE
Syntax Highlighting  
Numbered Lines       DONE
Scrollable Editor    DONE
Multiple Tabs        
Customizable Theme   
```  
View upcoming features in v1.1.0 in **SynapseXI Test.lua**  
not updating cuz boring
