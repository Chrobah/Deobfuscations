--[[
    H.lua  —  organised by minimarchbleeding
    Original : Drop56796/Highlight  ->  H.lua
    Not obfuscated; reproduced as-is.
--]]

--高亮
local Light = game:GetService("Lighting")

function dofullbright()
Light.Ambient = Color3.new(1, 1, 1)
Light.ColorShift_Bottom = Color3.new(1, 1, 1)
Light.ColorShift_Top = Color3.new(1, 1, 1)
end

dofullbright()

Light.LightingChanged:Connect(dofullbright)
