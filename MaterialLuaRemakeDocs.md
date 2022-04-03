# Material Lua Remake  
A UI library inspired by [Material Lua](https://github.com/Kinlei/MaterialLua).  
This library has pretty much the exact same usage as Material Lua, but with a different look and a bit more utilities to work with.  

*Last Updated: April 2, 2022*  

# This ui library is not completely finished yet, however it is usable.  

---

# Table of Contents  
- [Loader](#loader)
- [Replacer](#replacer)
- [Material.Load](#materialload)
  - [UI.new](#uinew)
  - [UI.Banner](#uibanner)
  - [UI.Notify (INCOMPLETE)](#uinotify)
  - [UI.Toggle](#uitoggle)
  - [UI.OpenPage](#uiopenpage)
- [Page Elements](#page-elements)
  - [Page.Button](#pagebutton)
  - [Page.Toggle](#pagetoggle)
  - [Page.Dropdown](#pagedropdown)
  - [Page.TextBox / TextField](#pagetextbox)
  - [Page.Label](#pagelabel)
  - [Page.Slider](#pageslider)
  - [Page.Color Picker](#pagecolorpicker)
  - [Page.Keybind](#pagekeybind)
  - [Page.Chip Set / Data Table](#pagechipset)
  - [Page.Table](#pagetable)

## Loader  
```lua
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/MaterialLuaRemake.lua"))()
```
You can replace the Material Lua loadstring with this loadstring to use Remake without making **ANY** changes!

---

## Replacer  
```lua
local old;old = hookfunction(game.HttpGet, function(self, url)
    if url == "https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua" then
        return old(self, "https://raw.githubusercontent.com/zzerexx/scripts/main/MaterialLuaRemake.lua")
    end
    return old(self, url)
end)
```
If you would like to use Remake instead of Material Lua on your favorite scripts, then execute this before your script!  

---

## Material.Load  
```js
<UI> Material.Load(<table> Options)
```
Creates a new `UI` with `Options`.  
Note: Remake does not support Themes or ColorOverrides yet.

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
|SubTitle|String|nil|The sub title shown next to/below the title|
|Icon|String, Number|nil|The icon shown on the left of the title.<br />This will only be visible while ShowInNavigator is enabled<br />Recommended Image Size: 40x40|
|ShowInNavigator|Boolean|false|If enabled, the title, subtitle, and icon will be visible in the navigator|
|Style|Number|1|The UI style|
|SizeX|Number|400|The width of the UI|
|SizeY|Number|505|The height of the UI|
|NavigatorSize|Number|200|The size of the Navigator|

### UI Styles  
|Style|Description|
|:----|:----------|
|1|The UI will display Tabs for each page|
|2|The UI will display Tabs for each page which have a lighter gray color|
|3|A 'Menu' button will be visible in the topbar on the left-hand side.<br />Clicking this will toggle the 'Navigator' which shows a vertical list of all pages.<br />This style can be used to show small Icons beside every button.|
|4|The 'Navigator' will always be visible and will be attached to the left side of the UI contents.<br />The 'Navigator' cannot be toggle-able with this style.<br />Note that this will increase the size of the UI on the X axis based on the size of the 'Navigator'.|

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

## UI.Notify  
### Notifications have not been finished and will not work when attempted to use.  
```js
<void> UI.Notify(<table> Options)
<void> UI.Notify(<string> Text)
```
Creates a new `Notification` with `Options`.  
If you provide a string instead of a table, it will use that as the text.

### Example  
```lua
UI.Notify({
    Title = "Alert",
    Text = "An error occurred!",
    Duration = 3
})
```

### Options  
|Name|Type|Default|Description|
|:---|:---|:------|:----------|
|Title|String|Material Lua Remake|The Notification's title|
|Text|String|Notification|The text shown in the Notification|
|Duration|Number|3|How long the Notification will be displayed|
|Callback|Function|nil|The Notification's callback<br />This is called when clicking one<br />of the buttons on the Notification|
|Options|Table|{"OK"}|The buttons on the Notification|

---

## UI.Toggle  
```js
<void> UI.Toggle(<bool?> Visible)
```
Toggles UI visibility. If no argument is provided, it will set it to the opposite as the current visibility.  

### Example  
```lua
local keybind = Enum.KeyCode.RightShift
game:GetService("UserInputService").InputBegan:Connect(function(i, gp)
    if not gp and i.KeyCode == keybind then
        UI.Toggle()
    end
end)
```

---

## UI.OpenPage  
```js
<void> UI.OpenPage(<string> Page)
```
Opens the specified Page.  

### Example  
```lua
UI.OpenPage("Page 1")
```

---

# Page Elements  

## Page.Button  
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
  
### Methods  
|Method|Description|
|:-----|:----------|
|void SetText(string Text)|Sets the Button's text|
|string GetText()|Returns the Button's text|
|number GetId()|Returns the Button's Id|
|void Destroy()|Destroys the Button|

---

## Page.Toggle  
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
  
### Methods  
|Method|Description|
|:-----|:----------|
|void SetText(string Text)|Sets the Toggle's text|
|string GetText()|Returns the Toggle's text|
|number GetId()|Returns the Toggle's Id|
|void SetState(bool State)|Sets the Toggle's state|
|bool GetState()|Returns the Toggle's state|
|void Destroy()|Destroys the Toggle|

---

## Page.Dropdown  
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
  
### Methods  
|Method|Description|
|:-----|:----------|
|void SetText(string Text)|Sets the Dropdown's text|
|string GetText()|Returns the Dropdown's text|
|number GetId()|Returns the Dropdown's Id|
|void SetOptions(table Options)|Sets the Dropdown's options|
|table GetOptions()|Returns the Dropdown's options|
|void Destroy()|Destroys the Dropdown|

---

## Page.TextBox  
```js
<TextBox> Page.TextBox(<table> Options)
```
Creates a new `TextBox` with `Options`.  
Aliases: `Page.TextField`  

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
|Text|String|Text Box|The text shown on the Text Box|
|Callback|Function|nil|The Text Box's callback|
|Type|String|Default|The Text Box's type.|
|ClearOnFocus|Boolean|false|Determines if the Text Box clears on focus|

### Text Box Types
|Types|Description|
|:----|:----------|
|Default|The Text Box's contents will be visible|
|Password|The Text Box's contents will be hidden|

### Methods  
|Method|Description|
|:-----|:----------|
|void SetText(string Text)|Sets the Text Box's text|
|string GetText()|Returns the Text Box's text|
|number GetId()|Returns the Text Box's Id|
|void Destroy()|Destroys the Text Box|

---

## Page.Label  
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
  
### Methods  
|Method|Description|
|:-----|:----------|
|void SetText(string Text)|Sets the Label's text|
|string GetText()|Returns the Label's text|
|number GetId()|Returns the Label's Id|
|void Destroy()|Destroys the Label|

---

## Page.Slider  
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
  
### Methods  
|Method|Description|
|:-----|:----------|
|void SetText(string Text)|Sets the Slider's text|
|string GetText()|Returns the Slider's text|
|number GetId()|Returns the Slider's Id|
|void SetMin(number Min)|Sets the Slider's minimum value|
|void SetMax(number Max)|Sets the Slider's maximum value|
|number GetMin()|Returns the Slider's minimum value|
|number GetMax()|Returns the Slider's maximum value|
|void Destroy()|Destroys the Slider|

---

## Page.ColorPicker  
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
  
### Methods  
|Method|Description|
|:-----|:----------|
|void SetText(string Text)|Sets the Color Picker's text|
|string GetText()|Returns the Color Picker's text|
|number GetId()|Returns the Color Picker's Id|
|void SetColor(Color3 Color)|Sets the Color Picker's color|
|Color3 GetColor()|Returns the Color Picker's color|
|void Destroy()|Destroys the Color Picker|

---

## Page.Keybind  
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
    Def = Enum.KeyCode.RightShift,
    AllowKeyboard = true,
    AllowMouse = true
})
```

### Options  
|Name|Type|Default|Description|
|:---|:---|:------|:----------|
|Text|String|Keybind|The text shown on the Keybind|
|Callback|Function|nil|The Keybind's callback|
|Def|EnumItem|Unknown|The Keybind's default value|
|AllowKeyboard|Boolean|true|Determines if Keyboard inputs can be used|
|AllowMouse|Boolean|false|Determines if Mouse inputs can be used|

### Methods  
|Method|Description|
|:-----|:----------|
|void SetText(string Text)|Sets the Keybind's text|
|string GetText()|Returns the Keybind's text|
|number GetId()|Returns the Keybind's Id|
|void SetBind(EnumItem Bind)|Sets the Keybind's bind|
|EnumItem GetBind()|Returns the Keybind's bind|
|void Destroy()|Destroys the Keybind|

---

## Page.ChipSet  
```js
<ChipSet> Page.ChipSet(<table> Options)
```
Creates a new `ChipSet` with `Options`.  
Aliases: `Page.DataTable`  

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

### Methods  
|Method|Description|
|:-----|:----------|
|void SetText(string Text)|Sets the Chip Set's text|
|string GetText()|Returns the Chip Set's text|
|number GetId()|Returns the Chip Set's Id|
|void SetOptions(table Options)|Sets the Chip Set's options|
|table GetOptions()|Returns the Chip Set's options|
|void Destroy()|Destroys the Chip Set|

---

## Page.Table  
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

### Methods  
|Method|Description|
|:-----|:----------|
|void SetText(string Text)|Sets the Table's text|
|string GetText()|Returns the Table's text|
|number GetId()|Returns the Table's Id|
|void SetData(table Bind)|Sets the Table's data|
|table GetData()|Returns the Table's data|
|void Destroy()|Destroys the Table|
