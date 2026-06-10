-- source: github.com/Anzor5458/Doors-stingray-mod  (Anzor)
-- [resolved CLEAN] https://pastebin.com/raw/R5i67c3H  (2974 bytes)

---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
    Entity = {
        Name = "Smiley",
        Asset = "rbxassetid://10562520790",  -- Use the provided asset ID
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
        Enabled = true,
        Type = "Ambush", -- "Blitz"
        Min = 1,
        Max = 1,
        Delay = 2
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
        Hints = {"Death", "Hints", "Go", "Here"},
        Cause = ""
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

-- source: github.com/Anzor5458/Doors-stingray-mod  (Anzor)
-- [resolved CLEAN] https://pastebin.com/raw/epkKZ3ak  (3398 bytes)

---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Pipsqueak",  -- Name of the entity
		Asset = "rbxassetid://111893246320767",  -- Replace with the correct asset ID for Pipsqueak
		HeightOffset = 0  -- Adjust the height as needed
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1  -- Duration of flicker
		},
		Shatter = true,  -- Lights will shatter
		Repair = false   -- No repair of lights
	},
	Earthquake = {
		Enabled = true  -- Enable earthquake effect when Pipsqueak spawns
	},
	CameraShake = {
		Enabled = true,
		Range = 100,  -- Camera shake range
		Values = {1.5, 20, 0.1, 1}  -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 75,  -- Movement speed for Pipsqueak (can be adjusted)
		Delay = 1,   -- Delay before Pipsqueak starts moving
		Reversed = false  -- Movement direction
	},
	Rebounding = {
		Enabled = true,
		Type = "Blitz",  -- Pipsqueak's rebound type
		Min = 1,
		Max = 2,
		Delay = 1  -- Rebound delay
	},
	Damage = {
		Enabled = true,
		Range = 40,   -- Damage range (affects nearby players)
		Amount = 50   -- Damage amount dealt to players
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,   -- Crucifixion range
		Resist = false,  -- No resistance to crucifix
		Break = true     -- Crucifix will break on Pipsqueak
	},
	Death = {
		Type = "Curious",  -- Pipsqueak's death type ("Curious")
		Hints = {"Look behind you...", "What is that noise?", "Be careful, it’s too quiet..."},  -- Hints to warn players
		Cause = "Pipsqueak got you!"  -- Death cause
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Pipsqueak has spawned")
end)

entity:SetCallback("OnStartMoving", function()
    print("Pipsqueak has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Pipsqueak has entered room: ".. room.Name.. " for the first time")
    else
        print("Pipsqueak has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at Pipsqueak")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Pipsqueak has started rebounding")
	else
        print("Pipsqueak has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Pipsqueak is despawning")
end)

entity:SetCallback("OnDespawned", function()
    print("Pipsqueak has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Pipsqueak has killed the player")
	else
		print("Pipsqueak has damaged the player")
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

-- source: github.com/Anzor5458/Doors-stingray-mod  (Anzor)
-- [resolved CLEAN] https://pastebin.com/raw/UsJxmdnf  (3484 bytes)

---====== Load spawner ======---

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create Abyss Entity ======---

local entity = spawner.Create({
	Entity = {
		Name = "Abyss",  -- Name of the entity
		Asset = "rbxassetid://16149397078",  -- The asset ID for Abyss entity
		HeightOffset = 0  -- Adjust the height offset
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 2  -- Longer flickering effect
		},
		Shatter = true,  -- Lights will shatter
		Repair = false   -- Lights will not repair themselves
	},
	Earthquake = {
		Enabled = true  -- Enable earthquake effect to simulate the Abyss entity's impact
	},
	CameraShake = {
		Enabled = true,
		Range = 50,  -- Smaller range compared to other entities
		Values = {2, 25, 0.2, 1}  -- Higher intensity shake
	},
	Movement = {
		Speed = 60,  -- Slightly slower than other entities for a more terrifying presence
		Delay = 2,   -- Slight delay before the Abyss starts moving
		Reversed = false  -- Normal movement direction
	},
	Rebounding = {
		Enabled = true,
		Type = "Blitz",  -- Blitz rebound for fast movement
		Min = 1,
		Max = 2,
		Delay = 2  -- Slight delay before rebounding
	},
	Damage = {
		Enabled = true,
		Range = 50,   -- Range of damage around the entity
		Amount = 200  -- High damage to increase the threat of Abyss
	},
	Crucifixion = {
		Enabled = true,
		Range = 50,   -- Range of Crucifixion
		Resist = false,  -- No resistance to Crucifixion
		Break = true     -- Crucifix will break when used against Abyss
	},
	Death = {
		Type = "Curious",  -- Curious death type like most entities
		Hints = {"Something is pulling you in", "Don't look away...", "Stay away from the darkness..."},  -- Hints to warn players
		Cause = "The Abyss has consumed you!"  -- Death cause
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Abyss entity has spawned")
end)

entity:SetCallback("OnStartMoving", function()
    print("Abyss has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Abyss has entered room: ".. room.Name.. " for the first time")
    else
        print("Abyss has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at Abyss")
	else
		print("Player's view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Abyss has started rebounding")
	else
        print("Abyss has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Abyss is despawning")
end)

entity:SetCallback("OnDespawned", function()
    print("Abyss has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Abyss has killed the player")
	else
		print("Abyss has damaged the player")
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
