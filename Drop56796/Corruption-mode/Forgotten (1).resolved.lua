-- source: github.com/Drop56796/Corruption-mode  (Forgotten (1).txt)
-- [resolved CLEAN] https://pastebin.com/raw/DQDWwAiM  (1427 bytes)

--[[

    NOTE: Custom shop items will NOT cost any real knobs

]]--

local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local CustomShop = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Shop%20Items/Source.lua"))()


-- Create your tool here
local exampleTool = LoadCustomInstance("rbxassetid://16465312383")


-- Create custom shop item
if game.Players.LocalPlayer.PlayerGui.MainUI.ItemShop.Visible then
CustomShop.CreateItem(exampleTool, {
    Title = "Current Candle",
    Desc = "Your new item, have fun!",
    Image = "rbxassetid://119782741305330",
    Price = 125,
    Stack = 1,
})
else
for _, v in next, game.Players.LocalPlayer:GetDescendants() do
	if v.Name == "Backpack" then
		exampleTool.Parent = v
	end
end
end

exampleTool.TextureId = "rbxassetid://119782741305330"

local animation = Instance.new("Animation")
animation.Name = "idle"
animation.AnimationId = "rbxassetid://11545520304"
local idle = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(animation)

exampleTool.Equipped:Connect(function()
    idle:Play()
end)

exampleTool.Unequipped:Connect(function()
    idle:Stop()
end)

exampleTool.Handle:WaitForChild("Fire Main").PointLight.Brightness = 19
exampleTool.Handle:WaitForChild("Fire Main").PointLight.Range = 18
-- (nested) https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua  (3452 bytes)

-- (nested) https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Shop%20Items/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Shop%20Items/Source.lua  (5591 bytes)


-- ========================================

-- source: github.com/Drop56796/Corruption-mode  (Forgotten (1).txt)
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua  (3452 bytes)

-- Additional help: @ActualMasterOogway

-- \\ Services // --

local MarketplaceService = game:GetService("MarketplaceService")
local HttpService = game:GetService("HttpService")

-- \\ Variables // --

local Module = {}

-- \\ Functions // --

local function timestampToMillis(timestamp: string | number | DateTime): number
    return
        (typeof(timestamp) == "string" and DateTime.fromIsoDate(timestamp).UnixTimestampMillis)
        or (typeof(timestamp) == "number" and timestamp)
        or timestamp.UnixTimestampMillis
end

-- \\ Main // --

Module.Require = function(s: string): any?
    local content = s
    if s:lower():sub(1, 4) == "http" then
        content = game:HttpGet(s)
    elseif isfile(s) then
        content = readfile(s)
    end

    local func, err = loadstring(content)
    if not func then
        error(debug.traceback("Failed to load module:\n"..s.."\nError: "..err))
    end
    return func()
end

Module.LoadCustomAsset = function(url: string): string?
    if getcustomasset then
        if url:lower():sub(1, 4) == "http" then
            local fileName = `temp_{tick()}.txt`
            local _, result = pcall(function()
                writefile(fileName, game:HttpGet(url))
                return getcustomasset(fileName, true)
            end)
            if isfile(fileName) then
                delfile(fileName)
            end
            return result
        elseif isfile(url) then
            return getcustomasset(url, true)
        end
    else
        warn("Executor doesn't support 'getcustomasset', rbxassetid only.")
    end
    if url:find("rbxassetid") or tonumber(url) then
        return "rbxassetid://"..url:match("%d+")
    end
    error(debug.traceback("Failed to load custom asset for:\n"..url))
end

Module.LoadCustomInstance = function(url: string): Instance?
    local success, result = pcall(function()
        return game:GetObjects(Module.LoadCustomAsset(url))[1]
    end)
    return success and result or nil
end

Module.GetGameLastUpdate = function(): DateTime
    return DateTime.fromIsoDate(MarketplaceService:GetProductInfo(game.PlaceId).Updated)
end

Module.HasGameUpdated = function(timestamp: string | number | DateTime): boolean
    local millis = timestampToMillis(timestamp)
    if millis then
        return millis < Module.GetGameLastUpdate().UnixTimestampMillis
    end
    return false
end

Module.GetGitLastUpdate = function(owner: string, repo: string, filePath: string): DateTime
    local url = `https://api.github.com/repos/{owner}/{repo}/commits?per_page=1&path={filePath}`
    local success, result = pcall(HttpService.JSONDecode, HttpService, game:HttpGet(url))
    if not success then
        error(debug.traceback("Failed to get last commit for:\n"..url))
    end
    return DateTime.fromIsoDate(result[1].commit.committer.date)
end

Module.HasGitUpdated = function(owner: string, repo: string, filePath: string, timestamp: string | number | DateTime): boolean
    local millis = timestampToMillis(timestamp)
    if millis then
        return millis < Module.GetGitLastUpdate(owner, repo, filePath).UnixTimestampMillis
    end
    return false
end

Module.TruncateNumber = function(num: number, decimals: number): number
    local shift = 10 ^ (decimals and math.max(decimals, 0) or 0)
    return num * shift // 1 / shift
end

for name, func in next, Module do
    if typeof(func) == "function" then
        getgenv()[name] = func
    end
end

return Module

-- ========================================

-- source: github.com/Drop56796/Corruption-mode  (Forgotten (1).txt)
-- [resolved CLEAN] https://pastebin.com/raw/TiVM7MY9  (1276 bytes)

local cas = game:GetService("ContextActionService")
local Leftc = Enum.KeyCode.LeftControl
local RightC = Enum.KeyCode.RightControl
local player = game:GetService("Players").LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local Humanoid = char:WaitForChild("Humanoid")

local UIS = game:GetService("UserInputService")
 
UIS.InputBegan:Connect(function(key, gameProcessed)
	if gameProcessed then return end
	if key.KeyCode == Enum.KeyCode.LeftShift then
		Humanoid:SetAttribute("SpeedBoostBehind", 5)
	end
end)
 
UIS.InputEnded:Connect(function(key, gameProcessed)
	if gameProcessed then return end
	if key.KeyCode == Enum.KeyCode.LeftShift then
		Humanoid:SetAttribute("SpeedBoostBehind", 0)
	end
end)
 
--------------------------------------------------- Mobile Button
 
local function handleContext(name, state, input)
	if state == Enum.UserInputState.Begin then
		Humanoid:SetAttribute("SpeedBoostBehind", 5)
	elseif state == Enum.UserInputState.End then
		Humanoid:SetAttribute("SpeedBoostBehind", 0)
	end
end

cas:BindAction("Sprint", handleContext, true, Leftc, RightC)
cas:SetPosition("Sprint", UDim2.new(.2, 0, .5, 0))
cas:SetTitle("Sprint", "Sprint")
cas:GetButton("Sprint").Size = UDim2.new(.3, 0, .3, 0)

-- ========================================

-- source: github.com/Drop56796/Corruption-mode  (Forgotten (1).txt)
-- [resolved CLEAN] https://pastebin.com/raw/GNA4cUHy  (409 bytes)

---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "Forgotten Mode",
    Desc = "WOW",
    Reason = "Activate/Execute to Forgotten Mode",
    Image = "rbxassetid://12309073114"
})
-- (nested) https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua  (664 bytes)


-- ========================================

-- source: github.com/Drop56796/Corruption-mode  (Forgotten (1).txt)
-- [resolved CLEAN] https://pastebin.com/raw/gxKdB7VD  (7831 bytes)

if game:GetService("ReplicatedStorage").GameData.Floor.Value == "Hotel" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Mines" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Backdoor" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Fools" then

workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Open.SoundId = "rbxassetid://833871080"

elseif game:GetService("ReplicatedStorage").GameData.Floor.Value == "Halloween25" then

if workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Open.SoundId == "rbxassetid://11447013731" then

workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Open.SoundId = "rbxassetid://833871080"

end

end

if game:GetService("ReplicatedStorage").GameData.Floor.Value == "Hotel" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Mines" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Backdoor" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Fools" then

if not workspace:FindFirstChild("Dread") then

workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Bell.SoundId = "rbxassetid://9064230518"

workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Unlock.SoundId = "rbxassetid://4381793351"

workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Hit.SoundId = "rbxassetid://9113647192"

end

elseif game:GetService("ReplicatedStorage").GameData.Floor.Value == "Halloween25" then

if workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Open.SoundId == "rbxassetid://833871080" then

workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Bell.SoundId = "rbxassetid://9064230518"

workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Unlock.SoundId = "rbxassetid://4381793351"

workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Hit.SoundId = "rbxassetid://9113647192"

end

end

if game:GetService("ReplicatedStorage").GameData.Floor.Value == "Hotel" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Mines" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Backdoor" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Fools" then

workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.SlamOpen.SoundId = "rbxassetid://4988580646"

workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.SlamOpen.TimePosition = 0.2

elseif game:GetService("ReplicatedStorage").GameData.Floor.Value == "Halloween25" then

if workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Open.SoundId == "rbxassetid://833871080" then

workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.SlamOpen.SoundId = "rbxassetid://4988580646"

workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.SlamOpen.TimePosition = 0.2

end

end

-- new sound's doors

coroutine.wrap(function()

game.ReplicatedStorage.GameData.LatestRoom.Changed: Connect(function()

wait(0.001)
        
if game:GetService("ReplicatedStorage").GameData.Floor.Value == "Hotel" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Mines" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Backdoor" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Fools" then

workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Open.SoundId = "rbxassetid://6058561902"

elseif game:GetService("ReplicatedStorage").GameData.Floor.Value == "Halloween25" then

if workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Open.SoundId == "rbxassetid://11447013731" then

workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Open.SoundId = "rbxassetid://6058561902"

end

end

if game:GetService("ReplicatedStorage").GameData.Floor.Value == "Hotel" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Mines" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Backdoor" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Fools" then

if not workspace:FindFirstChild("Dread") then

workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Bell.SoundId = "rbxassetid://9064230518"

workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Unlock.SoundId = "rbxassetid://6091973938"

workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Hit.SoundId = "rbxassetid://6058561501"
        
end

elseif game:GetService("ReplicatedStorage").GameData.Floor.Value == "Halloween25" then

if workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Open.SoundId == "rbxassetid://6058561902" then

workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Bell.SoundId = "rbxassetid://9064230518"

workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Unlock.SoundId = "rbxassetid://6091973938"

workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Hit.SoundId = "rbxassetid://6058561501"

end

end

if game:GetService("ReplicatedStorage").GameData.Floor.Value == "Hotel" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Mines" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Backdoor" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Fools" then

workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.SlamOpen.SoundId = "rbxassetid://3908308607"
        workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.SlamOpen.TimePosition = 0.2

elseif game:GetService("ReplicatedStorage").GameData.Floor.Value == "Halloween25" then

if workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Open.SoundId == "rbxassetid://6058561902" then

workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.SlamOpen.SoundId = "rbxassetid://3908308607"
        workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.SlamOpen.TimePosition = 0.2

end

end

--

end)

--[[ ]]--

end)()

--

-- new sound's doors normally

coroutine.wrap(function()

if game:GetService("ReplicatedStorage").GameData.Floor.Value == "Hotel" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Mines" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Backdoor" or game:GetService("ReplicatedStorage").GameData.Floor.Value == "Fools" then

game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()

for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
	if v.Name == "DoorNormal" then
		v:WaitForChild("Door"):WaitForChild("Open").SoundId = "rbxassetid://833871080"
	end
end

end)

elseif game:GetService("ReplicatedStorage").GameData.Floor.Value == "Halloween25" then

game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()

if workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Open.SoundId == "rbxassetid://11447013731" then

for _, v in pairs(workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:GetDescendants()) do
	if v.Name == "DoorNormal" then
		v:WaitForChild("Door"):WaitForChild("Open").SoundId = "rbxassetid://833871080"
	end
end

end

end)

--

end

end)()

-- ========================================

-- source: github.com/Drop56796/Corruption-mode  (Forgotten (1).txt)
-- [resolved CLEAN] https://pastebin.com/raw/wjxWRXXC  (887 bytes)

local shut = game.Players.LocalPlayer.PlayerGui.MainUI.MainFrame.IntroText
local intro = shut:Clone()
intro.Parent = game.Players.LocalPlayer.PlayerGui.MainUI
intro.Name = "IntroTextPleaseThankYou"
intro.Visible = true
intro.Text = "The Forgotten Hotel"
intro.TextTransparency = 0
local underline = UDim2.new(1.1, 0, 0.015, 6)
game.TweenService:Create(intro.Underline, TweenInfo.new(3), {Size = underline}):Play()
wait(7)
game.TweenService:Create(intro.Underline, TweenInfo.new(1.3), {Size = UDim2.new(0.95, 0, 0.015, 6)}):Play()
wait(1)
game.TweenService:Create(intro.Underline, TweenInfo.new(2), {ImageTransparency = 1}):Play()
game.TweenService:Create(intro, TweenInfo.new(2), {TextTransparency = 1}):Play()
game.TweenService:Create(intro.Underline, TweenInfo.new(7), {Size = UDim2.new(0, 0, 0.015, 6)}):Play()
wait(2.3)
intro.Visible = false
wait(9)
intro:Destroy()