--[[
    Doors.lua  —  organised by minimarchbleeding
    Original : Drop56796/Doors-Sound  ->  Doors.lua
    Not obfuscated; reproduced as-is.
--]]

workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Open.SoundId = "rbxassetid://833871080"
        workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Unlock.SoundId = "rbxassetid://833871080"
        workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.SlamOpen.SoundId = "rbxassetid://833871080"
        workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.SlamOpen.TimePosition = 0.2
-- doors
coroutine.wrap(function()
    while true do
        wait(0.0005)
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        wait(0.0005)
        workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Open.SoundId = "rbxassetid://833871080"
        workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Unlock.SoundId = "rbxassetid://833871080"
        workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.SlamOpen.SoundId = "rbxassetid://833871080"
        workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.SlamOpen.TimePosition = 0.2
    end
end)()

-- doors 2
coroutine.wrap(function()
    while true do
        wait(0.0005)
        game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
        wait(0.0005)
workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Parts.DoorNormal.Door.Open.SoundId = "rbxassetid://833871080"
workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Parts.DoorNormal.Door.Open.SoundId = "rbxassetid://833871080"
workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Parts.DoorNormal.Door.Open.SoundId = "rbxassetid://833871080"
workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Parts.DoorNormal.Door.Open.SoundId = "rbxassetid://833871080"
workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Parts.DoorNormal.Door.Unlock.SoundId = "rbxassetid://833871080"
workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Parts.DoorNormal.Door.Unlock.SoundId = "rbxassetid://833871080"
workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Parts.DoorNormal.Door.Unlock.SoundId = "rbxassetid://833871080"
workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Parts.DoorNormal.Door.Unlock.SoundId = "rbxassetid://833871080"
    end
end)()
