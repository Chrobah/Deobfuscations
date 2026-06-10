--[[
    Trauma.lua  —  organised by minimarchbleeding
    Original : Drop56796/Traumatized-Achievement  ->  Trauma
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua
--]]

---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Trauma Of God",
    Desc = "You will die of God!",
    Reason = "Survive the Trauma",
    Image = "rbxassetid://17380327265"
})
