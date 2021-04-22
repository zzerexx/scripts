-- Custom Crosshair by zzerexx#3970
if typeof(Drawing.new) ~= "function" then
    local hint = Instance.new("Hint",game.CoreGui)
    hint.Text = "Your exploit does not have a Drawing Library"
    wait(5)
    hint:Destroy()
    return
end
local camera = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ss = getgenv().CrosshairSettings
local middle = Vector2.new(camera.ViewportSize.X/2,camera.ViewportSize.Y/2)

if typeof(getgenv().crosshairobj) == "table" then
    for i,v in pairs(getgenv().crosshairobj) do
        if typeof(v) == "table" then
            v:Remove()
        end
    end
end
if typeof(getgenv().rs) == "RBXScriptConnection" then
    getgenv().rs:Disconnect()
end

local line1 = Drawing.new("Line") -- Top Line
local line2 = Drawing.new("Line") -- Right Line 
local line3 = Drawing.new("Line") -- Bottom Line 
local line4 = Drawing.new("Line") -- Left Line
local dot = Drawing.new("Square")
getgenv().crosshairobj = {line1 = line1,line2 = line2,line3 = line3,line4 = line4,dot = dot}
line1.Visible = true
line2.Visible = true
line3.Visible = true
line4.Visible = true
dot.Thickness = 1
dot.Visible = true
dot.Filled = true
if not ss.Dot then
    dot.Visible = false
end

getgenv().rs = RunService.RenderStepped:Connect(function()
    ss = getgenv().CrosshairSettings
    if ss.HideMouseIcon then
        UIS.MouseIconEnabled = false
    else
        UIS.MouseIconEnabled = true
    end
    if ss.FollowCursor then
        middle = UIS:GetMouseLocation()
    else
        middle = Vector2.new(camera.ViewportSize.X/2,camera.ViewportSize.Y/2)
    end
    line1.Transparency = ss.Opacity
    line2.Transparency = ss.Opacity
    line3.Transparency = ss.Opacity
    line4.Transparency = ss.Opacity
    line1.Thickness = ss.Thickness
    line2.Thickness = ss.Thickness
    line3.Thickness = ss.Thickness
    line4.Thickness = ss.Thickness
    line1.Color = ss.Color
    line2.Color = ss.Color
    line3.Color = ss.Color
    line4.Color = ss.Color
    dot.Transparency = ss.Opacity
    dot.Color = ss.Color
    if ss.Dot then
        dot.Visible = true
        dot.Transparency = ss.Opacity
        dot.Color = ss.Color
    else
        dot.Visible = false
    end
    
    line1.From = Vector2.new(middle.X,middle.Y-ss.Offset)
    line2.From = Vector2.new(middle.X+ss.Offset,middle.Y)
    line3.From = Vector2.new(middle.X,middle.Y+ss.Offset)
    line4.From = Vector2.new(middle.X-ss.Offset,middle.Y)
    line1.To = Vector2.new(middle.X,middle.Y-ss.Offset-ss.Length)
    line2.To = Vector2.new(middle.X+ss.Offset+ss.Length,middle.Y)
    line3.To = Vector2.new(middle.X,middle.Y+ss.Offset+ss.Length)
    line4.To = Vector2.new(middle.X-ss.Offset-ss.Length,middle.Y)
    if ss.Dot then
        dot.Size = Vector2.new(ss.Thickness,ss.Thickness)
        dot.Position = Vector2.new(middle.X-(ss.Thickness/2),middle.Y-(ss.Thickness/2))
    end
end)
