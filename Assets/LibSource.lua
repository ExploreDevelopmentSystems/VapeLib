local VapeLib = {}

-- Setup Function
function VapeLib:Setup()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    -- Create the container frame if it doesn't already exist
    local containerName = "VapeUIContainer"
    local container = playerGui:FindFirstChild(containerName)
    if not container then
        container = Instance.new("ScreenGui")
        container.Name = containerName
        container.ResetOnSpawn = false
        container.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        container.Parent = playerGui
    end

    print("UI Container setup complete")
end

-- CreateWindow Function
function VapeLib:CreateWindow(args)
    assert(args.Title, "Title is required")

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    local container = playerGui:FindFirstChild("VapeUIContainer")

    if not container then
        error("UI Container is not set up. Call Setup() first.")
    end

    local windowTemplate = ReplicatedStorage:WaitForChild("Asset"):WaitForChild("Window"):WaitForChild("Home")
    local clonedWindow = windowTemplate:Clone()

    local titleLabel = clonedWindow:FindFirstChild("WindowName") or clonedWindow:FindFirstChild("TextLabel")
    if titleLabel then
        titleLabel.Text = args.Title
    else
        warn("Title label not found in the window template.")
    end

    clonedWindow.Parent = container

    return clonedWindow
end

print("VapeLib module loaded")

return VapeLib
