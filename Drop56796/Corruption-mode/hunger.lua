--[[
    hunger.lua  —  organised by minimarchbleeding
    Original : Drop56796/Corruption-mode  ->  hunger.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua, https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua
--]]

---====== Define spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "Hungerd",
    Model = "https://github.com/PABMAXICHAC/doors-monsters-models/blob/main/hunger.rbxm?raw=true",
    Speed = 600,
    MoveDelay = 0.25,
    HeightOffset = 0,
    CanKill = true,
    KillRange = 45,
    SpawnInFront = false,
    ShatterLights = true,
    FlickerLights = {
        Enabled = true,
        Duration = 0
    },
    Cycles = {
        Min = 1,
        Max = 7,
        Delay = 0.25
    },
    CamShake = {
        Enabled = true,
        Values = {1.5, 20, 0.1, 1},
        Range = 100
    },
    ResistCrucifix = false,
    BreakCrucifix = true,
    DeathMessage = {"You Died of hungerd", "He is faster than you", "Good luck", "...", "..."},
    IsCuriousLight = false
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
    local cue2 = Instance.new("Sound")
	    cue2.Parent = game.Workspace
	    cue2.Name = "Spawn"
	    cue2.SoundId = "rbxassetid://9125712561"
	    cue2.Volume = 9999
	    cue2.PlaybackSpeed = 1
	    cue2:Play()
end

entity.Debug.OnEntityDespawned = function()
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("...",true)
    ---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Give me you soul",
    Desc = "I'm Hunger of you",
    Reason = "Survive the Hunger",
    Image = "rbxassetid://18455691826"
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
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("...",true)
end

--[[
    NOTE: By overwriting 'OnUseCrucifix', the default crucifixion will be ignored and this function will be called instead

    entity.Debug.OnUseCrucifix = function()
        print("Custom crucifixion script here")
    end
]]--

---====== Run entity ======---

Spawner.runEntity(entity)
