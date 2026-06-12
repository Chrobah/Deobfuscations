local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local plr = Players.LocalPlayer

local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local DataEvent = Remotes:WaitForChild("DataEvent")

local Window = {}
Window.__index = Window
function Window.new(title: string)
    local self = setmetatable({}, Window)
    self.gui = Instance.new("ScreenGui")
    self.gui.Name = "ProtectedUI"
    self.gui.ResetOnSpawn = false
    self.frame = Instance.new("Frame", self.gui)
    self.frame.Size = UDim2.new(0, 300, 0, 200)
    self.frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    self.title = title
    self.buttons = {}
    return self
end
function Window:addButton(name, cb)
    local b = Instance.new("TextButton", self.frame)
    b.Text = name
    b.MouseButton1Click:Connect(function()
        cb(self)
        DataEvent:FireServer({ action = "click", button = name, t = os.clock() })
    end)
    table.insert(self.buttons, b)
    return b
end
function Window:show()
    self.gui.Parent = plr:WaitForChild("PlayerGui")
    print(("Window %q ready with %d buttons"):format(self.title, #self.buttons))
end

local w = Window.new("Main Menu")
w:addButton("Start", function(win) print("started", win.title) end)
w:addButton("Quit", function() print("bye") end)
w:show()

local conn
conn = UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        w.frame.Visible = not w.frame.Visible
    end
end)

local x, y = w.title, #w.buttons
return { window = w, info = `${x} / {y}`, conn = conn }
