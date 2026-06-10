-- source: github.com/Drop56796/Gun  (Hub.lua)
-- [resolved WTF] https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua — deobfuscating target:

-- (remote WTF target; constants not extractable here)

-- ========================================

-- source: github.com/Drop56796/Gun  (Hub.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/Big-Head/main/Head.lua  (1324 bytes)

--//Settings
local Settings =  
{Size = 8}

--//Services
local Players = game:GetService("Players")

--//Variables
local LocalPlayer = Players.LocalPlayer

--//Functions
function Alive(player)
    if player then
        return player.Character and player.Character:FindFirstChild("Head") and player.Character:FindFirstChild("Humanoid") or false
    end
    return false
end

for i,v in pairs(Players:GetPlayers()) do
    if v ~= LocalPlayer and Alive(v) then
        v.Character.Head.Massless = true
        v.Character.Head.Size = Vector3.new(Settings.Size, Settings.Size, Settings.Size)
    end
    v.CharacterAdded:Connect(function()
        while not Alive(v) do wait() end
        v.Character.Head.Massless = true
        v.Character.Head.Size = Vector3.new(Settings.Size, Settings.Size, Settings.Size)
    end)
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Wait()
    if Alive(player) then
        player.Character.Head.Massless = true
        player.Character.Head.Size = Vector3.new(Settings.Size, Settings.Size, Settings.Size)
    end
    
    player.CharacterAdded:Connect(function()
        while not Alive(player) do wait() end
        player.Character.Head.Massless = true
        player.Character.Head.Size = Vector3.new(Settings.Size, Settings.Size, Settings.Size)
    end)
end)


-- ========================================

-- source: github.com/Drop56796/Gun  (Hub.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Eazvy/UILibs/main/ESP/Bluwu/Example  (745 bytes)

local Players = game:GetService("Players")
local ESP = loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-ESP-Library-9570", true))("there are cats in your walls let them out let them out let them out")

--SYNAPSE ONLY
--[[
"How do we add overrides like in kiriot's esp?"

function ESP:GetTeamColor()
   return Color3.new(0, 0, 1)
end
]]

for i, Player in next, Players:GetPlayers() do
   ESP.Object:New(ESP:GetCharacter(Player))
   ESP:CharacterAdded(Player):Connect(function(Character)
       ESP.Object:New(Character)
   end)
end

Players.PlayerAdded:Connect(function(Player)
   ESP.Object:New(ESP:GetCharacter(Player))
   ESP:CharacterAdded(Player):Connect(function(Character)
       ESP.Object:New(Character)
   end)
end)

-- (nested) https://rawscripts.net/raw/Universal-Script-ESP-Library-9570
-- [target unavailable] https://rawscripts.net/raw/Universal-Script-ESP-Library-9570
--   __FETCH_ERROR__ HTTP Error 404: Not Found
