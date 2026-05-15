local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remote = ReplicatedStorage:WaitForChild("RemoteEvent")

remote.OnServerEvent:Connect(function(player, testcode)
	print(player.Name .. " sent: " .. testcode)
	
	local success, err = pcall(function()
		loadstring(testcode)()
	end)
	
	if not success then
		print("Error: " .. err)
	end
end)