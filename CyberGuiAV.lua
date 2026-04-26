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
local esp = false
local godmode = false



--settings
local GUI_WIDHT = 300
local GUI_HEIGHT = 300
local GUI_NAME = "CyberGui"
local GUI_VERSION = "1.3"
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
tInfoGui.LayoutOrder = 2

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
bCoolClanGui.LayoutOrder = 2
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
bKnifeGrab.LayoutOrder = 2
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
bCoolGuiV3.LayoutOrder = 2
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
end
