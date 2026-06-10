--[[
    Decoratebance.lua  —  organised by minimarchbleeding
    Original : Drop56796/Achievement-our  ->  Decoratebance.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua
--]]

---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Decnbance give you out",
    Desc = "Hola for you and don't be to slow",
    Reason = "Survive the Decoratebance",
    Image = "rbxassetid://12583460254"
})
