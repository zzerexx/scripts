# Scripts  
my cool scripts  
  
# Custom Crosshair  
Updated June 4, 2021  
v1.2.1  
Create your own custom crosshair using the Drawing Library  
executing multiple times will not cause fps drops  
```
Script: https://pastebin.com/raw/eGiC2jPg
``` 
  
# Murder Mystery 2 Utilities  
Updated April 10, 2021  
v1.0.3  
Check the settings for features  
```
Script: https://pastebin.com/raw/FwYmgtCX
```  
   
# Universal Esp  
Updated June 13, 2021  
v1.2.0  
- Box Esp  
- Tracers  
- Name Esp (with Distance and Health and Display Name)  
  
```
Script: https://pastebin.com/raw/5zw0rLH9
```  
## Update v1.2.0  
Optimized! Only 1 RunService loop is used instead of multiple  
You can now execute multiple times without frame drops!  
New Setting: ToggleKey | Press this key to toggle esp visibility.  
  
# Universal Esp with UI  
Updated June 13, 2021  
universal esp but with a ui  
ui lib made by twink marie  
```
Script: loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEspUI.lua"))()
```  
  
# Aimblox Silent Aim  
Updated May 26, 2021  
v1.0.0  
basic silent aim  

# Custom Output  
Updated June 9, 2021  
v1.1.0  
basically just the developer console since the roblox one is broken lol  
works the same as the developer console  
F9 to toggle  

# Synapse to Script-Ware  
Updated June 9, 2021  
Allows you to use Synapse exclusive functions with Script-Ware v2  
  
**Loader**  
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/SynapseToScriptWare.lua", true))()
```  
  
**Example**    
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/SynapseToScriptWare.lua", true))()

-- Using syn.crypt.custom
-- Synapse's custom encrypt is slightly different than Script-Ware's (check the docs here: https://x.synapse.to/docs/reference/crypt_lib.html#custom)
local enc = syn.crypt.custom.encrypt(
	"aes-gcm", -- Cipher
	"hi gamers!", -- Data
	"$nLliCMdi7gcynsFCK9u0aVNdtkNIiZG", -- Key
	"Agd13KuKIL2$") -- Nonce

print(enc) -- iQg5LoK5GmWmkO7HtuHH4Q==

local dec = syn.crypt.custom.decrypt(
	"aes-gcm", -- Cipher
	enc, -- Data
	"$nLliCMdi7gcynsFCK9u0aVNdtkNIiZG", -- Key
	"Agd13KuKIL2$" -- Nonce
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

syn_websocket_connect
syn_websocket_send
syn_websocket_close
syn_io_read
syn_io_write
syn_io_append
syn_io_makefolder
syn_io_listdir
syn_io_isfile
syn_io_isfolder
syn_io_delfile
syn_io_delfolder
syn_mouse1click
syn_mouse1press
syn_mouse1release
syn_mouse2click
syn_mouse2press
syn_mouse2release
syn_mousescroll
syn_mousemoverel
syn_mousemoveabs
syn_keypress
syn_keyrelease
syn_crypt_encrypt
syn_crypt_decrypt
syn_crypt_b64_encode
syn_crypt_b64_decode
syn_crypt_random
syn_crypt_hash
syn_crypt_derive
syn_getgenv
syn_getrenv
syn_getsenv
syn_getmenv
syn_getreg
syn_getgc
syn_getinstances
getsynasset
syn_context_set
syn_context_get
syn_setfflag
syn_dumpstring
syn_islclosure
syn_checkcaller
syn_clipboard_set
syn_newcclosure
syn_decompile
syn_getloadedmodules
syn_getcallingscript
syn_isactive
is_synapse_function
iswindowactive
gethiddenprop
gethiddenprops
sethiddenprop
getlocals
get_calling_script
getpcdprop
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
