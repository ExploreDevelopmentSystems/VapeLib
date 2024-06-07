-- Gui to Lua
-- Version: 3.2

-- Instances:

local Lib = Instance.new("ScreenGui")
local Asset = Instance.new("Folder")
local Window = Instance.new("Folder")
local Window_2 = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local BG = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local List = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local Top = Instance.new("Frame")
local WindowName = Instance.new("TextLabel")
local TabButton = Instance.new("TextButton")
local ImageLabel = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local Home = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local BG_2 = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local Misc = Instance.new("Frame")
local TextLabel_2 = Instance.new("TextLabel")
local Tabs = Instance.new("Frame")
local UIGridLayout = Instance.new("UIGridLayout")
local TopBar = Instance.new("Frame")
local ImageLabel_2 = Instance.new("ImageLabel")
local LowerButtons = Instance.new("Frame")
local Misc_2 = Instance.new("Frame")
local UIGridLayout_2 = Instance.new("UIGridLayout")
local Friends = Instance.new("TextButton")
local TextLabel_3 = Instance.new("TextLabel")
local Profiles = Instance.new("TextButton")
local TextLabel_4 = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local TextLabel_5 = Instance.new("TextLabel")
local TextLabel_6 = Instance.new("TextLabel")
local Element = Instance.new("Folder")
local Toggle = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local Frame = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local TextLabel_7 = Instance.new("TextLabel")
local Module = Instance.new("Folder")
local Module1 = Instance.new("TextButton")
local TextLabel_8 = Instance.new("TextLabel")
local ImageLabel_3 = Instance.new("ImageLabel")
local Module1_2 = Instance.new("Frame")
local Config = Instance.new("Frame")
local UIListLayout_2 = Instance.new("UIListLayout")
local Data = Instance.new("Folder")
local Module_2 = Instance.new("Folder")
local Window_3 = Instance.new("Folder")
local Element_2 = Instance.new("Folder")
local Startup = Instance.new("Folder")
local Load = Instance.new("Frame")
local UICorner_7 = Instance.new("UICorner")
local Name = Instance.new("TextLabel")
local Sub = Instance.new("TextLabel")
local SubSublol = Instance.new("TextLabel")
local Status = Instance.new("TextLabel")

--Properties:

Lib.Name = "Lib"
Lib.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Lib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Asset.Name = "Asset"
Asset.Parent = Lib

Window.Name = "Window"
Window.Parent = Asset

Window_2.Name = "Window"
Window_2.Parent = Window
Window_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Window_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Window_2.BorderSizePixel = 0
Window_2.Position = UDim2.new(0.773353755, 0, 0.265957445, 0)
Window_2.Size = UDim2.new(0, 200, 0, 50)

UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = Window_2

BG.Name = "BG"
BG.Parent = Window_2
BG.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
BG.BorderColor3 = Color3.fromRGB(0, 0, 0)
BG.BorderSizePixel = 0
BG.Position = UDim2.new(-0.000995483366, 0, 0.835744619, 0)
BG.Size = UDim2.new(0, 200, 0, 381)

UICorner_2.CornerRadius = UDim.new(0, 6)
UICorner_2.Parent = BG

List.Name = "List"
List.Parent = Window_2
List.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
List.BackgroundTransparency = 2.000
List.BorderColor3 = Color3.fromRGB(0, 0, 0)
List.BorderSizePixel = 0
List.Position = UDim2.new(-1.52587887e-07, 0, 0.849694848, 0)
List.Size = UDim2.new(0, 200, 0, 381)

UIListLayout.Parent = List
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

Top.Name = "Top"
Top.Parent = Window_2
Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Top.BackgroundTransparency = 2.000
Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
Top.BorderSizePixel = 0
Top.Position = UDim2.new(-0.00337509159, 0, 0.0209127814, 0)
Top.Size = UDim2.new(0, 200, 0, 43)

WindowName.Name = "WindowName"
WindowName.Parent = Window_2
WindowName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WindowName.BackgroundTransparency = 1.000
WindowName.BorderColor3 = Color3.fromRGB(0, 0, 0)
WindowName.BorderSizePixel = 0
WindowName.Position = UDim2.new(0.0402233899, 0, 0.122222289, 0)
WindowName.Size = UDim2.new(0, 126, 0, 25)
WindowName.Font = Enum.Font.SourceSansSemibold
WindowName.Text = "TabName"
WindowName.TextColor3 = Color3.fromRGB(162, 162, 162)
WindowName.TextSize = 14.000
WindowName.TextXAlignment = Enum.TextXAlignment.Left

TabButton.Name = "TabButton"
TabButton.Parent = Window
TabButton.BackgroundColor3 = Color3.fromRGB(26, 25, 26)
TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TabButton.BorderSizePixel = 0
TabButton.Position = UDim2.new(0.774885118, 0, 0.195035458, 0)
TabButton.Size = UDim2.new(0, 200, 0, 50)
TabButton.Font = Enum.Font.SourceSans
TabButton.Text = " "
TabButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TabButton.TextSize = 14.000

ImageLabel.Parent = TabButton
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 2.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.0546927266, 0, 0.333333343, 0)
ImageLabel.Size = UDim2.new(0, 15, 0, 15)
ImageLabel.Image = "rbxassetid://5917963468"
ImageLabel.ImageColor3 = Color3.fromRGB(162, 162, 162)

TextLabel.Parent = TabButton
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.17522347, 0, 0.222222224, 0)
TextLabel.Size = UDim2.new(0, 126, 0, 25)
TextLabel.Font = Enum.Font.SourceSansSemibold
TextLabel.Text = "TabName"
TextLabel.TextColor3 = Color3.fromRGB(162, 162, 162)
TextLabel.TextSize = 14.000
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

Home.Name = "Home"
Home.Parent = Window
Home.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Home.BorderColor3 = Color3.fromRGB(0, 0, 0)
Home.BorderSizePixel = 0
Home.Position = UDim2.new(0.604134738, 0, 0.0354609936, 0)
Home.Size = UDim2.new(0, 200, 0, 50)

UICorner_3.CornerRadius = UDim.new(0, 6)
UICorner_3.Parent = Home

BG_2.Name = "BG"
BG_2.Parent = Home
BG_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
BG_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
BG_2.BorderSizePixel = 0
BG_2.Position = UDim2.new(-0.000995330862, 0, 0.855744302, 0)
BG_2.Size = UDim2.new(0, 200, 0, 381)

UICorner_4.CornerRadius = UDim.new(0, 6)
UICorner_4.Parent = BG_2

Misc.Name = "Misc"
Misc.Parent = Home
Misc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Misc.BackgroundTransparency = 2.000
Misc.BorderColor3 = Color3.fromRGB(0, 0, 0)
Misc.BorderSizePixel = 0
Misc.Position = UDim2.new(-0.00444442732, 0, 4.50655746, 0)
Misc.Size = UDim2.new(0, 200, 0, 17)

TextLabel_2.Parent = Misc
TextLabel_2.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.055223465, 0, -0.248366416, 0)
TextLabel_2.Size = UDim2.new(0, 126, 0, 25)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "MISC"
TextLabel_2.TextColor3 = Color3.fromRGB(115, 115, 115)
TextLabel_2.TextSize = 14.000
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

Tabs.Name = "Tabs"
Tabs.Parent = Home
Tabs.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Tabs.BackgroundTransparency = 2.000
Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
Tabs.BorderSizePixel = 0
Tabs.Position = UDim2.new(-1.52587887e-07, 0, 0.849695444, 0)
Tabs.Size = UDim2.new(0, 200, 0, 180)

UIGridLayout.Parent = Tabs
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 0)
UIGridLayout.CellSize = UDim2.new(0, 200, 0, 45)

TopBar.Name = "TopBar"
TopBar.Parent = Home
TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TopBar.BackgroundTransparency = 2.000
TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
TopBar.BorderSizePixel = 0
TopBar.Position = UDim2.new(-0.00337509159, 0, -0.0190872196, 0)
TopBar.Size = UDim2.new(0, 200, 0, 43)

ImageLabel_2.Parent = TopBar
ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_2.BorderSizePixel = 0
ImageLabel_2.Position = UDim2.new(0.834692717, 0, 0.308268875, 0)
ImageLabel_2.Size = UDim2.new(0, 20, 0, 20)
ImageLabel_2.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
ImageLabel_2.ScaleType = Enum.ScaleType.Crop

LowerButtons.Name = "LowerButtons"
LowerButtons.Parent = Home
LowerButtons.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LowerButtons.BackgroundTransparency = 1.000
LowerButtons.BorderColor3 = Color3.fromRGB(0, 0, 0)
LowerButtons.BorderSizePixel = 0
LowerButtons.Position = UDim2.new(0.000555572507, 0, 7.80655766, 0)
LowerButtons.Size = UDim2.new(0, 200, 0, 33)

Misc_2.Name = "Misc"
Misc_2.Parent = Home
Misc_2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Misc_2.BackgroundTransparency = 2.000
Misc_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Misc_2.BorderSizePixel = 0
Misc_2.Position = UDim2.new(-1.52587887e-07, 0, 4.94655752, 0)
Misc_2.Size = UDim2.new(0, 200, 0, 94)

UIGridLayout_2.Parent = Misc_2
UIGridLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout_2.CellPadding = UDim2.new(0, 0, 0, 0)
UIGridLayout_2.CellSize = UDim2.new(0, 200, 0, 45)

Friends.Name = "Friends"
Friends.Parent = Misc_2
Friends.BackgroundColor3 = Color3.fromRGB(26, 25, 26)
Friends.BorderColor3 = Color3.fromRGB(0, 0, 0)
Friends.BorderSizePixel = 0
Friends.Size = UDim2.new(0, 200, 0, 50)
Friends.Font = Enum.Font.SourceSans
Friends.Text = " "
Friends.TextColor3 = Color3.fromRGB(0, 0, 0)
Friends.TextSize = 14.000

TextLabel_3.Parent = Friends
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0.0852234662, 0, 0.222222224, 0)
TextLabel_3.Size = UDim2.new(0, 126, 0, 25)
TextLabel_3.Font = Enum.Font.SourceSans
TextLabel_3.Text = "Friends"
TextLabel_3.TextColor3 = Color3.fromRGB(162, 162, 162)
TextLabel_3.TextSize = 14.000
TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

Profiles.Name = "Profiles"
Profiles.Parent = Misc_2
Profiles.BackgroundColor3 = Color3.fromRGB(26, 25, 26)
Profiles.BorderColor3 = Color3.fromRGB(0, 0, 0)
Profiles.BorderSizePixel = 0
Profiles.Size = UDim2.new(0, 200, 0, 50)
Profiles.Font = Enum.Font.SourceSans
Profiles.Text = " "
Profiles.TextColor3 = Color3.fromRGB(0, 0, 0)
Profiles.TextSize = 14.000

TextLabel_4.Parent = Profiles
TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.BackgroundTransparency = 1.000
TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.Position = UDim2.new(0.0852234662, 0, 0.222222224, 0)
TextLabel_4.Size = UDim2.new(0, 126, 0, 25)
TextLabel_4.Font = Enum.Font.SourceSans
TextLabel_4.Text = "Profiles"
TextLabel_4.TextColor3 = Color3.fromRGB(162, 162, 162)
TextLabel_4.TextSize = 14.000
TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left

TextButton.Parent = Misc_2
TextButton.BackgroundColor3 = Color3.fromRGB(26, 25, 26)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Size = UDim2.new(0, 200, 0, 50)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = " "
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 14.000

TextLabel_5.Parent = TextButton
TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_5.BackgroundTransparency = 1.000
TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_5.BorderSizePixel = 0
TextLabel_5.Position = UDim2.new(0.0852234662, 0, 0.222222224, 0)
TextLabel_5.Size = UDim2.new(0, 126, 0, 25)
TextLabel_5.Font = Enum.Font.SourceSans
TextLabel_5.Text = "Targets"
TextLabel_5.TextColor3 = Color3.fromRGB(162, 162, 162)
TextLabel_5.TextSize = 14.000
TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left

TextLabel_6.Parent = Home
TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_6.BackgroundTransparency = 1.000
TextLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_6.BorderSizePixel = 0
TextLabel_6.Position = UDim2.new(0.0507791154, 0, 0.106024019, 0)
TextLabel_6.Size = UDim2.new(0, 116, 0, 30)
TextLabel_6.Font = Enum.Font.Unknown
TextLabel_6.Text = "Evo"
TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_6.TextScaled = true
TextLabel_6.TextSize = 30.000
TextLabel_6.TextWrapped = true
TextLabel_6.TextXAlignment = Enum.TextXAlignment.Left

Element.Name = "Element"
Element.Parent = Asset

Toggle.Name = "Toggle"
Toggle.Parent = Element
Toggle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle.BorderSizePixel = 0
Toggle.Position = UDim2.new(0.915135443, 0, 0.158817962, 0)
Toggle.Size = UDim2.new(0, 15, 0, 7)
Toggle.AutoButtonColor = false
Toggle.Font = Enum.Font.SourceSans
Toggle.Text = ""
Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
Toggle.TextSize = 14.000

UICorner_5.CornerRadius = UDim.new(0, 4)
UICorner_5.Parent = Toggle

Frame.Parent = Toggle
Frame.BackgroundColor3 = Color3.fromRGB(161, 161, 161)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.466666669, 0, 0, 0)
Frame.Size = UDim2.new(0, 8, 0, 7)

UICorner_6.CornerRadius = UDim.new(0, 4)
UICorner_6.Parent = Frame

TextLabel_7.Parent = Frame
TextLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_7.BackgroundTransparency = 1.000
TextLabel_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_7.BorderSizePixel = 0
TextLabel_7.Position = UDim2.new(-20.0941925, 0, -1.36063492, 0)
TextLabel_7.Size = UDim2.new(0, 142, 0, 25)
TextLabel_7.Font = Enum.Font.SourceSansSemibold
TextLabel_7.Text = "Behind check"
TextLabel_7.TextColor3 = Color3.fromRGB(162, 162, 162)
TextLabel_7.TextSize = 14.000
TextLabel_7.TextXAlignment = Enum.TextXAlignment.Right

Module.Name = "Module"
Module.Parent = Asset

Module1.Name = "Module1"
Module1.Parent = Module
Module1.BackgroundColor3 = Color3.fromRGB(26, 25, 26)
Module1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Module1.BorderSizePixel = 0
Module1.Position = UDim2.new(0.604494631, 0, 0.547281325, 0)
Module1.Size = UDim2.new(0, 200, 0, 45)
Module1.Font = Enum.Font.SourceSans
Module1.Text = " "
Module1.TextColor3 = Color3.fromRGB(0, 0, 0)
Module1.TextSize = 14.000

TextLabel_8.Parent = Module1
TextLabel_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_8.BackgroundTransparency = 1.000
TextLabel_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_8.BorderSizePixel = 0
TextLabel_8.Position = UDim2.new(0.0952235386, 0, 0.222222224, 0)
TextLabel_8.Size = UDim2.new(0, 126, 0, 25)
TextLabel_8.Font = Enum.Font.SourceSansSemibold
TextLabel_8.Text = "Example Module"
TextLabel_8.TextColor3 = Color3.fromRGB(162, 162, 162)
TextLabel_8.TextSize = 14.000
TextLabel_8.TextXAlignment = Enum.TextXAlignment.Left

ImageLabel_3.Parent = Module1
ImageLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel_3.BackgroundTransparency = 2.000
ImageLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_3.BorderSizePixel = 0
ImageLabel_3.Position = UDim2.new(0.884692669, 0, 0.244444445, 0)
ImageLabel_3.Size = UDim2.new(0, 15, 0, 23)
ImageLabel_3.Image = "http://www.roblox.com/asset/?id=17770076018"
ImageLabel_3.ImageColor3 = Color3.fromRGB(162, 162, 162)

Module1_2.Name = "Module1"
Module1_2.Parent = Module
Module1_2.BackgroundColor3 = Color3.fromRGB(26, 25, 26)
Module1_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Module1_2.BorderSizePixel = 0
Module1_2.Position = UDim2.new(0.604900479, 0, 0.612200081, 0)
Module1_2.Size = UDim2.new(0, 200, 0, 130)

Config.Name = "Config"
Config.Parent = Module1_2
Config.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Config.BackgroundTransparency = 2.000
Config.BorderColor3 = Color3.fromRGB(0, 0, 0)
Config.BorderSizePixel = 0
Config.Position = UDim2.new(0.0450000018, 0, 0.0769230798, 0)
Config.Size = UDim2.new(0, 180, 0, 110)

UIListLayout_2.Parent = Config
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

Data.Name = "Data"
Data.Parent = Asset

Module_2.Name = "Module"
Module_2.Parent = Data

Window_3.Name = "Window"
Window_3.Parent = Data

Element_2.Name = "Element"
Element_2.Parent = Data

Startup.Name = "Startup"
Startup.Parent = Asset

Load.Name = "Load"
Load.Parent = Startup
Load.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Load.BorderColor3 = Color3.fromRGB(0, 0, 0)
Load.BorderSizePixel = 0
Load.Position = UDim2.new(0.773353755, 0, 0.779890358, 0)
Load.Size = UDim2.new(0, 204, 0, 115)

UICorner_7.CornerRadius = UDim.new(0, 6)
UICorner_7.Parent = Load

Name.Name = "Name"
Name.Parent = Load
Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name.BackgroundTransparency = 1.000
Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
Name.BorderSizePixel = 0
Name.Position = UDim2.new(0.0272848792, 0, 0.0260450281, 0)
Name.Size = UDim2.new(0, 116, 0, 30)
Name.Font = Enum.Font.Unknown
Name.Text = "Evo,"
Name.TextColor3 = Color3.fromRGB(255, 255, 255)
Name.TextScaled = true
Name.TextSize = 30.000
Name.TextWrapped = true
Name.TextXAlignment = Enum.TextXAlignment.Left

Sub.Name = "Sub"
Sub.Parent = Load
Sub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Sub.BackgroundTransparency = 1.000
Sub.BorderColor3 = Color3.fromRGB(0, 0, 0)
Sub.BorderSizePixel = 0
Sub.Position = UDim2.new(0.0656818002, 0, 0.196135148, 0)
Sub.Size = UDim2.new(0, 126, 0, 25)
Sub.Font = Enum.Font.SourceSans
Sub.Text = "is loading."
Sub.TextColor3 = Color3.fromRGB(162, 162, 162)
Sub.TextSize = 14.000
Sub.TextXAlignment = Enum.TextXAlignment.Left

SubSublol.Name = "SubSublol"
SubSublol.Parent = Load
SubSublol.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SubSublol.BackgroundTransparency = 1.000
SubSublol.BorderColor3 = Color3.fromRGB(0, 0, 0)
SubSublol.BorderSizePixel = 0
SubSublol.Position = UDim2.new(0.0298874136, 0, 0.741618276, 0)
SubSublol.Size = UDim2.new(0, 126, 0, 25)
SubSublol.Font = Enum.Font.SourceSans
SubSublol.Text = "Please wait."
SubSublol.TextColor3 = Color3.fromRGB(162, 162, 162)
SubSublol.TextSize = 14.000
SubSublol.TextXAlignment = Enum.TextXAlignment.Left

Status.Name = "Status"
Status.Parent = Load
Status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Status.BackgroundTransparency = 1.000
Status.BorderColor3 = Color3.fromRGB(0, 0, 0)
Status.BorderSizePixel = 0
Status.Position = UDim2.new(0.387291402, 0, 0.385096818, 0)
Status.Size = UDim2.new(0, 113, 0, 25)
Status.Font = Enum.Font.SourceSans
Status.Text = "LOAD STATUS"
Status.TextColor3 = Color3.fromRGB(162, 162, 162)
Status.TextSize = 14.000
Status.TextXAlignment = Enum.TextXAlignment.Right
