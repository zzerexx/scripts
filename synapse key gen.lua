local keys = {}
for _ = 1,1000 do
	table.insert(keys,game:GetService("HttpService"):GenerateGUID(false):lower())
end
setclipboard(table.concat(keys,"\n"))
print("generated 1000 synapse keys")
