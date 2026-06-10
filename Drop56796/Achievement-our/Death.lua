--[[
    Death.lua  —  organised by minimarchbleeding
    Original : Drop56796/Achievement-our  ->  Death.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua
--]]

---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Why are you doing this to me?",
    Desc = "You want Did",
    Reason = "Survive the Death",
    Image = "rbxassetid://10826375568"
})
