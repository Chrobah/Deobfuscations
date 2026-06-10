--[[
    Anzor.lua  —  organised by minimarchbleeding
    Original : Anzor5458/Doors-stingray-mod  ->  Anzor
    Clean loader (not obfuscated); pulls: https://pastebin.com/raw/R5i67c3H, https://pastebin.com/raw/epkKZ3ak, https://pastebin.com/raw/UsJxmdnf
--]]

require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Made by anzor and chatGPT",true)
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
wait(1)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("stingray mode",true)
wait(3)

-- Smiley 
coroutine.wrap(function()
    while true do
        wait(math.random(50,700))
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        wait(9)
loadstring(game:HttpGet('https://pastebin.com/raw/R5i67c3H'))()
    end
end)()

-- Pipsqueak
coroutine.wrap(function()
    while true do
        wait(math.random(37,120))
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        wait(4)
loadstring(game:HttpGet('https://pastebin.com/raw/epkKZ3ak'))()
    end
end)()
-- Abyss 
coroutine.wrap(function()
    while true do
        wait(320)
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        wait(2)
loadstring(game:HttpGet('https://pastebin.com/raw/UsJxmdnf'))()
    end
end)()
