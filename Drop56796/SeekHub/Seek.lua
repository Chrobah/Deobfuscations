--[[
    Seek.lua  —  organised by minimarchbleeding
    Original : Drop56796/SeekHub  ->  Seek.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/TheoTheEpic/AquaLib/main/AquaLib.lua, https://raw.githubusercontent.com/Drop56796/Highlight/main/H.lua, https://raw.githubusercontent.com/Eazvy/UILibs/main/ESP/Bluwu/Example
--]]

local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/TheoTheEpic/AquaLib/main/AquaLib.lua'))()

local window = lib.createWindow("SeekHub V1", "TestWindow", true) -- lib.createWindow(title, name, draggable)
local tab1 = window.createTab("Main") -- window.createTab(name)
local textbox = section1.createTextBox("bruh", "bruh")
section1.createText("...")
tab1.createButton("Highlight", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Highlight/main/H.lua"))()
end)
tab1.createButton("Create Notification", function() 
	window.notification("Test Notification", "Hello World")
end)
tab1.createSlider("Speed", {defualt = 5, max = 10, min = 1}, function(value)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)
tab1.createSlider("Fov", {defualt = 10, max = 20, min = 1}, function(value)
	game.Players.LocalPlayer.Character.Humanoid.Fov = value
end)
tab1.createButton("Player ESP", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Eazvy/UILibs/main/ESP/Bluwu/Example"))()
end)
