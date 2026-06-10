--[[
    G95.lua  —  organised by minimarchbleeding
    Original : Drop56796/G95-Achievement  ->  G95.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua
--]]

---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Scary smile of You",
    Desc = "Don't be slow",
    Reason = "Survive the G-95",
    Image = "rbxassetid://3457898957"
})
