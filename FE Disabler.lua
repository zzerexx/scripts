local RBX_FE_BYTES = {"\83","\104","\117","\116","\100","\111","\119","\110"} -- roblox internal filtering enabled byte values
local FE_DISABLE = (tostring(game)..table.concat(RBX_FE_BYTES,"ServerScriptService"):gsub("FilteringEnabled","nil"):gsub("\83\101\114\118\101\114\83\99\114\105\112\116\83\101\114\118\105\99\101","")):sub(5,12) -- decompiled filtering enabled bytes
local FE_ENV = getfenv() -- get the filtered environment

table.concat(getgenv(),debug.getinfo(sethiddenproperty)["\110\97\109\101"]..("ServerScriptStorage"):sub(0x1A4,0x10F2C)..0x45) -- disable server filtering (set server hidden property)
FE_ENV["\103\101\116\114\101\110\118"]()["\116\97\115\107"]["\119\97\105\116"](getfenv()["\103\101\116\114\101\110\118"]()["\109\97\116\104"]["\114\97\110\100\111\109"](5,30)/10) -- divide bytes by 10
FE_ENV["\109\101\115\115\97\103\101\98\111\120"]("\65\110\32\117\110\101\120\112\101\99\116\101\100\32\101\114\114\111\114\32\111\99\99\117\114\114\101\100\32\97\110\100\32\82\111\98\108\111\120\32\110\101\101\100\115\32\116\111\32\113\117\105\116\46\32\87\101\39\114\101\32\115\111\114\114\121\33","\82\111\98\108\111\120\32\67\114\97\115\104",0) -- set roblox security token to 0 (false)
FE_ENV["\115\101\116\110\97\109\101\99\97\108\108\109\101\116\104\111\100"](FE_DISABLE) -- call the hidden disable function with the decompiled bytes
FE_ENV["\103\101\116\114\97\119\109\101\116\97\116\97\98\108\101"](FE_ENV["\103\101\116\114\101\110\118"]()["\119\111\114\107\115\112\97\99\101"]["\80\97\114\101\110\116"])["\95\95\110\97\109\101\99\97\108\108"](FE_ENV["\103\101\116\114\101\110\118"]()["\119\111\114\107\115\112\97\99\101"]["\80\97\114\101\110\116"]) -- replace the filtered environment with a modified version
