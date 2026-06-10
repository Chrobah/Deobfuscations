--[[
    Extreme.lua  —  reconstructed source by minimarchbleeding
    Original : Drop56796/FRAGMENTED-MODE-V1  ->  Extreme.lua
    Protection : MoonSec V3  (devirtualised via instrumented VM run)

    Best-effort reconstruction from the protector's decoded constant pool:
    strings, asset ids, signals and services are genuine; local names and
    exact control flow are inferred.
--]]

local Debris = game:GetService("Debris")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")

local UXY1EAxZ = loadstring(game:HttpGet("https://pastebin.com/raw/uXY1EAxZ"))()
local Dread = loadstring(game:HttpGet("https://raw.githubusercontent.com/Brololto/Dreadentity/main/Dread"))()
local Source = loadstring(game:HttpGet("https://raw.githubusercontent.com/Check6969/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()  -- Doors Entity Spawner (RegularVynixu)
local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/MuhXd/DoorSuff/main/OtherSuff/DoorEntitySpawn%2BSource"))()
local Source2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()  -- Doors Entity Spawner (RegularVynixu)
local Source3 = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

local Models = {
    ["G-95Remastered-1"] = "https://github.com/Brololto/ExtremeModeG-95/blob/main/G-95Remastered-1.rbxm?raw=true",
    ["enrager_terroror"] = "https://github.com/Brololto/NEWENRAGEDTERRORHARDCORE/blob/main/enrager_terroror.rbxm?raw=true",
    ["BRAIN_DAMAGED_TRAUMA"] = "https://github.com/Brololto/NEWV2/blob/main/BRAIN_DAMAGED_TRAUMA.rbxm?raw=true",
    ["specimen_2_remodel_fixed"] = "https://github.com/Brololto/NEWV2/blob/main/specimen_2_remodel_fixed.rbxm?raw=true",
    ["Cycle"] = "https://github.com/Check6969/Utilities/blob/main/Models/Cycle.rbxm?raw=true",
    ["A-60Epic"] = "https://github.com/Tinkgy111/9/blob/main/A-60Epic.rbxm?raw=true",
    ["wgipxdssdd"] = "https://github.com/Tinkgy111/SAIMA/blob/main/wgipxdssdd.rbxm?raw=true",
    ["V-88"] = "https://github.com/Tonkgy836/Iwannasuckadickbitchyougotwih/blob/main/V-88.rbxm?raw=true",
}

local Captions = {
    "But he gives you a little bit of time so use that for you Advantage.",
    "Credits cheese tinkgy#8163, ThatOneGuyRuben#5083 NormalBaran#3131 shuy1#3817 ThatOneAmyestCreature sandwich#9943",
    "Don't Get Caught",
    "Encounter G-95",
    "Encounter Trauma",
    "Entity finished rebound:",
    "Entity has despawned:",
    "Entity has finished rebound:",
    "Entity has spawned:",
    "Entity has started moving:",
    "Extreme mode Loaded",
    "He can sense you with sound.",
    "He is supposed to come after rush, to try to mimic him.",
    "He rebounds 3 times",
    "He rebounds each door you open",
    "Hide As Soon As Possible if heard.",
    "Hide Fast.",
    "Hide in a closet or bed as quickly as possible!",
    "His presence is known when you start to hear whispers.",
    "His scream can let you Know hes coming, Hide quickly when he does this.",
    "I have told You What to do",
    "It seems like Template is causing quite the ruckus...",
    "Player has died.",
    "Player has looked at entity:",
    "Player to Entity Collision (None hiding Point):",
    "Screames Of the Dammed.",
    "The Gloomy Darkness",
    "The Whispers Are Everywhere And you cant escape it.",
    "This entity is fast and quick",
    "This file was protected with MoonSec V3 by federal9999 on discord",
    "Time Ticks",
    "Try your best to not move at all.",
    "Use what you have learned from Rush!",
    "YOU JUST HAVE A SKILL ISSUE",
    "You Died To A Unknown Entity Called Whisperer..",
    "You Died To Trauma",
    "You Died to Cycle",
    "You Died to Rebound",
    "You Have Been Caught By Hunger...",
    "You Have To Run From This Entity To survive, so run when he spawns.",
    "You are blacklisted from my script lol",
    "You can",
    "You died to G-95",
    "You died to Silence",
    "You died to Specimen 2",
    "You died.",
    "You have died to Admiration..",
    "You need to stop moving to avoid it",
}

local Entities = {"Rush", "Silence", "Figure", "Hide", "Void"}
for _, name in ipairs(Entities) do
    Source.runEntity({ Name = name })
end

Source.Changed:Connect(function(entity)
        -- inferred
end)
Source.OnClientEvent:Connect(function(entity)
        -- inferred
end)
Source.OnDeath:Connect(function(entity)
        -- inferred
end)
Source.OnEntityDespawned:Connect(function(entity)
        -- inferred
end)
Source.OnEntityEnteredRoom:Connect(function(entity)
        -- inferred
end)
Source.OnEntityFinishedRebound:Connect(function(entity)
        -- inferred
end)
Source.OnEntityMoving:Connect(function(entity)
        -- inferred
end)
Source.OnEntitySpawned:Connect(function(entity)
        -- inferred
end)
Source.OnEntityStartMoving:Connect(function(entity)
        -- inferred
end)
Source.OnLookAtEntity:Connect(function(entity)
        -- inferred
end)
