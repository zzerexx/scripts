# Config Manager Documentation
*Last Updated March 11, 2022*  
# Table of Contents  
- [Loading Config Manager](#loading-config-manager)
- [Initialize](#init)
- [Load Config](#load)
- [Save Config](#save)
- [Get Configs](#get)
- [Set Default Config](#set-default)
- [Delete Config](#delete)
- [Valid Config](#valid)

## Loading Config Manager  
```lua
local cfg = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/ConfigManager.lua"))()
```  
  
## Additional Notes  
After loading a config, the data can be accessed via the `Data` table.  
You can also access a date that specifies when the config was created.
```lua
local Settings = {bruh = true}
cfg.Load("MyConfig", function(data)
    Settings = data.Data -- the actual data that you save is kept in the Data table.
    print(data.Saved) -- you can get the date the config was created with this
end)
```

---

## Init  
```js
<table> cfg.Init(<string> Config, <table> Default, <function?> Callback)
```
Initializes Config Manager. This must be called before using Config Manager.  
Loads and returns the default config.  
If a `Callback` is specified, it calls the function with the default config as a parameter.  
  
### Example  
```lua
-- Two methods to load the default config
local MySettings = {bruh = true, ok = "hey"}
local Default = cfg.Init("my script hub or whatever", MySettings).Data -- 1: storing it in a variable

cfg.Init("my script hub or whatever", MySettings, function(data) -- 2: using a function
    MySettings = data.Data
    ConfigLoaded() -- using functions allow for a more extensive use such as calling a function after retrieving a config
end)
```

---

## Load  
```js
<table> cfg.Load(<string> Config, <function?> Callback)
```
Loads and returns the specified Config.  
If a `Callback` is specified, it calls that function with the specified `Config` as a parameter.  
  
### Example  
```lua
-- Two methods to retrieve a config
local Config = cfg.Load("MyConfig").Data -- 1: storing it in a variable

cfg.Load("MyConfig", function(data) -- 2: using a function
    Config = data.Data
    ConfigLoaded() -- using functions allow for a more extensive use such as calling a function after retrieving a config
end)
```

---

## Save  
```js
<void> cfg.Save(<string> Config, <table> Data)
```
Creates a new config with `Data`.  
  
### Example  
```lua
local MySettings = {bruh = true, ok = "hey"}
function CreateNewConfig(Name)
    cfg.Save(Name, MySettings)
end
CreateNewConfig("wowow")
```

---

## Get  
```js
<table> cfg.Get(<void>)
```
Returns an array of all of your configs.  
  
### Example  
```lua
function GetConfigs()
    return cfg.Get()
end
table.foreach(GetConfigs(), print) -- prints all your configs
```

---

## Set Default  
```js
<void> cfg.SetDefault(<string> Config)
```
Sets the specified `Config` to the default config.  
  
### Example  
```lua
cfg.SetDefault("MyOtherConfig")
```

---

## Delete  
```js
<void> cfg.Delete(<string> Config)
```
Deletes the specified `Config`.  
  
### Example  
```lua
cfg.Delete("MyUselessConfig")
```

---

## Valid  
```js
<bool> cfg.Valid(<string> Config)
```
Returns true if the specified `Config` exists.  
Note that all other functions automatically check if a config exists beforehand.  
  
### Example  
```lua
function LoadConfig(Name)
    if cfg.Valid(Name) then
        return cfg.Load(Name) -- this already checks if it exists, but whatever thats how u use it
    end
end
LoadConfig("MyConfig")
```
