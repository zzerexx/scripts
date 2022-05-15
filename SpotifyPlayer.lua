-- Gui to Lua
-- Version: 3.2

-- Instances:

local Spotify = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local UIPadding = Instance.new("UIPadding")
local Logo = Instance.new("ImageButton")
local Label = Instance.new("TextLabel")
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
local MiniView = Instance.new("Frame")
local SongCover = Instance.new("ImageLabel")
local Title_2 = Instance.new("TextLabel")
local UIPadding_6 = Instance.new("UIPadding")
local Artist_2 = Instance.new("TextLabel")
local UIPadding_7 = Instance.new("UIPadding")
local Next_2 = Instance.new("ImageButton")
local UIPadding_8 = Instance.new("UIPadding")
local Play_2 = Instance.new("ImageButton")
local Pause_2 = Instance.new("ImageButton")

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
ArtistCover.ImageRectOffset = Vector2.new(35, 35)
ArtistCover.ImageRectSize = Vector2.new(190, 190)
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
ArtistCover_2.ImageRectOffset = Vector2.new(35, 35)
ArtistCover_2.ImageRectSize = Vector2.new(190, 190)
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
TokenMain.Size = UDim2.new(0, 300, 0, 140)
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
Description.Text = "1. Click Link in the top left and paste the link in your browser\\n2. Click GET TOKEN and select user-read-currently-playing\\n3. After it refreshes, in the OAuth Token text box, select all and copy the token. Paste this token in the text box below and click Submit."
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

MiniView.Name = "MiniView"
MiniView.Parent = Main
MiniView.AnchorPoint = Vector2.new(0, 1)
MiniView.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MiniView.BorderSizePixel = 0
MiniView.Position = UDim2.new(0, 35, 1, 0)
MiniView.Size = UDim2.new(0, 255, 0, 30)
MiniView.Visible = false

SongCover.Name = "SongCover"
SongCover.Parent = MiniView
SongCover.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
SongCover.BorderSizePixel = 0
SongCover.Size = UDim2.new(0, 30, 0, 30)
SongCover.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

Title_2.Name = "Title"
Title_2.Parent = MiniView
Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_2.BackgroundTransparency = 1.000
Title_2.BorderSizePixel = 0
Title_2.Position = UDim2.new(0, 30, 0, 0)
Title_2.Size = UDim2.new(0, 160, 0, 16)
Title_2.Font = Enum.Font.Gotham
Title_2.Text = "Song Title"
Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_2.TextSize = 14.000
Title_2.TextXAlignment = Enum.TextXAlignment.Left

UIPadding_6.Parent = Title_2
UIPadding_6.PaddingLeft = UDim.new(0, 3)

Artist_2.Name = "Artist"
Artist_2.Parent = MiniView
Artist_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Artist_2.BackgroundTransparency = 1.000
Artist_2.BorderSizePixel = 0
Artist_2.Position = UDim2.new(0, 30, 0, 16)
Artist_2.Size = UDim2.new(0, 160, 0, 14)
Artist_2.Font = Enum.Font.Gotham
Artist_2.Text = "Artist"
Artist_2.TextColor3 = Color3.fromRGB(150, 150, 150)
Artist_2.TextSize = 12.000
Artist_2.TextXAlignment = Enum.TextXAlignment.Left

UIPadding_7.Parent = Artist_2
UIPadding_7.PaddingLeft = UDim.new(0, 3)

Next_2.Name = "Next"
Next_2.Parent = MiniView
Next_2.AnchorPoint = Vector2.new(1, 0.5)
Next_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Next_2.BackgroundTransparency = 1.000
Next_2.BorderSizePixel = 0
Next_2.Position = UDim2.new(1, 0, 0.5, 0)
Next_2.Size = UDim2.new(0, 20, 0, 20)
Next_2.AutoButtonColor = false
Next_2.Image = "rbxassetid://9607545497"
Next_2.ImageColor3 = Color3.fromRGB(170, 170, 170)

UIPadding_8.Parent = MiniView
UIPadding_8.PaddingRight = UDim.new(0, 5)

Play_2.Name = "Play"
Play_2.Parent = MiniView
Play_2.AnchorPoint = Vector2.new(1, 0.5)
Play_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Play_2.BackgroundTransparency = 1.000
Play_2.BorderSizePixel = 0
Play_2.Position = UDim2.new(1, -25, 0.5, 0)
Play_2.Size = UDim2.new(0, 30, 0, 30)
Play_2.Visible = false
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
Pause_2.AutoButtonColor = false
Pause_2.Image = "rbxassetid://9607545382"

-- Scripts:

local function PGKPH_fake_script() -- Main.SmoothDrag 
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
coroutine.wrap(PGKPH_fake_script)()
local function ESGXI_fake_script() -- Spotify.LocalScript 
	local script = Instance.new('LocalScript', Spotify)

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
	
	-- set properties cuz gui to lua bad
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
	tokenmain.Description.Text = "<b>1.</b> Click <b><font color='#1ed760'>Link</font></b> in the top left and paste the link in your browser<br /><b>2.</b> Click <b><font color='#1ed760'>GET TOKEN</font></b> and select <b><font color='#1ed760'>user-read-currently-playing</font></b><br /><b>3.</b> After it refreshes, in the <b><font color='#1ed760'>OAuth Token</font></b> text box, select all and copy the token. Paste this token in the text box below and click <b><font color='#1ed760'>Submit</font></b>."
	
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
	
	----
	
	local function MakeRequest(token, url, method)
		local t = {
			Url = "https://api.spotify.com/v1/"..url,
			Method = method and method:upper() or "GET",
			Headers = {
				['Authorization'] = "Bearer "..(token or usertoken),
				['Content-Type'] = "application/json"
			}
		}
		local data = request(t)
		
		local body = data.Body
		if body.error then
			error.Visible = true
			error.Label.Text = body.error.message
			return
		else
			error.Visible = false
		end
	
		return (data and body and body:gsub(" ", "") ~= "" and decode(body)) or ""
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
		
		return data.display_name ~= nil
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
			local value = (100 * (pos / bar.AbsoluteSize.X))
			local percent = value / 100
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
		
		task.wait(INTERVAL)
	end
end
coroutine.wrap(ESGXI_fake_script)()
