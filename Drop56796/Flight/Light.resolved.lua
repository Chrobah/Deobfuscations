-- source: github.com/Drop56796/Flight  (Light.lua)
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

-- source: github.com/Drop56796/Flight  (Light.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Shop%20Items/Source.lua  (5591 bytes)

-- Services

local Players = game:GetService("Players")
local ReSt = game:GetService("ReplicatedStorage")

-- Variables

local Plr = Players.LocalPlayer

local SelfModules = {
    UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/UI.lua"))(),
    Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))(),
}

local BlacklistedNames = {"Crucifix", "Skeleton Key", "M249"}
local CustomShop = { Selected = {} }

-- Items List

local List = Plr.PlayerGui.MainUI.ItemShop.Items

if List.ClassName ~= "ScrollingFrame" then
    List = SelfModules.UI.Create("ScrollingFrame", {
        Name = "Items",
        Active = true,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.18, 0),
        Size = UDim2.new(1, 0, 0.6, 0),
        ZIndex = 5,
        HorizontalScrollBarInset = Enum.ScrollBarInset.Always,
        ScrollBarThickness = 0,

        SelfModules.UI.Create("UIGridLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            CellPadding = UDim2.new(0, 15, 0, 15),
        }),

        SelfModules.UI.Create("UIPadding", {
            PaddingBottom = UDim.new(0, 4),
            PaddingLeft = UDim.new(0, 4),
            PaddingRight = UDim.new(0, 4),
            PaddingTop = UDim.new(0, 4),
        }),
    })

    -- Parent existing items to list
    
    for _, v in next, Plr.PlayerGui.MainUI.ItemShop.Items:GetChildren() do
        if v.ClassName == "TextButton" then
            v.Parent = List
        end
    end
    
    Plr.PlayerGui.MainUI.ItemShop.Items:Destroy()
    List.Parent = Plr.PlayerGui.MainUI.ItemShop
    List.UIGridLayout.CellSize = UDim2.new(0.5, -8, 0, List.AbsoluteSize.Y / 1 * 0.31 - 4)
end

-- Functions

CustomShop.CreateItem = function(tool, config)
    task.spawn(function()
        -- Config setup

        local rawItemName = string.gsub(config.Title, " ", "")

        config.RawItemName = rawItemName

        -- Check

        if List:FindFirstChild("CustomItem_".. config.RawItemName) then
            List["CustomItem_".. config.RawItemName]:Destroy()
        end

        if ReSt.ItemShop:FindFirstChild(config.RawItemName) then
            ReSt.ItemShop[config.RawItemName]:Destroy()
        end

        -- Item creation
        
        local Item = { Tool = tool, Config = config }

        local button = List:FindFirstChildOfClass("TextButton"):Clone()
        local selected = false
        local connections = {}

        button.Visible = true
        button.Name = "CustomItem_".. config.RawItemName
        button.Title.Text = config.Title
        button.Desc.Text = config.Desc
        button.ImageLabel.Image = LoadCustomAsset(config.Image)
        button.Price.Text = config.Price

        if not config.Stack or config.Stack <= 1 then
            button.Stack.Visible = false
        else
            button.Stack.Visible = true
            button.Stack.Text = "x".. config.Stack
        end
        
        button.Parent = List
        Item.Button = button

        -- Folder

        local folder = Instance.new("Folder")
        folder.Name = config.RawItemName
        folder.Parent = ReSt.ItemShop
        
        folder:SetAttribute("Price", config.Price)

        -- Select item

        connections.select = button.MouseButton1Down:Connect(function()
            selected = not selected

            button.BackgroundTransparency = selected and 0.5 or 0.9
            Plr.PlayerGui.MainUI.Initiator.Main_Game.PreRun[selected and "Press" or "PressDown"]:Play()

            --

            local upvs = debug.getupvalues(getconnections(List:FindFirstChildOfClass("TextButton").MouseButton1Down)[1].Function)
            local selectedItems = upvs[1]

            if selected then
                selectedItems[#selectedItems + 1] = config.RawItemName
                CustomShop.Selected[#CustomShop.Selected + 1] = Item
            else
                table.remove(selectedItems, table.find(selectedItems, config.RawItemName))
                table.remove(CustomShop.Selected, table.find(CustomShop.Selected, Item))
            end

            upvs[4]() -- Update price
        end)

        -- Update list height

        local buttonsCount = 0

        for _, v in next, List:GetChildren() do
            if v.ClassName == "TextButton" and v.Visible then
                buttonsCount += 1
            end
        end

        local rowCount = math.round(buttonsCount / 2)
        local rowHeight = 8 + rowCount * (List.AbsoluteSize.Y / 1 * 0.31 - 4) + (rowCount - 1) * 15
        
        List.CanvasSize = UDim2.new(0, 0, 0, rowHeight)
    end)
end

-- Scripts

local ncall; ncall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local args = {...}
    
    if not checkcaller() and getnamecallmethod() == "FireServer" and tostring(self) == "PreRunShop" then
        for i, v in next, args[1] do
            if table.find(BlacklistedNames, v) then
                table.remove(args[1], i)
            end
        end
    end
    
    return ncall(self, unpack(args))
end))

local confirmConnection; confirmConnection = Plr.PlayerGui.MainUI.ItemShop.Confirm.MouseButton1Down:Connect(function()
    confirmConnection:Disconnect()

    for _, v in next, CustomShop.Selected do
        if typeof(v.Tool) == "Instance" and v.Tool.ClassName == "Tool" then
            v.Tool.Parent = Plr.Backpack
        end
     end
end)

return CustomShop

-- (nested) https://raw.githubusercontent.com/RegularVynixu/Utilities/main/UI.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/UI.lua  (2500 bytes)

-- (nested) https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua  (3452 bytes)
