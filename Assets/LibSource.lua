-- Simplified VapeLib Module
local VapeLib = {}
loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploreDevelopmentSystems/VapeLib/main/Assets/Setup.lua"))()
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

    if not playerGui then
        error("PlayerGui not found for the local player")
    end

    local libContainer = playerGui:FindFirstChild("Lib")
    if not libContainer then
        libContainer = Instance.new("ScreenGui")
        libContainer.Name = "Lib"
        libContainer.ResetOnSpawn = false
        libContainer.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        libContainer.Parent = playerGui
    end

    local assetFolder = findChildOrError(ReplicatedStorage, "Asset", "ReplicatedStorage")
    local windowFolder = findChildOrError(assetFolder, "Window", "ReplicatedStorage.Asset")
    local windowTemplate = findChildOrError(windowFolder, "Home", "ReplicatedStorage.Asset.Window")

    local clonedWindow = windowTemplate:Clone()
    clonedWindow.Name = args.Title

    local titleLabel = clonedWindow:FindFirstChild("WindowName") or clonedWindow:FindFirstChild("TextLabel")
    if titleLabel then
        titleLabel.Text = args.Title
    else
        warn("Title label not found in cloned window.")
    end

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

    local assetFolder = findChildOrError(ReplicatedStorage, "Asset", "ReplicatedStorage")
    local windowFolder = findChildOrError(assetFolder, "Window", "ReplicatedStorage.Asset")
    local tabButtonTemplate = findChildOrError(windowFolder, "TabButton", "ReplicatedStorage.Asset.Window")
    
    local clonedTabButton = tabButtonTemplate:Clone()
    clonedTabButton.Name = args.Name

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

    clonedTabButton.Parent = window:FindFirstChild("Tabs")

    local windowTemplate = findChildOrError(windowFolder, "Window", "ReplicatedStorage.Asset.Window")
    local clonedWindowFrame = windowTemplate:Clone()
    clonedWindowFrame.Name = args.Name

    local windowNameLabel = clonedWindowFrame:FindFirstChild("WindowName") or clonedWindowFrame:FindFirstChild("TextLabel")
    if windowNameLabel then
        windowNameLabel.Text = args.Name
    else
        warn("WindowName label not found in Window frame.")
    end

    clonedWindowFrame.Parent = window:FindFirstChild("ContentFrames")
    clonedWindowFrame.Visible = false

    if not clonedWindowFrame:FindFirstChild("List") then
        local List = Instance.new("Frame")
        List.Name = "List"
        List.Size = UDim2.new(1, 0, 1, 0)
        List.BackgroundTransparency = 1
        List.Parent = clonedWindowFrame
    end

    clonedTabButton.MouseButton1Click:Connect(function()
        clonedWindowFrame.Visible = not clonedWindowFrame.Visible
    end)

    return clonedTabButton, clonedWindowFrame
end

function VapeLib:CreateModule(tab, moduleArgs)
    assert(tab, "Tab is required")
    assert(moduleArgs.Name, "Name is required")
    assert(moduleArgs.Callback, "Callback is required")

    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    -- Find asset folders and templates
    local assetFolder = findChildOrError(ReplicatedStorage, "Asset", "ReplicatedStorage")
    local moduleFolder = findChildOrError(assetFolder, "Module", "ReplicatedStorage.Asset")
    local moduleTemplate = findChildOrError(moduleFolder, "Module", "ReplicatedStorage.Asset.Module")
    local moduleFrameTemplate = findChildOrError(moduleFolder, "ModuleFrame", "ReplicatedStorage.Asset.Module")

    -- Clone the module template and set its name
    local clonedModule = moduleTemplate:Clone()
    clonedModule.Name = moduleArgs.Name
    print("Cloned module with name:", clonedModule.Name)

    local textLabel = clonedModule:FindFirstChild("TextLabel")
    if textLabel then
        textLabel.Text = moduleArgs.Name
    else
        warn("TextLabel not found in Module.")
    end

    -- Find the correct content frame for the tab
    local tabName = tab.Name
    print("Tab name:", tabName)

    -- Assume `tab` points to the button and find its parent window
    local parentWindow = tab.Parent.Parent -- `tab.Parent` is "Tabs", so `tab.Parent.Parent` should be the window
    local contentFrames = parentWindow:FindFirstChild("ContentFrames")
    if not contentFrames then
        error("ContentFrames folder not found in the parent window.")
    end

    local contentFrame = contentFrames:FindFirstChild(tabName)
    print("Content frame found:", contentFrame)
    if not contentFrame then
        error("Content frame for tab '" .. tabName .. "' not found.")
    end

    -- Find the List frame inside the content frame
    local tabList = contentFrame:FindFirstChild("List")
    print("List frame found:", tabList)
    if not tabList then
        error("List frame not found in the tab's content frame.")
    end

    -- Parent the cloned module to the tab list
    clonedModule.Parent = tabList
    print("Cloned module parent set to tab list.")

    -- Clone the module frame and set its name and parent
    local clonedModuleFrame = moduleFrameTemplate:Clone()
    clonedModuleFrame.Name = moduleArgs.Name
    clonedModuleFrame.Parent = tabList
    clonedModuleFrame.Visible = false
    print("Cloned module frame parent set and initially hidden.")

    -- Add callback functionality
    local moduleButton = clonedModule:FindFirstChild("TextButton")
    if moduleButton then
        moduleButton.MouseButton1Click:Connect(function()
            local isActive = clonedModuleFrame.Visible
            clonedModuleFrame.Visible = not isActive
            moduleArgs.Callback(not isActive)
            print("Module button clicked. State:", not isActive)
        end)
    else
        warn("TextButton not found in Module.")
    end

    return clonedModule, clonedModuleFrame
end

-- CreateToggle Function
function VapeLib:CreateToggle(configFrame, toggleArgs)
    assert(configFrame, "Config frame is required")
    assert(toggleArgs.Name, "Name is required")
    assert(toggleArgs.Callback, "Callback is required")

    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    -- Find the Toggle template
    local assetFolder = findChildOrError(ReplicatedStorage, "Asset", "ReplicatedStorage")
    local elementFolder = findChildOrError(assetFolder, "Element", "ReplicatedStorage.Asset")
    local toggleTemplate = findChildOrError(elementFolder, "Toggle", "ReplicatedStorage.Asset.Element")

    -- Clone the Toggle template and set its properties
    local clonedToggle = toggleTemplate:Clone()
    clonedToggle.Name = toggleArgs.Name

    -- Set the TextLabel
    local textLabel = clonedToggle:FindFirstChild("TextLabel")
    if textLabel then
        textLabel.Text = toggleArgs.Name
    else
        warn("TextLabel not found in Toggle.")
    end

    -- Define initial toggle state
    local toggleState = false
    local frame = clonedToggle:FindFirstChild("Frame")

    -- Function to update the UI based on the toggle state
    local function updateToggleUI()
        if toggleState then
            frame.Size = UDim2.new(0.467, 0, 1, 0)
        else
            frame.Size = UDim2.new(0, 0, 1, 0)
        end
        toggleArgs.Callback(toggleState)
    end

    -- Connect the toggle action
    clonedToggle.MouseButton1Click:Connect(function()
        toggleState = not toggleState
        updateToggleUI()
        print("Toggle", toggleArgs.Name, "state:", toggleState)
    end)

    -- Set the parent to the existing config frame
    clonedToggle.Parent = configFrame
    updateToggleUI()

    return clonedToggle
end



return VapeLib
