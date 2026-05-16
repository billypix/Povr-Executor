local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remote = ReplicatedStorage:WaitForChild("RemoteEvent")

remote.OnServerEvent:Connect(function(player, testcode)
	print(player.Name .. " executed: " .. testcode)

	-- Replace ALL references to LocalPlayer
	local fixedcode = testcode
		:gsub("game%.Players%.LocalPlayer", "plr")
		:gsub("game:GetService%(\"Players\"%)%.LocalPlayer", "plr")
		:gsub("game:GetService%('Players'%)%.LocalPlayer", "plr")
		:gsub("Players%.LocalPlayer", "plr")
		:gsub("LocalPlayer", "plr")

	local env = {
		plr = player,
		print = print,
		warn = warn,
		game = game,
		workspace = workspace,
		require = require,
		Instance = Instance,
		Vector3 = Vector3,
		CFrame = CFrame,
		Color3 = Color3,
		UDim2 = UDim2,
		Enum = Enum,
		math = math,
		string = string,
		table = table,
		wait = wait,
		task = task
	}

	setmetatable(env, {__index = getfenv()})

	local success, err = pcall(function()
		loadstring(fixedcode, "Executor", env)()
	end)

	if not success then
		warn("Error from " .. player.Name .. ": " .. err)
	end
end)
