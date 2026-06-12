local random = math.random

local function tamperCheck()
    local nonce = ("%d:%d:%d"):format(random(1, 100), random(0, 255), random(1, 10000))
    local ok = pcall(function()
        return (tostring(nonce):gmatch(":(%d*):"))
    end)
    if not ok then
        error("Tamper Detected!")
    end
end

tamperCheck()

local Window = Rayfield:CreateWindow({
    Name = "Grow A Garden anticheat bypasser",
    Icon = 0,
    LoadingTitle = "Grow a garden anticheat bypasser",
    LoadingSubtitle = "by Nozrakk",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "PeterHack",
        FileName = "Bypasser",
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true,
    },
    KeySystem = true,
    KeySettings = {
        Title = "Bypasser",
        Subtitle = "KeySystem",
        Note = "visit this link for the key: https://bstshrt.com/nozrakk/ck1",
        FileName = "Bypassing",
        SaveKey = true,
        GrabKeyFromSite = true,
        Key = { "https://pastebin.com/raw/tnBqbcZM" },
    },
})

setclipboard("https://bstshrt.com/nozrakk/ck1")

local Tab = Window:CreateTab("Bypasser", 0)

Tab:CreateButton({
    Name = "Load script",
    Callback = function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Nozrakk/sszz/refs/heads/main/zz"))()
    end,
})
