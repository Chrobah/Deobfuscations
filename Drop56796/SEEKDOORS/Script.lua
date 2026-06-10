--[[
    Script.lua  —  organised by minimarchbleeding
    Original : Drop56796/SEEKDOORS  ->  Script.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/cat, https://glot.io/snippets/gp5pu59o7f/raw, https://raw.githubusercontent.com/Drop56796/Highlight/main/H.lua
--]]

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/cat"))() --you can go into the github link and copy all of it and modify it for yourself.
local Window = Library:CreateWindow("SeekDoors", Vector2.new(492, 598), Enum.KeyCode.RightControl) --you can change your UI keybind
local AimingTab = Window:CreateTab("Main") --you can rename tab to whatever you want --you can also change the tabs code, for example "AimingTab" can be changed to "FunnyCoolTab" etc.
testSection:AddButton("Hardcore (R-V)", function(IhateGayPeople)
    loadstring(game:HttpGet("https://glot.io/snippets/gp5pu59o7f/raw"))()
end)

testSection:AddSlider("Player Speed", 0, 0, 100, 1, function(State)  
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value   
end)

testSection:AddButton("Die", function(IhateGayPeople)
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

testSection:AddButton("HighLight", function(IhateGayPeople)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Highlight/main/H.lua"))()
end)

