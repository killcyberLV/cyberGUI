print("WORK IN PROGRESS")
local player = game.Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")

local time = 3

local guim = Instance.new("ScreenGui")
guim.Parent = gui

local text = Instance.new("TextLabel")
text.Parent = guim
text.Text = "WORK IN PROGRESS"
text.TextColor3 = Color3.new(1, 0, 0)
text.TextStrokeTransparency = 0
text.TextStrokeColor3 = Color3.new(0, 0, 0)
text.TextScaled = true
text.TextWrapped = true
text.Size = UDim2.new(0.2, 0, 0.1, 0)
text.Position = UDim2.new(0.4, 0, 0.4, 0)
text.ZIndex = 1000
text.Font = Enum.Font.GothamBold

while time > 0 do
	time = time - 1
	wait(1)
end

text.Visible = false
