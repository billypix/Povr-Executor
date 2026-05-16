-- put this in serverscriptservice

local remote = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent")

remote.OnServerEvent:Connect(function(player, testcode)
	print(player.Name .. " sent: " .. testcode)
end)
