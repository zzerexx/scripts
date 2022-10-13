-- i did not make this
local main = workspace:WaitForChild("__THINGS"):WaitForChild("__REMOTES"):WaitForChild("MAIN")

while true do
	local a = tostring(tick()):rep(100)
	main:FireServer("a", a)
	main:FireServer("b", a)
	task.wait()
end
