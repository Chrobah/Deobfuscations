--[[
    Mangle Achievement.lua  —  organised by minimarchbleeding
    Original : Drop56796/Mangle-  ->  Mangle Achievement.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua
--]]

---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Darkness Forbidden Mangle",
    Desc = "It's Forbidden mode Surge?",
    Reason = "Survive the Mangle",
    Image = "rbxassetid://17369743156"
})
