-- services
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- images ID
local partimg = "1557174355"
local playerimg = "2795572800"
local modelimg ="134520604202702"
local spawnpointimg = "6822364929"
local soundimg = "172648700"
local toolimg = "2037479"
local proximityimg = "5948297313"
local highlightimg = "18211184161"
local billboardimg = "120072737356823"
local particleimg = "7402796923"
local guiimg = "10150755779"
local scriptimg = "16481845020"
local folderimg = "16307658016"
local unknownimg = "87864711202902"
local textureimg = "1137331065"
local localscripteimg = "96122741815411"
local modulscripteimg = "131252352249629"
local remoteeventimg = "116520720569308"
local screenguiimg = "95196969969406"

-- icon system
local function getIcon(obj)
	if obj:IsA("Part") then return "rbxassetid://" .. partimg
	elseif obj:IsA("Model") then return "rbxassetid://" .. modelimg
	elseif obj:IsA("SpawnLocation") then return "rbxassetid://" .. spawnpointimg
	elseif obj:IsA("Sound") then return "rbxassetid://" .. soundimg
	elseif obj:IsA("Tool") then return "rbxassetid://" .. toolimg
	elseif obj:IsA("ProximityPrompt") then return "rbxassetid://" .. proximityimg
	elseif obj:IsA("Highlight") then return "rbxassetid://" .. highlightimg
	elseif obj:IsA("BillboardGui") then return "rbxassetid://" .. billboardimg
	elseif obj:IsA("ParticleEmitter") then return "rbxassetid://" .. particleimg
	elseif obj:IsA("ScreenGui") or obj:IsA("Frame") then return "rbxassetid://" .. guiimg
	elseif obj:IsA("Script") or obj:IsA("LocalScript") then return "rbxassetid://" .. scriptimg
	elseif obj:IsA("Folder") then return "rbxassetid://" .. folderimg
	elseif obj:IsA("Texture") then return "rbxassetid://" .. textureimg
	elseif obj:IsA("LocalScript") then return "rbxassetid://" .. localscripteimg
	elseif obj:IsA("ModuleScript") then return "rbxassetid://" .. modulscripteimg
	elseif obj:IsA("RemoteEvent") then return "rbxassetid://" .. remoteeventimg
	elseif obj:IsA("ScreenGui") then return "rbxassetid://" .. screenguiimg
	else return "rbxassetid://" .. unknownimg
	end
end

-- gui
local gui = Instance.new("ScreenGui")
gui.Name = "ExplorerUI"
gui.Parent = PlayerGui

local main = Instance.new("Frame")
main.Size = UDim2.new(0.3, 0, 1.1, 0)
main.Position = UDim2.new(0.7, 0, 0, -60)
main.BackgroundColor3 = Color3.fromRGB(25,25,25)
main.Parent = gui

-- search
local search = Instance.new("TextBox")
search.Size = UDim2.new(1, 0, 0, 35)
search.BackgroundColor3 = Color3.fromRGB(40,40,40)
search.TextColor3 = Color3.new(1,1,1)
search.PlaceholderText = "Search workspace..."
search.Parent = main

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 35, 0, 35)
close.BackgroundColor3 = Color3.fromRGB(25,25,25)
close.Text = "X"
close.TextSize = 18
close.TextColor3 = Color3.new(1,1,1)
close.Parent = main
close.mouseButton1Click:Connect(function()
	gui:Destroy()
end)

-- scroll
local scroll = Instance.new("ScrollingFrame")
scroll.Position = UDim2.new(0,0,0,35)
scroll.Size = UDim2.new(1,0,1,-35)
scroll.BackgroundTransparency = 1
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.ScrollBarThickness = 6
scroll.Parent = main

local layout = Instance.new("UIListLayout")
layout.Parent = scroll
layout.Padding = UDim.new(0,4)

-- clear UI
local function clear()
	for _, v in ipairs(scroll:GetChildren()) do
		if v:IsA("TextButton") then
			v:Destroy()
		end
	end
end

-- recursive explorer builder
local function addObject(obj, depth)

	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1,0,0,30)
	btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.TextXAlignment = Enum.TextXAlignment.Left
	btn.Text = obj.Name
	btn.Parent = scroll

	-- indentation
	local pad = Instance.new("UIPadding")
	pad.PaddingLeft = UDim.new(0, depth * 18)
	pad.Parent = btn

	-- RIGHT aligned icon (fixed)
	local icon = Instance.new("ImageLabel")
	icon.Size = UDim2.new(0,18,0,18)
	icon.AnchorPoint = Vector2.new(1, 0.5)
	icon.Position = UDim2.new(1, -6, 0.5, 0)
	icon.BackgroundTransparency = 1
	icon.Image = getIcon(obj)
	icon.Parent = btn

	btn.MouseButton1Click:Connect(function()
		print(obj:GetFullName())
	end)

	for _, child in ipairs(obj:GetChildren()) do
		addObject(child, depth + 1)
	end
end

-- build
local function build(root)
	clear()
	addObject(root, 0)
end

-- input
search.FocusLost:Connect(function(enter)
	if not enter then return end

	local text = search.Text:lower()

	if text == "workspace" or text == "ws" then
		build(workspace)

	elseif text == "players" then
		build(game:GetService("Players"))

	elseif text == "all" then
		build(workspace)

	elseif text == "" then
		build(workspace)
	end
end)

-- default
local services = {
	{"ws", workspace},
	{"workspace", workspace},

	{"pl", game:GetService("Players")},
	{"players", game:GetService("Players")},

	{"lg", game:GetService("Lighting")},
	{"lighting", game:GetService("Lighting")},

	{"rs", game:GetService("ReplicatedStorage")},
	{"replicatedstorage", game:GetService("ReplicatedStorage")},

	{"ss", game:GetService("ServerStorage")},
	{"serverstorage", game:GetService("ServerStorage")},

	{"sg", game:GetService("StarterGui")},
	{"startergui", game:GetService("StarterGui")},

	{"sp", game:GetService("StarterPack")},
	{"starterpack", game:GetService("StarterPack")}
}

local function help()
	for _, data in ipairs(services) do
		local shortcut = data[1]
		local service = data[2]

		local btn = Instance.new("TextButton")
		btn.Size = UDim2.new(1, 0, 0, 30)
		btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		btn.TextColor3 = Color3.new(1, 1, 1)
		btn.TextXAlignment = Enum.TextXAlignment.Left
		btn.Text = shortcut .. " → " .. service.Name
		btn.Parent = scroll

		btn.MouseButton1Click:Connect(function()
			clear()
			addObject(service, 0)
		end)
	end

	-- "ALL" button
	local allBtn = Instance.new("TextButton")
	allBtn.Size = UDim2.new(1, 0, 0, 30)
	allBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	allBtn.TextColor3 = Color3.new(1, 1, 1)
	allBtn.TextXAlignment = Enum.TextXAlignment.Left
	allBtn.Text = "all → full workspace tree"
	allBtn.Parent = scroll

	allBtn.MouseButton1Click:Connect(function()
		clear()
		addObject(workspace, 0)
	end)

	return
end

help()

search.FocusLost:Connect(function(enter)
	if not enter then return end
	local text = search.Text:lower()

	if text == "all" then
		clear()

		local allServices = {
			game:GetService("Workspace"),
			game:GetService("Players"),
			game:GetService("Lighting"),
			game:GetService("ReplicatedStorage"),
			game:GetService("ServerStorage"),
			game:GetService("StarterGui"),
			game:GetService("StarterPack"),
			game:GetService("StarterPlayer"),
			game:GetService("Teams"),
			game:GetService("SoundService"),
			game:GetService("TextChatService")
		}

		for _, service in ipairs(allServices) do
			local btn = Instance.new("TextButton")
			btn.Size = UDim2.new(1, 0, 0, 30)
			btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			btn.TextColor3 = Color3.new(1, 1, 1)
			btn.TextXAlignment = Enum.TextXAlignment.Left
			btn.Text = service.Name
			btn.Parent = scroll

			-- optional icon (matches your system)
			local icon = Instance.new("ImageLabel")
			icon.Size = UDim2.new(0, 18, 0, 18)
			icon.Position = UDim2.new(0, 5, 0.5, -9)
			icon.BackgroundTransparency = 1
			icon.Image = getIcon(service)
			icon.Parent = btn

			btn.MouseButton1Click:Connect(function()
				clear()
				addObject(service, 0)
			end)
		end

		return
	end

	for _, data in ipairs(services) do
		local name = data[1]
		local service = data[2]

		if text == name then
			clear()
			addObject(service, 0)
			return
		end
	end
end)
game.RunService.Heartbeat:Connect(function()
	local text = search.Text:lower()
	if text == "" then
		clear()
		help()
	end
end)
