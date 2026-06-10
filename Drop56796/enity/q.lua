--[[
    q.lua  —  organised by minimarchbleeding
    Original : Drop56796/enity  ->  q.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua, https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua
--]]

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

local entity = spawner.Create({
	Entity = {
		Name = "G-95",
		Asset = "https://github.com/Drop56796/enity/blob/main/HD.rbxm?raw=true",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = false,
			Duration = 1
		},
		Shatter = false,
		Repair = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 20,
		Delay = 6,
		Reversed = false
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 1,
		Max = 3,
		Delay = 0
	},
	Damage = {
		Enabled = true,
		Range = 50,
		Amount = 125
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"You died of G95.", "It have Different", "Please Hide!", "Good Luck!!"},
		Cause = "G-95"
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
	  local cue2 = Instance.new("Sound")
cue2.Parent = game.Workspace
cue2.Name = "Spawn"
cue2.SoundId = "rbxassetid://9125713501"
cue2.Volume = 15
cue2:Play()
local MainColorCorrection = game.Lighting.MainColorCorrection
MainColorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
MainColorCorrection.Contrast = 0.2
MainColorCorrection.Saturation = -0.7

-- Get the TweenService
local TweenService = game:GetService("TweenService")

-- Create and play the tween for Contrast
local contrastTween = TweenService:Create(
    MainColorCorrection,
    TweenInfo.new(3),
    {Contrast = 0}
)
contrastTween:Play()

-- Create and play the tween for Saturation
local saturationTween = TweenService:Create(
    MainColorCorrection,
    TweenInfo.new(3),
    {Saturation = 0}
)
saturationTween:Play()

-- Create and play the tween for TintColor to change it to normal red
local colorTween = TweenService:Create(
    MainColorCorrection,
    TweenInfo.new(3),
    {TintColor = Color3.fromRGB(255, 0, 0)} -- Normal red color
)
colorTween:Play()

-- Wait for the colorTween to complete
colorTween.Completed:Wait()

-- Create and play the tween to reset all properties to original
local resetTween = TweenService:Create(
    MainColorCorrection,
    TweenInfo.new(5),
    {
        TintColor = Color3.fromRGB(255, 255, 255), -- No color filter
        Contrast = 0,                               -- Default contrast
        Saturation = 0                              -- Default saturation
    }
)
resetTween:Play()
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnReachNode", function(node)
	print("Entity has reached node:", node)
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    local cue2 = Instance.new("Sound")
	cue2.Parent = game.Workspace
	cue2.Name = "Sound"
	cue2.SoundId = "rbxassetid://1837829565"
	cue2.Volume = 10
	cue2.PlaybackSpeed = 0.8
	cue2:Play()
    wait(2.5)
    ---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Scared of Scream Face For you",
    Desc = "Don't be to slow",
    Reason = "Encountered G95.",
    Image = "rbxassetid://3457898957"
})
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

entity:Run()
-- entity:Pause()
-- entity:Resume()
-- entity:IsPaused()
-- entity:Despawn()
