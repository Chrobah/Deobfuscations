--[[
    Sound.lua  —  organised by minimarchbleeding
    Original : Drop56796/Sound  ->  Sound.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/Drop56796/su/main/p.lua
--]]

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
