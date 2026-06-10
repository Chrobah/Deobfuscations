--[[
    Code.lua  —  organised by minimarchbleeding
    Original : Drop56796/V5-Hub  ->  Code.lua
    Not obfuscated; reproduced as-is.
--]]

-- 创建屏幕GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- 创建内部圆角边框框架
local frame = Instance.new("Frame")
frame.Parent = screenGui
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Size = UDim2.new(0, 700, 0, 600)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
frame.BackgroundTransparency = 0.5
frame.ZIndex = 2

-- 创建内部圆角UI
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 12)
uiCorner.Parent = frame

-- 创建文本标签
local textLabel = Instance.new("TextLabel")
textLabel.Text = "Trauma Hub V5"
textLabel.AnchorPoint = Vector2.new(0, 0)
textLabel.Size = UDim2.new(0, 200, 0, 50)
textLabel.Position = UDim2.new(0, 10, 0, 10)
textLabel.Font = Enum.Font.Oswald
textLabel.TextColor3 = Color3.fromRGB(255, 222, 189)
textLabel.BackgroundTransparency = 1
textLabel.TextScaled = true
textLabel.TextSize = 36
textLabel.Parent = frame

-- 创建script mode切换按钮
local toggleButton1 = Instance.new("TextButton")
toggleButton1.Text = "script mode"
toggleButton1.Size = UDim2.new(0, 100, 0, 50)
toggleButton1.Position = UDim2.new(0, 10, 0, textLabel.Position.Y.Offset + 70)
toggleButton1.Font = Enum.Font.Oswald
toggleButton1.TextSize = 24
toggleButton1.BackgroundColor3 = Color3.fromRGB(255, 255, 0) -- 黄色背景
toggleButton1.BackgroundTransparency = 0.5
toggleButton1.ZIndex = 3
toggleButton1.Parent = frame

local buttonUICorner1 = Instance.new("UICorner")
buttonUICorner1.CornerRadius = UDim.new(0, 12)
buttonUICorner1.Parent = toggleButton1

-- 创建第一个按钮框架
local buttonFrame1 = Instance.new("Frame")
buttonFrame1.Size = UDim2.new(0, 600, 0, 500)
buttonFrame1.Position = UDim2.new(0, toggleButton1.Position.X.Offset, 0, toggleButton1.Position.Y.Offset + 60)
buttonFrame1.BackgroundTransparency = 1
buttonFrame1.Parent = frame
buttonFrame1.Visible = false

toggleButton1.MouseButton1Click:Connect(function()
    buttonFrame1.Visible = not buttonFrame1.Visible
end)

local function createButton(name, scriptUrl, xOffset, yOffset, parentFrame)
    local btn = Instance.new("TextButton")
    btn.Text = name
    btn.Size = UDim2.new(0, 135, 0, 40)
    btn.Position = UDim2.new(0, xOffset, 0, yOffset)
    btn.Font = Enum.Font.Oswald
    btn.TextSize = 15
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
    btn.BackgroundTransparency = 0.5
    btn.ZIndex = 3
    btn.Parent = parentFrame
    
    local btnUICorner = Instance.new("UICorner")
    btnUICorner.CornerRadius = UDim.new(0, 8)
    btnUICorner.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(scriptUrl))()
    end)
end

-- 按钮之间的间距
local buttonSpacingX = 150
local buttonSpacingY = 50
local buttonsPerRow = 4

-- 创建script mode按钮列表和绑定脚本
local buttons1 = {
    {"Hardcore Remake(Fluxus Only)", "https://raw.githubusercontent.com/Drop56796/Hardcore-Remake/main/Hardcore%20Remake(Made%20by%20Jay).lua"},
    {"Hardcore", "https://raw.githubusercontent.com/JevilOhio/Doors-Hardcore-noonie-ver-/main/Doors%20Hardcore%20(noonie)"},
    {"Hardcore but bad", "https://raw.githubusercontent.com/munciseek/Scriptmode/mode/Hardcore-but-bad"},
    {"Hardcore Another", "https://raw.githubusercontent.com/plamen6789/HardcoreScriptDOORS/main/HardcoreModeScript"},
    {"Psychotic", "https://raw.githubusercontent.com/Drop56796/Psychotic-mode/main/Protected_6994809429776257.lua.txt"},
    {"Hamor", "https://raw.githubusercontent.com/munciseek/Scriptmode/mode/Hamor"},
    {"Extreme", "https://raw.githubusercontent.com/munciseek/Scriptmode/main/Extreme"},
    {"Insane V5", "https://raw.githubusercontent.com/thefigureblack/doors/main/insanemodev5.lua"},
    {"Insane V6", "https://raw.githubusercontent.com/Drop56796/InsaneV6/main/InsaneV6.lua"},
    {"impossible", "https://raw.githubusercontent.com/Drop56796/impossible-mode/main/impossible.lua"},
    {"DevTroll", "https://glot.io/snippets/gotfeffesc/raw/main.lua"},
    {"Fear", "https://raw.githubusercontent.com/cool59572/freestuff/main/Mods/FearMode.lua"},
    {"Hazy", "https://raw.githubusercontent.com/Drop56796/Jabiess-Hazy-Mode-/main/Hazy%20Mode.lua"},
    {"Endless", "https://raw.githubusercontent.com/munciseek/Scriptmode/mode/Endless"},
    {"Birthday", "https://raw.githubusercontent.com/munciseek/Scriptmode/mode/Birthday"},
    {"Fragmented V4", "https://raw.githubusercontent.com/munciseek/Scriptmode/main/Fragmented"},
    {"Cat(Gay)", "https://raw.githubusercontent.com/munciseek/Scriptmode/mode/Cat"},
    {"Furry(F**K YOU)", "https://raw.githubusercontent.com/munciseek/Scriptmode/mode/Furry"},
    {"Devil", "https://raw.githubusercontent.com/munciseek/Scriptmode/mode/Devil"},
    {"New Nightmare", "https://raw.githubusercontent.com/munciseek/Scriptmode/mode/Nightmare"},
    {"Insanity", "https://raw.githubusercontent.com/munciseek/Scriptmode/mode/lnsanity"}
}

-- 创建script mode按钮并放置在网格中
for i, button in ipairs(buttons1) do
    local row = math.floor((i - 1) / buttonsPerRow)
    local col = (i - 1) % buttonsPerRow
    local xOffset = col * buttonSpacingX
    local yOffset = row * buttonSpacingY
    createButton(button[1], button[2], xOffset, yOffset, buttonFrame1)
end

-- 创建新的切换按钮
local toggleButton2 = Instance.new("TextButton")
toggleButton2.Text = "Other"
toggleButton2.Size = UDim2.new(0, 100, 0, 50)
toggleButton2.Position = UDim2.new(0, 120, 0, toggleButton1.Position.Y.Offset) -- 新按钮在原按钮右侧
toggleButton2.Font = Enum.Font.Oswald
toggleButton2.TextSize = 24
toggleButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 0) -- 黄色背景
toggleButton2.BackgroundTransparency = 0.5
toggleButton2.ZIndex = 3
toggleButton2.Parent = frame

local buttonUICorner2 = Instance.new("UICorner")
buttonUICorner2.CornerRadius = UDim.new(0, 12)
buttonUICorner2.Parent = toggleButton2

-- 创建第二个按钮框架
local buttonFrame2 = Instance.new("Frame")
buttonFrame2.Size = UDim2.new(0, 600, 0, 250)
buttonFrame2.Position = UDim2.new(0, toggleButton2.Position.X.Offset, 0, toggleButton2.Position.Y.Offset + 60)
buttonFrame2.BackgroundTransparency = 1
buttonFrame2.Parent = frame
buttonFrame2.Visible = false

toggleButton2.MouseButton1Click:Connect(function()
    buttonFrame2.Visible = not buttonFrame2.Visible
end)

-- 创建新按钮列表和绑定脚本
local buttons2 = {
    {"MSHUB", "https://raw.githubusercontent.com/mstudio45/MSDOORS/main/MSHUB_Loader.lua"},
    {"FFJ1", "https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"},
    {"Floor2 Candle", "https://raw.githubusercontent.com/Drop56796/Floor-2-candle-By-icherryKardess-/The-Floor-2-candle-(By-icherryKardess)/Floor2%20candle%20(The%20candle%20by%20icherrykardess).lua"},
    {"Floor2 Package", "https://raw.githubusercontent.com/iCherryKardes/Doors/main/Floor%202%20Mod"},
    {"Vape V4", "https://raw.githubusercontent.com/Drop56796/Vape-V4/main/%E7%94%B5%E5%AD%90%E7%83%9FV4.lua"}
}

-- 创建新按钮并放置在网格中
for i, button in ipairs(buttons2) do
    local row = math.floor((i - 1) / buttonsPerRow)
    local col = (i - 1) % buttonsPerRow
    local xOffset = col * buttonSpacingX
    local yOffset = row * buttonSpacingY
    createButton(button[1], button[2], xOffset, yOffset, buttonFrame2)
end

local userInputService = game:GetService("UserInputService")
local dragging = false
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

userInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)
