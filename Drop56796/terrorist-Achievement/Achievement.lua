--[[
    Achievement.lua  —  organised by minimarchbleeding
    Original : Drop56796/terrorist-Achievement  ->  Achievement.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua
--]]

---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Nightmare Smile of Death",
    Desc = "Hey Bro Look at me ",
    Reason = "Survive the terrorist",
    Image = "rbxassetid://17357468089"
})
