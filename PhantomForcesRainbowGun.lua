game:GetService("RunService").Stepped:Connect(function()
    for i,v in pairs(game.Workspace.CurrentCamera:GetChildren()) do
        for i2,v2 in pairs(v:GetChildren()) do
            if v2.ClassName == "Part" or "MeshPart" then
                v2.Color = Color3.fromHSV(tick()%5/5,1,1)
                v2.Material = Enum.Material.ForceField
            end 
        end
    end
    for i,v in pairs(game.Workspace.CurrentCamera:GetDescendants()) do
        if v.Name == "SightMark" then
            v.SurfaceGui.Border.Scope.ImageColor3 = Color3.fromHSV(tick()%5/5,1,1)
        end
    end 
end)
