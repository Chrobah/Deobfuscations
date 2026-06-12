-- Sample 2 — a typical bit of game logic: a per-key cooldown gate with a fluent API.
-- Exercises closures, metatables/OOP, method chaining, generalized iteration, varargs.
local Cooldown = {}
Cooldown.__index = Cooldown

function Cooldown.new(seconds)
    return setmetatable({ window = seconds, last = {} }, Cooldown)
end

function Cooldown:try(key, now)
    local prev = self.last[key]
    if prev and (now - prev) < self.window then
        return false, self.window - (now - prev)
    end
    self.last[key] = now
    return true, 0
end

function Cooldown:active(now)
    local n = 0
    for key, t in self.last do                  -- Luau generalized iteration (no pairs)
        if (now - t) < self.window then n = n + 1 end
    end
    return n
end

local function log(...) print(string.format(...)) end

local cd = Cooldown.new(5)
local events = { {"fire", 0}, {"fire", 2}, {"fire", 6}, {"dash", 6}, {"dash", 7} }
for _, e in ipairs(events) do
    local key, now = e[1], e[2]
    local ok, wait = cd:try(key, now)
    log("t=%d  %-5s -> %s%s", now, key, ok and "ALLOW" or "DENY",
        ok and "" or (" (wait " .. wait .. "s)"))
end
log("active cooldowns at t=7: %d", cd:active(7))
