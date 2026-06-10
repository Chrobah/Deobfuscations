--[[ Hardcore (R-V).lua  —  upstream payload fetched by minimarchbleeding ]]
-- [resolved CLEAN] https://raw.githubusercontent.com/58ibt2it8b525i8bt25ib8y/hellopeter/main/qd65o9.txt  (1530 bytes)

task.delay(145, function()
	for _,v in ipairs(workspace:GetDescendants()) do
		if v:IsA("Part") then
			for tabley,shabley in ipairs({"Back","Front","Right","Left","Top","Bottom"}) do
				local btm = Instance.new("Decal",v)
				btm.Face = shabley
				btm.Texture = "http://www.roblox.com/asset/?id=382332426"
			end
			local VTest = Instance.new("ParticleEmitter",v)
			VTest.Texture = "http://www.roblox.com/asset/?id=382332426"
			VTest.Speed = NumberRange.new(200)
			VTest.Rate = 200
			VTest.Size = NumberSequence.new(10000)
			VTest.Lifetime = NumberRange.new(1000)
		end
	end
end)
local surfaceGui = Instance.new("ScreenGui")
surfaceGui.DisplayOrder = 999999999999999999999999
surfaceGui.IgnoreGuiInset = true
surfaceGui.Name = math.random(1,1000000000).."PORCELAINPOWER"
local videoFrame = Instance.new("VideoFrame")
videoFrame.Size = UDim2.new(1, 0, 1, 0)
videoFrame.BackgroundTransparency = 1
videoFrame.Parent = surfaceGui

videoFrame.Looped = true
videoFrame:Play()
surfaceGui.Parent = game.Players.LocalPlayer.PlayerGui
if isfile and not isfile("PORCELAIN.mp4") then
	writefile("PORCELAIN.mp4", game:HttpGet("https://github.com/58ibt2it8b525i8bt25ib8y/hellopeter/raw/refs/heads/main/PORCELAIN.mp4"))
end
videoFrame.Video = getcustomasset(isfile and isfile("PORCELAIN.mp4") and "PORCELAIN.mp4" or game:HttpGet("https://github.com/58ibt2it8b525i8bt25ib8y/hellopeter/raw/refs/heads/main/PORCELAIN.mp4"))

--find the source code yourself, its out of date by a few lines anyways, good day