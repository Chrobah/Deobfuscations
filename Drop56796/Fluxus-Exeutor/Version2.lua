--[[
    Version2.lua  —  organised by minimarchbleeding
    Original : Drop56796/Fluxus-Exeutor  ->  Version2.lua
    Not obfuscated; reproduced as-is.
--]]

-- 检测和删除FluxusAndroidUI
local CoreGui = game:GetService("CoreGui")
local fluxusUI = CoreGui:FindFirstChild("FluxusAndroidUI")
local function removeFluxusAndroidUI()
    if fluxusUI then
        fluxusUI:Destroy()
    end
end

-- 立即执行检测和删除
removeFluxusAndroidUI()
-- 如果之后还需要持续检测，可以使用以下代码定时检测
-- while true do
--     removeFluxusAndroidUI()
--     wait(5) -- 每5秒检测一次
-- end
local TweenService = game:GetService("TweenService")

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local ImageButton = Instance.new("ImageButton")
local ToggleButton = Instance.new("TextButton")
local TextBox = Instance.new("TextBox")
local ExecuteButton = Instance.new("TextButton")
local ClearButton = Instance.new("TextButton")
local ConsoleToggle = Instance.new("TextButton")
local ConsoleTextBox = Instance.new("TextBox")
local CloseButton = Instance.new("TextButton")
local CreditsToggle = Instance.new("TextButton")
local CreditsTextBox = Instance.new("TextBox")

ScreenGui.Name = "FluxusAndroidUI"
ScreenGui.Parent = CoreGui

-- Main Frame setup
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.Size = UDim2.new(0, 50, 0, 50)  -- Initial collapsed size
Frame.Position = UDim2.new(1, -55, 0, 5)

UICorner.Parent = Frame
UICorner.CornerRadius = UDim.new(0, 20)

-- ImageButton setup
ImageButton.Parent = Frame
ImageButton.Size = UDim2.new(0, 50, 0, 50)
ImageButton.Position = UDim2.new(0, 0, 0, 0)
ImageButton.Image = "rbxassetid://13327193518"  -- Replace with your AssetID
ImageButton.BackgroundTransparency = 1

-- Toggle Button setup
ToggleButton.Parent = Frame
ToggleButton.Size = UDim2.new(0, 100, 0, 30)
ToggleButton.Position = UDim2.new(0, 5, 0, 60)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.Text = "Code Edited"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.Visible = false

local ToggleUICorner = Instance.new("UICorner")
ToggleUICorner.CornerRadius = UDim.new(0, 10)
ToggleUICorner.Parent = ToggleButton

-- TextBox setup
TextBox.Parent = Frame
TextBox.Size = UDim2.new(0, 600, 1, -10)
TextBox.Position = UDim2.new(0, 110, 0, 5)
TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.Code
TextBox.Text = "Enter code here..."
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.Visible = false
TextBox.MultiLine = true  -- 允许多行输入

TextBox:GetPropertyChangedSignal("Text"):Connect(function()
    TextBox.TextYAlignment = Enum.TextYAlignment.Bottom  -- 滚动到底部
    TextBox.TextYAlignment = Enum.TextYAlignment.Top
end)
-- Execute Button setup
ExecuteButton.Parent = Frame
ExecuteButton.Size = UDim2.new(0, 100, 0, 30)
ExecuteButton.Position = UDim2.new(0, 110, 1, -35)
ExecuteButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ExecuteButton.Text = "Execute"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.Font = Enum.Font.SourceSans
ExecuteButton.Visible = false

local ExecuteUICorner = Instance.new("UICorner")
ExecuteUICorner.CornerRadius = UDim.new(0, 10)
ExecuteUICorner.Parent = ExecuteButton

-- Clear Button setup
ClearButton.Parent = Frame
ClearButton.Size = UDim2.new(0, 100, 0, 30)
ClearButton.Position = UDim2.new(0, 220, 1, -35)
ClearButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ClearButton.Text = "Clear"
ClearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearButton.Font = Enum.Font.SourceSans
ClearButton.Visible = false

local ClearUICorner = Instance.new("UICorner")
ClearUICorner.CornerRadius = UDim.new(0, 10)
ClearUICorner.Parent = ClearButton

-- Console Toggle Button setup
ConsoleToggle.Parent = Frame
ConsoleToggle.Size = UDim2.new(0, 100, 0, 30)
ConsoleToggle.Position = UDim2.new(0, 5, 0, 100)
ConsoleToggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ConsoleToggle.Text = "Console"
ConsoleToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
ConsoleToggle.Font = Enum.Font.SourceSans
ConsoleToggle.Visible = false

local ConsoleToggleUICorner = Instance.new("UICorner")
ConsoleToggleUICorner.CornerRadius = UDim.new(0, 10)
ConsoleToggleUICorner.Parent = ConsoleToggle

-- Console TextBox setup
ConsoleTextBox.Parent = Frame
ConsoleTextBox.Size = UDim2.new(1, -20, 0.4, -10)
ConsoleTextBox.Position = UDim2.new(0, 10, 0, 150)
ConsoleTextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ConsoleTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ConsoleTextBox.Font = Enum.Font.Code
ConsoleTextBox.TextXAlignment = Enum.TextXAlignment.Left
ConsoleTextBox.TextYAlignment = Enum.TextYAlignment.Top
ConsoleTextBox.ClearTextOnFocus = false
ConsoleTextBox.TextEditable = false
ConsoleTextBox.TextWrapped = true
ConsoleTextBox.Visible = false
ConsoleTextBox.Text = "Console output will appear here..."

local ConsoleTextBoxUICorner = Instance.new("UICorner")
ConsoleTextBoxUICorner.CornerRadius = UDim.new(0, 10)
ConsoleTextBoxUICorner.Parent = ConsoleTextBox

-- Close Button setup
CloseButton.Parent = Frame
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.SourceSans
CloseButton.TextSize = 20
CloseButton.Visible = false

local CloseUICorner = Instance.new("UICorner")
CloseUICorner.CornerRadius = UDim.new(0, 15)
CloseUICorner.Parent = CloseButton

-- Credits Toggle Button setup
CreditsToggle.Parent = Frame
CreditsToggle.Size = UDim2.new(0, 100, 0, 30)
CreditsToggle.Position = UDim2.new(0, 5, 0, 150)
CreditsToggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CreditsToggle.Text = "Credits"
CreditsToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
CreditsToggle.Font = Enum.Font.SourceSans
CreditsToggle.Visible = false

local CreditsToggleUICorner = Instance.new("UICorner")
CreditsToggleUICorner.CornerRadius = UDim.new(0, 10)
CreditsToggleUICorner.Parent = CreditsToggle

-- Credits TextBox setup
CreditsTextBox.Parent = Frame
CreditsTextBox.Size = UDim2.new(1, -20, 0.4, -10)
CreditsTextBox.Position = UDim2.new(0, 10, 0, 150)
CreditsTextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CreditsTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CreditsTextBox.Font = Enum.Font.Code
CreditsTextBox.TextXAlignment = Enum.TextXAlignment.Left
CreditsTextBox.TextYAlignment = Enum.TextYAlignment.Top
CreditsTextBox.ClearTextOnFocus = false
CreditsTextBox.TextEditable = false
CreditsTextBox.TextWrapped = true
CreditsTextBox.Text = "Credits:\n- Developer: [Your Name]\n- Additional Contributions: [Names]"
CreditsTextBox.Visible = false

local CreditsTextBoxUICorner = Instance.new("UICorner")
CreditsTextBoxUICorner.CornerRadius = UDim.new(0, 10)
CreditsTextBoxUICorner.Parent = CreditsTextBox

-- Function to animate UI
local function expandUI()
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local goal = {Size = UDim2.new(0, 750, 0, 700), Position = UDim2.new(0.5, -375, 0.5, -350)}
    local tween = TweenService:Create(Frame, tweenInfo, goal)
    tween:Play()

    -- 显示其他 UI 元素
    tween.Completed:Connect(function()
        ToggleButton.Visible = true
        TextBox.Visible = true
        ExecuteButton.Visible = true
        ClearButton.Visible = true
        ConsoleToggle.Visible = true
        ConsoleTextBox.Visible = true
        CloseButton.Visible = true
        CreditsToggle.Visible = true
        CreditsTextBox.Visible = true
    end)
end

local function collapseUI()
    -- 缩回到原来的尺寸
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local goal = {Size = UDim2.new(0, 50, 0, 50), Position = UDim2.new(1, -55, 0, 5)}
    local tween = TweenService:Create(Frame, tweenInfo, goal)
    tween:Play()

    -- 隐藏其他 UI 元素
    tween.Completed:Connect(function()
        ToggleButton.Visible = false
        TextBox.Visible = false
        ExecuteButton.Visible = false
        ClearButton.Visible = false
        ConsoleToggle.Visible = false
        ConsoleTextBox.Visible = false
        CloseButton.Visible = false
        CreditsToggle.Visible = false
        CreditsTextBox.Visible = false
    end)
end

-- 绑定按钮点击事件
ImageButton.MouseButton1Click:Connect(function()
    if Frame.Size.X.Offset == 50 then
        expandUI()
    else
        collapseUI()
    end
end)

-- 关闭按钮事件
CloseButton.MouseButton1Click:Connect(function()
    collapseUI()  -- 缩小UI而不是关闭
end)

-- 显示界面时自动展开
expandUI()

-- 控制台功能
local function printToConsole(text)
    ConsoleTextBox.Text = ConsoleTextBox.Text .. "\n" .. text
end

ExecuteButton.MouseButton1Click:Connect(function()
    local code = TextBox.Text
    local success, result = pcall(function()
        return loadstring(code)()
    end)
    if success then
        printToConsole("Executed: " .. code)
        if result then
            printToConsole("Result: " .. tostring(result))
        end
    else
        printToConsole("Error: " .. tostring(result))
    end
end)

ClearButton.MouseButton1Click:Connect(function()
    TextBox.Text = ""
end)

ConsoleToggle.MouseButton1Click:Connect(function()
    ConsoleTextBox.Visible = not ConsoleTextBox.Visible
end)

CreditsToggle.MouseButton1Click:Connect(function()
    CreditsTextBox.Visible = not CreditsTextBox.Visible
end)
