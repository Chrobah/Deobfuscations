-- source: github.com/Drop56796/Something  (something.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/Psychotic-mode/main/Speed.lua  (155 bytes)

game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Speed/main/Script.lua"))()

-- (nested) https://raw.githubusercontent.com/Drop56796/Speed/main/Script.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/Speed/main/Script.lua  (4275 bytes)


-- ========================================

-- source: github.com/Drop56796/Something  (something.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua  (664 bytes)

--[[
    This loadstring for DOORS Custom Achievements is now deprecated.
    Please use the new loadstring below to remain up to date:

    https://raw.githubusercontent.com/RegularVynixu/DOORS-Custom-Achievements/main/init.luau
]]--

local CustomAchievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Custom-Achievements/main/init.luau"))()

return function(info: any)
    CustomAchievements:Grant({
        Identifier = "TestAchievement",
        Title = info.Title,
        Desc = info.Desc,
        Reason = info.Reason,
        Image = info.Image
    }, {
        CheckOwned = false,
        Remember = false
    })
end
-- (nested) https://raw.githubusercontent.com/RegularVynixu/DOORS-Custom-Achievements/main/init.luau
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/DOORS-Custom-Achievements/main/init.luau  (3364 bytes)


-- ========================================

-- source: github.com/Drop56796/Something  (something.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/Sound/main/Sound.lua  (332 bytes)

loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/su/main/p.lua"))()
local cue2 = Instance.new("Sound")
cue2.Parent = game.Workspace
cue2.Name = "Sound"
cue2.SoundId = "rbxassetid://9113731836"
cue2.Volume = 2
cue2.PlaybackSpeed = 1

cue2.Looped = true

while true do
    cue2:Play()
    wait(14)  -- 等待 60 秒
end

-- (nested) https://raw.githubusercontent.com/Drop56796/su/main/p.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/su/main/p.lua  (1363 bytes)
