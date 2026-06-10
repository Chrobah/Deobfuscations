--[[
    enity.lua  —  organised by minimarchbleeding
    Original : Drop56796/Corruption-mode  ->  enity.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua
--]]

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "Depth",
    Model = "https://github.com/Nicolaspenteado/Depth/blob/main/depth2.rbxm?raw=true",
    Speed = 300,
    MoveDelay = 0.25,
    HeightOffset = 2.5,
    CanKill = true,
    KillRange = 65,
    SpawnInFront = false,
    ShatterLights = true,
    FlickerLights = {
        Enabled = true,
        Duration = 1
    },
    Cycles = {
        Min = 1,
        Max = 4,
        Delay = 0.25
    },
    CamShake = {
        Enabled = true,
        Values = {1.5, 20, 0.1, 1},
        Range = 100
    },
    ResistCrucifix = false,
    BreakCrucifix = true,
    DeathMessage = {"You died of Depth", "How", "Don't look it", "Because you can die", "Good luck"},
    IsCuriousLight = false
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Hide Quickly! it is come",true)
end

entity.Debug.OnEntityDespawned = function()
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("it is be away",true)
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
