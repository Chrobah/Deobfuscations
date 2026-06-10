--[[
    a.lua  —  organised by minimarchbleeding
    Original : Drop56796/a.  ->  a.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua
--]]

---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Yourself and you said",
    Desc = "Why'd do you hide and Survive me",
    Reason = "Survive and escape the Trauma",
    Image = "rbxassetid://3457898957"
})
