-- source: github.com/Drop56796/CreepyEyeHub  (mspaint2.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua  (491 bytes)

--[[
    This loadstring for Discord Inviter is now deprecated.
    Please resort to the new repository below to remain up to date:

    https://github.com/RegularVynixu/Discord-Inviter
]]--

local Inviter = loadstring(game:HttpGet("https://github.com/RegularVynixu/Discord-Inviter/raw/main/init.luau"))()

return {
    Join = function(invite: string)
        Inviter:Join(invite)
    end,
    Prompt = function(data: { name: string, invite: string })
        Inviter:Prompt(data)
    end
}

-- (nested) https://github.com/RegularVynixu/Discord-Inviter/raw/main/init.luau
-- [resolved CLEAN] https://github.com/RegularVynixu/Discord-Inviter/raw/main/init.luau  (7577 bytes)
