--[[ ===========================================================================
  DEOBFUSCATION / RECONSTRUCTION  —  STAGE 2 of 2  (the payload the loader runs)
  ---------------------------------------------------------------------------
  Source  : https://raw.githubusercontent.com/Nozrakk/sszz/refs/heads/main/zz
            (downloaded + run by loadergag.txt via game:HttpGetAsync + loadstring)
  Obfusc. : same "wearedevs.net/obfuscator" VM engine (string table `z`, 246
            constants, 167 encrypted blobs, control-flow flattened, dispatch var `p`).

  WHAT IT IS:  a client-side **"Seed Spawner" / PetSpawnerGUI** cheat for the
  Roblox game "Grow a Garden".  It draws a draggable GUI, lets you type a seed
  name + amount, clones the matching model out of ReplicatedStorage.Seed_Models
  and places it in the world at the point your mouse is aiming at (camera ray ->
  workspace raycast).  It also creates/【updates Tool stacks in your Backpack.

  IMPORTANT: stage 2 contains NO HttpGet / loadstring / setclipboard / webhook /
  Discord — it does not download anything further and does not exfiltrate data.
  It is a game cheat, not a stealer.  (The monetisation / link-shortener and the
  key gate live entirely in stage 1, loadergag.txt.)

  Cipher for its embedded strings (reconstructed; verified):
      45-bit LCG  state = (state*125 + 8034868842141) mod 2^45
      companion   m     = (m*27) mod 257
      keystream   = ror32( floor(state / 2^(13-floor(m/32))) mod 2^32 , m mod 32 ), big-endian
      plaintext[i]= (cipher[i] + keystream[i] + carry) mod 256 ; carry0 = 18

  Below is a faithful *behavioural* reconstruction (the 60 KB / ~200-state VM was
  not expanded line-by-line; the logic is recovered from the de-virtualised
  control flow plus every decrypted string — the full inventory is at the end).
=========================================================================== ]]

local Players           = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService  = game:GetService("UserInputService")
local Workspace         = workspace

local LocalPlayer = Players.LocalPlayer
local Camera      = Workspace.CurrentCamera
local SeedModels  = ReplicatedStorage:WaitForChild("Seed_Models")

--==========================================================================
-- 1. GUI  (a draggable "Seed Spawner" window)
--==========================================================================
local gui = Instance.new("ScreenGui")
gui.Name         = "PetSpawnerGUI"
gui.ResetOnSpawn = false
gui.Parent       = LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")            -- draggable container
frame.Active = true
frame.Draggable = true                          -- (legacy draggable; the script
frame.Parent = gui                              --  also wires InputBegan drag math)
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel")
title.Text = "Seed Spawner"
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Parent = frame

local box = Instance.new("TextBox")             -- e.g. type "Carrot Seed x25"
box.PlaceholderText = "Seed x1"                  -- parsed with "x(%d+)" / "Seed x%d+$"
box.Font = Enum.Font.Gotham
box.Parent = frame

local spawnBtn = Instance.new("TextButton")
spawnBtn.Text = "Spawn"
spawnBtn.Parent = frame
Instance.new("UICorner", spawnBtn).CornerRadius = UDim.new(0, 6)

-- manual drag (InputBegan + UserInputType.MouseButton1, tracking mouse delta)
-- ... standard Rayfield-style drag handler ...

--==========================================================================
-- 2. Helpers
--==========================================================================

-- Where is the player's mouse pointing in the 3-D world?
local function mouseWorldPosition()
    local mp  = UserInputService:GetMouseLocation()
    local ray = Camera:ViewportPointToRay(mp.X, mp.Y)
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Blacklist
    params.FilterDescendantsInstances = { LocalPlayer.Character }
    local hit = Workspace:Raycast(ray.Origin, ray.Direction * 1000, params)
    return hit and hit.Position or (ray.Origin + ray.Direction * 50)
end

-- "Carrot Seed x25" -> name="Carrot Seed", amount=25
local function parseSeedRequest(text)
    text = text:gsub("^%s*(.-)%s*$", "%1")        -- trim
    local amount = tonumber(text:match("x(%d+)")) or 1
    local name   = text:gsub("%s*x%d+$", "")       -- strip the trailing "xNN"
    return name, amount
end

--==========================================================================
-- 3. Spawn logic
--==========================================================================
local function spawnSeed(name, amount)
    local model = SeedModels:FindFirstChild(name)
    if not model then
        print("Seed not found or not a valid part:", name)   -- decrypted string
        return
    end

    print("Spawning", amount)                                 -- "Spawning 1"
    for i = 1, amount do
        local clone = model:Clone()
        local pos   = mouseWorldPosition()

        -- drop the clone in the world at the mouse position
        for _, d in ipairs(clone:GetChildren()) do
            if d:IsA("BasePart") then
                d.Anchored    = false
                d.CanCollide  = true
                -- (Material set to Plastic / SmoothPlastic, Transparency tweaked,
                --  CylinderMesh Scale adjusted, BackgroundColor3 fromRGB, etc.)
            end
        end
        clone.Parent = Workspace
        -- if the clone is a Tool it is moved into the Backpack instead:
        --   clone.RequiresHandle = false ; clone.Parent = LocalPlayer.Backpack
        --   print("New Tool created:", clone.Name)
        --   print("Updated Tool amount:", <stack count>)
    end
end

spawnBtn.MouseButton1Click:Connect(function()
    local name, amount = parseSeedRequest(box.Text)
    spawnSeed(name, amount)
end)

--==========================================================================
-- 4. Anti-tamper  (same scheme as stage 1: error("Tamper Detected!") if hooked)
--==========================================================================


--[[ =========================================================================
  FULL DECRYPTED STRING INVENTORY (the meaningful 68 of 167 encrypted blobs;
  the rest are random decoy ciphertext padding the constant table).

  Services / objects:
    Players, LocalPlayer, Character, Backpack, PlayerGui, ReplicatedStorage,
    UserInputService, CurrentCamera, Seed_Models
  Instances / classes:
    ScreenGui, Frame, TextBox, TextButton, TextLabel, UICorner, LocalScript,
    BasePart, Part, CylinderMesh, Instance
  Properties:
    Name, Parent, Position, Size, Text, TextColor3, TextSize, BackgroundColor3,
    BackgroundTransparency, PlaceholderText, CornerRadius, Color, Transparency,
    Material, Anchored, CanCollide, Active, Draggable, ResetOnSpawn, Scale,
    Source, RequiresHandle, Origin, Direction
  Enums / values:
    Plastic, SmoothPlastic, Gotham, GothamBold, fromRGB, Blacklist,
    FilterType, FilterDescendantsInstances, RaycastFilterType
  Input:
    InputBegan, MouseButton1, MouseButton1Click, UserInputType
  Naming / messages:
    "PetSpawnerGUI", "Seed Spawner", "Seed_Models", "Spawn", "Spawning 1",
    "Seed not found or not a valid part:", "New Tool created:",
    "Updated Tool amount:", "Seed x", "Seed x%d+$", "Seed x1", "x(%d+)",
    "^%s*(.-)%s*$"
========================================================================= ]]
