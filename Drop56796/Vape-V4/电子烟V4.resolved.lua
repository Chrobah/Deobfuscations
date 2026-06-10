-- source: github.com/Drop56796/Vape-V4  (电子烟V4.lua)
-- [resolved CLEAN] https://github.com/MuhXd/Roblox-mobile-script/blob/main/VapeWave4.lua?raw=true  (799 bytes)


-- credits to 7GrandDadPGN for vape v4.
loadstring(game:HttpGet("https://raw.githubusercontent.com/MuhXd/Roblox-mobile-script/main/FileFixes.lua"))();
loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()

task.spawn(function()
    local teleportConnection = game.Players.LocalPlayer.OnTeleport:Connect(function(State)
        if (not teleportedServers) then
    local queueonteleport = syn and syn.queue_on_teleport or queue_on_teleport or function() end
        queueonteleport([[
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            loadstring(game:HttpGet("https://github.com/MuhXd/Roblox-mobile-script/blob/main/VapeWave4.lua?raw=true"))();
        ]])
    end
    end)
end)

-- (nested) https://raw.githubusercontent.com/MuhXd/Roblox-mobile-script/main/FileFixes.lua
-- [resolved MoonSec V3] https://raw.githubusercontent.com/MuhXd/Roblox-mobile-script/main/FileFixes.lua — deobfuscating target:

-- (nested) https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua  (2029 bytes)
