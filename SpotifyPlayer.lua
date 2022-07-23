-- Gui to Lua
-- Version: 3.2

-- Instances:

local Spotify = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local UIPadding = Instance.new("UIPadding")
local Logo = Instance.new("ImageButton")
local Label = Instance.new("TextLabel")
local Version = Instance.new("TextLabel")
local Content = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local UIPadding_2 = Instance.new("UIPadding")
local Alt = Instance.new("TextLabel")
local Artist = Instance.new("TextLabel")
local UIPadding_3 = Instance.new("UIPadding")
local Alt_2 = Instance.new("TextLabel")
local Controller = Instance.new("Frame")
local Playback = Instance.new("Frame")
local Bar = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Value = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Button = Instance.new("TextButton")
local Current = Instance.new("TextLabel")
local Total = Instance.new("TextLabel")
local Controls = Instance.new("Frame")
local Play = Instance.new("ImageButton")
local Next = Instance.new("ImageButton")
local Loop = Instance.new("ImageButton")
local Prev = Instance.new("ImageButton")
local Shuffle = Instance.new("ImageButton")
local Pause = Instance.new("ImageButton")
local Cover = Instance.new("ImageButton")
local Cover_2 = Instance.new("ImageLabel")
local ArtistCover = Instance.new("ImageButton")
local UIGradient = Instance.new("UIGradient")
local ArtistCover_2 = Instance.new("ImageLabel")
local Token = Instance.new("ImageButton")
local TokenMain = Instance.new("Frame")
local Input = Instance.new("TextBox")
local UIPadding_4 = Instance.new("UIPadding")
local Label_2 = Instance.new("TextLabel")
local Close = Instance.new("TextButton")
local Description = Instance.new("TextLabel")
local UIPadding_5 = Instance.new("UIPadding")
local Link = Instance.new("TextButton")
local Submit = Instance.new("TextButton")
local Dim = Instance.new("Frame")
local ErrorBox = Instance.new("Frame")
local Label_3 = Instance.new("TextLabel")
local UIPadding_6 = Instance.new("UIPadding")
local MiniView = Instance.new("Frame")
local SongCover = Instance.new("ImageLabel")
local Title_2 = Instance.new("TextLabel")
local UIPadding_7 = Instance.new("UIPadding")
local Artist_2 = Instance.new("TextLabel")
local UIPadding_8 = Instance.new("UIPadding")
local Next_2 = Instance.new("ImageButton")
local UIPadding_9 = Instance.new("UIPadding")
local Play_2 = Instance.new("ImageButton")
local Pause_2 = Instance.new("ImageButton")
local Positions = Instance.new("ImageButton")
local PositionMain = Instance.new("Frame")
local Label_4 = Instance.new("TextLabel")
local Close_2 = Instance.new("TextButton")
local Options = Instance.new("ScrollingFrame")
local UIGridLayout = Instance.new("UIGridLayout")
local TopLeft = Instance.new("TextButton")
local Window = Instance.new("Frame")
local Position = Instance.new("Frame")
local TopCenter = Instance.new("TextButton")
local Window_2 = Instance.new("Frame")
local Position_2 = Instance.new("Frame")
local TopRight = Instance.new("TextButton")
local Window_3 = Instance.new("Frame")
local Position_3 = Instance.new("Frame")
local BottomLeft = Instance.new("TextButton")
local Window_4 = Instance.new("Frame")
local Position_4 = Instance.new("Frame")
local BottomCenter = Instance.new("TextButton")
local Window_5 = Instance.new("Frame")
local Position_5 = Instance.new("Frame")
local BottomRight = Instance.new("TextButton")
local Window_6 = Instance.new("Frame")
local Position_6 = Instance.new("Frame")
local CenterLeft = Instance.new("TextButton")
local Window_7 = Instance.new("Frame")
local Position_7 = Instance.new("Frame")
local Center = Instance.new("TextButton")
local Window_8 = Instance.new("Frame")
local Position_8 = Instance.new("Frame")
local CenterRight = Instance.new("TextButton")
local Window_9 = Instance.new("Frame")
local Position_9 = Instance.new("Frame")
local BottomLeftMini = Instance.new("TextButton")
local Window_10 = Instance.new("Frame")
local Position_10 = Instance.new("Frame")
local BottomCenterMini = Instance.new("TextButton")
local Window_11 = Instance.new("Frame")
local Position_11 = Instance.new("Frame")
local BottomRightMini = Instance.new("TextButton")
local Window_12 = Instance.new("Frame")
local Position_12 = Instance.new("Frame")
local CenterLeftMini = Instance.new("TextButton")
local Window_13 = Instance.new("Frame")
local Position_13 = Instance.new("Frame")
local CenterMini = Instance.new("TextButton")
local Window_14 = Instance.new("Frame")
local Position_14 = Instance.new("Frame")
local CenterRightMini = Instance.new("TextButton")
local Window_15 = Instance.new("Frame")
local Position_15 = Instance.new("Frame")
local SettingsMain = Instance.new("Frame")
local Label_5 = Instance.new("TextLabel")
local Close_3 = Instance.new("TextButton")
local Options_2 = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local TextBox = Instance.new("Frame")
local Label_6 = Instance.new("TextLabel")
local UIPadding_10 = Instance.new("UIPadding")
local Line = Instance.new("Frame")
local Box = Instance.new("TextBox")
local Button_2 = Instance.new("Frame")
local Label_7 = Instance.new("TextLabel")
local UIPadding_11 = Instance.new("UIPadding")
local Line_2 = Instance.new("Frame")
local Button_3 = Instance.new("TextButton")
local Settings = Instance.new("ImageButton")

if syn then
	syn.protect_gui(Spotify)
end

local NAME = ""
for _ = 1, 16 do
	NAME ..= string.char(math.random(97, 102))
end

local CONTAINER = (gethui and gethui()) or (get_hidden_ui and get_hidden_ui()) or game.CoreGui

--Properties:

Spotify.Name = NAME
Spotify.Parent = CONTAINER

Main.Name = "Main"
Main.Parent = Spotify
Main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Main.BorderColor3 = Color3.fromRGB(30, 215, 96)
Main.Position = UDim2.new(0.5, -150, 0.5, -100)
Main.Size = UDim2.new(0, 300, 0, 200)
Main.ZIndex = 0

UIPadding.Parent = Main
UIPadding.PaddingBottom = UDim.new(0, 5)
UIPadding.PaddingLeft = UDim.new(0, 5)
UIPadding.PaddingRight = UDim.new(0, 5)
UIPadding.PaddingTop = UDim.new(0, 5)

Logo.Name = "Logo"
Logo.Parent = Main
Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo.BackgroundTransparency = 1.000
Logo.BorderSizePixel = 0
Logo.Size = UDim2.new(0, 30, 0, 30)
Logo.Image = "rbxassetid://9622474485"
Logo.ScaleType = Enum.ScaleType.Slice

Label.Name = "Label"
Label.Parent = Main
Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label.BackgroundTransparency = 1.000
Label.BorderSizePixel = 0
Label.Position = UDim2.new(0, 35, 0, 0)
Label.Size = UDim2.new(0, 70, 0, 30)
Label.Font = Enum.Font.GothamBold
Label.Text = "Spotify"
Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Label.TextSize = 20.000
Label.TextXAlignment = Enum.TextXAlignment.Left

Version.Name = "Version"
Version.Parent = Label
Version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Version.BackgroundTransparency = 1.000
Version.BorderSizePixel = 0
Version.Position = UDim2.new(1, 0, 0, 0)
Version.Size = UDim2.new(0, 50, 0, 27)
Version.Font = Enum.Font.SourceSans
Version.Text = "v1.1"
Version.TextColor3 = Color3.fromRGB(75, 75, 75)
Version.TextSize = 14.000
Version.TextXAlignment = Enum.TextXAlignment.Left
Version.TextYAlignment = Enum.TextYAlignment.Bottom

Content.Name = "Content"
Content.Parent = Main
Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Content.BackgroundTransparency = 1.000
Content.BorderSizePixel = 0
Content.Position = UDim2.new(0, 0, 0, 35)
Content.Size = UDim2.new(1, 0, 1, -35)

Title.Name = "Title"
Title.Parent = Content
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0, 100, 0, 0)
Title.Size = UDim2.new(1, -100, 0, 20)
Title.Font = Enum.Font.GothamBold
Title.Text = "Song Title"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16.000
Title.TextXAlignment = Enum.TextXAlignment.Left

UIPadding_2.Parent = Title
UIPadding_2.PaddingLeft = UDim.new(0, 5)

Alt.Name = "Alt"
Alt.Parent = Title
Alt.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Alt.BorderSizePixel = 0
Alt.Size = UDim2.new(1, 0, 0, 20)
Alt.Visible = false
Alt.ZIndex = 2
Alt.Font = Enum.Font.GothamBold
Alt.Text = "Song Title"
Alt.TextColor3 = Color3.fromRGB(255, 255, 255)
Alt.TextSize = 16.000
Alt.TextXAlignment = Enum.TextXAlignment.Left

Artist.Name = "Artist"
Artist.Parent = Content
Artist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Artist.BackgroundTransparency = 1.000
Artist.BorderSizePixel = 0
Artist.Position = UDim2.new(0, 100, 0, 20)
Artist.Size = UDim2.new(1, -100, 0, 18)
Artist.Font = Enum.Font.Gotham
Artist.Text = "Artist"
Artist.TextColor3 = Color3.fromRGB(150, 150, 150)
Artist.TextSize = 14.000
Artist.TextXAlignment = Enum.TextXAlignment.Left

UIPadding_3.Parent = Artist
UIPadding_3.PaddingLeft = UDim.new(0, 5)

Alt_2.Name = "Alt"
Alt_2.Parent = Artist
Alt_2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Alt_2.BorderSizePixel = 0
Alt_2.Size = UDim2.new(1, 0, 0, 18)
Alt_2.Visible = false
Alt_2.ZIndex = 2
Alt_2.Font = Enum.Font.Gotham
Alt_2.Text = "Artist"
Alt_2.TextColor3 = Color3.fromRGB(150, 150, 150)
Alt_2.TextSize = 14.000
Alt_2.TextXAlignment = Enum.TextXAlignment.Left

Controller.Name = "Controller"
Controller.Parent = Content
Controller.AnchorPoint = Vector2.new(0, 1)
Controller.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Controller.BorderSizePixel = 0
Controller.Position = UDim2.new(0, 0, 1, 0)
Controller.Size = UDim2.new(1, 0, 0, 50)
Controller.ZIndex = 7

Playback.Name = "Playback"
Playback.Parent = Controller
Playback.AnchorPoint = Vector2.new(0, 1)
Playback.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Playback.BackgroundTransparency = 1.000
Playback.BorderSizePixel = 0
Playback.Position = UDim2.new(0, 0, 1, 0)
Playback.Size = UDim2.new(1, 0, 0, 15)
Playback.ZIndex = 7

Bar.Name = "Bar"
Bar.Parent = Playback
Bar.AnchorPoint = Vector2.new(0, 0.5)
Bar.BackgroundColor3 = Color3.fromRGB(94, 94, 94)
Bar.BorderSizePixel = 0
Bar.Position = UDim2.new(0, 5, 0.5, 0)
Bar.Size = UDim2.new(1, -10, 0, 5)
Bar.ZIndex = 8

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = Bar

Value.Name = "Value"
Value.Parent = Bar
Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Value.Size = UDim2.new(0.25, 0, 1, 0)
Value.ZIndex = 9

UICorner_2.CornerRadius = UDim.new(1, 0)
UICorner_2.Parent = Value

Button.Name = "Button"
Button.Parent = Playback
Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Button.BackgroundTransparency = 1.000
Button.BorderSizePixel = 0
Button.Size = UDim2.new(1, 0, 1, 0)
Button.ZIndex = 8
Button.Font = Enum.Font.SourceSans
Button.Text = ""
Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Button.TextSize = 14.000

Current.Name = "Current"
Current.Parent = Playback
Current.AnchorPoint = Vector2.new(0, 1)
Current.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Current.BackgroundTransparency = 1.000
Current.BorderSizePixel = 0
Current.Position = UDim2.new(0, 5, 0, 0)
Current.Size = UDim2.new(0, 30, 0, 10)
Current.ZIndex = 8
Current.Font = Enum.Font.Gotham
Current.Text = "0:00"
Current.TextColor3 = Color3.fromRGB(150, 150, 150)
Current.TextSize = 10.000
Current.TextXAlignment = Enum.TextXAlignment.Left

Total.Name = "Total"
Total.Parent = Playback
Total.AnchorPoint = Vector2.new(1, 1)
Total.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Total.BackgroundTransparency = 1.000
Total.BorderSizePixel = 0
Total.Position = UDim2.new(1, -5, 0, 0)
Total.Size = UDim2.new(0, 30, 0, 10)
Total.ZIndex = 8
Total.Font = Enum.Font.Gotham
Total.Text = "5:00"
Total.TextColor3 = Color3.fromRGB(150, 150, 150)
Total.TextSize = 10.000
Total.TextXAlignment = Enum.TextXAlignment.Right

Controls.Name = "Controls"
Controls.Parent = Controller
Controls.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Controls.BackgroundTransparency = 1.000
Controls.BorderSizePixel = 0
Controls.Position = UDim2.new(0, 0, 0, 5)
Controls.Size = UDim2.new(1, 0, 0, 30)
Controls.ZIndex = 7

Play.Name = "Play"
Play.Parent = Controls
Play.AnchorPoint = Vector2.new(0.5, 0.5)
Play.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Play.BackgroundTransparency = 1.000
Play.BorderSizePixel = 0
Play.Position = UDim2.new(0.5, 0, 0.5, 0)
Play.Size = UDim2.new(0, 30, 0, 30)
Play.Visible = false
Play.ZIndex = 8
Play.AutoButtonColor = false
Play.Image = "rbxassetid://9622475855"

Next.Name = "Next"
Next.Parent = Controls
Next.AnchorPoint = Vector2.new(0.5, 0.5)
Next.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Next.BackgroundTransparency = 1.000
Next.BorderSizePixel = 0
Next.Position = UDim2.new(0.5, 35, 0.5, 0)
Next.Size = UDim2.new(0, 20, 0, 20)
Next.ZIndex = 8
Next.AutoButtonColor = false
Next.Image = "rbxassetid://9607545497"
Next.ImageColor3 = Color3.fromRGB(170, 170, 170)

Loop.Name = "Loop"
Loop.Parent = Controls
Loop.AnchorPoint = Vector2.new(0.5, 0.5)
Loop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Loop.BackgroundTransparency = 1.000
Loop.BorderSizePixel = 0
Loop.Position = UDim2.new(0.5, 70, 0.5, 0)
Loop.Size = UDim2.new(0, 20, 0, 20)
Loop.ZIndex = 8
Loop.AutoButtonColor = false
Loop.Image = "rbxassetid://9607545605"
Loop.ImageColor3 = Color3.fromRGB(170, 170, 170)

Prev.Name = "Prev"
Prev.Parent = Controls
Prev.AnchorPoint = Vector2.new(0.5, 0.5)
Prev.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Prev.BackgroundTransparency = 1.000
Prev.BorderSizePixel = 0
Prev.Position = UDim2.new(0.5, -35, 0.5, 0)
Prev.Size = UDim2.new(0, 20, 0, 20)
Prev.ZIndex = 8
Prev.AutoButtonColor = false
Prev.Image = "rbxassetid://9622475488"
Prev.ImageColor3 = Color3.fromRGB(170, 170, 170)

Shuffle.Name = "Shuffle"
Shuffle.Parent = Controls
Shuffle.AnchorPoint = Vector2.new(0.5, 0.5)
Shuffle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Shuffle.BackgroundTransparency = 1.000
Shuffle.BorderSizePixel = 0
Shuffle.Position = UDim2.new(0.5, -70, 0.5, 0)
Shuffle.Size = UDim2.new(0, 20, 0, 20)
Shuffle.ZIndex = 8
Shuffle.AutoButtonColor = false
Shuffle.Image = "rbxassetid://9607545176"
Shuffle.ImageColor3 = Color3.fromRGB(170, 170, 170)

Pause.Name = "Pause"
Pause.Parent = Controls
Pause.AnchorPoint = Vector2.new(0.5, 0.5)
Pause.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Pause.BackgroundTransparency = 1.000
Pause.BorderSizePixel = 0
Pause.Position = UDim2.new(0.5, 0, 0.5, 0)
Pause.Size = UDim2.new(0, 30, 0, 30)
Pause.ZIndex = 8
Pause.AutoButtonColor = false
Pause.Image = "rbxassetid://9607545382"

Cover.Name = "Cover"
Cover.Parent = Content
Cover.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Cover.BorderSizePixel = 0
Cover.Size = UDim2.new(0, 100, 0, 100)
Cover.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

Cover_2.Name = "Cover"
Cover_2.Parent = Cover
Cover_2.AnchorPoint = Vector2.new(0.5, 0.5)
Cover_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Cover_2.BorderColor3 = Color3.fromRGB(30, 215, 96)
Cover_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Cover_2.Size = UDim2.new(1, 0, 1, 0)
Cover_2.Visible = false
Cover_2.ZIndex = 10
Cover_2.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

ArtistCover.Name = "ArtistCover"
ArtistCover.Parent = Content
ArtistCover.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ArtistCover.BorderSizePixel = 0
ArtistCover.Position = UDim2.new(0, 100, 0, 40)
ArtistCover.Size = UDim2.new(1, -100, 0, 60)
ArtistCover.AutoButtonColor = false
ArtistCover.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
ArtistCover.ScaleType = Enum.ScaleType.Crop

UIGradient.Rotation = 270
UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.20, 0.95), NumberSequenceKeypoint.new(0.30, 0.93), NumberSequenceKeypoint.new(1.00, 0.60)}
UIGradient.Parent = ArtistCover

ArtistCover_2.Name = "ArtistCover"
ArtistCover_2.Parent = ArtistCover
ArtistCover_2.AnchorPoint = Vector2.new(0.5, 0.5)
ArtistCover_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ArtistCover_2.BorderColor3 = Color3.fromRGB(30, 215, 96)
ArtistCover_2.Position = UDim2.new(0.5, 0, 0.5, 0)
ArtistCover_2.Size = UDim2.new(1, 0, 1, 0)
ArtistCover_2.Visible = false
ArtistCover_2.ZIndex = 10
ArtistCover_2.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
ArtistCover_2.ScaleType = Enum.ScaleType.Crop

Token.Name = "Token"
Token.Parent = Main
Token.AnchorPoint = Vector2.new(1, 0)
Token.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Token.BackgroundTransparency = 1.000
Token.BorderSizePixel = 0
Token.Position = UDim2.new(1, 0, 0, 0)
Token.Size = UDim2.new(0, 30, 0, 30)
Token.Image = "rbxassetid://9613882600"

TokenMain.Name = "TokenMain"
TokenMain.Parent = Main
TokenMain.AnchorPoint = Vector2.new(0.5, 0.5)
TokenMain.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TokenMain.BorderSizePixel = 0
TokenMain.Position = UDim2.new(0.5, 0, 0.5, 0)
TokenMain.Size = UDim2.new(0, 300, 0, 165)
TokenMain.Visible = false
TokenMain.ZIndex = 21

Input.Name = "Input"
Input.Parent = TokenMain
Input.AnchorPoint = Vector2.new(0, 1)
Input.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Input.BackgroundTransparency = 1.000
Input.BorderSizePixel = 0
Input.Position = UDim2.new(0, 0, 1, 0)
Input.Size = UDim2.new(1, -60, 0, 25)
Input.ZIndex = 22
Input.Font = Enum.Font.Gotham
Input.PlaceholderText = "Enter your token..."
Input.Text = ""
Input.TextColor3 = Color3.fromRGB(255, 255, 255)
Input.TextSize = 12.000
Input.TextXAlignment = Enum.TextXAlignment.Left

UIPadding_4.Parent = Input
UIPadding_4.PaddingLeft = UDim.new(0, 5)

Label_2.Name = "Label"
Label_2.Parent = TokenMain
Label_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label_2.BackgroundTransparency = 1.000
Label_2.BorderSizePixel = 0
Label_2.Size = UDim2.new(1, 0, 0, 25)
Label_2.ZIndex = 22
Label_2.Font = Enum.Font.GothamBold
Label_2.Text = "Spotify Token"
Label_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Label_2.TextSize = 14.000

Close.Name = "Close"
Close.Parent = TokenMain
Close.AnchorPoint = Vector2.new(1, 0)
Close.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Close.BorderColor3 = Color3.fromRGB(27, 42, 53)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(1, 0, 0, 0)
Close.Size = UDim2.new(0, 25, 0, 25)
Close.ZIndex = 22
Close.Font = Enum.Font.GothamBold
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 14.000

Description.Name = "Description"
Description.Parent = TokenMain
Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Description.BackgroundTransparency = 1.000
Description.BorderSizePixel = 0
Description.Position = UDim2.new(0, 0, 0, 25)
Description.Size = UDim2.new(1, 0, 0, 90)
Description.ZIndex = 22
Description.Font = Enum.Font.Gotham
Description.Text = "1. Click Link in the top left and paste the link in your browser\\n2. Click GET TOKEN and select the following:\\n          user-read-currently-playing\\n          user-read-playback-state\\n          user-modify-playback-state\\n3. After it refreshes, in the OAuth Token text box, select all and copy the token. Paste this token in the text box below and click Submit."
Description.TextColor3 = Color3.fromRGB(255, 255, 255)
Description.TextSize = 12.000
Description.TextWrapped = true
Description.TextXAlignment = Enum.TextXAlignment.Left
Description.TextYAlignment = Enum.TextYAlignment.Top

UIPadding_5.Parent = Description
UIPadding_5.PaddingBottom = UDim.new(0, 5)
UIPadding_5.PaddingLeft = UDim.new(0, 5)
UIPadding_5.PaddingRight = UDim.new(0, 5)
UIPadding_5.PaddingTop = UDim.new(0, 5)

Link.Name = "Link"
Link.Parent = TokenMain
Link.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Link.BorderSizePixel = 0
Link.Size = UDim2.new(0, 40, 0, 25)
Link.ZIndex = 22
Link.Font = Enum.Font.Gotham
Link.Text = "Link"
Link.TextColor3 = Color3.fromRGB(255, 255, 255)
Link.TextSize = 14.000

Submit.Name = "Submit"
Submit.Parent = TokenMain
Submit.AnchorPoint = Vector2.new(1, 1)
Submit.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Submit.BorderColor3 = Color3.fromRGB(27, 42, 53)
Submit.BorderSizePixel = 0
Submit.Position = UDim2.new(1, 0, 1, 0)
Submit.Size = UDim2.new(0, 60, 0, 25)
Submit.ZIndex = 22
Submit.Font = Enum.Font.Gotham
Submit.Text = "Submit"
Submit.TextColor3 = Color3.fromRGB(255, 255, 255)
Submit.TextSize = 14.000

Dim.Name = "Dim"
Dim.Parent = TokenMain
Dim.AnchorPoint = Vector2.new(0.5, 0.5)
Dim.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Dim.BackgroundTransparency = 0.600
Dim.BorderSizePixel = 0
Dim.Position = UDim2.new(0.5, 0, 0.5, 0)
Dim.Size = UDim2.new(1, 0, 1, 60)
Dim.ZIndex = 20

ErrorBox.Name = "ErrorBox"
ErrorBox.Parent = Main
ErrorBox.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
ErrorBox.BorderColor3 = Color3.fromRGB(255, 50, 50)
ErrorBox.Position = UDim2.new(0, -5, 1, 10)
ErrorBox.Size = UDim2.new(1, 10, 0, 16)
ErrorBox.Visible = false

Label_3.Name = "Label"
Label_3.Parent = ErrorBox
Label_3.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Label_3.BackgroundTransparency = 1.000
Label_3.BorderSizePixel = 0
Label_3.Size = UDim2.new(1, 0, 1, 0)
Label_3.Font = Enum.Font.Gotham
Label_3.Text = "Error message"
Label_3.TextColor3 = Color3.fromRGB(255, 50, 50)
Label_3.TextSize = 12.000

UIPadding_6.Parent = Label_3
UIPadding_6.PaddingBottom = UDim.new(0, 2)
UIPadding_6.PaddingTop = UDim.new(0, 2)

MiniView.Name = "MiniView"
MiniView.Parent = Main
MiniView.AnchorPoint = Vector2.new(0, 1)
MiniView.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MiniView.BorderSizePixel = 0
MiniView.Position = UDim2.new(0, 35, 1, 0)
MiniView.Size = UDim2.new(0, 255, 0, 30)
MiniView.Visible = false
MiniView.ZIndex = 2

SongCover.Name = "SongCover"
SongCover.Parent = MiniView
SongCover.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
SongCover.BorderSizePixel = 0
SongCover.Size = UDim2.new(0, 30, 0, 30)
SongCover.ZIndex = 2
SongCover.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

Title_2.Name = "Title"
Title_2.Parent = MiniView
Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_2.BackgroundTransparency = 1.000
Title_2.BorderSizePixel = 0
Title_2.Position = UDim2.new(0, 30, 0, 0)
Title_2.Size = UDim2.new(0, 160, 0, 16)
Title_2.ZIndex = 2
Title_2.Font = Enum.Font.Gotham
Title_2.Text = "Song Title"
Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_2.TextSize = 14.000
Title_2.TextXAlignment = Enum.TextXAlignment.Left

UIPadding_7.Parent = Title_2
UIPadding_7.PaddingLeft = UDim.new(0, 3)

Artist_2.Name = "Artist"
Artist_2.Parent = MiniView
Artist_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Artist_2.BackgroundTransparency = 1.000
Artist_2.BorderSizePixel = 0
Artist_2.Position = UDim2.new(0, 30, 0, 16)
Artist_2.Size = UDim2.new(0, 160, 0, 14)
Artist_2.ZIndex = 2
Artist_2.Font = Enum.Font.Gotham
Artist_2.Text = "Artist"
Artist_2.TextColor3 = Color3.fromRGB(150, 150, 150)
Artist_2.TextSize = 12.000
Artist_2.TextXAlignment = Enum.TextXAlignment.Left

UIPadding_8.Parent = Artist_2
UIPadding_8.PaddingLeft = UDim.new(0, 3)

Next_2.Name = "Next"
Next_2.Parent = MiniView
Next_2.AnchorPoint = Vector2.new(1, 0.5)
Next_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Next_2.BackgroundTransparency = 1.000
Next_2.BorderSizePixel = 0
Next_2.Position = UDim2.new(1, 0, 0.5, 0)
Next_2.Size = UDim2.new(0, 20, 0, 20)
Next_2.ZIndex = 2
Next_2.AutoButtonColor = false
Next_2.Image = "rbxassetid://9607545497"
Next_2.ImageColor3 = Color3.fromRGB(170, 170, 170)

UIPadding_9.Parent = MiniView
UIPadding_9.PaddingRight = UDim.new(0, 5)

Play_2.Name = "Play"
Play_2.Parent = MiniView
Play_2.AnchorPoint = Vector2.new(1, 0.5)
Play_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Play_2.BackgroundTransparency = 1.000
Play_2.BorderSizePixel = 0
Play_2.Position = UDim2.new(1, -25, 0.5, 0)
Play_2.Size = UDim2.new(0, 30, 0, 30)
Play_2.Visible = false
Play_2.ZIndex = 2
Play_2.AutoButtonColor = false
Play_2.Image = "rbxassetid://9622475855"

Pause_2.Name = "Pause"
Pause_2.Parent = MiniView
Pause_2.AnchorPoint = Vector2.new(1, 0.5)
Pause_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Pause_2.BackgroundTransparency = 1.000
Pause_2.BorderSizePixel = 0
Pause_2.Position = UDim2.new(1, -25, 0.5, 0)
Pause_2.Size = UDim2.new(0, 30, 0, 30)
Pause_2.ZIndex = 2
Pause_2.AutoButtonColor = false
Pause_2.Image = "rbxassetid://9607545382"

Positions.Name = "Positions"
Positions.Parent = Main
Positions.AnchorPoint = Vector2.new(1, 0)
Positions.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Positions.BackgroundTransparency = 1.000
Positions.BorderSizePixel = 0
Positions.Position = UDim2.new(1, -35, 0, 0)
Positions.Size = UDim2.new(0, 30, 0, 30)
Positions.Image = "rbxassetid://9634569804"

PositionMain.Name = "PositionMain"
PositionMain.Parent = Main
PositionMain.AnchorPoint = Vector2.new(0.5, 0.5)
PositionMain.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
PositionMain.BorderSizePixel = 0
PositionMain.Position = UDim2.new(0.5, 0, 0.5, 0)
PositionMain.Size = UDim2.new(0, 300, 0, 200)
PositionMain.Visible = false
PositionMain.ZIndex = 21

Label_4.Name = "Label"
Label_4.Parent = PositionMain
Label_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label_4.BackgroundTransparency = 1.000
Label_4.BorderSizePixel = 0
Label_4.Size = UDim2.new(1, 0, 0, 25)
Label_4.ZIndex = 22
Label_4.Font = Enum.Font.GothamBold
Label_4.Text = "UI Position"
Label_4.TextColor3 = Color3.fromRGB(255, 255, 255)
Label_4.TextSize = 14.000

Close_2.Name = "Close"
Close_2.Parent = PositionMain
Close_2.AnchorPoint = Vector2.new(1, 0)
Close_2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Close_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
Close_2.BorderSizePixel = 0
Close_2.Position = UDim2.new(1, 0, 0, 0)
Close_2.Size = UDim2.new(0, 25, 0, 25)
Close_2.ZIndex = 22
Close_2.Font = Enum.Font.GothamBold
Close_2.Text = "X"
Close_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Close_2.TextSize = 14.000

Options.Name = "Options"
Options.Parent = PositionMain
Options.Active = true
Options.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Options.BackgroundTransparency = 1.000
Options.BorderSizePixel = 0
Options.Position = UDim2.new(0, 0, 0, 25)
Options.Size = UDim2.new(1, 0, 1, -25)
Options.CanvasSize = UDim2.new(0, 0, 0, 500)
Options.ScrollBarThickness = 0

UIGridLayout.Parent = Options
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 0)

TopLeft.Name = "TopLeft"
TopLeft.Parent = Options
TopLeft.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TopLeft.BorderSizePixel = 0
TopLeft.LayoutOrder = 1
TopLeft.Size = UDim2.new(0, 200, 0, 50)
TopLeft.ZIndex = 22
TopLeft.Font = Enum.Font.SourceSans
TopLeft.Text = ""
TopLeft.TextColor3 = Color3.fromRGB(0, 0, 0)
TopLeft.TextSize = 14.000

Window.Name = "Window"
Window.Parent = TopLeft
Window.AnchorPoint = Vector2.new(0.5, 0.5)
Window.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Window.BorderColor3 = Color3.fromRGB(30, 215, 96)
Window.BorderSizePixel = 0
Window.Position = UDim2.new(0.5, 0, 0.5, 0)
Window.Size = UDim2.new(0, 90, 0, 90)
Window.ZIndex = 22

Position.Name = "Position"
Position.Parent = Window
Position.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Position.BorderSizePixel = 0
Position.Position = UDim2.new(0, 5, 0, 5)
Position.Size = UDim2.new(0, 30, 0, 25)
Position.ZIndex = 23

TopCenter.Name = "TopCenter"
TopCenter.Parent = Options
TopCenter.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TopCenter.BorderSizePixel = 0
TopCenter.LayoutOrder = 2
TopCenter.Size = UDim2.new(0, 200, 0, 50)
TopCenter.ZIndex = 22
TopCenter.Font = Enum.Font.SourceSans
TopCenter.Text = ""
TopCenter.TextColor3 = Color3.fromRGB(0, 0, 0)
TopCenter.TextSize = 14.000

Window_2.Name = "Window"
Window_2.Parent = TopCenter
Window_2.AnchorPoint = Vector2.new(0.5, 0.5)
Window_2.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Window_2.BorderColor3 = Color3.fromRGB(30, 215, 96)
Window_2.BorderSizePixel = 0
Window_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Window_2.Size = UDim2.new(0, 90, 0, 90)
Window_2.ZIndex = 22

Position_2.Name = "Position"
Position_2.Parent = Window_2
Position_2.AnchorPoint = Vector2.new(0.5, 0)
Position_2.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Position_2.BorderSizePixel = 0
Position_2.Position = UDim2.new(0.5, 0, 0, 5)
Position_2.Size = UDim2.new(0, 30, 0, 25)
Position_2.ZIndex = 23

TopRight.Name = "TopRight"
TopRight.Parent = Options
TopRight.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TopRight.BorderSizePixel = 0
TopRight.LayoutOrder = 3
TopRight.Size = UDim2.new(0, 200, 0, 50)
TopRight.ZIndex = 22
TopRight.Font = Enum.Font.SourceSans
TopRight.Text = ""
TopRight.TextColor3 = Color3.fromRGB(0, 0, 0)
TopRight.TextSize = 14.000

Window_3.Name = "Window"
Window_3.Parent = TopRight
Window_3.AnchorPoint = Vector2.new(0.5, 0.5)
Window_3.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Window_3.BorderColor3 = Color3.fromRGB(30, 215, 96)
Window_3.BorderSizePixel = 0
Window_3.Position = UDim2.new(0.5, 0, 0.5, 0)
Window_3.Size = UDim2.new(0, 90, 0, 90)
Window_3.ZIndex = 22

Position_3.Name = "Position"
Position_3.Parent = Window_3
Position_3.AnchorPoint = Vector2.new(1, 0)
Position_3.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Position_3.BorderSizePixel = 0
Position_3.Position = UDim2.new(1, -5, 0, 5)
Position_3.Size = UDim2.new(0, 30, 0, 25)
Position_3.ZIndex = 23

BottomLeft.Name = "BottomLeft"
BottomLeft.Parent = Options
BottomLeft.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
BottomLeft.BorderSizePixel = 0
BottomLeft.LayoutOrder = 7
BottomLeft.Size = UDim2.new(0, 200, 0, 50)
BottomLeft.ZIndex = 22
BottomLeft.Font = Enum.Font.SourceSans
BottomLeft.Text = ""
BottomLeft.TextColor3 = Color3.fromRGB(0, 0, 0)
BottomLeft.TextSize = 14.000

Window_4.Name = "Window"
Window_4.Parent = BottomLeft
Window_4.AnchorPoint = Vector2.new(0.5, 0.5)
Window_4.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Window_4.BorderColor3 = Color3.fromRGB(30, 215, 96)
Window_4.BorderSizePixel = 0
Window_4.Position = UDim2.new(0.5, 0, 0.5, 0)
Window_4.Size = UDim2.new(0, 90, 0, 90)
Window_4.ZIndex = 22

Position_4.Name = "Position"
Position_4.Parent = Window_4
Position_4.AnchorPoint = Vector2.new(0, 1)
Position_4.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Position_4.BorderSizePixel = 0
Position_4.Position = UDim2.new(0, 5, 1, -5)
Position_4.Size = UDim2.new(0, 30, 0, 25)
Position_4.ZIndex = 23

BottomCenter.Name = "BottomCenter"
BottomCenter.Parent = Options
BottomCenter.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
BottomCenter.BorderSizePixel = 0
BottomCenter.LayoutOrder = 8
BottomCenter.Size = UDim2.new(0, 200, 0, 50)
BottomCenter.ZIndex = 22
BottomCenter.Font = Enum.Font.SourceSans
BottomCenter.Text = ""
BottomCenter.TextColor3 = Color3.fromRGB(0, 0, 0)
BottomCenter.TextSize = 14.000

Window_5.Name = "Window"
Window_5.Parent = BottomCenter
Window_5.AnchorPoint = Vector2.new(0.5, 0.5)
Window_5.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Window_5.BorderColor3 = Color3.fromRGB(30, 215, 96)
Window_5.BorderSizePixel = 0
Window_5.Position = UDim2.new(0.5, 0, 0.5, 0)
Window_5.Size = UDim2.new(0, 90, 0, 90)
Window_5.ZIndex = 22

Position_5.Name = "Position"
Position_5.Parent = Window_5
Position_5.AnchorPoint = Vector2.new(0.5, 1)
Position_5.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Position_5.BorderSizePixel = 0
Position_5.Position = UDim2.new(0.5, 0, 1, -5)
Position_5.Size = UDim2.new(0, 30, 0, 25)
Position_5.ZIndex = 23

BottomRight.Name = "BottomRight"
BottomRight.Parent = Options
BottomRight.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
BottomRight.BorderSizePixel = 0
BottomRight.LayoutOrder = 9
BottomRight.Size = UDim2.new(0, 200, 0, 50)
BottomRight.ZIndex = 22
BottomRight.Font = Enum.Font.SourceSans
BottomRight.Text = ""
BottomRight.TextColor3 = Color3.fromRGB(0, 0, 0)
BottomRight.TextSize = 14.000

Window_6.Name = "Window"
Window_6.Parent = BottomRight
Window_6.AnchorPoint = Vector2.new(0.5, 0.5)
Window_6.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Window_6.BorderColor3 = Color3.fromRGB(30, 215, 96)
Window_6.BorderSizePixel = 0
Window_6.Position = UDim2.new(0.5, 0, 0.5, 0)
Window_6.Size = UDim2.new(0, 90, 0, 90)
Window_6.ZIndex = 22

Position_6.Name = "Position"
Position_6.Parent = Window_6
Position_6.AnchorPoint = Vector2.new(1, 1)
Position_6.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Position_6.BorderSizePixel = 0
Position_6.Position = UDim2.new(1, -5, 1, -5)
Position_6.Size = UDim2.new(0, 30, 0, 25)
Position_6.ZIndex = 23

CenterLeft.Name = "CenterLeft"
CenterLeft.Parent = Options
CenterLeft.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CenterLeft.BorderSizePixel = 0
CenterLeft.LayoutOrder = 4
CenterLeft.Size = UDim2.new(0, 200, 0, 50)
CenterLeft.ZIndex = 22
CenterLeft.Font = Enum.Font.SourceSans
CenterLeft.Text = ""
CenterLeft.TextColor3 = Color3.fromRGB(0, 0, 0)
CenterLeft.TextSize = 14.000

Window_7.Name = "Window"
Window_7.Parent = CenterLeft
Window_7.AnchorPoint = Vector2.new(0.5, 0.5)
Window_7.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Window_7.BorderColor3 = Color3.fromRGB(30, 215, 96)
Window_7.BorderSizePixel = 0
Window_7.Position = UDim2.new(0.5, 0, 0.5, 0)
Window_7.Size = UDim2.new(0, 90, 0, 90)
Window_7.ZIndex = 22

Position_7.Name = "Position"
Position_7.Parent = Window_7
Position_7.AnchorPoint = Vector2.new(0, 0.5)
Position_7.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Position_7.BorderSizePixel = 0
Position_7.Position = UDim2.new(0, 5, 0.5, 0)
Position_7.Size = UDim2.new(0, 30, 0, 25)
Position_7.ZIndex = 23

Center.Name = "Center"
Center.Parent = Options
Center.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Center.BorderSizePixel = 0
Center.LayoutOrder = 5
Center.Size = UDim2.new(0, 200, 0, 50)
Center.ZIndex = 22
Center.Font = Enum.Font.SourceSans
Center.Text = ""
Center.TextColor3 = Color3.fromRGB(0, 0, 0)
Center.TextSize = 14.000

Window_8.Name = "Window"
Window_8.Parent = Center
Window_8.AnchorPoint = Vector2.new(0.5, 0.5)
Window_8.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Window_8.BorderColor3 = Color3.fromRGB(30, 215, 96)
Window_8.Position = UDim2.new(0.5, 0, 0.5, 0)
Window_8.Size = UDim2.new(0, 90, 0, 90)
Window_8.ZIndex = 22

Position_8.Name = "Position"
Position_8.Parent = Window_8
Position_8.AnchorPoint = Vector2.new(0.5, 0.5)
Position_8.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Position_8.BorderSizePixel = 0
Position_8.Position = UDim2.new(0.5, 0, 0.5, 0)
Position_8.Size = UDim2.new(0, 30, 0, 25)
Position_8.ZIndex = 23

CenterRight.Name = "CenterRight"
CenterRight.Parent = Options
CenterRight.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CenterRight.BorderSizePixel = 0
CenterRight.LayoutOrder = 5
CenterRight.Size = UDim2.new(0, 200, 0, 50)
CenterRight.ZIndex = 22
CenterRight.Font = Enum.Font.SourceSans
CenterRight.Text = ""
CenterRight.TextColor3 = Color3.fromRGB(0, 0, 0)
CenterRight.TextSize = 14.000

Window_9.Name = "Window"
Window_9.Parent = CenterRight
Window_9.AnchorPoint = Vector2.new(0.5, 0.5)
Window_9.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Window_9.BorderColor3 = Color3.fromRGB(30, 215, 96)
Window_9.BorderSizePixel = 0
Window_9.Position = UDim2.new(0.5, 0, 0.5, 0)
Window_9.Size = UDim2.new(0, 90, 0, 90)
Window_9.ZIndex = 22

Position_9.Name = "Position"
Position_9.Parent = Window_9
Position_9.AnchorPoint = Vector2.new(1, 0.5)
Position_9.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Position_9.BorderSizePixel = 0
Position_9.Position = UDim2.new(1, -5, 0.5, 0)
Position_9.Size = UDim2.new(0, 30, 0, 25)
Position_9.ZIndex = 23

BottomLeftMini.Name = "BottomLeftMini"
BottomLeftMini.Parent = Options
BottomLeftMini.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
BottomLeftMini.BorderSizePixel = 0
BottomLeftMini.LayoutOrder = 13
BottomLeftMini.Size = UDim2.new(0, 200, 0, 50)
BottomLeftMini.ZIndex = 22
BottomLeftMini.Font = Enum.Font.SourceSans
BottomLeftMini.Text = ""
BottomLeftMini.TextColor3 = Color3.fromRGB(0, 0, 0)
BottomLeftMini.TextSize = 14.000

Window_10.Name = "Window"
Window_10.Parent = BottomLeftMini
Window_10.AnchorPoint = Vector2.new(0.5, 0.5)
Window_10.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Window_10.BorderColor3 = Color3.fromRGB(30, 215, 96)
Window_10.BorderSizePixel = 0
Window_10.Position = UDim2.new(0.5, 0, 0.5, 0)
Window_10.Size = UDim2.new(0, 90, 0, 90)
Window_10.ZIndex = 22

Position_10.Name = "Position"
Position_10.Parent = Window_10
Position_10.AnchorPoint = Vector2.new(0, 1)
Position_10.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Position_10.BorderSizePixel = 0
Position_10.Position = UDim2.new(0, 5, 1, -5)
Position_10.Size = UDim2.new(0, 30, 0, 10)
Position_10.ZIndex = 23

BottomCenterMini.Name = "BottomCenterMini"
BottomCenterMini.Parent = Options
BottomCenterMini.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
BottomCenterMini.BorderSizePixel = 0
BottomCenterMini.LayoutOrder = 14
BottomCenterMini.Size = UDim2.new(0, 200, 0, 50)
BottomCenterMini.ZIndex = 22
BottomCenterMini.Font = Enum.Font.SourceSans
BottomCenterMini.Text = ""
BottomCenterMini.TextColor3 = Color3.fromRGB(0, 0, 0)
BottomCenterMini.TextSize = 14.000

Window_11.Name = "Window"
Window_11.Parent = BottomCenterMini
Window_11.AnchorPoint = Vector2.new(0.5, 0.5)
Window_11.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Window_11.BorderColor3 = Color3.fromRGB(30, 215, 96)
Window_11.BorderSizePixel = 0
Window_11.Position = UDim2.new(0.5, 0, 0.5, 0)
Window_11.Size = UDim2.new(0, 90, 0, 90)
Window_11.ZIndex = 22

Position_11.Name = "Position"
Position_11.Parent = Window_11
Position_11.AnchorPoint = Vector2.new(0.5, 1)
Position_11.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Position_11.BorderSizePixel = 0
Position_11.Position = UDim2.new(0.5, 0, 1, -5)
Position_11.Size = UDim2.new(0, 30, 0, 10)
Position_11.ZIndex = 23

BottomRightMini.Name = "BottomRightMini"
BottomRightMini.Parent = Options
BottomRightMini.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
BottomRightMini.BorderSizePixel = 0
BottomRightMini.LayoutOrder = 15
BottomRightMini.Size = UDim2.new(0, 200, 0, 50)
BottomRightMini.ZIndex = 22
BottomRightMini.Font = Enum.Font.SourceSans
BottomRightMini.Text = ""
BottomRightMini.TextColor3 = Color3.fromRGB(0, 0, 0)
BottomRightMini.TextSize = 14.000

Window_12.Name = "Window"
Window_12.Parent = BottomRightMini
Window_12.AnchorPoint = Vector2.new(0.5, 0.5)
Window_12.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Window_12.BorderColor3 = Color3.fromRGB(30, 215, 96)
Window_12.BorderSizePixel = 0
Window_12.Position = UDim2.new(0.5, 0, 0.5, 0)
Window_12.Size = UDim2.new(0, 90, 0, 90)
Window_12.ZIndex = 22

Position_12.Name = "Position"
Position_12.Parent = Window_12
Position_12.AnchorPoint = Vector2.new(1, 1)
Position_12.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Position_12.BorderSizePixel = 0
Position_12.Position = UDim2.new(1, -5, 1, -5)
Position_12.Size = UDim2.new(0, 30, 0, 10)
Position_12.ZIndex = 23

CenterLeftMini.Name = "CenterLeftMini"
CenterLeftMini.Parent = Options
CenterLeftMini.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CenterLeftMini.BorderSizePixel = 0
CenterLeftMini.LayoutOrder = 10
CenterLeftMini.Size = UDim2.new(0, 200, 0, 50)
CenterLeftMini.ZIndex = 22
CenterLeftMini.Font = Enum.Font.SourceSans
CenterLeftMini.Text = ""
CenterLeftMini.TextColor3 = Color3.fromRGB(0, 0, 0)
CenterLeftMini.TextSize = 14.000

Window_13.Name = "Window"
Window_13.Parent = CenterLeftMini
Window_13.AnchorPoint = Vector2.new(0.5, 0.5)
Window_13.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Window_13.BorderColor3 = Color3.fromRGB(30, 215, 96)
Window_13.BorderSizePixel = 0
Window_13.Position = UDim2.new(0.5, 0, 0.5, 0)
Window_13.Size = UDim2.new(0, 90, 0, 90)
Window_13.ZIndex = 22

Position_13.Name = "Position"
Position_13.Parent = Window_13
Position_13.AnchorPoint = Vector2.new(0, 0.5)
Position_13.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Position_13.BorderSizePixel = 0
Position_13.Position = UDim2.new(0, 5, 0.5, 0)
Position_13.Size = UDim2.new(0, 30, 0, 10)
Position_13.ZIndex = 23

CenterMini.Name = "CenterMini"
CenterMini.Parent = Options
CenterMini.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CenterMini.BorderSizePixel = 0
CenterMini.LayoutOrder = 11
CenterMini.Size = UDim2.new(0, 200, 0, 50)
CenterMini.ZIndex = 22
CenterMini.Font = Enum.Font.SourceSans
CenterMini.Text = ""
CenterMini.TextColor3 = Color3.fromRGB(0, 0, 0)
CenterMini.TextSize = 14.000

Window_14.Name = "Window"
Window_14.Parent = CenterMini
Window_14.AnchorPoint = Vector2.new(0.5, 0.5)
Window_14.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Window_14.BorderColor3 = Color3.fromRGB(30, 215, 96)
Window_14.BorderSizePixel = 0
Window_14.Position = UDim2.new(0.5, 0, 0.5, 0)
Window_14.Size = UDim2.new(0, 90, 0, 90)
Window_14.ZIndex = 22

Position_14.Name = "Position"
Position_14.Parent = Window_14
Position_14.AnchorPoint = Vector2.new(0.5, 0.5)
Position_14.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Position_14.BorderSizePixel = 0
Position_14.Position = UDim2.new(0.5, 0, 0.5, 0)
Position_14.Size = UDim2.new(0, 30, 0, 10)
Position_14.ZIndex = 23

CenterRightMini.Name = "CenterRightMini"
CenterRightMini.Parent = Options
CenterRightMini.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CenterRightMini.BorderSizePixel = 0
CenterRightMini.LayoutOrder = 12
CenterRightMini.Size = UDim2.new(0, 200, 0, 50)
CenterRightMini.ZIndex = 22
CenterRightMini.Font = Enum.Font.SourceSans
CenterRightMini.Text = ""
CenterRightMini.TextColor3 = Color3.fromRGB(0, 0, 0)
CenterRightMini.TextSize = 14.000

Window_15.Name = "Window"
Window_15.Parent = CenterRightMini
Window_15.AnchorPoint = Vector2.new(0.5, 0.5)
Window_15.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Window_15.BorderColor3 = Color3.fromRGB(30, 215, 96)
Window_15.BorderSizePixel = 0
Window_15.Position = UDim2.new(0.5, 0, 0.5, 0)
Window_15.Size = UDim2.new(0, 90, 0, 90)
Window_15.ZIndex = 22

Position_15.Name = "Position"
Position_15.Parent = Window_15
Position_15.AnchorPoint = Vector2.new(1, 0.5)
Position_15.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
Position_15.BorderSizePixel = 0
Position_15.Position = UDim2.new(1, -5, 0.5, 0)
Position_15.Size = UDim2.new(0, 30, 0, 10)
Position_15.ZIndex = 23

SettingsMain.Name = "SettingsMain"
SettingsMain.Parent = Main
SettingsMain.AnchorPoint = Vector2.new(0.5, 0.5)
SettingsMain.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SettingsMain.BorderSizePixel = 0
SettingsMain.Position = UDim2.new(0.5, 0, 0.5, 0)
SettingsMain.Size = UDim2.new(0, 300, 0, 200)
SettingsMain.Visible = false
SettingsMain.ZIndex = 21

Label_5.Name = "Label"
Label_5.Parent = SettingsMain
Label_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label_5.BackgroundTransparency = 1.000
Label_5.BorderSizePixel = 0
Label_5.Size = UDim2.new(1, 0, 0, 25)
Label_5.ZIndex = 22
Label_5.Font = Enum.Font.GothamBold
Label_5.Text = "Settings"
Label_5.TextColor3 = Color3.fromRGB(255, 255, 255)
Label_5.TextSize = 14.000

Close_3.Name = "Close"
Close_3.Parent = SettingsMain
Close_3.AnchorPoint = Vector2.new(1, 0)
Close_3.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Close_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
Close_3.BorderSizePixel = 0
Close_3.Position = UDim2.new(1, 0, 0, 0)
Close_3.Size = UDim2.new(0, 25, 0, 25)
Close_3.ZIndex = 22
Close_3.Font = Enum.Font.GothamBold
Close_3.Text = "X"
Close_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Close_3.TextSize = 14.000

Options_2.Name = "Options"
Options_2.Parent = SettingsMain
Options_2.Active = true
Options_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Options_2.BackgroundTransparency = 1.000
Options_2.BorderSizePixel = 0
Options_2.Position = UDim2.new(0, 0, 0, 25)
Options_2.Size = UDim2.new(1, 0, 1, -25)
Options_2.CanvasSize = UDim2.new(0, 0, 0, 300)
Options_2.ScrollBarThickness = 0

UIListLayout.Parent = Options_2
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

TextBox.Name = "TextBox"
TextBox.Parent = Options_2
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.BorderSizePixel = 0
TextBox.Size = UDim2.new(1, 0, 0, 25)
TextBox.Visible = false
TextBox.ZIndex = 22

Label_6.Name = "Label"
Label_6.Parent = TextBox
Label_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label_6.BackgroundTransparency = 1.000
Label_6.BorderSizePixel = 0
Label_6.Size = UDim2.new(0, 200, 0, 25)
Label_6.ZIndex = 22
Label_6.Font = Enum.Font.Gotham
Label_6.TextColor3 = Color3.fromRGB(255, 255, 255)
Label_6.TextSize = 14.000
Label_6.TextXAlignment = Enum.TextXAlignment.Left

UIPadding_10.Parent = Label_6
UIPadding_10.PaddingLeft = UDim.new(0, 5)

Line.Name = "Line"
Line.Parent = TextBox
Line.AnchorPoint = Vector2.new(0, 1)
Line.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Line.BorderSizePixel = 0
Line.Position = UDim2.new(0, 5, 1, 0)
Line.Size = UDim2.new(1, -110, 0, 1)
Line.Visible = false
Line.ZIndex = 22

Box.Name = "Box"
Box.Parent = TextBox
Box.AnchorPoint = Vector2.new(1, 0)
Box.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Box.BorderSizePixel = 0
Box.Position = UDim2.new(1, 0, 0, 0)
Box.Size = UDim2.new(0, 100, 0, 25)
Box.ZIndex = 22
Box.Font = Enum.Font.Gotham
Box.PlaceholderText = "TextBox"
Box.Text = ""
Box.TextColor3 = Color3.fromRGB(255, 255, 255)
Box.TextSize = 14.000

Button_2.Name = "Button"
Button_2.Parent = Options_2
Button_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Button_2.BackgroundTransparency = 1.000
Button_2.BorderSizePixel = 0
Button_2.Size = UDim2.new(1, 0, 0, 25)
Button_2.Visible = false
Button_2.ZIndex = 22

Label_7.Name = "Label"
Label_7.Parent = Button_2
Label_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label_7.BackgroundTransparency = 1.000
Label_7.BorderSizePixel = 0
Label_7.Size = UDim2.new(0, 200, 0, 25)
Label_7.ZIndex = 22
Label_7.Font = Enum.Font.Gotham
Label_7.TextColor3 = Color3.fromRGB(255, 255, 255)
Label_7.TextSize = 14.000
Label_7.TextXAlignment = Enum.TextXAlignment.Left

UIPadding_11.Parent = Label_7
UIPadding_11.PaddingLeft = UDim.new(0, 5)

Line_2.Name = "Line"
Line_2.Parent = Button_2
Line_2.AnchorPoint = Vector2.new(0, 1)
Line_2.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Line_2.BorderSizePixel = 0
Line_2.Position = UDim2.new(0, 5, 1, 0)
Line_2.Size = UDim2.new(1, -110, 0, 1)
Line_2.Visible = false
Line_2.ZIndex = 22

Button_3.Name = "Button"
Button_3.Parent = Button_2
Button_3.AnchorPoint = Vector2.new(1, 0)
Button_3.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Button_3.BorderSizePixel = 0
Button_3.Position = UDim2.new(1, 0, 0, 0)
Button_3.Size = UDim2.new(0, 100, 0, 25)
Button_3.ZIndex = 22
Button_3.Font = Enum.Font.Gotham
Button_3.Text = "Activate"
Button_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Button_3.TextSize = 14.000

Settings.Name = "Settings"
Settings.Parent = Main
Settings.AnchorPoint = Vector2.new(1, 0)
Settings.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Settings.BackgroundTransparency = 1.000
Settings.BorderSizePixel = 0
Settings.Position = UDim2.new(1, -70, 0, 0)
Settings.Size = UDim2.new(0, 30, 0, 30)
Settings.Image = "rbxassetid://9622863785"

-- Scripts:

local function VLBVB_fake_script() -- Main.SmoothDrag 
	local script = Instance.new('LocalScript', Main)

	local uis = game:GetService("UserInputService")
	local ts = game:GetService("TweenService")
	
	local DRAG_SPEED = 0.075
	local DRAG_INFO = TweenInfo.new(DRAG_SPEED)
	
	function SmoothDrag(a)
		local toggle = nil
		local input = nil
		local start = nil
		local pos = nil
		local startpos = nil
	
		local function Update(i)
			local delta = i.Position - start
			local pos = UDim2.new(startpos.X.Scale, startpos.X.Offset + delta.X, startpos.Y.Scale, startpos.Y.Offset + delta.Y)
			ts:Create(a, DRAG_INFO, {Position = pos}):Play()
		end
	
		a.InputBegan:Connect(function(i)
			if i.UserInputType.Name == "MouseButton1" and uis:GetFocusedTextBox() == nil then
				toggle = true
				start = i.Position
				startpos = a.Position
				i.Changed:Connect(function()
					if i.UserInputState.Name == "End" then
						toggle = false
					end
				end)
			end
		end)
		a.InputChanged:Connect(function(i)
			if i.UserInputType.Name == "MouseMovement" then
				input = i
			end
		end)
		uis.InputChanged:Connect(function(i)
			if i == input and toggle then
				Update(i)
			end
		end)
	end
	
	SmoothDrag(script.Parent)
end
coroutine.wrap(VLBVB_fake_script)()
local function XHKNDO_fake_script() -- Spotify.LocalScript 
	local script = Instance.new('LocalScript', Spotify)

	-- zzerexx was here
	
	if SPOTIFY then SPOTIFY() end
	
	-- Variables
	local ENABLED = true
	local INTERVAL = 0.1
	
	local player = game:GetService("Players").LocalPlayer
	local uis = game:GetService("UserInputService")
	local ts = game:GetService("TweenService")
	local http = game:GetService("HttpService")
	local mouse = setmetatable({}, {
		__index = function(_, i)
			local m = player:GetMouse()
			return Vector2.new(m.X, m.Y - 36)[i]
		end
	})
	local white = Color3.new(1, 1, 1)
	local grey = Color3.fromRGB(170, 170, 170)
	local green = Color3.fromRGB(30, 215, 96)
	local usertoken = nil
	local currentcover = ""
	local currentartistcover = ""
	local shuffle = false
	local loop = false
	local playing = false
	local seeking = false
	local durationms = 0
	local errorvisible = false
	
	-- UI
	local main = script.Parent.Main
	local content = main.Content
	local cover = content.Cover
	local title = content.Title
	local artist = content.Artist
	local artistcover = content.ArtistCover
	local controls = content.Controller.Controls
	local playback = content.Controller.Playback
	local tokenmain = main.TokenMain
	local error = main.ErrorBox
	local mini = main.MiniView
	local posmain = main.PositionMain
	local settingsmain = main.SettingsMain
	
	-- set properties cuz gui to lua bad
	script.Parent.IgnoreGuiInset = true
	cover.AutoButtonColor = false
	artistcover.AutoButtonColor = false
	title.TextTruncate = Enum.TextTruncate.AtEnd
	artist.TextTruncate = Enum.TextTruncate.AtEnd
	mini.Title.TextTruncate = Enum.TextTruncate.AtEnd
	mini.Artist.TextTruncate = Enum.TextTruncate.AtEnd
	tokenmain.Input.TextTruncate = Enum.TextTruncate.AtEnd
	title.Alt.AutomaticSize = Enum.AutomaticSize.X
	artist.Alt.AutomaticSize = Enum.AutomaticSize.X
	tokenmain.Description.RichText = true
	--tokenmain.Description.Text = "<b>1.</b> Click <b><font color='#1ed760'>Link</font></b> in the top left and paste the link in your browser<br /><b>2.</b> Click <b><font color='#1ed760'>GET TOKEN</font></b> and select <b><font color='#1ed760'>user-read-currently-playing</font></b>, <b><font color='#1ed760'>user-read-playback-state</font></b>, and <b><font color='#1ed760'>user-modify-playback-state</font></b><br /><b>3.</b> After it refreshes, in the <b><font color='#1ed760'>OAuth Token</font></b> text box, select all and copy the token. Paste this token in the text box below and click <b><font color='#1ed760'>Submit</font></b>."
	tokenmain.Description.Text = [[<b>1.</b> Click <b><font color='#1ed760'>Link</font></b> in the top left and paste the link in your browser
	<b>2.</b> Click <b><font color='#1ed760'>GET TOKEN</font></b> and select the following:
	          <b><font color='#1ed760'>user-read-currently-playing</font></b>
	          <b><font color='#1ed760'>user-read-playback-state</font></b>
	          <b><font color='#1ed760'>user-modify-playback-state</font></b>
	<b>3.</b> After it refreshes, in the <b><font color='#1ed760'>OAuth Token</font></b> text box, select all and copy the token. Paste this token in the text box below and click <b><font color='#1ed760'>Submit</font></b>.]]
	error.AutomaticSize = Enum.AutomaticSize.Y
	error.Label.AutomaticSize = Enum.AutomaticSize.Y
	error.Label.RichText = true
	
	-- Functions
	local request = request or http_request or (syn and syn.request) or (getgenv and getgenv().http and getgenv().http.request) or nil
	local getcustomasset = getcustomasset or getsynasset or nil
	local function encode(a)
		return http:JSONEncode(a)
	end
	local function decode(a)
		return http:JSONDecode(a)
	end
	local function round(num, numDecimalPlaces)
		return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
	end
	local function convertms(ms)
		local seconds = round(ms / 1000, 2)
		local minutes = math.floor(seconds / 60)
		seconds = math.floor(seconds - (minutes * 60))
		
		if #tostring(seconds) < 2 then
			seconds = "0"..seconds
		end
		
		return string.format("%s:%s", minutes, seconds)
	end
	local function showerror(msg)
		if errorvisible then return end
		task.spawn(function()
			errorvisible = true
			error.Visible = true
			error.Label.Text = msg
			if msg == "Permissions missing" then
				error.Label.Text = "<b>Unable to update playback buttons</b>\nMake sure you select the following scopes:\n<b>user-read-currently-playing</b>\n<b>user-read-playback-state</b>\n<b>user-modify-playback-state</b>"
			end
			
			task.wait(3)
			error.Visible = false
			errorvisible = false
		end)
	end
	
	----
	
	local function MakeRequest(token, url, method)
		local t = {
			Url = "https://api.spotify.com/v1/"..url,
			Method = method ~= nil and method:upper() or "GET",
			Headers = {
				['Authorization'] = "Bearer "..(token or usertoken),
				['Content-Type'] = "application/json"
			}
		}
		if method == "POST" or method == "PUT" then -- fix dumb error
			t.Body = ""
		end
		local data = request(t)
		
		local body = data.Body ~= nil and decode(data.Body)
		if body and body.error then
			showerror(body.error.message)
			return
		end
	
		return (data and body) or ""
	end
	
	local function SetPreview(t)
		task.spawn(function()
			if getcustomasset then
				local folder = "Spotify Cache"
				if not isfolder(folder) then
					makefolder(folder)
				end
				
				local song = t.song.id
				local songpath = folder.."\\"..song..".jpeg"
				if not isfile(songpath) then
					writefile(songpath, game:HttpGet(t.images.songcover))
				end
				local songasset = getcustomasset(songpath)
				
				if currentcover ~= songpath then
					cover.Image = songasset
					mini.SongCover.Image = songasset
					currentcover = songpath
				end
				
				local artist = t.artists[1]
				local artistpath = folder.."\\"..artist.id..".jpeg"
				if not isfile(artistpath) then
					writefile(artistpath, game:HttpGet(t.images.artistcover))
				end
				local artistasset = getcustomasset(artistpath)
				
				if currentartistcover ~= artistpath then
					artistcover.Image = artistasset
					currentartistcover = artistpath
				end
			end
		end)
		
		local _title = t.song.name
		local _artist = table.concat(t.artistnames, ", ")
		title.Text = _title
		artist.Text = _artist
		title.Alt.Text = _title
		artist.Alt.Text = _artist
		mini.Title.Text = _title
		mini.Artist.Text = _artist
		
		local current = t.playback.current
		local total = t.playback.total
		--playback.Current.Text = convertms(current)
		playback.Total.Text = convertms(total)
		
		if not seeking then
			playback.Current.Text = convertms(current)
			local percent = current / total
			playback.Bar.Value.Size = UDim2.new(percent, 0, 1, 0)
		end
	end
	local function SetControlsPreview(t)
		shuffle = t.shuffle
		loop = t.loop == "context"
		playing = t.playing
		
		controls.Shuffle.ImageColor3 = shuffle and green or grey
		controls.Loop.ImageColor3 = loop and green or grey
		controls.Play.Visible = not playing
		controls.Pause.Visible = playing
		mini.Play.Visible = not playing
		mini.Pause.Visible = playing
	end
	local function CheckToken(token)
		local data = MakeRequest(token, "me")
		if data == nil then return end
		
		return rawget(data, "display_name")
	end
	
	-- Playback Controls
	local function Previous()
		MakeRequest(usertoken, "me/player/previous", "POST")
	end
	local function Next()
		MakeRequest(usertoken, "me/player/next", "POST")
	end
	local function Resume()
		MakeRequest(usertoken, "me/player/play", "PUT")
	end
	local function Pause()
		MakeRequest(usertoken, "me/player/pause", "PUT")
	end
	local function Shuffle(enabled)
		MakeRequest(usertoken, "me/player/shuffle?state="..tostring(enabled), "PUT")
	end
	local function Repeat(enabled)
		MakeRequest(usertoken, "me/player/repeat?state="..(enabled and "context" or "off"), "PUT")
	end
	local function Seek(ms)
		MakeRequest(usertoken, "me/player/seek?position_ms="..ms, "PUT")
	end
	local function Volume(percent)
		MakeRequest(usertoken, "me/player/volume?volume_percent="..percent, "PUT")
	end
	
	-- Retrieving playback data
	local function GetArtistCover(token, id)
		local data = MakeRequest(token, "artists/"..id)
		if not data or not data.images then return end
	
		return data.images[2].url
	end
	local function GetCurrentlyPlaying(token)
		local data = MakeRequest(token, "me/player/currently-playing")
		if not data or not data.item then return end
		
		local artists = {}
		local artistnames = {}
		if data.item.artists then
			for _,v in next, data.item.artists do
				table.insert(artists, {
					name = v.name,
					id = v.id
				})
				table.insert(artistnames, v.name)
			end
		end
		
		local images = {
			songcover = data.item.album.images[2].url,
			artistcover = GetArtistCover(token, artists[1].id)
		}
		
		local song = {
			name = data.item.name,
			id = data.item.id
		}
		
		local playback = {
			current = data.progress_ms,
			total = data.item.duration_ms,
			playing = data.is_playing
		}
		durationms = data.item.duration_ms
		
		return {
			token = token,
			artists = artists,
			artistnames = artistnames,
			images = images,
			song = song,
			playback = playback
		}
	end
	local function GetCurrentState(token)
		local data = MakeRequest(token, "me/player")
		if not data or not data.context then return end
		
		return {
			token = token,
			shuffle = data.shuffle_state,
			loop = data.repeat_state,
			volume = data.volume_percent,
			playing = data.is_playing
		}
	end
	
	-----
	
	local opened = true
	main.Logo.Activated:Connect(function()
		opened = not opened
		
		if opened then
			main.ClipsDescendants = true
			main:TweenSize(UDim2.new(0, 300, 0, 200), "Out", "Quart", 0.5, true)
			task.wait(0.1)
			if opened then
				mini.Visible = false
				content.Visible = true
				main.ClipsDescendants = false
			end
		else
			mini.Visible = true
			content.Visible = false
			tokenmain.Visible = false
			main:TweenSize(UDim2.new(0, 300, 0, 40), "Out", "Quart", 0.5, true)
		end
	end)
	main.Token.Activated:Connect(function()
		tokenmain.Visible = not tokenmain.Visible
		posmain.Visible = false
		settingsmain.Visible = false
	end)
	main.Positions.Activated:Connect(function()
		posmain.Visible = not posmain.Visible
		tokenmain.Visible = false
		settingsmain.Visible = false
	end)
	main.Settings.Activated:Connect(function()
		settingsmain.Visible = not settingsmain.Visible
		tokenmain.Visible = false
		posmain.Visible = false
	end)
	
	title.MouseEnter:Connect(function()
		title.Alt.Visible = true
	end)
	title.MouseLeave:Connect(function()
		title.Alt.Visible = false
	end)
	artist.MouseEnter:Connect(function()
		artist.Alt.Visible = true
	end)
	artist.MouseLeave:Connect(function()
		artist.Alt.Visible = false
	end)
	
	cover.MouseButton1Down:Connect(function()
		if not tokenmain.Visible then
			cover.Cover.Visible = true
			cover.Cover.Image = cover.Image
			cover.Cover:TweenSize(UDim2.new(0, 300, 0, 300), "Out", "Quart", 0.3, true)
		end
	end)
	cover.MouseButton1Up:Connect(function()
		if not tokenmain.Visible then
			cover.Cover:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Quart", 0.3, true, function()
				cover.Cover.Visible = false
			end)
		end
	end)
	
	artistcover.MouseButton1Down:Connect(function()
		if not tokenmain.Visible then
			artistcover.ArtistCover.Visible = true
			artistcover.ArtistCover.Image = artistcover.Image
			artistcover.ArtistCover:TweenSize(UDim2.new(0, 300, 0, 300), "Out", "Quart", 0.3, true)
		end 
	end)
	artistcover.MouseButton1Up:Connect(function()
		if not tokenmain.Visible then
			artistcover.ArtistCover:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Quart", 0.3, true, function()
				artistcover.ArtistCover.Visible = false
			end)
		end
	end)
	
	tokenmain.Close.Activated:Connect(function()
		tokenmain.Visible = false
	end)
	tokenmain.Link.Activated:Connect(function()
		if setclipboard then
			setclipboard("https://developer.spotify.com/console/get-users-currently-playing-track")
			tokenmain.Link.Text = "Copied!"
			task.wait(0.75)
			tokenmain.Link.Text = "Link"
		end
	end)
	tokenmain.Submit.Activated:Connect(function()
		local input = tokenmain.Input.Text
		local valid = CheckToken(input)
		tokenmain.Input.Text = valid and "Success!" or "Invalid token"
		usertoken = valid and input or usertoken
		task.wait(0.75)
		tokenmain.Input.Text = ""
	end)
	
	local positions = {
		TopLeft = UDim2.new(0, 10, 0, 46),
		TopCenter = UDim2.new(0.5, -150, 0, 10),
		TopRight = UDim2.new(1, -310, 0, 46),
		CenterLeft = UDim2.new(0, 10, 0.5, -100),
		Center = UDim2.new(0.5, -150, 0.5, -100),
		CenterRight = UDim2.new(1, -310, 0.5, -100),
		BottomLeft = UDim2.new(0, 10, 1, -210),
		BottomCenter = UDim2.new(0.5, -150, 1, -210),
		BottomRight = UDim2.new(1, -310, 1, -210),
		
		CenterLeftMini = UDim2.new(0, 10, 0.5, -50),
		CenterMini = UDim2.new(0.5, -150, 0.5, -50),
		CenterRightMini = UDim2.new(1, -310, 0.5, -50),
		BottomLeftMini = UDim2.new(0, 10, 1, -50),
		BottomCenterMini = UDim2.new(0.5, -150, 1, -50),
		BottomRightMini = UDim2.new(1, -310, 1, -50)
	}
	local options = posmain.Options
	posmain.Close.Activated:Connect(function()
		posmain.Visible = false
	end)
	for _,v in next, options:GetChildren() do
		if v:IsA("TextButton") then
			v.Activated:Connect(function()
				for _,v2 in next, options:GetChildren() do
					if v2:IsA("TextButton") then
						v2.Window.BorderSizePixel = 0
					end
				end
				v.Window.BorderSizePixel = 1
				
				main.Position = positions[v.Name]
			end)
		end
	end
	
	local optionss = settingsmain.Options
	local function newtextbox(t)
		local new = optionss.TextBox:Clone()
		new.Parent = optionss
		new.Visible = true
		new.Name = t.Text
		new.Label.Text = t.Text
		new.Box.PlaceholderText = t.Placeholder
		new.Box.FocusLost:Connect(function()
			t.Callback(new, new.Box.Text)
		end)
	end
	local function newbutton(t)
		local new = optionss.Button:Clone()
		new.Parent = optionss
		new.Visible = true
		new.Name = t.Text
		new.Label.Text = t.Text
		new.Button.Text = t.ButtonText or "Activate"
		new.Button.Activated:Connect(function()
			t.Callback(new)
		end)
	end
	
	settingsmain.Close.Activated:Connect(function()
		settingsmain.Visible = false
	end)
	
	newtextbox({
		Text = "Request Interval (ms)",
		Placeholder = "100",
		Callback = function(self, text)
			INTERVAL = text:gsub("%D", "") / 1000
			self.Box.Text = INTERVAL * 1000
		end
	})
	newbutton({
		Text = "Close Spotify Player",
		ButtonText = "Close",
		Callback = function()
			if SPOTIFY then
				SPOTIFY()
				getgenv().SPOTIFY = nil
			end
		end
	})
	
	controls.Shuffle.Activated:Connect(function()
		shuffle = not shuffle
		Shuffle(shuffle)
	end)
	controls.Prev.Activated:Connect(Previous)
	controls.Play.Activated:Connect(Resume)
	controls.Pause.Activated:Connect(Pause)
	controls.Next.Activated:Connect(Next)
	controls.Loop.Activated:Connect(function()
		loop = not loop
		Repeat(loop)
	end)
	
	mini.Play.Activated:Connect(Resume)
	mini.Pause.Activated:Connect(Pause)
	mini.Next.Activated:Connect(Next)
	
	local bar = playback.Bar
	local seekpercent = 1
	playback.Button.MouseButton1Down:Connect(function()
		seeking = true
		
		while true do
			if not seeking then break end
			
			local pos = math.clamp(mouse.X - bar.AbsolutePosition.X, 0, bar.AbsoluteSize.X)
			local value = (10 * (pos / bar.AbsoluteSize.X))
			local percent = value / 10
			bar.Value.Size = UDim2.new(percent, 0, 1, 0)
			playback.Current.TextColor3 = green
			playback.Current.Text = convertms(math.floor(durationms * percent))
	
			seekpercent = percent
			
			task.wait()
		end
		playback.Current.TextColor3 = Color3.fromRGB(150, 150, 150)
		Seek(math.floor(durationms * seekpercent))
	end)
	uis.InputEnded:Connect(function(i)
		if i.UserInputType.Name == "MouseButton1" then
			seeking = false
		end
	end)
	
	-----
	
	if getgenv then
		getgenv().SPOTIFY = function()
			ENABLED = false
			main.Parent:Destroy()
		end
	end
	
	while ENABLED do
		if not usertoken or not CheckToken(usertoken) then task.wait(0.5) continue end
		local currentlyplaying = GetCurrentlyPlaying(usertoken)
		local state = GetCurrentState(usertoken)
		
		if currentlyplaying ~= nil then
			SetPreview(currentlyplaying)
		end
		if state ~= nil then
			SetControlsPreview(state)
		end
		
		task.wait(INTERVAL or 0.1)
	end
end
coroutine.wrap(XHKNDO_fake_script)()
