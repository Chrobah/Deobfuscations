-- source: github.com/Drop56796/Corruption-mode  (Corruption mode.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/Corruption-mode/main/hunger.lua  (2592 bytes)

---====== Define spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "Hungerd",
    Model = "https://github.com/PABMAXICHAC/doors-monsters-models/blob/main/hunger.rbxm?raw=true",
    Speed = 600,
    MoveDelay = 0.25,
    HeightOffset = 0,
    CanKill = true,
    KillRange = 45,
    SpawnInFront = false,
    ShatterLights = true,
    FlickerLights = {
        Enabled = true,
        Duration = 0
    },
    Cycles = {
        Min = 1,
        Max = 7,
        Delay = 0.25
    },
    CamShake = {
        Enabled = true,
        Values = {1.5, 20, 0.1, 1},
        Range = 100
    },
    ResistCrucifix = false,
    BreakCrucifix = true,
    DeathMessage = {"You Died of hungerd", "He is faster than you", "Good luck", "...", "..."},
    IsCuriousLight = false
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
    local cue2 = Instance.new("Sound")
	    cue2.Parent = game.Workspace
	    cue2.Name = "Spawn"
	    cue2.SoundId = "rbxassetid://9125712561"
	    cue2.Volume = 9999
	    cue2.PlaybackSpeed = 1
	    cue2:Play()
end

entity.Debug.OnEntityDespawned = function()
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("...",true)
    ---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Give me you soul",
    Desc = "I'm Hunger of you",
    Reason = "Survive the Hunger",
    Image = "rbxassetid://18455691826"
})
end

entity.Debug.OnEntityStartMoving = function()
    print("Entity started moving")
end

entity.Debug.OnEntityFinishedRebound = function()
    print("Entity finished rebound")
end

entity.Debug.OnEntityEnteredRoom = function(room)
    print("Entity entered room:", room)
end

entity.Debug.OnLookAtEntity = function()
    print("Player looking at entity")
end

entity.Debug.OnDeath = function()
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("...",true)
end

--[[
    NOTE: By overwriting 'OnUseCrucifix', the default crucifixion will be ignored and this function will be called instead

    entity.Debug.OnUseCrucifix = function()
        print("Custom crucifixion script here")
    end
]]--

---====== Run entity ======---

Spawner.runEntity(entity)

-- (nested) https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua  (94782 bytes)

-- (nested) https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua  (664 bytes)


-- ========================================

-- source: github.com/Drop56796/Corruption-mode  (Corruption mode.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/Corruption-mode/main/enity.lua  (1992 bytes)

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "Depth",
    Model = "https://github.com/Nicolaspenteado/Depth/blob/main/depth2.rbxm?raw=true",
    Speed = 300,
    MoveDelay = 0.25,
    HeightOffset = 2.5,
    CanKill = true,
    KillRange = 65,
    SpawnInFront = false,
    ShatterLights = true,
    FlickerLights = {
        Enabled = true,
        Duration = 1
    },
    Cycles = {
        Min = 1,
        Max = 4,
        Delay = 0.25
    },
    CamShake = {
        Enabled = true,
        Values = {1.5, 20, 0.1, 1},
        Range = 100
    },
    ResistCrucifix = false,
    BreakCrucifix = true,
    DeathMessage = {"You died of Depth", "How", "Don't look it", "Because you can die", "Good luck"},
    IsCuriousLight = false
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Hide Quickly! it is come",true)
end

entity.Debug.OnEntityDespawned = function()
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("it is be away",true)
end

entity.Debug.OnEntityStartMoving = function()
    print("Entity started moving")
end

entity.Debug.OnEntityFinishedRebound = function()
    print("Entity finished rebound")
end

entity.Debug.OnEntityEnteredRoom = function(room)
    print("Entity entered room:", room)
end

entity.Debug.OnLookAtEntity = function()
    print("Player looking at entity")
end

entity.Debug.OnDeath = function()
    print("Player has died")
end

--[[
    NOTE: By overwriting 'OnUseCrucifix', the default crucifixion will be ignored and this function will be called instead

    entity.Debug.OnUseCrucifix = function()
        print("Custom crucifixion script here")
    end
]]--

---====== Run entity ======---

Spawner.runEntity(entity)

-- (nested) https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua  (94782 bytes)


-- ========================================

-- source: github.com/Drop56796/Corruption-mode  (Corruption mode.lua)
-- [resolved CLEAN] https://github.com/Drop56796/Corruption-mode/blob/main/G95.lua?raw=true  (3906 bytes)

---====== Define spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "G95",
    Model = "https://github.com/catminetry/G95-V1/blob/main/G95.rbxm?raw=true",
    Speed = 600,
    MoveDelay = 9,
    HeightOffset = 0,
    CanKill = true,
    KillRange = 65,
    SpawnInFront = false,
    ShatterLights = false,
    FlickerLights = {
        Enabled = false,
        Duration = 0
    },
    Cycles = {
        Min = 1,
        Max = 1,
        Delay = 0
    },
    CamShake = {
        Enabled = true,
        Values = {1.5, 20, 0.1, 1},
        Range = 100
    },
    ResistCrucifix = false,
    BreakCrucifix = true,
    DeathMessage = {"You Died of hungerd", "He is faster than you", "Good luck", "...", "..."},
    IsCuriousLight = false
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
    local cue2 = Instance.new("Sound")
cue2.Parent = game.Workspace
cue2.Name = "Spawn"
cue2.SoundId = "rbxassetid://9125713501"
cue2.Volume = 15
cue2:Play()
local MainColorCorrection = game.Lighting.MainColorCorrection
MainColorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
MainColorCorrection.Contrast = 0.2
MainColorCorrection.Saturation = -0.7

-- Get the TweenService
local TweenService = game:GetService("TweenService")

-- Create and play the tween for Contrast
local contrastTween = TweenService:Create(
    MainColorCorrection,
    TweenInfo.new(3),
    {Contrast = 0}
)
contrastTween:Play()

-- Create and play the tween for Saturation
local saturationTween = TweenService:Create(
    MainColorCorrection,
    TweenInfo.new(3),
    {Saturation = 0}
)
saturationTween:Play()

-- Create and play the tween for TintColor to change it to normal red
local colorTween = TweenService:Create(
    MainColorCorrection,
    TweenInfo.new(3),
    {TintColor = Color3.fromRGB(255, 0, 0)} -- Normal red color
)
colorTween:Play()

-- Wait for the colorTween to complete
colorTween.Completed:Wait()

local resetTween = TweenService:Create(
    MainColorCorrection,
    TweenInfo.new(5),
    {
        TintColor = Color3.fromRGB(255, 255, 255), -- No color filter
        Contrast = 0,                               -- Default contrast
        Saturation = 0                              -- Default saturation
    }
)
resetTween:Play()	
end

entity.Debug.OnEntityDespawned = function()
local sound = Instance.new("Sound")
	sound.Parent = game.Workspace
	sound.Name = "Sound"
	sound.SoundId = "rbxassetid://1837829565"
	sound.Volume = 10
	sound.PlaybackSpeed = 1
	sound:Play()
    wait(4)
    ---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Scared of Scream Face For you",
    Desc = "Don't be to slow",
    Reason = "Encountered G95.",
    Image = "rbxassetid://3457898957"
})
end

entity.Debug.OnEntityStartMoving = function()
    print("Entity started moving")
end

entity.Debug.OnEntityFinishedRebound = function()
    print("Entity finished rebound")
end

entity.Debug.OnEntityEnteredRoom = function(room)
    print("Entity entered room:", room)
end

entity.Debug.OnLookAtEntity = function()
    print("Player looking at entity")
end

entity.Debug.OnDeath = function()
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("...",true)
end

--[[
    NOTE: By overwriting 'OnUseCrucifix', the default crucifixion will be ignored and this function will be called instead

    entity.Debug.OnUseCrucifix = function()
        print("Custom crucifixion script here")
    end
]]--

---====== Run entity ======---

Spawner.runEntity(entity)

-- (nested) https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua  (94782 bytes)

-- (nested) https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua  (664 bytes)


-- ========================================

-- source: github.com/Drop56796/Corruption-mode  (Corruption mode.lua)
-- [resolved CLEAN] https://pastebin.com/raw/2SAwkPLt  (52213 bytes)

if game:GetService("ReplicatedStorage").GameData.Floor.Value == "Hotel" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Mines" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Garden" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Fools" then
 
if game.Workspace:FindFirstChild("SeekMovingNewClone") or game.Workspace:FindFirstChild("SeekMoving") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("FigureSetup") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_NestHandler") or game.ReplicatedStorage.GameData.LatestRoom.Value == 51 or game.ReplicatedStorage.GameData.LatestRoom.Value == 52 or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Assets:FindFirstChild("ShopProps") or game.ReplicatedStorage.GameData.LatestRoom.Value == 90 or game.ReplicatedStorage.GameData.LatestRoom.Value == 91 or game.ReplicatedStorage.GameData.LatestRoom.Value == 92 or game.ReplicatedStorage.GameData.LatestRoom.Value == 93 or game.ReplicatedStorage.GameData.LatestRoom.Value == 94 or game.ReplicatedStorage.GameData.LatestRoom.Value ==  95 or game.ReplicatedStorage.GameData.LatestRoom.Value == 96 or game.ReplicatedStorage.GameData.LatestRoom.Value == 97 or game.ReplicatedStorage.GameData.LatestRoom.Value == 98 or game.ReplicatedStorage.GameData.LatestRoom.Value == 99 or game.ReplicatedStorage.GameData.LatestRoom.Value == 100 or game.Workspace:FindFirstChild("EyestalkMoving") or  game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_MillHandler") then
	return
end
 
end

local ColorCorrection = Instance.new("ColorCorrectionEffect", game.Lighting)
ColorCorrection.TintColor = Color3.fromRGB(61, 98, 171)
ColorCorrection.Contrast = 0.2
ColorCorrection.Saturation = -0.5
local tween = game:GetService("TweenService")
tween:Create(ColorCorrection, TweenInfo.new(5), {Contrast = 0}):Play()
tween:Create(ColorCorrection, TweenInfo.new(5), {Saturation = 0}):Play()
local TweenService = game:GetService("TweenService")
local TW = TweenService:Create(ColorCorrection, TweenInfo.new(5),{TintColor = Color3.fromRGB(255, 255, 255)})
TW:Play()
local cue1 = Instance.new("Sound")
cue1.Parent = game.Workspace
cue1.Name = "Scream"
cue1.SoundId = "rbxassetid://9114397505"
local distort = Instance.new("DistortionSoundEffect")
distort.Parent = cue1
distort.Level = 1
local distort2 = Instance.new("DistortionSoundEffect")
distort2.Parent = cue1
distort2.Level = 1
local pitch = Instance.new("PitchShiftSoundEffect")
pitch.Parent = cue1
pitch.Octave = 0.5
local pitch2 = Instance.new("PitchShiftSoundEffect")
pitch2.Parent = cue1
pitch2.Octave = 0.5
local pitch3 = Instance.new("PitchShiftSoundEffect")
pitch3.Parent = cue1
pitch3.Octave = 0.5
cue1.Volume = 0.1
cue1:Play()
local cue2 = Instance.new("Sound")
cue2.Parent = game.Workspace
cue2.Name = "Spawn"
cue2.SoundId = "rbxassetid://9114221327"
cue2.Volume = 3
cue2:Play()
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
	camara.CFrame = camara.CFrame * shakeCf
end)
camShake:Start()
camShake:ShakeOnce(10,3,0.1,6,2,0.5)
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
function GetGitSound(GithubSnd,SoundName)
	local url=GithubSnd
	if not isfile(SoundName..".mp3") then
		writefile(SoundName..".mp3", game:HttpGet(url))
	end
	local sound=Instance.new("Sound")
	sound.SoundId=(getcustomasset or getsynasset)(SoundName..".mp3")
	return sound
end
wait(2.8)
---====== Load spawner ======---
 
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---
 
local entity = spawner.Create({
	Entity = {
		Name = "Rebound",
		Asset = "rbxassetid://13499570750",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 0.5
		},
		Shatter = false,
		Repair = false,
		ColorCorrection = {
		    Enabled = false,
		    Color = Color3.fromRGB(255, 0, 0), -- Color3.new
		    CameraShake = {10, 5, 2, 5}, -- Magnitude, Roughness, FadeIn, FadeOut
		    Sound = {
		        SoundId = "rbxassetid://0",
		        Volume = 1
		    },
		    Duration = 5,
		    FadeIn = 1,
		    FadeOut = 2
		}
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 125,
		Delay = 2,
		Reversed = true
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 0.5,
		Max = 1,
		Delay = 3.5
	},
	Damage = {
		Enabled = true,
		Range = 100,
		Amount = 75,
		Withered = false, -- If true, it take damages to MaxHealth (1~inf)
		Random = {
		    Enabled = false,
		    Min = 1,
		    Max = 200
		}
	},
	Jumpscare = {
	    Enabled = false,
	    Face = "rbxassetid://0",
	    FacePosition = UDim2.new(0.5, 0, 0.5, 0),
	    FaceSize = UDim2.new(0, 150, 0, 150),
	    BackgroundColor = Color3.new(1, 1, 1), -- Color3.fromRGB
	    BackgroundColor2 = Color3.new(0, 0, 0), -- Color3.fromRGB
	    Sound = "rbxassetid://0",
	    SoundVolume = 5
	},
	Achievements = {
	    Survive = {
	        Enabled = false,
	        Once = false,
	        Title = "Survive Title",
	        Desc = "Survive Description",
	        Reason = "Survive Reason",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = true,
                    Amount = 1
                },
                Knobs = {
                    Visible = true,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Crucifix = {
	        Enabled = true,
	        Once = true,
	        Title = "Go away",
	        Desc = "Don't respawn, thanks!",
	        Reason = "Use crucifix against Rebound",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Death = {
	        Enabled = false,
	        Once = false,
	        Title = "Death Title",
	        Desc = "Death Description",
	        Reason = "Death Reason",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    }
	},
	Crucifixion = {
	    Type = "Guiding", -- "Curious"
		Enabled = true,
		Range = 10,
		Resist = false,
		Break = true
	},
	Death = {
	    IsolationFloors = false,
		Type = "Guiding", -- "Curious"
		Hints = {"You died to Rebound", "It's appears at the next door and has a chance to stay there or run back to the latest door", "He will come back few times after his initial spawn so hide every next door until it is safe..."}, -- *Required!
        Cause = "Rebound",
        Floors = {
            Hotel = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Mines = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        },
        Subfloors = {
            Backdoor = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Rooms = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Outdoors = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        }
	}
})
 
---====== Debug entity ======---
 
entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
    local move = GetGitSound("https://github.com/check78/worldcuuuup/blob/main/DoomBegin.mp3?raw=true","Rebound")
    move.Parent = workspace.Rebound.Rebound
    move.Volume = 0
local vroom = TweenService:Create(move, TweenInfo.new(1),{Volume = 8.5})
    vroom:Play()
	move:Play()
if game.ReplicatedStorage:WaitForChild("LiveModifiers"):FindFirstChild("VoiceActing") then
local bruh = Instance.new("Sound", workspace.Rebound.Rebound)
bruh.SoundId = "rbxassetid://16947609217"
bruh.Volume = 0
bruh.Looped = true

local TweenService = game:GetService("TweenService")
local volume = TweenService:Create(bruh, TweenInfo.new(2),{Volume = 1})

volume:Play()

bruh:Play()

end

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 0.7
shift.Parent = bruh

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = bruh
distort.Level = 1
wait(8.5)
    local arrival = Instance.new("Sound")
    arrival.Name = "ReboundArrival"
    arrival.Parent = workspace.Rebound.Rebound
    arrival.SoundId = "rbxassetid://18920812603"
    arrival.Volume = 8.5
    arrival:Play()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
end)
 
entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)
 
entity:SetCallback("OnReachNode", function(node)
    print("Entity has reached node\nName: ".. node.Name.. "\nPosition: ".. node.Position)
if game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetAttribute("RawName") == "HaltHallway" then
entity.Config.Damage.Enabled = false
end
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
    print("Entity has despawned")
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if game:GetService("ReplicatedStorage").GameData.Floor.Value == "Hotel" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Mines" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Garden" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Fools" then
 
if game.Workspace:FindFirstChild("SeekMovingNewClone") or game.Workspace:FindFirstChild("SeekMoving") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("FigureSetup") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_NestHandler") or game.ReplicatedStorage.GameData.LatestRoom.Value == 51 or game.ReplicatedStorage.GameData.LatestRoom.Value == 52 or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Assets:FindFirstChild("ShopProps") or game.ReplicatedStorage.GameData.LatestRoom.Value == 90 or game.ReplicatedStorage.GameData.LatestRoom.Value == 91 or game.ReplicatedStorage.GameData.LatestRoom.Value == 92 or game.ReplicatedStorage.GameData.LatestRoom.Value == 93 or game.ReplicatedStorage.GameData.LatestRoom.Value == 94 or game.ReplicatedStorage.GameData.LatestRoom.Value ==  95 or game.ReplicatedStorage.GameData.LatestRoom.Value == 96 or game.ReplicatedStorage.GameData.LatestRoom.Value == 97 or game.ReplicatedStorage.GameData.LatestRoom.Value == 98 or game.ReplicatedStorage.GameData.LatestRoom.Value == 99 or game.ReplicatedStorage.GameData.LatestRoom.Value == 100 or game.Workspace:FindFirstChild("EyestalkMoving") or  game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_MillHandler") then
	return
end
 
end
---====== Load spawner ======---
 
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---
 
local entity = spawner.Create({
	Entity = {
		Name = "Rebound",
		Asset = "rbxassetid://13499570750",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 0.5
		},
		Shatter = false,
		Repair = false,
		ColorCorrection = {
		    Enabled = false,
		    Color = Color3.fromRGB(255, 0, 0), -- Color3.new
		    CameraShake = {10, 5, 2, 5}, -- Magnitude, Roughness, FadeIn, FadeOut
		    Sound = {
		        SoundId = "rbxassetid://0",
		        Volume = 1
		    },
		    Duration = 5,
		    FadeIn = 1,
		    FadeOut = 2
		}
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 125,
		Delay = 2,
		Reversed = true
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 0.5,
		Max = 1,
		Delay = 3.5
	},
	Damage = {
		Enabled = true,
		Range = 100,
		Amount = 75,
		Withered = false, -- If true, it take damages to MaxHealth (1~inf)
		Random = {
		    Enabled = false,
		    Min = 1,
		    Max = 200
		}
	},
	Jumpscare = {
	    Enabled = false,
	    Face = "rbxassetid://0",
	    FacePosition = UDim2.new(0.5, 0, 0.5, 0),
	    FaceSize = UDim2.new(0, 150, 0, 150),
	    BackgroundColor = Color3.new(1, 1, 1), -- Color3.fromRGB
	    BackgroundColor2 = Color3.new(0, 0, 0), -- Color3.fromRGB
	    Sound = "rbxassetid://0",
	    SoundVolume = 5
	},
	Achievements = {
	    Survive = {
	        Enabled = false,
	        Once = false,
	        Title = "Survive Title",
	        Desc = "Survive Description",
	        Reason = "Survive Reason",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = true,
                    Amount = 1
                },
                Knobs = {
                    Visible = true,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Crucifix = {
	        Enabled = true,
	        Once = true,
	        Title = "Go away",
	        Desc = "Don't respawn, thanks!",
	        Reason = "Use crucifix against Rebound",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Death = {
	        Enabled = false,
	        Once = false,
	        Title = "Death Title",
	        Desc = "Death Description",
	        Reason = "Death Reason",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    }
	},
	Crucifixion = {
	    Type = "Guiding", -- "Curious"
		Enabled = true,
		Range = 10,
		Resist = false,
		Break = true
	},
	Death = {
	    IsolationFloors = false,
		Type = "Guiding", -- "Curious"
		Hints = {"You died to Rebound", "It's appears at the next door and has a chance to stay there or run back to the latest door", "He will come back few times after his initial spawn so hide every next door until it is safe..."}, -- *Required!
        Cause = "Rebound",
        Floors = {
            Hotel = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Mines = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        },
        Subfloors = {
            Backdoor = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Rooms = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Outdoors = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        }
	}
})

---====== Debug entity ======---
 
entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
    local move = GetGitSound("https://github.com/check78/worldcuuuup/blob/main/DoomBegin.mp3?raw=true","Rebound")
    move.Parent = workspace.Rebound.Rebound
    move.Volume = 0
local vroom = TweenService:Create(move, TweenInfo.new(1),{Volume = 8.5})
    vroom:Play()
	move:Play()
wait(8.5)
    local arrival = Instance.new("Sound")
    arrival.Name = "ReboundArrival"
    arrival.Parent = workspace.Rebound.Rebound
    arrival.SoundId = "rbxassetid://18920812603"
    arrival.Volume = 8.5
    arrival:Play()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
end)
 
entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)
 
entity:SetCallback("OnReachNode", function(node)
    print("Entity has reached node\nName: ".. node.Name.. "\nPosition: ".. node.Position)
if game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetAttribute("RawName") == "HaltHallway" then
entity.Config.Damage.Enabled = false
end
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
    print("Entity has despawned")
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if game:GetService("ReplicatedStorage").GameData.Floor.Value == "Hotel" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Mines" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Garden" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Fools" then
 
if game.Workspace:FindFirstChild("SeekMovingNewClone") or game.Workspace:FindFirstChild("SeekMoving") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("FigureSetup") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_NestHandler") or game.ReplicatedStorage.GameData.LatestRoom.Value == 51 or game.ReplicatedStorage.GameData.LatestRoom.Value == 52 or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Assets:FindFirstChild("ShopProps") or game.ReplicatedStorage.GameData.LatestRoom.Value == 90 or game.ReplicatedStorage.GameData.LatestRoom.Value == 91 or game.ReplicatedStorage.GameData.LatestRoom.Value == 92 or game.ReplicatedStorage.GameData.LatestRoom.Value == 93 or game.ReplicatedStorage.GameData.LatestRoom.Value == 94 or game.ReplicatedStorage.GameData.LatestRoom.Value ==  95 or game.ReplicatedStorage.GameData.LatestRoom.Value == 96 or game.ReplicatedStorage.GameData.LatestRoom.Value == 97 or game.ReplicatedStorage.GameData.LatestRoom.Value == 98 or game.ReplicatedStorage.GameData.LatestRoom.Value == 99 or game.ReplicatedStorage.GameData.LatestRoom.Value == 100 or game.Workspace:FindFirstChild("EyestalkMoving") or  game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_MillHandler") then
	return
end
 
end
---====== Load spawner ======---
 
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---
 
local entity = spawner.Create({
	Entity = {
		Name = "Rebound",
		Asset = "rbxassetid://13499570750",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 0.5
		},
		Shatter = false,
		Repair = false,
		ColorCorrection = {
		    Enabled = false,
		    Color = Color3.fromRGB(255, 0, 0), -- Color3.new
		    CameraShake = {10, 5, 2, 5}, -- Magnitude, Roughness, FadeIn, FadeOut
		    Sound = {
		        SoundId = "rbxassetid://0",
		        Volume = 1
		    },
		    Duration = 5,
		    FadeIn = 1,
		    FadeOut = 2
		}
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 125,
		Delay = 2,
		Reversed = true
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 0.5,
		Max = 1,
		Delay = 3.5
	},
	Damage = {
		Enabled = true,
		Range = 100,
		Amount = 75,
		Withered = false, -- If true, it take damages to MaxHealth (1~inf)
		Random = {
		    Enabled = false,
		    Min = 1,
		    Max = 200
		}
	},
	Jumpscare = {
	    Enabled = false,
	    Face = "rbxassetid://0",
	    FacePosition = UDim2.new(0.5, 0, 0.5, 0),
	    FaceSize = UDim2.new(0, 150, 0, 150),
	    BackgroundColor = Color3.new(1, 1, 1), -- Color3.fromRGB
	    BackgroundColor2 = Color3.new(0, 0, 0), -- Color3.fromRGB
	    Sound = "rbxassetid://0",
	    SoundVolume = 5
	},
	Achievements = {
	    Survive = {
	        Enabled = false,
	        Once = false,
	        Title = "Survive Title",
	        Desc = "Survive Description",
	        Reason = "Survive Reason",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = true,
                    Amount = 1
                },
                Knobs = {
                    Visible = true,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Crucifix = {
	        Enabled = true,
	        Once = true,
	        Title = "Go away",
	        Desc = "Don't respawn, thanks!",
	        Reason = "Use crucifix against Rebound",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Death = {
	        Enabled = false,
	        Once = false,
	        Title = "Death Title",
	        Desc = "Death Description",
	        Reason = "Death Reason",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    }
	},
	Crucifixion = {
	    Type = "Guiding", -- "Curious"
		Enabled = true,
		Range = 10,
		Resist = false,
		Break = true
	},
	Death = {
	    IsolationFloors = false,
		Type = "Guiding", -- "Curious"
		Hints = {"You died to Rebound", "It's appears at the next door and has a chance to stay there or run back to the latest door", "He will come back few times after his initial spawn so hide every next door until it is safe..."}, -- *Required!
        Cause = "Rebound",
        Floors = {
            Hotel = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Mines = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        },
        Subfloors = {
            Backdoor = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Rooms = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Outdoors = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        }
	}
})
 
---====== Debug entity ======---
 
entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
    local move = GetGitSound("https://github.com/check78/worldcuuuup/blob/main/DoomBegin.mp3?raw=true","Rebound")
    move.Parent = workspace.Rebound.Rebound
    move.Volume = 0
local vroom = TweenService:Create(move, TweenInfo.new(1),{Volume = 8.5})
    vroom:Play()
	move:Play()
wait(8.5)
    local arrival = Instance.new("Sound")
    arrival.Name = "ReboundArrival"
    arrival.Parent = workspace.Rebound.Rebound
    arrival.SoundId = "rbxassetid://18920812603"
    arrival.Volume = 8.5
    arrival:Play()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
end)
 
entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)
 
entity:SetCallback("OnReachNode", function(node)
    print("Entity has reached node\nName: ".. node.Name.. "\nPosition: ".. node.Position)
if game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetAttribute("RawName") == "HaltHallway" then
entity.Config.Damage.Enabled = false
end
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
    print("Entity has despawned")
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if game:GetService("ReplicatedStorage").GameData.Floor.Value == "Hotel" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Mines" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Garden" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Fools" then
 
if game.Workspace:FindFirstChild("SeekMovingNewClone") or game.Workspace:FindFirstChild("SeekMoving") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("FigureSetup") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_NestHandler") or game.ReplicatedStorage.GameData.LatestRoom.Value == 51 or game.ReplicatedStorage.GameData.LatestRoom.Value == 52 or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Assets:FindFirstChild("ShopProps") or game.ReplicatedStorage.GameData.LatestRoom.Value == 90 or game.ReplicatedStorage.GameData.LatestRoom.Value == 91 or game.ReplicatedStorage.GameData.LatestRoom.Value == 92 or game.ReplicatedStorage.GameData.LatestRoom.Value == 93 or game.ReplicatedStorage.GameData.LatestRoom.Value == 94 or game.ReplicatedStorage.GameData.LatestRoom.Value ==  95 or game.ReplicatedStorage.GameData.LatestRoom.Value == 96 or game.ReplicatedStorage.GameData.LatestRoom.Value == 97 or game.ReplicatedStorage.GameData.LatestRoom.Value == 98 or game.ReplicatedStorage.GameData.LatestRoom.Value == 99 or game.ReplicatedStorage.GameData.LatestRoom.Value == 100 or  game.Workspace:FindFirstChild("EyestalkMoving") or  game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_MillHandler") then
	return
end
 
end
---====== Load spawner ======---
 
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---
 
local entity = spawner.Create({
	Entity = {
		Name = "Rebound",
		Asset = "rbxassetid://13499570750",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 0.5
		},
		Shatter = false,
		Repair = false,
		ColorCorrection = {
		    Enabled = false,
		    Color = Color3.fromRGB(255, 0, 0), -- Color3.new
		    CameraShake = {10, 5, 2, 5}, -- Magnitude, Roughness, FadeIn, FadeOut
		    Sound = {
		        SoundId = "rbxassetid://0",
		        Volume = 1
		    },
		    Duration = 5,
		    FadeIn = 1,
		    FadeOut = 2
		}
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 125,
		Delay = 2,
		Reversed = true
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 0.5,
		Max = 1,
		Delay = 3.5
	},
	Damage = {
		Enabled = true,
		Range = 100,
		Amount = 75,
		Withered = false, -- If true, it take damages to MaxHealth (1~inf)
		Random = {
		    Enabled = false,
		    Min = 1,
		    Max = 200
		}
	},
	Jumpscare = {
	    Enabled = false,
	    Face = "rbxassetid://0",
	    FacePosition = UDim2.new(0.5, 0, 0.5, 0),
	    FaceSize = UDim2.new(0, 150, 0, 150),
	    BackgroundColor = Color3.new(1, 1, 1), -- Color3.fromRGB
	    BackgroundColor2 = Color3.new(0, 0, 0), -- Color3.fromRGB
	    Sound = "rbxassetid://0",
	    SoundVolume = 5
	},
	Achievements = {
	    Survive = {
	        Enabled = true,
	        Once = false,
	        Title = "Constant Respawn",
	        Desc = "I'm coming for you!",
	        Reason = "Survive Rebound",
	        Image = "rbxassetid://101562510260261",
	        Prize = {
                Revives = {
                    Visible = true,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Crucifix = {
	        Enabled = true,
	        Once = true,
	        Title = "Go away",
	        Desc = "Don't respawn, thanks!",
	        Reason = "Use crucifix against Rebound",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Death = {
	        Enabled = false,
	        Once = false,
	        Title = "Death Title",
	        Desc = "Death Description",
	        Reason = "Death Reason",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    }
	},
	Crucifixion = {
	    Type = "Guiding", -- "Curious"
		Enabled = true,
		Range = 10,
		Resist = false,
		Break = true
	},
	Death = {
	    IsolationFloors = false,
		Type = "Guiding", -- "Curious"
		Hints = {"You died to Rebound", "It's appears at the next door and has a chance to stay there or run back to the latest door", "He will come back few times after his initial spawn so hide every next door until it is safe..."}, -- *Required!
        Cause = "Rebound",
        Floors = {
            Hotel = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Mines = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        },
        Subfloors = {
            Backdoor = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Rooms = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Outdoors = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        }
	}
})
 
---====== Debug entity ======---
 
entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
    local move = GetGitSound("https://github.com/check78/worldcuuuup/blob/main/DoomBegin.mp3?raw=true","Rebound")
    move.Parent = workspace.Rebound.Rebound
    move.Volume = 0
local vroom = TweenService:Create(move, TweenInfo.new(1),{Volume = 8.5})
    vroom:Play()
	move:Play()
wait(8.5)
    local arrival = Instance.new("Sound")
    arrival.Name = "ReboundArrival"
    arrival.Parent = workspace.Rebound.Rebound
    arrival.SoundId = "rbxassetid://18920812603"
    arrival.Volume = 8.5
    arrival:Play()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
end)
 
entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)
 
entity:SetCallback("OnReachNode", function(node)
    print("Entity has reached node\nName: ".. node.Name.. "\nPosition: ".. node.Position)
if game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetAttribute("RawName") == "HaltHallway" then
entity.Config.Damage.Enabled = false
end
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
    print("Entity has despawned")
end)
 
entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
local scare = Instance.new("Sound")
scare.Parent = game.Workspace
scare.Name = "MyEarsBurn"
scare.SoundId = "rbxassetid://852718837120"
scare.PlaybackSpeed = 3
scare.Volume = 1

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 0.7
shift.Parent = scare

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = scare
distort.Level = 1

local TweenService = game:GetService("TweenService")
local spookee = TweenService:Create(scare, TweenInfo.new(2),{Volume = 0})

scare:Play()

spookee:Play()
wait(2)
scare:Destroy()
	else
		print("Entity has damaged the player")
	end
end)
 
entity:SetCallback("OnCrucified", function(stateResist)
    print("Entity was crucified")
    task.wait(3)
	if stateResist == true then
	    print("Entity is resisting the crucifixion")
	else
		print("The entity has been breaking by the crucifixion")
	end
end)

--[[
 
DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.
 
entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)
 
]]--
 
---====== Run entity ======---
 
entity:Run()
end)
 
entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
local scare = Instance.new("Sound")
scare.Parent = game.Workspace
scare.Name = "MyEarsBurn"
scare.SoundId = "rbxassetid://852718837120"
scare.PlaybackSpeed = 3
scare.Volume = 1

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 0.7
shift.Parent = scare

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = scare
distort.Level = 1

local TweenService = game:GetService("TweenService")
local spookee = TweenService:Create(scare, TweenInfo.new(2),{Volume = 0})

scare:Play()

spookee:Play()
wait(2)
scare:Destroy()
	else
		print("Entity has damaged the player")
	end
end)
 
entity:SetCallback("OnCrucified", function(stateResist)
    print("Entity was crucified")
    task.wait(3)
	if stateResist == true then
	    print("Entity is resisting the crucifixion")
	else
		print("The entity has been breaking by the crucifixion")
	end
end)

--[[
 
DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.
 
entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)
 
]]--
 
---====== Run entity ======---
 
entity:Run()
end)
 
entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
local scare = Instance.new("Sound")
scare.Parent = game.Workspace
scare.Name = "MyEarsBurn"
scare.SoundId = "rbxassetid://852718837120"
scare.PlaybackSpeed = 3
scare.Volume = 1

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 0.7
shift.Parent = scare

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = scare
distort.Level = 1

local TweenService = game:GetService("TweenService")
local spookee = TweenService:Create(scare, TweenInfo.new(2),{Volume = 0})

scare:Play()

spookee:Play()
wait(2)
scare:Destroy()
	else
		print("Entity has damaged the player")
	end
end)
 
entity:SetCallback("OnCrucified", function(stateResist)
    print("Entity was crucified")
    task.wait(3)
	if stateResist == true then
	    print("Entity is resisting the crucifixion")
	else
		print("The entity has been breaking by the crucifixion")
	end
end)

--[[
 
DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.
 
entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)
 
]]--
 
---====== Run entity ======---
 
entity:Run()
end)
 
entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
local scare = Instance.new("Sound")
scare.Parent = game.Workspace
scare.Name = "MyEarsBurn"
scare.SoundId = "rbxassetid://852718837120"
scare.PlaybackSpeed = 3
scare.Volume = 1

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 0.7
shift.Parent = scare

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = scare
distort.Level = 1

local TweenService = game:GetService("TweenService")
local spookee = TweenService:Create(scare, TweenInfo.new(2),{Volume = 0})

scare:Play()

spookee:Play()
wait(2)
scare:Destroy()
	else
		print("Entity has damaged the player")
	end
end)
 
entity:SetCallback("OnCrucified", function(stateResist)
    print("Entity was crucified")
    task.wait(3)
	if stateResist == true then
	    print("Entity is resisting the crucifixion")
	else
		print("The entity has been breaking by the crucifixion")
	end
end)
 
--[[
 
DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.
 
entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)
 
]]--
 
---====== Run entity ======---
 
entity:Run()

cue2:Destroy()
cue1:Destroy()
ColorCorrection:Destroy()
-- (nested) https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua  (50681 bytes)

-- (nested) https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua  (50681 bytes)

-- (nested) https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua  (50681 bytes)


-- ========================================

-- source: github.com/Drop56796/Corruption-mode  (Corruption mode.lua)
-- [resolved CLEAN] https://pastebin.com/raw/2SAwkPLt  (52213 bytes)

if game:GetService("ReplicatedStorage").GameData.Floor.Value == "Hotel" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Mines" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Garden" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Fools" then
 
if game.Workspace:FindFirstChild("SeekMovingNewClone") or game.Workspace:FindFirstChild("SeekMoving") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("FigureSetup") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_NestHandler") or game.ReplicatedStorage.GameData.LatestRoom.Value == 51 or game.ReplicatedStorage.GameData.LatestRoom.Value == 52 or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Assets:FindFirstChild("ShopProps") or game.ReplicatedStorage.GameData.LatestRoom.Value == 90 or game.ReplicatedStorage.GameData.LatestRoom.Value == 91 or game.ReplicatedStorage.GameData.LatestRoom.Value == 92 or game.ReplicatedStorage.GameData.LatestRoom.Value == 93 or game.ReplicatedStorage.GameData.LatestRoom.Value == 94 or game.ReplicatedStorage.GameData.LatestRoom.Value ==  95 or game.ReplicatedStorage.GameData.LatestRoom.Value == 96 or game.ReplicatedStorage.GameData.LatestRoom.Value == 97 or game.ReplicatedStorage.GameData.LatestRoom.Value == 98 or game.ReplicatedStorage.GameData.LatestRoom.Value == 99 or game.ReplicatedStorage.GameData.LatestRoom.Value == 100 or game.Workspace:FindFirstChild("EyestalkMoving") or  game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_MillHandler") then
	return
end
 
end

local ColorCorrection = Instance.new("ColorCorrectionEffect", game.Lighting)
ColorCorrection.TintColor = Color3.fromRGB(61, 98, 171)
ColorCorrection.Contrast = 0.2
ColorCorrection.Saturation = -0.5
local tween = game:GetService("TweenService")
tween:Create(ColorCorrection, TweenInfo.new(5), {Contrast = 0}):Play()
tween:Create(ColorCorrection, TweenInfo.new(5), {Saturation = 0}):Play()
local TweenService = game:GetService("TweenService")
local TW = TweenService:Create(ColorCorrection, TweenInfo.new(5),{TintColor = Color3.fromRGB(255, 255, 255)})
TW:Play()
local cue1 = Instance.new("Sound")
cue1.Parent = game.Workspace
cue1.Name = "Scream"
cue1.SoundId = "rbxassetid://9114397505"
local distort = Instance.new("DistortionSoundEffect")
distort.Parent = cue1
distort.Level = 1
local distort2 = Instance.new("DistortionSoundEffect")
distort2.Parent = cue1
distort2.Level = 1
local pitch = Instance.new("PitchShiftSoundEffect")
pitch.Parent = cue1
pitch.Octave = 0.5
local pitch2 = Instance.new("PitchShiftSoundEffect")
pitch2.Parent = cue1
pitch2.Octave = 0.5
local pitch3 = Instance.new("PitchShiftSoundEffect")
pitch3.Parent = cue1
pitch3.Octave = 0.5
cue1.Volume = 0.1
cue1:Play()
local cue2 = Instance.new("Sound")
cue2.Parent = game.Workspace
cue2.Name = "Spawn"
cue2.SoundId = "rbxassetid://9114221327"
cue2.Volume = 3
cue2:Play()
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
	camara.CFrame = camara.CFrame * shakeCf
end)
camShake:Start()
camShake:ShakeOnce(10,3,0.1,6,2,0.5)
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
function GetGitSound(GithubSnd,SoundName)
	local url=GithubSnd
	if not isfile(SoundName..".mp3") then
		writefile(SoundName..".mp3", game:HttpGet(url))
	end
	local sound=Instance.new("Sound")
	sound.SoundId=(getcustomasset or getsynasset)(SoundName..".mp3")
	return sound
end
wait(2.8)
---====== Load spawner ======---
 
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---
 
local entity = spawner.Create({
	Entity = {
		Name = "Rebound",
		Asset = "rbxassetid://13499570750",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 0.5
		},
		Shatter = false,
		Repair = false,
		ColorCorrection = {
		    Enabled = false,
		    Color = Color3.fromRGB(255, 0, 0), -- Color3.new
		    CameraShake = {10, 5, 2, 5}, -- Magnitude, Roughness, FadeIn, FadeOut
		    Sound = {
		        SoundId = "rbxassetid://0",
		        Volume = 1
		    },
		    Duration = 5,
		    FadeIn = 1,
		    FadeOut = 2
		}
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 125,
		Delay = 2,
		Reversed = true
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 0.5,
		Max = 1,
		Delay = 3.5
	},
	Damage = {
		Enabled = true,
		Range = 100,
		Amount = 75,
		Withered = false, -- If true, it take damages to MaxHealth (1~inf)
		Random = {
		    Enabled = false,
		    Min = 1,
		    Max = 200
		}
	},
	Jumpscare = {
	    Enabled = false,
	    Face = "rbxassetid://0",
	    FacePosition = UDim2.new(0.5, 0, 0.5, 0),
	    FaceSize = UDim2.new(0, 150, 0, 150),
	    BackgroundColor = Color3.new(1, 1, 1), -- Color3.fromRGB
	    BackgroundColor2 = Color3.new(0, 0, 0), -- Color3.fromRGB
	    Sound = "rbxassetid://0",
	    SoundVolume = 5
	},
	Achievements = {
	    Survive = {
	        Enabled = false,
	        Once = false,
	        Title = "Survive Title",
	        Desc = "Survive Description",
	        Reason = "Survive Reason",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = true,
                    Amount = 1
                },
                Knobs = {
                    Visible = true,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Crucifix = {
	        Enabled = true,
	        Once = true,
	        Title = "Go away",
	        Desc = "Don't respawn, thanks!",
	        Reason = "Use crucifix against Rebound",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Death = {
	        Enabled = false,
	        Once = false,
	        Title = "Death Title",
	        Desc = "Death Description",
	        Reason = "Death Reason",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    }
	},
	Crucifixion = {
	    Type = "Guiding", -- "Curious"
		Enabled = true,
		Range = 10,
		Resist = false,
		Break = true
	},
	Death = {
	    IsolationFloors = false,
		Type = "Guiding", -- "Curious"
		Hints = {"You died to Rebound", "It's appears at the next door and has a chance to stay there or run back to the latest door", "He will come back few times after his initial spawn so hide every next door until it is safe..."}, -- *Required!
        Cause = "Rebound",
        Floors = {
            Hotel = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Mines = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        },
        Subfloors = {
            Backdoor = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Rooms = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Outdoors = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        }
	}
})
 
---====== Debug entity ======---
 
entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
    local move = GetGitSound("https://github.com/check78/worldcuuuup/blob/main/DoomBegin.mp3?raw=true","Rebound")
    move.Parent = workspace.Rebound.Rebound
    move.Volume = 0
local vroom = TweenService:Create(move, TweenInfo.new(1),{Volume = 8.5})
    vroom:Play()
	move:Play()
if game.ReplicatedStorage:WaitForChild("LiveModifiers"):FindFirstChild("VoiceActing") then
local bruh = Instance.new("Sound", workspace.Rebound.Rebound)
bruh.SoundId = "rbxassetid://16947609217"
bruh.Volume = 0
bruh.Looped = true

local TweenService = game:GetService("TweenService")
local volume = TweenService:Create(bruh, TweenInfo.new(2),{Volume = 1})

volume:Play()

bruh:Play()

end

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 0.7
shift.Parent = bruh

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = bruh
distort.Level = 1
wait(8.5)
    local arrival = Instance.new("Sound")
    arrival.Name = "ReboundArrival"
    arrival.Parent = workspace.Rebound.Rebound
    arrival.SoundId = "rbxassetid://18920812603"
    arrival.Volume = 8.5
    arrival:Play()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
end)
 
entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)
 
entity:SetCallback("OnReachNode", function(node)
    print("Entity has reached node\nName: ".. node.Name.. "\nPosition: ".. node.Position)
if game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetAttribute("RawName") == "HaltHallway" then
entity.Config.Damage.Enabled = false
end
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
    print("Entity has despawned")
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if game:GetService("ReplicatedStorage").GameData.Floor.Value == "Hotel" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Mines" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Garden" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Fools" then
 
if game.Workspace:FindFirstChild("SeekMovingNewClone") or game.Workspace:FindFirstChild("SeekMoving") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("FigureSetup") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_NestHandler") or game.ReplicatedStorage.GameData.LatestRoom.Value == 51 or game.ReplicatedStorage.GameData.LatestRoom.Value == 52 or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Assets:FindFirstChild("ShopProps") or game.ReplicatedStorage.GameData.LatestRoom.Value == 90 or game.ReplicatedStorage.GameData.LatestRoom.Value == 91 or game.ReplicatedStorage.GameData.LatestRoom.Value == 92 or game.ReplicatedStorage.GameData.LatestRoom.Value == 93 or game.ReplicatedStorage.GameData.LatestRoom.Value == 94 or game.ReplicatedStorage.GameData.LatestRoom.Value ==  95 or game.ReplicatedStorage.GameData.LatestRoom.Value == 96 or game.ReplicatedStorage.GameData.LatestRoom.Value == 97 or game.ReplicatedStorage.GameData.LatestRoom.Value == 98 or game.ReplicatedStorage.GameData.LatestRoom.Value == 99 or game.ReplicatedStorage.GameData.LatestRoom.Value == 100 or game.Workspace:FindFirstChild("EyestalkMoving") or  game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_MillHandler") then
	return
end
 
end
---====== Load spawner ======---
 
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---
 
local entity = spawner.Create({
	Entity = {
		Name = "Rebound",
		Asset = "rbxassetid://13499570750",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 0.5
		},
		Shatter = false,
		Repair = false,
		ColorCorrection = {
		    Enabled = false,
		    Color = Color3.fromRGB(255, 0, 0), -- Color3.new
		    CameraShake = {10, 5, 2, 5}, -- Magnitude, Roughness, FadeIn, FadeOut
		    Sound = {
		        SoundId = "rbxassetid://0",
		        Volume = 1
		    },
		    Duration = 5,
		    FadeIn = 1,
		    FadeOut = 2
		}
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 125,
		Delay = 2,
		Reversed = true
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 0.5,
		Max = 1,
		Delay = 3.5
	},
	Damage = {
		Enabled = true,
		Range = 100,
		Amount = 75,
		Withered = false, -- If true, it take damages to MaxHealth (1~inf)
		Random = {
		    Enabled = false,
		    Min = 1,
		    Max = 200
		}
	},
	Jumpscare = {
	    Enabled = false,
	    Face = "rbxassetid://0",
	    FacePosition = UDim2.new(0.5, 0, 0.5, 0),
	    FaceSize = UDim2.new(0, 150, 0, 150),
	    BackgroundColor = Color3.new(1, 1, 1), -- Color3.fromRGB
	    BackgroundColor2 = Color3.new(0, 0, 0), -- Color3.fromRGB
	    Sound = "rbxassetid://0",
	    SoundVolume = 5
	},
	Achievements = {
	    Survive = {
	        Enabled = false,
	        Once = false,
	        Title = "Survive Title",
	        Desc = "Survive Description",
	        Reason = "Survive Reason",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = true,
                    Amount = 1
                },
                Knobs = {
                    Visible = true,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Crucifix = {
	        Enabled = true,
	        Once = true,
	        Title = "Go away",
	        Desc = "Don't respawn, thanks!",
	        Reason = "Use crucifix against Rebound",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Death = {
	        Enabled = false,
	        Once = false,
	        Title = "Death Title",
	        Desc = "Death Description",
	        Reason = "Death Reason",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    }
	},
	Crucifixion = {
	    Type = "Guiding", -- "Curious"
		Enabled = true,
		Range = 10,
		Resist = false,
		Break = true
	},
	Death = {
	    IsolationFloors = false,
		Type = "Guiding", -- "Curious"
		Hints = {"You died to Rebound", "It's appears at the next door and has a chance to stay there or run back to the latest door", "He will come back few times after his initial spawn so hide every next door until it is safe..."}, -- *Required!
        Cause = "Rebound",
        Floors = {
            Hotel = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Mines = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        },
        Subfloors = {
            Backdoor = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Rooms = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Outdoors = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        }
	}
})

---====== Debug entity ======---
 
entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
    local move = GetGitSound("https://github.com/check78/worldcuuuup/blob/main/DoomBegin.mp3?raw=true","Rebound")
    move.Parent = workspace.Rebound.Rebound
    move.Volume = 0
local vroom = TweenService:Create(move, TweenInfo.new(1),{Volume = 8.5})
    vroom:Play()
	move:Play()
wait(8.5)
    local arrival = Instance.new("Sound")
    arrival.Name = "ReboundArrival"
    arrival.Parent = workspace.Rebound.Rebound
    arrival.SoundId = "rbxassetid://18920812603"
    arrival.Volume = 8.5
    arrival:Play()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
end)
 
entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)
 
entity:SetCallback("OnReachNode", function(node)
    print("Entity has reached node\nName: ".. node.Name.. "\nPosition: ".. node.Position)
if game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetAttribute("RawName") == "HaltHallway" then
entity.Config.Damage.Enabled = false
end
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
    print("Entity has despawned")
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if game:GetService("ReplicatedStorage").GameData.Floor.Value == "Hotel" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Mines" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Garden" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Fools" then
 
if game.Workspace:FindFirstChild("SeekMovingNewClone") or game.Workspace:FindFirstChild("SeekMoving") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("FigureSetup") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_NestHandler") or game.ReplicatedStorage.GameData.LatestRoom.Value == 51 or game.ReplicatedStorage.GameData.LatestRoom.Value == 52 or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Assets:FindFirstChild("ShopProps") or game.ReplicatedStorage.GameData.LatestRoom.Value == 90 or game.ReplicatedStorage.GameData.LatestRoom.Value == 91 or game.ReplicatedStorage.GameData.LatestRoom.Value == 92 or game.ReplicatedStorage.GameData.LatestRoom.Value == 93 or game.ReplicatedStorage.GameData.LatestRoom.Value == 94 or game.ReplicatedStorage.GameData.LatestRoom.Value ==  95 or game.ReplicatedStorage.GameData.LatestRoom.Value == 96 or game.ReplicatedStorage.GameData.LatestRoom.Value == 97 or game.ReplicatedStorage.GameData.LatestRoom.Value == 98 or game.ReplicatedStorage.GameData.LatestRoom.Value == 99 or game.ReplicatedStorage.GameData.LatestRoom.Value == 100 or game.Workspace:FindFirstChild("EyestalkMoving") or  game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_MillHandler") then
	return
end
 
end
---====== Load spawner ======---
 
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---
 
local entity = spawner.Create({
	Entity = {
		Name = "Rebound",
		Asset = "rbxassetid://13499570750",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 0.5
		},
		Shatter = false,
		Repair = false,
		ColorCorrection = {
		    Enabled = false,
		    Color = Color3.fromRGB(255, 0, 0), -- Color3.new
		    CameraShake = {10, 5, 2, 5}, -- Magnitude, Roughness, FadeIn, FadeOut
		    Sound = {
		        SoundId = "rbxassetid://0",
		        Volume = 1
		    },
		    Duration = 5,
		    FadeIn = 1,
		    FadeOut = 2
		}
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 125,
		Delay = 2,
		Reversed = true
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 0.5,
		Max = 1,
		Delay = 3.5
	},
	Damage = {
		Enabled = true,
		Range = 100,
		Amount = 75,
		Withered = false, -- If true, it take damages to MaxHealth (1~inf)
		Random = {
		    Enabled = false,
		    Min = 1,
		    Max = 200
		}
	},
	Jumpscare = {
	    Enabled = false,
	    Face = "rbxassetid://0",
	    FacePosition = UDim2.new(0.5, 0, 0.5, 0),
	    FaceSize = UDim2.new(0, 150, 0, 150),
	    BackgroundColor = Color3.new(1, 1, 1), -- Color3.fromRGB
	    BackgroundColor2 = Color3.new(0, 0, 0), -- Color3.fromRGB
	    Sound = "rbxassetid://0",
	    SoundVolume = 5
	},
	Achievements = {
	    Survive = {
	        Enabled = false,
	        Once = false,
	        Title = "Survive Title",
	        Desc = "Survive Description",
	        Reason = "Survive Reason",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = true,
                    Amount = 1
                },
                Knobs = {
                    Visible = true,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Crucifix = {
	        Enabled = true,
	        Once = true,
	        Title = "Go away",
	        Desc = "Don't respawn, thanks!",
	        Reason = "Use crucifix against Rebound",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Death = {
	        Enabled = false,
	        Once = false,
	        Title = "Death Title",
	        Desc = "Death Description",
	        Reason = "Death Reason",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    }
	},
	Crucifixion = {
	    Type = "Guiding", -- "Curious"
		Enabled = true,
		Range = 10,
		Resist = false,
		Break = true
	},
	Death = {
	    IsolationFloors = false,
		Type = "Guiding", -- "Curious"
		Hints = {"You died to Rebound", "It's appears at the next door and has a chance to stay there or run back to the latest door", "He will come back few times after his initial spawn so hide every next door until it is safe..."}, -- *Required!
        Cause = "Rebound",
        Floors = {
            Hotel = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Mines = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        },
        Subfloors = {
            Backdoor = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Rooms = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Outdoors = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        }
	}
})
 
---====== Debug entity ======---
 
entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
    local move = GetGitSound("https://github.com/check78/worldcuuuup/blob/main/DoomBegin.mp3?raw=true","Rebound")
    move.Parent = workspace.Rebound.Rebound
    move.Volume = 0
local vroom = TweenService:Create(move, TweenInfo.new(1),{Volume = 8.5})
    vroom:Play()
	move:Play()
wait(8.5)
    local arrival = Instance.new("Sound")
    arrival.Name = "ReboundArrival"
    arrival.Parent = workspace.Rebound.Rebound
    arrival.SoundId = "rbxassetid://18920812603"
    arrival.Volume = 8.5
    arrival:Play()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
end)
 
entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)
 
entity:SetCallback("OnReachNode", function(node)
    print("Entity has reached node\nName: ".. node.Name.. "\nPosition: ".. node.Position)
if game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetAttribute("RawName") == "HaltHallway" then
entity.Config.Damage.Enabled = false
end
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
    print("Entity has despawned")
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if game:GetService("ReplicatedStorage").GameData.Floor.Value == "Hotel" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Mines" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Garden" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Fools" then
 
if game.Workspace:FindFirstChild("SeekMovingNewClone") or game.Workspace:FindFirstChild("SeekMoving") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("FigureSetup") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_NestHandler") or game.ReplicatedStorage.GameData.LatestRoom.Value == 51 or game.ReplicatedStorage.GameData.LatestRoom.Value == 52 or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Assets:FindFirstChild("ShopProps") or game.ReplicatedStorage.GameData.LatestRoom.Value == 90 or game.ReplicatedStorage.GameData.LatestRoom.Value == 91 or game.ReplicatedStorage.GameData.LatestRoom.Value == 92 or game.ReplicatedStorage.GameData.LatestRoom.Value == 93 or game.ReplicatedStorage.GameData.LatestRoom.Value == 94 or game.ReplicatedStorage.GameData.LatestRoom.Value ==  95 or game.ReplicatedStorage.GameData.LatestRoom.Value == 96 or game.ReplicatedStorage.GameData.LatestRoom.Value == 97 or game.ReplicatedStorage.GameData.LatestRoom.Value == 98 or game.ReplicatedStorage.GameData.LatestRoom.Value == 99 or game.ReplicatedStorage.GameData.LatestRoom.Value == 100 or  game.Workspace:FindFirstChild("EyestalkMoving") or  game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_MillHandler") then
	return
end
 
end
---====== Load spawner ======---
 
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---
 
local entity = spawner.Create({
	Entity = {
		Name = "Rebound",
		Asset = "rbxassetid://13499570750",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 0.5
		},
		Shatter = false,
		Repair = false,
		ColorCorrection = {
		    Enabled = false,
		    Color = Color3.fromRGB(255, 0, 0), -- Color3.new
		    CameraShake = {10, 5, 2, 5}, -- Magnitude, Roughness, FadeIn, FadeOut
		    Sound = {
		        SoundId = "rbxassetid://0",
		        Volume = 1
		    },
		    Duration = 5,
		    FadeIn = 1,
		    FadeOut = 2
		}
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 125,
		Delay = 2,
		Reversed = true
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 0.5,
		Max = 1,
		Delay = 3.5
	},
	Damage = {
		Enabled = true,
		Range = 100,
		Amount = 75,
		Withered = false, -- If true, it take damages to MaxHealth (1~inf)
		Random = {
		    Enabled = false,
		    Min = 1,
		    Max = 200
		}
	},
	Jumpscare = {
	    Enabled = false,
	    Face = "rbxassetid://0",
	    FacePosition = UDim2.new(0.5, 0, 0.5, 0),
	    FaceSize = UDim2.new(0, 150, 0, 150),
	    BackgroundColor = Color3.new(1, 1, 1), -- Color3.fromRGB
	    BackgroundColor2 = Color3.new(0, 0, 0), -- Color3.fromRGB
	    Sound = "rbxassetid://0",
	    SoundVolume = 5
	},
	Achievements = {
	    Survive = {
	        Enabled = true,
	        Once = false,
	        Title = "Constant Respawn",
	        Desc = "I'm coming for you!",
	        Reason = "Survive Rebound",
	        Image = "rbxassetid://101562510260261",
	        Prize = {
                Revives = {
                    Visible = true,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Crucifix = {
	        Enabled = true,
	        Once = true,
	        Title = "Go away",
	        Desc = "Don't respawn, thanks!",
	        Reason = "Use crucifix against Rebound",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Death = {
	        Enabled = false,
	        Once = false,
	        Title = "Death Title",
	        Desc = "Death Description",
	        Reason = "Death Reason",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    }
	},
	Crucifixion = {
	    Type = "Guiding", -- "Curious"
		Enabled = true,
		Range = 10,
		Resist = false,
		Break = true
	},
	Death = {
	    IsolationFloors = false,
		Type = "Guiding", -- "Curious"
		Hints = {"You died to Rebound", "It's appears at the next door and has a chance to stay there or run back to the latest door", "He will come back few times after his initial spawn so hide every next door until it is safe..."}, -- *Required!
        Cause = "Rebound",
        Floors = {
            Hotel = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Mines = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        },
        Subfloors = {
            Backdoor = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Rooms = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Outdoors = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        }
	}
})
 
---====== Debug entity ======---
 
entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
    local move = GetGitSound("https://github.com/check78/worldcuuuup/blob/main/DoomBegin.mp3?raw=true","Rebound")
    move.Parent = workspace.Rebound.Rebound
    move.Volume = 0
local vroom = TweenService:Create(move, TweenInfo.new(1),{Volume = 8.5})
    vroom:Play()
	move:Play()
wait(8.5)
    local arrival = Instance.new("Sound")
    arrival.Name = "ReboundArrival"
    arrival.Parent = workspace.Rebound.Rebound
    arrival.SoundId = "rbxassetid://18920812603"
    arrival.Volume = 8.5
    arrival:Play()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
end)
 
entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)
 
entity:SetCallback("OnReachNode", function(node)
    print("Entity has reached node\nName: ".. node.Name.. "\nPosition: ".. node.Position)
if game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetAttribute("RawName") == "HaltHallway" then
entity.Config.Damage.Enabled = false
end
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
    print("Entity has despawned")
end)
 
entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
local scare = Instance.new("Sound")
scare.Parent = game.Workspace
scare.Name = "MyEarsBurn"
scare.SoundId = "rbxassetid://852718837120"
scare.PlaybackSpeed = 3
scare.Volume = 1

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 0.7
shift.Parent = scare

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = scare
distort.Level = 1

local TweenService = game:GetService("TweenService")
local spookee = TweenService:Create(scare, TweenInfo.new(2),{Volume = 0})

scare:Play()

spookee:Play()
wait(2)
scare:Destroy()
	else
		print("Entity has damaged the player")
	end
end)
 
entity:SetCallback("OnCrucified", function(stateResist)
    print("Entity was crucified")
    task.wait(3)
	if stateResist == true then
	    print("Entity is resisting the crucifixion")
	else
		print("The entity has been breaking by the crucifixion")
	end
end)

--[[
 
DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.
 
entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)
 
]]--
 
---====== Run entity ======---
 
entity:Run()
end)
 
entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
local scare = Instance.new("Sound")
scare.Parent = game.Workspace
scare.Name = "MyEarsBurn"
scare.SoundId = "rbxassetid://852718837120"
scare.PlaybackSpeed = 3
scare.Volume = 1

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 0.7
shift.Parent = scare

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = scare
distort.Level = 1

local TweenService = game:GetService("TweenService")
local spookee = TweenService:Create(scare, TweenInfo.new(2),{Volume = 0})

scare:Play()

spookee:Play()
wait(2)
scare:Destroy()
	else
		print("Entity has damaged the player")
	end
end)
 
entity:SetCallback("OnCrucified", function(stateResist)
    print("Entity was crucified")
    task.wait(3)
	if stateResist == true then
	    print("Entity is resisting the crucifixion")
	else
		print("The entity has been breaking by the crucifixion")
	end
end)

--[[
 
DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.
 
entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)
 
]]--
 
---====== Run entity ======---
 
entity:Run()
end)
 
entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
local scare = Instance.new("Sound")
scare.Parent = game.Workspace
scare.Name = "MyEarsBurn"
scare.SoundId = "rbxassetid://852718837120"
scare.PlaybackSpeed = 3
scare.Volume = 1

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 0.7
shift.Parent = scare

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = scare
distort.Level = 1

local TweenService = game:GetService("TweenService")
local spookee = TweenService:Create(scare, TweenInfo.new(2),{Volume = 0})

scare:Play()

spookee:Play()
wait(2)
scare:Destroy()
	else
		print("Entity has damaged the player")
	end
end)
 
entity:SetCallback("OnCrucified", function(stateResist)
    print("Entity was crucified")
    task.wait(3)
	if stateResist == true then
	    print("Entity is resisting the crucifixion")
	else
		print("The entity has been breaking by the crucifixion")
	end
end)

--[[
 
DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.
 
entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)
 
]]--
 
---====== Run entity ======---
 
entity:Run()
end)
 
entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
local scare = Instance.new("Sound")
scare.Parent = game.Workspace
scare.Name = "MyEarsBurn"
scare.SoundId = "rbxassetid://852718837120"
scare.PlaybackSpeed = 3
scare.Volume = 1

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 0.7
shift.Parent = scare

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = scare
distort.Level = 1

local TweenService = game:GetService("TweenService")
local spookee = TweenService:Create(scare, TweenInfo.new(2),{Volume = 0})

scare:Play()

spookee:Play()
wait(2)
scare:Destroy()
	else
		print("Entity has damaged the player")
	end
end)
 
entity:SetCallback("OnCrucified", function(stateResist)
    print("Entity was crucified")
    task.wait(3)
	if stateResist == true then
	    print("Entity is resisting the crucifixion")
	else
		print("The entity has been breaking by the crucifixion")
	end
end)
 
--[[
 
DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.
 
entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)
 
]]--
 
---====== Run entity ======---
 
entity:Run()

cue2:Destroy()
cue1:Destroy()
ColorCorrection:Destroy()
-- (nested) https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua  (50681 bytes)

-- (nested) https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua  (50681 bytes)

-- (nested) https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua  (50681 bytes)


-- ========================================

-- source: github.com/Drop56796/Corruption-mode  (Corruption mode.lua)
-- [resolved CLEAN] https://pastebin.com/raw/2SAwkPLt  (52213 bytes)

if game:GetService("ReplicatedStorage").GameData.Floor.Value == "Hotel" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Mines" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Garden" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Fools" then
 
if game.Workspace:FindFirstChild("SeekMovingNewClone") or game.Workspace:FindFirstChild("SeekMoving") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("FigureSetup") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_NestHandler") or game.ReplicatedStorage.GameData.LatestRoom.Value == 51 or game.ReplicatedStorage.GameData.LatestRoom.Value == 52 or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Assets:FindFirstChild("ShopProps") or game.ReplicatedStorage.GameData.LatestRoom.Value == 90 or game.ReplicatedStorage.GameData.LatestRoom.Value == 91 or game.ReplicatedStorage.GameData.LatestRoom.Value == 92 or game.ReplicatedStorage.GameData.LatestRoom.Value == 93 or game.ReplicatedStorage.GameData.LatestRoom.Value == 94 or game.ReplicatedStorage.GameData.LatestRoom.Value ==  95 or game.ReplicatedStorage.GameData.LatestRoom.Value == 96 or game.ReplicatedStorage.GameData.LatestRoom.Value == 97 or game.ReplicatedStorage.GameData.LatestRoom.Value == 98 or game.ReplicatedStorage.GameData.LatestRoom.Value == 99 or game.ReplicatedStorage.GameData.LatestRoom.Value == 100 or game.Workspace:FindFirstChild("EyestalkMoving") or  game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_MillHandler") then
	return
end
 
end

local ColorCorrection = Instance.new("ColorCorrectionEffect", game.Lighting)
ColorCorrection.TintColor = Color3.fromRGB(61, 98, 171)
ColorCorrection.Contrast = 0.2
ColorCorrection.Saturation = -0.5
local tween = game:GetService("TweenService")
tween:Create(ColorCorrection, TweenInfo.new(5), {Contrast = 0}):Play()
tween:Create(ColorCorrection, TweenInfo.new(5), {Saturation = 0}):Play()
local TweenService = game:GetService("TweenService")
local TW = TweenService:Create(ColorCorrection, TweenInfo.new(5),{TintColor = Color3.fromRGB(255, 255, 255)})
TW:Play()
local cue1 = Instance.new("Sound")
cue1.Parent = game.Workspace
cue1.Name = "Scream"
cue1.SoundId = "rbxassetid://9114397505"
local distort = Instance.new("DistortionSoundEffect")
distort.Parent = cue1
distort.Level = 1
local distort2 = Instance.new("DistortionSoundEffect")
distort2.Parent = cue1
distort2.Level = 1
local pitch = Instance.new("PitchShiftSoundEffect")
pitch.Parent = cue1
pitch.Octave = 0.5
local pitch2 = Instance.new("PitchShiftSoundEffect")
pitch2.Parent = cue1
pitch2.Octave = 0.5
local pitch3 = Instance.new("PitchShiftSoundEffect")
pitch3.Parent = cue1
pitch3.Octave = 0.5
cue1.Volume = 0.1
cue1:Play()
local cue2 = Instance.new("Sound")
cue2.Parent = game.Workspace
cue2.Name = "Spawn"
cue2.SoundId = "rbxassetid://9114221327"
cue2.Volume = 3
cue2:Play()
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
	camara.CFrame = camara.CFrame * shakeCf
end)
camShake:Start()
camShake:ShakeOnce(10,3,0.1,6,2,0.5)
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
function GetGitSound(GithubSnd,SoundName)
	local url=GithubSnd
	if not isfile(SoundName..".mp3") then
		writefile(SoundName..".mp3", game:HttpGet(url))
	end
	local sound=Instance.new("Sound")
	sound.SoundId=(getcustomasset or getsynasset)(SoundName..".mp3")
	return sound
end
wait(2.8)
---====== Load spawner ======---
 
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---
 
local entity = spawner.Create({
	Entity = {
		Name = "Rebound",
		Asset = "rbxassetid://13499570750",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 0.5
		},
		Shatter = false,
		Repair = false,
		ColorCorrection = {
		    Enabled = false,
		    Color = Color3.fromRGB(255, 0, 0), -- Color3.new
		    CameraShake = {10, 5, 2, 5}, -- Magnitude, Roughness, FadeIn, FadeOut
		    Sound = {
		        SoundId = "rbxassetid://0",
		        Volume = 1
		    },
		    Duration = 5,
		    FadeIn = 1,
		    FadeOut = 2
		}
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 125,
		Delay = 2,
		Reversed = true
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 0.5,
		Max = 1,
		Delay = 3.5
	},
	Damage = {
		Enabled = true,
		Range = 100,
		Amount = 75,
		Withered = false, -- If true, it take damages to MaxHealth (1~inf)
		Random = {
		    Enabled = false,
		    Min = 1,
		    Max = 200
		}
	},
	Jumpscare = {
	    Enabled = false,
	    Face = "rbxassetid://0",
	    FacePosition = UDim2.new(0.5, 0, 0.5, 0),
	    FaceSize = UDim2.new(0, 150, 0, 150),
	    BackgroundColor = Color3.new(1, 1, 1), -- Color3.fromRGB
	    BackgroundColor2 = Color3.new(0, 0, 0), -- Color3.fromRGB
	    Sound = "rbxassetid://0",
	    SoundVolume = 5
	},
	Achievements = {
	    Survive = {
	        Enabled = false,
	        Once = false,
	        Title = "Survive Title",
	        Desc = "Survive Description",
	        Reason = "Survive Reason",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = true,
                    Amount = 1
                },
                Knobs = {
                    Visible = true,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Crucifix = {
	        Enabled = true,
	        Once = true,
	        Title = "Go away",
	        Desc = "Don't respawn, thanks!",
	        Reason = "Use crucifix against Rebound",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Death = {
	        Enabled = false,
	        Once = false,
	        Title = "Death Title",
	        Desc = "Death Description",
	        Reason = "Death Reason",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    }
	},
	Crucifixion = {
	    Type = "Guiding", -- "Curious"
		Enabled = true,
		Range = 10,
		Resist = false,
		Break = true
	},
	Death = {
	    IsolationFloors = false,
		Type = "Guiding", -- "Curious"
		Hints = {"You died to Rebound", "It's appears at the next door and has a chance to stay there or run back to the latest door", "He will come back few times after his initial spawn so hide every next door until it is safe..."}, -- *Required!
        Cause = "Rebound",
        Floors = {
            Hotel = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Mines = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        },
        Subfloors = {
            Backdoor = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Rooms = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Outdoors = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        }
	}
})
 
---====== Debug entity ======---
 
entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
    local move = GetGitSound("https://github.com/check78/worldcuuuup/blob/main/DoomBegin.mp3?raw=true","Rebound")
    move.Parent = workspace.Rebound.Rebound
    move.Volume = 0
local vroom = TweenService:Create(move, TweenInfo.new(1),{Volume = 8.5})
    vroom:Play()
	move:Play()
if game.ReplicatedStorage:WaitForChild("LiveModifiers"):FindFirstChild("VoiceActing") then
local bruh = Instance.new("Sound", workspace.Rebound.Rebound)
bruh.SoundId = "rbxassetid://16947609217"
bruh.Volume = 0
bruh.Looped = true

local TweenService = game:GetService("TweenService")
local volume = TweenService:Create(bruh, TweenInfo.new(2),{Volume = 1})

volume:Play()

bruh:Play()

end

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 0.7
shift.Parent = bruh

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = bruh
distort.Level = 1
wait(8.5)
    local arrival = Instance.new("Sound")
    arrival.Name = "ReboundArrival"
    arrival.Parent = workspace.Rebound.Rebound
    arrival.SoundId = "rbxassetid://18920812603"
    arrival.Volume = 8.5
    arrival:Play()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
end)
 
entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)
 
entity:SetCallback("OnReachNode", function(node)
    print("Entity has reached node\nName: ".. node.Name.. "\nPosition: ".. node.Position)
if game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetAttribute("RawName") == "HaltHallway" then
entity.Config.Damage.Enabled = false
end
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
    print("Entity has despawned")
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if game:GetService("ReplicatedStorage").GameData.Floor.Value == "Hotel" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Mines" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Garden" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Fools" then
 
if game.Workspace:FindFirstChild("SeekMovingNewClone") or game.Workspace:FindFirstChild("SeekMoving") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("FigureSetup") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_NestHandler") or game.ReplicatedStorage.GameData.LatestRoom.Value == 51 or game.ReplicatedStorage.GameData.LatestRoom.Value == 52 or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Assets:FindFirstChild("ShopProps") or game.ReplicatedStorage.GameData.LatestRoom.Value == 90 or game.ReplicatedStorage.GameData.LatestRoom.Value == 91 or game.ReplicatedStorage.GameData.LatestRoom.Value == 92 or game.ReplicatedStorage.GameData.LatestRoom.Value == 93 or game.ReplicatedStorage.GameData.LatestRoom.Value == 94 or game.ReplicatedStorage.GameData.LatestRoom.Value ==  95 or game.ReplicatedStorage.GameData.LatestRoom.Value == 96 or game.ReplicatedStorage.GameData.LatestRoom.Value == 97 or game.ReplicatedStorage.GameData.LatestRoom.Value == 98 or game.ReplicatedStorage.GameData.LatestRoom.Value == 99 or game.ReplicatedStorage.GameData.LatestRoom.Value == 100 or game.Workspace:FindFirstChild("EyestalkMoving") or  game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_MillHandler") then
	return
end
 
end
---====== Load spawner ======---
 
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---
 
local entity = spawner.Create({
	Entity = {
		Name = "Rebound",
		Asset = "rbxassetid://13499570750",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 0.5
		},
		Shatter = false,
		Repair = false,
		ColorCorrection = {
		    Enabled = false,
		    Color = Color3.fromRGB(255, 0, 0), -- Color3.new
		    CameraShake = {10, 5, 2, 5}, -- Magnitude, Roughness, FadeIn, FadeOut
		    Sound = {
		        SoundId = "rbxassetid://0",
		        Volume = 1
		    },
		    Duration = 5,
		    FadeIn = 1,
		    FadeOut = 2
		}
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 125,
		Delay = 2,
		Reversed = true
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 0.5,
		Max = 1,
		Delay = 3.5
	},
	Damage = {
		Enabled = true,
		Range = 100,
		Amount = 75,
		Withered = false, -- If true, it take damages to MaxHealth (1~inf)
		Random = {
		    Enabled = false,
		    Min = 1,
		    Max = 200
		}
	},
	Jumpscare = {
	    Enabled = false,
	    Face = "rbxassetid://0",
	    FacePosition = UDim2.new(0.5, 0, 0.5, 0),
	    FaceSize = UDim2.new(0, 150, 0, 150),
	    BackgroundColor = Color3.new(1, 1, 1), -- Color3.fromRGB
	    BackgroundColor2 = Color3.new(0, 0, 0), -- Color3.fromRGB
	    Sound = "rbxassetid://0",
	    SoundVolume = 5
	},
	Achievements = {
	    Survive = {
	        Enabled = false,
	        Once = false,
	        Title = "Survive Title",
	        Desc = "Survive Description",
	        Reason = "Survive Reason",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = true,
                    Amount = 1
                },
                Knobs = {
                    Visible = true,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Crucifix = {
	        Enabled = true,
	        Once = true,
	        Title = "Go away",
	        Desc = "Don't respawn, thanks!",
	        Reason = "Use crucifix against Rebound",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Death = {
	        Enabled = false,
	        Once = false,
	        Title = "Death Title",
	        Desc = "Death Description",
	        Reason = "Death Reason",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    }
	},
	Crucifixion = {
	    Type = "Guiding", -- "Curious"
		Enabled = true,
		Range = 10,
		Resist = false,
		Break = true
	},
	Death = {
	    IsolationFloors = false,
		Type = "Guiding", -- "Curious"
		Hints = {"You died to Rebound", "It's appears at the next door and has a chance to stay there or run back to the latest door", "He will come back few times after his initial spawn so hide every next door until it is safe..."}, -- *Required!
        Cause = "Rebound",
        Floors = {
            Hotel = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Mines = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        },
        Subfloors = {
            Backdoor = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Rooms = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Outdoors = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        }
	}
})

---====== Debug entity ======---
 
entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
    local move = GetGitSound("https://github.com/check78/worldcuuuup/blob/main/DoomBegin.mp3?raw=true","Rebound")
    move.Parent = workspace.Rebound.Rebound
    move.Volume = 0
local vroom = TweenService:Create(move, TweenInfo.new(1),{Volume = 8.5})
    vroom:Play()
	move:Play()
wait(8.5)
    local arrival = Instance.new("Sound")
    arrival.Name = "ReboundArrival"
    arrival.Parent = workspace.Rebound.Rebound
    arrival.SoundId = "rbxassetid://18920812603"
    arrival.Volume = 8.5
    arrival:Play()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
end)
 
entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)
 
entity:SetCallback("OnReachNode", function(node)
    print("Entity has reached node\nName: ".. node.Name.. "\nPosition: ".. node.Position)
if game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetAttribute("RawName") == "HaltHallway" then
entity.Config.Damage.Enabled = false
end
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
    print("Entity has despawned")
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if game:GetService("ReplicatedStorage").GameData.Floor.Value == "Hotel" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Mines" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Garden" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Fools" then
 
if game.Workspace:FindFirstChild("SeekMovingNewClone") or game.Workspace:FindFirstChild("SeekMoving") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("FigureSetup") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_NestHandler") or game.ReplicatedStorage.GameData.LatestRoom.Value == 51 or game.ReplicatedStorage.GameData.LatestRoom.Value == 52 or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Assets:FindFirstChild("ShopProps") or game.ReplicatedStorage.GameData.LatestRoom.Value == 90 or game.ReplicatedStorage.GameData.LatestRoom.Value == 91 or game.ReplicatedStorage.GameData.LatestRoom.Value == 92 or game.ReplicatedStorage.GameData.LatestRoom.Value == 93 or game.ReplicatedStorage.GameData.LatestRoom.Value == 94 or game.ReplicatedStorage.GameData.LatestRoom.Value ==  95 or game.ReplicatedStorage.GameData.LatestRoom.Value == 96 or game.ReplicatedStorage.GameData.LatestRoom.Value == 97 or game.ReplicatedStorage.GameData.LatestRoom.Value == 98 or game.ReplicatedStorage.GameData.LatestRoom.Value == 99 or game.ReplicatedStorage.GameData.LatestRoom.Value == 100 or game.Workspace:FindFirstChild("EyestalkMoving") or  game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_MillHandler") then
	return
end
 
end
---====== Load spawner ======---
 
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---
 
local entity = spawner.Create({
	Entity = {
		Name = "Rebound",
		Asset = "rbxassetid://13499570750",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 0.5
		},
		Shatter = false,
		Repair = false,
		ColorCorrection = {
		    Enabled = false,
		    Color = Color3.fromRGB(255, 0, 0), -- Color3.new
		    CameraShake = {10, 5, 2, 5}, -- Magnitude, Roughness, FadeIn, FadeOut
		    Sound = {
		        SoundId = "rbxassetid://0",
		        Volume = 1
		    },
		    Duration = 5,
		    FadeIn = 1,
		    FadeOut = 2
		}
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 125,
		Delay = 2,
		Reversed = true
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 0.5,
		Max = 1,
		Delay = 3.5
	},
	Damage = {
		Enabled = true,
		Range = 100,
		Amount = 75,
		Withered = false, -- If true, it take damages to MaxHealth (1~inf)
		Random = {
		    Enabled = false,
		    Min = 1,
		    Max = 200
		}
	},
	Jumpscare = {
	    Enabled = false,
	    Face = "rbxassetid://0",
	    FacePosition = UDim2.new(0.5, 0, 0.5, 0),
	    FaceSize = UDim2.new(0, 150, 0, 150),
	    BackgroundColor = Color3.new(1, 1, 1), -- Color3.fromRGB
	    BackgroundColor2 = Color3.new(0, 0, 0), -- Color3.fromRGB
	    Sound = "rbxassetid://0",
	    SoundVolume = 5
	},
	Achievements = {
	    Survive = {
	        Enabled = false,
	        Once = false,
	        Title = "Survive Title",
	        Desc = "Survive Description",
	        Reason = "Survive Reason",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = true,
                    Amount = 1
                },
                Knobs = {
                    Visible = true,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Crucifix = {
	        Enabled = true,
	        Once = true,
	        Title = "Go away",
	        Desc = "Don't respawn, thanks!",
	        Reason = "Use crucifix against Rebound",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Death = {
	        Enabled = false,
	        Once = false,
	        Title = "Death Title",
	        Desc = "Death Description",
	        Reason = "Death Reason",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    }
	},
	Crucifixion = {
	    Type = "Guiding", -- "Curious"
		Enabled = true,
		Range = 10,
		Resist = false,
		Break = true
	},
	Death = {
	    IsolationFloors = false,
		Type = "Guiding", -- "Curious"
		Hints = {"You died to Rebound", "It's appears at the next door and has a chance to stay there or run back to the latest door", "He will come back few times after his initial spawn so hide every next door until it is safe..."}, -- *Required!
        Cause = "Rebound",
        Floors = {
            Hotel = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Mines = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        },
        Subfloors = {
            Backdoor = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Rooms = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Outdoors = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        }
	}
})
 
---====== Debug entity ======---
 
entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
    local move = GetGitSound("https://github.com/check78/worldcuuuup/blob/main/DoomBegin.mp3?raw=true","Rebound")
    move.Parent = workspace.Rebound.Rebound
    move.Volume = 0
local vroom = TweenService:Create(move, TweenInfo.new(1),{Volume = 8.5})
    vroom:Play()
	move:Play()
wait(8.5)
    local arrival = Instance.new("Sound")
    arrival.Name = "ReboundArrival"
    arrival.Parent = workspace.Rebound.Rebound
    arrival.SoundId = "rbxassetid://18920812603"
    arrival.Volume = 8.5
    arrival:Play()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
end)
 
entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)
 
entity:SetCallback("OnReachNode", function(node)
    print("Entity has reached node\nName: ".. node.Name.. "\nPosition: ".. node.Position)
if game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetAttribute("RawName") == "HaltHallway" then
entity.Config.Damage.Enabled = false
end
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
    print("Entity has despawned")
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if game:GetService("ReplicatedStorage").GameData.Floor.Value == "Hotel" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Mines" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Garden" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Fools" then
 
if game.Workspace:FindFirstChild("SeekMovingNewClone") or game.Workspace:FindFirstChild("SeekMoving") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("FigureSetup") or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_NestHandler") or game.ReplicatedStorage.GameData.LatestRoom.Value == 51 or game.ReplicatedStorage.GameData.LatestRoom.Value == 52 or game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Assets:FindFirstChild("ShopProps") or game.ReplicatedStorage.GameData.LatestRoom.Value == 90 or game.ReplicatedStorage.GameData.LatestRoom.Value == 91 or game.ReplicatedStorage.GameData.LatestRoom.Value == 92 or game.ReplicatedStorage.GameData.LatestRoom.Value == 93 or game.ReplicatedStorage.GameData.LatestRoom.Value == 94 or game.ReplicatedStorage.GameData.LatestRoom.Value ==  95 or game.ReplicatedStorage.GameData.LatestRoom.Value == 96 or game.ReplicatedStorage.GameData.LatestRoom.Value == 97 or game.ReplicatedStorage.GameData.LatestRoom.Value == 98 or game.ReplicatedStorage.GameData.LatestRoom.Value == 99 or game.ReplicatedStorage.GameData.LatestRoom.Value == 100 or  game.Workspace:FindFirstChild("EyestalkMoving") or  game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("_MillHandler") then
	return
end
 
end
---====== Load spawner ======---
 
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua"))()

---====== Create entity ======---
 
local entity = spawner.Create({
	Entity = {
		Name = "Rebound",
		Asset = "rbxassetid://13499570750",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 0.5
		},
		Shatter = false,
		Repair = false,
		ColorCorrection = {
		    Enabled = false,
		    Color = Color3.fromRGB(255, 0, 0), -- Color3.new
		    CameraShake = {10, 5, 2, 5}, -- Magnitude, Roughness, FadeIn, FadeOut
		    Sound = {
		        SoundId = "rbxassetid://0",
		        Volume = 1
		    },
		    Duration = 5,
		    FadeIn = 1,
		    FadeOut = 2
		}
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 125,
		Delay = 2,
		Reversed = true
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 0.5,
		Max = 1,
		Delay = 3.5
	},
	Damage = {
		Enabled = true,
		Range = 100,
		Amount = 75,
		Withered = false, -- If true, it take damages to MaxHealth (1~inf)
		Random = {
		    Enabled = false,
		    Min = 1,
		    Max = 200
		}
	},
	Jumpscare = {
	    Enabled = false,
	    Face = "rbxassetid://0",
	    FacePosition = UDim2.new(0.5, 0, 0.5, 0),
	    FaceSize = UDim2.new(0, 150, 0, 150),
	    BackgroundColor = Color3.new(1, 1, 1), -- Color3.fromRGB
	    BackgroundColor2 = Color3.new(0, 0, 0), -- Color3.fromRGB
	    Sound = "rbxassetid://0",
	    SoundVolume = 5
	},
	Achievements = {
	    Survive = {
	        Enabled = true,
	        Once = false,
	        Title = "Constant Respawn",
	        Desc = "I'm coming for you!",
	        Reason = "Survive Rebound",
	        Image = "rbxassetid://101562510260261",
	        Prize = {
                Revives = {
                    Visible = true,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Crucifix = {
	        Enabled = true,
	        Once = true,
	        Title = "Go away",
	        Desc = "Don't respawn, thanks!",
	        Reason = "Use crucifix against Rebound",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    },
	    Death = {
	        Enabled = false,
	        Once = false,
	        Title = "Death Title",
	        Desc = "Death Description",
	        Reason = "Death Reason",
	        Image = "rbxassetid://12309073114",
	        Prize = {
                Revives = {
                    Visible = false,
                    Amount = 1
                },
                Knobs = {
                    Visible = false,
                    Amount = 100
                },
                Stardust = {
                    Visible = false,
                    Amount = 20
                }
            }
	    }
	},
	Crucifixion = {
	    Type = "Guiding", -- "Curious"
		Enabled = true,
		Range = 10,
		Resist = false,
		Break = true
	},
	Death = {
	    IsolationFloors = false,
		Type = "Guiding", -- "Curious"
		Hints = {"You died to Rebound", "It's appears at the next door and has a chance to stay there or run back to the latest door", "He will come back few times after his initial spawn so hide every next door until it is safe..."}, -- *Required!
        Cause = "Rebound",
        Floors = {
            Hotel = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Mines = {
                Type = "Guiding", -- "Curious"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        },
        Subfloors = {
            Backdoor = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Rooms = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            },
            Outdoors = {
                Type = "Curious", -- "Guiding"
		        Hints = {"Death", "Hints", "Go", "Here"},
                Cause = ""
            }
        }
	}
})
 
---====== Debug entity ======---
 
entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
    local move = GetGitSound("https://github.com/check78/worldcuuuup/blob/main/DoomBegin.mp3?raw=true","Rebound")
    move.Parent = workspace.Rebound.Rebound
    move.Volume = 0
local vroom = TweenService:Create(move, TweenInfo.new(1),{Volume = 8.5})
    vroom:Play()
	move:Play()
wait(8.5)
    local arrival = Instance.new("Sound")
    arrival.Name = "ReboundArrival"
    arrival.Parent = workspace.Rebound.Rebound
    arrival.SoundId = "rbxassetid://18920812603"
    arrival.Volume = 8.5
    arrival:Play()
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
if workspace:FindFirstChild("Rebound") then
for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
 if v.Name == "PointLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "SpotLight" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 elseif v.Name == "Neon" then
  local TweenService = game:GetService("TweenService")
  local TW = TweenService:Create(v, TweenInfo.new(1),{Color = Color3.fromRGB(85, 255, 255)})
  TW:Play()
 end
end
end
end)
 
entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)
 
entity:SetCallback("OnReachNode", function(node)
    print("Entity has reached node\nName: ".. node.Name.. "\nPosition: ".. node.Position)
if game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetAttribute("RawName") == "HaltHallway" then
entity.Config.Damage.Enabled = false
end
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
    print("Entity has despawned")
end)
 
entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
local scare = Instance.new("Sound")
scare.Parent = game.Workspace
scare.Name = "MyEarsBurn"
scare.SoundId = "rbxassetid://852718837120"
scare.PlaybackSpeed = 3
scare.Volume = 1

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 0.7
shift.Parent = scare

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = scare
distort.Level = 1

local TweenService = game:GetService("TweenService")
local spookee = TweenService:Create(scare, TweenInfo.new(2),{Volume = 0})

scare:Play()

spookee:Play()
wait(2)
scare:Destroy()
	else
		print("Entity has damaged the player")
	end
end)
 
entity:SetCallback("OnCrucified", function(stateResist)
    print("Entity was crucified")
    task.wait(3)
	if stateResist == true then
	    print("Entity is resisting the crucifixion")
	else
		print("The entity has been breaking by the crucifixion")
	end
end)

--[[
 
DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.
 
entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)
 
]]--
 
---====== Run entity ======---
 
entity:Run()
end)
 
entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
local scare = Instance.new("Sound")
scare.Parent = game.Workspace
scare.Name = "MyEarsBurn"
scare.SoundId = "rbxassetid://852718837120"
scare.PlaybackSpeed = 3
scare.Volume = 1

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 0.7
shift.Parent = scare

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = scare
distort.Level = 1

local TweenService = game:GetService("TweenService")
local spookee = TweenService:Create(scare, TweenInfo.new(2),{Volume = 0})

scare:Play()

spookee:Play()
wait(2)
scare:Destroy()
	else
		print("Entity has damaged the player")
	end
end)
 
entity:SetCallback("OnCrucified", function(stateResist)
    print("Entity was crucified")
    task.wait(3)
	if stateResist == true then
	    print("Entity is resisting the crucifixion")
	else
		print("The entity has been breaking by the crucifixion")
	end
end)

--[[
 
DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.
 
entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)
 
]]--
 
---====== Run entity ======---
 
entity:Run()
end)
 
entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
local scare = Instance.new("Sound")
scare.Parent = game.Workspace
scare.Name = "MyEarsBurn"
scare.SoundId = "rbxassetid://852718837120"
scare.PlaybackSpeed = 3
scare.Volume = 1

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 0.7
shift.Parent = scare

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = scare
distort.Level = 1

local TweenService = game:GetService("TweenService")
local spookee = TweenService:Create(scare, TweenInfo.new(2),{Volume = 0})

scare:Play()

spookee:Play()
wait(2)
scare:Destroy()
	else
		print("Entity has damaged the player")
	end
end)
 
entity:SetCallback("OnCrucified", function(stateResist)
    print("Entity was crucified")
    task.wait(3)
	if stateResist == true then
	    print("Entity is resisting the crucifixion")
	else
		print("The entity has been breaking by the crucifixion")
	end
end)

--[[
 
DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.
 
entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)
 
]]--
 
---====== Run entity ======---
 
entity:Run()
end)
 
entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
local scare = Instance.new("Sound")
scare.Parent = game.Workspace
scare.Name = "MyEarsBurn"
scare.SoundId = "rbxassetid://852718837120"
scare.PlaybackSpeed = 3
scare.Volume = 1

local shift = Instance.new("PitchShiftSoundEffect")
shift.Octave = 0.7
shift.Parent = scare

local distort = Instance.new("DistortionSoundEffect")
distort.Parent = scare
distort.Level = 1

local TweenService = game:GetService("TweenService")
local spookee = TweenService:Create(scare, TweenInfo.new(2),{Volume = 0})

scare:Play()

spookee:Play()
wait(2)
scare:Destroy()
	else
		print("Entity has damaged the player")
	end
end)
 
entity:SetCallback("OnCrucified", function(stateResist)
    print("Entity was crucified")
    task.wait(3)
	if stateResist == true then
	    print("Entity is resisting the crucifixion")
	else
		print("The entity has been breaking by the crucifixion")
	end
end)
 
--[[
 
DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.
 
entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)
 
]]--
 
---====== Run entity ======---
 
entity:Run()

cue2:Destroy()
cue1:Destroy()
ColorCorrection:Destroy()
-- (nested) https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua  (50681 bytes)

-- (nested) https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua  (50681 bytes)

-- (nested) https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Focuslol666/Utilities/refs/heads/patch-1/Doors/Entity%20Spawner/V2/Source.lua  (50681 bytes)
