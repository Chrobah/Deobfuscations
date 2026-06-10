--[[
    keysystem.lua  —  organised by minimarchbleeding
    Original : Drop56796/keysystem-ui  ->  keysystem.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/Drop56796/Noob/main/Nope.lua
--]]

print(os.date("%B"))

print("wait 3second")
wait(3)

print("Key system loading!")

-- 假设的本地存储机制
local fakeLocalStorage = {}

-- Roblox Script Key System
local keySystem = {}
keySystem.validKeys = fakeLocalStorage.validKeys or {} -- 从存储中读取有效密钥或初始化一个空表

-- 固定密钥值
local fixedKey = "key_96788990547ab775890"

-- 设置固定密钥的函数
function keySystem.setFixedKey()
    keySystem.validKeys[fixedKey] = os.time() + (12 * 60 * 60) -- 设置密钥的过期时间为当前时间加上12小时
    fakeLocalStorage.validKeys = keySystem.validKeys -- 保存到存储
end

-- 验证密钥的函数
function keySystem.validateKey(inputKey)
    if keySystem.validKeys[inputKey] and os.time() < keySystem.validKeys[inputKey] then
        return true -- 返回true
    else
        keySystem.validKeys[inputKey] = nil -- 如果密钥过期，移除密钥
        fakeLocalStorage.validKeys = keySystem.validKeys -- 更新存储
        return false
    end
end

-- 密钥验证成功后执行的脚本
function keySystem.runScript()
    print("key is exeute")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Noob/main/Nope.lua"))()
end

-- 关闭密钥输入UI的函数
function keySystem.closeKeyUI(screenGui)
    screenGui:Destroy()
end

-- UI部分
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player.PlayerGui)
local textBox = Instance.new("TextBox", screenGui)
textBox.Size = UDim2.new(0, 200, 0, 50)
textBox.Position = UDim2.new(0.5, -100, 0.5, -25)
textBox.PlaceholderText = "请输入密钥..."

local submitButton = Instance.new("TextButton", screenGui)
submitButton.Size = UDim2.new(0, 100, 0, 50)
submitButton.Position = UDim2.new(0.5, 100, 0.5, -25)
submitButton.Text = "confirm key"

-- 添加新按钮
local newButton = Instance.new("TextButton", screenGui)
newButton.Size = UDim2.new(0, 100, 0, 50)
newButton.Position = UDim2.new(0.5, 100, 0.5, 25)
newButton.Text = "copy link"

-- 提交按钮的事件处理
submitButton.MouseButton1Click:Connect(function()
    local isValid = keySystem.validateKey(textBox.Text)
    if isValid then
        keySystem.runScript()
        keySystem.closeKeyUI(screenGui)
    else
        textBox.Text = ""
        textBox.PlaceholderText = "key not compatible"
    end
end)

-- 新按钮的事件处理
newButton.MouseButton1Click:Connect(function()
    print("The link is copy to you clipboard")
    setclipboard("https://workink.net/1UMB/Keypoint")
end)

-- 设置固定密钥
keySystem.setFixedKey()
