local VapeLib = {}

function VapeLib:CreateWindow(args)
    assert(args.Title, "Title is required")

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Players = game:GetService("Players")

    local player = Players.LocalPlayer
    local destination = player:WaitForChild("PlayerGui"):WaitForChild("Main-HVG1")

    local windowTemplate = ReplicatedStorage:WaitForChild("Asset"):WaitForChild("Window"):WaitForChild("Home")
    local clonedWindow = windowTemplate:Clone()

    local titleLabel = clonedWindow:WaitForChild("TextLabel")
    titleLabel.Text = args.Title
    clonedWindow.Parent = destination

    return clonedWindow
end

return VapeLib
