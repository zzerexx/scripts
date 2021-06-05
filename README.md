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
Updated June 5, 2021  
Allows you to use Synapse exclusive functions with Script-Ware v2  
This does not work with obfuscated scripts.  
  
**Loader**  
```lua
getgenv().syn = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/SynapseToScriptWare.lua", true))()
getgenv().getsynasset = function(path)
	return getcustomasset(path)
end
```  
  
**Example**    
```lua
getgenv().syn = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/SynapseToScriptWare.lua", true))()
getgenv().getsynasset = function(path)
	return getcustomasset(path)
end

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
```  
  
**Loadstrings**  
Normally, you would just put the Synapse to Script-Ware loadstring at the top, and it would work.  
However, if the script you are trying to use is a loadstring, then it will not work.  
You must use this before your loadstring.  
```lua
local syn = 'getgenv().protected={}local a=getrawmetatable(game)local b=a.__namecall;setreadonly(a,false)a.__namecall=newcclosure(function(self,...)local c={...}if self==game and getnamecallmethod()=="FindFirstChild"and c[2]~=nil and c[2]==true then for d,e in next,getgenv().protected do if c[1]==e.Name then return false end end end;return b(self,...)end)setreadonly(a,true)local syn={cache_replace=cache.replace,cache_invalidate=cache.invalidate,is_cached=cache.iscached,set_thread_identity=setthreadidentity,write_clipboard=setclipboard,queue_on_teleport=queue_on_teleport,protect_gui=function(f)if typeof(f)~="Instance"then error("Attempted to protect a "..typeof(f))end;table.insert(getgenv().protected,#getgenv().protected+1,f)for d,e in next,f:GetDescendants()do table.insert(getgenv().protected,#getgenv().protected+1,e)end end,unprotect_gui=function(f)if typeof(f)~="Instance"then error("Attempted to unprotect a "..typeof(f))end;table.remove(getgenv().protected,table.find(getgenv().protected,f))for d,e in next,f:GetDescendants()do if table.find(getgenv().protected,e)then table.remove(getgenv().protected,table.find(getgenv().protected,e))end end end,is_beta=function()return false end,request=request,crypt={encrypt=crypt.encrypt,decrypt=crypt.decrypt,base64={encode=crypt.base64encode,decode=crypt.base64decode},hash=crypt.hash,derive=function(g,h)return crypt.generatebytes(h)end,random=crypt.generatekey,custom={encrypt=function(i,j,k,l)return crypt.custom_encrypt(j,k,l,i)end,decrypt=function(i,j,k,l)return crypt.custom_decrypt(j,k,l,i)end,hash=function(m,j)return crypt.hash(j,m)end}},websocket={connect=WebSocket.connect}}'
```  
I know its long, but I cannot find another way to do this. (it wouldnt work with game:HttpGet)  
Now, you need to modify your loadstring.  
Lets use this as an example  
```lua
loadstring(game:HttpGet("https://pastebin.com/raw/nZDUf0Cm"))()
```  
Change it to this  
```lua
local syn = 'getgenv().protected={}local a=getrawmetatable(game)local b=a.__namecall;setreadonly(a,false)a.__namecall=newcclosure(function(self,...)local c={...}if self==game and getnamecallmethod()=="FindFirstChild"and c[2]~=nil and c[2]==true then for d,e in next,getgenv().protected do if c[1]==e.Name then return false end end end;return b(self,...)end)setreadonly(a,true)local syn={cache_replace=cache.replace,cache_invalidate=cache.invalidate,is_cached=cache.iscached,set_thread_identity=setthreadidentity,write_clipboard=setclipboard,queue_on_teleport=queue_on_teleport,protect_gui=function(f)if typeof(f)~="Instance"then error("Attempted to protect a "..typeof(f))end;table.insert(getgenv().protected,#getgenv().protected+1,f)for d,e in next,f:GetDescendants()do table.insert(getgenv().protected,#getgenv().protected+1,e)end end,unprotect_gui=function(f)if typeof(f)~="Instance"then error("Attempted to unprotect a "..typeof(f))end;table.remove(getgenv().protected,table.find(getgenv().protected,f))for d,e in next,f:GetDescendants()do if table.find(getgenv().protected,e)then table.remove(getgenv().protected,table.find(getgenv().protected,e))end end end,is_beta=function()return false end,request=request,crypt={encrypt=crypt.encrypt,decrypt=crypt.decrypt,base64={encode=crypt.base64encode,decode=crypt.base64decode},hash=crypt.hash,derive=function(g,h)return crypt.generatebytes(h)end,random=crypt.generatekey,custom={encrypt=function(i,j,k,l)return crypt.custom_encrypt(j,k,l,i)end,decrypt=function(i,j,k,l)return crypt.custom_decrypt(j,k,l,i)end,hash=function(m,j)return crypt.hash(j,m)end}},websocket={connect=WebSocket.connect}}'
loadstring(syn..game:HttpGet("https://pastebin.com/raw/nZDUf0Cm"))() -- It should copy "Hello" to your clipboard using syn.write_clipboard
```  
Now it should work!  
  
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
