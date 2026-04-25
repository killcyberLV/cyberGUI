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

--Services
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local PhysicsService = game:GetService("PhysicsService")
local Character       = Player.Character or Player.CharacterAdded:Wait()
local Humanoid        = Character:WaitForChild("Humanoid")
local HRP             = Character:WaitForChild("HumanoidRootPart")
local Mouse           = Player:GetMouse()
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MarketplaceService = game:GetService("MarketplaceService")
local StarterGui = game:GetService("StarterGui")
local Debris = game:GetService("Debris")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local player = Player
local PlaceId = game.PlaceId
local JobId = game.JobId




--variables
local noclip = false
local fly = false
local inf_jump = false



--settings
local GUI_WIDHT = 300
local GUI_HEIGHT = 300
local GUI_NAME = "CyberGui"
local GUI_VERSION = "5.0.0"
local GUI_AUTHOR = "BroomLegion"
local GUI_LICENSE = "CyberGui Legion"
local GUI_UPDATE_LOG = "Created the gui from scratch"
local GUI_UPDATE_DATE = "2026-sat-25-apr"
local GUI_UPDATE_AUTHOR = "BroomLegion"
local GUI_UPDATE_LICENSE = "CyberGui Legion"
local DISCORD_SERVER = "https://discord.gg/pKuFnunr2"
local GUI_COLOR = Color3.fromRGB(255, 255, 255)
local GUI_TRANSPARENCY = 0.5
local GUI_POSITION = UDim2.new(0.5, -GUI_WIDHT/2, 0.5, -GUI_HEIGHT/2)
local GUI_CLIP_RECT = Rect.new(0, 0, GUI_WIDHT, GUI_HEIGHT)
local GUI_CLIP_RECT_OFFSET = Vector2.new(0, 0)
local GUI_DRAG = true
local GUI_CORNER = true




-- create gui
local mainGui = Instance.new("ScreenGui")
mainGui.Parent = PlayerGui
mainGui.Name = GUI_NAME

local mainFrame = Instance.new("Frame")
mainFrame.Parent = mainGui
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(GUI_WIDHT/1200, 0, GUI_HEIGHT/600, 0)
mainFrame.Position = UDim2.new(0, 0, 0, 0)
mainFrame.BackgroundColor3 = GUI_COLOR
mainFrame.BackgroundTransparency = GUI_TRANSPARENCY
mainFrame.ClipsDescendants = true

if GUI_CORNER == true then
	local corner = Instance.new("UICorner")
	corner.Parent = mainFrame
	corner.CornerRadius = UDim.new(0, 10)
end

if GUI_DRAG == true then
	local drag = Instance.new("UIDragDetector")
	drag.Parent = mainFrame
end

local GuiVersion = Instance.new("TextLabel")
GuiVersion.Parent = mainFrame
GuiVersion.Name = "GuiVersion"
GuiVersion.Size = UDim2.new(0.2, 0, 0.1, 0)
GuiVersion.Position = UDim2.new(0.8, 0, 0.07, 0)
GuiVersion.BackgroundTransparency = 1
GuiVersion.Text = GUI_VERSION
GuiVersion.TextColor3 = Color3.fromRGB(0, 0, 0)
GuiVersion.TextSize = 14

local GuiAuthor = Instance.new("TextLabel")
GuiAuthor.Parent = mainFrame
GuiAuthor.Name = "GuiAuthor"
GuiAuthor.Size = UDim2.new(0.2, 0, 0.1, 0)
GuiAuthor.Position = UDim2.new(0.7, 0, 0, 0)
GuiAuthor.BackgroundTransparency = 1
GuiAuthor.Text = GUI_AUTHOR
GuiAuthor.TextColor3 = Color3.fromRGB(0, 0, 0)
GuiAuthor.TextSize = 14

local GuiName = Instance.new("TextLabel")
GuiName.Parent = mainFrame
GuiName.Name = "GuiName"
GuiName.Size = UDim2.new(0.2, 0, 0.1, 0)
GuiName.Position = UDim2.new(0.05, 0, 0, 0)
GuiName.BackgroundTransparency = 1
GuiName.Text = GUI_NAME
GuiName.TextColor3 = Color3.fromRGB(0, 0, 0)
GuiName.TextSize = 14

local MainScrollFrame = Instance.new("ScrollingFrame")
MainScrollFrame.Parent = mainFrame
MainScrollFrame.Name = "MainScrollFrame"
MainScrollFrame.Size = UDim2.new(0.9, 0, 0.8, 0)
MainScrollFrame.Position = UDim2.new(0.05, 0, 0.17, 0)
MainScrollFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainScrollFrame.BackgroundTransparency = 0.5
MainScrollFrame.ClipsDescendants = true
MainScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
MainScrollFrame.ScrollBarThickness = 10
MainScrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
MainScrollFrame.BorderSizePixel = 0
MainScrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y

local MainScrollFrameUIListLayout = Instance.new("UIListLayout")
MainScrollFrameUIListLayout.Parent = MainScrollFrame
MainScrollFrameUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
MainScrollFrameUIListLayout.Padding = UDim.new(0, 10)




-- functions
local function tpgui()
	local tpframmain = Instance.new("Frame")
	tpframmain.Parent = mainGui
	tpframmain.Name = "TpGui"
	tpframmain.Size = UDim2.new(0.3, 0, 0.5, 0)
	tpframmain.Position = UDim2.new(0.05, 0, 0.17, 0)
	tpframmain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	tpframmain.BackgroundTransparency = 0.5
	tpframmain.ClipsDescendants = true
	tpframmain.BorderSizePixel = 0
	
	local tpclose = Instance.new("TextButton")
	tpclose.Parent = tpframmain
	tpclose.Name = "Close"
	tpclose.Size = UDim2.new(0.2, 0, 0.1, 0)
	tpclose.Position = UDim2.new(0.9, 0, 0.1, 0)
	tpclose.BackgroundTransparency = 0.5
	tpclose.Text = "Close"
	tpclose.TextColor3 = Color3.fromRGB(0, 0, 0)
	tpclose.TextSize = 14
	tpclose.BorderSizePixel = 0
	tpclose.Font = Enum.Font.SourceSansBold
	tpclose.TextXAlignment = Enum.TextXAlignment.Center
	tpclose.Activated:Connect(function()
		tpframmain:Destroy()
	end)
	
	local tpdrag = Instance.new("UIDragDetector")
	tpdrag.Parent = tpframmain
	
	local tprounded = Instance.new("UICorner")
	tprounded.Parent = tpframmain
	tprounded.CornerRadius = UDim.new(0, 10)
	
	local tpuilist = Instance.new("UIListLayout")
	tpuilist.Parent = tpframmain
	tpuilist.SortOrder = Enum.SortOrder.LayoutOrder
	tpuilist.Padding = UDim.new(0, 10)
	
	local tpup = Instance.new("TextButton")
	tpup.Parent = tpframmain
	tpup.Name = "TpUp"
	tpup.Size = UDim2.new(1, 0, 0.1, 0)
	tpup.Position = UDim2.new(0.05, 0, 0, 0)
	tpup.BackgroundTransparency = 0
	tpup.Text = "Tp Up"
	tpup.TextColor3 = Color3.fromRGB(0, 0, 0)
	tpup.TextSize = 14
	tpup.Font = Enum.Font.SourceSansBold
	tpup.TextXAlignment = Enum.TextXAlignment.Center
	tpup.AutoButtonColor = true
	tpup.BorderSizePixel = 0
	tpup.Activated:Connect(function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
	end)
	
	local tpdown = Instance.new("TextButton")
	tpdown.Parent = tpframmain
	tpdown.Name = "TpDown"
	tpdown.Size = UDim2.new(1, 0, 0.1, 0)
	tpdown.Position = UDim2.new(0.05, 0, 0.1, 0)
	tpdown.BackgroundTransparency = 0
	tpdown.Text = "Tp Down"
	tpdown.TextColor3 = Color3.fromRGB(0, 0, 0)
	tpdown.TextSize = 14
	tpdown.Font = Enum.Font.SourceSansBold
	tpdown.TextXAlignment = Enum.TextXAlignment.Center
	tpdown.AutoButtonColor = true
	tpdown.BorderSizePixel = 0
	tpdown.Activated:Connect(function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -10, 0)
	end)
	
	local tpforward = Instance.new("TextButton")
	tpforward.Parent = tpframmain
	tpforward.Name = "TpForward"
	tpforward.Size = UDim2.new(1, 0, 0.1, 0)
	tpforward.Position = UDim2.new(0.05, 0, 0.2, 0)
	tpforward.BackgroundTransparency = 0
	tpforward.Text = "Tp Forward"
	tpforward.TextColor3 = Color3.fromRGB(0, 0, 0)
	tpforward.TextSize = 14
	tpforward.Font = Enum.Font.SourceSansBold
	tpforward.TextXAlignment = Enum.TextXAlignment.Center
	tpforward.AutoButtonColor = true
	tpforward.BorderSizePixel = 0
	tpforward.Activated:Connect(function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -10)
	end)
	
	local tpbackward = Instance.new("TextButton")
	tpbackward.Parent = tpframmain
	tpbackward.Name = "TpBackward"
	tpbackward.Size = UDim2.new(1, 0, 0.1, 0)
	tpbackward.Position = UDim2.new(0.05, 0, 0.3, 0)
	tpbackward.BackgroundTransparency = 0
	tpbackward.Text = "Tp Backward"
	tpbackward.TextColor3 = Color3.fromRGB(0, 0, 0)
	tpbackward.TextSize = 14
	tpbackward.Font = Enum.Font.SourceSansBold
	tpbackward.TextXAlignment = Enum.TextXAlignment.Center
	tpbackward.AutoButtonColor = true
	tpbackward.BorderSizePixel = 0
	tpbackward.Activated:Connect(function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 10)
	end)
	
	local tpleft = Instance.new("TextButton")
	tpleft.Parent = tpframmain
	tpleft.Name = "TpLeft"
	tpleft.Size = UDim2.new(1, 0, 0.1, 0)
	tpleft.Position = UDim2.new(0.05, 0, 0.4, 0)
	tpleft.BackgroundTransparency = 0
	tpleft.Text = "Tp Left"
	tpleft.TextColor3 = Color3.fromRGB(0, 0, 0)
	tpleft.TextSize = 14
	tpleft.Font = Enum.Font.SourceSansBold
	tpleft.TextXAlignment = Enum.TextXAlignment.Center
	tpleft.AutoButtonColor = true
	tpleft.BorderSizePixel = 0
	tpleft.Activated:Connect(function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(-10, 0, 0)
	end)
	
	local tpright = Instance.new("TextButton")
	tpright.Parent = tpframmain
	tpright.Name = "TpRight"
	tpright.Size = UDim2.new(1, 0, 0.1, 0)
	tpright.Position = UDim2.new(0.55, 0, 0.4, 0)
	tpright.BackgroundTransparency = 0
	tpright.Text = "Tp Right"
	tpright.TextColor3 = Color3.fromRGB(0, 0, 0)
	tpright.TextSize = 14
	tpright.Font = Enum.Font.SourceSansBold
	tpright.TextXAlignment = Enum.TextXAlignment.Center
	tpright.AutoButtonColor = true
	tpright.BorderSizePixel = 0
	tpright.Activated:Connect(function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(10, 0, 0)
	end)
end



-- create buttons
local testButton = Instance.new("TextButton")
testButton.Parent = MainScrollFrame
testButton.Name = "TestButton"
testButton.Size = UDim2.new(1, 0, 0.1, 0)
testButton.Position = UDim2.new(0.05, 0, 0, 0)
testButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
testButton.BackgroundTransparency = 0
testButton.Text = "Test Button"
testButton.TextColor3 = Color3.fromRGB(0, 0, 0)
testButton.TextSize = 14
testButton.Font = Enum.Font.SourceSansBold
testButton.TextXAlignment = Enum.TextXAlignment.Center
testButton.TextYAlignment = Enum.TextYAlignment.Center
testButton.AutoButtonColor = true
testButton.BorderSizePixel = 0
testButton.LayoutOrder = 1
testButton.Activated:Connect(function()
	print("Test Button Clicked")
end)

local bnoclip = Instance.new("TextButton")
bnoclip.Parent = MainScrollFrame
bnoclip.Name = "Noclip"
bnoclip.Size = UDim2.new(1, 0, 0.1, 0)
bnoclip.Position = UDim2.new(0.05, 0, 0, 0)
bnoclip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bnoclip.BackgroundTransparency = 0
bnoclip.Text = "Noclip"
bnoclip.TextColor3 = Color3.fromRGB(0, 0, 0)
bnoclip.TextSize = 14
bnoclip.Font = Enum.Font.SourceSansBold
bnoclip.TextXAlignment = Enum.TextXAlignment.Center
bnoclip.TextYAlignment = Enum.TextYAlignment.Center
bnoclip.AutoButtonColor = true
bnoclip.BorderSizePixel = 0
bnoclip.LayoutOrder = 2
bnoclip.Activated:Connect(function()
	if noclip == true then
		noclip = false
		bnoclip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		print("Noclip")
	else
		noclip = true
		bnoclip.BackgroundColor3 = Color3.fromRGB(209, 206, 255)
		print("Noclip")
	end
end)

local tpguib = Instance.new("TextButton")
tpguib.Parent = MainScrollFrame
tpguib.Name = "TpGui"
tpguib.Size = UDim2.new(1, 0, 0.1, 0)
tpguib.Position = UDim2.new(0.05, 0, 0, 0)
tpguib.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
tpguib.BackgroundTransparency = 0
tpguib.Text = "Tp Gui"
tpguib.TextColor3 = Color3.fromRGB(0, 0, 0)
tpguib.TextSize = 14
tpguib.Font = Enum.Font.SourceSansBold
tpguib.TextXAlignment = Enum.TextXAlignment.Center
tpguib.TextYAlignment = Enum.TextYAlignment.Center
tpguib.AutoButtonColor = true
tpguib.BorderSizePixel = 0
tpguib.LayoutOrder = 3
tpguib.Activated:Connect(function()
	tpgui()
end)



-- loops
game:GetService("RunService").RenderStepped:Connect(function()
	game:GetService("RunService").Stepped:Connect(function()
		if noclip == true then
			local char = player.Character
			if char then
				for _, part in pairs(char:GetDescendants()) do
					if part:IsA("BasePart") then
						part.CanCollide = false
					end
				end
			end
		else
			local char = player.Character
			if char then
				for _, part in pairs(char:GetDescendants()) do
					if part:IsA("BasePart") then
						part.CanCollide = true
					end
				end
			end
		end
	end)
end)
