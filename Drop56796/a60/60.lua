--[[
    60.lua  —  organised by minimarchbleeding
    Original : Drop56796/a60  ->  60.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua, https://raw.githubusercontent.com/Drop56796/n/main/n.lua, https://raw.githubusercontent.com/Drop56796/Guided-/main/Guided.lua
--]]

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

local entity = spawner.Create({
	Entity = {
		Name = "Super A-60",
		Asset = "https://github.com/Drop56796/public/blob/main/Super%20A-60%20V4.rbxm?raw=true",
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
		Values = {1.5, 20, 0.1, 1} 
	},
	Movement = {
		Speed = 350,
		Delay = 4,
		Reversed = false
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", 
		Min = 1,
		Max = 8,
		Delay = 0
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
		Type = "Guiding", 
		Hints = {"You die to Super A-60..", "it's fast to neer you...", "use what you learn from Ambush..", "Wait,you won't see it..", "Good luck!"},
		Cause = "Super A-60"
	}
})

---====== Debug entity ======---

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
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
    wait(3)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/n/main/n.lua"))()
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		
        local A60 = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local UIScale = Instance.new("UIScale")
local cue2 = Instance.new("Sound")
local sddb = Instance.new("EchoSoundEffect")
local sd = Instance.new("ReverbSoundEffect")
sd.Parent = cue2
sd.DecayTime = 1.5
sd.Archivable = true
sd.Density = 1
sd.Diffusion = 1
sd.DryLevel = -6
sd.Enabled = true
sd.Priority = 0
sd.WetLevel = 0
sd.Name = "haha"

sddb.Parent = cue2
sddb.Delay = 1
sddb.Feedback = 0.5
sddb.Priority = 0
sddb.WetLevel = 0
sddb.DryLevel = 0
sddb.Enabled = true
sddb.Archivable = true
sddb.Name = "hahaha"


cue2.Parent = game.Workspace
cue2.Name = "jumpsound"
cue2.SoundId = "rbxassetid://6459610652"
cue2.Volume = 5
cue2.PlaybackSpeed = 1
cue2.Looped = true
cue2:Play()

A60.Name = "A60"
A60.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
A60.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = A60
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(197, 0, 0)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(2, 0, 2, 0)
Frame.ZIndex = 50

ImageLabel.Parent = Frame
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.Position = UDim2.new(0.490973324, 0, 0.476232767, 0)
ImageLabel.Size = UDim2.new(0.403061181, 0, 0.629644573, 0)
ImageLabel.ZIndex = 51
ImageLabel.Image = "rbxassetid://12145554242"
ImageLabel.ScaleType = Enum.ScaleType.Fit

UIScale.Parent = A60

local function HPVZT_fake_script() 
	local script = Instance.new('LocalScript', ImageLabel)

	local ImageLabel = script.Parent
	local face = {"a1", "a2", "a3", "a4", "a5", "a6"}
	cue2:Play()
	for i, v in pairs(face) do
		wait(0)
		ImageLabel.Image = "rbxassetid://12145554242"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145534911"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599498"
		wait(0)
		ImageLabel.Image = "rbxassetid://12155335619"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599275"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145598814"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145554242"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145534911"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599498"
		wait(0)
		ImageLabel.Image = "rbxassetid://12155335619"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599275"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145598814"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145554242"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145534911"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599498"
		wait(0)
		ImageLabel.Image = "rbxassetid://12155335619"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599275"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145598814"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145554242"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145534911"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599498"
		wait(0)
		ImageLabel.Image = "rbxassetid://12155335619"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599275"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145598814"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145554242"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145598814"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145554242"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145534911"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599498"
		wait(0)
		ImageLabel.Image = "rbxassetid://12155335619"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599275"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145598814"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145554242"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145598814"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145554242"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145534911"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599498"
		wait(0)
		ImageLabel.Image = "rbxassetid://12155335619"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599275"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145598814"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145554242"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145598814"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145554242"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145534911"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599498"
		wait(0)
		ImageLabel.Image = "rbxassetid://12155335619"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145599275"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145598814"
		wait(0)
		ImageLabel.Image = "rbxassetid://12145554242"
		wait(0.2)
		cue2:Destroy()
	Frame.Visible = false
		A60:Remove()
	end
	
	
	
end
coroutine.wrap(HPVZT_fake_script)()

	else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Guided-/main/Guided.lua"))()
	end
end)

entity:Run()
