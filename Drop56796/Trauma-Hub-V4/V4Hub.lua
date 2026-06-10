--[[
    V4Hub.lua  —  organised by minimarchbleeding
    Original : Drop56796/Trauma-Hub-V4  ->  V4Hub.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua, https://raw.githubusercontent.com/Drop56796/Psychotic-mode/main/0.lua, https://raw.githubusercontent.com/JevilOhio/Doors-Hardcore-noonie-ver-/main/Doors%20Hardcore%20(noonie), https://raw.githubusercontent.com/Drop56796/Hardcore-Remake/main/Hardcore%20Remake(Made%20by%20Jay).lua
--]]

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

local gui = Library:create{
    Theme = Library.Themes.Serika
}

local tab = gui:tab{
    Icon = "rbxassetid://3457898957",
    Name = "Script Mode"
}

tab:button({
    Name = "Psychotic.lua",
    Callback = function()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Psychotic-mode/main/0.lua"))()
    end,  
})

tab:button({
    Name = "Hardcore.lua",
    Callback = function()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/JevilOhio/Doors-Hardcore-noonie-ver-/main/Doors%20Hardcore%20(noonie)"))()
     end,  
})

tab:button({
    Name = "Hardcore (R-V).lua",
    Callback = function()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Hardcore-Remake/main/Hardcore%20Remake(Made%20by%20Jay).lua"))()
     end,  
})

tab:button({
    Name = "hamor.lua",
    Callback = function()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/munciseek/Scriptmode/mode/Hamor"))()
     end,  
})
tab:button({
    Name = "Extreme.lua",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/munciseek/Scriptmode/main/Extreme"))()
    end,  
})

tab:button({
    Name = "Insane V5.lua",
    Callback = function()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/thefigureblack/doors/main/insanemodev5.lua"))()
     end,  
})

tab:button({
    Name = "Insane V6.lua",
    Callback = function()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/InsaneV6/main/InsaneV6.lua"))()
     end,  
})

tab:button({
    Name = "Impossible.lua",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Ukazix/impossible-mode/main/Protected_79.lua.txt'))()
    end,  
})

tab:button({
    Name = "Troll.lua",
    Callback = function()
        loadstring(game:HttpGet("https://glot.io/snippets/gotfeffesc/raw/main.lua"))()
    end,  
})

tab:button({
    Name = "Fragmented V4.lua",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/munciseek/Scriptmode/main/Fragmented"))()
    end,  
})

tab:button({
    Name = "Fear.lua",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cool59572/freestuff/main/Mods/FearMode.lua"))()
    end,  
})

tab:button({
    Name = "Hazy.lua",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Jabiess-Hazy-Mode-/main/Hazy%20Mode.lua"))()
    end,  
})

tab:button({
    Name = "Hardcore(A-V).lua",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/plamen6789/HardcoreScriptDOORS/main/HardcoreModeScript'))()
    end,  
})

tab:button({
    Name = "Nightmare.lua",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/nightmare/main/nightmare%20mode.lua"))()
    end,  
})

tab:button({
    Name = "Hardcore but bad.lua",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/munciseek/Scriptmode/mode/Hardcore-but-bad"))()
    end,  
})

tab:button({
    Name = "Endless.lua",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/munciseek/Scriptmode/mode/Endless"))()
    end,  
})

tab:button({
    Name = "Birthday.lua",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/munciseek/Scriptmode/mode/Birthday"))()
    end,  
})

tab:button({
    Name = "Furry.lua",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/munciseek/Scriptmode/mode/Furry"))()
    end,  
})

tab:button({
    Name = "Cat.lua",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/munciseek/Scriptmode/mode/Cat"))()
    end,
})

local tab = gui:tab{
    Icon = "rbxassetid://3457898957",
    Name = "other"
}

tab:button({
    Name = "Keyboard",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
    end,
})

tab:button({
    Name = "Dex V3",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
    end,  
})

local tab = gui:tab{
    Icon = "rbxassetid://3457898957",
    Name = "Doors hub" 
}

tab:button({
    Name = "Trauma Hub V5(Warning)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/V5/main/Hub.lua"))()
    end,  
})

tab:button({
    Name = "mshub",
    Callback = function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/mstudio45/MSDOORS/main/MSHUB_Loader.lua"),true))()
    end,  
})

tab:button({
    Name = "Trauma Hub V3",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Bat-hub/Hub/TraumaHub.lua"))()
    end,  
})

tab:button({
    Name = "FFJ1",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
    end,  
})

local tab = gui:tab{
    Icon = "rbxassetid://3457898957",
    Name = "Floor2 item"
}

tab:button({
    Name = "Floor2 item",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Floor-2-candle-By-icherryKardess-/The-Floor-2-candle-(By-icherryKardess)/Floor2%20candle%20(The%20candle%20by%20icherrykardess).lua"))()
    end,  
})

tab:button({
    Name = "Floor2 Package",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/iCherryKardes/Doors/main/Floor%202%20Mod"))()
    end,  
})

local tab = gui:tab{
    Icon = "rbxassetid://3457898957",
    Name = "Gun Hub"
}

tab:button({
    Name = "hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Gun/main/Hub.lua"))()
    end,  
})
