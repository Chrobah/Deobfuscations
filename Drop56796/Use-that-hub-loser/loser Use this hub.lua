--[[
    loser Use this hub.lua  —  organised by minimarchbleeding
    Original : Drop56796/Use-that-hub-loser  ->  loser Use this hub.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/STX, https://pastebin.com/raw/uw2P2fbY
--]]

local Console =  loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/STX"))()
local ConsoleLog = Console:Window({
    Title = "Seek R＆D (Auto Exeute)",
    Position = UDim2.new(0.5, 0, 0.5, 0),
    DragSpeed = 12
})
loadstring(game:HttpGet("https://pastebin.com/raw/uw2P2fbY"))()
ConsoleLog:Prompt({
    Title = "Auto Exeute Esp",
    TypesWeHave = {
        "default",
        "success",
        "fail",
        "warning",
        "nofitication"
    },
    Type = "default"
})

--高亮
local Light = game:GetService("Lighting")

function dofullbright()
Light.Ambient = Color3.new(1, 1, 1)
Light.ColorShift_Bottom = Color3.new(1, 1, 1)
Light.ColorShift_Top = Color3.new(1, 1, 1)
end

dofullbright()

Light.LightingChanged:Connect(dofullbright)
ConsoleLog:Prompt({
    Title = "Auto Highlight",
    TypesWeHave = {
        "default",
        "success",
        "fail",
        "warning",
        "nofitication"
    },
    Type = "default"
})

ConsoleLog:Prompt({
    Title = "(R＆D Warning)Please open another door before use",
    TypesWeHave = {
        "default",
        "success",
        "fail",
        "warning",
        "nofitication"
    },
    Type = "warning"
})

ConsoleLog:Prompt({
    Title = "If you are banned by this game, please don't use it",
    TypesWeHave = {
        "default",
        "success",
        "fail",
        "warning",
        "nofitication"
    },
    Type = "fail"
})

ConsoleLog:Prompt({
    Title = "Version:1.0",
    TypesWeHave = {
        "default",
        "success",
        "fail",
        "warning",
        "nofitication"
    },
    Type = "success"
})

ConsoleLog:Prompt({
    Title = "By Seek",
    TypesWeHave = {
        "default",
        "success",
        "fail",
        "warning",
        "nofitication"
    },
    Type = "nofitication"
})
