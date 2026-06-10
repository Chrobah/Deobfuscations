--[[
    Hub.lua  —  organised by minimarchbleeding
    Original : Drop56796/V5  ->  Hub.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/Drop56796/Hub-V5-Beta-/main/Script%20code.lua
--]]

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local imageButton = Instance.new("ImageButton")
imageButton.Parent = screenGui
imageButton.Size = UDim2.new(0, 50, 0, 50)
imageButton.Position = UDim2.new(0, 0, 0, 30)  -- 放置到左上角并向下偏移30像素
imageButton.Image = "rbxassetid://3457898957" -- 这里的数字应该替换为您的资源ID

-- 实现触摸拖动功能
local dragging = false
local dragInput, touchPos, framePos

local function update(input)
    local delta = input.Position - touchPos
    local newPosition = UDim2.new(
        framePos.X.Scale, framePos.X.Offset + delta.X,
        framePos.Y.Scale, framePos.Y.Offset + delta.Y
    )
    imageButton.Position = newPosition
end

imageButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        touchPos = input.Position
        framePos = imageButton.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

imageButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)

imageButton.TouchTap:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Hub-V5-Beta-/main/Script%20code.lua"))()
end)
