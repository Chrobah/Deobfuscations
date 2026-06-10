-- source: github.com/Drop56796/Sound  (Sound.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/su/main/p.lua  (1363 bytes)

local cue2 = Instance.new("Sound")
	cue2.Parent = game.Workspace
	cue2.Name = "Sound"
	cue2.SoundId = "rbxassetid://1546975842"
	cue2.Volume = 2
	cue2.PlaybackSpeed = 0.400001
	cue2:Play()

local tip = Instance.new("ScreenGui")
tip.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
tip.Name = "占位付"

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(100, 0, 200, 0)
Frame.Position = UDim2.new(0.5, 0, 0.05, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundTransparency = 1
Frame.Parent = tip

local textLabel = Instance.new("TextLabel")
textLabel.Text = "The Forbiddens..."
textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
textLabel.Size = UDim2.new(100, 0, 10, 20)
textLabel.Position = UDim2.new(0.50, 0, 0.5, 0)
textLabel.Font = "Oswald"
textLabel.TextColor3 = Color3.new(255, 222, 189)
textLabel.BackgroundTransparency = 1
textLabel.Parent = Frame
textLabel.TextScaled = true
textLabel.TextSize = 2000

local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local tween = game:GetService("TweenService"):Create(textLabel, tweenInfo, {TextTransparency = 0})
tween:Play()

wait(2)

local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local tween = game:GetService("TweenService"):Create(textLabel, tweenInfo, {TextTransparency = 1})
tween:Play()

wait(5)
tip:Destroy()
