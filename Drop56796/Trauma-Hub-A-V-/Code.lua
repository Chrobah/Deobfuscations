--[[
    Code.lua  —  organised by minimarchbleeding
    Original : Drop56796/Trauma-Hub-A-V-  ->  Code.lua
    Clean loader (not obfuscated); pulls: https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt, https://raw.githubusercontent.com/Drop56796/Psychotic-mode/main/0.lua, https://raw.githubusercontent.com/munciseek/Scriptmode/main/Extreme, https://raw.githubusercontent.com/Drop56796/Psychotic-mode/main/0.lua
--]]

local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window("Trauma Hub(A-V) / Trauma Hub V4 Welcome(Please in Doors super hard mode use mode)")

local serv = win:Server(">>>", "rbxassetid://11414232888")

local btns = serv:Channel("Script mode")

btns:Button("Psychotic.lua", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Psychotic-mode/main/0.lua"))()
end)

btns:Button("Hardcore.lua", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/munciseek/Scriptmode/main/Extreme"))()
end)

btns:Button("Hardcore mode (A-V).lua", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Psychotic-mode/main/0.lua"))()
end)

btns:Button("Hardcore but bad.lua (Bro don't use it😱)", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Psychotic-mode/main/0.lua"))()
end)

btns:Button("impossible.lua", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Ukazix/impossible-mode/main/Protected_79.lua.txt'))()
end)

btns:Button("Fear Mode.lua", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/cool59572/freestuff/main/Mods/FearMode.lua"))()
end)

btns:Button("Fragmented V4.lua", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/munciseek/Scriptmode/main/Fragmented"))()
end)

btns:Button("Troll.lua", function()
loadstring(game:HttpGet("https://glot.io/snippets/gotfeffesc/raw/main.lua"))()
end)

btns:Button("Hazy.lua", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Jabiess-Hazy-Mode-/main/Hazy%20Mode.lua"))()
end)

btns:Button("Nightmare.lua", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Psychotic-mode/main/0.lua"))()
end)

btns:Button("Endless.lua", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/munciseek/Scriptmode/mode/Endless"))()
end)

btns:Button("Birthday.lua", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/munciseek/Scriptmode/mode/Birthday"))()
end)

btns:Button("Furry.lua (use it = gay)", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/munciseek/Scriptmode/mode/Furry"))()
end)

local btns = serv:Channel("Hub")

btns:Button("munciseek V2.lua", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/munciseek/DOORS-script-Mode/main/Script"))()
end)

btns:Button("Mshub.lua", function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/mstudio45/MSDOORS/main/MSHUB_Loader.lua"),true))()
end)

btns:Button("FFJ1.lua", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
end)

local btns = serv:Channel("other")

btns:Button("DarkDex V3.lua 😎", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
end)

local btns = serv:Channel("Doors Floor2")

btns:Button("Floor2 Candle.lua", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Floor-2-candle-By-icherryKardess-/The-Floor-2-candle-(By-icherryKardess)/Floor2%20candle%20(The%20candle%20by%20icherrykardess).lua"))()
end)

btns:Button("Floor2 Package", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/iCherryKardes/Doors/main/Floor%202%20Mod"))()
end)
