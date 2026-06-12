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

loadstring(game:HttpGet("https://raw.githubusercontent.com/Ben141-Hub/PetClonerv2/refs/heads/main/bengrowhub"))()
