--[[
    tb.lua  —  organised by minimarchbleeding
    Original : Drop56796/Mayhem-mode-enity  ->  tb.lua
    Clean loader (not obfuscated); pulls: https://github.com/Drop56796/Mayhem-mode-enity/blob/main/re.lua?raw=true, https://github.com/Drop56796/Mayhem-mode-enity/blob/main/re.lua?raw=true, https://github.com/Drop56796/Mayhem-mode-enity/blob/main/re.lua?raw=true, https://github.com/Drop56796/Mayhem-mode-enity/blob/main/re.lua?raw=true
--]]

game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

local Reboundcolor = Instance.new("ColorCorrectionEffect",game.Lighting) game.Debris:AddItem(Reboundcolor,24)
				Reboundcolor.Name = "Warn"
				Reboundcolor.TintColor = Color3.fromRGB(65, 138, 255) Reboundcolor.Saturation = -0.7 Reboundcolor.Contrast = 0.2
				game.TweenService:Create(Reboundcolor,TweenInfo.new(15),{TintColor = Color3.fromRGB(61, 171, 98),Saturation = 0, Contrast = 0}):Play()
local TweenService = game:GetService("TweenService")
local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(5),{TintColor = Color3.fromRGB(255, 255, 255)})
TW:Play()
local cue1 = Instance.new("Sound")
cue1.Parent = game.Workspace
cue1.Name = "Scream"
cue1.SoundId = "rbxassetid://9114397505"
local distort = Instance.new("DistortionSoundEffect")
distort.Parent = cue1
distort.Level = 1
local distort2 = Instance.new("DistortionSoundEffect")
distort2.Parent = cue1
distort2.Level = 1
local pitch = Instance.new("PitchShiftSoundEffect")
pitch.Parent = cue1
pitch.Octave = 0.5
local pitch2 = Instance.new("PitchShiftSoundEffect")
pitch2.Parent = cue1
pitch2.Octave = 0.5
local pitch3 = Instance.new("PitchShiftSoundEffect")
pitch3.Parent = cue1
pitch3.Octave = 0.5
cue1.Volume = 0.1
cue1:Play()
local cue2 = Instance.new("Sound")
cue2.Parent = game.Workspace
cue2.Name = "Spawn"
cue2.SoundId = "rbxassetid://9114221327"
cue2.Volume = 3
cue2:Play()
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
	camara.CFrame = camara.CFrame * shakeCf
end)
camShake:Start()
camShake:ShakeOnce(10,3,0.1,6,2,0.5)
wait(2.8)
loadstring(game:HttpGet("https://github.com/Drop56796/Mayhem-mode-enity/blob/main/re.lua?raw=true"))()
wait(30)

game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

local tween = game:GetService("TweenService")
tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(0.7), {Contrast = 0}):Play()
local TweenService = game:GetService("TweenService")
game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(0, 255, 255)
game.Lighting.MainColorCorrection.Contrast = 1
loadstring(game:HttpGet("https://github.com/Drop56796/Mayhem-mode-enity/blob/main/re.lua?raw=true"))()

wait(25)

game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

loadstring(game:HttpGet("https://github.com/Drop56796/Mayhem-mode-enity/blob/main/re.lua?raw=true"))()

wait(25)

game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

loadstring(game:HttpGet("https://github.com/Drop56796/Mayhem-mode-enity/blob/main/re.lua?raw=true"))()

wait(25)

game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

local tween = game:GetService("TweenService")
tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(0.3), {Contrast = 0}):Play()
game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()
 
---====== Display achievement ======---
achievementGiver({
    Title = "No Respawn",
    Desc = "I'm watching for you",
    Reason = "Encounter Rebound",
    Image = "rbxassetid://13856279731"
})
