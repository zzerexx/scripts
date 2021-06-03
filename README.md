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
  
# Aimblox Silent Aim  
Updated May 26, 2021  
v1.0.0  
basic silent aim  

# Custom Output  
Updated June 2, 2021  
v1.0.1  
basically just the developer console since the roblox one is broken lol  
works the same as the developer console  
F9 to toggle  

# Synapse to Script-Ware  
Updated June 1, 2021  
Allows you to use Synapse exclusive functions with Script-Ware v2  
This does not work with obfuscated scripts or loadstrings.  
  
**Loader**  
```lua
local syn = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/SynapseToScriptWare.lua", true))()
function getsynasset(path)
	return getcustomasset(path)
end
```  
  
**Example**    
```lua
local syn = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/SynapseToScriptWare.lua", true))()
function getsynasset(path) -- this is only needed if you want to use getsynasset
	return getcustomasset(path)
end

-- Using syn.crypt.custom
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

-- Using syn.protect_gui and getsynasset
writefile("dog.png", game:HttpGet("https://i.imgur.com/aVEAmYC.png"))
local ScreenGui = Instance.new("ScreenGui")
syn.protect_gui(ScreenGui)
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "protected_dog"
local ImageLabel = Instance.new("ImageLabel",ScreenGui)
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel.Size = UDim2.new(0, 250, 0, 250)
ImageLabel.Image = getsynasset("dog.png")

print(game:FindFirstChild("protected_dog",true)) -- should print false
```  
  
**Supported Functions**  
```
syn.cache_replace
syn.cache_invalidate
syn.set_thread_identity
syn.write_clipboard
syn.queue_on_teleport
syn.protect_gui
syn.unprotect_gui
syn.is_beta
syn.request
syn.crypt.encrypt
syn.crypt.decrypt
syn.crypt.base64.encode
syn.crypt.base64.decode
syn.crypt.hash
syn.crypt.derive
syn.crypt.random
syn.crypt.custom.encrypt
syn.crypt.custom.decrypt
syn.crypt.custom.hash
syn.websocket.connect
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

# prison life  
work in progress  
  
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
