setreadonly(Color3,false)
function Color3.fromValue(c)
    return Color3.fromRGB(c.R,c.G,c.B)
end
function Color3.toValue(c)
    return {R = math.floor(c.R * 255),G = math.floor(c.G * 255),B = math.floor(c.B * 255)}
end
function Color3.toRGB(c)
    return math.floor(c.R * 255), math.floor(c.G * 255), math.floor(c.B * 255)
end
getgenv().COLOR3LOADED = true

--[[
    Value Tables
    {
        R = 255,
        G = 0,
        B = 0
    }
    This table is equivalent to Color3.fromRGB(255,0,0)
    With value tables, you can encode color values in JSON format.

    Color3.fromValue(Value Table)
    Converts a Value Table to Color3.fromRGB

    Color3.toValue(Color3.fromRGB)
    Converts a Color3.fromRGB value to a Value Table

    Color3.toRGB(Color3.new)
    Converts a Color3.new value to a Color3.fromRGB value
]]
