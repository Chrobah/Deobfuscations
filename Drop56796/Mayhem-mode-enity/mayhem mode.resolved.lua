-- source: github.com/Drop56796/Mayhem-mode-enity  (mayhem mode.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/Mayhem-mode-enity/main/Hard%20Obsession.lua  (2872 bytes)

loadstring(game:HttpGet("https://raw.githubusercontent.com/Jahani-john/mayhem-mode/main/mayhemmode-main/ObfuscatedEntities/Obsession-obfuscated.lua"))()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()


---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Obsession",
		Asset = "https://github.com/Jahani-john/mayhem-mode/blob/main/mayhemmode-main/Greed.Obssesion.rbxm?raw=true",
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
	Earthquake = {
		Enabled = true
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 100,
		Delay = 2,
		Reversed = false
	},
	Rebounding = {
		Enabled = false,
		Type = "Ambush", -- "Blitz"
		Min = 1,
		Max = 1,
		Delay = 0
	},
	Damage = {
		Enabled = true,
		Range = 100,
		Amount = 125
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Curious", -- "Curious"
		Hints = {"Oh hi", "I'm light", "u died because Obsession attack with you", "bye"},
		Cause = "Obsession"
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
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
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()

-- (nested) https://raw.githubusercontent.com/Jahani-john/mayhem-mode/main/mayhemmode-main/ObfuscatedEntities/Obsession-obfuscated.lua
-- [resolved Luraph] https://raw.githubusercontent.com/Jahani-john/mayhem-mode/main/mayhemmode-main/ObfuscatedEntities/Obsession-obfuscated.lua — deobfuscating target:

-- (nested) https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua  (636 bytes)


-- ========================================

-- source: github.com/Drop56796/Mayhem-mode-enity  (mayhem mode.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/Mayhem-mode-enity/main/Manic%20Rush.lua  (1939 bytes)

--===== Define spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "Manci Rush",
    Model = "https://github.com/Jahani-john/mayhem-mode/blob/main/mayhemmode-main/NMRush.rbxm?raw=true", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)
    Speed = 350,
    MoveDelay = 0.5,
    HeightOffset = 0,
    CanKill = true,
    KillRange = 100,
    SpawnInFront = false,
    ShatterLights = true,
    FlickerLights = {
        Enabled = true,
        Duration = 0.5
    },
    Cycles = {
        Min = 1,
        Max = 3,
        Delay = 0.25
    },
    CamShake = {
        Enabled = true,
        Values = {1.5, 20, 0.1, 1},
        Range = 100
    },
    ResistCrucifix = false,
    BreakCrucifix = true,
    DeathMessage = {"You died him", "Goodbye", "...", "...", "..."},
    IsCuriousLight = false
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
    print("Entity has spawned")
end

entity.Debug.OnEntityDespawned = function()
    print("Entity has despawned")
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


-- ========================================

-- source: github.com/Drop56796/Mayhem-mode-enity  (mayhem mode.lua)
-- [resolved Luraph] https://raw.githubusercontent.com/Hoangnguyen72628/MayhemMode/main/ObfuscatedEntities/Threat-obfuscated.lua — deobfuscating target:

-- (remote Luraph target; constants not extractable here)

-- ========================================

-- source: github.com/Drop56796/Mayhem-mode-enity  (mayhem mode.lua)
-- [resolved Luraph] https://raw.githubusercontent.com/Jahani-john/mayhem-mode/main/mayhemmode-main/ObfuscatedEntities/Blackout-obfuscated.lua — deobfuscating target:

-- (remote Luraph target; constants not extractable here)

-- ========================================

-- source: github.com/Drop56796/Mayhem-mode-enity  (mayhem mode.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/Mayhem-mode-enity/main/Ambush.lua  (2639 bytes)

---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Ambush",
		Asset = "https://github.com/Jahani-john/mayhem-mode/blob/main/mayhemmode-main/NMAmbush.rbxm?raw=true",
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
	Earthquake = {
		Enabled = true
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 500,
		Delay = 0.8,
		Reversed = false
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 1,
		Max = 6,
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
		Type = "Curious", -- "Curious"
		Hints = {"Oh hi", "I'm light", "u died", "it is Ambush bro why no hide"},
		Cause = "Ambush"
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
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
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

--[[

DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.

entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)

]]--

---====== Run entity ======---

entity:Run()

-- (nested) https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua  (636 bytes)


-- ========================================

-- source: github.com/Drop56796/Mayhem-mode-enity  (mayhem mode.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/Mayhem-mode-enity/main/End%20check.lua  (2777 bytes)

--进入图书馆变成白雾
game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
if game.ReplicatedStorage.GameData.LatestRoom.Value == 49 then
local lighting = game:GetService("Lighting")

lighting.FogColor = Color3.new(1, 1, 1)

lighting.FogStart = 5
lighting.FogEnd = 50
end
end)

--出图书馆变成黑雾
game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
if game.ReplicatedStorage.GameData.LatestRoom.Value == 51 then
local lighting = game:GetService("Lighting")

lighting.FogColor = Color3.new(0, 0, 0)

lighting.FogStart = 0
lighting.FogEnd = 150
end
end)

--达到温室变成白雾
game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
if game.ReplicatedStorage.GameData.LatestRoom.Value == 90 then
local lighting = game:GetService("Lighting")

lighting.FogColor = Color3.new(1, 1, 1)

lighting.FogStart = 5
lighting.FogEnd = 50
end
end)

--达到电力室变回
game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
if game.ReplicatedStorage.GameData.LatestRoom.Value == 100 then
local lighting = game:GetService("Lighting")

lighting.FogColor = Color3.new(0, 0, 0)

lighting.FogStart = 0
lighting.FogEnd = 150
end
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Mayhem-mode-enity/main/check4.lua"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Mayhem-mode-enity/main/check3.lua"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Mayhem-mode-enity/main/check2.lua"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Mayhem-mode-enity/main/check1.lua"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/Hoangnguyen72628/MayhemMode/main/ObfuscatedEntities/Fog-obfuscated.lua"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Mayhem-mode-enity/main/check4.lua"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Mayhem-mode-enity/main/check3.lua"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Mayhem-mode-enity/main/check2.lua"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Mayhem-mode-enity/main/check1.lua"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Mayhem-mode-enity/main/check4.lua"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Mayhem-mode-enity/main/check3.lua"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Mayhem-mode-enity/main/check2.lua"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Mayhem-mode-enity/main/check1.lua"))()

game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

loadstring(game:HttpGet("https://raw.githubusercontent.com/Hoangnguyen72628/MayhemMode/main/ObfuscatedEntities/Fog-obfuscated.lua"))()

-- (nested) https://raw.githubusercontent.com/Drop56796/Mayhem-mode-enity/main/check4.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/Mayhem-mode-enity/main/check4.lua  (766 bytes)

-- (nested) https://raw.githubusercontent.com/Drop56796/Mayhem-mode-enity/main/check3.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/Mayhem-mode-enity/main/check3.lua  (707 bytes)

-- (nested) https://raw.githubusercontent.com/Drop56796/Mayhem-mode-enity/main/check2.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/Mayhem-mode-enity/main/check2.lua  (707 bytes)
