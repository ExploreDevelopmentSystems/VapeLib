-- Load additional setup script
loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploreDevelopmentSystems/VapeLib/main/Assets/Setup.lua"))()

local VapeLib = {}

-- Table to store random tab names
VapeLib.TabNames = {}

-- Utility function to generate a random 6-character string
local function generateRandomString(length)
    local chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    local randomString = ''
    for i = 1, length do
        local randomIndex = math.random(1, #chars)
        randomString = randomString .. chars:sub(randomIndex, randomIndex)
    end
    return randomString
end

-- CreateWindow Function
function VapeLib:CreateWindow(args)
    assert(args.Title, "Title is required")

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    
    local libContainer = playerGui:FindFirstChild("Lib")
    if not libContainer then
        libContainer = Instance.new("ScreenGui")
        libContainer.Name = "Lib"
        libContainer.ResetOnSpawn = false
        libContainer.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        libContainer.Parent = playerGui
    end

    local windowTemplate = ReplicatedStorage:WaitForChild("Asset"):WaitForChild("Window"):WaitForChild("Home")
    local clonedWindow = windowTemplate:Clone()

    local titleLabel = clonedWindow:FindFirstChild("WindowName") or clonedWindow:FindFirstChild("TextLabel")
    if titleLabel then
        titleLabel.Text = args.Title
    end

    clonedWindow.Name = args.Title
    clonedWindow.Parent = libContainer

    if not clonedWindow:FindFirstChild("Tabs") then
        local Tabs = Instance.new("Folder")
        Tabs.Name = "Tabs"
        Tabs.Parent = clonedWindow
    end

    return clonedWindow
end

-- CreateTab Function
function VapeLib:CreateTab(window, args)
    assert(window, "Window is required")
    assert(args.Name, "Name is required")
    assert(args.Image, "Image asset ID is required")

    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    local tabName = args.Name
    local uniqueIdentifier = generateRandomString(6) -- Generate a random 6-character string

    if window:FindFirstChild(uniqueIdentifier) then
        error("A tab with this identifier already exists in the window.")
    end

    -- Store the random identifier for future use
    VapeLib.TabNames[args.Name] = uniqueIdentifier

    local tabButtonTemplate = ReplicatedStorage:WaitForChild("Asset"):WaitForChild("Window"):WaitForChild("TabButton")
    local clonedTabButton = tabButtonTemplate:Clone()

    local textLabel = clonedTabButton:FindFirstChild("TextLabel")
    if textLabel then
        textLabel.Text = args.Name
    end

    local imageLabel = clonedTabButton:FindFirstChild("ImageLabel")
    if imageLabel then
        imageLabel.Image = "rbxassetid://" .. tostring(args.Image)
    end

    clonedTabButton.Name = uniqueIdentifier
    clonedTabButton.Parent = window:FindFirstChild("Tabs")

    local windowFrameTemplate = ReplicatedStorage:WaitForChild("Asset"):WaitForChild("Window"):WaitForChild("Window")
    local clonedWindowFrame = windowFrameTemplate:Clone()

    local windowNameLabel = clonedWindowFrame:FindFirstChild("WindowName") or clonedWindowFrame:FindFirstChild("TextLabel")
    if windowNameLabel then
        windowNameLabel.Text = args.Name
    end

    clonedWindowFrame.Name = uniqueIdentifier
    clonedWindowFrame.Parent = window

    return clonedTabButton, clonedWindowFrame
end

return VapeLib
