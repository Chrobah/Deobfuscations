--[[
    A.lua  —  organised by minimarchbleeding
    Original : Drop56796/CloseButton  ->  A.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/Drop56796/CreepyEyeHub/main/CreepyEyeHub.lua
--]]

local UserInputService = game:GetService("UserInputService")

local button = Instance.new("ImageButton", game.Players.LocalPlayer.PlayerGui)
button.Size = UDim2.new(0, 100, 0, 100) 
button.Position = UDim2.new(0.5, 10, 0.5, 10) 
button.Image = "rbxassetid://18148044143" 

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    button.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

button.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = button.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

button.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

button.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/CreepyEyeHub/main/CreepyEyeHub.lua"))()
end)
