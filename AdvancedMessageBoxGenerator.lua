local ss = {
    Title = "",
    Text = "",
    Icon = 0,
    Button = 0,
    Default = 0,
    Help = false
}

local icons = {
    None = 0,
    Error = 1,
    Question = 2,
    Exclamation = 3,
    Information = 4
}
local urls = {
    Error = "https://i.imgur.com/0jSSbiY.png",
    Question = "https://i.imgur.com/xznrc9u.png",
    Exclamation = "https://i.imgur.com/ugi5STA.png",
    Information = "https://i.imgur.com/zpYfn3P.png"
}
local buttons = {
    ['Ok'] = 0,
    ['Ok, Cancel'] = 1,
    ['Abort, Retry, Ignore'] = 2,
    ['Yes, No, Cancel'] = 3,
    ['Yes, No'] = 4,
    ['Retry, Cancel'] = 5,
    ['Cancel, Try Again, Continue'] = 6
}
local camera = workspace.CurrentCamera
function preview(name)
    local img = Drawing.new("Image")
    img.Visible = true
    img.Transparency = 1
    img.Data = game:HttpGet(urls[name])
    img.Size = Vector2.new(50,50)
    img.Position = Vector2.new(camera.ViewportSize.X / 2,250)
    img.Rounding = 0

    task.wait(5)

    img:Remove()
end
function generate()
    local args = {'"'..ss.Text..'"', '"'..ss.Title..'"', "0x"..(ss.Help and 4 or "")..ss.Default..ss.Icon..ss.Button}
    return "messagebox("..table.concat(args,", ")..")"
end

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local UI = Material.Load({
	Title = "Advanced Message Box Generator",
	Style = 2,
	SizeX = 300,
	SizeY = 395,
	Theme = "Dark"
})

local gen = UI.New({Title = "Generator"})

gen.TextField({
    Text = "Title",
    Type = "Default",
    Callback = function(value)
        ss.Title = value
    end
})
gen.TextField({
    Text = "Text",
    Type = "Default",
    Callback = function(value)
        ss.Text = value
    end
})
gen.Dropdown({
    Text = "Icon",
    Callback = function(value)
        ss.Icon = icons[value]
    end,
    Options = {"None","Exclamation","Information","Question","Error"},
    Menu = {
        Exclamation = function()
            preview("Exclamation")
        end,
        Information = function()
            preview("Information")
        end,
        Question = function()
            preview("Question")
        end,
        Error = function()
            preview("Error")
        end
    }
})
gen.Dropdown({
    Text = "Button",
    Callback = function(value)
        ss.Button = buttons[value]
    end,
    Options = {"Ok","Ok, Cancel","Abort, Retry, Ignore","Yes, No, Cancel","Yes, No","Retry, Cancel","Cancel, Try Again, Continue"}
})
gen.Dropdown({
    Text = "Default Button",
    Callback = function(value)
        ss.Default = tonumber(value) - 1
    end,
    Options = {"1","2","3","4"}
})
gen.Toggle({
    Text = "Help Button",
    Callback = function(value)
        ss.Help = value
    end,
    Enabled = false,
    Menu = {
        Info = function()
            UI.Banner({Text = "The 'Help' button does literally nothing, but it's still pretty cool."})
        end
    }
})
gen.Button({
    Text = "Generate",
    Callback = function()
        setclipboard(generate())
        UI.Banner({Text = "Copied to clipboard!"})
    end
})
gen.Button({
    Text = "Preview",
    Callback = function()
        loadstring(generate())()
    end
})
gen.Button({
    Text = "About Advanced Message Boxes",
    Callback = function()
        setclipboard([[- How advanced message boxes work 
The messagebox function on most exploits has a 'flag' argument (the 3rd arg)
Usually, its just '0x' and then a 1-digit number.
But, you can actually add extra numbers to this argument for more features.

----------------
- Adding an icon
Icon Values:
    None: 0
    Error = 1 
    Question = 2 
    Exclamation = 3 
    Information = 4 

To add an icon, simply put this value infront of the 'button' value.
For example, if you want a message box with the 'Information' icon and the 'Ok' button,
you would put 0x 4 0 (no spaces)
                 ^ ^ 'Ok' value 
                 ^ 'Information' value

----------------------------
- Setting a 'Default' button
Default values:
    1st button: 0 
    2nd button: 1 
    3rd button: 2 
    4th button: 3

The default button will have an outline around it.
A default button looks like this (https://i.imgur.com/9KGK83P.png)
In this image, 'Yes' is the default.
To set a default button, simply add a value before the Icon and Button value.
For example, if you want a message box with the 'Information' and the 'Ok' button, but also want to highlight the 2nd button,
you would put 0x 1 4 0 (no spaces)
                 ^ ^ ^ 'Ok' value
                 ^ ^ 'Information' value
                 ^ 'Default' value

------------------------
- Adding the Help button 
Button Values:
    Ok = 0 
    Ok, Cancel = 1 
    Abort, Retry, Ignore = 2 
    Yes, No, Cancel = 3 
    Yes, No = 4 
    Retry, Cancel = 5 
    Cancel, Try Again, Continue = 6 
    Help = 4 (read below if this is confusing)

It's really simple to add a help button.
All you do is add 40 to the value.
For example, if you want a message box with the 'Information' icon and the 'Ok' button AND the 'Help' button,
you would put 0x 4 0 4 0 (no spaces)
                 ^ ^ ^ ^ 'Ok' value
                 ^ ^ ^ 'Information' value
                 ^ ^ 'Default' value (set this to 0 if it doesnt matter)
                 ^ 'Help' value 
The 'Help' value always comes before the Icon and Button value.
Note that this button does nothing.

---------
- Example 
This script will have the following:
    Error Icon 
    Ok Button 
    Help Button 
    1st button as default

local text = "Synapse X is not currently updated. Please wait for an update to release."
local title = "Synapse X"
local icon = 1 -- error icon value 
local button = 0 -- ok button value

local script = 'messagebox(text, title, 0x40'..icon..button..')'
loadstring(script)() -- need to loadstring in this example cuz cant concatenate numbers with 0x

-- messagebox("Synapse X is not currently updated. Please wait for an update to release.", "Synapse X", 0x4010)]])
        UI.Banner({Text = "Copied to clipboard!"})
    end
})
