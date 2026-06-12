-- Sample 3 — a broad feature showcase (all behaviour-preserved through the VM).
local function map(t, f) local r = {} for i, v in t do r[i] = f(v) end return r end
local function reduce(t, f, acc) for _, v in t do acc = f(acc, v) end return acc end

local nums = { 3, 1, 4, 1, 5, 9, 2, 6 }
local squared = map(nums, function(x) return x * x end)
print("squared:", table.concat(squared, ","))
print("sum:", reduce(nums, function(a, b) return a + b end, 0))
print("max:", reduce(nums, math.max, -math.huge))

-- closures with shared, mutated upvalue
local function counter(start)
    local n = start
    return function() n = n + 1 return n end, function() return n end
end
local inc, get = counter(10)
inc(); inc()
print("counter:", get())

-- metatable vector with operators + tostring
local Vec = {}
Vec.__index = Vec
Vec.__add = function(a, b) return setmetatable({ a[1] + b[1], a[2] + b[2] }, Vec) end
Vec.__tostring = function(v) return "(" .. v[1] .. ", " .. v[2] .. ")" end
local v = setmetatable({ 1, 2 }, Vec) + setmetatable({ 3, 4 }, Vec)
print("vector:", tostring(v))

-- varargs + multiple returns + string interpolation
local function stats(...)
    local n = select("#", ...)
    local total = 0
    for _, x in { ... } do total = total + x end
    return total, total / n
end
local total, mean = stats(2, 4, 6, 8)
print(`stats: total={total} mean={mean}`)
