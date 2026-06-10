-- source: github.com/Drop56796/De  (De.lua)
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

-- source: github.com/Drop56796/De  (De.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua  (664 bytes)

--[[
    This loadstring for DOORS Custom Achievements is now deprecated.
    Please use the new loadstring below to remain up to date:

    https://raw.githubusercontent.com/RegularVynixu/DOORS-Custom-Achievements/main/init.luau
]]--

local CustomAchievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Custom-Achievements/main/init.luau"))()

return function(info: any)
    CustomAchievements:Grant({
        Identifier = "TestAchievement",
        Title = info.Title,
        Desc = info.Desc,
        Reason = info.Reason,
        Image = info.Image
    }, {
        CheckOwned = false,
        Remember = false
    })
end
-- (nested) https://raw.githubusercontent.com/RegularVynixu/DOORS-Custom-Achievements/main/init.luau
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/DOORS-Custom-Achievements/main/init.luau  (3364 bytes)
