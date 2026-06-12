-- Sample 1 — a client-side score signer. The secret salt and the hashing logic
-- are exactly what you don't want a cheater to read or tamper with.
local SECRET_SALT = "rbx_v3:9f2c-7a11-prod"
local OPCODES = { submit = 0x5A, heartbeat = 0x21, claim = 0xC7 }

local function rotl(x, n) return bit32.bor(bit32.lshift(x, n), bit32.rshift(x, 32 - n)) end

local function sign(playerId, score, action)
    local h = 0x811C9DC5
    local msg = SECRET_SALT .. ":" .. playerId .. ":" .. score .. ":" .. (OPCODES[action] or 0)
    for i = 1, #msg do
        h = bit32.bxor(h, string.byte(msg, i))
        h = rotl(h, 5) % 0x100000000
        h = (h * 16777619) % 0x100000000
    end
    return string.format("%08x", h)
end

local function makePayload(playerId, score, action)
    return { pid = playerId, score = score, action = action, token = sign(playerId, score, action) }
end

for _, case in ipairs({ {1001,4200,"submit"}, {1001,4200,"claim"}, {2002,99,"heartbeat"} }) do
    local pl = makePayload(case[1], case[2], case[3])
    print(string.format("pid=%d score=%-5d action=%-10s token=%s", pl.pid, pl.score, pl.action, pl.token))
end
