local function findChildOrError(parent, childName, context)
    local child = parent:FindFirstChild(childName)
    if not child then
        error(string.format("'%s' not found in %s", childName, context))
    end
    return child
end

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

function VapeLib:CreateTab(window, args)
    assert(window, "Window is required")
    assert(args.Name, "Name is required")
    assert(args.Image, "Image asset ID is required")

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local uniqueIdentifier = generateRandomString(6)

    if window:FindFirstChild(uniqueIdentifier) then
        error("A tab with this identifier already exists in the window.")
    end

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
    clonedWindowFrame.Visible = false

    if not clonedWindowFrame:FindFirstChild("List") then
        local List = Instance.new("Frame")
        List.Name = "List"
        List.Size = UDim2.new(1, 0, 1, 0)
        List.BackgroundTransparency = 1
        List.Parent = clonedWindowFrame
    end

    VapeLib.Tabs[uniqueIdentifier] = { Button = clonedTabButton, Window = clonedWindowFrame, Modules = {} }

    clonedTabButton.MouseButton1Click:Connect(function()
        clonedWindowFrame.Visible = not clonedWindowFrame.Visible
    end)

    function VapeLib:CreateModule(tab, moduleArgs)
        assert(tab, "Tab is required")
        assert(moduleArgs.Name, "Name is required")
        assert(moduleArgs.Callback, "Callback is required")

        local moduleIdentifier = generateRandomString(6)

        local moduleFolder = findChildOrError(assetFolder, "Module", "ReplicatedStorage.Asset")
        local moduleTemplate = findChildOrError(moduleFolder, "Module", "ReplicatedStorage.Asset.Module")
        local moduleFrameTemplate = findChildOrError(moduleFolder, "ModuleFrame", "ReplicatedStorage.Asset.Module")

        local clonedModule = moduleTemplate:Clone()
        clonedModule.Name = moduleIdentifier

        local textLabel = clonedModule:FindFirstChild("TextLabel")
        if textLabel then
            textLabel.Text = moduleArgs.Name
        else
            warn("TextLabel not found in Module.")
        end

        local contentFrame = VapeLib.Tabs[tab.Name].Window
        local tabList = contentFrame:FindFirstChild("List")
        if not tabList then
            error("List frame not found in the tab's content frame.")
        end

        clonedModule.Parent = tabList

        local clonedModuleFrame = moduleFrameTemplate:Clone()
        clonedModuleFrame.Name = moduleIdentifier
        clonedModuleFrame.Parent = tabList
        clonedModuleFrame.Visible = false

        table.insert(VapeLib.Tabs[tab.Name].Modules, { Module = clonedModule, Frame = clonedModuleFrame })

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
