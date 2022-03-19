# Material Lua Remake  
A UI library inspired by [Material Lua](https://github.com/Kinlei/MaterialLua).  
This library has pretty much the exact same usage as Material Lua, but with a bit more utilities to work with.  

# This ui library is not completely finished yet, however it is usable.  
### the documentation is also not finished clearly  

---

# Table of Contents  
- [Loader](#loader)
- [Material.Load](#materialload)
- [UI.new](#uinew)
- [UI.Banner](#uibanner)
- Page Elements
  - Button
  - Toggle
  - Dropdown
  - TextBox/TextField
  - Label
  - Slider
  - ColorPicker
  - Keybind
  - ChipSet/DataTable
  - Table

## Loader  
```lua
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/MaterialLuaRemake.lua"))()
```
You can replace the Material Lua loadstring with this loadstring to use Remake without making **ANY** changes!

---

## Material.Load  
```js
<table> Material.Load(<table> Options)
```
Creates a new `UI` with `Options`.  

### Example  
```lua
local UI = Material.Load({
    Title = "cool script",
    Style = 3,
    SizeX = 400,
    SizeY = 490
})
```

### Options  
|Name|Type|Default|Description|
|:---|:---|:------|:----------|
|Title|String|Material Lua Remake|The title of the UI|
|Style|Number|1|The UI style|
|SizeX|Number|400|The width of the UI|
|SizeY|Number|490|The height of the UI|

---

## UI.new  
```js
<table> UI.new(<table> Options)
```
Creates a new `Page` with `Options`.  
Aliases: `UI.New`

### Example  
```lua
local Page = UI.New({
    Title = "cool script",
    ImageId = "Icons\\Image.png",
    ImageSize = Vector2.new(20, 20)
})

-- The ImageId can be the following:
-- rbxassetid://12345678 (a roblox image id)
-- 12345678 (a roblox image id without rbxassetid, this can be a string or number)
-- Icons\\Image.png (a file path, such as an image created with writefile)
```

### Options  
|Name|Type|Default|Description|
|:---|:---|:------|:----------|
|Title|String|Page|The title of the Page|
|ImageId|String, Number|nil|The image's id|
|ImageSize|Vector2|30, 30|The size of the image

---

## UI.Banner  
```js
<void> UI.Banner(<table> Options)
<void> UI.Banner(<string> Text)
```
Creates a new `Banner` with `Options`.  
If you provide a string instead of a table, it will use that as the text.

### Example  
```lua
local UI = UI.Banner({ -- You can use a table for more utility
    Text = "Would you like to copy this random text to your clipboard for no reason?",
    Callback = function(button)
        if button == "Yes" then
            setclipboard("yay!")
            UI.Banner("Success!") -- .. or use a string for quality of life
        elseif button == "No" then
            UI.Banner("unsuccessful :(")
        end
    end,
    Options = {"Yes", "No"}
})
```

### Options  
|Name|Type|Default|Description|
|:---|:---|:------|:----------|
|Text|String|nil|The text shown in the Banner|
|Callback|Function|nil|The Banner's callback<br />This is called when clicking one<br />of the buttons on the Banner|
|Options|Table|{"OK"}|The buttons on the Banner|

---

### incomplete
