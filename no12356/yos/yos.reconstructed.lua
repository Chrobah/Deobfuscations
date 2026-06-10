--[[
    yos.lua  —  reconstructed source by minimarchbleeding
    Original : no12356/yos  ->  yos
    Protection : MoonSec V3
        layer 1 : outer loader VM
        layer 2 : inner VM
        layer 3 : the real program — superoperator bytecode

    The framework URLs, entity models, asset ids, signal names, services, captions
    and badge ids below were recovered from the devirtualised constant pool. Entity
    tunables and the exact handler bodies are inferred for readability — DOORS bytecode
    does not store local names. A custom-entity mod built on RegularVynixu's spawner.
--]]

local Players          = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService     = game:GetService("TweenService")
local StarterGui       = game:GetService("StarterGui")
local Lighting         = game:GetService("Lighting")

local Spawner   = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()
local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local Creator   = loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/CometV4/main/Misc/CustomCreator.lua"))()

local Models = {
    ["A-50"]  = "https://github.com/ChronoAccelerator/CometRestorationPortalFullOfEntitiesAndStuffYes/blob/main/A-50.rbxm?raw=true",
    ["Nerd"]  = "https://github.com/ChronoAccelerator/CometRestorationPortalFullOfEntitiesAndStuffYes/blob/main/Nerd.rbxm?raw=true",
    ["Train"] = "https://github.com/ChronoAccelerator/CometRestorationPortalFullOfEntitiesAndStuffYes/blob/main/Train.rbxm?raw=true",
    ["Smiler"] = "https://github.com/PABMAXICHAC/doors-monsters-models/blob/main/Smiler.rbxm?raw=true",
    ["Depth"] = "https://github.com/sponguss/storage/raw/main/depth.rbxm",
}

local function caption(text)
    firesignal(ReplicatedStorage.EntityInfo.Caption.OnClientEvent, text)
end

local function unlock(badgeId)
    firesignal(getgenv().AchievementUnlock, badgeId) -- (* achievement table inferred *)
end

-- the roster the program registers with the spawner
local Entities = {
    { Name = "Ambush",  Caption = "Encounter And Survive Harder Ambush",            Rebounds = true },
    { Name = "Rush",    Caption = "Encounter And Survive Nightmare Rush for the first time" },
    { Name = "Depth",   Caption = "Depth is faster then ambush and rush please dnt die", Freeze = true },
    { Name = "Smiler",  Caption = "Encounter and Survive Smiler" },
    { Name = "Silence", Caption = "Encounter Silence" },
    { Name = "Baller",  Caption = "Don't get hit by Baller" },
}

for _, entity in ipairs(Entities) do
    Spawner.runEntity({
        Name  = entity.Name,
        Model = Models[entity.Name],
    })
end

Spawner.OnEntitySpawned:Connect(function(entity)
    for _, def in ipairs(Entities) do
        if def.Name == entity.Name then
            caption(def.Caption)
        end
    end
end)

Spawner.OnEntityStartMoving:Connect(function(entity)
    if entity.Name == "Depth" then
        local cc = Instance.new("ColorCorrectionEffect")
        cc.Brightness, cc.Contrast = -0.1, 0.2
        cc.Parent = Lighting
        caption("Depth freezing")
    end
end)

Spawner.OnEntityFinishedRebound:Connect(function()
    caption("And it rebounds a tad bit more!")
end)

Spawner.OnLookAtEntity:Connect(function(entity)
    if entity.Name == "Smiler" then
        caption("Don't Smile pls")
    end
end)

Spawner.OnEntityDespawned:Connect(function() end)

Spawner.OnDeath:Connect(function(killer)
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text  = "Better luck next-time... player..",
        Color = Color3.fromRGB(255, 60, 60),
    })
    if killer == "Smiler" then
        caption("Encounter And Dont Survive Smiler")
    end
end)
