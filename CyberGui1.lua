local UISettings = {
	StrokeColor = Color3.fromRGB(0,0,0), -- outline color
	StrokeThickness = 1.5,               -- outline thickness
	CornerRadius = UDim.new(0.2, 0)      -- roundness
}

-- 🌟 Apply style to any GUI object
local function StyleGUI(gui)
	-- outline
	local stroke = Instance.new("UIStroke")
	stroke.Color = UISettings.StrokeColor
	stroke.Thickness = UISettings.StrokeThickness
	stroke.Parent = gui

	-- roundness
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UISettings.CornerRadius
	corner.Parent = gui
end

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local chatservice = game:GetService("Chat")
local InsertService = game:GetService("InsertService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- GUI Settings
local GUI_WIDTH, GUI_HEIGHT = 400, 320
local TITLE_HEIGHT, NAV_HEIGHT, FOOTER_HEIGHT = 30, 30, 30
local GRID_PADDING, GRID_COLUMNS = 4, 4

-- State variables
local infJumpEnabled = false
local infJumpConnection
local noclipEnabled = false
local noclipConnection
local invisEnabled = false
local flyingEnabled = false
local flyBG, flyBV, flyConn, flyAnimTrack
local flyAnimId = "rbxassetid://YOUR_ANIMATION_ID"
local i = 0
local savepos = 0
local infinitheal = false
local infinithealConn
local isAdmin = false
local spinEnabled = false
local spinConn
local shieldEnabled = false
local shieldInstance
local flyingEnabled = false
local flyBG, flyBV, flyConn, flyAnimTrack
local flyAnimId = "rbxassetid://YOUR_ANIMATION_ID" -- replace with your animation

local function getCharacter()
	local char = Player.Character or Player.CharacterAdded:Wait()
	local humanoid = char:WaitForChild("Humanoid")
	local hrp = char:WaitForChild("HumanoidRootPart")
	return char, humanoid, hrp
end
local flyingEnabled = false
local flyBG, flyBV, flyConn, flyAnimTrack
local flyAnimId = "rbxassetid://YOUR_ANIMATION_ID" -- replace with your animation

-- Character references
local Character, Humanoid, HRP
local function updateCharacter()
	Character = Player.Character or Player.CharacterAdded:Wait()
	Humanoid = Character:WaitForChild("Humanoid")
	HRP = Character:WaitForChild("HumanoidRootPart")
end
updateCharacter()
Player.CharacterAdded:Connect(updateCharacter)

-- Notification system
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CyberGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

local notificationContainer = Instance.new("Frame")
notificationContainer.Size = UDim2.new(1,0,1,0)
notificationContainer.BackgroundTransparency = 1
notificationContainer.ZIndex = 100
notificationContainer.Parent = screenGui
 
local function Notify(text, title, duration)
	duration = duration or 4
	local frame = Instance.new("Frame")
	frame.AnchorPoint = Vector2.new(1,1)
	frame.Size = UDim2.new(0,300,0,70)
	frame.Position = UDim2.new(1,320,1,-10)
	frame.BackgroundColor3 = Color3.fromRGB(11,73,206)
	frame.BorderSizePixel = 0
	frame.ZIndex = 200
	frame.Parent = notificationContainer

	local titleLabel = Instance.new("TextLabel")
	titleLabel.BackgroundTransparency = 1
	titleLabel.Size = UDim2.new(1,-10,0,24)
	titleLabel.Position = UDim2.new(0,5,0,4)
	titleLabel.Font = Enum.Font.SourceSansBold
	titleLabel.Text = title or "Notice"
	titleLabel.TextColor3 = Color3.new(1,1,1)
	titleLabel.TextSize = 18
	titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	titleLabel.ZIndex = 201
	titleLabel.Parent = frame

	local bodyLabel = Instance.new("TextLabel")
	bodyLabel.BackgroundTransparency = 1
	bodyLabel.Size = UDim2.new(1,-10,1,-30)
	bodyLabel.Position = UDim2.new(0,5,0,28)
	bodyLabel.Font = Enum.Font.SourceSans
	bodyLabel.Text = text or ""
	bodyLabel.TextColor3 = Color3.new(1,1,1)
	bodyLabel.TextSize = 14
	bodyLabel.TextWrapped = true
	bodyLabel.TextXAlignment = Enum.TextXAlignment.Left
	bodyLabel.ZIndex = 201
	bodyLabel.Parent = frame

	TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
		{ Position = UDim2.new(1,-10,1,-10) }):Play()

	task.delay(duration, function()
		local fadeOut = TweenService:Create(frame, TweenInfo.new(0.3), { BackgroundTransparency = 1, Position = UDim2.new(1,320,1,-10) })
		local titleFade = TweenService:Create(titleLabel, TweenInfo.new(0.3), { TextTransparency = 1 })
		local bodyFade = TweenService:Create(bodyLabel, TweenInfo.new(0.3), { TextTransparency = 1 })
		fadeOut:Play() titleFade:Play() bodyFade:Play()
		fadeOut.Completed:Wait()
		frame:Destroy()
	end)
end

Notify("Welcome!", "Cyber GUI Loaded", 3)

-- Function Manager
local FunctionManager = {
	CategorizedFunctions = {},
	Categories = {"All"},
	CurrentCategoryIndex = 1,
	Descriptions = {},
	OnFunctionAdded = Instance.new("BindableEvent")
}

function FunctionManager:register(name, callback, category, description)
	category = category or "General"
	if not self.CategorizedFunctions[category] then
		self.CategorizedFunctions[category] = {}
		table.insert(self.Categories, category)
	end
	if self.CategorizedFunctions[category][name] then return end
	self.CategorizedFunctions[category][name] = callback
	self.CategorizedFunctions.All = self.CategorizedFunctions.All or {}
	self.CategorizedFunctions.All[name] = callback
	self.Descriptions[name] = description or ""
	self.OnFunctionAdded:Fire(name, callback)
end

-- GUI creation
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0,GUI_WIDTH,0,GUI_HEIGHT)
mainFrame.Position = UDim2.new(0.5,-GUI_WIDTH/2,0.5,-GUI_HEIGHT/2)
mainFrame.BackgroundColor3 = Color3.fromRGB(32,86,127)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Title bar + dragging
local titleBar = Instance.new("Frame", mainFrame)
titleBar.Size = UDim2.new(1,0,0,TITLE_HEIGHT)
titleBar.BackgroundColor3 = Color3.fromRGB(6,129,211)

local titleLabel = Instance.new("TextLabel", titleBar)
titleLabel.Size = UDim2.new(1,-60,1,0)
titleLabel.Position = UDim2.new(0,4,0,0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Cyber GUI v1"
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 18
titleLabel.TextColor3 = Color3.new(1,1,1)
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

local dragging, dragInput, dragStart, startPos
local function updateDrag(input)
	local delta = input.Position - dragStart
	mainFrame.Position = startPos + UDim2.new(0, delta.X, 0, delta.Y)
end
titleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging, dragStart, startPos = true, input.Position, mainFrame.Position
		input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging=false end end)
	end
end)
titleBar.InputChanged:Connect(function(input) if input.UserInputType==Enum.UserInputType.MouseMovement then dragInput=input end end)
UserInputService.InputChanged:Connect(function(input) if input==dragInput and dragging then updateDrag(input) end end)

-- Category navigation
local catNav = Instance.new("Frame", mainFrame)
catNav.Size = UDim2.new(1,0,0,NAV_HEIGHT)
catNav.Position = UDim2.new(0,0,0,TITLE_HEIGHT)
catNav.BackgroundTransparency = 1

local leftCat = Instance.new("TextButton", catNav)
leftCat.Size = UDim2.new(0,50,1,0)
leftCat.Text = "<"
leftCat.Font = Enum.Font.SourceSansBold
leftCat.TextSize = 24
leftCat.TextColor3 = Color3.new(1,1,1)
leftCat.BackgroundColor3 = Color3.fromRGB(12,162,217)
leftCat.BorderSizePixel = 0

local catLabel = Instance.new("TextLabel", catNav)
catLabel.Size = UDim2.new(1,-100,1,0)
catLabel.Position = UDim2.new(0,50,0,0)
catLabel.BackgroundTransparency = 1
catLabel.Text = "All"
catLabel.Font = Enum.Font.SourceSansBold
catLabel.TextSize = 18
catLabel.TextColor3 = Color3.new(1,1,1)

local rightCat = leftCat:Clone()
rightCat.Parent = catNav
rightCat.Position = UDim2.new(1,-50,0,0)
rightCat.Text = ">"

-- Grid frame
local gridFrame = Instance.new("ScrollingFrame", mainFrame)
gridFrame.ClipsDescendants = true
gridFrame.Size = UDim2.new(1,-2*GRID_PADDING,0,GUI_HEIGHT-TITLE_HEIGHT-NAV_HEIGHT-FOOTER_HEIGHT-2*GRID_PADDING)
gridFrame.Position = UDim2.new(0,GRID_PADDING,0,TITLE_HEIGHT+NAV_HEIGHT+GRID_PADDING)
gridFrame.BackgroundTransparency = 1

local gridLayout = Instance.new("UIGridLayout", gridFrame)
gridLayout.CellSize = UDim2.new(0,(GUI_WIDTH-2*GRID_PADDING-(GRID_COLUMNS-1)*GRID_PADDING)/GRID_COLUMNS,0,40)
gridLayout.CellPadding = UDim2.new(0,GRID_PADDING,0,GRID_PADDING)

-- Button creation (no duplicates)
local createdButtons = {}
FunctionManager.OnFunctionAdded.Event:Connect(function(name, callback)
	if createdButtons[name] then return end
	createdButtons[name] = true

	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0,100,0,40)
	button.Text = name
	button.Font = Enum.Font.SourceSansBold
	button.TextSize = 14
	button.BackgroundColor3 = Color3.fromRGB(60,160,220)
	button.TextColor3 = Color3.new(1,1,1)
	button.Parent = gridFrame

	button.MouseButton1Click:Connect(function()
		callback()
	end)
end)

--// Features

-- TP
FunctionManager:register("TP Up 20", function()
	HRP.CFrame = HRP.CFrame + Vector3.new(0,20,0)
end, "Movement", "Teleport 20 studs up")

FunctionManager:register("TP Down 20", function()
	HRP.CFrame = HRP.CFrame - Vector3.new(0,20,0)
end, "Movement", "Teleport 20 studs down")

-- Infinite Jump
FunctionManager:register("Infinite Jump", function()
	infJumpEnabled = not infJumpEnabled
	if infJumpEnabled then
		if infJumpConnection then infJumpConnection:Disconnect() end
		infJumpConnection = UserInputService.JumpRequest:Connect(function()
			if Humanoid then Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end
		end)
		Notify("Infinite Jump Enabled!", "System")
	else
		if infJumpConnection then infJumpConnection:Disconnect(); infJumpConnection=nil end
		Notify("Infinite Jump Disabled!", "System")
	end
end, "Movement", "Toggle infinite jump")

-- No-Clip
FunctionManager:register("No-Clip", function()
	noclipEnabled = not noclipEnabled
	if noclipEnabled then
		if noclipConnection then noclipConnection:Disconnect() end
		noclipConnection = RunService.Stepped:Connect(function()
			for _, part in ipairs(Character:GetDescendants()) do
				if part:IsA("BasePart") then part.CanCollide=false end
			end
		end)
		Notify("No-Clip Enabled!", "System")
	else
		if noclipConnection then noclipConnection:Disconnect(); noclipConnection=nil end
		for _, part in ipairs(Character:GetDescendants()) do
			if part:IsA("BasePart") then part.CanCollide=true end
		end
		Notify("No-Clip Disabled!", "System")
	end
end, "Movement", "Toggle No-Clip")

-- Invisibility
FunctionManager:register("Invisibility", function()
	invisEnabled = not invisEnabled
	for _, part in ipairs(Character:GetDescendants()) do
		if part:IsA("BasePart") and part.Name~="HumanoidRootPart" then
			part.LocalTransparencyModifier = invisEnabled and 0.7 or 0
		end
	end
	Notify(invisEnabled and "Invisible!" or "Visibility restored!", "System")
end, "Fun", "Local invisibility")

-- Fly
FunctionManager:register("Fly W.I.P.", function()
	flyingEnabled = not flyingEnabled

	local function startFly()
		if not HRP or not Humanoid then return end

		-- Remove old parts if they exist
		if flyBG then flyBG:Destroy() flyBG=nil end
		if flyBV then flyBV:Destroy() flyBV=nil end
		if flyConn then flyConn:Disconnect() flyConn=nil end
		if flyAnimTrack then flyAnimTrack:Stop() flyAnimTrack=nil end

		-- BodyGyro & BodyVelocity
		flyBG = Instance.new("BodyGyro")
		flyBG.MaxTorque = Vector3.new(1e5,1e5,1e5)
		flyBG.P = 1e4
		flyBG.CFrame = HRP.CFrame
		flyBG.Parent = HRP

		flyBV = Instance.new("BodyVelocity")
		flyBV.MaxForce = Vector3.new(1e5,1e5,1e5)
		flyBV.Velocity = Vector3.new(0,0,0)
		flyBV.Parent = HRP

		-- Animation
		local anim = Instance.new("Animation")
		anim.AnimationId = flyAnimId
		flyAnimTrack = Humanoid:LoadAnimation(anim)
		flyAnimTrack:Play()

		-- Movement
		flyConn = RunService.Heartbeat:Connect(function()
			if not HRP then return end
			local cam = workspace.CurrentCamera.CFrame
			local dir = Vector3.new()
			if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + cam.LookVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - cam.LookVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - cam.RightVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + cam.RightVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0,1,0) end
			if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir = dir - Vector3.new(0,1,0) end
			if dir.Magnitude>0 then dir = dir.Unit*50 end
			flyBV.Velocity = dir
			flyBG.CFrame = CFrame.new(HRP.Position, HRP.Position + cam.LookVector)
		end)
	end

	if flyingEnabled then
		startFly()
		-- Auto-restart on respawn
		Player.CharacterAdded:Connect(function(char)
			wait(0.2)
			updateCharacter() -- update Humanoid and HRP
			if flyingEnabled then startFly() end
		end)
		Notify("Fly Enabled!", "Movement")
	else
		if flyBG then flyBG:Destroy() flyBG=nil end
		if flyBV then flyBV:Destroy() flyBV=nil end
		if flyConn then flyConn:Disconnect() flyConn=nil end
		if flyAnimTrack then flyAnimTrack:Stop() flyAnimTrack=nil end
		Notify("Fly Disabled!", "Movement")
	end
end, "Movement", "Fly W.I.P.")



-- Reconnect all features on respawn
local function reconnectAllFeatures()
	updateCharacter()

	if infJumpEnabled then
		if infJumpConnection then infJumpConnection:Disconnect() end
		infJumpConnection = UserInputService.JumpRequest:Connect(function()
			if Humanoid then Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end
		end)
	end

	if noclipEnabled then
		if noclipConnection then noclipConnection:Disconnect() end
		noclipConnection = RunService.Stepped:Connect(function()
			for _, part in ipairs(Character:GetDescendants()) do
				if part:IsA("BasePart") then part.CanCollide=false end
			end
		end)
	end

	if invisEnabled then
		for _, part in ipairs(Character:GetDescendants()) do
			if part:IsA("BasePart") and part.Name~="HumanoidRootPart" then
				part.LocalTransparencyModifier = 0.7
			end
		end
	end

	if flyingEnabled then
		if flyBG then flyBG:Destroy() end
		if flyBV then flyBV:Destroy() end
		if flyConn then flyConn:Disconnect() end

		flyBG = Instance.new("BodyGyro")
		flyBG.MaxTorque = Vector3.new(1e5,1e5,1e5)
		flyBG.P = 1e4
		flyBG.CFrame = HRP.CFrame
		flyBG.Parent = HRP

		flyBV = Instance.new("BodyVelocity")
		flyBV.MaxForce = Vector3.new(1e5,1e5,1e5)
		flyBV.Velocity = Vector3.new(0,0,0)
		flyBV.Parent = HRP

		if flyAnimTrack then flyAnimTrack:Stop() end
		local anim = Instance.new("Animation")
		anim.AnimationId = flyAnimId
		flyAnimTrack = Humanoid:LoadAnimation(anim)
		flyAnimTrack:Play()

		flyConn = RunService.Heartbeat:Connect(function()
			local cam = workspace.CurrentCamera.CFrame
			local dir = Vector3.new()
			if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + cam.LookVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - cam.LookVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - cam.RightVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + cam.RightVector end
			if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0,1,0) end
			if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir = dir - Vector3.new(0,1,0) end
			if dir.Magnitude>0 then dir = dir.Unit * 50 end
			flyBV.Velocity = dir
			flyBG.CFrame = CFrame.new(HRP.Position, HRP.Position + cam.LookVector)
		end)
	end
end


FunctionManager:register("+1 WalkSpeed", function()
	if Humanoid then
		Humanoid.WalkSpeed = Humanoid.WalkSpeed + 1
		Notify("WalkSpeed: "..Humanoid.WalkSpeed, "Movement")
	end
end, "Movement", "")

FunctionManager:register("-1 WalkSpeed", function()
	if Humanoid then
		Humanoid.WalkSpeed = math.max(0, Humanoid.WalkSpeed - 1) -- prevent negative
		Notify("WalkSpeed: "..Humanoid.WalkSpeed, "Movement")
	end
end, "Movement", "")


FunctionManager:register("+10 WalkSpeed", function()
	if Humanoid then
		Humanoid.WalkSpeed = Humanoid.WalkSpeed + 10
		Notify("WalkSpeed: "..Humanoid.WalkSpeed, "Movement")
	end
end, "Movement", "")

FunctionManager:register("-10 WalkSpeed", function()
	if Humanoid then
		Humanoid.WalkSpeed = math.max(0, Humanoid.WalkSpeed - 10) -- prevent negative
		Notify("WalkSpeed: "..Humanoid.WalkSpeed, "Movement")
	end
end, "Movement", "")


FunctionManager:register("HELICOPTER !", function()
	local player = game.Players.LocalPlayer
	local RunService = game:GetService("RunService")

	local function spinAndLift(character)
		local root = character:WaitForChild("HumanoidRootPart")
		local startTime = tick()

		local connection
		connection = RunService.RenderStepped:Connect(function()
			local elapsed = tick() - startTime
			if elapsed < 5 then
				-- Spin the character rapidly
				root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(20), 0)
				-- Add upward motion (like a helicopter)
				root.Velocity = Vector3.new(0, 25, 0)
			else
				connection:Disconnect()
			end
		end)
	end

	-- If already spawned
	if player.Character then
		task.wait()
		spinAndLift(player.Character)
	end

end, "Movement", "HELICOPTER HELICOPTER !")

FunctionManager:register("shivers", function()
	local player = game.Players.LocalPlayer
	local RunService = game:GetService("RunService")

	local function spinAndLift(character)
		local root = character:WaitForChild("HumanoidRootPart")
		local startTime = tick()

		local connection
		connection = RunService.RenderStepped:Connect(function()
			local elapsed = tick() - startTime
			if elapsed < 5 then
				-- Spin the character rapidly
				root.CFrame = root.CFrame * CFrame.new(math.random(-1,1),0,math.random(-1,1))
				wait(0.2)
				-- Add upward motion (shiver ig)
			else
				connection:Disconnect()
			end
		end)
	end

	-- Trigger when character spawns
	player.CharacterAdded:Connect(function(character)
		task.wait()
		spinAndLift(character)
	end)

	-- If already spawned
	if player.Character then
		task.wait()
		spinAndLift(player.Character)
	end
end, "Movement", "Teleport 20 studs up")



FunctionManager:register("save pos", function()
	savepos = root.CFrame
	Notify("pos save")
end, "Movement", "")

FunctionManager:register("load pos", function()
	if savepos == 0 then
		Notify("no pos saved")
	else
		root.CFrame = savepos
	end
end, "Movement", "")

FunctionManager:register("WERE GOING UP!!!", function()
	root.Velocity = Vector3.new(0, 500, 0)
	Notify("Rumi, Zoey, Mira] I was a ghost, I was alone (Hah) Eoduwojin (Hah) abgilsog-e (Ah) Given the throne I didn't know (Hah) how to believe (Hah) I was the queen that I'm meant to be (Ah) I lived two lives, tried to play both sides But I couldn't find my own place Called a problem child 'cause I got too wild But now that's how I'm getting paid, kkeut-eobs-i on stage [Rumi] I'm done hidin', now I'm shinin' Like I'm born to be We dreamin' hard, we came so far Now I believe [Rumi] We're goin' up, up, up It's our moment You know together we're glowing Gonna be, gonna be golden Oh, up, up, up With our voices Yeong-wonhi kkaejil su eobsneun Gonna be, gonna be golden [Rumi] Oh, I'm done hidin' now I'm shinin' Like I'm born to be Oh, our time, no fear, no lies That's who we're born to be [Rumi] Waited so long to break these walls down To wake up and feel like me Put these patterns all in the past now And finally live like the girl they all see [Rumi] No more hiding, I'll be shining Like I'm born to be 'Cause we are hunters, voices strong And I know I believe [Rumi] We're goin' up, up, up It's our moment You know together we're glowing Gonna be, gonna be golden Oh, up, up, up With our voices Yeong-wonhi kkaejil su eobsneun Gonna be, gonna be golden [Rumi] Oh, I'm done hidin', now I'm shining Like I'm born to be Oh, our time, no fears, no lies That's who we're born to be [Rumi] You know we're gonna be, gonna be golden We're gonna be, gonna be Born to be, born to be glowin' Balg-ge bichnaneun ulin You know that it's our time, no fears, no lies That's who we're born to be")
end, "Movement", "Rumi, Zoey, Mira] I was a ghost, I was alone (Hah) Eoduwojin (Hah) abgilsog-e (Ah) Given the throne I didn't know (Hah) how to believe (Hah) I was the queen that I'm meant to be (Ah) I lived two lives, tried to play both sides But I couldn't find my own place Called a problem child 'cause I got too wild But now that's how I'm getting paid, kkeut-eobs-i on stage [Rumi] I'm done hidin', now I'm shinin' Like I'm born to be We dreamin' hard, we came so far Now I believe [Rumi] We're goin' up, up, up It's our moment You know together we're glowing Gonna be, gonna be golden Oh, up, up, up With our voices Yeong-wonhi kkaejil su eobsneun Gonna be, gonna be golden [Rumi] Oh, I'm done hidin' now I'm shinin' Like I'm born to be Oh, our time, no fear, no lies That's who we're born to be [Rumi] Waited so long to break these walls down To wake up and feel like me Put these patterns all in the past now And finally live like the girl they all see [Rumi] No more hiding, I'll be shining Like I'm born to be 'Cause we are hunters, voices strong And I know I believe [Rumi] We're goin' up, up, up It's our moment You know together we're glowing Gonna be, gonna be golden Oh, up, up, up With our voices Yeong-wonhi kkaejil su eobsneun Gonna be, gonna be golden [Rumi] Oh, I'm done hidin', now I'm shining Like I'm born to be Oh, our time, no fears, no lies That's who we're born to be [Rumi] You know we're gonna be, gonna be golden We're gonna be, gonna be Born to be, born to be glowin' Balg-ge bichnaneun ulin You know that it's our time, no fears, no lies That's who we're born to be")

FunctionManager:register("Set HP to 100", function()
	Humanoid.Health = 100
	Notify("Health set to 100")
end, "Movement", "Set your HP to full")

FunctionManager:register("Infinite Heal", function()
	infinitheal = not infinitheal -- toggle state

	if infinitheal then
		Notify("Infinite Heal Enabled!", "System")
		-- Connect to Heartbeat to constantly heal
		infinithealConn = game:GetService("RunService").Heartbeat:Connect(function()
			if Humanoid and Humanoid.Health > 0 then
				Humanoid.Health = Humanoid.MaxHealth
			end
		end)
	else
		Notify("Infinite Heal Disabled!", "System")
		-- Disconnect the loop
		if infinithealConn then
			infinithealConn:Disconnect()
			infinithealConn = nil
		end
	end
end, "Movement", "Keep your HP at max infinitely")

FunctionManager:register("Shield Toggle", function()
	shieldEnabled = not shieldEnabled

	if shieldEnabled then
		-- Create the shield
		shieldInstance = Instance.new("ForceField")
		shieldInstance.Parent = Character
		Notify("Shield Enabled!", "Defense")
	else
		-- Remove the shield
		if shieldInstance then
			shieldInstance:Destroy()
			shieldInstance = nil
		end
		Notify("Shield Disabled!", "Defense")
	end
end, "Movement", "Toggle a personal shield on/off")

FunctionManager:register("creat a part", function()
	-- create a part at player's position
	local part = Instance.new("Part")
	part.Anchored = true
	part.Size = Vector3.new(4, 1, 2)
	part.Position = Character.HumanoidRootPart.Position
	part.Parent = workspace
	Notify("Part created at your position", "System")
end, "Movement", "")

FunctionManager:register("credit", function()
	Notify("Created by: broomlegion thx for using Cyber GUI!", "Credits", 5)
end, "Movement", "Shows the creator credits")

FunctionManager:register("crazy shivers", function()
	local player = game.Players.LocalPlayer
	local RunService = game:GetService("RunService")

	local function spinAndLift(character)
		local root = character:WaitForChild("HumanoidRootPart")
		local startTime = tick()

		local connection
		connection = RunService.RenderStepped:Connect(function()
			local elapsed = tick() - startTime
			if elapsed < 5 then
				-- Spin the character rapidly
				root.CFrame = root.CFrame * CFrame.new(math.random(-10,10),0,math.random(-10,10))
				wait(0.2)
				-- Add upward motion (shiver ig)
			else
				connection:Disconnect()
			end
		end)
	end

	-- Trigger when character spawns
	player.CharacterAdded:Connect(function(character)
		task.wait()
		spinAndLift(character)
	end)

	-- If already spawned
	if player.Character then
		task.wait()
		spinAndLift(player.Character)
	end
end, "Movement", "Teleport 20 studs up")

FunctionManager:register("night vison", function()
    local l = game:GetService("Lighting")
    l.Brightness = 5
    l.ClockTime = 12
    l.FogEnd = 100000
    l.FogStart = 100000
	Notify("night vison active", "System", 5)
end, "Movement", "night vision")

FunctionManager:register("ULTRA shivers", function()
	local player = game.Players.LocalPlayer
	local RunService = game:GetService("RunService")

	local function spinAndLift(character)
		local root = character:WaitForChild("HumanoidRootPart")
		local startTime = tick()

		local connection
		connection = RunService.RenderStepped:Connect(function()
			local elapsed = tick() - startTime
			if elapsed < 5 then
				-- Spin the character rapidly
				root.CFrame = root.CFrame * CFrame.new(math.random(-999,999),0,math.random(-999,999))
				wait(0.2)
				-- Add upward motion (shiver ig)
			else
				connection:Disconnect()
			end
		end)
	end

	-- Trigger when character spawns
	player.CharacterAdded:Connect(function(character)
		task.wait()
		spinAndLift(character)
	end)

	-- If already spawned
	if player.Character then
		task.wait()
		spinAndLift(player.Character)
	end
end, "Movement", "Teleport 20 studs up")

FunctionManager:register("max speed", function()
		if Humanoid then
		Humanoid.WalkSpeed = Humanoid.WalkSpeed + 18446744073709551615
		Notify("WalkSpeed: "..Humanoid.WalkSpeed, "Movement")
	end
end, "Movement", "Shows the creator credits")






-- why are you looking at the scripte ?

Player.CharacterAdded:Connect(function()
	task.wait(1)
	reconnectAllFeatures()
end)
