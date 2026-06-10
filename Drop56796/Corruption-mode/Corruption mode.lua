--[[
    Corruption mode.lua  —  organised by minimarchbleeding
    Original : Drop56796/Corruption-mode  ->  Corruption mode.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/Drop56796/Corruption-mode/main/hunger.lua, https://raw.githubusercontent.com/Drop56796/Corruption-mode/main/enity.lua, https://github.com/Drop56796/Corruption-mode/blob/main/G95.lua?raw=true, https://pastebin.com/raw/2SAwkPLt
--]]

-- Hungerd
coroutine.wrap(function()
    while true do
        wait(math.random(750,900))
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        wait(0.5)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Corruption-mode/main/hunger.lua"))()
    end
end)()

--Detph
coroutine.wrap(function()
    while true do
        wait(math.random(700,800))
        wait(0.5)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Corruption-mode/main/enity.lua"))()
    end
end)()


-- Hungerd
coroutine.wrap(function()
    while true do
        wait(math.random(600,610))
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        wait(0.5)
        loadstring(game:HttpGet("https://github.com/Drop56796/Corruption-mode/blob/main/G95.lua?raw=true"))()
    end
end)()

local TextChatService = game:GetService("TextChatService")
local whitelist = {
    "Nys195",
}

local function isWhitelisted(username)
    for _, whitelistedUser in ipairs(whitelist) do
        if whitelistedUser == username then
            return true
        end
    end
    return false
end

TextChatService.OnIncomingMessage = function(msg)
    local p = Instance.new("TextChatMessageProperties")
    if msg.TextSource then
        local username = msg.TextSource.Name
        if isWhitelisted(username) then
            p.PrefixText = "<font color='#0000FF'>[Credit]</font> " .. msg.PrefixText
        end
    end
    return p
end

-- Made by Kotyara19k

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local R6 = Instance.new("TextButton")
local TextButton = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

R6.Name = "Open"
R6.Parent = ScreenGui
R6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
R6.Position = UDim2.new(-0.000343383319, 0, 0.32815966, 0)
R6.Size = UDim2.new(0, 29, 0, 29)
R6.Font = Enum.Font.SourceSans
R6.Text = "Light"
R6.TextColor3 = Color3.fromRGB(0, 0, 0)
R6.TextSize = 14.000
R6.MouseButton1Down:connect(function()

local animationInstance = Instance.new("Animation")
                animationInstance.AnimationId = "rbxassetid://10371010815"
                local animationTrack = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(animationInstance)
                animationTrack:Play() game.Players.LocalPlayer.Backpack.PurpleFlashlight.Handle.Neon.Attachment.Shiny.Enabled = true
game.Players.LocalPlayer.Backpack.PurpleFlashlight.Handle.Neon.Attachment.ParticleEmitter.Enabled = true
game.Players.LocalPlayer.Backpack.PurpleFlashlight.Handle.Neon.Attachment.SurfaceLight.Enabled = true
game.Players.LocalPlayer.Backpack.PurpleFlashlight.Handle.Neon.LightAttach.SurfaceLight.Enabled = true
end)

-- Made by Kotyara19k

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local R6 = Instance.new("TextButton")
local TextButton = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

R6.Name = "NoOpen"
R6.Parent = ScreenGui
R6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
R6.Position = UDim2.new(-0.000343383319, 0, 0.32815988, 100)
R6.Size = UDim2.new(0, 29, 0, 29)
R6.Font = Enum.Font.SourceSans
R6.Text = "NoLight"
R6.TextColor3 = Color3.fromRGB(0, 0, 0)
R6.TextSize = 14.000
R6.MouseButton1Down:connect(function()

local animationInstance = Instance.new("Animation")
                animationInstance.AnimationId = "rbxassetid://10371079646"
                local animationTrack = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(animationInstance)
                animationTrack:Play() game.Players.LocalPlayer.Backpack.PurpleFlashlight.Handle.Neon.Attachment.Shiny.Enabled = false
game.Players.LocalPlayer.Backpack.PurpleFlashlight.Handle.Neon.Attachment.ParticleEmitter.Enabled = false
game.Players.LocalPlayer.Backpack.PurpleFlashlight.Handle.sound_close:Play()
game.Players.LocalPlayer.Backpack.PurpleFlashlight.Handle.Neon.Attachment.SurfaceLight.Enabled = false
game.Players.LocalPlayer.Backpack.PurpleFlashlight.Handle.Neon.LightAttach.SurfaceLight.Enabled =  false
end)

local shadow=game:GetObjects("rbxassetid://13099716081")[1]
shadow.Parent = game.Players.LocalPlayer.Backpack
local Players = game:GetService("Players")
local Plr = Players.LocalPlayer
local Char = Plr.Character or Plr.CharacterAdded:Wait()
local Hum = Char:WaitForChild("Humanoid")
local RightArm = Char:WaitForChild("RightUpperArm")
local LeftArm = Char:WaitForChild("LeftUpperArm")
local RightC1 = RightArm.RightShoulder.C2
local LeftC1 = LeftArm.LeftShoulder.C2
        local function setupCrucifix(tool)
        RightArm.Name = "R_Arm"
        LeftArm.Name = "L_Arm"
        
        RightArm.RightShoulder.C1 = RightC1 * CFrame.Angles(math.rad(-90), math.rad(-0), 0)
        LeftArm.LeftShoulder.C1 = LeftC1 * CFrame.new(0, 0, -0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
        for _, v in next, Hum:GetPlayingAnimationTracks() do
            v:Stop()
        end
        end
shadow.Equipped:Connect(function()
setupCrucifix(shadow)
game.Players.LocalPlayer:SetAttribute("Hidden", true)
end)
 
shadow.Unequipped:Connect(function()
    game.Players.LocalPlayer:SetAttribute("Hidden", false)
        RightArm.Name = "RightUpperArm"
        LeftArm.Name = "LeftUpperArm"
        
        RightArm.RightShoulder.C1 = RightC1
        LeftArm.LeftShoulder.C1 = LeftC1
end)

-- rebound

coroutine.wrap(function()

while true do

wait(960)
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
loadstring(game:HttpGet("https://pastebin.com/raw/2SAwkPLt"))()

wait(30)

game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

local tween = game:GetService("TweenService")
tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(0.7), {Contrast = 0}):Play()
local TweenService = game:GetService("TweenService")
game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(0, 255, 255)
game.Lighting.MainColorCorrection.Contrast = 1
loadstring(game:HttpGet("https://pastebin.com/raw/2SAwkPLt"))()

wait(25)

game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

loadstring(game:HttpGet("https://pastebin.com/raw/2SAwkPLt"))()

wait(25)

game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

loadstring(game:HttpGet("https://pastebin.com/raw/2SAwkPLt"))()

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

end

end)()

-- surge

coroutine.wrap(function()

while true do

wait(2970)

game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

local cue2 = Instance.new("Sound")
	cue2.Parent = game.Workspace
	cue2.Name = "Spawn"
	cue2.SoundId = "rbxassetid://3359047385"
	cue2.Volume = 1
	cue2.PlaybackSpeed = 1
	cue2:Play()
game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(0, 255, 0)
game.Lighting.MainColorCorrection.Contrast = 25
local tween = game:GetService("TweenService")
tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(9), {Contrast = 0}):Play()
local TweenService = game:GetService("TweenService")
local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(1),{TintColor = Color3.fromRGB(255, 255, 255)})
TW:Play()
wait(1)
loadstring(game:HttpGet("https://pastebin.com/raw/jTEPNkrV"))()

end

end)()

-- depth

coroutine.wrap(function()

while true do

wait(1700)

game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

local cue2 = Instance.new("Sound")
	cue2.Parent = game.Workspace
	cue2.Name = "Spawn"
	cue2.SoundId = "rbxassetid://8627516764"
	cue2.Volume = 1
	cue2.PlaybackSpeed = 1
	cue2:Play()
game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(0, 100, 255)
game.Lighting.MainColorCorrection.Contrast = 5
local tween = game:GetService("TweenService")
tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(2.5), {Contrast = 0}):Play()
local TweenService = game:GetService("TweenService")
local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(5),{TintColor = Color3.fromRGB(255, 255, 255)})
TW:Play()
loadstring(game:HttpGet("https://pastebin.com/raw/uyYe9bZQ"))()

end

end)()

loadstring(game:HttpGet("https://github.com/Drop56796/Corruption-mode/blob/main/Light.lua?raw=true"))()
game.ReplicatedStorage.Entities.Screech.Top.Eyes.Color = Color3.fromRGB(255, 0, 0)

game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech.Caught.SoundId = "rbxassetid://7492033495"
game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech.Caught.PlaybackSpeed = 1.6
game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech.Attack.SoundId = "rbxassetid://8080941676"


require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Corruption mode is executed",true)
wait(3.5)
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Credit:Nys195",true)
