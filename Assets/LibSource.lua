local VapeLib = {}

-- CreateWindow Function
function VapeLib:CreateWindow(args)
    assert(args.Title, "Title is required")

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Players = game:GetService("Players")

    local player = Players.LocalPlayer
    local destination = player:WaitForChild("PlayerGui"):WaitForChild("Main-HVG1")

    local windowTemplate = ReplicatedStorage:WaitForChild("Asset"):WaitForChild("Window"):WaitForChild("Home")
    local clonedWindow = windowTemplate:Clone()

    local titleLabel = clonedWindow:FindFirstChild("WindowName") or clonedWindow:FindFirstChild("TextLabel")
    if titleLabel then
        titleLabel.Text = args.Title
    else
        warn("Title label not found in the window template.")
    end

    clonedWindow.Parent = destination

    return clonedWindow
end

-- Setup Function
function VapeLib:Setup()
    local setupScript = game:HttpGet("https://raw.githubusercontent.com/ExploreDevelopmentSystems/VapeLib/main/Assets/Setup.lua")
    loadstring(setupScript)()
end

return VapeLib
