--[[
    something.lua  —  organised by minimarchbleeding
    Original : Drop56796/Something  ->  something.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/Drop56796/Psychotic-mode/main/Speed.lua, https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua, https://raw.githubusercontent.com/Drop56796/Sound/main/Sound.lua
--]]

loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Psychotic-mode/main/Speed.lua"))()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

local cue2 = Instance.new("Sound")
	cue2.Parent = game.Workspace
	cue2.Name = "Sound"
	cue2.SoundId = "rbxasset://rSCroarove.mp3"
	cue2.Volume = 2
	cue2.PlaybackSpeed = 1
	cue2:Play()
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Psychotic Mode",true)
wait(3.5)

require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Make By Darkness and catminetry",true)
wait(3.5)

require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Good luck Hacker",true)
wait(3.5)

---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Bad Hacker exeute it",
    Desc = "YOU ARE DIED",
    Reason = "Crazy mode is exeute",
    Image = "rbxassetid://12583460254"
})

loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Sound/main/Sound.lua"))()
game.StarterGui:SetCore( "ChatMakeSystemMessage",  { Text = "script in the hotel. The Mode made by Darkness / catminetry / other person", Color = Color3.fromRGB( 0,255,0 ), Font = nothingactually, FontSize = Enum.FontSize.Size24 } )
