--[[
    bro.lua  —  organised by minimarchbleeding
    Original : Drop56796/Keyword  ->  bro.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/Drop56796/CreepyEyeHub/main/Creepy%20client.lua
--]]

game.StarterGui:SetCore("SendNotification", {
	Title = "KeySystem load "..identifyexecutor""; -- the title (ofc)
	Text = "Check Key(V1.2) User:["..game.Players.LocalPlayer.Name.."] Welcome"; -- what the text says (ofc)
	Icon = "rbxassetid://18394425047"; -- the image if u want. 
	Duration = 2.25; -- how long the notification should in seconds
})
wait(1)

-- 创建ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- 创建背景Frame
local backgroundFrame = Instance.new("Frame")
backgroundFrame.Size = UDim2.new(0, 0, 0, 0) -- 初始大小为0
backgroundFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
backgroundFrame.AnchorPoint = Vector2.new(0.5, 0.5)
backgroundFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
backgroundFrame.BackgroundTransparency = 0.5
backgroundFrame.Parent = screenGui

-- 添加背景图片
local backgroundImage = Instance.new("ImageLabel")
backgroundImage.Size = UDim2.new(1, 0, 1, 0)
backgroundImage.Position = UDim2.new(0, 0, 0, 0)
backgroundImage.Image = "rbxassetid://18394425047"
backgroundImage.Parent = backgroundFrame

-- 创建提示文字TextLabel
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0, 200, 0, 50)
titleLabel.Position = UDim2.new(0.5, -100, 0.2, 0)
titleLabel.Text = "Key system user:["..game.Players.LocalPlayer.Name.."]"
titleLabel.Font = Enum.Font.Jura
titleLabel.TextSize = 24
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = backgroundFrame

-- 创建TextBox
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 200, 0, 50)
textBox.Position = UDim2.new(0.5, -100, 0.4, 0)
textBox.PlaceholderText = "Enter Your Key"
textBox.Font = Enum.Font.Jura
textBox.TextSize = 18
textBox.Parent = backgroundFrame

-- 创建SubmitButton
local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0, 90, 0, 50)
submitButton.Position = UDim2.new(0.5, -100, 0.6, 0)
submitButton.Text = "Submit"
submitButton.Font = Enum.Font.Jura
submitButton.TextSize = 18
submitButton.Parent = backgroundFrame

-- 创建CopyLinkButton
local copyLinkButton = Instance.new("TextButton")
copyLinkButton.Size = UDim2.new(0, 90, 0, 50)
copyLinkButton.Position = UDim2.new(0.5, 10, 0.6, 0)
copyLinkButton.Text = "Copy Link"
copyLinkButton.Font = Enum.Font.Jura
copyLinkButton.TextSize = 18
copyLinkButton.Parent = backgroundFrame

-- 创建FeedbackLabel
local feedbackLabel = Instance.new("TextLabel")
feedbackLabel.Size = UDim2.new(0, 200, 0, 50)
feedbackLabel.Position = UDim2.new(0.5, -100, 0.8, 0)
feedbackLabel.Text = ""
feedbackLabel.Font = Enum.Font.Jura
feedbackLabel.TextSize = 18
feedbackLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
feedbackLabel.BackgroundTransparency = 1
feedbackLabel.Parent = backgroundFrame

-- 创建CloseButton
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 50, 0, 50)
closeButton.Position = UDim2.new(1, -60, 0, 10)
closeButton.Text = "X"
closeButton.Font = Enum.Font.Jura
closeButton.TextSize = 18
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Parent = backgroundFrame

-- 定义有效的密钥
local validKeys = {
    "Key_A",
    "Key_B",
    "Key_C"
}

-- 提交按钮点击事件
submitButton.MouseButton1Click:Connect(function()
    local enteredKey = textBox.Text
    if table.find(validKeys, enteredKey) then
        feedbackLabel.Text = "Access granted"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/CreepyEyeHub/main/Creepy%20client.lua"))()
        backgroundFrame:Destroy() -- 关闭UI
    else
        feedbackLabel.Text = "Access denied"
    end
end)

-- 复制链接按钮点击事件
copyLinkButton.MouseButton1Click:Connect(function()
    setclipboard("https://direct-link.net/1200451/creepy-client-key1")
    feedbackLabel.Text = "Link copied to clipboard"
end)

-- 关闭按钮点击事件
closeButton.MouseButton1Click:Connect(function()
    backgroundFrame:Destroy()
end)

-- 动画效果
local TweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)
local targetSize = UDim2.new(0.5, 0, 0.5, 0)
local tween = TweenService:Create(backgroundFrame, tweenInfo, {Size = targetSize})
tween:Play()
