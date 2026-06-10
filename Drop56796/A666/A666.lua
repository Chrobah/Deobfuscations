--[[
    A666.lua  —  organised by minimarchbleeding
    Original : Drop56796/A666  ->  A666.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua, https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua, https://raw.githubusercontent.com/Drop56796/detph-spawner/main/detph.lua, https://raw.githubusercontent.com/Drop56796/a60/main/60.lua
--]]

---====== Define spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "A-666",
    Model = "https://github.com/catminetry/A666-V1/blob/main/A-666.rbxm?raw=true", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)
    Speed = 10,
    MoveDelay = 2,
    HeightOffset = 0,
    CanKill = true,
    KillRange = 10,
    SpawnInFront = false,
    ShatterLights = true,
    FlickerLights = {
        Enabled = true,
        Duration = 1
    },
    Cycles = {
        Min = 1,
        Max = 1,
        Delay = 2
    },
    CamShake = {
        Enabled = true,
        Values = {1.5, 20, 0.1, 1},
        Range = 50
    },
    ResistCrucifix = true,
    BreakCrucifix = false,
    DeathMessage = {"You die to A-666...", "care about it...", "this is *$#$@%@@ to evade it", "you need #$&%*(*^&#%#", "^%*%Good Luck..."},
    IsCuriousLight = false
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
    print("Entity has spawned")
end

entity.Debug.OnEntityDespawned = function()
    wait(10)
    --self
    ---====== Define spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "A-666",
    Model = "https://github.com/catminetry/A666-V1/blob/main/A-666.rbxm?raw=true", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)
    Speed = 10,
    MoveDelay = 2,
    HeightOffset = 0,
    CanKill = true,
    KillRange = 10,
    SpawnInFront = false,
    ShatterLights = true,
    FlickerLights = {
        Enabled = true,
        Duration = 1
    },
    Cycles = {
        Min = 1,
        Max = 1,
        Delay = 2
    },
    CamShake = {
        Enabled = true,
        Values = {1.5, 20, 0.1, 1},
        Range = 50
    },
    ResistCrucifix = true,
    BreakCrucifix = false,
    DeathMessage = {"You die to A-666...", "care about it...", "this is *$#$@%@@ to evade it", "you need #$&%*(*^&#%#", "^%*%Good Luck..."},
    IsCuriousLight = false
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
    print("Entity has spawned")
end

entity.Debug.OnEntityDespawned = function()
    print("Entity had despawned")
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
    game.Players.LocalPlayer.Character.Humanoid:TakeDamage(10)
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


    wait(30)
    --depth
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/detph-spawner/main/detph.lua"))()


    wait(20)
    --a60
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/a60/main/60.lua"))()
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
    game.Players.LocalPlayer.Character.Humanoid:TakeDamage(10)
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
