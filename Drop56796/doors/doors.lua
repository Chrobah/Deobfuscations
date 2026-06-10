--[[
    doors.lua  —  organised by minimarchbleeding
    Original : Drop56796/doors  ->  doors.lua
    Not obfuscated; reproduced as-is.
--]]

-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Player and GUI setup
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "GameUI"

-- Slider UI Creation
local function createSlider(name, min, max, defaultValue, position, parent)
    local sliderFrame = Instance.new("Frame", parent)
    sliderFrame.Name = name .. "SliderFrame"
    sliderFrame.Size = UDim2.new(0, 200, 0, 50)
    sliderFrame.Position = position
    sliderFrame.BackgroundColor3 = Color3.new(1, 1, 1)
    sliderFrame.BackgroundTransparency = 0.5

    local sliderBar = Instance.new("Frame", sliderFrame)
    sliderBar.Name = "SliderBar"
    sliderBar.Size = UDim2.new(1, -20, 0.5, 0)
    sliderBar.Position = UDim2.new(0, 10, 0.25, 0)
    sliderBar.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    sliderBar.BackgroundTransparency = 0.5

    local sliderButton = Instance.new("TextButton", sliderBar)
    sliderButton.Name = "SliderButton"
    sliderButton.Size = UDim2.new(0, 20, 1, 0)
    sliderButton.Position = UDim2.new((defaultValue - min) / (max - min), -10, 0, 0)
    sliderButton.BackgroundColor3 = Color3.new(0, 0, 0)
    sliderButton.Text = ""

    local dragging = false
    sliderButton.MouseButton1Down:Connect(function()
        dragging = true
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local scale = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
            sliderButton.Position = UDim2.new(scale, -10, 0, 0)
            local value = math.floor(min + (max - min) * scale)
            -- Call function to update value here
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

-- ESP Toggle UI Creation
local function createESPToggle(position, parent)
    local espToggle = Instance.new("TextButton", parent)
    espToggle.Name = "ESPToggle"
    espToggle.Size = UDim2.new(0, 100, 0, 50)
    espToggle.Position = position
    espToggle.BackgroundColor3 = Color3.new(1, 1, 1)
    espToggle.Text = "ESP: Off"
    espToggle.BackgroundTransparency = 0.5

    local espEnabled = false
    espToggle.MouseButton1Click:Connect(function()
        espEnabled = not espEnabled
        espToggle.Text = espEnabled and "ESP: On" or "ESP: Off"
        -- ESP Implementation
local ESPEnabled = false -- Toggle for ESP

-- Function to create ESP labels
local function createESPLabel(target, name)
    local espLabel = Instance.new("BillboardGui", target)
    espLabel.Name = "ESPLabel"
    espLabel.Size = UDim2.new(0, 100, 0, 50)
    espLabel.AlwaysOnTop = true
    local textLabel = Instance.new("TextLabel", espLabel)
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.Text = name
    textLabel.BackgroundTransparency = 1
    textLabel.TextSize = 14
    textLabel.Font = Enum.Font.Code
    textLabel.TextColor3 = Color3.new(1, 1, 1)
end

-- Function to toggle ESP for items, doors, and entities
local function toggleESP(enable)
    ESPEnabled = enable
    if ESPEnabled then
        -- Create ESP labels for items, doors, and entities
        for _, object in pairs(Workspace:GetDescendants()) do
            if object:IsA("BasePart") and (object.Name == "Flashlight" or object.Name == "Door" or object:IsA("Model")) then
                if not object:FindFirstChild("ESPLabel") then
                    createESPLabel(object, object.Name)
                end
            end
        end
    else
        -- Remove ESP labels
        for _, label in pairs(Workspace:GetDescendants()) do
            if label:IsA("BillboardGui") and label.Name == "ESPLabel" then
                label:Destroy()
            end
        end
    end
end

-- Keybind to toggle ESP
player:GetMouse().KeyDown:Connect(function(key)
    if key == "e" then
        toggleESP(not ESPEnabled)
    end
end)

-- Update ESP labels each frame
RunService.RenderStepped:Connect(function()
    if ESPEnabled then
        for _, object in pairs(Workspace:GetDescendants()) do
            if object:IsA("BasePart") and (object.Name == "Flashlight" or object.Name == "Door" or object:IsA("Model")) then
                if not object:FindFirstChild("ESPLabel") then
                    createESPLabel(object, object.Name)
                end
            end
        end
    end
end)
    end)
end

-- Example usage
createSlider("FOV", 70, 120, 90, UDim2.new(0, 50, 0, 50), screenGui)
createSlider("Speed", 16, 50, 16, UDim2.new(0, 50, 0, 110), screenGui)
createESPToggle(UDim2.new(0, 50, 0, 170), screenGui)
