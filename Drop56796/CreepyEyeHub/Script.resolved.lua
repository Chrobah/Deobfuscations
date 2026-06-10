-- source: github.com/Drop56796/CreepyEyeHub  (Script.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua  (798 bytes)

local GUI = game:GetService("CoreGui"):FindFirstChild("STX_Nofitication")
if not GUI then
    local STX_Nofitication = Instance.new("ScreenGui")
    local STX_NofiticationUIListLayout = Instance.new("UIListLayout")
    STX_Nofitication.Name = "STX_Nofitication"
    STX_Nofitication.Parent = game.CoreGui
    STX_Nofitication.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    STX_Nofitication.ResetOnSpawn = false
    
    STX_NofiticationUIListLayout.Name = "STX_NofiticationUIListLayout"
    STX_NofiticationUIListLayout.Parent = STX_Nofitication
    STX_NofiticationUIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    STX_NofiticationUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    STX_NofiticationUIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
else
end


-- ========================================

-- source: github.com/Drop56796/CreepyEyeHub  (Script.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua  (7641 bytes)

local Nofitication = {}

local GUI = game:GetService("CoreGui"):FindFirstChild("STX_Nofitication")
function Nofitication:Notify(nofdebug, middledebug, all)
    local SelectedType = string.lower(tostring(middledebug.Type))
    local ambientShadow = Instance.new("ImageLabel")
    local Window = Instance.new("Frame")
    local Outline_A = Instance.new("Frame")
    local WindowTitle = Instance.new("TextLabel")
    local WindowDescription = Instance.new("TextLabel")
    
    ambientShadow.Name = "ambientShadow"
    ambientShadow.Parent = GUI
    ambientShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    ambientShadow.BackgroundTransparency = 1.000
    ambientShadow.BorderSizePixel = 0
    ambientShadow.Position = UDim2.new(0.91525954, 0, 0.936809778, 0)
    ambientShadow.Size = UDim2.new(0, 0, 0, 0)
    ambientShadow.Image = "rbxassetid://1316045217"
    ambientShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    ambientShadow.ImageTransparency = 0.400
    ambientShadow.ScaleType = Enum.ScaleType.Slice
    ambientShadow.SliceCenter = Rect.new(10, 10, 118, 118)
    
    Window.Name = "Window"
    Window.Parent = ambientShadow
    Window.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Window.BorderSizePixel = 0
    Window.Position = UDim2.new(0, 5, 0, 5)
    Window.Size = UDim2.new(0, 230, 0, 80)
    Window.ZIndex = 2
    
    Outline_A.Name = "Outline_A"
    Outline_A.Parent = Window
    Outline_A.BackgroundColor3 = middledebug.OutlineColor
    Outline_A.BorderSizePixel = 0
    Outline_A.Position = UDim2.new(0, 0, 0, 25)
    Outline_A.Size = UDim2.new(0, 230, 0, 2)
    Outline_A.ZIndex = 5
    
    WindowTitle.Name = "WindowTitle"
    WindowTitle.Parent = Window
    WindowTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    WindowTitle.BackgroundTransparency = 1.000
    WindowTitle.BorderColor3 = Color3.fromRGB(27, 42, 53)
    WindowTitle.BorderSizePixel = 0
    WindowTitle.Position = UDim2.new(0, 8, 0, 2)
    WindowTitle.Size = UDim2.new(0, 222, 0, 22)
    WindowTitle.ZIndex = 4
    WindowTitle.Font = Enum.Font.GothamSemibold
    WindowTitle.Text = nofdebug.Title
    WindowTitle.TextColor3 = Color3.fromRGB(220, 220, 220)
    WindowTitle.TextSize = 12.000
    WindowTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    WindowDescription.Name = "WindowDescription"
    WindowDescription.Parent = Window
    WindowDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    WindowDescription.BackgroundTransparency = 1.000
    WindowDescription.BorderColor3 = Color3.fromRGB(27, 42, 53)
    WindowDescription.BorderSizePixel = 0
    WindowDescription.Position = UDim2.new(0, 8, 0, 34)
    WindowDescription.Size = UDim2.new(0, 216, 0, 40)
    WindowDescription.ZIndex = 4
    WindowDescription.Font = Enum.Font.GothamSemibold
    WindowDescription.Text = nofdebug.Description
    WindowDescription.TextColor3 = Color3.fromRGB(180, 180, 180)
    WindowDescription.TextSize = 12.000
    WindowDescription.TextWrapped = true
    WindowDescription.TextXAlignment = Enum.TextXAlignment.Left
    WindowDescription.TextYAlignment = Enum.TextYAlignment.Top

    if SelectedType == "default" then
        local function ORBHB_fake_script()
            local script = Instance.new('LocalScript', ambientShadow)
        
            ambientShadow:TweenSize(UDim2.new(0, 240, 0, 90), "Out", "Linear", 0.2)
            Window.Size = UDim2.new(0, 230, 0, 80)
            Outline_A:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", middledebug.Time)
    
            wait(middledebug.Time)
        
            ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
            
            wait(0.2)
            ambientShadow:Destroy()
        end
        coroutine.wrap(ORBHB_fake_script)()
    elseif SelectedType == "image" then
        ambientShadow:TweenSize(UDim2.new(0, 240, 0, 90), "Out", "Linear", 0.2)
        Window.Size = UDim2.new(0, 230, 0, 80)
        WindowTitle.Position = UDim2.new(0, 24, 0, 2)
        local ImageButton = Instance.new("ImageButton")
        ImageButton.Parent = Window
        ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageButton.BackgroundTransparency = 1.000
        ImageButton.BorderSizePixel = 0
        ImageButton.Position = UDim2.new(0, 4, 0, 4)
        ImageButton.Size = UDim2.new(0, 18, 0, 18)
        ImageButton.ZIndex = 5
        ImageButton.AutoButtonColor = false
        ImageButton.Image = all.Image
        ImageButton.ImageColor3 = all.ImageColor

        local function ORBHB_fake_script()
            local script = Instance.new('LocalScript', ambientShadow)
        
            Outline_A:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", middledebug.Time)

            wait(middledebug.Time)
        
            ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
            
            wait(0.2)
            ambientShadow:Destroy()
        end
        coroutine.wrap(ORBHB_fake_script)()
    elseif SelectedType == "option" then
        ambientShadow:TweenSize(UDim2.new(0, 240, 0, 110), "Out", "Linear", 0.2)
        Window.Size = UDim2.new(0, 230, 0, 100)
        local Uncheck = Instance.new("ImageButton")
        local Check = Instance.new("ImageButton")
        
        Uncheck.Name = "Uncheck"
        Uncheck.Parent = Window
        Uncheck.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Uncheck.BackgroundTransparency = 1.000
        Uncheck.BorderSizePixel = 0
        Uncheck.Position = UDim2.new(0, 7, 0, 76)
        Uncheck.Size = UDim2.new(0, 18, 0, 18)
        Uncheck.ZIndex = 5
        Uncheck.AutoButtonColor = false
        Uncheck.Image = "http://www.roblox.com/asset/?id=6031094678"
        Uncheck.ImageColor3 = Color3.fromRGB(255, 84, 84)
        
        Check.Name = "Check"
        Check.Parent = Window
        Check.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Check.BackgroundTransparency = 1.000
        Check.BorderSizePixel = 0
        Check.Position = UDim2.new(0, 28, 0, 76)
        Check.Size = UDim2.new(0, 18, 0, 18)
        Check.ZIndex = 5
        Check.AutoButtonColor = false
        Check.Image = "http://www.roblox.com/asset/?id=6031094667"
        Check.ImageColor3 = Color3.fromRGB(83, 230, 50)

        local function ORBHB_fake_script()
            local script = Instance.new('LocalScript', ambientShadow)
        
            local Stilthere = true
            local function Unchecked()
                pcall(function()
                    all.Callback(false)
                end)
                ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
                
                wait(0.2)
                ambientShadow:Destroy()
                Stilthere = false
            end
            local function Checked()
                pcall(function()
                    all.Callback(true)
                end)
                ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
                
                wait(0.2)
                ambientShadow:Destroy()
                Stilthere = false
            end
            Uncheck.MouseButton1Click:Connect(Unchecked)
            Check.MouseButton1Click:Connect(Checked)
            
            Outline_A:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", middledebug.Time)
    
            wait(middledebug.Time)

            if Stilthere == true then
        
                ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
                
                wait(0.2)
                ambientShadow:Destroy()
            end
        end
        coroutine.wrap(ORBHB_fake_script)()
    end
end

return Nofitication


-- ========================================

-- source: github.com/Drop56796/CreepyEyeHub  (Script.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/DarkSuffer/BasicallyAnDoors-EDITED/main/uilibs/Mobile.lua  (60116 bytes)

-- made by mstudio45#5590
-- Services
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Mouse = Players.LocalPlayer:GetMouse()

-- Variables
local Viewport = workspace.CurrentCamera.ViewportSize

local scriptrunning = true
local function wait_check(...)
	if scriptrunning == true then
		return task.wait(...)
	else
		task.wait()
		return false
	end
end

local Library = {
	subs = {
		Wait = wait_check
	}
}

function Library:validate(Values, options)
	for i,v in pairs(Values) do
		if options[i] == nil then
			options[i] = v
		end
	end

	return options
end

function Library:tween(object, goal, Callback, tweeninfo)
	local tween = TweenService:Create(object, tweeninfo or TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), goal)
	tween.Completed:Connect(Callback or function() end)
	tween:Play()
end


function ResizeScrollingFrame(ScrollingFrame, UiListUiGrid)
	ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UiListUiGrid.AbsoluteContentSize.Y + 10) 
end
function getAbsoluteSize(frame)
	local totalSize = Vector2.new()

	for _, Child in pairs(frame:GetChildren()) do
		if Child:IsA("GuiBase2d") then
			totalSize += Child.AbsoluteSize
		end
	end

	return totalSize
end

function randomString()local length = math.random(10,20);local array = {};for i = 1, length do array[i] = string.char(math.random(32, 126)) end;return table.concat(array);end
function Library:CreateWindow(options)
	options = Library:validate({
		Name = "ML",
		Themeable = false
	}, options or {})

	local GUI = {
		CurrentTab = nil,
		CanDrag = false,
		Minimize = {
			Hover = false,
			MouseDown = false,
			Opened = true
		},
                TotalTabs = 1
	}

	local Notifications = {

	}

	--300
	-- Main Frame
	do
		GUI["1"] = Instance.new("ScreenGui")
		GUI["1"]["Name"] = randomString()
		if get_hidden_gui or gethui then
			local HIDEUI = get_hidden_gui or gethui
			GUI["1"]["Parent"] = HIDEUI()
		elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then
			syn.protect_gui(GUI["1"])
			GUI["1"]["Parent"] = game:GetService("CoreGui")
		elseif game:GetService("CoreGui"):FindFirstChild('RobloxGui') then
			GUI["1"]["Parent"] = game:GetService("CoreGui").RobloxGui
		else
			GUI["1"]["Parent"] = game:GetService("CoreGui")
		end
		--GUI["1"]["Parent"] = game.Players.LocalPlayer:WaitForChild("PlayerGui")

		GUI["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
		GUI["1"]["IgnoreGuiInset"] = true;

		-- StarterGui.ML.Main
		GUI["2"] = Instance.new("Frame", GUI["1"]);
		GUI["2"]["BackgroundColor3"] = Color3.fromRGB(49, 49, 49);
		GUI["2"]["AnchorPoint"] = Vector2.new(0, 0);
		GUI["2"]["Size"] = UDim2.new(0, 400, 0, 300);
		GUI["2"]["ClipsDescendants"] = true;
		GUI["2"]["Position"] = UDim2.fromOffset((Viewport.X / 2) - (GUI["2"]["Size"].X.Offset / 2), (Viewport.Y / 2) - (GUI["2"]["Size"].Y.Offset / 2));
		GUI["2"]["Name"] = [[Main]];

		-- StarterGui.ML.Main.UICorner
		GUI["3"] = Instance.new("UICorner", GUI["2"]);
		GUI["3"]["CornerRadius"] = UDim.new(0, 6);

		-- StarterGui.ML.Main.DropShadowHolder
		GUI["4"] = Instance.new("Frame", GUI["2"]);
		GUI["4"]["ZIndex"] = 0;
		GUI["4"]["BorderSizePixel"] = 0;
		GUI["4"]["BackgroundTransparency"] = 1;
		GUI["4"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["4"]["Name"] = [[DropShadowHolder]];

		-- StarterGui.ML.Main.DropShadowHolder.DropShadow
		GUI["5"] = Instance.new("ImageLabel", GUI["4"]);
		GUI["5"]["ZIndex"] = 0;
		GUI["5"]["BorderSizePixel"] = 0;
		GUI["5"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
		GUI["5"]["ScaleType"] = Enum.ScaleType.Slice;
		GUI["5"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["5"]["ImageTransparency"] = 0.5;
		GUI["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["5"]["Image"] = [[rbxassetid://6014261993]];
		GUI["5"]["Size"] = UDim2.new(1, 47, 1, 47);
		GUI["5"]["Name"] = [[DropShadow]];
		GUI["5"]["BackgroundTransparency"] = 1;
		GUI["5"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

		-- StarterGui.ML.Main.TopBar
		GUI["6"] = Instance.new("Frame", GUI["2"]);
		GUI["6"]["BorderSizePixel"] = 0;
		GUI["6"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
		GUI["6"]["Size"] = UDim2.new(1, 0, 0, 30);
		GUI["6"]["Name"] = [[TopBar]];

		-- StarterGui.ML.Main.TopBar.UICorner
		GUI["7"] = Instance.new("UICorner", GUI["6"]);
		GUI["7"]["CornerRadius"] = UDim.new(0, 6);

		-- StarterGui.ML.Main.TopBar.Extension
		GUI["8"] = Instance.new("Frame", GUI["6"]);
		GUI["8"]["BorderSizePixel"] = 0;
		GUI["8"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
		GUI["8"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["8"]["Size"] = UDim2.new(1, 0, 0.5, 0);
		GUI["8"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["8"]["Name"] = [[Extension]];

		-- StarterGui.ML.Main.TopBar.Title
		GUI["9"] = Instance.new("TextLabel", GUI["6"]);
		GUI["9"]["TextWrapped"] = true;
		GUI["9"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		GUI["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["9"]["TextSize"] = 14;
		GUI["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["9"]["Size"] = UDim2.new(0.5, 0, 1, 0);
		GUI["9"]["Text"] = options["Name"];
		GUI["9"]["Name"] = [[Title]];
		GUI["9"]["Font"] = Enum.Font.Gotham;
		GUI["9"]["BackgroundTransparency"] = 1;

		-- StarterGui.ML.Main.TopBar.Title.UIPadding
		GUI["a"] = Instance.new("UIPadding", GUI["9"]);
		GUI["a"]["PaddingLeft"] = UDim.new(0, 8);

		-- StarterGui.ML.Main.TopBar.ExitBtn
		GUI["b"] = Instance.new("ImageButton", GUI["6"]);
		GUI["b"]["ZIndex"] = 2;
		GUI["b"]["BorderSizePixel"] = 0;
		GUI["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["b"]["Selectable"] = true;
		GUI["b"]["AnchorPoint"] = Vector2.new(1, 0.5);
		GUI["b"]["Image"] = [[rbxassetid://3926305904]];
		GUI["b"]["ImageRectSize"] = Vector2.new(24, 24);
		GUI["b"]["Size"] = UDim2.new(0, 22, 0, 22);
		GUI["b"]["Active"] = true;
		GUI["b"]["Name"] = [[ExitBtn]];
		GUI["b"]["ImageRectOffset"] = Vector2.new(284, 4);
		GUI["b"]["BackgroundTransparency"] = 1;
		GUI["b"]["Position"] = UDim2.new(1, -4, 0.5, 0);

		-- StarterGui.ML.Main.TopBar.Minimize
		GUI["c"] = Instance.new("ImageButton", GUI["6"]);
		GUI["c"]["ZIndex"] = 2;
		GUI["c"]["BorderSizePixel"] = 0;
		GUI["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["c"]["Selectable"] = true;
		GUI["c"]["AnchorPoint"] = Vector2.new(1, 0.5);
		GUI["c"]["Image"] = [[rbxassetid://6764432408]];
		GUI["c"]["ImageRectSize"] = Vector2.new(50, 50);
		GUI["c"]["Size"] = UDim2.new(0, 22, 0, 22);
		GUI["c"]["Active"] = true;
		GUI["c"]["Name"] = [[Minimize]];
		GUI["c"]["ImageRectOffset"] = Vector2.new(50, 550);
		GUI["c"]["BackgroundTransparency"] = 1;
		GUI["c"]["Position"] = UDim2.new(1, -30, 0.5, 0);

		-- StarterGui.ML.Main.TopBar.Line
		GUI["d"] = Instance.new("Frame", GUI["6"]);
		GUI["d"]["BorderSizePixel"] = 0;
		GUI["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["d"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["d"]["Size"] = UDim2.new(1, 0, 0, 1);
		GUI["d"]["Position"] = UDim2.new(0, 0, 1, 0);
		GUI["d"]["Name"] = [[Line]];

		-- StarterGui.ML.Main.Content
		GUI["19"] = Instance.new("Frame", GUI["2"]);
		GUI["19"]["ZIndex"] = 2;
		GUI["19"]["BorderSizePixel"] = 0;
		GUI["19"]["BackgroundColor3"] = Color3.fromRGB(37, 37, 37);
		GUI["19"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["19"]["BackgroundTransparency"] = 1;
		GUI["19"]["Size"] = UDim2.new(1, -133, 1, -42);
		GUI["19"]["BorderColor3"] = Color3.fromRGB(55, 55, 55);
		GUI["19"]["Position"] = UDim2.new(1, -6, 0, 36);
		GUI["19"]["Name"] = [[Content]];

		-- StarterGui.ML.Main.Content.UICorner
		GUI["1a"] = Instance.new("UICorner", GUI["19"]);
		GUI["1a"]["CornerRadius"] = UDim.new(0, 6);

		-- StarterGui.ML.Main.Content.Fade
		GUI["5a"] = Instance.new("Frame", GUI["19"]);
		GUI["5a"]["ZIndex"] = 10;
		GUI["5a"]["BorderSizePixel"] = 0;
		GUI["5a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["5a"]["Size"] = UDim2.new(1, 0, 0, 30);
		GUI["5a"]["Visible"] = false;
		GUI["5a"]["Name"] = [[Fade]];

		-- StarterGui.ML.Main.Content.Fade.UIGradient
		GUI["5b"] = Instance.new("UIGradient", GUI["5a"]);
		GUI["5b"]["Rotation"] = 90;
		GUI["5b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(29, 29, 29)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(29, 29, 29))};
	end

	-- Navigation
	do
		-- StarterGui.ML.Main.Navigation
		GUI["e"] = Instance.new("Frame", GUI["2"]);
		GUI["e"]["BorderSizePixel"] = 0;
		GUI["e"]["BackgroundColor3"] = Color3.fromRGB(66, 66, 66);
		GUI["e"]["Size"] = UDim2.new(0, 120, 1, -30);
		GUI["e"]["Position"] = UDim2.new(0, 0, 0, 30);
		GUI["e"]["Name"] = [[Navigation]];

		-- StarterGui.ML.Main.Navigation.UICorner
		GUI["f"] = Instance.new("UICorner", GUI["e"]);
		GUI["f"]["CornerRadius"] = UDim.new(0, 6);

		-- StarterGui.ML.Main.Navigation.Hide
		GUI["10"] = Instance.new("Frame", GUI["e"]);
		GUI["10"]["BorderSizePixel"] = 0;
		GUI["10"]["BackgroundColor3"] = Color3.fromRGB(66, 66, 66);
		GUI["10"]["Size"] = UDim2.new(1, 0, 0, 20);
		GUI["10"]["Name"] = [[Hide]];

		-- StarterGui.ML.Main.Navigation.Hide2
		GUI["11"] = Instance.new("Frame", GUI["e"]);
		GUI["11"]["BorderSizePixel"] = 0;
		GUI["11"]["BackgroundColor3"] = Color3.fromRGB(66, 66, 66);
		GUI["11"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["11"]["Size"] = UDim2.new(0, 20, 1, 0);
		GUI["11"]["Position"] = UDim2.new(1, 0, 0, 0);
		GUI["11"]["Name"] = [[Hide2]];

		-- StarterGui.ML.Main.Navigation.ButtonHolder
		GUI["12"] = Instance.new("Frame", GUI["e"]);
		GUI["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["12"]["BackgroundTransparency"] = 1;
		GUI["12"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["12"]["Name"] = [[ButtonHolder]];

		-- StarterGui.ML.Main.Navigation.ButtonHolder.UIPadding
		GUI["13"] = Instance.new("UIPadding", GUI["12"]);
		GUI["13"]["PaddingTop"] = UDim.new(0, 8);
		GUI["13"]["PaddingBottom"] = UDim.new(0, 8);

		-- StarterGui.ML.Main.Navigation.ButtonHolder.UIListLayout
		GUI["14"] = Instance.new("UIListLayout", GUI["12"]);
		GUI["14"]["Padding"] = UDim.new(0, 1);
		GUI["14"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

		-- StarterGui.ML.Main.Navigation.Line
		GUI["18"] = Instance.new("Frame", GUI["e"]);
		GUI["18"]["BorderSizePixel"] = 0;
		GUI["18"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["18"]["Size"] = UDim2.new(0, 1, 1, 0);
		GUI["18"]["Position"] = UDim2.new(1, 0, 0, 0);
		GUI["18"]["Name"] = [[Line]];
	end

	-- Logic
	do
		task.spawn(function()
			local gui = GUI["2"]
			local dragging
			local dragInput
			local dragStart
			local startPos
			local function update(input)
				local delta = input.Position - dragStart
				gui.Position = gui:TweenPosition(UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y), 'Out', 'Linear', 0, true); -- drag speed
			end
			gui.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					dragging = true
					dragStart = input.Position
					startPos = gui.Position

					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragging = false
						end
					end)
				end
			end)
			gui.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					dragInput = input
				end
			end)
			game:GetService("UserInputService").InputChanged:Connect(function(input)
				if input == dragInput and dragging then
					update(input)
				end
			end)
		end)

		task.spawn(function()
			local ExitBtn = {
				Hover = false,
				MouseDown = false,
				Opened = true
			}

			-- Logic
			do
				GUI["b"].MouseButton1Click:Connect(function()
					Library.unload()
				end)
			end

			GUI["2"]["Size"] = UDim2.new(0, 400, 0, 300);
		end)

		task.spawn(function()
			-- Logic
			do
				GUI["c"].MouseButton1Click:Connect(function()
					Library.toggle()
				end)
			end

			GUI["2"]["Size"] = UDim2.new(0, 400, 0, 300);
		end)
	end	

	function GUI:CreateTab(options)
		options = Library:validate({
			Name = "Preview Tab",
			Icon = "",--"rbxassetid://10888331510",
			IconOffset = Vector2.new(0, 0),
			IconSize =  Vector2.new(0, 0)
		}, options or {})

		local Tab = {
			Hover = false,
			Active = false
		}

		if GUI.CurrentTab == nil and options.Icon == "" then
			options.Icon = "rbxassetid://10888331510"
		end

		-- Render
		do
			-- StarterGui.ML.Main.Navigation.ButtonHolder.Inactive
			Tab["15"] = Instance.new("TextButton", GUI["12"]);
			Tab["15"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Tab["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["15"]["TextSize"] = 14;
			Tab["15"]["TextColor3"] = Color3.fromRGB(200, 200, 200);
			Tab["15"]["Size"] = UDim2.new(1, 0, 0, 24);
			Tab["15"]["Text"] = options["Name"];
			Tab["15"]["Name"] = [[Inactive]];
			Tab["15"]["Font"] = Enum.Font.Gotham;
			Tab["15"]["BackgroundTransparency"] = 1;
pcall(function() Tab["15"]["ZIndex"] = Library.TotalTabs;Library.TotalTabs+=1 end)
			-- StarterGui.ML.Main.Navigation.ButtonHolder.Inactive.UIPadding
			Tab["16"] = Instance.new("UIPadding", Tab["15"]);
			Tab["16"]["PaddingLeft"] = UDim.new(0, 28);

			-- StarterGui.ML.Main.Navigation.ButtonHolder.Inactive.Icon
			Tab["17"] = Instance.new("ImageLabel", Tab["15"]);
			Tab["17"]["BorderSizePixel"] = 0;
			Tab["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["17"]["ImageColor3"] = Color3.fromRGB(200, 200, 200);
			Tab["17"]["AnchorPoint"] = Vector2.new(0, 0.5);
			Tab["17"]["Image"] = options["Icon"];
			Tab["17"]["ImageRectSize"] = options["IconSize"];
			Tab["17"]["Size"] = UDim2.new(0, 20, 0, 20);
			Tab["17"]["ImageRectOffset"] = options["IconOffset"];
			Tab["17"]["BackgroundTransparency"] = 1;
			Tab["15"]["Name"] = [[Icon]]
			Tab["17"]["Position"] = UDim2.new(0, -24, 0.5, 0);

			-- StarterGui.ML.Main.Content.Tab
			Tab["1b"] = Instance.new("ScrollingFrame", GUI["19"]);
			Tab["1b"]["BorderSizePixel"] = 0;
			Tab["1b"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
			Tab["1b"]["BackgroundTransparency"] = 1;
			Tab["1b"]["Size"] = UDim2.new(1, 0, 1, 0);
			Tab["1b"]["Selectable"] = false;
			Tab["1b"]["ScrollBarThickness"] = 0;
			Tab["1b"]["Name"] = options["Name"];
			--Tab["1b"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
			Tab["1b"]["SelectionGroup"] = false;
			Tab["1b"]["Visible"] = false;

			-- StarterGui.ML.Main.Content.HomeTab.UIPadding
			Tab["21"] = Instance.new("UIPadding", Tab["1b"]);
			Tab["21"]["PaddingTop"] = UDim.new(0, 1);
			Tab["21"]["PaddingRight"] = UDim.new(0, 1);
			Tab["21"]["PaddingBottom"] = UDim.new(0, 1);
			Tab["21"]["PaddingLeft"] = UDim.new(0, 1);

			-- StarterGui.ML.Main.Content.HomeTab.UIListLayout
			Tab["22"] = Instance.new("UIListLayout", Tab["1b"]);
			Tab["22"]["Padding"] = UDim.new(0, 6);
			Tab["22"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		end

		-- Methods
		function Tab:Activate()
			if Tab.Active == false then
				if GUI.CurrentTab ~= nil then
					GUI.CurrentTab:Deactivate()
				end

				Tab.Active = true
				Library:tween(Tab["15"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
				Library:tween(Tab["17"], {ImageColor3 = Color3.fromRGB(255, 255, 255)})
				Library:tween(Tab["15"], {BackgroundTransparency = 0.8})
				Tab["1b"].Visible = true

				GUI.CurrentTab = Tab
			end
		end

		function Tab:Deactivate()
			if Tab.Active == true then
				Tab.Active = false
				Tab.Hover = false
				Library:tween(Tab["15"], {TextColor3 = Color3.fromRGB(200, 200, 200)})
				Library:tween(Tab["17"], {ImageColor3 = Color3.fromRGB(200, 200, 200)})
				Library:tween(Tab["15"], {BackgroundTransparency = 1})
				Tab["1b"].Visible = false
			end
		end

		-- Logic
		do
			Tab["15"].MouseButton1Click:Connect(function()
				Tab:Activate()
			end)

			if GUI.CurrentTab == nil then
				Tab:Activate()
			end
		end

		function Tab:CreateSection(options)
			options = Library:validate({
				Name = "Preview Section",
				Side = ""
			}, options or {})

			local Section = {
				Hover = false,
				Active = false,
				ResizeFunc = nil
			}

			-- Render
			do
				-- StarterGui.[L"~J:kcm=$E9P}`.:e&.Main.Content.Preview Tab.Preview Section
				Section["14"] = Instance.new("Frame", Tab["1b"]);
				Section["14"]["BorderSizePixel"] = 0;
				--Section["14"]["CanvasSize"] = UDim2.new(0, 0, 0, 36);
				Section["14"]["BackgroundColor3"] = Color3.fromRGB(59, 59, 59);
				Section["14"]["Size"] = UDim2.new(1, 0, 0, 26);
				Section["14"]["Selectable"] = false;
				--Section["14"]["ScrollBarThickness"] = 0;
				Section["14"]["Name"] = [[Section]];
				Section["14"]["SelectionGroup"] = false;

				-- StarterGui.[L"~J:kcm=$E9P}`.:e&.Main.Content.Preview Tab.Preview Section.UIStroke
				Section["15"] = Instance.new("UIStroke", Section["14"]);
				Section["15"]["Color"] = Color3.fromRGB(255, 255, 255);

				-- StarterGui.[L"~J:kcm=$E9P}`.:e&.Main.Content.Preview Tab.Preview Section.UIListLayout
				Section["19"] = Instance.new("UIListLayout", Section["14"]);
				Section["19"]["Padding"] = UDim.new(0, 6);
				Section["19"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
				Section["19"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

				-- StarterGui.[L"~J:kcm=$E9P}`.:e&.Main.Content.Preview Tab.Preview Section.UIPadding
				Section["1a"] = Instance.new("UIPadding", Section["14"]);
				Section["1a"]["PaddingTop"] = UDim.new(0, 1);
				Section["1a"]["PaddingRight"] = UDim.new(0, 1);
				Section["1a"]["PaddingBottom"] = UDim.new(0, 1);
				Section["1a"]["PaddingLeft"] = UDim.new(0, 1);

				-- StarterGui.[L"~J:kcm=$E9P}`.:e&.Main.Content.Preview Tab.Preview Section.SectionTitle
				Section["16"] = Instance.new("Frame", Section["14"]);
				Section["16"]["BackgroundColor3"] = Color3.fromRGB(91, 0, 0);
				Section["16"]["BackgroundTransparency"] = 1;
				Section["16"]["LayoutOrder"] = -999999999;
				Section["16"]["Size"] = UDim2.new(1, 0, 0, 26);
				Section["16"]["Name"] = [[SectionTitle]];

				-- StarterGui.[L"~J:kcm=$E9P}`.:e&.Main.Content.Preview Tab.Preview Section.SectionTitle.Title
				Section["17"] = Instance.new("TextLabel", Section["16"]);
				Section["17"]["TextWrapped"] = true;
				Section["17"]["RichText"] = true;
				Section["17"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Section["17"]["TextYAlignment"] = Enum.TextYAlignment.Top;
				Section["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Section["17"]["TextSize"] = 14;
				Section["17"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Section["17"]["Size"] = UDim2.new(0.9930291771888733, 0, 1, 0);
				Section["17"]["Text"] = options["Name"];
				Section["17"]["Name"] = [[Title]];
				Section["17"]["Font"] = Enum.Font.GothamBold;
				Section["17"]["BackgroundTransparency"] = 1;
				Section["17"]["Position"] = UDim2.new(0.003952569328248501, 0, 0, 0);

				-- StarterGui.[L"~J:kcm=$E9P}`.:e&.Main.Content.Preview Tab.Preview Section.SectionTitle.UIPadding
				Section["18"] = Instance.new("UIPadding", Section["16"]);
				Section["18"]["PaddingTop"] = UDim.new(0, 6);
				Section["18"]["PaddingRight"] = UDim.new(0, 6);
				Section["18"]["PaddingBottom"] = UDim.new(0, 6);
				Section["18"]["PaddingLeft"] = UDim.new(0, 6);

				Section["14ee"] = Instance.new("Frame", Tab["1b"]);
				Section["14ee"]["BorderSizePixel"] = 0;
				Section["14ee"]["BackgroundTransparency"] = 1;
				Section["14ee"]["Size"] = UDim2.new(1, 0, 0, 5);
				Section["14ee"]["Selectable"] = false;
				Section["14ee"]["Name"] = [[InvisMiddleSection]];
				Section["14ee"]["SelectionGroup"] = false;
			end

			Section.ResizeFunc = function()
				task.spawn(function()
					Section["14"].Size = UDim2.new(1, 0, 0, Section["19"].AbsoluteContentSize.Y + 10) 
					task.wait()
					ResizeScrollingFrame(Tab["1b"] , Tab["22"])
				end)
			end

			-- Contents
			function Section:AddButton(options)
				options = Library:validate({
					Name = "Button",
					Callback = function() end,
				}, options or {})

				local Button = {
					Hover = false,
					MouseDown = false
				}

				-- Render
				do
					-- StarterGui.ML.Main.Content.HomeTab.Button
					Button["1c"] = Instance.new("TextButton", Section["14"]);
					Button["1c"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
					Button["1c"]["Size"] = UDim2.new(0.95, 0, 0, 32);
					Button["1c"]["Name"] = [[Button]];
					Button["1c"]["Text"] = [[]];

					-- StarterGui.ML.Main.Content.HomeTab.Button.UICorner
					Button["1d"] = Instance.new("UICorner", Button["1c"]);
					Button["1d"]["CornerRadius"] = UDim.new(0, 4);

					-- StarterGui.ML.Main.Content.HomeTab.Button.UIStroke
					Button["1e"] = Instance.new("UIStroke", Button["1c"]);
					Button["1e"]["Color"] = Color3.fromRGB(82, 82, 82);
					Button["1e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui.ML.Main.Content.HomeTab.Button.Title
					Button["1f"] = Instance.new("TextLabel", Button["1c"]);
					Button["1f"]["TextWrapped"] = true;
					Button["1f"]["AutomaticSize"] = Enum.AutomaticSize.Y;
					Button["1f"]["TextYAlignment"] = Enum.TextYAlignment.Top;
					--	Button["1f"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
					Button["1f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Button["1f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Button["1f"]["TextSize"] = 14;
					Button["1f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Button["1f"]["Size"] = UDim2.new(1, 0, 1, 0);
					Button["1f"]["Text"] = options["Name"];
					Button["1f"]["Name"] = [[Title]];
					Button["1f"]["Font"] = Enum.Font.Gotham;
					Button["1f"]["BackgroundTransparency"] = 1;

					-- StarterGui.ML.Main.Content.HomeTab.Button.UIPadding
					Button["20"] = Instance.new("UIPadding", Button["1c"]);
					Button["20"]["PaddingTop"] = UDim.new(0, 6);
					Button["20"]["PaddingRight"] = UDim.new(0, 6);
					Button["20"]["PaddingBottom"] = UDim.new(0, 6);
					Button["20"]["PaddingLeft"] = UDim.new(0, 6);
				end

				function Button:_update()
					Button["1c"]["Size"] = UDim2.new(Button["1c"]["Size"].X.Scale, Button["1c"]["Size"].X.Offset, 0, math.huge)
					Button["1c"]["Size"] = UDim2.new(Button["1c"]["Size"].X.Scale, Button["1c"]["Size"].X.Offset, 0, Button["1f"].TextBounds.Y)
					Button["1c"]["Size"] = UDim2.new(Button["1c"]["Size"].X.Scale, Button["1c"]["Size"].X.Offset, 0, Button["1f"].TextBounds.Y + (26-14))
					Section.ResizeFunc()
				end

				-- Logic
				do
					Button["1c"].MouseButton1Click:Connect(function()
					        Library:tween(Button["1c"], {BackgroundColor3 = Color3.fromRGB(57, 57, 57)})
					        Library:tween(Button["1e"], {Color = Color3.fromRGB(200, 200, 200)})
					        options.Callback()
                                                task.wait(0.005)
                                                Library:tween(Button["1c"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
						Library:tween(Button["1e"], {Color = Color3.fromRGB(82, 82, 82)})
                                        end)
				end

				Button:_update()

				return Button
			end

			function Section:AddTextbox(options)
				options = Library:validate({
					Name = "Text box",
					Value = "",
					Multiline = false,
					Callback = function() end,
				}, options or {})

				local TextBox = {
					Hover = false,
					MouseDown = false
				}

				-- Render
				do
					Section:AddLabel({
						Name = options["Name"],
						Position = "Left"
					})
					-- StarterGui.ML.Main.Content.HomeTab.Button
					TextBox["1c"] = Instance.new("TextButton", Section["14"]);
					TextBox["1c"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
					TextBox["1c"]["Size"] = UDim2.new(0.95, 0, 0, 32);
					TextBox["1c"]["Name"] = [[TextBox]];
					TextBox["1c"]["Text"] = [[]];

					-- StarterGui.ML.Main.Content.HomeTab.Button.UICorner
					TextBox["1d"] = Instance.new("UICorner", TextBox["1c"]);
					TextBox["1d"]["CornerRadius"] = UDim.new(0, 4);

					-- StarterGui.ML.Main.Content.HomeTab.Button.UIStroke
					TextBox["1e"] = Instance.new("UIStroke", TextBox["1c"]);
					TextBox["1e"]["Color"] = Color3.fromRGB(82, 82, 82);
					TextBox["1e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui.ML.Main.Content.HomeTab.Button.Title
					TextBox["1f"] = Instance.new("TextBox", TextBox["1c"]);
					TextBox["1f"]["TextWrapped"] = true;
					TextBox["1f"]["AutomaticSize"] = Enum.AutomaticSize.Y;
					TextBox["1f"]["TextYAlignment"] = Enum.TextYAlignment.Top;
					--TextBox["1f"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
					TextBox["1f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					TextBox["1f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					TextBox["1f"]["TextSize"] = 14;
					TextBox["1f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					TextBox["1f"]["Size"] = UDim2.new(1, 0, 1, 0);
					TextBox["1f"]["Text"] = options["Value"];
					TextBox["1f"]["PlaceholderText"] = options["Value"];
					TextBox["1f"]["MultiLine"] = options["Multiline"];
					TextBox["1f"]["ClearTextOnFocus"] = false;
					TextBox["1f"]["Name"] = [[Title]];
					TextBox["1f"]["Font"] = Enum.Font.Gotham;
					TextBox["1f"]["BackgroundTransparency"] = 1;

					-- StarterGui.ML.Main.Content.HomeTab.Button.UIPadding
					TextBox["20"] = Instance.new("UIPadding", TextBox["1c"]);
					TextBox["20"]["PaddingTop"] = UDim.new(0, 6);
					TextBox["20"]["PaddingRight"] = UDim.new(0, 6);
					TextBox["20"]["PaddingBottom"] = UDim.new(0, 6);
					TextBox["20"]["PaddingLeft"] = UDim.new(0, 6);
				end

				-- Methods
				function TextBox:_update()
					TextBox["1c"]["Size"] = UDim2.new(TextBox["1c"]["Size"].X.Scale, TextBox["1c"]["Size"].X.Offset, 0, math.huge)
					TextBox["1c"]["Size"] = UDim2.new(TextBox["1c"]["Size"].X.Scale, TextBox["1c"]["Size"].X.Offset, 0, TextBox["1f"].TextBounds.Y)
					TextBox["1c"]["Size"] = UDim2.new(TextBox["1c"]["Size"].X.Scale, TextBox["1c"]["Size"].X.Offset, 0, TextBox["1f"].TextBounds.Y + (26-14))

					Section.ResizeFunc()
				end

				function TextBox:Set(Name)
					if string.len(Name) ~= 0 then
						TextBox["1f"]["Text"] = tostring(Name);
						TextBox:_update()
					end
				end
				function TextBox:Get()
					return TextBox["1f"]["Text"]
				end

				-- Logic
				do
					TextBox["1c"].MouseButton1Click:Connect(function()
						Library:tween(TextBox["1c"], {BackgroundColor3 = Color3.fromRGB(57, 57, 57)})
						Library:tween(TextBox["1e"], {Color = Color3.fromRGB(200, 200, 200)})
						options.Callback()
						task.wait(.005)
						Library:tween(TextBox["1c"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
						Library:tween(TextBox["1e"], {Color = Color3.fromRGB(82, 82, 82)})
					end)
				end

				Section.ResizeFunc()

				return TextBox
			end

			function Section:AddLabel(options)
				options = Library:validate({
					Name = "Label",
					Position = "center",
				}, options or {})

				local Text = {}

				options.Position = string.lower(options.Position)
				local Namexaligment = Enum.TextXAlignment.Left
				if options.Position == "left" then
					Namexaligment = Enum.TextXAlignment.Left
				end;if options.Position == "center" then
					Namexaligment = Enum.TextXAlignment.Center
				end;if options.Position == "right" then
					Namexaligment = Enum.TextXAlignment.Right
				end

				-- Render
				do
					-- StarterGui.ML.Main.Content.HomeTab.LabelLeft
					Text["23"] = Instance.new("Frame", Section["14"]);
					Text["23"]["BackgroundColor3"] = Color3.fromRGB(90, 0, 0);
					Text["23"]["BackgroundTransparency"] = 1;
					Text["23"]["Size"] = UDim2.new(0.95, 0, 0, 20);
					Text["23"]["Name"] = [[Label]];

					-- StarterGui.ML.Main.Content.HomeTab.LabelLeft.Title
					Text["24"] = Instance.new("TextLabel", Text["23"]);
					Text["24"]["TextWrapped"] = true;
					Text["24"]["AutomaticSize"] = Enum.AutomaticSize.Y;
					Text["24"]["TextYAlignment"] = Enum.TextYAlignment.Top;
					--Text["24"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
					Text["24"]["TextXAlignment"] = Namexaligment;
					Text["24"]["TextYAlignment"] = Enum.TextYAlignment.Top;
					Text["24"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Text["24"]["TextSize"] = 14;
					Text["24"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Text["24"]["Size"] = UDim2.new(1, 0, 1, 0);
					Text["24"]["Text"] = options["Name"];
					Text["24"]["Name"] = [[Title]];
					Text["24"]["Font"] = Enum.Font.GothamBold;
					Text["24"]["BackgroundTransparency"] = 1;

					-- StarterGui.ML.Main.Content.HomeTab.LabelLeft.UIPadding
					Text["25"] = Instance.new("UIPadding", Text["23"]);
					Text["25"]["PaddingTop"] = UDim.new(0, 6);
					Text["25"]["PaddingRight"] = UDim.new(0, 6);
					Text["25"]["PaddingBottom"] = UDim.new(0, 6);
					Text["25"]["PaddingLeft"] = UDim.new(0, 6);
				end

				function Text:_update()
					Text["23"]["Size"] = UDim2.new(Text["23"]["Size"].X.Scale, Text["23"]["Size"].X.Offset, 0, math.huge)
					Text["23"]["Size"] = UDim2.new(Text["23"]["Size"].X.Scale, Text["23"]["Size"].X.Offset, 0, Text["24"].TextBounds.Y)
					Text["23"]["Size"] = UDim2.new(Text["23"]["Size"].X.Scale, Text["23"]["Size"].X.Offset, 0, Text["24"].TextBounds.Y + (26-14))
					Section.ResizeFunc()
				end

				function Text:Set(Name)
					if string.len(Name) ~= 0 then
						Text["24"]["Text"] = tostring(Name);
						Text:_update()
					end
				end
				function Text:Get()
					return Text["24"]["Text"]
				end

				Text:_update()

				Section.ResizeFunc()

				return Text
			end

			function Section:AddSlider(options)
				options = Library:validate({
					Name = "Slider",
					Value = 50,
					Min = 0,
					Max = 100,
					Callback = function(v) end
				}, options or {})

				local Slider = {
					Hover = false,
					MouseDown = false,
					Connection = nil
				}

				-- Render
				do
					-- StarterGui.ML.Main.Content.HomeTab.Slider
					Slider["2c"] = Instance.new("TextButton", Section["14"]);
					Slider["2c"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
					Slider["2c"]["Size"] = UDim2.new(0.95, 0, 0, 42);
					Slider["2c"]["Name"] = [[Slider]];
					Slider["2c"]["Text"] = [[]];

					-- StarterGui.ML.Main.Content.HomeTab.Slider.UICorner
					Slider["2d"] = Instance.new("UICorner", Slider["2c"]);
					Slider["2d"]["CornerRadius"] = UDim.new(0, 4);

					-- StarterGui.ML.Main.Content.HomeTab.Slider.UIStroke
					Slider["2e"] = Instance.new("UIStroke", Slider["2c"]);
					Slider["2e"]["Color"] = Color3.fromRGB(82, 82, 82);
					Slider["2e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui.ML.Main.Content.HomeTab.Slider.Title
					Slider["2f"] = Instance.new("TextLabel", Slider["2c"]);
					Slider["2f"]["TextWrapped"] = true;
					Slider["2f"]["AutomaticSize"] = Enum.AutomaticSize.Y;
					Slider["2f"]["TextYAlignment"] = Enum.TextYAlignment.Top;
					--Slider["2f"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
					Slider["2f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Slider["2f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["2f"]["TextSize"] = 14;
					Slider["2f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["2f"]["Size"] = UDim2.new(0.8531798124313354, -24, 1, -10);
					Slider["2f"]["Text"] = options["Name"];
					Slider["2f"]["Name"] = [[Title]];
					Slider["2f"]["Font"] = Enum.Font.Gotham;
					Slider["2f"]["BackgroundTransparency"] = 1;

					-- StarterGui.ML.Main.Content.HomeTab.Slider.UIPadding
					Slider["30"] = Instance.new("UIPadding", Slider["2c"]);
					Slider["30"]["PaddingTop"] = UDim.new(0, 6);
					Slider["30"]["PaddingRight"] = UDim.new(0, 6);
					Slider["30"]["PaddingBottom"] = UDim.new(0, 6);
					Slider["30"]["PaddingLeft"] = UDim.new(0, 6);

					-- StarterGui.ML.Main.Content.HomeTab.Slider.Value
					Slider["31"] = Instance.new("TextLabel", Slider["2c"]);
					Slider["31"]["TextWrapped"] = true;
					Slider["31"]["TextXAlignment"] = Enum.TextXAlignment.Right;
					Slider["31"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["31"]["TextSize"] = 14;
					Slider["31"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["31"]["AnchorPoint"] = Vector2.new(1, 0);
					Slider["31"]["Size"] = UDim2.new(0.14681994915008545, 24, 1, -10);
					Slider["31"]["Text"] = tostring(options["Value"]);
					Slider["31"]["Name"] = [[Value]];
					Slider["31"]["Font"] = Enum.Font.Gotham;
					Slider["31"]["BackgroundTransparency"] = 1;
					Slider["31"]["Position"] = UDim2.new(1, 0, 0, 0);

					-- StarterGui.ML.Main.Content.HomeTab.Slider.SliderBG
					Slider["32"] = Instance.new("Frame", Slider["2c"]);
					Slider["32"]["BorderSizePixel"] = 0;
					Slider["32"]["BackgroundColor3"] = Color3.fromRGB(13, 13, 13);
					Slider["32"]["AnchorPoint"] = Vector2.new(0, 1);
					Slider["32"]["Size"] = UDim2.new(1, 0, 0, 4);
					Slider["32"]["BorderColor3"] = Color3.fromRGB(13, 13, 13);
					Slider["32"]["Position"] = UDim2.new(0, 0, 1, 0);
					Slider["32"]["Name"] = [[SliderBG]];

					-- StarterGui.ML.Main.Content.HomeTab.Slider.SliderBG.UICorner
					Slider["33"] = Instance.new("UICorner", Slider["32"]);
					Slider["33"]["CornerRadius"] = UDim.new(0, 4);

					-- StarterGui.ML.Main.Content.HomeTab.Slider.SliderBG.UIStroke
					Slider["34"] = Instance.new("UIStroke", Slider["32"]);
					Slider["34"]["Color"] = Color3.fromRGB(64, 64, 64);
					Slider["34"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui.ML.Main.Content.HomeTab.Slider.SliderBG.Draggable
					Slider["35"] = Instance.new("Frame", Slider["32"]);
					Slider["35"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
					Slider["35"]["Size"] = UDim2.new(0.5, 0, 1, 0);
					Slider["35"]["Name"] = [[Draggable]];

					-- StarterGui.ML.Main.Content.HomeTab.Slider.SliderBG.Draggable.UICorner
					Slider["36"] = Instance.new("UICorner", Slider["35"]);
					Slider["36"]["CornerRadius"] = UDim.new(0, 4);
				end

				-- Methods
				function Slider:_update()
					Slider["2c"]["Size"] = UDim2.new(Slider["2c"]["Size"].X.Scale, Slider["2c"]["Size"].X.Offset, 0, math.huge)
					Slider["2c"]["Size"] = UDim2.new(Slider["2c"]["Size"].X.Scale, Slider["2c"]["Size"].X.Offset, 0, Slider["2f"].TextBounds.Y)
					Slider["2c"]["Size"] = UDim2.new(Slider["2c"]["Size"].X.Scale, Slider["2c"]["Size"].X.Offset, 0, Slider["2f"].TextBounds.Y + 26)
					Section.ResizeFunc()
				end

				function Slider:SetText(Name)
					if string.len(Name) ~= 0 then
						Slider["2f"]["Text"] = tostring(Name)
					end
				end

				function Slider:Set(v)
					if v == nil then
						local percentage = math.clamp((Mouse.X - Slider["2c"].AbsolutePosition.X) / (Slider["2c"].AbsoluteSize.X), 0, 1)
						local value = math.floor(((options.Max - options.Min) * percentage) + options.Min)

						Slider["31"]["Text"] = tostring(value)
						Slider["35"]["Size"] = UDim2.fromScale(percentage, 1)
						--Library:tween(Slider["35"], {Size = UDim2.fromScale(percentage, 1)})
					else
						Slider["31"]["Text"] = tostring(v)
						Slider["35"]["Size"] = UDim2.fromScale(((v - options.Min) / (options.Max - options.Min)), 1)
						--Library:tween(Slider["35"], {Size = UDim2.fromScale(((v - options.Min) / (options.Max - options.Min)), 1)}, function() end, TweenInfo.new())				
					end

					options.Callback(Slider:Get())
				end

				function Slider:Get()
					return tonumber(Slider["31"]["Text"])
				end

				-- Logic
				do
					Slider["2c"].MouseButton1Down:Connect(function()
						GUI.CanDrag = false
						Slider.MouseDown = true
						Library:tween(Slider["2c"], {BackgroundColor3 = Color3.fromRGB(57, 57, 57)})
						Library:tween(Slider["2e"], {Color = Color3.fromRGB(200, 200, 200)})
						Library:tween(Slider["34"], {Color = Color3.fromRGB(200, 200, 200)})
						Library:tween(Slider["35"], {BackgroundColor3 = Color3.fromRGB(200, 200, 200)})

						if Slider.Connection == nil or not Slider.Connection then
							Slider.Connection = RunService.RenderStepped:Connect(function(deltaTime)
								GUI.CanDrag = false
								Slider:Set()
							end)
						end
						
						--[[Slider:Set()						
						Library:tween(Slider["2c"], {BackgroundColor3 = Color3.fromRGB(57, 57, 57)})
						Library:tween(Slider["2e"], {Color = Color3.fromRGB(200, 200, 200)})
						Library:tween(Slider["34"], {Color = Color3.fromRGB(200, 200, 200)})
						Library:tween(Slider["35"], {BackgroundColor3 = Color3.fromRGB(200, 200, 200)})

						task.wait(.005)

						Library:tween(Slider["2c"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
						Library:tween(Slider["2e"], {Color = Color3.fromRGB(82, 82, 82)})
						Library:tween(Slider["34"], {Color = Color3.fromRGB(82, 82, 82)})
						Library:tween(Slider["35"], {BackgroundColor3 = Color3.fromRGB(82, 82, 82)})--]]
					end)
					
					Slider["2c"].MouseButton1Up:Connect(function()
						GUI.CanDrag = true
						Slider.MouseDown = false

						Library:tween(Slider["2c"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
						Library:tween(Slider["2e"], {Color = Color3.fromRGB(82, 82, 82)})
						Library:tween(Slider["34"], {Color = Color3.fromRGB(82, 82, 82)})
						Library:tween(Slider["35"], {BackgroundColor3 = Color3.fromRGB(82, 82, 82)})
						
						if Slider.Connection then Slider.Connection:Disconnect()    end
						Slider.Connection = nil
					end)
                                        game:GetService("UserInputService").InputEnded:Connect(function(input, gp)
	                                        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and Slider.MouseDown == true then
						        GUI.CanDrag = true
						        Slider.MouseDown = false

						        Library:tween(Slider["2c"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
						        Library:tween(Slider["2e"], {Color = Color3.fromRGB(82, 82, 82)})
						        Library:tween(Slider["34"], {Color = Color3.fromRGB(82, 82, 82)})
						        Library:tween(Slider["35"], {BackgroundColor3 = Color3.fromRGB(82, 82, 82)})
						
						        if Slider.Connection then Slider.Connection:Disconnect()    end
						        Slider.Connection = nil
	                                        end
                                        end)
				end
 
				Slider:_update()

				return Slider
			end

			function Section:AddToggle(options)
				options = Library:validate({
					Name = "Toggle",
					Value = false,
					Callback = function(val) end
				}, options or {})

				local Toggle = {
					Hover = false,
					MouseDown = false,
					State = false
				}

				-- Render
				do
					-- StarterGui.ML.Main.Content.HomeTab.ToggleInactive
					Toggle["51"] = Instance.new("TextButton", Section["14"]);
					Toggle["51"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
					Toggle["51"]["Size"] = UDim2.new(0.95, 0, 0, 32);
					Toggle["51"]["Name"] = [[ToggleInactive]];
					Toggle["51"]["Text"] = [[]];

					-- StarterGui.ML.Main.Content.HomeTab.ToggleInactive.UICorner
					Toggle["52"] = Instance.new("UICorner", Toggle["51"]);
					Toggle["52"]["CornerRadius"] = UDim.new(0, 4);

					-- StarterGui.ML.Main.Content.HomeTab.ToggleInactive.UIStroke
					Toggle["53"] = Instance.new("UIStroke", Toggle["51"]);
					Toggle["53"]["Color"] = Color3.fromRGB(82, 82, 82);
					Toggle["53"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui.ML.Main.Content.HomeTab.ToggleInactive.Title
					Toggle["54"] = Instance.new("TextLabel", Toggle["51"]);
					Toggle["54"]["TextWrapped"] = true;
					Toggle["54"]["AutomaticSize"] = Enum.AutomaticSize.Y;
					Toggle["54"]["TextYAlignment"] = Enum.TextYAlignment.Top;
					--Toggle["54"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
					Toggle["54"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Toggle["54"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Toggle["54"]["TextSize"] = 14;
					Toggle["54"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Toggle["54"]["Size"] = UDim2.new(1, -26, 1, 0);
					Toggle["54"]["Text"] = options["Name"];
					Toggle["54"]["Name"] = [[Title]];
					Toggle["54"]["Font"] = Enum.Font.Gotham;
					Toggle["54"]["BackgroundTransparency"] = 1;

					-- StarterGui.ML.Main.Content.HomeTab.ToggleInactive.UIPadding
					Toggle["55"] = Instance.new("UIPadding", Toggle["51"]);
					Toggle["55"]["PaddingTop"] = UDim.new(0, 6);
					Toggle["55"]["PaddingRight"] = UDim.new(0, 6);
					Toggle["55"]["PaddingBottom"] = UDim.new(0, 6);
					Toggle["55"]["PaddingLeft"] = UDim.new(0, 6);

					-- StarterGui.ML.Main.Content.HomeTab.ToggleInactive.CheckmarkHolder
					Toggle["56"] = Instance.new("Frame", Toggle["51"]);
					Toggle["56"]["Active"] = true;
					Toggle["56"]["BackgroundColor3"] = Color3.fromRGB(64, 64, 64);
					Toggle["56"]["AnchorPoint"] = Vector2.new(1, 0.5);
					Toggle["56"]["LayoutOrder"] = 3;
					Toggle["56"]["Size"] = UDim2.new(0, 16, 0, 16);
					Toggle["56"]["Selectable"] = true;
					Toggle["56"]["Position"] = UDim2.new(1, -3, 0.5, 0);
					Toggle["56"]["Name"] = [[CheckmarkHolder]];

					-- StarterGui.ML.Main.Content.HomeTab.ToggleInactive.CheckmarkHolder.UICorner
					Toggle["57"] = Instance.new("UICorner", Toggle["56"]);
					Toggle["57"]["CornerRadius"] = UDim.new(0, 4);

					-- StarterGui.ML.Main.Content.HomeTab.ToggleInactive.CheckmarkHolder.UIStroke
					Toggle["58"] = Instance.new("UIStroke", Toggle["56"]);
					Toggle["58"]["Color"] = Color3.fromRGB(82, 82, 82);
					Toggle["58"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui.ML.Main.Content.HomeTab.ToggleInactive.CheckmarkHolder.Checkmark
					Toggle["59"] = Instance.new("ImageButton", Toggle["56"]);
					Toggle["59"]["ZIndex"] = 2;
					Toggle["59"]["ImageTransparency"] = 1;
					Toggle["59"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["59"]["LayoutOrder"] = 3;
					Toggle["59"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
					Toggle["59"]["Image"] = [[rbxassetid://3926305904]];
					Toggle["59"]["ImageRectSize"] = Vector2.new(36, 36);
					Toggle["59"]["Size"] = UDim2.new(1, -2, 1, -2);
					Toggle["59"]["Name"] = [[Checkmark]];
					Toggle["59"]["ImageRectOffset"] = Vector2.new(644, 204);
					Toggle["59"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
					Toggle["59"]["BackgroundTransparency"] = 1;
				end

				-- Methods
				function Toggle:Get()
					return Toggle.State
				end

				function Toggle:Toggle()
					Toggle.State = not Toggle.State
					Library:tween(Toggle["56"], {BackgroundColor3 = Toggle.State and Color3.fromRGB(126, 255, 124) or Color3.fromRGB(64, 64, 64)})
					Library:tween(Toggle["59"], {ImageTransparency = Toggle.State and 0 or 1})

					task.spawn(function()
						task.wait()
						--print(Toggle:Get(), not Toggle:Get())
						options.Callback(Toggle:Get(), not Toggle:Get())
					end)
				end

				function Toggle:Set(v)
					if v ~= nil then
						Toggle.State = v
					end

					Library:tween(Toggle["56"], {BackgroundColor3 = Toggle.State and Color3.fromRGB(126, 255, 124) or Color3.fromRGB(64, 64, 64)})
					Library:tween(Toggle["59"], {ImageTransparency = Toggle.State and 0 or 1})

					task.spawn(function()
						task.wait()
						--print(Toggle:Get(), not Toggle:Get())
						options.Callback(Toggle:Get(), not Toggle:Get())
					end)
				end

				function Toggle:_update()
					Toggle["51"]["Size"] = UDim2.new(Toggle["51"]["Size"].X.Scale, Toggle["51"]["Size"].X.Offset, 0, math.huge)
					Toggle["51"]["Size"] = UDim2.new(Toggle["51"]["Size"].X.Scale, Toggle["51"]["Size"].X.Offset, 0, Toggle["54"].TextBounds.Y)
					Toggle["51"]["Size"] = UDim2.new(Toggle["51"]["Size"].X.Scale, Toggle["51"]["Size"].X.Offset, 0, Toggle["54"].TextBounds.Y + (26-14))
					Section.ResizeFunc()
				end

				Toggle:Set(options["Value"])

				-- Logic
				do
					Toggle["51"].MouseButton1Click:Connect(function()
						Library:tween(Toggle["51"], {BackgroundColor3 = Color3.fromRGB(57, 57, 57)})
						Library:tween(Toggle["53"], {Color = Color3.fromRGB(200, 200, 200)})

						Toggle:Toggle()	

						task.wait(.05)
						Library:tween(Toggle["51"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
						Library:tween(Toggle["53"], {Color = Color3.fromRGB(82, 82, 82)})
					end)
				end

				Toggle:_update()

				return Toggle
			end

			function Section:AddDropdown(options)
				options = Library:validate({
					Name = "Dropdown",
					Value = "",
					List = {},
					Callback = function(v) end
				}, options or {})

				local Dropdown = {
					Hover = false,
					MouseDown = false,
					Items = {},
					Opened = false,
					CurrentItem = nil,
					ToggleDebounce = false,
					HoveringItem = false
				}

				if options.Value == "" then
					options.Value = options.Name
					if #options.List ~= 0 then
						options.Value = options.List[1]
					end
				end

				-- Render
				do
					Section:AddLabel({
						Name = options["Name"],
						Position = "Left"
					})
					-- StarterGui.ML.Main.Content.HomeTab.Dropdown (frame)
					Dropdown["37"] = Instance.new("TextButton", Section["14"]);
					Dropdown["37"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
					Dropdown["37"]["Size"] = UDim2.new(0.95, 0, 0, 32);
					Dropdown["37"]["ClipsDescendants"] = true;
					Dropdown["37"]["Name"] = [[Dropdown]];
					Dropdown["37"]["Text"] = "";

					-- StarterGui.ML.Main.Content.HomeTab.Dropdown.UICorner
					Dropdown["38"] = Instance.new("UICorner", Dropdown["37"]);
					Dropdown["38"]["CornerRadius"] = UDim.new(0, 4);

					-- StarterGui.ML.Main.Content.HomeTab.Dropdown.UIStroke
					Dropdown["39"] = Instance.new("UIStroke", Dropdown["37"]);
					Dropdown["39"]["Color"] = Color3.fromRGB(82, 82, 82);
					Dropdown["39"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui.ML.Main.Content.HomeTab.Dropdown.Title
					Dropdown["3a"] = Instance.new("TextLabel", Dropdown["37"]);
					Dropdown["3a"]["TextWrapped"] = true;
					Dropdown["3a"]["AutomaticSize"] = Enum.AutomaticSize.Y;
					Dropdown["3a"]["TextYAlignment"] = Enum.TextYAlignment.Top;
					--	Dropdown["3a"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
					Dropdown["3a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Dropdown["3a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["3a"]["TextSize"] = 14;
					Dropdown["3a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["3a"]["Size"] = UDim2.new(1, 0, 0, 20);
					Dropdown["3a"]["Text"] = options["Value"];
					Dropdown["3a"]["Name"] = [[Title]];
					Dropdown["3a"]["Font"] = Enum.Font.Gotham;
					Dropdown["3a"]["BackgroundTransparency"] = 1;

					-- StarterGui.ML.Main.Content.HomeTab.Dropdown.UIPadding
					Dropdown["3b"] = Instance.new("UIPadding", Dropdown["37"]);
					Dropdown["3b"]["PaddingTop"] = UDim.new(0, 6);
					Dropdown["3b"]["PaddingRight"] = UDim.new(0, 6);
					Dropdown["3b"]["PaddingBottom"] = UDim.new(0, 6);
					Dropdown["3b"]["PaddingLeft"] = UDim.new(0, 6);

					-- StarterGui.ML.Main.Content.HomeTab.Dropdown.Icon
					Dropdown["3c"] = Instance.new("ImageLabel", Dropdown["37"]);
					Dropdown["3c"]["Selectable"] = true;
					Dropdown["3c"]["AnchorPoint"] = Vector2.new(1, 0);
					Dropdown["3c"]["Image"] = [[rbxassetid://6764432408]];
					Dropdown["3c"]["ImageRectSize"] = Vector2.new(50, 50);
					Dropdown["3c"]["LayoutOrder"] = 3;
					Dropdown["3c"]["Size"] = UDim2.new(0, 20, 0, 20);
					Dropdown["3c"]["Active"] = true;
					Dropdown["3c"]["Name"] = [[Icon]];
					Dropdown["3c"]["ImageRectOffset"] = Vector2.new(200, 550);
					Dropdown["3c"]["BackgroundTransparency"] = 1;
					Dropdown["3c"]["Position"] = UDim2.new(1, 0, 0, 0);

					-- StarterGui.ML.Main.Content.HomeTab.Dropdown.OptionHolder
					Dropdown["3d"] = Instance.new("Frame", Dropdown["37"]);
					Dropdown["3d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown["3d"]["BackgroundTransparency"] = 1;
					Dropdown["3d"]["Size"] = UDim2.new(1, 0, 1, -24);
					Dropdown["3d"]["Position"] = UDim2.new(0, 0, 0, 26);
					Dropdown["3d"]["Visible"] = false;
					Dropdown["3d"]["Name"] = [[OptionHolder]];

					-- StarterGui.ML.Main.Content.HomeTab.Dropdown.OptionHolder.UIListLayout
					Dropdown["3e"] = Instance.new("UIListLayout", Dropdown["3d"]);
					Dropdown["3e"]["Padding"] = UDim.new(0, 6);
					Dropdown["3e"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
				end

				-- Methods
				function Dropdown:Set(Name)
pcall(function()--if typeof(name) == "string" then
					if string.len(Name) ~= 0 then
						Dropdown["3a"]["Text"] = tostring(Name)
					end
 end)
				end
 
				function Dropdown:Get()
					return Dropdown.CurrentItem
				end

				function Dropdown:Resize()
					local count = 0
					for i,v in pairs(Dropdown.Items) do
						if v ~= nil then
							count += 1
						end
					end

					if count > 0 and Dropdown.Opened == true then
						Library:tween(Dropdown["37"], {Size = UDim2.new(0.95, 0, 0, 30 + (count * 32) + 4)}, function()
							Section.ResizeFunc()
						end)
					else
						Library:tween(Dropdown["37"], {Size = UDim2.new(0.95, 0, 0, 30)}, function()
							Section.ResizeFunc()
						end)
					end
				end

				function Dropdown:Add(id, value)
					if Dropdown.Items[id] ~= nil then
						if Dropdown["3d"]:FindFirstChild(id) then
							return
						else
							Dropdown.Items[id] = nil
						end
					end

					local Item = {
						Hover = false,
						MouseDown = false
					}

					Dropdown.Items[id] = {
						instance = {},
						value = value or id,
						id = id,
						Connections = {}
					}

					-- StarterGui.ML.Main.Content.HomeTab.Dropdown.OptionHolder.Option
					Dropdown.Items[id].instance["4d"] = Instance.new("TextButton", Dropdown["3d"]);
					Dropdown.Items[id].instance["4d"]["AutomaticSize"] = Enum.AutomaticSize.Y;
					Dropdown.Items[id].instance["4d"]["TextYAlignment"] = Enum.TextYAlignment.Top;
					--Dropdown.Items[id].instance["4d"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
					Dropdown.Items[id].instance["4d"]["BackgroundColor3"] = Color3.fromRGB(57, 57, 57);
					Dropdown.Items[id].instance["4d"]["TextSize"] = 14;
					Dropdown.Items[id].instance["4d"]["TextColor3"] = Color3.fromRGB(203, 203, 203);
					Dropdown.Items[id].instance["4d"]["Size"] = UDim2.new(1, 0, 0, 16);
					Dropdown.Items[id].instance["4d"]["Text"] = id;
					Dropdown.Items[id].instance["4d"]["Name"] = id;
					Dropdown.Items[id].instance["4d"]["Font"] = Enum.Font.Gotham;

					-- StarterGui.ML.Main.Content.HomeTab.Dropdown.OptionHolder.Option.UIStroke
					Dropdown.Items[id].instance["4d_UIStroke"] = Instance.new("UIStroke", Dropdown.Items[id].instance["4d"]);
					Dropdown.Items[id].instance["4d_UIStroke"]["Color"] = Color3.fromRGB(82, 82, 82);
					Dropdown.Items[id].instance["4d_UIStroke"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui.ML.Main.Content.HomeTab.Dropdown.OptionHolder.Option.UICorner
					Dropdown.Items[id].instance["4d_UICorner"] = Instance.new("UICorner", Dropdown.Items[id].instance["4d"]);
					Dropdown.Items[id].instance["4d_UICorner"]["CornerRadius"] = UDim.new(0, 3);

					Dropdown.Items[id].instance["4d"]["Size"] = UDim2.new(Dropdown.Items[id].instance["4d"]["Size"].X.Scale, Dropdown.Items[id].instance["4d"]["Size"].X.Offset, 0, math.huge)
					Dropdown.Items[id].instance["4d"]["Size"] = UDim2.new(Dropdown.Items[id].instance["4d"]["Size"].X.Scale, Dropdown.Items[id].instance["4d"]["Size"].X.Offset, 0, Dropdown.Items[id].instance["4d"].TextBounds.Y)
					Dropdown.Items[id].instance["4d"]["Size"] = UDim2.new(Dropdown.Items[id].instance["4d"]["Size"].X.Scale, Dropdown.Items[id].instance["4d"]["Size"].X.Offset, 0, Dropdown.Items[id].instance["4d"].TextBounds.Y + (26-14))

					table.insert(
						Dropdown.Items[id].Connections,
						Dropdown.Items[id].instance["4d"].MouseButton1Click:Connect(function()
							if Dropdown.Items[id] == nil then return end

							Library:tween(Dropdown.Items[id].instance["4d_UIStroke"], {Color = Color3.fromRGB(200, 200, 200)})

							Dropdown.CurrentItem = Dropdown.Items[id]
							--if Dropdown.CurrentItem ~= nil then
							Dropdown:Set(Dropdown.CurrentItem.id)
							options.Callback(Dropdown.CurrentItem.id)
							Dropdown:Toggle()
							--end
							task.wait(0.05)
							Library:tween(Dropdown.Items[id].instance["4d_UIStroke"], {Color = Color3.fromRGB(82, 82, 82)})
						end)
					)

					Dropdown:Resize()
				end

				function Dropdown:Remove(id)
					if Dropdown.Items[id] ~= nil then
						if Dropdown.CurrentItem ~= nil then
							if Dropdown.CurrentItem.id == id then
								Dropdown.CurrentItem = nil
							end
						end

						for _, con in pairs(Dropdown.Items[id].Connections) do
							pcall(function()
								con:Disconnect()
							end)
						end
						for _,v in pairs(Dropdown.Items[id].instance) do
							pcall(function()
								v:Destroy()
							end)
						end
						Dropdown.Items[id] = nil
					end

					Dropdown:Resize()
				end

				function Dropdown:Clear()
					for i,v in pairs(Dropdown.Items) do
						Dropdown:Remove(i)
					end
				--[[local ulc = Dropdown["3e"]:Clone()
				Dropdown["3d"]:ClearAllChildren()
				ulc.Parent = Dropdown["3d"]--]]
					Dropdown.CurrentItem = nil
					Dropdown.Items = {}
					--Dropdown:Resize()
				end

				function Dropdown:Toggle()
					if Dropdown.ToggleDebounce == true then return end
					Dropdown.ToggleDebounce = true

					if Dropdown.Opened then
						Library:tween(Dropdown["3c"], {Rotation = 0})
						Library:tween(Dropdown["37"], {Size = UDim2.new(0.95, 0, 0, 30)}, function()
							Dropdown["3d"]["Visible"] = false
							Dropdown.Opened = false
							Dropdown.ToggleDebounce = false
							Section.ResizeFunc()
						end)
					else
						local count = 0
						for i,v in pairs(Dropdown.Items) do
							if v ~= nil then
								count += 1
							end
						end

						if count > 0 then
							Dropdown["3d"]["Visible"] = true
							Library:tween(Dropdown["3c"], {Rotation = 180})
							Library:tween(Dropdown["37"], {Size = UDim2.new(0.95, 0, 0, 30 + (count * 32) + 4)}, function()
								Dropdown.Opened = true
								Dropdown.ToggleDebounce = false
								Section.ResizeFunc()
							end)
						end
					end
				end

				function Dropdown:UpdateList(List)
					if typeof(List) == "table" then
						Dropdown:Clear()
						for _, value in pairs(options["List"]) do
							Dropdown:Add(value)
						end
					end
				end

				-- Logic
				do
					Dropdown["37"].MouseButton1Click:Connect(function()
						Library:tween(Dropdown["37"], {BackgroundColor3 = Color3.fromRGB(57, 57, 57)})
						Library:tween(Dropdown["39"], {Color = Color3.fromRGB(200, 200, 200)})

						if not Dropdown.HoveringItem then
							Dropdown:Toggle()
						end

						task.wait(.05)

						Library:tween(Dropdown["37"], {BackgroundColor3 = Color3.fromRGB(27, 27, 27)})
						Library:tween(Dropdown["39"], {Color = Color3.fromRGB(82, 82, 82)})
					end)
				end

				Dropdown:UpdateList(options["List"])

				Section.ResizeFunc()

				return Dropdown
			end

			return Section
		end

		return Tab
	end

	Library.unload = function()
		spawn(function()
			task.wait(.265)
			GUI["4"]["Visible"] = false;GUI["19"]["Visible"] = false;GUI["e"]["Visible"] = false;
		end)
		Library:tween(GUI["2"], {Size = UDim2.new(0, 400, 0, 30)}, function()
			Library:tween(GUI["2"], {Size = UDim2.new(0, 0, 0, 30)}, function()
				scriptrunning = false;
				GUI["1"]:Destroy()
			end, TweenInfo.new(.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut))
		end, TweenInfo.new(.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut))
	end

	Library.vis_toggle = function()
		GUI["2"].Visible = not GUI["2"].Visible
	end

	Library.vis_show = function()
		GUI["2"].Visible = true
	end

	Library.vis_hide = function()
		GUI["2"].Visible = false
	end

	Library.toggle = function()
		Library.vis_show()
		if GUI.Minimize.Opened then
			spawn(function()
				task.wait(.265)
				GUI["4"]["Visible"] = false;GUI["19"]["Visible"] = false;GUI["e"]["Visible"] = false;
			end)
			Library:tween(GUI["2"], {Size = UDim2.new(0, 400, 0, 30)}, function()
				Library:tween(GUI["2"], {Size = UDim2.new(0, 200, 0, 30)}, function()
					GUI.Minimize.Opened = false
				end, TweenInfo.new(.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut))
			end, TweenInfo.new(.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut))
			--GUI["2"]["Size"] = UDim2.new(0, 400, 0, 300);
		else
			spawn(function()
				task.wait(.368)
				GUI["4"]["Visible"] = true;GUI["19"]["Visible"] = true;GUI["e"]["Visible"] = true;
			end)
			Library:tween(GUI["2"], {Size = UDim2.new(0, 400, 0, 30)}, function()
				Library:tween(GUI["2"], {Size = UDim2.new(0, 400, 0, 300)}, function()
					GUI.Minimize.Opened = true
				end, TweenInfo.new(.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut))
			end, TweenInfo.new(.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut))
		end
	end

	Library.show = function()
		Library.vis_show()
		if not GUI.Minimize.Opened then
			spawn(function()
				task.wait(.368)
				GUI["4"]["Visible"] = true;GUI["19"]["Visible"] = true;GUI["e"]["Visible"] = true;
			end)
			Library:tween(GUI["2"], {Size = UDim2.new(0, 400, 0, 30)}, function()
				Library:tween(GUI["2"], {Size = UDim2.new(0, 400, 0, 300)}, function()
					GUI.Minimize.Opened = true
				end, TweenInfo.new(.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut))
			end, TweenInfo.new(.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut))
		end
	end

	Library.hide = function()
		Library.vis_show()
		if GUI.Minimize.Opened then
			spawn(function()
				task.wait(.265)
				GUI["4"]["Visible"] = false;GUI["19"]["Visible"] = false;GUI["e"]["Visible"] = false;
			end)
			Library:tween(GUI["2"], {Size = UDim2.new(0, 400, 0, 30)}, function()
				Library:tween(GUI["2"], {Size = UDim2.new(0, 200, 0, 30)}, function()
					GUI.Minimize.Opened = false
				end, TweenInfo.new(.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut))
			end, TweenInfo.new(.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut))
			--GUI["2"]["Size"] = UDim2.new(0, 400, 0, 300);
		end
	end

	game:GetService("UserInputService").InputBegan:Connect(function(input, gpa)
		if input.KeyCode == Enum.KeyCode.RightShift then
			Library.vis_toggle()
		end
	end)

	return GUI
end

--local a = Library:CreateWindow()
--local b = a:CreateTab()
--local c = b:CreateSection()
--local e = c:AddLabel()

return Library


-- ========================================

-- source: github.com/Drop56796/CreepyEyeHub  (Script.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua  (798 bytes)

local GUI = game:GetService("CoreGui"):FindFirstChild("STX_Nofitication")
if not GUI then
    local STX_Nofitication = Instance.new("ScreenGui")
    local STX_NofiticationUIListLayout = Instance.new("UIListLayout")
    STX_Nofitication.Name = "STX_Nofitication"
    STX_Nofitication.Parent = game.CoreGui
    STX_Nofitication.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    STX_Nofitication.ResetOnSpawn = false
    
    STX_NofiticationUIListLayout.Name = "STX_NofiticationUIListLayout"
    STX_NofiticationUIListLayout.Parent = STX_Nofitication
    STX_NofiticationUIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    STX_NofiticationUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    STX_NofiticationUIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
else
end


-- ========================================

-- source: github.com/Drop56796/CreepyEyeHub  (Script.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua  (7641 bytes)

local Nofitication = {}

local GUI = game:GetService("CoreGui"):FindFirstChild("STX_Nofitication")
function Nofitication:Notify(nofdebug, middledebug, all)
    local SelectedType = string.lower(tostring(middledebug.Type))
    local ambientShadow = Instance.new("ImageLabel")
    local Window = Instance.new("Frame")
    local Outline_A = Instance.new("Frame")
    local WindowTitle = Instance.new("TextLabel")
    local WindowDescription = Instance.new("TextLabel")
    
    ambientShadow.Name = "ambientShadow"
    ambientShadow.Parent = GUI
    ambientShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    ambientShadow.BackgroundTransparency = 1.000
    ambientShadow.BorderSizePixel = 0
    ambientShadow.Position = UDim2.new(0.91525954, 0, 0.936809778, 0)
    ambientShadow.Size = UDim2.new(0, 0, 0, 0)
    ambientShadow.Image = "rbxassetid://1316045217"
    ambientShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    ambientShadow.ImageTransparency = 0.400
    ambientShadow.ScaleType = Enum.ScaleType.Slice
    ambientShadow.SliceCenter = Rect.new(10, 10, 118, 118)
    
    Window.Name = "Window"
    Window.Parent = ambientShadow
    Window.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Window.BorderSizePixel = 0
    Window.Position = UDim2.new(0, 5, 0, 5)
    Window.Size = UDim2.new(0, 230, 0, 80)
    Window.ZIndex = 2
    
    Outline_A.Name = "Outline_A"
    Outline_A.Parent = Window
    Outline_A.BackgroundColor3 = middledebug.OutlineColor
    Outline_A.BorderSizePixel = 0
    Outline_A.Position = UDim2.new(0, 0, 0, 25)
    Outline_A.Size = UDim2.new(0, 230, 0, 2)
    Outline_A.ZIndex = 5
    
    WindowTitle.Name = "WindowTitle"
    WindowTitle.Parent = Window
    WindowTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    WindowTitle.BackgroundTransparency = 1.000
    WindowTitle.BorderColor3 = Color3.fromRGB(27, 42, 53)
    WindowTitle.BorderSizePixel = 0
    WindowTitle.Position = UDim2.new(0, 8, 0, 2)
    WindowTitle.Size = UDim2.new(0, 222, 0, 22)
    WindowTitle.ZIndex = 4
    WindowTitle.Font = Enum.Font.GothamSemibold
    WindowTitle.Text = nofdebug.Title
    WindowTitle.TextColor3 = Color3.fromRGB(220, 220, 220)
    WindowTitle.TextSize = 12.000
    WindowTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    WindowDescription.Name = "WindowDescription"
    WindowDescription.Parent = Window
    WindowDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    WindowDescription.BackgroundTransparency = 1.000
    WindowDescription.BorderColor3 = Color3.fromRGB(27, 42, 53)
    WindowDescription.BorderSizePixel = 0
    WindowDescription.Position = UDim2.new(0, 8, 0, 34)
    WindowDescription.Size = UDim2.new(0, 216, 0, 40)
    WindowDescription.ZIndex = 4
    WindowDescription.Font = Enum.Font.GothamSemibold
    WindowDescription.Text = nofdebug.Description
    WindowDescription.TextColor3 = Color3.fromRGB(180, 180, 180)
    WindowDescription.TextSize = 12.000
    WindowDescription.TextWrapped = true
    WindowDescription.TextXAlignment = Enum.TextXAlignment.Left
    WindowDescription.TextYAlignment = Enum.TextYAlignment.Top

    if SelectedType == "default" then
        local function ORBHB_fake_script()
            local script = Instance.new('LocalScript', ambientShadow)
        
            ambientShadow:TweenSize(UDim2.new(0, 240, 0, 90), "Out", "Linear", 0.2)
            Window.Size = UDim2.new(0, 230, 0, 80)
            Outline_A:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", middledebug.Time)
    
            wait(middledebug.Time)
        
            ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
            
            wait(0.2)
            ambientShadow:Destroy()
        end
        coroutine.wrap(ORBHB_fake_script)()
    elseif SelectedType == "image" then
        ambientShadow:TweenSize(UDim2.new(0, 240, 0, 90), "Out", "Linear", 0.2)
        Window.Size = UDim2.new(0, 230, 0, 80)
        WindowTitle.Position = UDim2.new(0, 24, 0, 2)
        local ImageButton = Instance.new("ImageButton")
        ImageButton.Parent = Window
        ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageButton.BackgroundTransparency = 1.000
        ImageButton.BorderSizePixel = 0
        ImageButton.Position = UDim2.new(0, 4, 0, 4)
        ImageButton.Size = UDim2.new(0, 18, 0, 18)
        ImageButton.ZIndex = 5
        ImageButton.AutoButtonColor = false
        ImageButton.Image = all.Image
        ImageButton.ImageColor3 = all.ImageColor

        local function ORBHB_fake_script()
            local script = Instance.new('LocalScript', ambientShadow)
        
            Outline_A:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", middledebug.Time)

            wait(middledebug.Time)
        
            ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
            
            wait(0.2)
            ambientShadow:Destroy()
        end
        coroutine.wrap(ORBHB_fake_script)()
    elseif SelectedType == "option" then
        ambientShadow:TweenSize(UDim2.new(0, 240, 0, 110), "Out", "Linear", 0.2)
        Window.Size = UDim2.new(0, 230, 0, 100)
        local Uncheck = Instance.new("ImageButton")
        local Check = Instance.new("ImageButton")
        
        Uncheck.Name = "Uncheck"
        Uncheck.Parent = Window
        Uncheck.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Uncheck.BackgroundTransparency = 1.000
        Uncheck.BorderSizePixel = 0
        Uncheck.Position = UDim2.new(0, 7, 0, 76)
        Uncheck.Size = UDim2.new(0, 18, 0, 18)
        Uncheck.ZIndex = 5
        Uncheck.AutoButtonColor = false
        Uncheck.Image = "http://www.roblox.com/asset/?id=6031094678"
        Uncheck.ImageColor3 = Color3.fromRGB(255, 84, 84)
        
        Check.Name = "Check"
        Check.Parent = Window
        Check.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Check.BackgroundTransparency = 1.000
        Check.BorderSizePixel = 0
        Check.Position = UDim2.new(0, 28, 0, 76)
        Check.Size = UDim2.new(0, 18, 0, 18)
        Check.ZIndex = 5
        Check.AutoButtonColor = false
        Check.Image = "http://www.roblox.com/asset/?id=6031094667"
        Check.ImageColor3 = Color3.fromRGB(83, 230, 50)

        local function ORBHB_fake_script()
            local script = Instance.new('LocalScript', ambientShadow)
        
            local Stilthere = true
            local function Unchecked()
                pcall(function()
                    all.Callback(false)
                end)
                ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
                
                wait(0.2)
                ambientShadow:Destroy()
                Stilthere = false
            end
            local function Checked()
                pcall(function()
                    all.Callback(true)
                end)
                ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
                
                wait(0.2)
                ambientShadow:Destroy()
                Stilthere = false
            end
            Uncheck.MouseButton1Click:Connect(Unchecked)
            Check.MouseButton1Click:Connect(Checked)
            
            Outline_A:TweenSize(UDim2.new(0, 0, 0, 2), "Out", "Linear", middledebug.Time)
    
            wait(middledebug.Time)

            if Stilthere == true then
        
                ambientShadow:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Linear", 0.2)
                
                wait(0.2)
                ambientShadow:Destroy()
            end
        end
        coroutine.wrap(ORBHB_fake_script)()
    end
end

return Nofitication


-- ========================================

-- source: github.com/Drop56796/CreepyEyeHub  (Script.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub  (2703 bytes)

repeat task.wait() until game:IsLoaded()
loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Extras/Global"))()
if KeySystem then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/Extras/Key'))()
end
if Advertisement then
	-- LOST // loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Extras/RobloxScriptsAdvertisment"))()
end
local StartTime = tick()
local A = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.G-Hub-Games-List"))()

local ScreenGui = Instance.new("ScreenGui")
if syn and syn.protect_gui then
	syn.protect_gui(ScreenGui)
	ScreenGui.Parent = CoreGui
elseif gethui then
	ScreenGui.Parent = gethui()
else
	ScreenGui.Parent = CoreGui
end

local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Parent = ScreenGui
ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
ImageLabel.BackgroundTransparency = 1
ImageLabel.Position = UDim2.new(0.5, -(303 / 2), 0.5, -(263 / 2))
ImageLabel.Rotation = 0
ImageLabel.Size = UDim2.new(0, 303, 0, 263)
ImageLabel.Image = "rbxassetid://8429081004"
ImageLabel.ImageTransparency = 1

for Index = 1, 50, 2 do
ImageLabel.ImageTransparency = ImageLabel.ImageTransparency - 0.1
wait()
end
ScreenGui:Destroy()


for i, v in next, A do
	if i == game.GameId or i == game.PlaceId then
		loadstring(game:HttpGet(v))()
	end
end
--Toxic Mods screen thingy And Kiriot22 esp, IY for fly script inspiration, Staylin Save Settings, Felix for being sexy, E621 Anticheat bypass

print("Took ", tick() - StartTime, " To Load <3")

local function Copy()
	setclipboard("No its done not updating anymore")
end
local Gang = Instance.new("BindableFunction")

function Gang.OnInvoke(v)
	if v == "Yes" then
		Copy()
		VG.SendNotification("No", "Why don't you listen", "rbxassetid://8429081004", 15)
	end
end

StarterGui:SetCore("SendNotification",{ Title = "discontinued", Text = "Disabled gone no more updates", Duration = 5, Callback = Gang, Button1 = "Yes", Button2 ="No" })
wait(5)
----------------------------------------------------------------------------------------------
local function Copy()
	setclipboard("https://www.youtube.com/@SirMemeV2")
end
local Gang = Instance.new("BindableFunction")

function Gang.OnInvoke(v)
	if v == "Yes" then
		Copy()
		VG.SendNotification("Sirmemes youtube", "Copying of Sirmemes youtube successful", "rbxassetid://8429081004", 15)
	end
end

StarterGui:SetCore("SendNotification",{ Title = "Sirmemes youtube", Text = "Copy to clipboard?", Duration = 5, Callback = Gang, Button1 = "Yes", Button2 ="No" })

queue_on_teleport[[loadstring(game:HttpGet("https://github.com/1201for/V.G-Hub/blob/main/Extras/Functions"))()]]

-- (nested) https://raw.githubusercontent.com/1201for/V.G-Hub/main/Extras/Global
-- [resolved CLEAN] https://raw.githubusercontent.com/1201for/V.G-Hub/main/Extras/Global  (7310 bytes)

-- (nested) https://raw.githubusercontent.com/1201for/V.G-Hub/main/Extras/Key
-- [resolved CLEAN] https://raw.githubusercontent.com/1201for/V.G-Hub/main/Extras/Key  (3138 bytes)

-- (nested) https://raw.githubusercontent.com/1201for/V.G-Hub/main/Extras/RobloxScriptsAdvertisment
-- [target unavailable] https://raw.githubusercontent.com/1201for/V.G-Hub/main/Extras/RobloxScriptsAdvertisment
--   __FETCH_ERROR__ HTTP Error 404: Not Found
