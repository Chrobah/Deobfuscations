--[[
    UI-Lib.lua  —  organised by minimarchbleeding
    Original : Drop56796/Custom  ->  UI-Lib.lua
    Not obfuscated; reproduced as-is.
--]]

--look out
local UILib = {}

local function setFont(instance)
    instance.Font = Enum.Font.Jura
end

function UILib:CreateFrame(parent, size, position, anchorPoint, transparency)
    local frame = Instance.new("Frame", parent)
    frame.Size = size
    frame.Position = position
    frame.AnchorPoint = anchorPoint
    frame.BackgroundTransparency = transparency
    setFont(frame)
    return frame
end

function UILib:CreateButton(parent, size, text, transparency, position)
    local button = Instance.new("TextButton", parent)
    button.Size = size
    button.Position = position or UDim2.new(0, 0, 0, 0)
    button.Text = text
    button.BackgroundTransparency = transparency
    setFont(button)
    return button
end

function UILib:CreateLabel(parent, size, text, transparency, position)
    local label = Instance.new("TextLabel", parent)
    label.Size = size
    label.Position = position or UDim2.new(0, 0, 0, 0)
    label.Text = text
    label.BackgroundTransparency = transparency
    setFont(label)
    return label
end

function UILib:CreateSlider(parent, size, color, position)
    local slider = Instance.new("Frame", parent)
    slider.Size = size
    slider.Position = position or UDim2.new(0, 0, 0, 0)
    slider.BackgroundColor3 = color
    setFont(slider)

    local sliderButton = Instance.new("TextButton", slider)
    sliderButton.Size = UDim2.new(0.1, 0, 1, 0)
    sliderButton.Position = UDim2.new(0, 0, 0, 0)
    sliderButton.Text = ""
    sliderButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
    setFont(sliderButton)

    return slider, sliderButton
end

function UILib:CreateProgressBar(parent, size, color, position)
    local progressBar = Instance.new("Frame", parent)
    progressBar.Size = size
    progressBar.Position = position or UDim2.new(0, 0, 0, 0)
    progressBar.BackgroundColor3 = color
    setFont(progressBar)

    local progress = Instance.new("Frame", progressBar)
    progress.Size = UDim2.new(0, 0, 1, 0)
    progress.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
    setFont(progress)

    return progressBar, progress
end

return UILib
