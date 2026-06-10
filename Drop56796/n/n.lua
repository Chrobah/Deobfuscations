--[[
    n.lua  —  organised by minimarchbleeding
    Original : Drop56796/n  ->  n.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua
--]]

---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Death of Hide",
    Desc = "You are lucky",
    Reason = "Survive the Super A-60",
    Image = "rbxassetid://17349610834"
})
