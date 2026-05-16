-- might not work!!!

-- Generated using RoadToGlory's Converter v1.1 (RoadToGlory#9879)

-- Instances:

local Converted = {
	["_ScreenGui"] = Instance.new("ScreenGui");
	["_Frame"] = Instance.new("Frame");
	["_UICorner"] = Instance.new("UICorner");
	["_UIStroke"] = Instance.new("UIStroke");
	["_TextBox"] = Instance.new("TextBox");
	["_TextButton"] = Instance.new("TextButton");
	["_LocalScript"] = Instance.new("LocalScript");
	["_UIStroke1"] = Instance.new("UIStroke");
	["_TextLabel"] = Instance.new("TextLabel");
}

-- Properties:

Converted["_ScreenGui"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Converted["_ScreenGui"].Parent = game.Workspace

Converted["_Frame"].BackgroundColor3 = Color3.fromRGB(177.0000046491623, 177.0000046491623, 177.0000046491623)
Converted["_Frame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame"].BorderSizePixel = 0
Converted["_Frame"].Position = UDim2.new(0.243902445, 0, 0.197054148, 0)
Converted["_Frame"].Size = UDim2.new(0, 504, 0, 304)
Converted["_Frame"].Parent = Converted["_ScreenGui"]

Converted["_UICorner"].Parent = Converted["_Frame"]

Converted["_UIStroke"].Thickness = 1.5
Converted["_UIStroke"].Parent = Converted["_Frame"]

Converted["_TextBox"].Font = Enum.Font.SourceSans
Converted["_TextBox"].Text = "-- Put your ahh script in here"
Converted["_TextBox"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextBox"].TextSize = 14
Converted["_TextBox"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_TextBox"].TextYAlignment = Enum.TextYAlignment.Top
Converted["_TextBox"].BackgroundColor3 = Color3.fromRGB(143.00000667572021, 143.00000667572021, 143.00000667572021)
Converted["_TextBox"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextBox"].BorderSizePixel = 0
Converted["_TextBox"].Position = UDim2.new(0.0337301604, 0, 0.0394736826, 0)
Converted["_TextBox"].Size = UDim2.new(0, 385, 0, 242)
Converted["_TextBox"].Parent = Converted["_Frame"]

Converted["_TextButton"].Font = Enum.Font.SourceSans
Converted["_TextButton"].Text = "Execute"
Converted["_TextButton"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextButton"].TextSize = 14
Converted["_TextButton"].BackgroundColor3 = Color3.fromRGB(157.0000058412552, 157.0000058412552, 157.0000058412552)
Converted["_TextButton"].BorderColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextButton"].BorderSizePixel = 0
Converted["_TextButton"].Position = UDim2.new(0.648809552, 0, 0.861842096, 0)
Converted["_TextButton"].Size = UDim2.new(0, 75, 0, 35)
Converted["_TextButton"].Parent = Converted["_Frame"]

Converted["_UIStroke1"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Converted["_UIStroke1"].Thickness = 1.2000000476837158
Converted["_UIStroke1"].Parent = Converted["_TextButton"]

Converted["_TextLabel"].Font = Enum.Font.SourceSans
Converted["_TextLabel"].Text = "Povr SS Executor"
Converted["_TextLabel"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel"].TextSize = 14
Converted["_TextLabel"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextLabel"].BackgroundTransparency = 1
Converted["_TextLabel"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextLabel"].BorderSizePixel = 0
Converted["_TextLabel"].Position = UDim2.new(0.769841254, 0, 0.092105262, 0)
Converted["_TextLabel"].Size = UDim2.new(0, 132, 0, 61)
Converted["_TextLabel"].Parent = Converted["_Frame"]

-- Fake Module Scripts:

local fake_module_scripts = {}


-- Fake Local Scripts:

local function DJXGA_fake_script() -- Fake Script: Workspace.ScreenGui.Frame.TextButton.LocalScript
    local script = Instance.new("LocalScript")
    script.Name = "LocalScript"
    script.Parent = Converted["_TextButton"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

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
end

coroutine.wrap(DJXGA_fake_script)()
