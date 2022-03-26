# Material Lua Remake  
A UI library inspired by [Material Lua](https://github.com/Kinlei/MaterialLua).  
This library has pretty much the exact same usage as Material Lua, but with a bit more utilities to work with.  

# This ui library is not completely finished yet, however it is usable.  

---

# Table of Contents  
- [Loader](#loader)
- [Material.Load](#materialload)
- [UI.new](#uinew)
- [UI.Banner](#uibanner)
- [Page Elements](#page-elements)
  - [Button](#button)
  - [Toggle](#toggle)
  - [Dropdown](#dropdown)
  - [Text Box / Text Field](#text-box--text-field)
  - [Label](#label)
  - [Slider](#slider)
  - [Color Picker](#color-picker)
  - [Keybind](#keybind)
  - [Chip Set / Data Table](#chip-set--data-table)
  - [Table](#table)

## Loader  
```lua
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/MaterialLuaRemake.lua"))()
```
You can replace the Material Lua loadstring with this loadstring to use Remake without making **ANY** changes!

---

## Material.Load  
```js
<UI> Material.Load(<table> Options)
```
Creates a new `UI` with `Options`.  
Note: Remake does not support Themes or ThemeOverrides yet.

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
<Page> UI.new(<table> Options)
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

# Page Elements  

## Button  
```js
<Button> Page.Button(<table> Options)
```
Creates a new `Button` with `Options`.  

### Example  
```lua
local Button = Page.Button({
    Text = "Button",
    Callback = function()
        print("Button clicked")
    end
})
```

### Options  
|Name|Type|Default|Description|
|:---|:---|:------|:----------|
|Text|String|Button|The text shown on the Button|
|Callback|Function|nil|The Button's callback|

---

## Toggle  
```js
<Toggle> Page.Toggle(<table> Options)
```
Creates a new `Toggle` with `Options`.  

### Example  
```lua
local Toggle = Page.Toggle({
    Text = "Toggle",
    Callback = function(value)
        print("Enabled:", value)
    end,
    Enabled = true
})
```

### Options  
|Name|Type|Default|Description|
|:---|:---|:------|:----------|
|Text|String|Toggle|The text shown on the Toggle|
|Callback|Function|nil|The Toggle's callback|
|Enabled|Boolean|false|Determines if the Toggle is enabled by default or not|

---

## Dropdown  
```js
<Dropdown> Page.Dropdown(<table> Options)
```
Creates a new `Dropdown` with `Options`.  

### Example  
```lua
local Dropdown = Page.Dropdown({
    Text = "Dropdown",
    Callback = function(value)
        print("Selected:", value)
    end,
    Options = {"1", "2", "3"},
    Def = "2"
})
```

### Options  
|Name|Type|Default|Description|
|:---|:---|:------|:----------|
|Text|String|Dropdown|The text shown on the Dropdown|
|Callback|Function|nil|The Dropdown's callback|
|Options|Table|{"Option"}|The Dropdown's available options|
|Def|String|Option|The Dropdown's default option|

---

## Text Box / Text Field  
```js
<TextBox> Page.TextBox(<table> Options)
<TextBox> Page.TextField(<table> Options)
```
Creates a new `TextBox` with `Options`.  

### Example  
```lua
local TextBox = Page.TextBox({
    Text = "Text Box",
    Callback = function(value)
        print(value)
    end,
    Type = "Default",
    ClearOnFocus = false
})
```

### Options  
|Name|Type|Default|Description|
|:---|:---|:------|:----------|
|Text|String|Text Box|The text shown on the Toggle|
|Callback|Function|nil|The Text Box's callback|
|Type|String|Default|The Text Box's type.|
|ClearOnFocus|Boolean|false|Determines if the Text Box clears on focus|

### Text Box Types
|Types|Description|
|:----|:----------|
|Default|The Text Box's contents will be visible|
|Password|The Text Box's contents will be hidden|

---

## Label  
```js
<Label> Page.Label(<table> Options)
```
Creates a new `Label` with `Options`.  

### Example  
```lua
local Bind = Instance.new("BindableEvent")
local Label = Page.Label({
    Text = "Label",
    Event = Bind -- Use the INSTANCE, NOT the signal
})

workspace.Part:GetPropertyChangedSignal("Position"):Connect(function()
    Bind:Fire(workspace.Part.Position) -- Easily update the Label's text with a connection!
    -- You can also use multiple arguments instead of concatenating like 'print' (ex: Event:Fire("Current Position:", workspace.Part.Position) )
end)
```

### Options  
|Name|Type|Default|Description|
|:---|:---|:------|:----------|
|Text|String|Label|The text shown on the Label|
|Label|BindableEvent|nil|The Label's text can be updated by firing this BindableEvent|

---

## Slider  
```js
<Slider> Page.Slider(<table> Options)
```
Creates a new `Slider` with `Options`.  

### Example  
```lua
local Slider = Page.Slider({
    Text = "Slider",
    Callback = function(value)
        print("Enabled:", value)
    end,
    Min = 0,
    Max = 123789,
    Def = 0,
    ReturnAsPercent = true
})
```

### Options  
|Name|Type|Default|Description|
|:---|:---|:------|:----------|
|Text|String|Slider|The text shown on the Slider|
|Callback|Function|nil|The Slider's callback|
|Min|Number|0|The Slider's minimum value|
|Max|Number|10|The Slider's maximum value|
|Def|Number|5|The Slider's default value|
|Prefix|String|nil|Displayed at the front of the value (ex: $5)|
|Suffix|String|nil|Displayed at the end of the value (ex: 5$)|
|ReturnWithAffixes|Boolean|false|Determines if the return values include the prefixes/suffixes|
|ReturnAsPercent|Boolean|false|Determines if the return values are percentages<br />This will override ReturnWithAffixes.|
|Toggle|Boolean|false|If enabled, a Toggle will be shown on the Slider|
|Enabled|Boolean|false|Determines if the Toggle is enabled by default or not.<br />Toggle must be enabled for this to work|
|ToggleCallback|Function|nil|The Toggle's callback|

---

## Color Picker  
```js
<ColorPicker> Page.ColorPicker(<table> Options)
```
Creates a new `ColorPicker` with `Options`.  

### Example  
```lua
local ColorPicker = Page.ColorPicker({
    Text = "Color Picker",
    Callback = function(value)
        print(value)
    end,
    Def = Color3.fromRGB(0, 170, 255),
    Default = Color3.fromRGB(0, 170, 255), -- 'Default' is still available for compatibility.
    Rainbow = false,
})
```

### Options  
|Name|Type|Default|Description|
|:---|:---|:------|:----------|
|Text|String|Color Picker|The text shown on the Color Picker|
|Callback|Function|nil|The Color Picker's callback|
|Def|Color3|1, 1, 1|The Color Picker's default color|
|Default|Color3|1, 1, 1|Same as Def|
|Rainbow|Boolean|false|Determines if Rainbow mode is enabled by default or not|

---

## Keybind  
```js
<Toggle> Page.Keybind(<table> Options)
```
Creates a new `Keybind` with `Options`.  

### Example  
```lua
local Keybind = Page.Keybind({
    Text = "Keybind",
    Callback = function(value)
        print("Keybind:", value.Name)
    end,
    Def = Enum.KeyCode.RightShift
})
```

### Options  
|Name|Type|Default|Description|
|:---|:---|:------|:----------|
|Text|String|Keybind|The text shown on the Keybind|
|Callback|Function|nil|The Keybind's callback|
|Def|EnumItem|Unknown|The Keybind's default value|
|AllowMouse|Boolean|false|Determines if Mouse inputs can be used|

---

## Chip Set / Data Table  
```js
<ChipSet> Page.ChipSet(<table> Options)
<ChipSet> Page.DataTable(<table> Options)
```
Creates a new `ChipSet` with `Options`.  

### Example  
```lua
local ChipSet = Page.ChipSet({
    Text = "Chip Set",
    Callback = function(value)
        table.foreach(value, print)
    end,
    Options = {
        ['Option 1'] = true,
        ['Option 2'] = false
    }
})
```

### Options  
|Name|Type|Default|Description|
|:---|:---|:------|:----------|
|Text|String|Chip Set|The text shown on the Chip Set|
|Callback|Function|nil|The Chip Set's callback|
|Options|Table|Option 1 = true,<br />Option 2 = false|The Chip Set's available options|

---

## Table  
```js
<Table> Page.Table(<table> Options)
```
Creates a new `Table` with `Options`.  

### Example  
```lua
local Table = Page.Table({
    Text = "Table",
    Event = Bind,
    Key = "Name",
    Value = "Type",
    ShowInfo = true,
    Data = {
        Text = "String",
        Event = "BindableEvent",
        Key = "Key",
        Value = "Value",
        ShowInfo = "true",
        Data = "table of data"
    }
})
```

### Options  
|Name|Type|Default|Description|
|:---|:---|:------|:----------|
|Text|String|Table|The text shown on the Table|
|Event|BindableEvent|nil|The Table's contents can be updated by firing this BindableEvent|
|Key|String|Key|The Key name|
|Value|String|Value|The Value name|
|ShowInfo|Boolean|true|Determines if Key and Value are shown|
|Data|Table|{Key = "Value"}|The data shown in the Table|
