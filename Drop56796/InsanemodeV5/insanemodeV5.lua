--[[
    insanemodeV5.lua  —  organised by minimarchbleeding
    Original : Drop56796/InsanemodeV5  ->  insanemodeV5.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/Drop56796/InsanemodeV5/main/G95.lua, https://raw.githubusercontent.com/Drop56796/InsanemodeV5/main/Sprint.lua, https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Door%20Replication/Source.lua, https://raw.githubusercontent.com/Jahani-john/mayhem-mode/main/mayhemmode-main/loader.lua
--]]

-- G95
coroutine.wrap(function()
    while true do
        wait(math.random(150,250))
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        wait(0.3)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/InsanemodeV5/main/G95.lua"))()
    end
end)()

-- Set initial properties for MainColorCorrection to make the scene darker
game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(128, 128, 128)
game.Lighting.MainColorCorrection.Contrast = 0.5
game.Lighting.MainColorCorrection.Saturation = -0.4
loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/InsanemodeV5/main/Sprint.lua"))()

-- Credits to Miguel, SatisfiedBucket, cherrypath
		local Candle = game:GetObjects("rbxassetid://6715358554")[1]
		Candle.Parent = game.Players.LocalPlayer.Backpack
		Candle.Light.Light.Color = Color3.fromRGB(235, 167, 98);
		Candle.Light.Shadow.Color = Color3.fromRGB(235, 167, 98);
		Candle.Light.Light.Brightness = 1
		Candle.Light.Shadow.Brightness = 1.1
		local plr = game.Players.LocalPlayer.Character.Humanoid
local on = false  Candle.Activated:Connect(function() 	if on == false then 		on = true 		Candle.Light.Shadow.Enabled = true 		Candle.Light.Light.Enabled = true 		Candle.Light.Sound:Play() 		Candle.Front.SurfaceLight.Enabled = true 	elseif on == true then 		on = false 		Candle.Light.Shadow.Enabled = false 		Candle.Light.Light.Enabled = false 		Candle.Light.Sound2:Play() 		Candle.Front.SurfaceLight.Enabled = false 	end end)
		local AnimIdle = Instance.new("Animation")
		AnimIdle.AnimationId = "rbxassetid://507768375"
		AnimIdle.Name = "holyf"
		AnimIdle.Parent = Candle
		local track = plr.Animator:LoadAnimation(AnimIdle)
		track.Looped = true
Candle.Equipped:Connect(function()
	track:Play()
end)
Candle.Unequipped:Connect(function()
	track:Stop()
end)
local Camera = game.Workspace.CurrentCamera
local RS = game:GetService("RunService")
RS.RenderStepped:Connect(function(step)
    Candle.Light.CFrame = Candle.Light.CFrame:lerp(Camera.CFrame, .25)
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Door%20Replication/Source.lua"))()

require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Insane mode Initiated",true)
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Created by figure",true)
wait(3)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Fix by Darkness",true)
wait(3)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("For the sake of the game experience, please do not use destructive scripts",true)
wait(3)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Start playing. Good luck!",true)
loadstring(game:HttpGet('https://raw.githubusercontent.com/Jahani-john/mayhem-mode/main/mayhemmode-main/loader.lua'))()
