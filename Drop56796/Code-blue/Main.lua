--[[
    Main.lua  —  organised by minimarchbleeding
    Original : Drop56796/Code-blue  ->  Main.lua
    Clean loader (not obfuscated); pulls: https://github.com/Drop56796/Code-blue/blob/main/lib.lua?raw=true
--]]

-- LocalScript 部分
local UiLib = loadstring(game:HttpGet("https://github.com/Drop56796/Code-blue/blob/main/lib.lua?raw=true"))()

local screenGui = UiLib:CreateScreenGui("CreepyClient")
local mainFrame = UiLib:CreateFrame(UDim2.new(0, 800, 0, 600), UDim2.new(0.5, -400, 0.5, -300), Color3.fromRGB(30, 30, 30), screenGui)

-- 使用 CreateBackground 扩展背景
local background = UiLib:CreateBackground(UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), Color3.fromRGB(20, 20, 20), mainFrame)

-- 使用 CreateTitle 创建标题
local titleFrame = UiLib:CreateTitle(
    UDim2.new(1, 0, 0, 50),
    UDim2.new(0, 0, 0, 0),
    "Creepy Client V2.01",
    Color3.fromRGB(255, 0, 0),
    Color3.fromRGB(255, 255, 255),
    background
)

local menuFrame = UiLib:CreateFrame(UDim2.new(0, 200, 1, -50), UDim2.new(0, 0, 0, 50), Color3.fromRGB(40, 40, 40), background)
local contentFrame = UiLib:CreateFrame(UDim2.new(1, -200, 1, -50), UDim2.new(0, 200, 0, 50), Color3.fromRGB(50, 50, 50), background)

local function clearContentFrame()
    for _, child in pairs(contentFrame:GetChildren()) do
        child:Destroy()
    end
end

local function createContentForModule(moduleName)
    clearContentFrame()
    local module = UiLib.Modules[moduleName]
    if module then
        for featureName, callback in pairs(module) do
            callback(contentFrame)
        end
    end
end

-- 功能模块定义
UiLib.Modules = {
    MainFeature = {
        ToggleDoors = function(parentFrame)
            UiLib:CreateToggleButton(
                UDim2.new(0.8, 0, 0, 40), 
                UDim2.new(0.1, 0, 0.1, 0), 
                "Toggle Doors", 
                Color3.fromRGB(70, 70, 70), 
                Color3.fromRGB(255, 255, 255), 
                parentFrame, 
                function(isToggled)
                    if isToggled then
                        print("Doors feature activated.")
                    else
                        print("Doors feature deactivated.")
                    end
                end
            )
        end,
        ToggleOtherFeature = function(parentFrame)
            UiLib:CreateToggleButton(
                UDim2.new(0.8, 0, 0, 40), 
                UDim2.new(0.1, 0, 0.2, 0), 
                "Toggle Other Feature", 
                Color3.fromRGB(70, 70, 70), 
                Color3.fromRGB(255, 255, 255), 
                parentFrame, 
                function(isToggled)
                    if isToggled then
                        print("Other feature activated.")
                    else
                        print("Other feature deactivated.")
                    end
                end
            )
        end,
    },
    Doors = {
        Feature1 = function(parentFrame)
            UiLib:CreateTextButton(UDim2.new(0.8, 0, 0, 40), UDim2.new(0.1, 0, 0.1, 0), "Doors Feature", Color3.fromRGB(70, 70, 70), Color3.fromRGB(255, 255, 255), parentFrame, function()
                print("Doors feature activated.")
            end)
        end,
    },
    Creator = {
        Info = function(parentFrame)
            UiLib:CreateTag(UDim2.new(0.8, 0, 0, 40), UDim2.new(0.1, 0, 0.1, 0), "Creator Info", Color3.fromRGB(70, 70, 70), Color3.fromRGB(255, 255, 255), parentFrame)
        end,
        NewTag = function(parentFrame)
            UiLib:CreateTag(UDim2.new(0.8, 0, 0, 40), UDim2.new(0.1, 0, 0.2, 0), "New Creator Tag", Color3.fromRGB(70, 70, 70), Color3.fromRGB(255, 255, 255), parentFrame)
        end,
    },
    Mod1 = {
        Feature1 = function(parentFrame)
            UiLib:CreateTextButton(UDim2.new(0.8, 0, 0, 40), UDim2.new(0.1, 0, 0.1, 0), "Mod1 Feature1", Color3.fromRGB(70, 70, 70), Color3.fromRGB(255, 255, 255), parentFrame, function()
                print("Mod1 Feature1 activated.")
            end)
        end,
    },
    GuiSetting = {
        Setting1 = function(parentFrame)
            UiLib:CreateTextBox(UDim2.new(0.8, 0, 0, 40), UDim2.new(0.1, 0, 0.1, 0), "GUI Setting", Color3.fromRGB(70, 70, 70), Color3.fromRGB(255, 255, 255), parentFrame)
        end,
    },
    ExtraFeature = {
        FeatureA = function(parentFrame)
            UiLib:CreateTextButton(UDim2.new(0.8, 0, 0, 40), UDim2.new(0.1, 0, 0.1, 0), "Extra Feature A", Color3.fromRGB(70, 70, 70), Color3.fromRGB(255, 255, 255), parentFrame, function()
                print("Extra Feature A activated.")
            end)
        end,
    },
}

local menuButtons = {
    {Name = "主功能", Module = "MainFeature"},
    {Name = "Doors", Module = "Doors"},
    {Name = "创作者", Module = "Creator"},
    {Name = "mod1", Module = "Mod1"},
    {Name = "Gui Setting", Module = "GuiSetting"},
    {Name = "Extra Feature", Module = "ExtraFeature"},  -- 新功能模块
}

for i, btn in ipairs(menuButtons) do
    UiLib:CreateTextButton(UDim2.new(1, 0, 0, 50), UDim2.new(0, 0, 0, (i - 1) * 50), btn.Name, Color3.fromRGB(40, 40, 40), Color3.fromRGB(255, 255, 255), menuFrame, function()
        createContentForModule(btn.Module)
    end)
end

-- 默认显示第一个按钮的内容
menuButtons[1].Callback()

return UiLib
