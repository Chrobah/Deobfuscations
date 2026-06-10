--[[
    lib.lua  —  organised by minimarchbleeding
    Original : Drop56796/Code-blue  ->  lib.lua
    Not obfuscated; reproduced as-is.
--]]

-- UiLib 模块脚本部分
local UiLib = {}

function UiLib:CreateScreenGui(name, parent)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = name
    screenGui.Parent = parent or game.Players.LocalPlayer:WaitForChild("PlayerGui")
    return screenGui
end

function UiLib:CreateFrame(size, position, color, parent)
    local frame = Instance.new("Frame")
    frame.Size = size
    frame.Position = position
    frame.BackgroundColor3 = color
    frame.Parent = parent
    return frame
end

function UiLib:CreateTextButton(size, position, text, color, textColor, parent, callback)
    local button = Instance.new("TextButton")
    button.Size = size
    button.Position = position
    button.BackgroundColor3 = color
    button.TextColor3 = textColor
    button.Text = text
    button.Font = Enum.Font.SourceSans
    button.TextSize = 20
    button.Parent = parent

    button.MouseButton1Click:Connect(callback)
    return button
end

function UiLib:CreateTextBox(size, position, placeholderText, color, textColor, parent)
    local textBox = Instance.new("TextBox")
    textBox.Size = size
    textBox.Position = position
    textBox.BackgroundColor3 = color
    textBox.TextColor3 = textColor
    textBox.PlaceholderText = placeholderText
    textBox.Font = Enum.Font.SourceSans
    textBox.TextSize = 20
    textBox.Parent = parent
    return textBox
end

function UiLib:CreateSlider(size, position, min, max, initialValue, color, parent, callback)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = size
    sliderFrame.Position = position
    sliderFrame.BackgroundColor3 = color
    sliderFrame.Parent = parent

    local slider = Instance.new("Frame")
    slider.Size = UDim2.new((initialValue - min) / (max - min), 0, 1, 0)
    slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    slider.Parent = sliderFrame

    local function updateSlider(input)
        local pos = UDim2.new(math.clamp((input.Position.X - sliderFrame.AbsolutePosition.X) / sliderFrame.AbsoluteSize.X, 0, 1), 0, 1, 0)
        slider.Size = pos
        local value = math.floor(min + ((max - min) * pos.X.Scale))
        callback(value)
    end

    sliderFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            updateSlider(input)
        end
    end)

    sliderFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            updateSlider(input)
        end
    end)

    return sliderFrame
end

-- 新增函数：创建 Toggle
function UiLib:CreateToggleButton(size, position, text, color, textColor, parent, callback)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Size = size
    toggleFrame.Position = position
    toggleFrame.BackgroundColor3 = color
    toggleFrame.Parent = parent

    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(1, -20, 1, -20)
    toggleButton.Position = UDim2.new(0, 10, 0, 10)
    toggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.Text = text
    toggleButton.TextColor3 = textColor
    toggleButton.TextSize = 20
    toggleButton.Font = Enum.Font.SourceSans
    toggleButton.Parent = toggleFrame

    local isToggled = false
    toggleButton.MouseButton1Click:Connect(function()
        isToggled = not isToggled
        toggleButton.BackgroundColor3 = isToggled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        callback(isToggled)
    end)

    return toggleFrame
end

-- 添加 CreateBackground 函数
function UiLib:CreateBackground(size, position, color, parent)
    local background = Instance.new("Frame")
    background.Size = size
    background.Position = position
    background.BackgroundColor3 = color
    background.Parent = parent
    return background
end

-- 添加 CreateTitle 函数
function UiLib:CreateTitle(size, position, text, backgroundColor, textColor, parent)
    local titleFrame = Instance.new("Frame")
    titleFrame.Size = size
    titleFrame.Position = position
    titleFrame.BackgroundColor3 = backgroundColor
    titleFrame.Parent = parent

    local titleText = Instance.new("TextLabel")
    titleText.Size = UDim2.new(1, 0, 1, 0)
    titleText.Text = text
    titleText.TextColor3 = textColor
    titleText.Font = Enum.Font.SourceSans
    titleText.TextSize = 24
    titleText.BackgroundTransparency = 1
    titleText.Parent = titleFrame

    return titleFrame
end
