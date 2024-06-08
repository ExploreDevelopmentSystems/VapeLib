function VapeLib:CreateModule(tab, moduleArgs)
    assert(tab, "Tab is required")
    assert(moduleArgs.Name, "Name is required")
    assert(moduleArgs.Callback, "Callback is required")

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local moduleIdentifier = generateRandomString(6)

    -- Validate tab existence in VapeLib.Tabs
    if not VapeLib.Tabs[tab.Name] then
        error("Tab not found in VapeLib.Tabs")
    end

    local assetFolder = findChildOrError(ReplicatedStorage, "Asset", "ReplicatedStorage")
    local moduleFolder = findChildOrError(assetFolder, "Module", "ReplicatedStorage.Asset")
    local moduleTemplate = findChildOrError(moduleFolder, "Module", "ReplicatedStorage.Asset.Module")
    local moduleFrameTemplate = findChildOrError(moduleFolder, "ModuleFrame", "ReplicatedStorage.Asset.Module")

    -- Clone the module template and set its name
    local clonedModule = moduleTemplate:Clone()
    clonedModule.Name = moduleIdentifier

    -- Set the module name
    local textLabel = clonedModule:FindFirstChild("TextLabel")
    if textLabel then
        textLabel.Text = moduleArgs.Name
    else
        warn("TextLabel not found in Module.")
    end

    -- Get the content frame of the tab
    local contentFrame = VapeLib.Ttabs[tab.Name].Window
    local tabList = contentFrame:FindFirstChild("List")
    if not tabList then
        error("List frame not found in the tab's content frame.")
    end

    -- Parent the cloned module to the tab list
    clonedModule.Parent = tabList

    -- Clone the module frame and set its name and parent
    local clonedModuleFrame = moduleFrameTemplate:Clone()
    clonedModuleFrame.Name = moduleIdentifier
    clonedModuleFrame.Parent = tabList
    clonedModuleFrame.Visible = false

    -- Add the cloned module and its frame to the tab's Modules list
    table.insert(VapeLib.Tabs[tab.Name].Modules, { Module = clonedModule, Frame = clonedModuleFrame })

    -- Add callback functionality
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
