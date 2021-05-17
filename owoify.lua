local message = ""
message = message:gsub("r","w")
message = message:gsub("l","w")
message = message:gsub("R","W")
message = message:gsub("L","W")
setclipboard(message)
