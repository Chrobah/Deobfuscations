local Players           = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService  = game:GetService("UserInputService")
local Workspace         = workspace

local LocalPlayer = Players.LocalPlayer
local Camera      = Workspace.CurrentCamera
local SeedModels  = ReplicatedStorage:WaitForChild("Seed_Models")

local function tamperCheck()
    local nonce = ("%d:%d:%d"):format(math.random(1, 100), math.random(0, 255), math.random(1, 10000))
    if not pcall(function() return (tostring(nonce):gmatch(":(%d*):")) end) then
        error("Tamper Detected!")
    end
end
tamperCheck()

local gui = Instance.new("ScreenGui")
gui.Name         = "PetSpawnerGUI"
gui.ResetOnSpawn = false
gui.Parent       = LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Active   = true
frame.Draggable = true
frame.Parent   = gui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel")
title.Text       = "Seed Spawner"
title.Font       = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Parent     = frame

local box = Instance.new("TextBox")
box.PlaceholderText = "Seed x1"
box.Font            = Enum.Font.Gotham
box.Parent          = frame

local spawnBtn = Instance.new("TextButton")
spawnBtn.Text   = "Spawn"
spawnBtn.Parent = frame
Instance.new("UICorner", spawnBtn).CornerRadius = UDim.new(0, 6)

local function mouseWorldPosition()
    local mp  = UserInputService:GetMouseLocation()
    local ray = Camera:ViewportPointToRay(mp.X, mp.Y)
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Blacklist
    params.FilterDescendantsInstances = { LocalPlayer.Character }
    local hit = Workspace:Raycast(ray.Origin, ray.Direction * 1000, params)
    return hit and hit.Position or (ray.Origin + ray.Direction * 50)
end

local function parseSeedRequest(text)
    text = text:gsub("^%s*(.-)%s*$", "%1")
    local amount = tonumber(text:match("x(%d+)")) or 1
    local name   = text:gsub("%s*x%d+$", "")
    return name, amount
end

local function spawnSeed(name, amount)
    local model = SeedModels:FindFirstChild(name)
    if not model then
        print("Seed not found or not a valid part:", name)
        return
    end
    print("Spawning", amount)
    for i = 1, amount do
        local clone = model:Clone()
        local pos   = mouseWorldPosition()
        for _, d in ipairs(clone:GetChildren()) do
            if d:IsA("BasePart") then
                d.Anchored   = false
                d.CanCollide = true
                d.Position   = pos
            end
        end
        clone.Parent = Workspace
    end
end

spawnBtn.MouseButton1Click:Connect(function()
    local name, amount = parseSeedRequest(box.Text)
    spawnSeed(name, amount)
end)
