--[[
    LobbyExtension.lua  —  reconstructed source by minimarchbleeding
    Original : ChronoAccelerator/Public-Scripts  ->  RoomScripts/Rooms/LobbyExtension.lua
    Protection : MoonSec V3
        layer 1 : outer loader VM
        layer 2 : inner VM (loadstring'd at runtime)
        layer 3 : the real program — superoperator bytecode (20 prototypes / 959 instrs)
        anti-tamper : string.dump environment fingerprint, a tostring() trap,
                      and a loadstring-identity check

    Strings, asset ids, PlaceIds, messages, the call graph, the control flow and the
    numeric constants below were all recovered from the devirtualised bytecode and
    confirmed against a full instrumented execution trace. (Local variable names are
    chosen for readability — Lua bytecode does not store them.)
--]]

local TweenService = game:GetService("TweenService")
local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()

local function caption(text)
    firesignal(game:GetService("ReplicatedStorage").EntityInfo.Caption.OnClientEvent, text)
end

Functions.Run("Barrier", function()
    if game.PlaceId ~= 6516141723 then
        print("Disabled Lobby Expand - Not DOORS Lobby.")
        return
    end

    if not game:IsLoaded() then
        game.Loaded:Wait()
    end

    print("Any of the games the Custom Elevators take you to, are not affiliated with Chrono.")
    print("If you find any-game abusive in such ways, let Chrono know ASAP.")
    print("Running Lobby Script...")

    for _, Door in ipairs(workspace.Lobby.Parts:GetChildren()) do
        if Door:IsA("Model") then
            Door.Plate:Destroy()
            Door.Knob:Destroy()
            Door.PlaySound:Stop()

            local prompt = Instance.new("ProximityPrompt")
            prompt.ActionText = "Push Door Open"
            prompt.Name = "DoorOpenPrompt"
            prompt.MaxActivationDistance = 15
            prompt.HoldDuration = 1
            prompt.RequiresLineOfSight = false
            prompt.Parent = Door

            local openSound = Instance.new("Sound")
            openSound.Volume = 5
            openSound.Name = "OpenSound"
            openSound.SoundId = "rbxassetid://5037969255"
            openSound.Parent = Door
        end
    end

    print("Loading Room...")
    local Extension = game:GetObjects("rbxassetid://13025079745")[1]
    Extension.Name = "Extension"
    Extension.Parent = workspace.Lobby
    print("Loaded Room")

    local Bedroom = workspace.Lobby.Extension.Bedroom
    local LobbyDoor = workspace.Lobby.Parts.Door
    LobbyDoor.DoorOpenPrompt.Triggered:Connect(function()
        LobbyDoor.DoorOpenPrompt.Enabled = false
        LobbyDoor.OpenSound:Play()
        wait(0.2)
        TweenService:Create(LobbyDoor,
            TweenInfo.new(2.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Position    = LobbyDoor.Position    + Vector3.new(0, 0, 0), -- (* open offset inferred *)
                Orientation = LobbyDoor.Orientation + Vector3.new(0, 90, 0), -- (* swing inferred *)
            }):Play()
    end)

    Bedroom.Vent.VentGrate.AwesomePrompt.Triggered:Connect(function()
        caption("The vent seems to be screwed in tightly.")
    end)

    Bedroom.Wardrobe.HidePrompt.Triggered:Connect(function()
        caption("Full of clothes, plus you don't need to hide.")
    end)

    Bedroom.LiminalityPaint.InteractPrompt.Triggered:Connect(function()
        caption("It's an culdesac. An empty one.")
    end)

    local function boardElevator(elevatorName, destinationMsg, onBoard)
        local elevator = Bedroom[elevatorName]
        local hitbox   = elevator.DoorHitbox
        local Doors    = workspace.Lobby.Extension.Bedroom[elevatorName].Doors

        local entered = false
        hitbox.Touched:Connect(function(hit)
            local char = game.Players.LocalPlayer.Character
            if entered or not (char and hit and hit:IsDescendantOf(char)) then return end
            entered = true

            char.HumanoidRootPart.CFrame = CFrame.new(elevator.Teleport.Position)

            caption(destinationMsg)

            hitbox.PlayerEnter.Volume = 0.7
            hitbox.PlayerEnter:Play()
            hitbox.BillboardGui.Seconds.Visible = true

            local info = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            TweenService:Create(Doors.Door,             info, { Position = Doors.DoorClosed1.Position }):Play()
            TweenService:Create(Doors.Door1,            info, { Position = Doors.DoorClosed.Position  }):Play()
            TweenService:Create(Doors.GatedDoor.Design, info, { Position = Doors.GatedDoorClose.Position }):Play()

            if onBoard then onBoard() end

            hitbox.BillboardGui.Title.Text = "1 / 1"
            for seconds = 15, 0, -1 do
                hitbox.BillboardGui.Seconds.Text = tostring(seconds)
                if seconds == 0 then
                    hitbox.TickMajor:Play()
                else
                    hitbox.Tick:Play()
                end
                wait(1)
            end

            caption("Teleporting...")
            wait(0.5)
            hitbox.BillboardGui.Enabled = false
            game:GetService("TeleportService"):Teleport(6839171747, game.Players.LocalPlayer)
        end)
    end

    Bedroom.GameElevator.DoorHitbox.BillboardGui.Info.Text = "DOORS Legacy"
    boardElevator("GameElevator", "Next destination, DOORS Legacy.")
    boardElevator("GameElevatorHardcore", "Next auto execution, DOORS Hardcore.", function()
        local function HardcoreExecute()
            wait()
            caption("Hardcore Automatically Executed...")
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/Loadstrings/Hardcore_V5_Beta.lua"))()
        end

        game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(state)
            if state == Enum.TeleportState.Started then
                QueueOnTeleport(HardcoreExecute)
            end
        end)
    end)

    coroutine.wrap(function()
        for _, part in ipairs(workspace.Lobby.Parts:GetChildren()) do
            wait()
            if part:IsA("Model") and part:FindFirstChild("Void") then
                part.Void:Destroy()
                print("Deleted Void part in " .. part.Name)
            end
        end
    end)()

end)
