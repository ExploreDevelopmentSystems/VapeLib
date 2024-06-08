-- Load additional setup script
loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploreDevelopmentSystems/VapeLib/main/Assets/Setup.lua"))()

local VapeLib = {}

-- Table to store random tab names and their corresponding windows and modules
VapeLib.Tabs = {}

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

-- Function to find and return a child from a parent or error out if not found
local function findChildOrError(parent, childName, context)
    local child = parent:FindFirstChild(childName)
    if not child then
        error(string.format("'%s' not found in %s", childName, context))
    end
    return child
end

-- CreateWindow Function
function VapeLib:CreateWindow(args)
    assert(args.Title, "Title is required")

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local playerGui = player:FindFirstChild("PlayerGui")

    -- Ensure PlayerGui is available
    if not playerGui then
        error("PlayerGui not found for the local player")
    end

    -- Create or find Lib container
    local libContainer = playerGui:FindFirstChild("Lib")
    if not libContainer then
        libContainer = Instance.new("ScreenGui")
        libContainer.Name = "Lib"
        libContainer.ResetOnSpawn = false
        libContainer.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        libContainer.Parent = playerGui
    end

    -- Find the Home template for the window
    local assetFolder = findChildOrError(ReplicatedStorage, "Asset", "ReplicatedStorage")
    local windowFolder = findChildOrError(assetFolder, "Window", "ReplicatedStorage.Asset")
    local windowTemplate = findChildOrError(windowFolder, "Home", "ReplicatedStorage.Asset.Window")

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

    if not clonedWindow:FindFirstChild("ContentFrames") then
        local ContentFrames = Instance.new("Folder")
        ContentFrames.Name = "ContentFrames"
        ContentFrames.Parent = clonedWindow
    end

    return clonedWindow
end

-- CreateTab Function
function VapeLib:CreateTab(window, args)
    assert(window, "Window is required")
    assert(args.Name, "Name is required")
    assert(args.Image, "Image asset ID is required")

    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    -- Generate a unique identifier
    local uniqueIdentifier = generateRandomString(6)

    -- Ensure unique identifier does not conflict
    if window:FindFirstChild(uniqueIdentifier) then
        error("A tab with this identifier already exists in the window.")
    end

    -- Find the TabButton template
    local assetFolder = findChildOrError(ReplicatedStorage, "Asset", "ReplicatedStorage")
    local windowFolder = findChildOrError(assetFolder, "Window", "ReplicatedStorage.Asset")
    local tabButtonTemplate = findChildOrError(windowFolder, "TabButton", "ReplicatedStorage.Asset.Window")
    
    local clonedTabButton = tabButtonTemplate:Clone()

    local textLabel = clonedTabButton:FindFirstChild("TextLabel")
    if textLabel then
        textLabel.Text = args.Name
    else
        warn("TextLabel not found in TabButton.")
    end

    local imageLabel = clonedTabButton:FindFirstChild("ImageLabel")
    if imageLabel then
        imageLabel.Image = "rbxassetid://" .. tostring(args.Image)
    else
        warn("ImageLabel not found in TabButton.")
    end

    clonedTabButton.Name = uniqueIdentifier
    clonedTabButton.Parent = window:FindFirstChild("Tabs")

    -- Find the Window template
    local windowTemplate = findChildOrError(windowFolder, "Window", "ReplicatedStorage.Asset.Window")
    local clonedWindowFrame = windowTemplate:Clone()

    local windowNameLabel = clonedWindowFrame:FindFirstChild("WindowName") or clonedWindowFrame:FindFirstChild("TextLabel")
    if windowNameLabel then
        windowNameLabel.Text = args.Name
    else
        warn("WindowName label not found in Window frame.")
    end

    clonedWindowFrame.Name = uniqueIdentifier
    clonedWindowFrame.Parent = window:FindFirstChild("ContentFrames")
    clonedWindowFrame.Visible = false -- Hide the tab window initially

    -- Store the tab and corresponding window in the tracking system
    VapeLib.Tabs[uniqueIdentifier] = { Button = clonedTabButton, Window = clonedWindowFrame, Modules = {} }

    -- Toggle visibility of the corresponding tab window
    clonedTabButton.MouseButton1Click:Connect(function()
        clonedWindowFrame.Visible = not clonedWindowFrame.Visible
    end)

    -- Add CreateModule function to the tab
    function VapeLib:CreateModule(tab, moduleArgs)
        assert(tab, "Tab is required")
        assert(moduleArgs.Name, "Name is required")
        assert(moduleArgs.Callback, "Callback is required")

        -- Generate a unique identifier for the module
        local moduleIdentifier = generateRandomString(6)

        -- Find the Module and ModuleFrame templates
        local moduleFolder = findChildOrError(assetFolder, "Module", "ReplicatedStorage.Asset")
        local moduleTemplate = findChildOrError(moduleFolder, "Module", "ReplicatedStorage.Asset.Module")
        local moduleFrameTemplate = findChildOrError(moduleFolder, "ModuleFrame", "ReplicatedStorage.Asset.Module")

        -- Clone and setup Module
        local clonedModule = moduleTemplate:Clone()
        clonedModule.Name = moduleIdentifier

        local textLabel = clonedModule:FindFirstChild("TextLabel")
        if textLabel then
            textLabel.Text = moduleArgs.Name
        else
            warn("TextLabel not found in Module.")
        end

        -- Ensure the List folder exists in the tab
        local tabList = tab:FindFirstChild("List")
        if not tabList then
            tabList = Instance.new("Folder")
            tabList.Name = "List"
            tabList.Parent = tab:FindFirstChild("Window")
        end

        clonedModule.Parent = tabList

        -- Clone and setup corresponding ModuleFrame
        local clonedModuleFrame = moduleFrameTemplate:Clone()
        clonedModuleFrame.Name = moduleIdentifier
        clonedModuleFrame.Parent = tabList -- Corrected to parent to the tab's List
        clonedModuleFrame.Visible = false -- Hide the module frame initially

        -- Store the module and its corresponding frame in the tab's modules
        table.insert(VapeLib.Tabs[tab.Name].Modules, { Module = clonedModule, Frame = clonedModuleFrame })

        -- Setup module toggle
        local moduleButton = clonedModule:FindFirstChild("TextButton")
        if moduleButton then
            moduleButton.MouseButton1Click:Connect(function()
                local isActive = clonedModuleFrame.Visible
                clonedModuleFrame.Visible = not isActive
                moduleArgs.Callback(not isActive)
            end)
        else
            warn("TextButton not found in Module.")
        end

        return clonedModule, clonedModuleFrame
    end

    return clonedTabButton, clonedWindowFrame
end

return VapeLib
