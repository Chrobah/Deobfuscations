-- source: github.com/Drop56796/Void-Script  (Void script.lua)
-- [resolved CLEAN] https://raw.githubusercontent.com/iK4oS/backdoor.exe/master/source.lua  (1154 bytes)

local httpService = game:GetService("HttpService");

local invCode = "xJHCqm84cW";
local httpRequest = (syn and syn.request) or http_request or function() end;

local function launchDiscord()
	if not httpRequest then warn("Exploit not supported. No HTTP found.") return end
	
	httpRequest({
		Url = "http://127.0.0.1:6463/rpc?v=1",
		Method = "POST",
	
		Headers = {
			['Content-Type'] = 'application/json',
			Origin = 'https://discord.com'
		},
	
		Body = httpService:JSONEncode({
			cmd = 'INVITE_BROWSER',
			nonce = httpService:GenerateGUID(false),
			args = {code = invCode}
		})
	})
end;

local NotificationBindable = Instance.new("BindableFunction")
NotificationBindable.OnInvoke = launchDiscord

game:GetService("StarterGui"):SetCore(
	"SendNotification",
	{
		Title = "backdoor.exe",
		Duration = 5,
		Text = "Loading lastest version!\n\nJoin our Discord for games, scripts and more",
		Button1 = "Join Discord!",
		Callback = NotificationBindable
	}
)

loadstring(game:HttpGet("https://raw.githubusercontent.com/iK4oS/backdoor.exe/v8/src/main.lua"))();



--	k4scripts
--	.------.
--	|4.--. |
--	| :│/: |
--	| :│\: |
--	| '--'4|
--	`------'


-- (nested) https://raw.githubusercontent.com/iK4oS/backdoor.exe/v8/src/main.lua
-- [resolved CLEAN] https://raw.githubusercontent.com/iK4oS/backdoor.exe/v8/src/main.lua  (15536 bytes)


-- ========================================

-- source: github.com/Drop56796/Void-Script  (Void script.lua)
-- [resolved CLEAN] https://pastebin.com/raw/V5PQy3y0  (181 bytes)

	game:GetService("UserInputService").JumpRequest:connect(function()
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")		
	end)

-- ========================================

-- source: github.com/Drop56796/Void-Script  (Void script.lua)
-- [resolved CLEAN] https://pastebin.com/raw/4LDKiJ5a  (266 bytes)

local Light = game:GetService("Lighting")

function dofullbright()
Light.Ambient = Color3.new(1, 1, 1)
Light.ColorShift_Bottom = Color3.new(1, 1, 1)
Light.ColorShift_Top = Color3.new(1, 1, 1)
end

dofullbright()

Light.LightingChanged:Connect(dofullbright)

-- ========================================

-- source: github.com/Drop56796/Void-Script  (Void script.lua)
-- [resolved MoonSec V3] https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float — deobfuscating target:

-- (remote MoonSec V3 target; constants not extractable here)