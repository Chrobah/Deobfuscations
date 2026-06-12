-- Luarmor V4 loader (deobfuscated)
-- Source: https://api.luarmor.net/files/v4/loaders/002c19202c9946e6047b0c6e0ad51f84.lua
--
-- A tiny bootstrap. It carries the script's identity/key blobs in the global
-- `_bsdata0`, then caches/fetches and runs Luarmor's "Superflow" init bootstrapper
-- (cdn.luarmor.net/v4_init_marbeg.lua), which performs key/HWID auth and decrypts
-- the actual protected script server-side.

_bsdata0 = {
    1961893458,
    "AL13BEL15BB4_.-0L0AE_E11_3_CL01D4RR04REDDBRR_RE-RARB1-EC_D4.522.0D.3_DL404A_1C4E1D..35BR2EA2AE4DEE4_20CD4.DCC132.B3EBE4LDLLL._-_2330ED",
    20520224,
    "\178\77\37\91\27\114\32\24\159\232\99\244\201\199\168\151\107\0\71\67\190\154\205\19\64\157\115\99\170",
    40263600, 2130188940, 1781294329, 2851531, 2645682, 41718180,
    "1f635dde9db2d1472bd986bb2ccbfab892613cd80bf05faec1781a2edda2afbbdd98c9c9032c51e9c8317b50025539aa3d51a78d82bf9c62dc8d143f3668798163b7129e2f235c25989fb7adb5a69a3b13edec1d76f14dcbb9f3980f3f065941dd53402813d6a11ba2e06a9d486a9ceeeb0d491c3082537ac0a4bf7b5b42b4579587c599485b89b615f5c3bb8d4d794379be4b912bb3d229f3187fe4682ea7d1bb59ca429ba4ecd29d584a292a36dbedb0b88ff7475573968572366c5235a14ecb61facfe49b3f1dd3",
    "\220\159\221\176\13\80\86\178\29\245\90\164\167\95\51\53\21\48\93\183\105\227\13\163",
}

local folder   = "static_content_130525"
local scriptId = "74c74f95fd0-marbeg"
local cached

pcall(function() cached = readfile(folder .. "/init-" .. scriptId .. ".lua") end)

if cached and #cached > 2000 then
    cached = loadstring(cached)
else
    cached = nil
end

if cached then
    return cached()
else
    pcall(makefolder, folder)
    local init = game:HttpGet("https://cdn.luarmor.net/v4_init_marbeg.lua" .. (_ca920af6193 or ""))
    writefile(folder .. "/init-" .. scriptId .. ".lua", init)
    pcall(function()
        for _, v in pairs(listfiles("./" .. folder)) do
            local name = v:match("(init[%w%-]*).lua$")
            if name and name ~= ("init-" .. scriptId) then
                pcall(delfile, folder .. "/" .. name .. ".lua")
            end
        end
    end)
    return loadstring(init)()
end
