--[[
    Script mode.lua  —  organised by minimarchbleeding
    Original : Drop56796/Hub-V5-Beta-  ->  Script mode.lua
    Not obfuscated; reproduced as-is.
--]]

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainFrame = Instance.new("ImageLabel")
mainFrame.Size = UDim2.new(0, 750, 0, 435)
mainFrame.Position = UDim2.new(0.5, -375, 0.5, -217.5)
mainFrame.BackgroundTransparency = 1
mainFrame.Image = "rbxassetid://3457898957"
mainFrame.Parent = screenGui

local mainUICorner = Instance.new("UICorner")
mainUICorner.CornerRadius = UDim.new(0, 20)
mainUICorner.Parent = mainFrame

local function createButton(name, position, text, url)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 150, 0, 50)
    button.Position = position
    button.Text = text
    button.BackgroundColor3 = Color3.fromRGB(120, 150, 150)
    button.Parent = mainFrame

    local buttonUICorner = Instance.new("UICorner")
    buttonUICorner.CornerRadius = UDim.new(0, 20)
    buttonUICorner.Parent = button

    button.MouseButton1Click:Connect(function()
        print("Button '" .. text .. "' clicked.")
        local success, message = pcall(function()
            loadstring(game:HttpGet(url))()
        end)
        if not success then
            warn("Failed to load script for '" .. text .. "': " .. message)
        end
    end)

    return button
end

-- Button Definitions
local buttons = {
    {name = "button1", position = UDim2.new(0, 10, 0, 10), text = "Hardcore Remake", url = "https://raw.githubusercontent.com/Drop56796/Hardcore-Remake/main/Hardcore%20Remake(Made%20by%20Jay).lua"},
    {name = "button2", position = UDim2.new(0, 10, 0, 70), text = "Hardcore (A-V)", url = "https://raw.githubusercontent.com/plamen6789/HardcoreScriptDOORS/main/HardcoreModeScript"},
    {name = "button4", position = UDim2.new(0, 10, 0, 130), text = "Hardcore but bad", url = "https://raw.githubusercontent.com/munciseek/Scriptmode/mode/Hardcore-but-bad"},
    {name = "button7", position = UDim2.new(0, 10, 0, 190), text = "Hardcore Original", url = "https://raw.githubusercontent.com/JevilOhio/Doors-Hardcore-noonie-ver-/main/Doors%20Hardcore%20(noonie)"},
    {name = "button6", position = UDim2.new(0, 200, 0, 10), text = "Psychotic", url = "https://raw.githubusercontent.com/Drop56796/Psychotic-mode/main/0.lua"},
    {name = "button8", position = UDim2.new(0, 200, 0, 70), text = "Hamor", url = "https://raw.githubusercontent.com/munciseek/Scriptmode/mode/Hamor"},
    {name = "button9", position = UDim2.new(0, 200, 0, 130), text = "Extreme", url = "https://raw.githubusercontent.com/munciseek/Scriptmode/main/Extreme"},
    {name = "button10", position = UDim2.new(0, 200, 0, 190), text = "Insane V5", url = "https://raw.githubusercontent.com/thefigureblack/doors/main/insanemodev5.lua"},
    {name = "button11", position = UDim2.new(0, 200, 0, 250), text = "Insane V6", url = "https://raw.githubusercontent.com/Drop56796/InsaneV6/main/InsaneV6.lua"},
    {name = "button12", position = UDim2.new(0, 200, 0, 310), text = "Impossible", url = "https://raw.githubusercontent.com/Ukazix/impossible-mode/main/Protected_79.lua.txt"},
    {name = "button13", position = UDim2.new(0, 400, 0, 10), text = "DevTroll", url = "https://glot.io/snippets/gotfeffesc/raw/main.lua"},
    {name = "button14", position = UDim2.new(0, 400, 0, 70), text = "Fear", url = "https://raw.githubusercontent.com/cool59572/freestuff/main/Mods/FearMode.lua"},
    {name = "button15", position = UDim2.new(0, 400, 0, 130), text = "Hazy", url = "https://raw.githubusercontent.com/Drop56796/Jabiess-Hazy-Mode-/main/Hazy%20Mode.lua"},
    {name = "button16", position = UDim2.new(0, 400, 0, 190), text = "Nightmare", url = "https://raw.githubusercontent.com/Drop56796/nightmare/main/nightmare%20mode.lua"},
    {name = "button17", position = UDim2.new(0, 400, 0, 250), text = "Endless", url = "https://raw.githubusercontent.com/munciseek/Scriptmode/mode/Endless"},
    {name = "button18", position = UDim2.new(0, 400, 0, 310), text = "Birthday", url = "https://raw.githubusercontent.com/munciseek/Scriptmode/mode/Birthday"},
    {name = "button19", position = UDim2.new(0, 600, 0, 10), text = "Furry Gay", url = "https://raw.githubusercontent.com/munciseek/Scriptmode/mode/Furry"},
    {name = "button20", position = UDim2.new(0, 600, 0, 70), text = "Cat Gay", url = "https://raw.githubusercontent.com/munciseek/Scriptmode/mode/Cat"},
    {name = "button1b", position = UDim2.new(0, 600, 0, 130), text = "Fragmented V4", url = "https://raw.githubusercontent.com/munciseek/Scriptmode/main/Fragmented"},
}

for _, buttonData in pairs(buttons) do
    createButton(buttonData.name, buttonData.position, buttonData.text, buttonData.url)
end

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 50, 0, 50)
closeButton.Position = UDim2.new(1, -60, 1, -60)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Parent = mainFrame

local closeUICorner = Instance.new("UICorner")
closeUICorner.CornerRadius = UDim.new(0, 20)
closeUICorner.Parent = closeButton
closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

local userInputService = game:GetService("UserInputService")
local dragging = false
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

userInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)
