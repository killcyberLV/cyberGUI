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
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer
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
local cam = workspace.CurrentCamera




--variables
local noclip = false
local fly = false
local inf_jump = false
local esp = false
local godmode = false




--settings
local GUI_WIDHT = 300
local GUI_HEIGHT = 300
local GUI_NAME = "CyberGui"
local GUI_VERSION = "1.6.1"
local GUI_AUTHOR = "BroomLegion"
local GUI_LICENSE = "CyberGui Legion"
local GUI_UPDATE_LOG = "Added a lot"
local GUI_UPDATE_DATE = "2026-mon-27-apr"
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

function controlgui()
	local cdragframe = Instance.new("Frame")
	cdragframe.Parent = mainGui
	cdragframe.Name = "CdragFrame"
	cdragframe.Size = UDim2.new(0.2, 0, 0.3, 0)
	cdragframe.BackgroundTransparency = 1
	
	local cdrag = Instance.new("UIDragDetector")
	cdrag.Parent = cdragframe
	
	local controlframmain = Instance.new("ScrollingFrame")
	controlframmain.Parent = cdragframe
	controlframmain.Name = "ControlFrame"
	controlframmain.Size = UDim2.new(1, 0, 1, 0)
	controlframmain.Position = UDim2.new(0, 0, 0.1, 0)
	controlframmain.BackgroundTransparency = 0.5
	controlframmain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	controlframmain.BorderSizePixel = 0
	controlframmain.ScrollBarThickness = 10
	controlframmain.CanvasSize = UDim2.new(0, 0, 1, 0)
	controlframmain.ScrollingDirection = Enum.ScrollingDirection.Y
	controlframmain.Active = true
	
	local cround = Instance.new("UICorner")
	cround.Parent = controlframmain
	cround.CornerRadius = UDim.new(0, 10)
	
	local cuilist = Instance.new("UIListLayout")
	cuilist.Parent = controlframmain
	cuilist.SortOrder = Enum.SortOrder.LayoutOrder
	cuilist.Padding = UDim.new(0, 5)
	cuilist.VerticalAlignment = Enum.VerticalAlignment.Top
	cuilist.HorizontalAlignment = Enum.HorizontalAlignment.Left
	
	local cclose = Instance.new("TextButton")
	cclose.Parent = controlframmain
	cclose.Name = "Close"
	cclose.Size = UDim2.new(0.2, 0, 0.1, 0)
	cclose.Position = UDim2.new(0.1, 0.1, 0, 0)
	cclose.Text = "close"
	cclose.TextColor3 = Color3.fromRGB(0, 0, 0)
	cclose.Font = Enum.Font.SourceSansBold
	cclose.BorderSizePixel = 0
	cclose.TextSize = 14
	cclose.Activated:Connect(function()
		controlframmain:Destroy()
	end)
	
	local cplayerspeedp10 = Instance.new("TextButton")
	cplayerspeedp10.Parent = controlframmain
	cplayerspeedp10.Name = "PlayerSpeedP10"
	cplayerspeedp10.Size = UDim2.new(1, 0, 0.1, 0)
	cplayerspeedp10.Position = UDim2.new(0.1, 0, 0.1, 0)
	cplayerspeedp10.BackgroundTransparency = 0
	cplayerspeedp10.Text = "Player Speed +10"
	cplayerspeedp10.TextColor3 = Color3.fromRGB(0, 0, 0)
	cplayerspeedp10.TextSize = 14
	cplayerspeedp10.Font = Enum.Font.SourceSansBold
	cplayerspeedp10.AutoButtonColor = true
	cplayerspeedp10.BorderSizePixel = 0
	cplayerspeedp10.Activated:Connect(function()
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed + 10
	end)
	
	local cplayerspeedm10 = Instance.new("TextButton")
	cplayerspeedm10.Parent = controlframmain
	cplayerspeedm10.Name = "PlayerSpeedM10"
	cplayerspeedm10.Size = UDim2.new(1, 0, 0.1, 0)
	cplayerspeedm10.Position = UDim2.new(0.3, 0, 0.1, 0)
	cplayerspeedm10.BackgroundTransparency = 0
	cplayerspeedm10.Text = "Player Speed -10"
	cplayerspeedm10.TextColor3 = Color3.fromRGB(0, 0, 0)
	cplayerspeedm10.TextSize = 14
	cplayerspeedm10.Font = Enum.Font.SourceSansBold
	cplayerspeedm10.AutoButtonColor = true
	cplayerspeedm10.BorderSizePixel = 0
	cplayerspeedm10.Activated:Connect(function()
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed - 10
	end)
	
	local cplayerspeedp100 = Instance.new("TextButton")
	cplayerspeedp100.Parent = controlframmain
	cplayerspeedp100.Name = "PlayerSpeedP100"
	cplayerspeedp100.Size = UDim2.new(1, 0, 0.1, 0)
	cplayerspeedp100.Position = UDim2.new(0.5, 0, 0.1, 0)
	cplayerspeedp100.BackgroundTransparency = 0
	cplayerspeedp100.Text = "Player Speed +100"
	cplayerspeedp100.TextColor3 = Color3.fromRGB(0, 0, 0)
	cplayerspeedp100.TextSize = 14
	cplayerspeedp100.Font = Enum.Font.SourceSansBold
	cplayerspeedp100.AutoButtonColor = true
	cplayerspeedp100.BorderSizePixel = 0
	cplayerspeedp100.Activated:Connect(function()
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed + 100
	end)
	
	local cplayerspeedm100 = Instance.new("TextButton")
	cplayerspeedm100.Parent = controlframmain
	cplayerspeedm100.Name = "PlayerSpeedM100"
	cplayerspeedm100.Size = UDim2.new(1, 0, 0.1, 0)
	cplayerspeedm100.Position = UDim2.new(0.7, 0, 0.1, 0)
	cplayerspeedm100.BackgroundTransparency = 0
	cplayerspeedm100.Text = "Player Speed -100"
	cplayerspeedm100.TextColor3 = Color3.fromRGB(0, 0, 0)
	cplayerspeedm100.TextSize = 14
	cplayerspeedm100.Font = Enum.Font.SourceSansBold
	cplayerspeedm100.AutoButtonColor = true
	cplayerspeedm100.BorderSizePixel = 0
	cplayerspeedm100.Activated:Connect(function()
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed - 100
	end)
	
	local cplayerspeeds16 = Instance.new("TextButton")
	cplayerspeeds16.Parent = controlframmain
	cplayerspeeds16.Name = "PlayerSpeedS16"
	cplayerspeeds16.Size = UDim2.new(1, 0, 0.1, 0)
	cplayerspeeds16.Position = UDim2.new(0.1, 0, 0.2, 0)
	cplayerspeeds16.BackgroundTransparency = 0
	cplayerspeeds16.Text = "Player Speed =16"
	cplayerspeeds16.TextColor3 = Color3.fromRGB(0, 0, 0)
	cplayerspeeds16.TextSize = 14
	cplayerspeeds16.Font = Enum.Font.SourceSansBold
	cplayerspeeds16.AutoButtonColor = true
	cplayerspeeds16.BorderSizePixel = 0
	cplayerspeeds16.Activated:Connect(function()
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
	end)
	
	local cplayerspeeds30 = Instance.new("TextButton")
	cplayerspeeds30.Parent = controlframmain
	cplayerspeeds30.Name = "PlayerSpeedS30"
	cplayerspeeds30.Size = UDim2.new(1, 0, 0.1, 0)
	cplayerspeeds30.Position = UDim2.new(0.3, 0, 0.2, 0)
	cplayerspeeds30.BackgroundTransparency = 0
	cplayerspeeds30.Text = "Player Speed =30"
	cplayerspeeds30.TextColor3 = Color3.fromRGB(0, 0, 0)
	cplayerspeeds30.TextSize = 14
	cplayerspeeds30.Font = Enum.Font.SourceSansBold
	cplayerspeeds30.AutoButtonColor = true
	cplayerspeeds30.BorderSizePixel = 0
	cplayerspeeds30.Activated:Connect(function()
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
	end)
	
	local cplayerjumpp10 = Instance.new("TextButton")
	cplayerjumpp10.Parent = controlframmain
	cplayerjumpp10.Name = "PlayerJumpP10"
	cplayerjumpp10.Size = UDim2.new(1, 0, 0.1, 0)
	cplayerjumpp10.Position = UDim2.new(0.5, 0, 0.2, 0)
	cplayerjumpp10.BackgroundTransparency = 0
	cplayerjumpp10.Text = "Player Jump +10"
	cplayerjumpp10.TextColor3 = Color3.fromRGB(0, 0, 0)
	cplayerjumpp10.TextSize = 14
	cplayerjumpp10.Font = Enum.Font.SourceSansBold
	cplayerjumpp10.AutoButtonColor = true
	cplayerjumpp10.BorderSizePixel = 0
	cplayerjumpp10.Activated:Connect(function()
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = game.Players.LocalPlayer.Character.Humanoid.JumpPower + 10
	end)
	
	local cplayerjumpm10 = Instance.new("TextButton")
	cplayerjumpm10.Parent = controlframmain
	cplayerjumpm10.Name = "PlayerJumpM10"
	cplayerjumpm10.Size = UDim2.new(1, 0, 0.1, 0)
	cplayerjumpm10.Position = UDim2.new(0.7, 0, 0.2, 0)
	cplayerjumpm10.BackgroundTransparency = 0
	cplayerjumpm10.Text = "Player Jump -10"
	cplayerjumpm10.TextColor3 = Color3.fromRGB(0, 0, 0)
	cplayerjumpm10.TextSize = 14
	cplayerjumpm10.Font = Enum.Font.SourceSansBold
	cplayerjumpm10.AutoButtonColor = true
	cplayerjumpm10.BorderSizePixel = 0
	cplayerjumpm10.Activated:Connect(function()
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = game.Players.LocalPlayer.Character.Humanoid.JumpPower - 10
	end)
end




-- create buttons

local bDiscord = Instance.new("TextButton")
bDiscord.Parent = MainScrollFrame
bDiscord.Name = "GetDiscordLink"
bDiscord.Size = UDim2.new(1, 0, 0.1, 0)
bDiscord.Position = UDim2.new(0.05, 0, 0.1, 0)
bDiscord.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
bDiscord.BackgroundTransparency = 0
bDiscord.Text = "Get Discord Link"
bDiscord.TextColor3 = Color3.fromRGB(0, 0, 0)
bDiscord.TextSize = 14
bDiscord.Font = Enum.Font.SourceSansBold
bDiscord.TextXAlignment = Enum.TextXAlignment.Center
bDiscord.TextYAlignment = Enum.TextYAlignment.Center
bDiscord.AutoButtonColor = true
bDiscord.BorderSizePixel = 0
bDiscord.LayoutOrder = -1
bDiscord.Activated:Connect(function()
	bDiscord.Text = "Discord Link Is ::: ".. DISCORD_SERVER
	wait(3)
	bDiscord.Text = "Copy Discord Link"
end)


local tInfoGeneral = Instance.new("TextLabel")
tInfoGeneral.Parent = MainScrollFrame
tInfoGeneral.Name = "InfoGeneral"
tInfoGeneral.Size = UDim2.new(1, 0, 0.1, 0)
tInfoGeneral.Position = UDim2.new(0.05, 0, 0, 0)
tInfoGeneral.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
tInfoGeneral.BackgroundTransparency = 0.5
tInfoGeneral.Text = "--- General ---"
tInfoGeneral.TextColor3 = Color3.fromRGB(255, 255, 255)
tInfoGeneral.TextSize = 14
tInfoGeneral.Font = Enum.Font.SourceSansBold
tInfoGeneral.TextXAlignment = Enum.TextXAlignment.Center
tInfoGeneral.TextYAlignment = Enum.TextYAlignment.Center
tInfoGeneral.BorderSizePixel = 0
tInfoGeneral.LayoutOrder = 0

local bclose = Instance.new("TextButton")
bclose.Parent = MainScrollFrame
bclose.Name = "Noclip"
bclose.Size = UDim2.new(1, 0, 0.1, 0)
bclose.Position = UDim2.new(0.05, 0, 0, 0)
bclose.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bclose.BackgroundTransparency = 0
bclose.Text = "Noclip"
bclose.TextColor3 = Color3.fromRGB(0, 0, 0)
bclose.TextSize = 14
bclose.Font = Enum.Font.SourceSansBold
bclose.TextXAlignment = Enum.TextXAlignment.Center
bclose.TextYAlignment = Enum.TextYAlignment.Center
bclose.AutoButtonColor = true
bclose.BorderSizePixel = 0
bclose.LayoutOrder = 1
bclose.Activated:Connect(function()
	mainGui:Destoy()
end
		
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
bnoclip.LayoutOrder = 1
bnoclip.Activated:Connect(function()
	if noclip == true then
		noclip = false
		bnoclip.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	else
		noclip = true
		bnoclip.BackgroundColor3 = Color3.fromRGB(200, 200, 255)
	end
end)

local bFly = Instance.new("TextButton")
bFly.Parent = MainScrollFrame
bFly.Name = "Fly"
bFly.Size = UDim2.new(1, 0, 0.1, 0)
bFly.Position = UDim2.new(0.05, 0, 0, 0)
bFly.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bFly.BackgroundTransparency = 0
bFly.Text = "Fly"
bFly.TextColor3 = Color3.fromRGB(0, 0, 0)
bFly.TextSize = 14
bFly.Font = Enum.Font.SourceSansBold
bFly.TextXAlignment = Enum.TextXAlignment.Center
bFly.TextYAlignment = Enum.TextYAlignment.Center
bFly.AutoButtonColor = true
bFly.BorderSizePixel = 0
bFly.LayoutOrder = 1
bFly.Activated:Connect(function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Fly.lua"))()
end)

local bCyberExplorer = Instance.new("TextButton")
bCyberExplorer.Parent = MainScrollFrame
bCyberExplorer.Name = "CyberExplorer"
bCyberExplorer.Size = UDim2.new(1, 0, 0.1, 0)
bCyberExplorer.Position = UDim2.new(1, 0, 0, 0)
bCyberExplorer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bCyberExplorer.BackgroundTransparency = 0
bCyberExplorer.Text = "CyberExplorer"
bCyberExplorer.TextColor3 = Color3.fromRGB(0, 0, 0)
bCyberExplorer.TextSize = 14
bCyberExplorer.Font = Enum.Font.SourceSansBold
bCyberExplorer.TextXAlignment = Enum.TextXAlignment.Center
bCyberExplorer.TextYAlignment = Enum.TextYAlignment.Center
bCyberExplorer.AutoButtonColor = true
bCyberExplorer.BorderSizePixel = 0
bCyberExplorer.LayoutOrder = 1
bCyberExplorer.Activated:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/killcyberLV/cyberGUI/main/CyberExplorer.lua"))
end)

local bEsp = Instance.new("TextButton")
bEsp.Parent = MainScrollFrame
bEsp.Name = "Esp"
bEsp.Size = UDim2.new(1, 0, 0.1, 0)
bEsp.Position = UDim2.new(0.05, 0, 0, 0)
bEsp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bEsp.BackgroundTransparency = 0
bEsp.Text = "ESP"
bEsp.TextColor3 = Color3.fromRGB(0, 0, 0)
bEsp.TextSize = 14
bEsp.Font = Enum.Font.SourceSansBold
bEsp.TextXAlignment = Enum.TextXAlignment.Center
bEsp.TextYAlignment = Enum.TextYAlignment.Center
bEsp.AutoButtonColor = true
bEsp.BorderSizePixel = 0
bEsp.LayoutOrder = 1
bEsp.Activated:Connect(function()
	if esp == false then
		esp = true
		bEsp.BackgroundColor3 = Color3.fromRGB(200, 200, 255)
	else
		esp = false
		bEsp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	end
end)

local bAimbot = Instance.new("TextButton")
bAimbot.Parent = MainScrollFrame
bAimbot.Name = "Aimbot"
bAimbot.Size = UDim2.new(1, 0, 0.1, 0)
bAimbot.Position = UDim2.new(0.05, 0, 0, 0)
bAimbot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bAimbot.BackgroundTransparency = 0
bAimbot.Text = "Aimbot"
bAimbot.TextColor3 = Color3.fromRGB(0, 0, 0)
bAimbot.TextSize = 14
bAimbot.Font = Enum.Font.SourceSansBold
bAimbot.TextXAlignment = Enum.TextXAlignment.Center
bAimbot.TextYAlignment = Enum.TextYAlignment.Center
bAimbot.AutoButtonColor = true
bAimbot.BorderSizePixel = 0
bAimbot.LayoutOrder = 1
bAimbot.Activated:Connect(function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/s/610067c537cd63b05ca78e6c.lua"))()
end)

local bGodMode = Instance.new("TextButton")
bGodMode.Parent = MainScrollFrame
bGodMode.Name = "GodMode"
bGodMode.Size = UDim2.new(1, 0, 0.1, 0)
bGodMode.Position = UDim2.new(0.05, 0, 0, 0)
bGodMode.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bGodMode.BackgroundTransparency = 0
bGodMode.Text = "God Mode"
bGodMode.TextColor3 = Color3.fromRGB(0, 0, 0)
bGodMode.TextSize = 14
bGodMode.Font = Enum.Font.SourceSansBold
bGodMode.TextXAlignment = Enum.TextXAlignment.Center
bGodMode.TextYAlignment = Enum.TextYAlignment.Center
bGodMode.AutoButtonColor = true
bGodMode.BorderSizePixel = 0
bGodMode.LayoutOrder = 1
bGodMode.Activated:Connect(function()
	if godmode == false then
		godmode = true
		bGodMode.BackgroundColor3 = Color3.fromRGB(200, 200, 255)
	else
		godmode = false
		bGodMode.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	end
end)

local bInfJump = Instance.new("TextButton")
bInfJump.Parent = MainScrollFrame
bInfJump.Name = "Fly"
bInfJump.Size = UDim2.new(1, 0, 0.1, 0)
bInfJump.Position = UDim2.new(0.05, 0, 0, 0)
bInfJump.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bInfJump.BackgroundTransparency = 0
bInfJump.Text = "Infinite Jump"
bInfJump.TextColor3 = Color3.fromRGB(0, 0, 0)
bInfJump.TextSize = 14
bInfJump.Font = Enum.Font.SourceSansBold
bInfJump.TextXAlignment = Enum.TextXAlignment.Center
bInfJump.TextYAlignment = Enum.TextYAlignment.Center
bInfJump.AutoButtonColor = true
bInfJump.BorderSizePixel = 0
bInfJump.LayoutOrder = 1
bInfJump.Activated:Connect(function()
	if inf_jump == false then
		inf_jump = true
		bInfJump.BackgroundColor3 = Color3.fromRGB(200, 200, 255)
	else
		inf_jump = false
		bInfJump.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	end
end)

local bFling = Instance.new("TextButton")
bFling.Parent = MainScrollFrame
bFling.Name = "Fling"
bFling.Size = UDim2.new(1, 0, 0.1, 0)
bFling.Position = UDim2.new(0.05, 0, 0, 0)
bFling.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bFling.BackgroundTransparency = 0
bFling.Text = "Fling"
bFling.TextColor3 = Color3.fromRGB(0, 0, 0)
bFling.TextSize = 14
bFling.Font = Enum.Font.SourceSansBold
bFling.TextXAlignment = Enum.TextXAlignment.Center
bFling.TextYAlignment = Enum.TextYAlignment.Center
bFling.AutoButtonColor = true
bFling.BorderSizePixel = 0
bFling.LayoutOrder = 1
bFling.Activated:Connect(function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/s/6974384c0385f7a2505370a4.lua"))()
end)

local bDexExplorer = Instance.new("TextButton")
bDexExplorer.Parent = MainScrollFrame
bDexExplorer.Name = "DexExplorer"
bDexExplorer.Size = UDim2.new(1, 0, 0.1, 0)
bDexExplorer.Position = UDim2.new(0.05, 0, 0, 0)
bDexExplorer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bDexExplorer.BackgroundTransparency = 0
bDexExplorer.Text = "Open Dex Explorer"
bDexExplorer.TextColor3 = Color3.fromRGB(0, 0, 0)
bDexExplorer.TextSize = 14
bDexExplorer.Font = Enum.Font.SourceSansBold
bDexExplorer.TextXAlignment = Enum.TextXAlignment.Center
bDexExplorer.TextYAlignment = Enum.TextYAlignment.Center
bDexExplorer.AutoButtonColor = true
bDexExplorer.BorderSizePixel = 0
bDexExplorer.LayoutOrder = 1
bDexExplorer.Activated:Connect(function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Dex%20Explorer.lua"))()
end)

local tInfoorGames = Instance.new("TextLabel")
tInfoorGames.Parent = MainScrollFrame
tInfoorGames.Name = "InfoGeneral"
tInfoorGames.Size = UDim2.new(1, 0, 0.1, 0)
tInfoorGames.Position = UDim2.new(0.05, 0, 0, 0)
tInfoorGames.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
tInfoorGames.BackgroundTransparency = 0.5
tInfoorGames.Text = "--- Specifique Games Scripte ---"
tInfoorGames.TextColor3 = Color3.fromRGB(255, 255, 255)
tInfoorGames.TextSize = 14
tInfoorGames.Font = Enum.Font.SourceSansBold
tInfoorGames.TextXAlignment = Enum.TextXAlignment.Center
tInfoorGames.TextYAlignment = Enum.TextYAlignment.Center
tInfoorGames.BorderSizePixel = 0
tInfoorGames.LayoutOrder = 1.5

local b99Night = Instance.new("TextButton")
b99Night.Parent = MainScrollFrame
b99Night.Name = "99Night"
b99Night.Size = UDim2.new(1, 0, 0.1, 0)
b99Night.Position = UDim2.new(0.05, 0, 0, 0)
b99Night.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
b99Night.BackgroundTransparency = 0
b99Night.Text = "99 Night"
b99Night.TextColor3 = Color3.fromRGB(0, 0, 0)
b99Night.TextSize = 14
b99Night.Font = Enum.Font.SourceSansBold
b99Night.TextXAlignment = Enum.TextXAlignment.Center
b99Night.TextYAlignment = Enum.TextYAlignment.Center
b99Night.AutoButtonColor = true
b99Night.BorderSizePixel = 0
b99Night.LayoutOrder = 1.5
b99Night.Activated:Connect(function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/203720/scripts/99%20nights%20in%20a%20forest%20voidware.lua"))()
end)

local b99nightwood = Instance.new("TextButton")
b99nightwood.Parent = MainScrollFrame
b99nightwood.Name = "99nightwood"
b99nightwood.Size = UDim2.new(1, 0, 0.1, 0)
b99nightwood.Position = UDim2.new(0.05, 0, 0, 0)
b99nightwood.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
b99nightwood.BackgroundTransparency = 0
b99nightwood.Text = "99 Night Wood Farmer"
b99nightwood.TextColor3 = Color3.fromRGB(0, 0, 0)
b99nightwood.TextSize = 14
b99nightwood.Font = Enum.Font.SourceSansBold
b99nightwood.TextXAlignment = Enum.TextXAlignment.Center
b99nightwood.TextYAlignment = Enum.TextYAlignment.Center
b99nightwood.AutoButtonColor = true
b99nightwood.BorderSizePixel = 0
b99nightwood.LayoutOrder = 1.5
b99nightwood.Activated:Connect(function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/203209/scripts/wood%20farmer%2099%20nigths.lua"))()
end)

local b99nightvoidware = Instance.new("TextButton")
b99nightvoidware.Parent = MainScrollFrame
b99nightvoidware.Name = "99nightvoidware"
b99nightvoidware.Size = UDim2.new(1, 0, 0.1, 0)
b99nightvoidware.Position = UDim2.new(0.05, 0, 0, 0)
b99nightvoidware.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
b99nightvoidware.BackgroundTransparency = 0
b99nightvoidware.Text = "99 Night Voidware"
b99nightvoidware.TextColor3 = Color3.fromRGB(0, 0, 0)
b99nightvoidware.TextSize = 14
b99nightvoidware.Font = Enum.Font.SourceSansBold
b99nightvoidware.TextXAlignment = Enum.TextXAlignment.Center
b99nightvoidware.TextYAlignment = Enum.TextYAlignment.Center
b99nightvoidware.AutoButtonColor = true
b99nightvoidware.BorderSizePixel = 0
b99nightvoidware.LayoutOrder = 1.5
b99nightvoidware.Activated:Connect(function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/204204/scripts/Voidware.lua"))()
end)

local bmm2 = Instance.new("TextButton")
bmm2.Parent = MainScrollFrame
bmm2.Name = "mm2"
bmm2.Size = UDim2.new(1, 0, 0.1, 0)
bmm2.Position = UDim2.new(0.05, 0, 0, 0)
bmm2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bmm2.BackgroundTransparency = 0
bmm2.Text = "mm2"
bmm2.TextColor3 = Color3.fromRGB(0, 0, 0)
bmm2.TextSize = 14
bmm2.Font = Enum.Font.SourceSansBold
bmm2.TextXAlignment = Enum.TextXAlignment.Center
bmm2.TextYAlignment = Enum.TextYAlignment.Center
bmm2.AutoButtonColor = true
bmm2.BorderSizePixel = 0
bmm2.LayoutOrder = 1.5
bmm2.Activated:Connect(function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/s/69a95244dd16cd9363554d73.lua"))()
end)

local bWaapp = Instance.new("TextButton")
bWaapp.Parent = MainScrollFrame
bWaapp.Name = "Waapp"
bWaapp.Size = UDim2.new(1, 0, 0.1, 0)
bWaapp.Position = UDim2.new(0.05, 0, 0, 0)
bWaapp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bWaapp.BackgroundTransparency = 0
bWaapp.Text = "Work At A Pizza Place"
bWaapp.TextColor3 = Color3.fromRGB(0, 0, 0)
bWaapp.TextSize = 14
bWaapp.Font = Enum.Font.SourceSansBold
bWaapp.TextXAlignment = Enum.TextXAlignment.Center
bWaapp.TextYAlignment = Enum.TextYAlignment.Center
bWaapp.AutoButtonColor = true
bWaapp.BorderSizePixel = 0
bWaapp.LayoutOrder = 1.5
bWaapp.Activated:Connect(function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/206903/scripts/Pizza%20Hub%202.lua"))()
end)

local bbladballer = Instance.new("TextButton")
bbladballer.Parent = MainScrollFrame
bbladballer.Name = "bladballer"
bbladballer.Size = UDim2.new(1, 0, 0.1, 0)
bbladballer.Position = UDim2.new(0.05, 0, 0, 0)
bbladballer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bbladballer.BackgroundTransparency = 0
bbladballer.Text = "Blade Ball"
bbladballer.TextColor3 = Color3.fromRGB(0, 0, 0)
bbladballer.TextSize = 14
bbladballer.Font = Enum.Font.SourceSansBold
bbladballer.TextXAlignment = Enum.TextXAlignment.Center
bbladballer.TextYAlignment = Enum.TextYAlignment.Center
bbladballer.AutoButtonColor = true
bbladballer.BorderSizePixel = 0
bbladballer.LayoutOrder = 1.5
bbladballer.Activated:Connect(function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/200089/scripts/blade-ball-autoparry.lua"))()
end)

local binkgame = Instance.new("TextButton")
binkgame.Parent = MainScrollFrame
binkgame.Name = "inkgame"
binkgame.Size = UDim2.new(1, 0, 0.1, 0)
binkgame.Position = UDim2.new(0.05, 0, 0, 0)
binkgame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
binkgame.BackgroundTransparency = 0
binkgame.Text = "Ink Game / Squide Game"
binkgame.TextColor3 = Color3.fromRGB(0, 0, 0)
binkgame.TextSize = 14
binkgame.Font = Enum.Font.SourceSansBold
binkgame.TextXAlignment = Enum.TextXAlignment.Center
binkgame.TextYAlignment = Enum.TextYAlignment.Center
binkgame.AutoButtonColor = true
binkgame.BorderSizePixel = 0
binkgame.LayoutOrder = 1.5
binkgame.Activated:Connect(function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/204167/scripts/ink%20game.lua"))()
end)

local bgag = Instance.new("TextButton")
bgag.Parent = MainScrollFrame
bgag.Name = "gag"
bgag.Size = UDim2.new(1, 0, 0.1, 0)
bgag.Position = UDim2.new(0.05, 0, 0, 0)
bgag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bgag.BackgroundTransparency = 0
bgag.Text = "Grow A Garden"
bgag.TextColor3 = Color3.fromRGB(0, 0, 0)
bgag.TextSize = 14
bgag.Font = Enum.Font.SourceSansBold
bgag.TextXAlignment = Enum.TextXAlignment.Center
bgag.TextYAlignment = Enum.TextYAlignment.Center
bgag.AutoButtonColor = true
bgag.BorderSizePixel = 0
bgag.LayoutOrder = 1.5
bgag.Activated:Connect(function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/200814/scripts/gag%20script.lua"))()
end)

local bBrookheaven = Instance.new("TextButton")
bBrookheaven.Parent = MainScrollFrame
bBrookheaven.Name = "Brookheaven"
bBrookheaven.Size = UDim2.new(1, 0, 0.1, 0)
bBrookheaven.Position = UDim2.new(0.05, 0, 0, 0)
bBrookheaven.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bBrookheaven.BackgroundTransparency = 0
bBrookheaven.Text = "BrookHaven"
bBrookheaven.TextColor3 = Color3.fromRGB(0, 0, 0)
bBrookheaven.TextSize = 14
bBrookheaven.Font = Enum.Font.SourceSansBold
bBrookheaven.TextXAlignment = Enum.TextXAlignment.Center
bBrookheaven.TextYAlignment = Enum.TextYAlignment.Center
bBrookheaven.AutoButtonColor = true
bBrookheaven.BorderSizePixel = 0
bBrookheaven.LayoutOrder = 1.5
bBrookheaven.Activated:Connect(function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/200522/scripts/Brookhaven%20Roblox%20Script.lua"))()
end)

local tInfoorGui = Instance.new("TextLabel")
tInfoorGui.Parent = MainScrollFrame
tInfoorGui.Name = "InfoGeneral"
tInfoorGui.Size = UDim2.new(1, 0, 0.1, 0)
tInfoorGui.Position = UDim2.new(0.05, 0, 0, 0)
tInfoorGui.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
tInfoorGui.BackgroundTransparency = 0.5
tInfoorGui.Text = "--- OriginalGui ---"
tInfoorGui.TextColor3 = Color3.fromRGB(255, 255, 255)
tInfoorGui.TextSize = 14
tInfoorGui.Font = Enum.Font.SourceSansBold
tInfoorGui.TextXAlignment = Enum.TextXAlignment.Center
tInfoorGui.TextYAlignment = Enum.TextYAlignment.Center
tInfoorGui.BorderSizePixel = 0
tInfoorGui.LayoutOrder = 2


local bCyberGui1 = Instance.new("TextButton")
bCyberGui1.Parent = MainScrollFrame
bCyberGui1.Name = "openCyberGui1"
bCyberGui1.Size = UDim2.new(1, 0, 0.1, 0)
bCyberGui1.Position = UDim2.new(0.05, 0, 0, 0)
bCyberGui1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bCyberGui1.BackgroundTransparency = 0
bCyberGui1.Text = "Open Cyber Gui 1"
bCyberGui1.TextColor3 = Color3.fromRGB(0, 0, 0)
bCyberGui1.TextSize = 14
bCyberGui1.Font = Enum.Font.SourceSansBold
bCyberGui1.TextXAlignment = Enum.TextXAlignment.Center
bCyberGui1.TextYAlignment = Enum.TextYAlignment.Center
bCyberGui1.AutoButtonColor = true
bCyberGui1.BorderSizePixel = 0
bCyberGui1.LayoutOrder = 2
bCyberGui1.Activated:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/killcyberLV/cyberGUI/main/CyberGui1.lua", true))()
end)

local tpguib = Instance.new("TextButton")
tpguib.Parent = MainScrollFrame
tpguib.Name = "openTpGui"
tpguib.Size = UDim2.new(1, 0, 0.1, 0)
tpguib.Position = UDim2.new(0.05, 0, 0, 0)
tpguib.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
tpguib.BackgroundTransparency = 0
tpguib.Text = "Open Tp Gui"
tpguib.TextColor3 = Color3.fromRGB(0, 0, 0)
tpguib.TextSize = 14
tpguib.Font = Enum.Font.SourceSansBold
tpguib.TextXAlignment = Enum.TextXAlignment.Center
tpguib.TextYAlignment = Enum.TextYAlignment.Center
tpguib.AutoButtonColor = true
tpguib.BorderSizePixel = 0
tpguib.LayoutOrder = 2
tpguib.Activated:Connect(function()
	tpgui()
end)

local bContrlgui = Instance.new("TextButton")
bContrlgui.Parent = MainScrollFrame
bContrlgui.Name = "openContrlGui"
bContrlgui.Size = UDim2.new(1, 0, 0.1, 0)
bContrlgui.Position = UDim2.new(0.05, 0, 0, 0)
bContrlgui.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bContrlgui.BackgroundTransparency = 0
bContrlgui.Text = "Open Controls Gui"
bContrlgui.TextColor3 = Color3.fromRGB(0, 0, 0)
bContrlgui.TextSize = 14
bContrlgui.Font = Enum.Font.SourceSansBold
bContrlgui.TextXAlignment = Enum.TextXAlignment.Center
bContrlgui.TextYAlignment = Enum.TextYAlignment.Center
bContrlgui.AutoButtonColor = true
bContrlgui.BorderSizePixel = 0
bContrlgui.LayoutOrder = 2
bContrlgui.Activated:Connect(function()
	controlgui()
end)

local bAntiAFK = Instance.new("TextButton")
bAntiAFK.Parent = MainScrollFrame
bAntiAFK.Name = "openAntiAFK"
bAntiAFK.Size = UDim2.new(1, 0, 0.1, 0)
bAntiAFK.Position = UDim2.new(0.05, 0, 0, 0)
bAntiAFK.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bAntiAFK.BackgroundTransparency = 0
bAntiAFK.Text = "Open Anti AFK"
bAntiAFK.TextColor3 = Color3.fromRGB(0, 0, 0)
bAntiAFK.TextSize = 14
bAntiAFK.Font = Enum.Font.SourceSansBold
bAntiAFK.TextXAlignment = Enum.TextXAlignment.Center
bAntiAFK.TextYAlignment = Enum.TextYAlignment.Center
bAntiAFK.AutoButtonColor = true
bAntiAFK.BorderSizePixel = 0
bAntiAFK.LayoutOrder = 2
bAntiAFK.Activated:Connect(function()
	loadstring(game:HttpGet("https://obj.wearedevs.net/69322/scripts/Simple%20Anti-AFK%20Script.lua"))()
end)

local tInfoGui = Instance.new("TextLabel")
tInfoGui.Parent = MainScrollFrame
tInfoGui.Name = "InfoGeneral"
tInfoGui.Size = UDim2.new(1, 0, 0.1, 0)
tInfoGui.Position = UDim2.new(0.05, 0, 0, 0)
tInfoGui.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
tInfoGui.BackgroundTransparency = 0.5
tInfoGui.Text = "--- Gui ---"
tInfoGui.TextColor3 = Color3.fromRGB(255, 255, 255)
tInfoGui.TextSize = 14
tInfoGui.Font = Enum.Font.SourceSansBold
tInfoGui.TextXAlignment = Enum.TextXAlignment.Center
tInfoGui.TextYAlignment = Enum.TextYAlignment.Center
tInfoGui.BorderSizePixel = 0
tInfoGui.LayoutOrder = 3

local bCoolClanGui = Instance.new("TextButton")
bCoolClanGui.Parent = MainScrollFrame
bCoolClanGui.Name = "openCoolClanGui"
bCoolClanGui.Size = UDim2.new(1, 0, 0.1, 0)
bCoolClanGui.Position = UDim2.new(0.05, 0, 0, 0)
bCoolClanGui.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bCoolClanGui.BackgroundTransparency = 0
bCoolClanGui.Text = "Open Cool Clan Gui"
bCoolClanGui.TextColor3 = Color3.fromRGB(0, 0, 0)
bCoolClanGui.TextSize = 14
bCoolClanGui.Font = Enum.Font.SourceSansBold
bCoolClanGui.TextXAlignment = Enum.TextXAlignment.Center
bCoolClanGui.TextYAlignment = Enum.TextYAlignment.Center
bCoolClanGui.AutoButtonColor = true
bCoolClanGui.BorderSizePixel = 0
bCoolClanGui.LayoutOrder = 3
bCoolClanGui.Activated:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/cfsmi2/c00lguiv1/refs/heads/main/Main.lua", true))()
end)

local bKnifeGrab = Instance.new("TextButton")
bKnifeGrab.Parent = MainScrollFrame
bKnifeGrab.Name = "getKnifeGrab"
bKnifeGrab.Size = UDim2.new(1, 0, 0.1, 0)
bKnifeGrab.Position = UDim2.new(0.05, 0, 0, 0)
bKnifeGrab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bKnifeGrab.BackgroundTransparency = 0
bKnifeGrab.Text = "Open Knife Grab"
bKnifeGrab.TextColor3 = Color3.fromRGB(0, 0, 0)
bKnifeGrab.TextSize = 14
bKnifeGrab.Font = Enum.Font.SourceSansBold
bKnifeGrab.TextXAlignment = Enum.TextXAlignment.Center
bKnifeGrab.TextYAlignment = Enum.TextYAlignment.Center
bKnifeGrab.AutoButtonColor = true
bKnifeGrab.BorderSizePixel = 0
bKnifeGrab.LayoutOrder = 3
bKnifeGrab.Activated:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/KenzoSSto1/GRAB-KNIFE-V4/refs/heads/main/grabknife.txt"))()
end)

local bCoolGuiV3 = Instance.new("TextButton")
bCoolGuiV3.Parent = MainScrollFrame
bCoolGuiV3.Name = "openCoolGuiV3"
bCoolGuiV3.Size = UDim2.new(1, 0, 0.1, 0)
bCoolGuiV3.Position = UDim2.new(0.05, 0, 0, 0)
bCoolGuiV3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bCoolGuiV3.BackgroundTransparency = 0
bCoolGuiV3.Text = "Open Cool Gui V3"
bCoolGuiV3.TextColor3 = Color3.fromRGB(0, 0, 0)
bCoolGuiV3.TextSize = 14
bCoolGuiV3.Font = Enum.Font.SourceSansBold
bCoolGuiV3.TextXAlignment = Enum.TextXAlignment.Center
bCoolGuiV3.TextYAlignment = Enum.TextYAlignment.Center
bCoolGuiV3.AutoButtonColor = true
bCoolGuiV3.BorderSizePixel = 0
bCoolGuiV3.LayoutOrder = 3
bCoolGuiV3.Activated:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/hyperionhax/c00lgui/refs/heads/main/CoolGui.lua"))()
end)


-- loops
while true do
	wait()
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
	
	if esp == true then
		for _, player in pairs(game.Players:GetPlayers()) do
			if player.Character then
				local head = player.Character:FindFirstChild("Head")
				if head then
					local billboardGui = Instance.new("BillboardGui")
					billboardGui.Size = UDim2.new(0, 100, 0, 50)
					billboardGui.StudsOffset = Vector3.new(0, 2, 0)
					billboardGui.AlwaysOnTop = true
					billboardGui.Parent = head
					local textLabel = Instance.new("TextLabel")
					textLabel.Size = UDim2.new(1, 0, 1, 0)
					textLabel.BackgroundTransparency = 1
					textLabel.Text = player.Name
					textLabel.TextColor3 = Color3.new(1, 1, 1)
					textLabel.TextStrokeTransparency = 0.5
					textLabel.Font = Enum.Font.SourceSansBold
					textLabel.TextSize = 18
					textLabel.Parent = billboardGui
				end
			end
		end
	else
		for _, player in pairs(game.Players:GetPlayers()) do
			if player.Character then
				local head = player.Character:FindFirstChild("Head")
				if head then
					for _, child in pairs(head:GetChildren()) do
						if child:IsA("BillboardGui") then
							child:Destroy()
						end
					end
				end
			end
		end
	end
	if godmode == true then
		-- infinit health
		local char = player.Character
		if char then
			local humanoid = char:FindFirstChild("Humanoid")
			if humanoid then
				humanoid.MaxHealth = math.huge
				humanoid.Health = math.huge
			end
		end
	else
		-- normal health
		local char = player.Character
		if char then
			local humanoid = char:FindFirstChild("Humanoid")
			if humanoid then
				humanoid.MaxHealth = 100
				humanoid.Health = 100
			end
		end
	end
	
	if inf_jump == true then
		UIS.JumpRequest:Connect(function()
			local char = player.Character
			if not char then return end
			local humanoid = char:FindFirstChildOfClass("Humanoid")
			if not humanoid then return end
			humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end)
	end
end
