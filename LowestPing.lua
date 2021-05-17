local PlaceId = 286090429
local lowestplayercount = 14

local http = game:GetService("HttpService")
local cursor = ""
local server
local lowestping = math.huge

function getservers(a)
    local api = http:JSONDecode(game:HttpGet(a))
    for i,v in pairs(api.data) do
        if v.ping < lowestping and v.playing >= lowestplayercount then
            server = v
        end
    end
    if tostring(api.nextPageCursor) ~= "nil" then
        getservers("https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..api.nextPageCursor)
    else
        print("Successfully searched all servers.")
        print("Best Server: "..server.id)
        print("Players: "..server.playing)
        print("Ping: "..server.ping)
        print("Fps: "..server.fps)
        wait(2)
        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceId,server.id)
    end
end
getservers("https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100")
