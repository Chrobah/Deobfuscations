--[[
    Hub.lua  —  organised by minimarchbleeding
    Original : Drop56796/Fluxus-HUB  ->  Hub.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/Drop56796/Psychotic-mode/main/0.lua, https://raw.githubusercontent.com/munciseek/Scriptmode/main/Extreme
--]]

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Fluxus Hub", HidePremium = false, SaveConfig = false, IntroText = "Welcome back", ConfigFolder = "Welcome Back"})

local Tab = Window:MakeTab({
    Name = "Announcement",
    Icon = "rbxassetid://12583460254",
    PremiumOnly = false
})

Tab:AddParagraph("Made By","seek")
Tab:AddParagraph("Game","..game.GameId..")
Tab:AddParagraph("Executor","..identifyexecutor()..")
Tab:AddParagraph("You username","..game.Players.LocalPlayer.Name..")
Tab:AddLabel("This Script is free")

local Tab = Window:MakeTab({
	Name = "Doors",
	Icon = "rbxassetid://12583460254",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "Psychotic mode",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Psychotic-mode/main/0.lua"))()
  end
})

Tab:AddButton({
  Name = "Extreme mode",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/munciseek/Scriptmode/main/Extreme"))()
  end
})

Tab:AddButton({
  Name = "Hardcore mode by Jay",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Hardcore-Remake/main/Hardcore%20Remake(Made%20by%20Jay).lua))()
  end
})


