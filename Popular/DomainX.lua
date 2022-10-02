local FolderDir = "DomainX"
local VersionDir = FolderDir.."/Version.txt"
local SourceDir = FolderDir.."/Source.lua"
	
if not isfolder(FolderDir) then
	makefolder(FolderDir)
end

local Version = game:HttpGet("https://raw.githubusercontent.com/shlexware/domainx/main/latest")

if not isfile(VersionDir) then
	writefile(VersionDir, Version)
end

if isfile(SourceDir) and readfile(VersionDir) == Version then
	loadstring(readfile(SourceDir, "DomainX"))()
else
	local Source = game:HttpGet("https://raw.githubusercontent.com/shlexware/domainx/main/source")
	writefile(SourceDir, Source)
	writefile(VersionDir, Version)
	loadstring(Source, "DomainX")()
end
