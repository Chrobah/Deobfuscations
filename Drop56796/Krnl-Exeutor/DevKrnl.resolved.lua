-- source: github.com/Drop56796/Krnl-Exeutor  (DevKrnl.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua  (2244 bytes)

-- Cloneref support (adds support for JJsploit/Temple/Electron and other sploits that don't have cloneref or really shit versions of it.)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/CloneRef.lua", true))()

-- Dex Bypasses
loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/Bypasses.lua", true))()

-- Dex with CloneRef Support (made as global)
getgenv().Bypassed_Dex = game:GetObjects("rbxassetid://9352453730")[1]

local charset = {}
for i = 48,  57 do table.insert(charset, string.char(i)) end
for i = 65,  90 do table.insert(charset, string.char(i)) end
for i = 97, 122 do table.insert(charset, string.char(i)) end
function RandomCharacters(length)
    if length > 0 then
        return RandomCharacters(length - 1) .. charset[math.random(1, #charset)]
    else
        return ""
    end
end

Bypassed_Dex.Name = RandomCharacters(math.random(5, 20))
if gethui then
    Bypassed_Dex.Parent = gethui();
elseif syn and syn.protect_gui then
    syn.protect_gui(Bypassed_Dex);
    Bypassed_Dex.Parent = cloneref(game:GetService("CoreGui"))
else
    Bypassed_Dex.Parent = cloneref(game:GetService("CoreGui"))
end

local function Load(Obj, Url)
    local function GiveOwnGlobals(Func, Script)
        local Fenv = {}
        local RealFenv = {script = Script}
        local FenvMt = {}
        function FenvMt:__index(b)
            if RealFenv[b] == nil then
                return getfenv()[b]
            else
                return RealFenv[b]
            end
        end
        function FenvMt:__newindex(b, c)
            if RealFenv[b] == nil then
                getfenv()[b] = c
            else
                RealFenv[b] = c
            end
        end
        setmetatable(Fenv, FenvMt)
        setfenv(Func, Fenv)
        return Func
    end
    
    local function LoadScripts(Script)
        if Script.ClassName == "Script" or Script.ClassName == "LocalScript" then
            task.spawn(GiveOwnGlobals(loadstring(Script.Source, "=" .. Script:GetFullName()), Script))
        end
        for _,v in ipairs(Script:GetChildren()) do
            LoadScripts(v)
        end
    end
    
    LoadScripts(Obj)
end

Load(Bypassed_Dex)

-- (nested) https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/CloneRef.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/CloneRef.lua  (538 bytes)

-- (nested) https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/Bypasses.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/Bypasses.lua  (8647 bytes)


-- ========================================

-- source: github.com/Drop56796/Krnl-Exeutor  (DevKrnl.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt  (1623 bytes)

-- Gui to Lua
-- Version: 3.2

-- Instances:

loadstring(game:HttpGet(('https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/mob.txt'),true))()
local KeyboardguiWarriorRoberrVersion = Instance.new("ScreenGui")
local Drag = Instance.new("Frame")
local Close = Instance.new("TextButton")

--Properties:

KeyboardguiWarriorRoberrVersion.Name = "Keyboard gui WarriorRoberr Version"
KeyboardguiWarriorRoberrVersion.Parent = game.CoreGui
KeyboardguiWarriorRoberrVersion.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Drag.Name = "Drag"
Drag.Parent = KeyboardguiWarriorRoberrVersion
Drag.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Drag.BorderSizePixel = 0
Drag.Position = UDim2.new(0.147916675, 0, 0.0593749993, 0)
Drag.Size = UDim2.new(0, 270, 0, 30)
Drag.Active = true
Drag.Draggable = true

Close.Name = "Close"
Close.Parent = Drag
Close.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.999839723, 0, -0.00729167089, 0)
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 35.000
Close.MouseButton1Click:Connect(function()
	KeyboardguiWarriorRoberrVersion:Destroy()
end)
game.CoreGui["BUNB0yBUN BOARD"].KeyBoard.Parent = Drag
game.CoreGui["BUNB0yBUN BOARD"]:Destroy()
game.CoreGui["Keyboard gui WarriorRoberr Version"].Drag.KeyBoard.Bunb0ybun.Text = "BETTER VERSION "
game.CoreGui["Keyboard gui WarriorRoberr Version"].Drag.KeyBoard.Position = UDim2.new(0, 0, 0, 35)
game.CoreGui["Keyboard gui WarriorRoberr Version"].Drag.KeyBoard.Bunb0ybun.TextSize = 10
