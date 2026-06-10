--[[
    a.lua  —  organised by minimarchbleeding
    Original : Drop56796/Fluxus-concept-ui  ->  a.lua
    Not obfuscated; reproduced as-is.
--]]

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- 创建一个新的部件并放置在角色下方50格的位置
local newPart = Instance.new("Part")
newPart.Size = Vector3.new(5, 1, 5)
newPart.Anchored = true
newPart.CanCollide = true
newPart.Position = humanoidRootPart.Position - Vector3.new(0, 50, 0)
newPart.Parent = workspace

-- 创建UI按钮
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
local button = Instance.new("TextButton", screenGui)
button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.4, -25) -- 放置在屏幕中心上方
button.Text = "Toggle God Mode"

-- 切换God Mode状态的函数
local function toggleGodMode()
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") and part.Name == "Collision" then
            part.Parent = nil -- 将碰撞部分的Parent设置为nil
        end
    end

    -- 等待一帧以确保所有部件的Parent都被设置为nil
    game:GetService("RunService").Stepped:Wait()

    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") and part.Name == "Collision" then
            part.Parent = newPart -- 将碰撞部分重新绑定到新创建的部件上
        end
    end
end

-- 监听按钮点击事件来切换God Mode状态
button.MouseButton1Click:Connect(toggleGodMode)
