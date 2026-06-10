--[[
    Fluxus.lua  —  organised by minimarchbleeding
    Original : Drop56796/V1  ->  Fluxus.lua
    Not obfuscated; reproduced as-is.
--]]

-- 创建UI
local screenGui = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local titleLabel = Instance.new("TextLabel") -- 新增标题
local scriptInput = Instance.new("TextBox")
local imageLabel = Instance.new("ImageLabel")
local runButton = Instance.new("TextButton")

-- 设置ScreenGui
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 设置外层Frame
frame.Parent = screenGui
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- 纯黑色背景
frame.Size = UDim2.new(0.75, 0, 0.75, 0) -- 尺寸增大到60%
frame.Position = UDim2.new(0.2, 0, 0.2, 0) -- 调整位置以保持居中

-- 设置标题TextLabel
titleLabel.Parent = frame
titleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- 纯黑色背景
titleLabel.Size = UDim2.new(0.8, 0, 0.1, 0)
titleLabel.Position = UDim2.new(0.1, 0, 0, 0) -- 标题位置
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- 文字颜色
titleLabel.Text = "Fluxus Exeutor V2.5.89" -- 标题文字
titleLabel.Font = Enum.Font.SourceSans 
titleLabel.TextSize = 24 -- 文字大小

-- 设置用于输入脚本的TextBox
scriptInput.Parent = frame
scriptInput.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- 纯黑色背景
scriptInput.Size = UDim2.new(0.8, 0, 0.6, 0) -- 输入框尺寸增大到40%
scriptInput.Position = UDim2.new(0.1, 0, 0.15, 0) -- 调整位置
scriptInput.TextColor3 = Color3.fromRGB(255, 255, 255) -- 文字颜色
scriptInput.PlaceholderText = ""
scriptInput.ClearTextOnFocus = false -- 保留输入的文字

-- 设置左上角的ImageLabel
imageLabel.Parent = frame
imageLabel.Position = UDim2.new(0, 0, 0, 0)
imageLabel.Size = UDim2.new(0, 50, 0, 50) -- 图片尺寸保持不变
imageLabel.Image = "rbxassetid://15960343185" -- 替换成您的图片ID

-- 设置运行脚本的按钮
runButton.Parent = frame
runButton.Text = "Run script"
runButton.Size = UDim2.new(0.2, 0, 0.1, 0)
runButton.Position = UDim2.new(0.4, 0, 0.85, 0) -- 按钮位置调整
runButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- 按钮颜色

-- 功能：点击按钮执行输入的脚本
runButton.MouseButton1Click:Connect(function()
    local scriptToRun = scriptInput.Text
    loadstring(scriptToRun)()
end)
