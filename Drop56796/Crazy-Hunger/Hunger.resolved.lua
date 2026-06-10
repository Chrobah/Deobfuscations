-- source: github.com/Drop56796/Crazy-Hunger  (Hunger.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua  (636 bytes)

--[[
    This loadstring for DOORS Entity Spawner V2 is now deprecated.
    Please use the new loadstring below to remain up to date:

    https://raw.githubusercontent.com/RegularVynixu/DOORS-Entity-Spawner/main/init.luau
]]--

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Entity-Spawner-V2/main/init.luau"))()

local Module = {
    Create = function(config: any): any?
        return Spawner:Create(config)
    end,
    Run = function(entity: any)
        Spawner:Run(entity, false)
    end
}

getgenv().vynixu_SpawnerLoaded = getgenv()._internal_vynixu_entity_spawner

return Module

-- (nested) https://raw.githubusercontent.com/RegularVynixu/DOORS-Entity-Spawner-V2/main/init.luau
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/DOORS-Entity-Spawner-V2/main/init.luau  (38470 bytes)


-- ========================================

-- source: github.com/Drop56796/Crazy-Hunger  (Hunger.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/Hunger-Achievement/main/Hunger%20Achievement.lua  (401 bytes)

---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Give me you soul",
    Desc = "I'm Hunger of you",
    Reason = "Survive the Hunger",
    Image = "rbxassetid://10969362005"
})

-- (nested) https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua  (664 bytes)


-- ========================================

-- source: github.com/Drop56796/Crazy-Hunger  (Hunger.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/Guided-/main/Guided.lua  (187 bytes)

local cue2 = Instance.new("Guided")
	cue2.Parent = game.Workspace
	cue2.Name = "Sound"
	cue2.SoundId = "rbxassetid://11144635480"
	cue2.Volume = 1
	cue2.PlaybackSpeed = 0.75
	cue2:Play()
