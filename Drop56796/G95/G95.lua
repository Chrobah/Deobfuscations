--[[
    G95.lua  —  organised by minimarchbleeding
    Original : Drop56796/G95  ->  G95.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua, https://raw.githubusercontent.com/Drop56796/G95-Achievement/main/G95.lua
--]]

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

local entity = spawner.Create({
	Entity = {
		Name = "G-95",
		Asset = "rbxassetid://17366360698=true",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 1
		},
		Shatter = true,
		Repair = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 750,
		Delay = 3.5,
		Reversed = false
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 1,
		Max = 4,
		Delay = 0.8
	},
	Damage = {
		Enabled = true,
		Range = 40,
		Amount = 125
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"You died of G95.", "It have Different", "Please Hide!", "Good Luck!!"},
		Cause = "G-95"
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
	local Reboundcolor = Instance.new("ColorCorrectionEffect",game.Lighting) game.Debris:AddItem(Reboundcolor,24)
                Reboundcolor.Name = "Warn"
                Reboundcolor.TintColor = Color3.fromRGB(1500, 2500, 1500) Reboundcolor.Saturation = -0.5 Reboundcolor.Contrast = 0.9
                game.TweenService:Create(Reboundcolor,TweenInfo.new(15),{TintColor = Color3.fromRGB(255, 255, 250),Saturation = 0, Contrast = 0}):Play()
	local TweenService = game:GetService("TweenService")
	local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(5),{TintColor = Color3.fromRGB(255, 255, 255)})
	local cue2 = Instance.new("Sound")
	cue2.Parent = game.Workspace
	cue2.Name = "Spawn"
	cue2.SoundId = "rbxassetid://2022892964"
	cue2.Volume = 3
	cue2.PlaybackSpeed = 0.5
	cue2:Play()
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

entity:SetCallback("OnReachNode", function(node)
	print("Entity has reached node:", node)
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

entity:SetCallback("OnDespawned", function()
    wait(2.5)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/G95-Achievement/main/G95.lua"))()
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		
		local Jumpscare = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Rush2 = Instance.new("ImageLabel")
local ambush = Instance.new("ImageLabel")
local UIScale = Instance.new("UIScale")

local Scream = Instance.new("Sound")
Scream.Parent = game.Workspace
Scream.Name = "jump"
Scream.SoundId = "rbxassetid://6459610652"
Scream.Volume = 1

--Properties:

Jumpscare.Name = "Jumpscare"
Jumpscare.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Jumpscare.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = Jumpscare
Frame.BackgroundColor3 = Color3.fromRGB(5, 9, 6)
Frame.Position = UDim2.new(0, 0, -0.122194529, 0)
Frame.Size = UDim2.new(1, 0, 1.25, 0)

Rush2.Name = "Rush2"
Rush2.Parent = Frame
Rush2.AnchorPoint = Vector2.new(0.5, 0.5)
Rush2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Rush2.BackgroundTransparency = 1.000
Rush2.Position = UDim2.new(0.5, 0, 0.5, 0)
Rush2.Size = UDim2.new(0.300000012, 0, 0.300000012, 0)
Rush2.Visible = false
Rush2.ZIndex = 50
Rush2.Image = "rbxassetid://17528112652"
Rush2.ScaleType = Enum.ScaleType.Fit

ambush.Name = "ambush"
ambush.Parent = Frame
ambush.AnchorPoint = Vector2.new(0.5, 0.5)
ambush.BackgroundColor3 = Color3.fromRGB(28, 0, 0)
ambush.BackgroundTransparency = 1.000
ambush.BorderSizePixel = 0
ambush.Position = UDim2.new(0.5, 0, 0.5, 0)
ambush.Size = UDim2.new(0, 300, 0, 300)
ambush.ZIndex = 5
ambush.Image = "rbxassetid://17528112652"
ambush.ImageTransparency = 1.000
ambush.ScaleType = Enum.ScaleType.Fit

UIScale.Parent = Jumpscare

-- Scripts:

local function YEHQ_fake_script() -- Jumpscare.LocalScript 
	local script = Instance.new('LocalScript', Jumpscare)

	local frame = script.Parent.Frame
	local Ambush = frame.ambush
	
	function colorFlash()
		wait(0.025)
		frame.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
		wait(0.025)
		frame.BackgroundColor3 = Color3.fromRGB(74, 0, 0)
		wait(0.025)
		frame.BackgroundColor3 = Color3.fromRGB(216, 0, 0)
		wait(0.025)
		frame.BackgroundColor3 = Color3.fromRGB(171, 31, 31)
		wait(0.025)
		frame.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
		wait(0.025)
		frame.BackgroundColor3 = Color3.fromRGB(74, 0, 0)
		wait(0.025)
		frame.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
		wait(0.025)
		frame.BackgroundColor3 = Color3.fromRGB(194, 28, 28)
	end
	
	function soundScream()
		Scream:Play()
	end
	
	for i = 1, 1 do
		frame.Visible = true
		wait(math.random(1, 2)/200)
		Ambush.ImageTransparency = 0
		Ambush:TweenPosition(UDim2.new(0.491, 0, 0.486, 0), nil, nil, 0.0175) --Down
		wait(0.0175)
		Ambush:TweenPosition(UDim2.new(0.5, 0, 0.475, 0), nil, nil, 0.0175) --Left
		wait(math.random(1, 2)/20)
		Ambush:TweenSize(UDim2.new(0, 100, 0, 100), nil, nil, 0.0175)
		soundScream()
		for i = 1, math.random(1, 5) do
			Ambush:TweenPosition(UDim2.new(0.49, 0, 0.486, 0), nil, nil, 0.0175) --Down
			wait(0.0175)
			Ambush:TweenPosition(UDim2.new(0.5, 0, 0.475, 0), nil, nil, 0.0175) --Left
			wait(0.0175)
			Ambush:TweenPosition(UDim2.new(0.492, 0, 0.465, 0), nil, nil, 0.0175) --Up
			wait(0.0175)
			Ambush:TweenPosition(UDim2.new(0.52, 0, 0.495, 0), nil, nil, 0.0175) --Right
			wait(0.0175)
			Ambush:TweenPosition(UDim2.new(0.487, 0, 0.475, 0), nil, nil, 0.0175) --Middle
			wait(0.0175)
			Ambush:TweenPosition(UDim2.new(0.495, 0, 0.465, 0), nil, nil, 0.0175) --Up
			wait(0.0175)
			Ambush:TweenPosition(UDim2.new(0.487, 0, 0.48, 0), nil, nil, 0.0175) --Middle
		end
		Ambush:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), nil, nil, 0.0175)
		Ambush.Size = (UDim2.new(0, 150, 0, 150))
		wait(.15)
		Ambush:TweenSize(UDim2.new(0, 4000, 0, 4000), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 1, false)
		frame.BackgroundColor3 = Color3.fromRGB(38, 0, 0)
		wait(1.2)
		--script.Parent.Scream:Play()
		frame.Visible = false
	end
end
coroutine.wrap(YEHQ_fake_script)()

	else
		print("Entity has damaged the player")
	end
end)

entity:Run()
-- entity:Pause()
-- entity:Resume()
-- entity:IsPaused()
-- entity:Despawn()
