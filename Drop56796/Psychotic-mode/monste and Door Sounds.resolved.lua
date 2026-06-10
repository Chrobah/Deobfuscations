-- source: github.com/Drop56796/Psychotic-mode  (monste and Door Sounds.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/a60/main/60.lua  (7203 bytes)

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

local entity = spawner.Create({
	Entity = {
		Name = "Super A-60",
		Asset = "https://github.com/Drop56796/public/blob/main/Super%20A-60%20V4.rbxm?raw=true",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} 
	},
	Movement = {
		Speed = 350,
		Delay = 4,
		Reversed = false
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", 
		Min = 1,
		Max = 8,
		Delay = 0
	},
	Damage = {
		Enabled = true,
		Range = 40,
		Amount = 125
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", 
		Hints = {"You die to Super A-60..", "it's fast to neer you...", "use what you learn from Ambush..", "Wait,you won't see it..", "Good luck!"},
		Cause = "Super A-60"
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
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
    wait(3)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/n/main/n.lua"))()
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		
        local A60 = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local UIScale = Instance.new("UIScale")
local cue2 = Instance.new("Sound")
local sddb = Instance.new("EchoSoundEffect")
local sd = Instance.new("ReverbSoundEffect")
sd.Parent = cue2
sd.DecayTime = 1.5
sd.Archivable = true
sd.Density = 1
sd.Diffusion = 1
sd.DryLevel = -6
sd.Enabled = true
sd.Priority = 0
sd.WetLevel = 0
sd.Name = "haha"

sddb.Parent = cue2
sddb.Delay = 1
sddb.Feedback = 0.5
sddb.Priority = 0
sddb.WetLevel = 0
sddb.DryLevel = 0
sddb.Enabled = true
sddb.Archivable = true
sddb.Name = "hahaha"


cue2.Parent = game.Workspace
cue2.Name = "jumpsound"
cue2.SoundId = "rbxassetid://6459610652"
cue2.Volume = 5
cue2.PlaybackSpeed = 1
cue2.Looped = true
cue2:Play()

A60.Name = "A60"
A60.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
A60.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = A60
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(197, 0, 0)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(2, 0, 2, 0)
Frame.ZIndex = 50

ImageLabel.Parent = Frame
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.Position = UDim2.new(0.490973324, 0, 0.476232767, 0)
ImageLabel.Size = UDim2.new(0.403061181, 0, 0.629644573, 0)
ImageLabel.ZIndex = 51
ImageLabel.Image = "rbxassetid://12145554242"
ImageLabel.ScaleType = Enum.ScaleType.Fit

UIScale.Parent = A60

local function HPVZT_fake_script() 
	local script = Instance.new('LocalScript', ImageLabel)

	local ImageLabel = script.Parent
	local face = {"a1", "a2", "a3", "a4", "a5", "a6"}
	cue2:Play()
	for i, v in pairs(face) do
		wait(0)
		ImageLabel.Image = "rbxassetid://12145554242"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145534911"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599498"
		wait(0)
		ImageLabel.Image = "rbxassetid://12155335619"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599275"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145598814"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145554242"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145534911"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599498"
		wait(0)
		ImageLabel.Image = "rbxassetid://12155335619"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599275"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145598814"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145554242"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145534911"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599498"
		wait(0)
		ImageLabel.Image = "rbxassetid://12155335619"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599275"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145598814"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145554242"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145534911"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599498"
		wait(0)
		ImageLabel.Image = "rbxassetid://12155335619"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599275"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145598814"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145554242"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145598814"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145554242"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145534911"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599498"
		wait(0)
		ImageLabel.Image = "rbxassetid://12155335619"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599275"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145598814"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145554242"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145598814"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145554242"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145534911"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599498"
		wait(0)
		ImageLabel.Image = "rbxassetid://12155335619"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599275"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145598814"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145554242"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145598814"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145554242"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145534911"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599498"
		wait(0)
		ImageLabel.Image = "rbxassetid://12155335619"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599275"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145598814"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145554242"
		wait(0.2)
		cue2:Destroy()
	Frame.Visible = false
		A60:Remove()
	end
	
	
	
end
coroutine.wrap(HPVZT_fake_script)()

	else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Guided-/main/Guided.lua"))()
	end
end)

entity:Run()

-- (nested) https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua  (636 bytes)

-- (nested) https://raw.githubusercontent.com/Drop56796/n/main/n.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/n/main/n.lua  (398 bytes)

-- (nested) https://raw.githubusercontent.com/Drop56796/Guided-/main/Guided.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/Guided-/main/Guided.lua  (187 bytes)


-- ========================================

-- source: github.com/Drop56796/Psychotic-mode  (monste and Door Sounds.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/detph-spawner/main/detph.lua  (2455 bytes)

require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("I feel cold",true)
wait(2)

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "Depth",
    Model = "https://github.com/catminetry/Depth-V1/blob/main/Depth%20V1.rbxm?raw=true", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)
    Speed = 350,
    MoveDelay = 2,
    HeightOffset = 0,
    CanKill = true,
    KillRange = 50,
    SpawnInFront = false,
    ShatterLights = true,
    FlickerLights = {
        Enabled = true,
        Duration = 1
    },
    Cycles = {
        Min = 1,
        Max = 5,
        Delay = 2
    },
    CamShake = {
        Enabled = true,
        Values = {1.5, 20, 0.1, 1},
        Range = 100
    },
    ResistCrucifix = false,
    BreakCrucifix = true,
    DeathMessage = {"Custom", "death", "message", "goes", "here."},
    IsCuriousLight = false
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
    print("Entity has spawned")
end

entity.Debug.OnEntityDespawned = function()
    ---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Depth of cold",
    Desc = "I'm feel too cold...",
    Reason = "Survive the Depth",
    Image = "rbxassetid://12294674733"
})
end

entity.Debug.OnEntityStartMoving = function()
    print("Entity started moving")
end

entity.Debug.OnEntityFinishedRebound = function()
    print("Entity finished rebound")
end

entity.Debug.OnEntityEnteredRoom = function(room)
    print("Entity entered room:", room)
end

entity.Debug.OnLookAtEntity = function()
    print("Player looking at entity")
end

entity.Debug.OnDeath = function()
    print("Player has died")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Guided-/main/Guided.lua"))()
end

--[[
    NOTE: By overwriting 'OnUseCrucifix', the default crucifixion will be ignored and this function will be called instead

    entity.Debug.OnUseCrucifix = function()
        print("Custom crucifixion script here")
    end
]]--

---====== Run entity ======---

Spawner.runEntity(entity)

-- (nested) https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua  (94782 bytes)

-- (nested) https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua  (664 bytes)

-- (nested) https://raw.githubusercontent.com/Drop56796/Guided-/main/Guided.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/Guided-/main/Guided.lua  (187 bytes)


-- ========================================

-- source: github.com/Drop56796/Psychotic-mode  (monste and Door Sounds.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/Crazy-Hunger/main/Hunger.lua  (2876 bytes)

local cue2 = Instance.new("Sound")
	cue2.Parent = game.Workspace
	cue2.Name = "Spawn"
	cue2.SoundId = "rbxassetid://9125712561"
	cue2.Volume = 9999
	cue2.PlaybackSpeed = 1
	cue2:Play()
wait(11)

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

local entity = spawner.Create({
	Entity = {
		Name = "Hungerd",
		Asset = "https://github.com/PABMAXICHAC/doors-monsters-models/blob/main/hunger.rbxm",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 285,
		Delay = 2,
		Reversed = false
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 3,
		Max = 6,
		Delay = 0
	},
	Damage = {
		Enabled = true,
		Range = 40,
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
		Hints = {"You die to hungerd", "care about it..", "It is difficult", "Just hide!!"},
		Cause = "Hungerd"
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
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
    print("Entity has despawned")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Hunger-Achievement/main/Hunger%20Achievement.lua"))()
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Guided-/main/Guided.lua"))()
	end
end)

---====== Run entity ======---

entity:Run()
-- entity:Pause()
-- entity:Resume()
-- entity:IsPaused()
-- entity:Despawn()

-- (nested) https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua  (636 bytes)

-- (nested) https://raw.githubusercontent.com/Drop56796/Hunger-Achievement/main/Hunger%20Achievement.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/Hunger-Achievement/main/Hunger%20Achievement.lua  (401 bytes)

-- (nested) https://raw.githubusercontent.com/Drop56796/Guided-/main/Guided.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/Guided-/main/Guided.lua  (187 bytes)


-- ========================================

-- source: github.com/Drop56796/Psychotic-mode  (monste and Door Sounds.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/Spawn-terrorist/main/Spawn.lua  (2583 bytes)

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

local entity = spawner.Create({
	Entity = {
		Name = "Terrorist",
		Asset = "https://github.com/catminetry/Terrorist-V1/blob/main/Terrorist.rbxm?raw=true",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 300,
		Delay = 2,
		Reversed = false
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 3,
		Max = 6,
		Delay = 0
	},
	Damage = {
		Enabled = true,
		Range = 40,
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
		Hints = {"You die to Terrorist", "care about it..", "It is difficult", "Just hide!!"},
		Cause = "Terrorist"
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
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
    print("Entity has despawned")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/terrorist-Achievement/main/Achievement.lua"))()
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

---====== Run entity ======---

entity:Run()
-- entity:Pause()
-- entity:Resume()
-- entity:IsPaused()
-- entity:Despawn()

-- (nested) https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua  (636 bytes)

-- (nested) https://raw.githubusercontent.com/Drop56796/terrorist-Achievement/main/Achievement.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/terrorist-Achievement/main/Achievement.lua  (414 bytes)


-- ========================================

-- source: github.com/Drop56796/Psychotic-mode  (monste and Door Sounds.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/G95/main/G95.lua  (7004 bytes)

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

local entity = spawner.Create({
	Entity = {
		Name = "G-95",
		Asset = "rbxassetid://17366360698=true",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 750,
		Delay = 3.5,
		Reversed = false
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 1,
		Max = 4,
		Delay = 0.8
	},
	Damage = {
		Enabled = true,
		Range = 40,
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
	local Reboundcolor = Instance.new("ColorCorrectionEffect",game.Lighting) game.Debris:AddItem(Reboundcolor,24)
                Reboundcolor.Name = "Warn"
                Reboundcolor.TintColor = Color3.fromRGB(1500, 2500, 1500) Reboundcolor.Saturation = -0.5 Reboundcolor.Contrast = 0.9
                game.TweenService:Create(Reboundcolor,TweenInfo.new(15),{TintColor = Color3.fromRGB(255, 255, 250),Saturation = 0, Contrast = 0}):Play()
	local TweenService = game:GetService("TweenService")
	local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(5),{TintColor = Color3.fromRGB(255, 255, 255)})
	local cue2 = Instance.new("Sound")
	cue2.Parent = game.Workspace
	cue2.Name = "Spawn"
	cue2.SoundId = "rbxassetid://2022892964"
	cue2.Volume = 3
	cue2.PlaybackSpeed = 0.5
	cue2:Play()
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
    wait(2.5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/G95-Achievement/main/G95.lua"))()
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		
		local Jumpscare = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Rush2 = Instance.new("ImageLabel")
local ambush = Instance.new("ImageLabel")
local UIScale = Instance.new("UIScale")

local Scream = Instance.new("Sound")
Scream.Parent = game.Workspace
Scream.Name = "jump"
Scream.SoundId = "rbxassetid://6459610652"
Scream.Volume = 1

--Properties:

Jumpscare.Name = "Jumpscare"
Jumpscare.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Jumpscare.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = Jumpscare
Frame.BackgroundColor3 = Color3.fromRGB(5, 9, 6)
Frame.Position = UDim2.new(0, 0, -0.122194529, 0)
Frame.Size = UDim2.new(1, 0, 1.25, 0)

Rush2.Name = "Rush2"
Rush2.Parent = Frame
Rush2.AnchorPoint = Vector2.new(0.5, 0.5)
Rush2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Rush2.BackgroundTransparency = 1.000
Rush2.Position = UDim2.new(0.5, 0, 0.5, 0)
Rush2.Size = UDim2.new(0.300000012, 0, 0.300000012, 0)
Rush2.Visible = false
Rush2.ZIndex = 50
Rush2.Image = "rbxassetid://17528112652"
Rush2.ScaleType = Enum.ScaleType.Fit

ambush.Name = "ambush"
ambush.Parent = Frame
ambush.AnchorPoint = Vector2.new(0.5, 0.5)
ambush.BackgroundColor3 = Color3.fromRGB(28, 0, 0)
ambush.BackgroundTransparency = 1.000
ambush.BorderSizePixel = 0
ambush.Position = UDim2.new(0.5, 0, 0.5, 0)
ambush.Size = UDim2.new(0, 300, 0, 300)
ambush.ZIndex = 5
ambush.Image = "rbxassetid://17528112652"
ambush.ImageTransparency = 1.000
ambush.ScaleType = Enum.ScaleType.Fit

UIScale.Parent = Jumpscare

-- Scripts:

local function YEHQ_fake_script() -- Jumpscare.LocalScript 
	local script = Instance.new('LocalScript', Jumpscare)

	local frame = script.Parent.Frame
	local Ambush = frame.ambush
	
	function colorFlash()
		wait(0.025)
		frame.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
		wait(0.025)
		frame.BackgroundColor3 = Color3.fromRGB(74, 0, 0)
		wait(0.025)
		frame.BackgroundColor3 = Color3.fromRGB(216, 0, 0)
		wait(0.025)
		frame.BackgroundColor3 = Color3.fromRGB(171, 31, 31)
		wait(0.025)
		frame.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
		wait(0.025)
		frame.BackgroundColor3 = Color3.fromRGB(74, 0, 0)
		wait(0.025)
		frame.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
		wait(0.025)
		frame.BackgroundColor3 = Color3.fromRGB(194, 28, 28)
	end
	
	function soundScream()
		Scream:Play()
	end
	
	for i = 1, 1 do
		frame.Visible = true
		wait(math.random(1, 2)/200)
		Ambush.ImageTransparency = 0
		Ambush:TweenPosition(UDim2.new(0.491, 0, 0.486, 0), nil, nil, 0.0175) --Down
		wait(0.0175)
		Ambush:TweenPosition(UDim2.new(0.5, 0, 0.475, 0), nil, nil, 0.0175) --Left
		wait(math.random(1, 2)/20)
		Ambush:TweenSize(UDim2.new(0, 100, 0, 100), nil, nil, 0.0175)
		soundScream()
		for i = 1, math.random(1, 5) do
			Ambush:TweenPosition(UDim2.new(0.49, 0, 0.486, 0), nil, nil, 0.0175) --Down
			wait(0.0175)
			Ambush:TweenPosition(UDim2.new(0.5, 0, 0.475, 0), nil, nil, 0.0175) --Left
			wait(0.0175)
			Ambush:TweenPosition(UDim2.new(0.492, 0, 0.465, 0), nil, nil, 0.0175) --Up
			wait(0.0175)
			Ambush:TweenPosition(UDim2.new(0.52, 0, 0.495, 0), nil, nil, 0.0175) --Right
			wait(0.0175)
			Ambush:TweenPosition(UDim2.new(0.487, 0, 0.475, 0), nil, nil, 0.0175) --Middle
			wait(0.0175)
			Ambush:TweenPosition(UDim2.new(0.495, 0, 0.465, 0), nil, nil, 0.0175) --Up
			wait(0.0175)
			Ambush:TweenPosition(UDim2.new(0.487, 0, 0.48, 0), nil, nil, 0.0175) --Middle
		end
		Ambush:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), nil, nil, 0.0175)
		Ambush.Size = (UDim2.new(0, 150, 0, 150))
		wait(.15)
		Ambush:TweenSize(UDim2.new(0, 4000, 0, 4000), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 1, false)
		frame.BackgroundColor3 = Color3.fromRGB(38, 0, 0)
		wait(1.2)
		--script.Parent.Scream:Play()
		frame.Visible = false
	end
end
coroutine.wrap(YEHQ_fake_script)()

	else
		print("Entity has damaged the player")
	end
end)

entity:Run()
-- entity:Pause()
-- entity:Resume()
-- entity:IsPaused()
-- entity:Despawn()

-- (nested) https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua  (636 bytes)

-- (nested) https://raw.githubusercontent.com/Drop56796/G95-Achievement/main/G95.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/G95-Achievement/main/G95.lua  (396 bytes)


-- ========================================

-- source: github.com/Drop56796/Psychotic-mode  (monste and Door Sounds.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/M/main/M.lua  (2488 bytes)

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Mangle",
		Asset = "https://github.com/catminetry/Mangle-V1/blob/main/Mangle.rbxm?raw=true",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 450,
		Delay = 2,
		Reversed = false
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 2,
		Max = 5,
		Delay = 0.5
	},
	Damage = {
		Enabled = true,
		Range = 40,
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
		Hints = {"You died to Bangle..", "He is faster than ambush..", "You must Avoid him..", "Good luck..."},
		Cause = "Mangle"
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
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
    wait(2)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Mangle-/main/Mangle%20Achievement.lua"))()
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

entity:Run()

-- (nested) https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua  (636 bytes)

-- (nested) https://raw.githubusercontent.com/Drop56796/Mangle-/main/Mangle%20Achievement.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/Mangle-/main/Mangle%20Achievement.lua  (419 bytes)
