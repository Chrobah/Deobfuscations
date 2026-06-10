--[[
    A200.lua  —  organised by minimarchbleeding
    Original : Drop56796/A200-achievement  ->  A200.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua
--]]

---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "The Happy Fun",
    Desc = "Haha I come",
    Reason = "Survive the A200",
    Image = "rbxassetid://11400868582"
})
