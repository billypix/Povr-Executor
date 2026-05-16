local button = script.Parent
local frame = button.Parent
local textbox = frame:WaitForChild("TextBox")
local remote = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent")

local UserInputService = game:GetService("UserInputService")
local dragging = false
local dragStart = nil
local startPos = nil

frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

button.MouseButton1Click:Connect(function()
	local testcode = textbox.Text
	remote:FireServer(testcode)
end)
