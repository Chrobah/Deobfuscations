--[[
    hard Claim.lua  —  organised by minimarchbleeding
    Original : Drop56796/Claim  ->  hard Claim.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/MuhXd/DoorSuff/main/OtherSuff/DoorEntitySpawn%2BSource
--]]

local death = Instance.new("Sound")
    death.Parent = workspace
    death.Name = "die"
    death.SoundId = "rbxassetid://5867708670"
    death.Volume = 0.7
    death.Pitch = 1
    local distort = Instance.new("DistortionSoundEffect")
    distort.Level = 0.9
    distort.Parent = death
    local cue = Instance.new("Sound")
    cue.Parent = workspace
    cue.Name = "Bubbles"
    cue.SoundId = "rbxassetid://9113601215"
    cue.Volume = 1
    cue.Pitch = 0.6
    local distort = Instance.new("DistortionSoundEffect")
    distort.Level = 0.7
    distort.Parent = cue
    cue:Play()
    wait(2.5)
    
    
local Spawner = loadstring(game:HttpGet('https://raw.githubusercontent.com/MuhXd/DoorSuff/main/OtherSuff/DoorEntitySpawn%2BSource'))()


-- Create entity
local entity = Spawner.createEntity({
    CustomName = "Claim", -- Custom name of your entity
    Model = "rbxassetid://11411321855", -- Can be GitHub file or rbxassetid
    Speed = 100, -- Percentage, 100 = default Rush speed
    DelayTime = 0, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    NoDieOnCrouching = false,
    NoHiding = false,
    AntiCrucifix = false,
    KillRange = 10000,
    OneRoom = true,
    DieOnLook = false,
    BreakLights = false,
    BackwardsMovement = false,
     MovementDeath = {
        false, -- Turned On?
        '1',  --- '1'= 'Instant Without Being Looked out' | '2' = 'With Being Looked At'
    },
    FlickerLights = {
        false, -- Enabled/Disabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 3,
        WaitTime = 3,
    },
    CamShake = {
        false, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Type = "2", -- "Normal" or 1 | "Pop" or 2 | "endlessdoorsrebound" or "Rebound" or 3 | More coming Soon
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                "0", -- SoundId Link or Roblox ID
                { Volume = 5 }, -- Sound properties
            },
            Sound2 = {
                "0", -- SoundId Link or Roblox ID
                { Volume = 3 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(255, 255, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 1,
                Max = 3,
            },
        },
    },
    Color = 'GuidingLight', -- CuriousLight ( Yellow ) | GuidingLight ( Blue )
    DiffrentMessages = false,
    CustomDialog = {  
        {"Claim has seen you.", "It will consume anyone on sight.", "It takes a bit to fully spawn in", "so you can use that to your advantage."}, -- Death Messages
        {"Stop Dieing"},
        {"Bruh", "Use what you have learned from Rush!"},
        {"It seems like Template is causing quite the ruckus...", "Hide in a closet or bed as quickly as possible!"},
         {"I have told You What to do", "YOU JUST HAVE A SKILL ISSUE"}
    }
})

-----[[ Advanced Sctipting ]]-----

entity.Debug.OnEntityMoving = function(Invincible,Hiding,plrCollisionPoint)
print("Invincible: "..tostring(Invincible))
print("Player to Entity Collision (None hiding Point): "..tostring(plrCollisionPoint))
print("Hiding: "..tostring(Hiding))
end
       
entity.Debug.OnEntitySpawned = function()
    print("Entity has spawned:")
    local TweenService = game:GetService("TweenService")
    local cue2 = Instance.new("Sound")
    cue2.Parent = workspace.Claim.RushNew
    cue2.Name = "Idle"
    cue2.SoundId = "rbxassetid://8256091246"
    cue2.Volume = 0
    cue2.Pitch = 4
    local shift = Instance.new("PitchShiftSoundEffect")
    shift.Octave = 0.5
    shift.Parent = cue2
    local distort = Instance.new("DistortionSoundEffect")
    distort.Level = 0.9
    distort.Parent = cue2
	cue2.RollOffMaxDistance = 90
	cue2.RollOffMinDistance = 5
	cue2.RollOffMode = Enum.RollOffMode.LinearSquare
    local TW = TweenService:Create(cue2, TweenInfo.new(1.5),{Pitch = 0})
    local TW1 = TweenService:Create(cue2, TweenInfo.new(0.5),{Pitch = 8})
    local TW2 = TweenService:Create(cue2, TweenInfo.new(1.5),{Volume = 0})
    local TW3 = TweenService:Create(cue2, TweenInfo.new(1.5),{Volume = 1})
    cue2:Play()
    TW3:Play()
    wait(9.5)
    TW1:Play()
    wait(0.5)
	workspace.Claim.RushNew.Anchored = false
	workspace.Claim.RushNew.CanCollide = false
    TW:Play()
    TW2:Play()
    wait(2)
    workspace.Claim:Destroy()
    death:Destroy()
    cue:Destroy()
end

entity.Debug.OnEntityDespawned = function()
    print("Entity has despawned:")
end

entity.Debug.OnEntityStartMoving = function()
    print("Entity has started moving:")
end

entity.Debug.OnEntityFinishedRebound = function()
    print("Entity has finished rebound:")
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("Entity:", "has entered room:",room)
end

entity.Debug.OnLookAtEntity = function()
    print("Player has looked at entity:")
end

entity.Debug.OnDeath = function()
    warn("Player has died.")
    death:Play()
end

------------------------

-- Run the created entity
Spawner.runEntity(entity)
