--[[
    Hub.lua  —  organised by minimarchbleeding
    Original : Drop56796/Gun  ->  Hub.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua, https://raw.githubusercontent.com/Drop56796/Big-Head/main/Head.lua, https://raw.githubusercontent.com/Eazvy/UILibs/main/ESP/Bluwu/Example
--]]

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

local gui = Library:create{
    Theme = Library.Themes.Serika
}

local tab = gui:tab{
    Icon = "rbxassetid://3457898957",
    Name = "Gun Hub"
}

tab:button({
    Name = "Big head",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Big-Head/main/Head.lua"))()
    end,  
})

tab:button({
    Name = FPS:240",
    Callback = function()
        setfpscap(240)
    end,  
})

tab:button({
    Name = "Player esp",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Eazvy/UILibs/main/ESP/Bluwu/Example"))()
    end,  
})
