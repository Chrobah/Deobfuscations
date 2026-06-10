--[[
    D.lua  —  organised by minimarchbleeding
    Original : Drop56796/Creepy  ->  D.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt
--]]

local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()

local win = lib:Window("PREVIEW",Color3.fromRGB(44, 120, 224), Enum.KeyCode.RightControl)

local tab = win:Tab("Tab 1")

tab:Toggle("Toggle",false, function(state)
if state then  
    print("a")
else
    print("b")
end)
