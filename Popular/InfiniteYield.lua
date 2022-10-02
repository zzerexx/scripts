local FolderDir = "InfiniteYield"
local VersionDir = FolderDir.."/Version.txt"
local SourceDir = FolderDir.."/Source.lua"
	
if not isfolder(FolderDir) then
	makefolder(FolderDir)
end

local Version = game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/version")
Version = Version:sub(Version:find("'(.+)'") + 1, 16)

if not isfile(VersionDir) then
	writefile(VersionDir, Version)
end

if isfile(SourceDir) and readfile(VersionDir) == Version then
	loadstring(readfile(SourceDir, "IY"))()
else
	local Source = game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
	writefile(SourceDir, Source)
	writefile(VersionDir, Version)
	loadstring(Source, "IY")()
end
