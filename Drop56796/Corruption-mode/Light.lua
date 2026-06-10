--[[
    Light.lua  —  organised by minimarchbleeding
    Original : Drop56796/Corruption-mode  ->  Light.lua
    Not obfuscated; reproduced as-is.
--]]

-- Get services
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")

-- Set up horror atmosphere
Lighting.Ambient = Color3.new(0, 0, 0)
Lighting.Brightness = 0.1
Lighting.FogEnd = 50
Lighting.FogColor = Color3.new(0, 0, 0)

