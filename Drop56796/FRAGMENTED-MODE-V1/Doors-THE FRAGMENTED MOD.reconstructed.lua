--[[
    Doors-THE FRAGMENTED MOD.lua  —  reconstructed source by minimarchbleeding
    Original : Drop56796/FRAGMENTED-MODE-V1  ->  Doors-THE FRAGMENTED MOD.lua
    Protection : MoonSec V3  (devirtualised via instrumented VM run)

    Best-effort reconstruction from the protector's decoded constant pool:
    strings, asset ids, signals and services are genuine; local names and
    exact control flow are inferred.
--]]

local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local Workspace = game:GetService("Workspace")

local Module2jGDebMa = loadstring(game:HttpGet("https://pastebin.com/raw/2jGDebMa"))()
local Module3MQdLzRN = loadstring(game:HttpGet("https://pastebin.com/raw/3MQdLzRN"))()
local Module3XUYviNG = loadstring(game:HttpGet("https://pastebin.com/raw/3XUYviNG"))()
local Module6brG9uma = loadstring(game:HttpGet("https://pastebin.com/raw/6brG9uma"))()
local AqnRKe9D = loadstring(game:HttpGet("https://pastebin.com/raw/AqnRKe9D"))()
local CSxijQ9d = loadstring(game:HttpGet("https://pastebin.com/raw/CSxijQ9d"))()
local Fbm8qtgx = loadstring(game:HttpGet("https://pastebin.com/raw/Fbm8qtgx"))()
local HnGPaGKN = loadstring(game:HttpGet("https://pastebin.com/raw/HnGPaGKN"))()
local Khcc1a60 = loadstring(game:HttpGet("https://pastebin.com/raw/Khcc1a60"))()
local LTsHHmQm = loadstring(game:HttpGet("https://pastebin.com/raw/LTsHHmQm"))()
local SfuSXLr2 = loadstring(game:HttpGet("https://pastebin.com/raw/SfuSXLr2"))()
local TVi4UQB3 = loadstring(game:HttpGet("https://pastebin.com/raw/TVi4UQB3"))()
local W8vgi6uQ = loadstring(game:HttpGet("https://pastebin.com/raw/W8vgi6uQ"))()
local HkDB3Xk9 = loadstring(game:HttpGet("https://pastebin.com/raw/hkDB3Xk9"))()
local TLrtSaHh = loadstring(game:HttpGet("https://pastebin.com/raw/tLrtSaHh"))()
local XUPRE2iU = loadstring(game:HttpGet("https://pastebin.com/raw/xUPRE2iU"))()
local Greedy = loadstring(game:HttpGet("https://raw.githubusercontent.com/Potato032/Entt/main/Greedy"))()
local Plssss = loadstring(game:HttpGet("https://raw.githubusercontent.com/Potato032/Recreation/main/plssss"))()
local Source = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()  -- Doors Entity Spawner (RegularVynixu)
local Source2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()
local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/check78/Entities/main/blunt.txt"))()

local Captions = {
    "All Drafted",
    "At the end of the Depths.",
    "Call Of The Flame",
    "Chasing Through Everything",
    "Credits to Vynixus, Oof, NotChrono, DreamysDead and people who made models. (Also thanks Toasty)",
    "Death Of Night",
    "Dont Blink Your Eyes",
    "Encounter Blaze.",
    "Encounter Blink.",
    "Encounter Delusion.",
    "Encounter Depth.",
    "Encounter Draft.",
    "Encounter Dread.",
    "Encounter Espectro.",
    "Encounter Greed.",
    "Encounter Hungered.",
    "Encounter Insult.",
    "Encounter Moron.",
    "Encounter Muddle in The Library.",
    "Encounter Noise.",
    "Encounter Struggle.",
    "Entity will not spawn",
    "Give Me Your Soul",
    "Hard Situation",
    "Hey! Look at me!",
    "Hide or you will suffer.",
    "Im just reading a book.",
    "Its cold here.",
    "Lack Of Looking",
    "Lets speed this up!",
    "Now I need glasses.",
    "Red light, green light!",
    "Script has already been executed.",
    "The time has come...",
    "This file was protected with MoonSec V3 by Federal#9999",
    "Too Deep",
    "Unexpected Disaster",
    "What is this?",
    "You Dont Know",
    "You need to execute this script before door 1!",
    "You need to look at me...",
    "You need to wait more than that...",
    "You should run or hide..?",
}

local Entities = {"Depth", "Eyes", "Hide"}
for _, name in ipairs(Entities) do
    Source.runEntity({ Name = name })
end

Source.Changed:Connect(function(entity)
        -- inferred
end)
Source.OnClientEvent:Connect(function(entity)
        -- inferred
end)
