local VapeLib = {}
loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploreDevelopmentSystems/VapeLib/main/Assets/Setup.lua"))()
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

    clonedWindow.Parent = libContainer

    -- Add Tabs container if not present
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

    -- Ensure unique identifiers for tabs
    local tabName = args.Name
    if window:FindFirstChild(tabName) then
        error("A tab with this name already exists in the window.")
    end

    -- Clone and setup TabButton
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

    clonedTabButton.Name = tabName
    clonedTabButton.Parent = window:FindFirstChild("Tabs")

    -- Clone and setup corresponding window frame
    local windowFrameTemplate = ReplicatedStorage:WaitForChild("Asset"):WaitForChild("Window"):WaitForChild("Window")
    local clonedWindowFrame = windowFrameTemplate:Clone()

    local windowNameLabel = clonedWindowFrame:FindFirstChild("WindowName") or clonedWindowFrame:FindFirstChild("TextLabel")
    if windowNameLabel then
        windowNameLabel.Text = args.Name
    end

    clonedWindowFrame.Name = tabName
    clonedWindowFrame.Parent = window

    return clonedTabButton, clonedWindowFrame
end

return VapeLib
