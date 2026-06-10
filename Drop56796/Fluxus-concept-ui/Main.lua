--[[
    Main.lua  —  organised by minimarchbleeding
    Original : Drop56796/Fluxus-concept-ui  ->  Main.lua
    Not obfuscated; reproduced as-is.
--]]

-- Services
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")

-- Create UI components
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local ToggleButton = Instance.new("ImageButton")
local ToggleFrame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local ExecuteButton = Instance.new("TextButton")
local ClearButton = Instance.new("TextButton")
local ConsoleToggle = Instance.new("TextButton")
local ConsoleTextBox = Instance.new("TextBox")
local CreditsToggle = Instance.new("TextButton")
local CreditsTextBox = Instance.new("TextBox")
local SaveButton = Instance.new("TextButton")

ScreenGui.Name = "FluxusAndroidUI"
ScreenGui.Parent = CoreGui

-- Main Frame setup
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MainFrame.Size = UDim2.new(0, 950, 0, 825)  -- Expanded size
MainFrame.Position = UDim2.new(0.5, -475, 0.5, -412.5)  -- Centered position
MainFrame.Visible = true

UICorner.Parent = MainFrame
UICorner.CornerRadius = UDim.new(0, 20)

-- Toggle Button setup
ToggleButton.Parent = MainFrame
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0, 5, 0, 5)  -- Positioned at top-left
ToggleButton.Image = "rbxassetid://13327193518"  -- Replace with your AssetID
ToggleButton.BackgroundTransparency = 1

-- Toggle Frame setup
ToggleFrame.Parent = MainFrame
ToggleFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ToggleFrame.Size = UDim2.new(1, -55, 1, -10)
ToggleFrame.Position = UDim2.new(0, 55, 0, 5)  -- Positioned to the right of ToggleButton
ToggleFrame.Visible = false

-- TextBox setup
TextBox.Parent = ToggleFrame
TextBox.Size = UDim2.new(1, -20, 0.6, -10)
TextBox.Position = UDim2.new(0, 10, 0, 10)
TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.Code
TextBox.Text = "Enter code here..."
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.MultiLine = true  -- Allow multiline input

-- Execute Button setup
ExecuteButton.Parent = ToggleFrame
ExecuteButton.Size = UDim2.new(0, 100, 0, 30)
ExecuteButton.Position = UDim2.new(0, 10, 0.7, -35)
ExecuteButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ExecuteButton.Text = "Execute"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.Font = Enum.Font.SourceSans

local ExecuteUICorner = Instance.new("UICorner")
ExecuteUICorner.CornerRadius = UDim.new(0, 10)
ExecuteUICorner.Parent = ExecuteButton

-- Clear Button setup
ClearButton.Parent = ToggleFrame
ClearButton.Size = UDim2.new(0, 100, 0, 30)
ClearButton.Position = UDim2.new(0, 120, 0.7, -35)
ClearButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ClearButton.Text = "Clear"
ClearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearButton.Font = Enum.Font.SourceSans

local ClearUICorner = Instance.new("UICorner")
ClearUICorner.CornerRadius = UDim.new(0, 10)
ClearUICorner.Parent = ClearButton

-- Console Toggle Button setup
ConsoleToggle.Parent = ToggleFrame
ConsoleToggle.Size = UDim2.new(0, 100, 0, 30)
ConsoleToggle.Position = UDim2.new(0, 10, 0.7, -70)
ConsoleToggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ConsoleToggle.Text = "Console"
ConsoleToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
ConsoleToggle.Font = Enum.Font.SourceSans

local ConsoleToggleUICorner = Instance.new("UICorner")
ConsoleToggleUICorner.CornerRadius = UDim.new(0, 10)
ConsoleToggleUICorner.Parent = ConsoleToggle

-- Console TextBox setup
ConsoleTextBox.Parent = ToggleFrame
ConsoleTextBox.Size = UDim2.new(1, -20, 0.3, -10)
ConsoleTextBox.Position = UDim2.new(0, 10, 0.4, 10)
ConsoleTextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ConsoleTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ConsoleTextBox.Font = Enum.Font.Code
ConsoleTextBox.TextXAlignment = Enum.TextXAlignment.Left
ConsoleTextBox.TextYAlignment = Enum.TextYAlignment.Top
ConsoleTextBox.ClearTextOnFocus = false
ConsoleTextBox.TextEditable = false
ConsoleTextBox.TextWrapped = true
ConsoleTextBox.Text = "Console output will appear here..."
ConsoleTextBox.Visible = false

local ConsoleTextBoxUICorner = Instance.new("UICorner")
ConsoleTextBoxUICorner.CornerRadius = UDim.new(0, 10)
ConsoleTextBoxUICorner.Parent = ConsoleTextBox

-- Credits Toggle Button setup
CreditsToggle.Parent = ToggleFrame
CreditsToggle.Size = UDim2.new(0, 100, 0, 30)
CreditsToggle.Position = UDim2.new(0, 10, 0.7, -105)
CreditsToggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CreditsToggle.Text = "Credits"
CreditsToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
CreditsToggle.Font = Enum.Font.SourceSans

local CreditsToggleUICorner = Instance.new("UICorner")
CreditsToggleUICorner.CornerRadius = UDim.new(0, 10)
CreditsToggleUICorner.Parent = CreditsToggle

-- Credits TextBox setup
CreditsTextBox.Parent = ToggleFrame
CreditsTextBox.Size = UDim2.new(1, -20, 0.3, -10)
CreditsTextBox.Position = UDim2.new(0, 10, 0.4, 10)
CreditsTextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CreditsTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CreditsTextBox.Font = Enum.Font.Code
CreditsTextBox.TextXAlignment = Enum.TextXAlignment.Left
CreditsTextBox.TextYAlignment = Enum.TextYAlignment.Top
CreditsTextBox.ClearTextOnFocus = false
CreditsTextBox.TextEditable = false
CreditsTextBox.TextWrapped = true
CreditsTextBox.Text = "Credits:\n- Dev: [Drop56796]\n hi user welcome use or back :D"
CreditsTextBox.Visible = false

local CreditsTextBoxUICorner = Instance.new("UICorner")
CreditsTextBoxUICorner.CornerRadius = UDim.new(0, 10)
CreditsTextBoxUICorner.Parent = CreditsTextBox

-- Save Button setup
SaveButton.Parent = ToggleFrame
SaveButton.Size = UDim2.new(0, 100, 0, 30)
SaveButton.Position = UDim2.new(0, 10, 0.7, -140)
SaveButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SaveButton.Text = "Save"
SaveButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveButton.Font = Enum.Font.SourceSans

local SaveUICorner = Instance.new("UICorner")
SaveUICorner.CornerRadius = UDim.new(0, 10)
SaveUICorner.Parent = SaveButton

-- Animation functions
local function expandUI()
    local goalSize = UDim2.new(0, 950, 0, 825)
    local tweenFrame = TweenService:Create(MainFrame, TweenInfo.new(0.5), {Size = goalSize})
    local tweenToggleButton = TweenService:Create(ToggleButton, TweenInfo.new(0.5), {Position = UDim2.new(0, 5, 0, 5)})

    tweenFrame:Play()
    tweenToggleButton:Play()

    tweenFrame.Completed:Connect(function()
        ToggleButton.Visible = false
        ToggleFrame.Visible = true
    end)
end

local function collapseUI()
    local goalSize = UDim2.new(0, 50, 0, 50)
    local tweenFrame = TweenService:Create(MainFrame, TweenInfo.new(0.5), {Size = goalSize})
    local tweenToggleButton = TweenService:Create(ToggleButton, TweenInfo.new(0.5), {Position = UDim2.new(0, 5, 0, 5)})

    tweenFrame:Play()
    tweenToggleButton:Play()

    tweenFrame.Completed:Connect(function()
        ToggleButton.Visible = true
        ToggleFrame.Visible = false
    end)
end

-- Toggle Button functionality
ToggleButton.MouseButton1Click:Connect(function()
    if ToggleFrame.Visible then
        collapseUI()
    else
        expandUI()
    end
end)

-- Console Toggle Button functionality
ConsoleToggle.MouseButton1Click:Connect(function()
    ConsoleTextBox.Visible = not ConsoleTextBox.Visible
end)

-- Credits Toggle Button functionality
CreditsToggle.MouseButton1Click:Connect(function()
    CreditsTextBox.Visible = not CreditsTextBox.Visible
end)

-- Save Button functionality
SaveButton.MouseButton1Click:Connect(function()
    local code = TextBox.Text
    local fileName = "script_save.txt"
    writefile(fileName, HttpService:JSONEncode({script_name = "script", script = code}))
end)

-- Clear Button functionality
ClearButton.MouseButton1Click:Connect(function()
    TextBox.Text = ""
end)

-- Execute Button functionality
ExecuteButton.MouseButton1Click:Connect(function()
    local code = TextBox.Text
    -- Replace this with actual execution code
    ConsoleTextBox.Text = ConsoleTextBox.Text .. "\nExecuting script:\n" .. code
end)
