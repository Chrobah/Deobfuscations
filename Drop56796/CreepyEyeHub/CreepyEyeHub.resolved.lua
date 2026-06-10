-- source: github.com/Drop56796/CreepyEyeHub  (CreepyEyeHub.lua)
-- [resolved Unknown-VM] https://raw.githubusercontent.com/inceldom/kinx/main/ui — deobfuscating target:

-- (remote Unknown-VM target; constants not extractable here)

-- ========================================

-- source: github.com/Drop56796/CreepyEyeHub  (CreepyEyeHub.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/CreepyEyeHub/main/item.lua  (1298 bytes)

local ESP = {} -- Table to hold our ESP functions and data

-- Function to create a BillboardGui for ESP
function ESP:CreateESP(object)
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = "ESP"
    billboardGui.Adornee = object
    billboardGui.Size = UDim2.new(0, 100, 0, 50)
    billboardGui.AlwaysOnTop = true

    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = billboardGui
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = object.Name
    textLabel.TextColor3 = Color3.new(0, 1, 0) -- Green color
    textLabel.TextStrokeTransparency = 0.5

    billboardGui.Parent = object
end

-- Function to find objects named "Flashlight" and apply ESP
function ESP:ApplyToFlashlights()
    for _, object in pairs(workspace:GetDescendants()) do
        if object:IsA("BasePart") and object.Name == "Flashlight" then
            self:CreateESP(object)
        end
    end
end

-- Apply ESP to all flashlights initially
ESP:ApplyToFlashlights()

-- Optionally, connect to the DescendantAdded event to apply ESP to new flashlights
workspace.DescendantAdded:Connect(function(descendant)
    if descendant:IsA("BasePart") and descendant.Name == "Flashlight" then
        ESP:CreateESP(descendant)
    end
end)


-- ========================================

-- source: github.com/Drop56796/CreepyEyeHub  (CreepyEyeHub.lua)
-- [resolved CLEAN] https://pastebin.com/raw/4LDKiJ5a  (266 bytes)

local Light = game:GetService("Lighting")

function dofullbright()
Light.Ambient = Color3.new(1, 1, 1)
Light.ColorShift_Bottom = Color3.new(1, 1, 1)
Light.ColorShift_Top = Color3.new(1, 1, 1)
end

dofullbright()

Light.LightingChanged:Connect(dofullbright)

-- ========================================

-- source: github.com/Drop56796/CreepyEyeHub  (CreepyEyeHub.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/CreepyEyeHub/main/door.lua  (1256 bytes)

local ESP = {} -- Table to hold our ESP functions and data

-- Function to create a BillboardGui for ESP
function ESP:CreateESP(object)
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = "ESP"
    billboardGui.Adornee = object
    billboardGui.Size = UDim2.new(0, 100, 0, 50)
    billboardGui.AlwaysOnTop = true

    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = billboardGui
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = object.Name
    textLabel.TextColor3 = Color3.new(0, 1, 0) -- Green color
    textLabel.TextStrokeTransparency = 0.5

    billboardGui.Parent = object
end

-- Function to find objects named "door" and apply ESP
function ESP:ApplyToDoors()
    for _, object in pairs(workspace:GetDescendants()) do
        if object:IsA("BasePart") and object.Name == "door" then
            self:CreateESP(object)
        end
    end
end

-- Apply ESP to all doors initially
ESP:ApplyToDoors()

-- Optionally, connect to the DescendantAdded event to apply ESP to new doors
workspace.DescendantAdded:Connect(function(descendant)
    if descendant:IsA("BasePart") and descendant.Name == "door" then
        ESP:CreateESP(descendant)
    end
end)


-- ========================================

-- source: github.com/Drop56796/CreepyEyeHub  (CreepyEyeHub.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/Drop56796/CreepyEyeHub/main/Key.lua  (2117 bytes)

local ESP = {} -- Table to hold our ESP functions and data

-- Function to create a BillboardGui and BoxHandleAdornment for ESP
function ESP:CreateESP(object)
    -- Create BillboardGui
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = "ESP"
    billboardGui.Adornee = object
    billboardGui.Size = UDim2.new(0, 100, 0, 50)
    billboardGui.AlwaysOnTop = true
    billboardGui.StudsOffset = Vector3.new(0, 2, 0)

    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = billboardGui
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = object.Name
    textLabel.TextColor3 = Color3.new(0, 1, 0) -- Green color
    textLabel.TextStrokeTransparency = 0.5

    billboardGui.Parent = object

    -- Create BoxHandleAdornment
    if object:IsA("BasePart") then
        local boxAdornment = Instance.new("BoxHandleAdornment")
        boxAdornment.Size = object.Size
        boxAdornment.Adornee = object
        boxAdornment.Color3 = Color3.fromRGB(0, 255, 0) -- Green color
        boxAdornment.AlwaysOnTop = true
        boxAdornment.ZIndex = 5
        boxAdornment.Transparency = 0.5
        boxAdornment.Parent = object
    end
end

-- Function to find KeyObtain objects and apply ESP
function ESP:ApplyToKeyObtains()
    for _, object in pairs(workspace:GetDescendants()) do
        if object:IsA("BasePart") or object:IsA("Model") then
            if object:FindFirstChild("KeyObtain") then
                self:CreateESP(object)
            end
        elseif object.Name == "KeyObtain" then
            self:CreateESP(object)
        end
    end
end

-- Apply ESP to all KeyObtains initially
ESP:ApplyToKeyObtains()

-- Connect to the DescendantAdded event to apply ESP to new KeyObtains
workspace.DescendantAdded:Connect(function(descendant)
    if descendant:IsA("BasePart") or descendant:IsA("Model") then
        if descendant:FindFirstChild("KeyObtain") then
            ESP:CreateESP(descendant)
        end
    elseif descendant.Name == "KeyObtain" then
        ESP:CreateESP(descendant)
    end
end)

return ESP
