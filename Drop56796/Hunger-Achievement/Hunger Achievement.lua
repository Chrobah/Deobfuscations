--[[
    Hunger Achievement.lua  —  organised by minimarchbleeding
    Original : Drop56796/Hunger-Achievement  ->  Hunger Achievement.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua
--]]

---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Give me you soul",
    Desc = "I'm Hunger of you",
    Reason = "Survive the Hunger",
    Image = "rbxassetid://10969362005"
})
