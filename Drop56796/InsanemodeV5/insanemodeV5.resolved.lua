-- source: github.com/Drop56796/InsanemodeV5  (insanemodeV5.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/InsanemodeV5/main/G95.lua  (4458 bytes)

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

local entity = spawner.Create({
	Entity = {
		Name = "G-95",
		Asset = "https://github.com/catminetry/G95-V1/blob/main/G95.rbxm?raw=true",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = false,
			Duration = 1
		},
		Shatter = false,
		Repair = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 500,
		Delay = 6,
		Reversed = false
	},
	Rebounding = {
		Enabled = false,
		Type = "Ambush", -- "Blitz"
		Min = 1,
		Max = 1,
		Delay = 0
	},
	Damage = {
		Enabled = true,
		Range = 50,
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

-- Create and play the tween to reset all properties to original
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
    local cue2 = Instance.new("Sound")
	cue2.Parent = game.Workspace
	cue2.Name = "Sound"
	cue2.SoundId = "rbxassetid://1837829565"
	cue2.Volume = 10
	cue2.PlaybackSpeed = 0.8
	cue2:Play()
    wait(2.5)
    ---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Scared of Scream Face For you",
    Desc = "Don't be to slow",
    Reason = "Encountered G95.",
    Image = "rbxassetid://3457898957"
})
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

entity:Run()
-- entity:Pause()
-- entity:Resume()
-- entity:IsPaused()
-- entity:Despawn()

-- (nested) https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua  (636 bytes)

-- (nested) https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua  (664 bytes)


-- ========================================

-- source: github.com/Drop56796/InsanemodeV5  (insanemodeV5.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/InsanemodeV5/main/Sprint.lua  (10050 bytes)

local runService = game:GetService("RunService")
local character = game.Players.LocalPlayer.Character
local humanoid = character:WaitForChild("Humanoid")
local StaminaBar = Instance.new("ScreenGui")
local Border = Instance.new("Frame")
local Bar = Instance.new("Frame")
local SideBar = Instance.new("Frame")
local Bar_2 = Instance.new("Frame")
StaminaBar.Name = "StaminaBar"
StaminaBar.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
StaminaBar.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Border.Name = "Border"
Border.Parent = StaminaBar
Border.AnchorPoint = Vector2.new(0, 1)
Border.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Border.BorderColor3 = Color3.fromRGB(0, 0, 0)
Border.BorderSizePixel = 4
Border.Position = UDim2.new(0.25, 0, 0.85, 0)
Border.Size = UDim2.new(0.6, 0, 0.0263093561, 0)
Bar.Name = "Bar"
Bar.Parent = Border
Bar.AnchorPoint = Vector2.new(0, 1)
Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
Bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
Bar.BorderSizePixel = 0
Bar.Position = UDim2.new(0, 0, 1, 0)
Bar.Size = UDim2.new(1, 0, 1, 0)
SideBar.Name = "SideBar"
SideBar.Parent = StaminaBar
SideBar.AnchorPoint = Vector2.new(0, 1)
SideBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SideBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
SideBar.BorderSizePixel = 4
SideBar.Position = UDim2.new(0.985890269, 0, 1, 0)
SideBar.Size = UDim2.new(0.0141097549, 0, 0.17468825, 0)
Bar_2.Name = "Bar"
Bar_2.Parent = SideBar
Bar_2.AnchorPoint = Vector2.new(0, 1)
Bar_2.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
Bar_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Bar_2.BorderSizePixel = 0
Bar_2.Position = UDim2.new(0, 0, 1, 0)
Bar_2.Size = UDim2.new(1, 0, 1, 0)
local Started=false

local OO = 0


function QCHWWK_fake_script() -- StaminaBar.SprintFire 


	local script = Instance.new('LocalScript', StaminaBar)


	local Bool = Instance.new('NumberValue', script.Parent)


	Bool.Name = "Dissapear"


	--------------------------------------------------------------------------------------------------------------


	script.Parent.Dissapear.Changed:Connect(function(Value)



		for i,v in pairs(script:GetChildren()) do


			v:Destroy()


		end



		local A = Instance.new("Part")


		A.Parent = script


		A.Name="Keep"..tick()..game.JobId..game:GetService("Players").LocalPlayer.Name



		Border.Visible = true


		SideBar.Visible = false


		wait(1)


		if script:FindFirstChild(A.Name) then




			OO=0


			repeat wait(1)


				--if not script:FindFirstChild(A.Name) then


				--Border.Visible = true


				--SideBar.Visible = false


				OO = OO +1


				-- end


			until Value > OO or not script:FindFirstChild(A.Name)




			if script:FindFirstChild(A.Name) then


				Border.Visible = false


				SideBar.Visible = true


			end


		end



	end)




	--------------------------------------------------------------------------------------------------------------


	local Players = game:GetService("Players")


	local RS = game:GetService("RunService")


	local ReSt = game:GetService("ReplicatedStorage")


	local CG = game:GetService("CoreGui")


	local TS = game:GetService("TweenService")


	local Plr = Players.LocalPlayer



	--local ModuleScripts = {


	---	MainGame = require(Plr.PlayerGui.MainUI.Initiator.Main_Game),


	--	ModuleEvents = require(ReSt.ClientModules.Module_Events),


	--}


	-- KEYBINDS HERE


	local Camera = workspace.CurrentCamera


	local bind1 = Enum.KeyCode.LeftShift -- This is the keybind this script is set to by default


	local bind2 = Enum.KeyCode.RightShift -- This is the second keybind this script is set to by default



	-- To change the keybind, replace the word after "Enum.Keycode." with your desired keybind




	--------------------------------------------------------------------------------------------------------------




	local player = game.Players.LocalPlayer -- Targets the player


	local char = player.Character or player.CharacterAdded:Wait() -- Finds player's character


	local hrp = char:WaitForChild("HumanoidRootPart") -- Finds character's humanoid root part



	local cam = game.Workspace.CurrentCamera


	local bar = script.Parent.Border.Bar



	--local runSound = hrp:WaitForChild("Running") -- Finds the running sound of the player



	local TS = game:GetService("TweenService")


	local TI = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0)




	--------------------------------------------------------------------------------------------------------------




	local FOV1 = {


		FieldOfView = 90 -- FOV change while sprinting, change as desired


	}


	local FOV2 = {


		FieldOfView = 70 -- FOV default value, suggested to keep as is


	}




	--------------------------------------------------------------------------------------------------------------




	local BigFOV = TS:Create(cam, TI, FOV1)


	local SmallFOV = TS:Create(cam, TI, FOV2)




	--------------------------------------------------------------------------------------------------------------




	local stamPower = 100 -- Total stamina points


	local stamTick = 2 -- How much the stamina goes down every tick of holding down the sprint button


	local regenTick = 0.5 -- How much the stamina goes back up every tick of not holding down the sprint button (until it hits stamPower max)






	--------------------------------------------------------------------------------------------------------------




	local sprinting = false


	local DEF = 15

	function sprint(name, IS, context)


		--	ModuleScripts.MainGame.camShaker.ShakeOnce(ModuleScripts.MainGame.camShaker, 5)


		if IS == Enum.UserInputState.Begin then

			if sprinting == false then
				DEF = char.Humanoid.WalkSpeed
			end
			--	runSound.PlaybackSpeed = 4 -- Changes the playback speed that the running sound plays at during sprinting, replace 4 with your desired playback speed if wanted


			script.Parent.Dissapear.Value=999999999999999999999999999999999999999999999999999999999999999999999

			
			Walkspeed2 = DEF+17
			char.Humanoid.WalkSpeed = Walkspeed2
			


			sprinting = true


			while stamPower > 0 and sprinting == true do





				if Started~=true then


					script.Parent.Dissapear.Value=991291291291291291291289129129129129129129129129129129129129129


					BigFOV:Play()


					Started=true



				end



				bar.Size = UDim2.new(stamPower / 100, 0, 1, 0)


				SideBar.Bar.Size = UDim2.new(1, 0, stamPower/100, 0)


				bar.Visible = true


				SideBar.Bar.Visible = true


				stamPower = stamPower - stamTick


				--BigFOV:Play()


				wait()


				if stamPower <= 0 then


					bar.Visible = false


					--	runSound.PlaybackSpeed = 2
					Walkspeed2 = DEF

					char.Humanoid.WalkSpeed = Walkspeed2


					SmallFOV:Play()


					Started=false


					script.Parent.Dissapear.Value=10


					stamPower=0



				end


			end


		elseif IS == Enum.UserInputState.End then



			if stamPower < 1 then


				bar.Visible = false


				SideBar.Bar.Visible = false


			else


				bar.Visible = true


				SideBar.Bar.Visible = true


			end


			--	runSound.PlaybackSpeed = 2 -- Resets the playback speed to its original value, recommended to leave as is

			Walkspeed2 = DEF
				char.Humanoid.WalkSpeed = Walkspeed2 -- Sets player speed to 16 (Roblox game default), if you change your Roblox game's default player speed, replace 16 with the new value


			sprinting = false


			while stamPower <= 100 and sprinting == false do


				stamPower = stamPower + regenTick


				--	bar.Visible = true


				--SideBar.Bar.Visible = true


				if stamPower > 100 then


					stamPower = 100


				end


				-- SideBar.Bar.Visible = false


				if stamPower < 1 then


					bar.Visible = false


					SideBar.Bar.Visible = false


				else


					bar.Visible = true


					SideBar.Bar.Visible = true


				end



				bar.Size = UDim2.new(stamPower / 100, 0, 1, 0)


				SideBar.Bar.Size = UDim2.new(1, 0, stamPower/100, 0)





				--if cam.FieldOfView > 78 and script.Parent.Dissapear.Value ~= 10 then


				--	Fov(70)


				--	end








				if Started~=false then


					Started=false


					SmallFOV:Play()


					script.Parent.Dissapear.Value=10	


				end



				wait()


			end



		end


	end




	--------------------------------------------------------------------------------------------------------------

	char.Changed:Connect(function()
		if game.Players.LocalPlayer.Character.Humanoid.WalkSpeed ~= Walkspeed2 and game.Players.LocalPlayer.Character.Humanoid.WalkSpeed ~= 10 then
			DEF=game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
			if sprinting == true then
				WalkSpeed2=DEF+17
				game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = DEF
			end
			
		end
	end)

	function updateBobbleEffect()


		local currentTime = tick()


		if  Started == true then


			if humanoid.MoveDirection.Magnitude > 0  then -- we are walking


				local bobbleY = math.abs(math.sin(currentTime * 10)) * .35


				local bobbleX = math.abs(math.sin(currentTime * 10)) * .05



				local bobble = Vector3.new(bobbleX, bobbleY, 0)



				humanoid.CameraOffset = humanoid.CameraOffset:lerp(bobble, .75)





			else -- we are not walking


				humanoid.CameraOffset =humanoid.CameraOffset * 0


			end


		end


	end



	runService.RenderStepped:Connect(updateBobbleEffect)






	local CAS = game:GetService("ContextActionService")



	CAS:BindAction("Sprint", sprint, true, bind1, bind2) -- Binds the keybinds to the sprint function and creates a mobile button for it


	CAS:SetPosition("Sprint", UDim2.new(0.7,0,0,0)) -- Changes the position of the mobile button within the context frame, to read more about how UDim2 positions work, go to https://developer.roblox.com/en-us/api-reference/datatype/UDim2


	CAS:SetTitle("Sprint", "Shift") -- Sets the text on the mobile button, replace Ctrl with any text you desire


end


coroutine.wrap(QCHWWK_fake_script)()


function CJZEISY_fake_script() -- SideBar.LocalScript 


	local script = Instance.new('LocalScript', SideBar)



	script.Parent.Visible = false


end


coroutine.wrap(CJZEISY_fake_script)()





-- ========================================

-- source: github.com/Drop56796/InsanemodeV5  (insanemodeV5.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Door%20Replication/Source.lua  (5992 bytes)

-- Services

local Players = game:GetService("Players")
local TS = game:GetService("TweenService")
local ReSt = game:GetService("ReplicatedStorage")

-- Variables

local Plr = Players.LocalPlayer
local Char = Plr.Character or Plr.CharacterAdded:Wait()
local Hum = Char:WaitForChild("Humanoid")
local Root = Char:WaitForChild("HumanoidRootPart")

local SelfModules = {
    Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
}
local Assets = {
    Door = LoadCustomInstance("https://github.com/RegularVynixu/Utilities/blob/main/Doors/Door%20Replication/Door.rbxm?raw=true")
}

local DoorReplicator = {}

-- Misc Functions

function openDoor(doorTable)
    task.spawn(function()
        local model = doorTable.Model
        local config = doorTable.Config
        local debug = doorTable.Debug
    
        task.spawn(debug.OnDoorPreOpened)
    
        if model:FindFirstChild("Lock") then
            model.Lock.UnlockPrompt.Enabled = false
            model.Lock.M_Thing.C0 = model.Lock.M_Thing.C0 * CFrame.Angles(0, math.rad(-45), 0)
            model.Hinge.Lock:Destroy()
        end
    
        if model:FindFirstChild("Light") then
            model.Light.Color = Color3.fromRGB(197, 113, 88)
            model.Light.Attachment.PointLight.Enabled = true
            model.Light.Hit:Play()
        end
        
        model.Door.CanCollide = false
        model.Door[config.SlamOpen and "SlamOpen" or "Open"]:Play()
        model.Hidden:Destroy()
    
        task.spawn(function()
            local knobC1 = model.Hinge.Knob.C1
    
            TS:Create(model.Hinge.Knob, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {
                C1 = knobC1 * CFrame.Angles(0, 0, math.rad(-35))
            }):Play()
    
            task.wait(0.15)
    
            TS:Create(model.Hinge.Knob, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {
                C1 = knobC1
            }):Play()
        end)
    
        local duration = config.SlamOpen and 0.15 or 0.75
    
        TS:Create(model.Hinge, TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            CFrame = model.Hinge.CFrame * CFrame.Angles(0, math.rad(-90), 0)
        }):Play()

        local nextRoom = workspace.CurrentRooms:WaitForChild(ReSt.GameData.LatestRoom.Value + 1, 1)

        if nextRoom then
            for _, v in next, nextRoom:WaitForChild("Assets"):WaitForChild("Light_Fixtures"):GetDescendants() do
                if v:IsA("Light") then
                    v.Enabled = true
                end
            end
        end

        task.wait(duration)
        task.spawn(debug.OnDoorOpened)
    end)
end

-- Functions

DoorReplicator.CreateDoor = function(config)
    local door = Assets.Door:Clone()
    door.Door.MaterialVariant = "PlywoodALT"
    door.Sign.MaterialVariant = "Plywood"
    door:SetAttribute("IsFakeDoor", true)

    if config.Barricaded then
        door.Lock:Destroy()
        door.Light:Destroy()
        door.Sign:Destroy()
        door.Gui:Destroy()
    else
        door.Boards:Destroy()

        if not config.Locked then
            door.Lock:Destroy()
        end

        if config.Sign == false then
            door.Sign:Destroy()

        elseif config.RoomIndex then
            local text = ""
            
            for _ = 1, 4 - #tostring(config.RoomIndex) do
                text ..= "0"
            end
            text ..= config.RoomIndex + 1
            
            for _, v in next, door.Gui:GetDescendants() do
                if v.ClassName == "TextLabel" then
                    v.Text = text
                end
            end
        end

        if config.Light == false then
            door.Light:Destroy()
        end
    end

    return door
end

DoorReplicator.ReplicateDoor = function(door, config)
    assert(door:FindFirstChild("Hinge"), "Door does not have a hinge")
    assert(not door:FindFirstChild("Boards"), "Cannot replicate a barricaded door")

    for _, v in next, {"Key", "Lockpick"} do
        if not table.find(config.CustomKeyNames, v) then
            table.insert(config.CustomKeyNames, v)
        end
    end

    local doorTable = {
        Model = door,
        Config = config,
        Debug = {
            OnDoorPreOpened = function() end,
            OnDoorOpened = function() end
        }
    }

    if door:FindFirstChild("Lock") then
        local unlockBegan; unlockBegan = door.Lock.UnlockPrompt.PromptButtonHoldBegan:Connect(function()
            for _, v in next, config.CustomKeyNames do
                local key = Char:FindFirstChild(v)

                if key then
                    if key:FindFirstChild("Animations") and key.Animations:FindFirstChild("use") then
                        Hum:LoadAnimation(key.Animations.use):Play()
                    end

                    return
                end
            end
            
            firesignal(ReSt.Bricks.Caption.OnClientEvent, "You need a key!")
        end)

        local unlockTriggered; unlockTriggered = door.Lock.UnlockPrompt.Triggered:Connect(function()
            for _, v in next, config.CustomKeyNames do
                local key = Char:FindFirstChild(v)

                if key then
                    unlockBegan:Disconnect()
                    unlockTriggered:Disconnect()

                    if config.DestroyKey ~= false then
                        key:Destroy()
                    end
                    
                    openDoor(doorTable)
                end
            end
        end)
    else
        task.spawn(function()
            while doorTable.Model.Parent and Root do
                if (Root.Position - doorTable.Model.Door.Position).Magnitude <= doorTable.Config.DetectionRange then
                    openDoor(doorTable)
    
                    break
                end
    
                task.wait()
            end
        end)
    end

    return doorTable
end

-- Scripts

return DoorReplicator

-- (nested) https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua  (3452 bytes)


-- ========================================

-- source: github.com/Drop56796/InsanemodeV5  (insanemodeV5.lua)
-- [resolved Unknown-VM] https://raw.githubusercontent.com/Jahani-john/mayhem-mode/main/mayhemmode-main/loader.lua — deobfuscating target:

-- (remote Unknown-VM target; constants not extractable here)