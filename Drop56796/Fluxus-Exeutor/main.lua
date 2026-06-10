--[[
    main.lua  —  organised by minimarchbleeding
    Original : Drop56796/Fluxus-Exeutor  ->  main.lua
    Not obfuscated; reproduced as-is.
--]]

-- Gui to Lua
-- Version: 3.2

-- Instances:

local maingui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local SynFrame = Instance.new("Frame")
local ScriptList = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")
local Logo = Instance.new("ImageButton")
local TextLabel = Instance.new("TextLabel")
local Execute = Instance.new("TextButton")
local Clear = Instance.new("TextButton")
local Unlockfps = Instance.new("TextButton")
local Reset = Instance.new("TextButton")
local Uicredits = Instance.new("TextButton")
local Close = Instance.new("TextButton")
local Off = Instance.new("TextButton")
local main = Instance.new("ScrollingFrame")
local UIListLayout_2 = Instance.new("UIListLayout")
local UIPadding_2 = Instance.new("UIPadding")
local obj = Instance.new("Folder")
local Button = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local Tab = Instance.new("TextButton")
local Label = Instance.new("TextLabel")
local Frame = Instance.new("Frame")
local Val = Instance.new("Frame")
local text = Instance.new("TextLabel")
local value = Instance.new("TextBox")
local UICorner_2 = Instance.new("UICorner")
local UIPadding_3 = Instance.new("UIPadding")
local UICorner_3 = Instance.new("UICorner")

--Properties:

maingui.Name = "maingui"
maingui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
maingui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = maingui
MainFrame.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.0912951156, 0, 0.250927061, 0)
MainFrame.Size = UDim2.new(0, 800, 0, 30)

SynFrame.Name = "SynFrame"
SynFrame.Parent = MainFrame
SynFrame.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
SynFrame.BorderSizePixel = 0
SynFrame.Position = UDim2.new(0, 0, 0.98800987, 0)
SynFrame.Size = UDim2.new(0, 800, 0, 320)

ScriptList.Name = "ScriptList"
ScriptList.Parent = MainFrame
ScriptList.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
ScriptList.BorderSizePixel = 0
ScriptList.Position = UDim2.new(0.836250007, 0, 1.36666715, 0)
ScriptList.Size = UDim2.new(0, 119, 0, 257)
ScriptList.ScrollBarThickness = 7

UIListLayout.Parent = ScriptList
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

UIPadding.Parent = ScriptList
UIPadding.PaddingBottom = UDim.new(0, 1)
UIPadding.PaddingLeft = UDim.new(0, 2)
UIPadding.PaddingRight = UDim.new(0, 2)
UIPadding.PaddingTop = UDim.new(0, 1)

Logo.Name = "Logo"
Logo.Parent = MainFrame
Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo.BackgroundTransparency = 1.000
Logo.BorderSizePixel = 0
Logo.Position = UDim2.new(0.00749999983, 0, 0, 0)
Logo.Size = UDim2.new(0, 29, 0, 29)
Logo.Image = "rbxassetid://15960343185"

TextLabel.Parent = MainFrame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.32249999, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 236, 0, 30)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Fluxus Windows "
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 20.000
TextLabel.TextWrapped = true

Execute.Name = "Execute"
Execute.Parent = MainFrame
Execute.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Execute.BorderSizePixel = 0
Execute.Position = UDim2.new(0.0162499994, 0, 10.2333336, 0)
Execute.Size = UDim2.new(0, 114, 0, 35)
Execute.Font = Enum.Font.SourceSans
Execute.Text = "Execute"
Execute.TextColor3 = Color3.fromRGB(255, 255, 255)
Execute.TextSize = 25.000
Execute.TextWrapped = true

Clear.Name = "Clear"
Clear.Parent = MainFrame
Clear.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Clear.BorderSizePixel = 0
Clear.Position = UDim2.new(0.180000007, 0, 10.2333336, 0)
Clear.Size = UDim2.new(0, 114, 0, 35)
Clear.Font = Enum.Font.SourceSans
Clear.Text = "Clear"
Clear.TextColor3 = Color3.fromRGB(255, 255, 255)
Clear.TextSize = 25.000
Clear.TextWrapped = true

Unlockfps.Name = "Unlockfps"
Unlockfps.Parent = MainFrame
Unlockfps.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Unlockfps.BorderSizePixel = 0
Unlockfps.Position = UDim2.new(0.342500001, 0, 10.2333336, 0)
Unlockfps.Size = UDim2.new(0, 114, 0, 35)
Unlockfps.Font = Enum.Font.SourceSans
Unlockfps.Text = "Unlock fps"
Unlockfps.TextColor3 = Color3.fromRGB(255, 255, 255)
Unlockfps.TextSize = 25.000
Unlockfps.TextWrapped = true

Reset.Name = "Reset"
Reset.Parent = MainFrame
Reset.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Reset.BorderSizePixel = 0
Reset.Position = UDim2.new(0.504999995, 0, 10.2333336, 0)
Reset.Size = UDim2.new(0, 114, 0, 35)
Reset.Font = Enum.Font.SourceSans
Reset.Text = "Reset"
Reset.TextColor3 = Color3.fromRGB(255, 255, 255)
Reset.TextSize = 25.000
Reset.TextWrapped = true

Uicredits.Name = "Ui credits"
Uicredits.Parent = MainFrame
Uicredits.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Uicredits.BorderSizePixel = 0
Uicredits.Position = UDim2.new(0.836250007, 0, 10.2333336, 0)
Uicredits.Size = UDim2.new(0, 119, 0, 35)
Uicredits.Font = Enum.Font.SourceSans
Uicredits.Text = "Ui credits"
Uicredits.TextColor3 = Color3.fromRGB(255, 255, 255)
Uicredits.TextSize = 25.000
Uicredits.TextWrapped = true

Close.Name = "Close"
Close.Parent = MainFrame
Close.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
Close.BackgroundTransparency = 1.000
Close.BorderColor3 = Color3.fromRGB(90, 169, 255)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.970000029, 0, 0, 0)
Close.Size = UDim2.new(0, 24, 0, 24)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextScaled = true
Close.TextSize = 25.000
Close.TextWrapped = true

Off.Name = "Off"
Off.Parent = MainFrame
Off.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
Off.BackgroundTransparency = 1.000
Off.BorderColor3 = Color3.fromRGB(90, 169, 255)
Off.BorderSizePixel = 0
Off.Position = UDim2.new(0.940000057, 0, 0, 0)
Off.Size = UDim2.new(0, 24, 0, 24)
Off.Font = Enum.Font.SourceSans
Off.Text = "-"
Off.TextColor3 = Color3.fromRGB(255, 255, 255)
Off.TextScaled = true
Off.TextSize = 25.000
Off.TextWrapped = true

main.Name = "main"
main.Parent = MainFrame
main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
main.BorderSizePixel = 0
main.Position = UDim2.new(0.0160000008, 0, 1.36699998, 0)
main.Size = UDim2.new(0, 636, 0, 257)
main.ScrollBarThickness = 7

UIListLayout_2.Parent = main
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0, 5)

UIPadding_2.Parent = main
UIPadding_2.PaddingBottom = UDim.new(0, 5)
UIPadding_2.PaddingLeft = UDim.new(0, 5)
UIPadding_2.PaddingRight = UDim.new(0, 5)
UIPadding_2.PaddingTop = UDim.new(0, 5)

obj.Name = "obj"
obj.Parent = MainFrame

Button.Name = "Button"
Button.Parent = obj
Button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Button.BorderSizePixel = 0
Button.Position = UDim2.new(0.0660377368, 0, 0.0166666675, 0)
Button.Size = UDim2.new(1, 0, 0, 30)
Button.Visible = false
Button.AutoButtonColor = false
Button.Font = Enum.Font.SourceSans
Button.TextColor3 = Color3.fromRGB(200, 200, 200)
Button.TextSize = 20.000

UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = Button

Tab.Name = "Tab"
Tab.Parent = obj
Tab.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
Tab.BackgroundTransparency = 1.000
Tab.BorderColor3 = Color3.fromRGB(90, 169, 255)
Tab.BorderSizePixel = 0
Tab.Size = UDim2.new(1, 0, 0, 20)
Tab.Visible = false
Tab.Font = Enum.Font.SourceSans
Tab.Text = "2 Hydroixde.txt"
Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab.TextSize = 18.000
Tab.TextWrapped = true
Tab.TextXAlignment = Enum.TextXAlignment.Left

Label.Name = "Label"
Label.Parent = obj
Label.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Label.BackgroundTransparency = 0.900
Label.BorderColor3 = Color3.fromRGB(255, 255, 255)
Label.BorderSizePixel = 0
Label.Size = UDim2.new(1, 0, 0, 20)
Label.Visible = false
Label.Font = Enum.Font.SourceSans
Label.TextColor3 = Color3.fromRGB(200, 200, 200)
Label.TextSize = 20.000
Label.TextWrapped = true
Label.TextXAlignment = Enum.TextXAlignment.Left

Frame.Parent = Label
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 0.500
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0, 0, 0.899999976, 0)
Frame.Size = UDim2.new(1, 0, 0, 1)

Val.Name = "Val"
Val.Parent = obj
Val.Active = true
Val.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Val.ClipsDescendants = true
Val.Size = UDim2.new(1, 0, 0, 30)
Val.Visible = false

text.Name = "text"
text.Parent = Val
text.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
text.BackgroundTransparency = 1.000
text.Size = UDim2.new(0.800000012, 0, 1, 0)
text.Font = Enum.Font.SourceSans
text.Text = "Fe bypass omg!4!!4!44"
text.TextColor3 = Color3.fromRGB(200, 200, 200)
text.TextSize = 20.000
text.TextXAlignment = Enum.TextXAlignment.Left

value.Name = "value"
value.Parent = Val
value.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
value.BorderSizePixel = 0
value.Position = UDim2.new(0.850000024, 0, 0, 0)
value.Size = UDim2.new(0.150000006, 0, 1, 0)
value.Font = Enum.Font.Nunito
value.Text = ""
value.TextColor3 = Color3.fromRGB(255, 255, 255)
value.TextSize = 20.000
value.TextWrapped = true

UICorner_2.CornerRadius = UDim.new(0, 5)
UICorner_2.Parent = value

UIPadding_3.Parent = Val
UIPadding_3.PaddingBottom = UDim.new(0, 5)
UIPadding_3.PaddingLeft = UDim.new(0, 5)
UIPadding_3.PaddingRight = UDim.new(0, 5)
UIPadding_3.PaddingTop = UDim.new(0, 5)

UICorner_3.CornerRadius = UDim.new(0, 5)
UICorner_3.Parent = Val

-- Scripts:

local function UAPY_fake_script() -- Clear.LocalScript 
	local script = Instance.new('Folder', Clear)

	script.Parent.MouseButton1Click:Connect(function()
		for i,v in pairs(script.Parent.Parent.main:GetChildren()) do
			if not v:IsA("UIBase") then v.Visible = false end
		end
	end)
end
coroutine.wrap(UAPY_fake_script)()
local function CVEI_fake_script() -- Unlockfps.LocalScript 
	local script = Instance.new('Folder', Unlockfps)

	script.Parent.MouseButton1Click:Connect(function()
		setfpscap(69420)
	end)
end
coroutine.wrap(CVEI_fake_script)()
local function KZRZVBQ_fake_script() -- Reset.LocalScript 
	local script = Instance.new('Folder', Reset)

	script.Parent.MouseButton1Click:Connect(function()
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
		game.Players.LocalPlayer.Character.Head:Destroy()
	end)
end
coroutine.wrap(KZRZVBQ_fake_script)()
local function SBSIZH_fake_script() -- Uicredits.LocalScript 
	local script = Instance.new('Folder', Uicredits)

	script.Parent.MouseButton1Click:Connect(function()
		print("ui made by HTDBarsi")
	end)
end
coroutine.wrap(SBSIZH_fake_script)()
local function RINLNE_fake_script() -- Close.LocalScript 
	local script = Instance.new('Folder', Close)

	script.Parent.MouseEnter:Connect(function()
		script.Parent.BorderSizePixel = 1
		script.Parent.BackgroundTransparency = 0.8
	end)
	
	script.Parent.MouseLeave:Connect(function()
		script.Parent.BorderSizePixel = 0
		script.Parent.BackgroundTransparency = 1
	end)
end
coroutine.wrap(RINLNE_fake_script)()
local function LEWFZ_fake_script() -- Close.LocalScript 
	local script = Instance.new('Folder', Close)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Parent:Destroy()
	end)
end
coroutine.wrap(LEWFZ_fake_script)()
local function SFJSPUS_fake_script() -- Off.LocalScript 
	local script = Instance.new('Folder', Off)

	script.Parent.MouseButton1Click:Connect(function()
		local val = script.Parent.Parent.main.Visible
		for i,v in pairs(script.Parent.Parent:GetChildren()) do
			if v:IsA("Frame") or v:IsA("TextButton") or v:IsA("ScrollingFrame") then
				if v.Name ~= "Off" and v.Name ~= "Close" then
					v.Visible = not val
				end
			end
		end
	end)
end
coroutine.wrap(SFJSPUS_fake_script)()
local function YUDP_fake_script() -- Off.LocalScript 
	local script = Instance.new('Folder', Off)

	script.Parent.MouseEnter:Connect(function()
		script.Parent.BorderSizePixel = 1
		script.Parent.BackgroundTransparency = 0.8
	end)
	
	script.Parent.MouseLeave:Connect(function()
		script.Parent.BorderSizePixel = 0
		script.Parent.BackgroundTransparency = 1
	end)
end
coroutine.wrap(YUDP_fake_script)()
local function YXITCY_fake_script() -- MainFrame.Drag script 
	local script = Instance.new('Folder', MainFrame)

local function NQBLJK_fake_script() -- MainFrame.LocalScript 
	local script = Instance.new('LocalScript', MainFrame)

	local frame = script.Parent.Parent.MainFrame --in the .frame - you should need to change it what is your frame name.
	local hotkey = Enum.KeyCode.Insert --Change your keybind you want.
	
	local UIS = game:GetService("UserInputService")
	local open = false
	
	
	
	UIS.InputBegan:Connect(function(key, gp)
		if key.KeyCode == hotkey then
			if UIS:GetFocusedTextBox() == nil then
				if open == false then
					open = true 
					frame.Visible = open
				elseif open == true then
					open = false
					frame.Visible = open
				end
			end
		end
	end)
end
coroutine.wrap(NQBLJK_fake_script)()

game:GetService("StarterGui"):SetCore("SendNotification",{
Title = "Press Insert to open/close",
Text = "'", 

Button1 = "",
Button2 = "",
Duration = 5 
})

local function SYHNK_fake_script() -- ImageLabel.LocalScript 
    local script = Instance.new('LocalScript', ImageLabel)
    local lua_keywords = {"and", "break", "do", "else", "elseif", "end", "false", "for", "function", "goto", "if", "in", "local", "nil", "not", "or", "repeat", "return", "then", "true", "until", "while"}
    local global_env = {"getrawmetatable", "game", "workspace", "script", "math", "string", "table", "print", "wait", "BrickColor", "Color3", "next", "pairs", "ipairs", "select", "unpack", "Instance", "Vector2", "Vector3", "CFrame", "Ray", "UDim2", "Enum", "assert", "error", "warn", "tick", "loadstring", "_G", "shared", "getfenv", "setfenv", "newproxy", "setmetatable", "getmetatable", "os", "debug", "pcall", "ypcall", "xpcall", "rawequal", "rawset", "rawget", "tonumber", "tostring", "type", "typeof", "_VERSION", "coroutine", "delay", "require", "spawn", "LoadLibrary", "settings", "stats", "time", "UserSettings", "version", "Axes", "ColorSequence", "Faces", "ColorSequenceKeypoint", "NumberRange", "NumberSequence", "NumberSequenceKeypoint", "gcinfo", "elapsedTime", "collectgarbage", "PhysicalProperties", "Rect", "Region3", "Region3int16", "UDim", "Vector2int16", "Vector3int16"}
    local Source = script.Parent.EditorFrame.Source
    local scrollframe = script.Parent.EditorFrame
    local Lines = Source.Parent.Lines
    local Highlight = function(string, keywords)
        local K = {}
        local S = string
        local Token =
            {
                ["="] = true,
                ["."] = true,
                [","] = true,
                ["("] = true,
                [")"] = true,
                ["["] = true,
                ["]"] = true,
                ["{"] = true,
                ["}"] = true,
                [":"] = true,
                ["*"] = true,
                ["/"] = true,
                ["+"] = true,
                ["-"] = true,
                ["%"] = true,
                [";"] = true,
                ["~"] = true
            }
        for i, v in pairs(keywords) do
            K[v] = true
        end
        S = S:gsub(".", function(c)
            if Token[c] ~= nil then
                return "\32"
            else
                return c
            end
        end)
        S = S:gsub("%S+", function(c)
            if K[c] ~= nil then
                return c
            else
                return (" "):rep(#c)
            end
        end)
        return S
    end
    local hTokens = function(string)
        local Token =
            {
                ["="] = true,
                ["."] = true,
                [","] = true,
                ["("] = true,
                [")"] = true,
                ["["] = true,
                ["]"] = true,
                ["{"] = true,
                ["}"] = true,
                [":"] = true,
                ["*"] = true,
                ["/"] = true,
                ["+"] = true,
                ["-"] = true,
                ["%"] = true,
                [";"] = true,
                ["~"] = true
            }
        local A = ""
        string:gsub(".", function(c)
            if Token[c] ~= nil then
                A = A .. c
            elseif c == "\n" then
                A = A .. "\n"
            elseif c == "\t" then
                A = A .. "\t"
            else
                A = A .. "\32"
            end
        end)
        return A
    end

    local strings = function(string)
        local highlight = ""
        local quote = false
        string:gsub(".", function(c)
            if quote == false and c == "\"" then
                quote = true
            elseif quote == true and c == "\"" then
                quote = false
            end
            if quote == false and c == "\"" then
                highlight = highlight .. "\""
            elseif c == "\n" then
                highlight = highlight .. "\n"
            elseif c == "\t" then
                highlight = highlight .. "\t"
            elseif quote == true then
                highlight = highlight .. c
            elseif quote == false then
                highlight = highlight .. "\32"

	--Credits go to whoever made this script.
	
	local UIS = game:GetService("UserInputService")
	function drag (Frame)
		dragToggle = nil
		dragSpeed = 0.23
		dragInput = nil
		dragStart = nil
		dragPos = nil
		function updateInput(input)
			Delta = input.Position - dragStart
			Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
			game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.25), {Position = Position}):Play()
		end
		Frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
				dragToggle = true
				dragStart = input.Position
				startPos = Frame.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)
		Frame.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if input == dragInput and dragToggle then
				updateInput(input)
			end
		end)
	end
	drag(script.Parent)
	
end
coroutine.wrap(YXITCY_fake_script)()
local function EMHKT_fake_script() -- MainFrame.LocalScript 
	local script = Instance.new('Folder', MainFrame)

	local tabs = {}
	
	function newtab(name)
		local tab = script.Parent.obj.Tab:Clone()
		tab.Name = name
		tab.Text = name
		tab.Visible = true
		tab.Parent = script.Parent.ScriptList
		
		tabs[name] = {}
		
		tab.MouseButton1Click:Connect(function()
			for i,v in pairs(script.Parent.obj.Parent.main:GetChildren()) do
				if not v:IsA("UIBase") then v.Visible = false end
			end
			wait()
			for i,v in pairs(tabs[name]) do	
				v.Visible = true
			end
		end)
		
		tab.MouseEnter:Connect(function()
			tab.BorderSizePixel = 1
			tab.BackgroundTransparency = 0.8
		end)
	
		tab.MouseLeave:Connect(function()
			tab.BorderSizePixel = 0
			tab.BackgroundTransparency = 1
		end)
		
	end
	
	function addbutton(name, tab, func)
		local button = script.Parent.obj.Button:Clone()
		button.Name = name
		button.Text = name
		button.Parent = script.Parent.obj.Parent.main
		table.insert(tabs[tab],button)
		button.MouseButton1Click:Connect(func)
	end
	
	function addval(name,tab)
		local val = script.Parent.obj.Val:Clone()
		val.text.Text = name
		val.Name = name
		table.insert(tabs[tab],val)
		val.Parent = script.Parent.obj.Parent.main
		return val.value
	end
	
	function addlabel(name,tab)
		local label = script.Parent.obj.Label:Clone()
		label.Text = name
		table.insert(tabs[tab],label)
		label.Parent = script.Parent.obj.Parent.main
	end
end
coroutine.wrap(EMHKT_fake_script)()
