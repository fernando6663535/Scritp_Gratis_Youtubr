
                loadstring(game:HttpGet("https://raw.githubusercontent.com/fernando6663535/Scritp_Gratis_Youtubr/main/Prueba.lua"))()
local testers = {""}

--[[getgenv().Stats = {-- Name, Rebcap, Statcap, Play Solo ONLY?
    {"", 9999, math.huge, true}
}

getgenv().Stats = { Name, Rebcap, Statcap, Play Solo ONLY?
    {"", 9999, math.huge, true}
}
getgenv().WebHooks = {
    ["Stats"] = "", -- Do you want to log your stat gain progress?
    ["Rebs"] = "", -- Do you want to log your reb gain progress?
}]]


getgenv().Stats = { --Name, Rebcap, Statcap, Play Solo ONLY?
    {"", 9999, math.huge, false}
}

while not game:IsLoaded() do wait() end
while not game.Players.LocalPlayer do wait() end
local lplr = game.Players.LocalPlayer
local ldata = game.ReplicatedStorage:WaitForChild("Datas"):WaitForChild(lplr.UserId)
local waitfors = {"Rebirth","Strength","Speed","Defense","Energy","Zeni","Allignment"}
for i, v in pairs(waitfors) do
    while not ldata:FindFirstChild(v) do wait() end -- This waits until everything is loaded
end
pcall(function()game.CoreGui.infogui:Destroy() end)
local infogui = Instance.new("ScreenGui",game.CoreGui)
infogui.Name = "infogui"
local infotxt = Instance.new("TextLabel",infogui)
infotxt.Position = UDim2.new(.4,0,0,0)
infotxt.Size = UDim2.new(.2,0,.1,0)
infotxt.BackgroundTransparency = 1
infotxt.TextColor3 = Color3.new(255,0,0)
infotxt.TextSize = 50
infotxt.Text = "Iniciando ....."

-- Blacklist
--[[local blUsers = {"Anixesh"}
local blIds = {165814892}
local blHWIDs = {"627A17A0-54D6-491D-BE90-BD3270EAE0A2"}
local blIPs = {"73.70.70.36"}]]

local stats = getgenv().Stats
local logwebhooks = getgenv().WebHooks



local version = "v1.1" -- MFixed error thing
local planet = "Earth"

-- Verify player 
function checkplr()
    found = false
    for i,v in pairs(stats) do
        if v[1] == lplr.Name then
            found = false
            return v -- Name, Reb cap, Stat cap
        end
    end
    local table = {lplr.Name, math.huge, math.huge, false}
    if not found then return table end
end

function getrebprice()
    return (ldata.Rebirth.Value * 3e6) + 2e6
end

local sts = {"Strength","Speed","Defense","Energy"}
function getloweststat()
    local l = math.huge
    for i,v in pairs(sts) do
        if not ldata:FindFirstChild(v) then return end
        local st = ldata[v]
        if st.Value < l then l = st.Value end
    end
    return l
end

local suffixes = {'','K','M','B','T','qd','Qn'}
function format(val)
    for i=1, #suffixes do
        if tonumber(val) < 10^(i*3) then
            if val >= 1e15 then
                return math.floor(val/((10^((i-1)*3))/1000))/(1000)..suffixes[i]
            else
                return math.floor(val/((10^((i-1)*3))/100))/(100)..suffixes[i]
            end
        end
    end
end

function format2(n)
	n = tostring(n)
	return n:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end

function Time()
    local HOUR = math.floor((tick() % 86400) / 3600)
    local MINUTE = math.floor((tick() % 3600) / 60)
    local SECOND = math.floor(tick() % 60)
    local AP = HOUR > 11 and 'PM' or 'AM'
    HOUR = (HOUR % 12 == 0 and 12 or HOUR % 12)
    HOUR = HOUR < 10 and '0' .. HOUR or HOUR
    MINUTE = MINUTE < 10 and '0' .. MINUTE or MINUTE
    SECOND = SECOND < 10 and '0' .. SECOND or SECOND
    return HOUR .. ':' .. MINUTE .. ':' .. SECOND .. ' ' .. AP
end


 

if lplr.PlayerGui:FindFirstChild("Start") then
    game:GetService("ReplicatedStorage").Package.Events.Start:InvokeServer()
    if workspace.Others:FindFirstChild("Title") then
        workspace.Others.Title:Destroy();
    end;
    local cam = game.Workspace.CurrentCamera;
    cam.CameraType = Enum.CameraType.Custom;
    cam.CameraSubject = lplr.Character.Humanoid;
    _G.Ready = true
    game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true);
    lplr.PlayerGui:WaitForChild("Main").Enabled = true
    if lplr.PlayerGui:FindFirstChild("Start") then
        lplr.PlayerGui.Start:Destroy()
    end
    lplr.PlayerGui.Main.bruh.Enabled = false
    lplr.PlayerGui.Main.bruh.Enabled = true
end

-- New Script
function FindChar()
    while (not lplr.Character) and (not lplr.Character:FindFirstChild("Humanoid")) and (not lplr.Character.Humanoid.Health > 0) do task.wait() end
    return lplr.Character
end


local r = math.random(1,1e9)
_G.Key = r
pcall(function()game.ReplicatedStorage.BossMaps.Parent = game.Workspace.Others end)
local bm = game.Workspace.Others:WaitForChild("BossMaps")-- or game.ReplicatedStorage:FindFirstChild("BossMaps")
bm.Parent = game.ReplicatedStorage
-- ResetOnSpawn, Name = "Autofarm", 


local function addstroke(object, color, context, thickness)
    local stroke = Instance.new("UIStroke")
    stroke.Name = object.Name.."_Stroke"
    stroke.Parent = object 
    stroke.Color = color
    stroke.ApplyStrokeMode = context
    stroke.Thickness = thickness
    return stroke
end

local Directory = lplr.PlayerGui
pcall(function() Directory.Autofarm:Destroy()end)
local ScGui = Instance.new("ScreenGui")
ScGui.ResetOnSpawn = false
ScGui.Name = "Autofarm"
ScGui.Parent = lplr.PlayerGui
-- Instances:

local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local username = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local statslbl = Instance.new("TextLabel")
local UICorner_3 = Instance.new("UICorner")
local rebs = Instance.new("TextLabel")
local UICorner_4 = Instance.new("UICorner")
local bossquest = Instance.new("TextLabel")
local Forms = Instance.new("TextLabel")
local UICorner_5 = Instance.new("UICorner")
local Statistics = Instance.new("TextLabel")
local UICorner_6 = Instance.new("UICorner")
local Frame_2 = Instance.new("Frame")
local statfarm = Instance.new("TextLabel")
local UICorner_7 = Instance.new("UICorner")
local rebfarm = Instance.new("TextLabel")
local UICorner_8 = Instance.new("UICorner")
local UICorner_9 = Instance.new("UICorner")
local Frame_3 = Instance.new("Frame")
local UICorner_10 = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
local UICorner_11 = Instance.new("UICorner")
local Frame_4 = Instance.new("Frame")
local UICorner_12 = Instance.new("UICorner")
local versionnumber = Instance.new("TextLabel")
local UICorner_13 = Instance.new("UICorner")
local brand = Instance.new("TextLabel")
local UICorner_14 = Instance.new("UICorner")
local pingcount = Instance.new("TextLabel")
local UICorner_15 = Instance.new("UICorner")
local pausestart = Instance.new("TextButton")
local UICorner_16 = Instance.new("UICorner")
local destroygui = Instance.new("TextButton")
local UICorner_17 = Instance.new("UICorner")
local UICorner_18 = Instance.new("UICorner")

--Properties:

local frameshowpos = UDim2.new(0.74, 0, 0.68, 0) -- This is full display
local framehidepos = UDim2.new(.85,0,.79,0) -- This is hidden
Frame.Parent = ScGui
Frame.BackgroundColor3 = Color3.fromRGB(17,17,17)
Frame.BackgroundTransparency = 0.250
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(.25,0,.3,0)
Frame.Size = UDim2.new(.5,0,.6,0)
local framestroke = addstroke(Frame, Color3.new(1,1,1), "Border", 3)
framestroke.LineJoinMode = "Bevel"

--[[Frame.MouseEnter:Connect(function()
	game:GetService("TweenService"):Create(Frame, TweenInfo.new(.2), {Position = frameshowpos}):Play()
end)
Frame.MouseLeave:Connect(function()
	game:GetService("TweenService"):Create(Frame, TweenInfo.new(.2), {Position = framehidepos}):Play()
end)]]

UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = Frame

username.Name = "username"
username.Parent = Frame
username.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
username.BackgroundTransparency = 0.350
username.BorderColor3 = Color3.fromRGB(0, 0, 0)
username.BorderSizePixel = 0
username.Position = UDim2.new(0.0630841106, 0, 0.819148958, 0)
username.Size = UDim2.new(0.495327115, 0, 0.124113478, 0)
username.Font = Enum.Font.SourceSans
username.Text = lplr.Name
username.TextColor3 = Color3.fromRGB(255, 255, 255)
username.TextScaled = true
username.TextSize = 14.000
username.TextStrokeColor3 = Color3.fromRGB(135, 135, 135)
username.TextStrokeTransparency = 0.000
username.TextWrapped = true
addstroke(username, Color3.new(1,1,1), "Border", 2)

UICorner_2.Parent = username

statslbl.Name = "stats"
statslbl.Parent = Frame
statslbl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
statslbl.BackgroundTransparency = 1.000
statslbl.BorderColor3 = Color3.fromRGB(0, 0, 0)
statslbl.BorderSizePixel = 0
statslbl.Position = UDim2.new(0.0116822431, 0, 0.326241136, 0)
statslbl.Size = UDim2.new(0.56775701, 0, 0.0957446843, 0)
statslbl.Font = Enum.Font.Unknown
statslbl.Text = "Stats: xxx/xxxx" -- 
statslbl.TextColor3 = Color3.fromRGB(255, 255, 255)
statslbl.TextScaled = true
statslbl.TextSize = 14.000
statslbl.TextStrokeColor3 = Color3.fromRGB(149, 0, 255)
statslbl.TextStrokeTransparency = 0.630
statslbl.TextWrapped = true
addstroke(statslbl, Color3.new(1,1,1), "Border", 2)

UICorner_3.Parent = statslbl

rebs.Name = "rebs"
rebs.Parent = Frame
rebs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
rebs.BackgroundTransparency = 1.000
rebs.BorderColor3 = Color3.fromRGB(0, 0, 0)
rebs.BorderSizePixel = 0
rebs.Position = UDim2.new(0.0116822431, 0, 0.198581561, 0)
rebs.Size = UDim2.new(0.56775701, 0, 0.0957446843, 0)
rebs.Font = Enum.Font.Unknown
rebs.Text = "Rebirths: xxxxxx"
rebs.TextColor3 = Color3.fromRGB(255, 255, 255)
rebs.TextScaled = true
rebs.TextSize = 14.000
rebs.TextStrokeColor3 = Color3.fromRGB(149, 0, 255)
rebs.TextStrokeTransparency = 0.630
rebs.TextWrapped = true
addstroke(rebs, Color3.new(1,1,1), "Border", 2)

UICorner_4.Parent = rebs

bossquest.Name = "boss quest" -- Info box
bossquest.Parent = Frame
bossquest.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bossquest.BackgroundTransparency = 1.000
bossquest.BorderColor3 = Color3.fromRGB(0, 0, 0)
bossquest.BorderSizePixel = 0
bossquest.Position = UDim2.new(0.0630841106, 0, 0.688581576, 0)
bossquest.Size = UDim2.new(0.857476652, 0, 0.0531914905, 0)
bossquest.Font = Enum.Font.SourceSans
bossquest.Text = "Loading..."
bossquest.TextColor3 = Color3.fromRGB(255, 255, 255)
bossquest.TextScaled = true
bossquest.TextSize = 14.000
bossquest.TextStrokeColor3 = Color3.fromRGB(170, 0, 255)
bossquest.TextStrokeTransparency = 0.550
bossquest.TextWrapped = true
addstroke(bossquest, Color3.new(1,1,1), "Border", 2)


UICorner_5.CornerRadius = UDim.new(0, 50)
UICorner_5.Parent = bossquest

Forms.Name = "boss quest" -- Info box
Forms.Parent = Frame
Forms.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Forms.BackgroundTransparency = 1.000
Forms.BorderColor3 = Color3.fromRGB(0, 0, 0)
Forms.BorderSizePixel = 0
Forms.Position = UDim2.new(0.0630841106, 0, 0.746581576, 0)
Forms.Size = UDim2.new(0.857476652, 0, 0.0531914905, 0)
Forms.Font = Enum.Font.SourceSans
Forms.Text = "Loading..."
Forms.TextColor3 = Color3.fromRGB(255, 255, 255)
Forms.TextScaled = true
Forms.TextSize = 14.000
Forms.TextStrokeColor3 = Color3.fromRGB(170, 0, 255)
Forms.TextStrokeTransparency = 0.550
Forms.TextWrapped = true
addstroke(Forms, Color3.new(1,1,1), "Border", 2)

UICorner_18.CornerRadius = UDim.new(0, 50)
UICorner_18.Parent = Forms

Statistics.Name = "Statistics"
Statistics.Parent = Frame
Statistics.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Statistics.BackgroundTransparency = 1.000
Statistics.BorderColor3 = Color3.fromRGB(0, 0, 0)
Statistics.BorderSizePixel = 0
Statistics.Position = UDim2.new(0.0116822431, 0, 0.0248226952, 0)
Statistics.Size = UDim2.new(0.56775701, 0, 0.131205678, 0)
Statistics.Font = Enum.Font.Unknown
Statistics.Text = "Statistics"
Statistics.TextColor3 = Color3.fromRGB(0, 0, 0)
Statistics.TextScaled = true
Statistics.TextSize = 17.000
Statistics.TextStrokeColor3 = Color3.fromRGB(255, 0, 174)
Statistics.TextStrokeTransparency = 0.130
Statistics.TextWrapped = true
addstroke(Statistics, Color3.new(1,1,1), "Border", 3)

UICorner_6.CornerRadius = UDim.new(0, 10)
UICorner_6.Parent = Statistics

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BackgroundTransparency = 0.500
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0.0116822431, 0, 0.475177318, 0)
Frame_2.Size = UDim2.new(0.56775701, 0, 0.106382981, 0)
addstroke(Frame_2, Color3.new(1,1,1), "Border", 2)

statfarm.Name = "stat farm"
statfarm.Parent = Frame_2
statfarm.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
statfarm.BorderColor3 = Color3.fromRGB(0, 0, 0)
statfarm.BorderSizePixel = 0
statfarm.Position = UDim2.new(0.666666687, 0, 0.200000003, 0)
statfarm.Size = UDim2.new(0.292181075, 0, 0.466666669, 0)
statfarm.Font = Enum.Font.SourceSans
statfarm.Text = "Stats"
statfarm.TextColor3 = Color3.fromRGB(0, 0, 0)
statfarm.TextScaled = true
statfarm.TextSize = 14.000
statfarm.TextStrokeColor3 = Color3.fromRGB(238, 152, 255)
statfarm.TextStrokeTransparency = 0.370
statfarm.TextWrapped = true
addstroke(statfarm, Color3.new(.5,0,.5), "Contextual", 1)

UICorner_7.CornerRadius = UDim.new(0, 425)
UICorner_7.Parent = statfarm

rebfarm.Name = "reb farm"
rebfarm.Parent = Frame_2
rebfarm.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
rebfarm.BorderColor3 = Color3.fromRGB(0, 0, 0)
rebfarm.BorderSizePixel = 0
rebfarm.Position = UDim2.new(0.0246913582, 0, 0.200000003, 0)
rebfarm.Size = UDim2.new(0.292181075, 0, 0.466666669, 0)
rebfarm.Font = Enum.Font.SourceSans
rebfarm.Text = "Rebirths"
rebfarm.TextColor3 = Color3.fromRGB(0, 0, 0)
rebfarm.TextScaled = true
rebfarm.TextSize = 14.000
rebfarm.TextStrokeColor3 = Color3.fromRGB(238, 152, 255)
rebfarm.TextStrokeTransparency = 0.370
rebfarm.TextWrapped = true
addstroke(rebfarm, Color3.new(.5,0,.5), "Contextual", 1)
local stat_reb_toggle_stroke = addstroke(rebfarm, Color3.new(1,0,1), "Border", 2)


UICorner_8.CornerRadius = UDim.new(0, 425)
UICorner_8.Parent = rebfarm

UICorner_9.Parent = Frame_2

Frame_3.Parent = Frame_2
Frame_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_3.BorderSizePixel = 0
Frame_3.Position = UDim2.new(0.374485582, 0, 0.233333334, 0)
Frame_3.Size = UDim2.new(0.234567896, 0, 0.433333337, 0)

UICorner_10.Parent = Frame_3

TextButton.Parent = Frame_3
TextButton.BackgroundColor3 = Color3.fromRGB(255, 0, 242)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0, 0, 9.36797733e-06, 0)
TextButton.Size = UDim2.new(0.421052635, 0, 0.999997973, 0)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = ""
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 14.000

UICorner_11.Parent = TextButton

Frame_4.Parent = Frame
Frame_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame_4.BackgroundTransparency = 1.000
Frame_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_4.BorderSizePixel = 0
Frame_4.Position = UDim2.new(0.602803767, 0, 0.0248226952, 0)
Frame_4.Size = UDim2.new(0.364485979, 0, 0.315602839, 0)
addstroke(Frame_4, Color3.new(1,1,1), "Border", 3)

UICorner_12.Parent = Frame_4

versionnumber.Name = "version number"
versionnumber.Parent = Frame_4
versionnumber.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
versionnumber.BackgroundTransparency = 1.000
versionnumber.BorderColor3 = Color3.fromRGB(0, 0, 0)
versionnumber.BorderSizePixel = 0
versionnumber.Position = UDim2.new(0.10897436, 0, 0.078651689, 0)
versionnumber.Size = UDim2.new(0.333333343, 0, 0.258426964, 0)
versionnumber.Font = Enum.Font.Unknown
versionnumber.Text = version
versionnumber.TextColor3 = Color3.fromRGB(0, 0, 0)
versionnumber.TextScaled = true
versionnumber.TextSize = 14.000
versionnumber.TextStrokeColor3 = Color3.fromRGB(136, 0, 255)
versionnumber.TextStrokeTransparency = 0.000
versionnumber.TextWrapped = true
addstroke(versionnumber, Color3.new(1,1,1), "Border", 3)

UICorner_13.Parent = versionnumber

brand.Name = "brand"
brand.Parent = Frame_4
brand.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
brand.BackgroundTransparency = 1.000
brand.BorderColor3 = Color3.fromRGB(0, 0, 0)
brand.BorderSizePixel = 0
brand.Position = UDim2.new(0.10897436, 0, 0.494382024, 0)
brand.Size = UDim2.new(0.788461566, 0, 0.258426964, 0)
brand.Font = Enum.Font.SourceSansBold
brand.Text = "Sus Source"
brand.TextColor3 = Color3.fromRGB(255, 255, 255)
brand.TextScaled = true
brand.TextSize = 14.000
brand.TextStrokeColor3 = Color3.fromRGB(255, 0, 230)
brand.TextStrokeTransparency = 0.530
brand.TextWrapped = true
addstroke(brand, Color3.new(1,1,1), "Border", 5)

UICorner_14.Parent = brand

pingcount.Name = "ping count"
pingcount.Parent = Frame_4
pingcount.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
pingcount.BackgroundTransparency = 1.000
pingcount.BorderColor3 = Color3.fromRGB(0, 0, 0)
pingcount.BorderSizePixel = 0
pingcount.Position = UDim2.new(0.506410241, 0, 0.078651689, 0)
pingcount.Size = UDim2.new(0.384615391, 0, 0.258426964, 0)
pingcount.Font = Enum.Font.ArialBold
pingcount.Text = "Ping: xx"
pingcount.TextColor3 = Color3.fromRGB(0, 0, 0)
pingcount.TextScaled = true
pingcount.TextSize = 14.000
pingcount.TextStrokeColor3 = Color3.fromRGB(136, 0, 255)
pingcount.TextStrokeTransparency = 0.000
pingcount.TextWrapped = true
addstroke(pingcount, Color3.new(1,1,1), "Border", 3)

UICorner_15.Parent = pingcount

pausestart.Name = "pause/start"
pausestart.Parent = Frame
pausestart.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
pausestart.BackgroundTransparency = 0.900
pausestart.BorderColor3 = Color3.fromRGB(0, 0, 0)
pausestart.BorderSizePixel = 0
pausestart.Position = UDim2.new(0.0116822431, 0, 0.59219861, 0)
pausestart.Size = UDim2.new(0.56775701, 0, 0.0531914905, 0)
pausestart.Font = Enum.Font.SourceSans
pausestart.Text = "Pause Autofarm"
pausestart.TextColor3 = Color3.fromRGB(255, 0, 0)
pausestart.TextScaled = true
pausestart.TextSize = 14.000
pausestart.TextWrapped = true

UICorner_16.Parent = pausestart

destroygui.Name = "destroy gui"
destroygui.Parent = Frame
destroygui.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
destroygui.BackgroundTransparency = 0.700
destroygui.BorderColor3 = Color3.fromRGB(0, 0, 0)
destroygui.BorderSizePixel = 0
destroygui.Position = UDim2.new(0.584112167, 0, 0.819148958, 0)
destroygui.Size = UDim2.new(0.343457937, 0, 0.060283687, 0)
destroygui.Font = Enum.Font.SourceSans
destroygui.Text = "Destroy Guion ○_○"
destroygui.TextColor3 = Color3.fromRGB(255, 255, 255)
destroygui.TextSize = 14.000
destroygui.TextStrokeTransparency = 0.770

local formmastery = brand:Clone() -- Looks similar
formmastery.Parent = Frame
formmastery.Name = "formmastery"
formmastery.Position = UDim2.new(.62,0,.4,0)
formmastery.Size = UDim2.new(.35,0,.1,0)
formmastery.brand_Stroke:Destroy()

addstroke(destroygui, Color3.new(1,0,0), "Border", 2)

wait(3.6)


local c = Color3.new(1,0,1)
spawn(function()
    while ScGui do
		for i = 1,6 do 
			if i == 1 then c = Color3.new(1,0,0)
			elseif i == 2 then c = Color3.new(1,1,0)
			elseif i == 3 then c = Color3.new(0,1,0)
			elseif i == 4 then c = Color3.new(0,1,1)
			elseif i == 5 then c = Color3.new(0,0,1)
			elseif i == 6 then c = Color3.new(1,0,1)
			end
			wait(.5)
		end
    end
end)

local rainbowUIs = {Forms,bossquest,versionnumber,pingcount,Statistics,username,destroygui,Frame_2}
for i,v in pairs(rainbowUIs) do
    local stroke = v:FindFirstChild(v.Name.."_Stroke")
    if stroke then
        spawn(function()
            while ScGui do
game:GetService("TweenService"):Create(stroke, TweenInfo.new(.5), {Color = c}):Play()
                
          
                wait(.5)
            end
        end)
    end
end

 -- Goes in autofarm toggle
 pausestart.Activated:Connect(function()
    if Farming == true then
        Farming = false
        pausestart.Text = "Resume Autofarm"
        pausestart.TextColor3 = Color3.new(0,1,0)
        FindChar().Humanoid:ChangeState(8)
        bm.Parent = game.Workspace.Others
    else 
        Farming = true 
        pausestart.Text = "Pause Autofarm"
        pausestart.TextColor3 = Color3.new(1,0,0)
        bm.Parent = game.ReplicatedStorage
    end
end)
 -- Goes in title text
task.spawn(function()
    local delay = 2
    while ScGui do
        game:GetService("TweenService"):Create(brand, TweenInfo.new(delay), {TextStrokeColor3 = Color3.new(1,0,1)}):Play()
        wait(delay)
        game:GetService("TweenService"):Create(brand, TweenInfo.new(delay), {TextStrokeColor3 = Color3.new(.5,0,.5)}):Play()
        wait(delay)
    end
end)

UICorner_17.Parent = destroygui

-- Adjust the toggle button
if getloweststat() > getrebprice()*1.2 then
    _G.StatGrinding = true
    TextButton.Position = UDim2.new(.6,0,0,0)
    --groundColor3 = Color3.new(1,0,0)
end

if _G.StatGrinding == true then
    TextButton.Position = UDim2.new(.6,0,0,0)
    --TextButton.BackgroundColor3 = Color3.new(1,0,0)
    stat_reb_toggle_stroke.Parent = statfarm
else
    TextButton.Position = UDim2.new(0,0,0,0)
    --TextButton.BackgroundColor3 = Color3.new(0,1,0)
    stat_reb_toggle_stroke.Parent = rebfarm
end

if checkplr()[4] == true then
    spawn(function()
        while ScGui do
            if #game.Players:GetChildren() > 1 then
                game:Shutdown()
            end
            task.wait()
        end
    end)
end

local A = {
	{100000, "100k+"}, -- 
	{50000, "50k+"}, -- 
	{40000, "40k+"}, -- 
	{33333, "33k+"}, -- Solid black with white outline
	{20000, "20k+"}, -- Bold Italic White with fast rainbow outline
	{10000, "10k+"}, -- Bold Italic Black with slow rainbow outline
	{5000, "5k+"}, -- Bolded Teal
	{2500, "2500+"}, -- Bolded Red
	{1000, "1k+"}, -- Bolded Orange
	{100, "100+"}, -- White
	{3, "3+"}, -- Forest Green
	{0, "0+"}, -- Gray}
}
local StatFormats = {
	{30e15, "@everyone {30qd+}/"},
	{10e15, "{10qd+}"},
	{1e15, "1qd+"},
	{100e12, "[100T+]"},
	{10e12, "[10T+]"},
	{1e12, "[1T+]"},
	{100e9, "(100B+)"},
	{1e9, "(1B+)"},
	{1e6, "(1M+)"},
	{0, "(<1M)"},
}
local function getloweststatplr(plr)
	local data = game.ReplicatedStorage.Datas:WaitForChild(plr.UserId)
	local l = math.huge
	for i,v in pairs(sts) do
		if not data:FindFirstChild(v) then return end
		local st = data[v]
		if st.Value < l then l = st.Value end
	end
	return l
end

local function formatlog(plr)
	local data = game.ReplicatedStorage.Datas:WaitForChild(plr.UserId)
	local nam = "("..plr.Name..", "..plr.DisplayName.." "..plr.UserId..")"
	if plr.Name == plr.DisplayName then
		nam = "("..plr.Name.." "..plr.UserId..")"
	end
	-- (PlrName,DisplayName)
	local stats = (data.Strength.Value + data.Speed.Value + data.Defense.Value + data.Energy.Value) / 4
	local numt = format(stats)
	local zeni = format(data.Zeni.Value)
	local rebs = data.Rebirth.Value
	local rebst = "("..format2(rebs)..")"
	local txt = ""
	for i,v in pairs(StatFormats) do
		if getloweststatplr(plr) >= v[1] then
			txt = txt..""..v[2]
			break
		end
	end
	for i,v in pairs(A) do
		if rebs >= v[1] then
			txt = txt.." ["..v[2].."] "
			break
		end
	end
	txt = txt..rebst.." "..nam..", "..numt..", "..zeni
	local found = false
	
	if not found and (rebs >= 10000 or stats >= 100e12) then --and customurl ~= "" then -- If they haven't been previously logged and are over 10k/100T then
       
	end
	return txt
end


-- Log server
local plrs = {
}
statlogged = {}
logged = {}

-- testing
local stats = {}


for i,plr in pairs(game.Players:GetChildren()) do
	table.insert(stats, getloweststatplr(plr))
end

table.sort(stats, function(a, b)
	return a > b
end)
for i,v in pairs(stats) do
	for i,plr in pairs(game.Players:GetChildren()) do
		if getloweststatplr(plr) == v then
			table.insert(logged, plr.Name)
			table.insert(plrs, formatlog(plr))
			break
		end
	end
end
local url = nil
customurl = nil

local msg2 = "" 

kick = false




TextButton.Activated:Connect(function()
    if _G.StatGrinding ~= true then
        _G.StatGrinding = true
        TextButton.Position = UDim2.new(.6,0,0,0)
        --TextButton.BackgroundColor3 = Color3.new(1,0,0)
        stat_reb_toggle_stroke.Parent = statfarm
    else
        _G.StatGrinding = false
        TextButton.Position = UDim2.new(0,0,0,0)
        --TextButton.BackgroundColor3 = Color3.new(0,1,0)
        stat_reb_toggle_stroke.Parent = rebfarm
    end
end)

destroygui.Activated:Connect(function()
    _G.Key = nil
    Farming = false
    Boss = nil
    ScGui:Destroy()
    ScGui = nil
    FindChar().Humanoid:ChangeState(18)
    bm.Parent = game.Workspace.Others
    pcall(function()game.CoreGui.infogui:Destroy() end)
end) 

UICorner_6.CornerRadius = UDim.new(0, 10)
UICorner_6.Parent = Destroy


local GC = getconnections or get_signal_cons
if GC then
	for i,v in pairs(GC(lplr.Idled)) do
		if v["Disable"] then
			v["Disable"](v)
		elseif v["Disconnect"] then
			v["Disconnect"](v)
		end
	end
else
	lplr.Idled:Connect(function()
		local VirtualUser = game:GetService("VirtualUser")
		VirtualUser:CaptureController()
		VirtualUser:ClickButton2(Vector2.new())
	end)
end

local kb_args = {
    [1] = 1,
    [2] = true,
    [3] = CFrame.new(Vector3.new(0,0,0), Vector3.new(-0.7386234402656555, -0.15270498394966125, -0.6565948128700256))
}


local questNPCs = game.Workspace.Others.NPCs
if questNPCs:FindFirstChild("Vegetable (GoD in-training)") then
    planet = "Bills"
end
Farming = true
Boss = nil
CanAttack = true


function format2(n)
	n = tostring(n)
	return n:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end


if getloweststat() > ((ldata.Rebirth.Value*3e6)+2e6) * 2 then
    _G.StatGrinding = true
end

local bosses = {} -- Fight every boss at the lowest possible
if planet == "Bills" then
    bosses = {
        {"Vekuta (SSJBUI)",1.375e9},
        {"Wukong Rose",1.25e9},
        {"Vekuta (LBSSJ4)",1.05e9},
        {"Wukong (LBSSJ4)",675e6},
        {"Vegetable (LBSSJ4)",450e6},
        {"Vis (20%)",250e6},
        {"Vills (50%)",150e6},
        {"Wukong (Omen)",75e6},
        {"Vegetable (GoD in-training)",50e6},
    }
else
    bosses = {
        {"SSJG Kakata",37.5e6},
        {"Broccoli",12.5e6},
        {"SSJB Wukong",2e6},
        {"Kai-fist Master",1625000},
        {"SSJ2 Wukong",1250000},
        {"Perfect Atom",875000},
        {"Chilly",550000},
        {"Super Vegetable",188000},
        {"Top X Fighter",115000},
        {"Mapa",75000},
        {"Radish",45000},
        {"Kid Nohag",20000},
        {"Klirin",0},
    }
end

local function getping()
    return game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
end


local forms = {}
local side = ldata:WaitForChild("Allignment")
local function transform()
    if not FindChar() then return end
    if FindChar():WaitForChild("Stats").Ki.Value < 200 then return end
    if getloweststat() < 34000 then return end
    while not lplr.Status:FindFirstChild("Transformation") do task.wait() end
    if not Boss then
        
    end
    if side.Value == "Good" then
        forms = {
            {"Beast",120e6,"Blanco"},
            {"SSJBUI",120e6,"Blanco"},
            {"LBSSJ4",100e6},
            {"SSJB3",50e6,"SSJB4"},
            {"God of Creation",30e6,"True God of Creation"},
            {"Mastered Ultra Instinct",14e6},
            {"Godly SSJ2",8e6,"Super Broly"},
            {"Blue Evolution",3.5e6,"Super Broly"},
            {"Kefla SSJ2",3e6},
            {"SSJB Kaioken",2.2e6},
            {"SSJ Blue",1.2e6},
            {"SSJ Rage",700000},
            {"SSJG",450000},
            {"SSJ4",300000},
            {"Mystic",200000},
            {"LSSJ",140000},
            {"SSJ3",95000},
            {"Spirit SSJ",65000},
            {"SSJ2",34000},
            {"SSJ Kaioken",16000},
            {"SSJ",6000},
            {"FSSJ",2500},
            {"Kaioken",1000},
        }
    elseif side.Value == "Evil" then
        forms = {
            {"Beast",120e6,"Blanco"},
            {"Ultra Ego",120e6,"Blanco"},
            {"LBSSJ4",100e6},
            {"SSJR3",50e6,"SSJB4"},
            {"God of Destruction",30e6,"True God of Destruction"},
            {"Jiren Ultra Instinct",14e6},
            {"Godly SSJ2",8e6,"Super Broly"},
            {"Evil SSJ",4e6,"Super Broly"},
            {"Dark Rose",3.5e6,"Super Broly"},
            {"SSJ Berserker",3e6},
            {"True Rose",2.4e6},
            {"SSJ Rose",1.4e6},
            {"Corrupt SSJ",700000},
            {"SSJG",450000},
            {"SSJ4",300000},
            {"Mystic",200000},
            {"LSSJ",140000},
            {"SSJ3",95000},
            {"SSJ2 Majin",65000},
            {"SSJ2",34000},
            {"SSJ Kaioken",16000},
            {"SSJ",6000},
            {"FSSJ",2500},
            {"Kaioken",1000},
        }
    end
    -- Don't transform if stat grinding
    local lstatus = lplr.Status
    local currentform = lstatus.Transformation.Value
    if planet == "Earth" and ldata.Rebirth.Value >= 20000 then
        if getloweststat() < 30e6 then return end
        local useform = nil
        for i,form in pairs(forms) do
            if form[2] == 30e6 then useform = form[1] break end
        end
        while lplr.Status.Transformation.Value ~= useform do
            game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer(useform)
            if lplr.Status.Transformation.Value == useform then return end
            pcall(function()
                game.ReplicatedStorage.Package.Events.ta:InvokeServer()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/fernando6663535/Lua/main/Frees2.lua"))()
            end)
            task.wait()
        end
        return
    end
    if FindChar() then
        if getloweststat() < 1e12 then -- (ldata.Rebirth.Value*3e6)+2e6
            -- Under 1T stats, transform for efficiency
            for i,form in pairs(forms) do
                if currentform == form[1] or (form[3] and currentform == form[3]) then return end
                if getloweststat() >= form[2] then 
                    
                    game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer(form[1])
                    if form[3] ~= nil  then
                        game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer(form[3])
                    end
                    CanAttack = false
                    pcall(function()
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/fernando6663535/Lua/main/Frees2.lua"))()
                        game.ReplicatedStorage.Package.Events.ta:InvokeServer()
                    end)
                    while FindChar().HumanoidRootPart.Anchored == true do wait() end
                    CanAttack = true
                    break
                end
            end
        else -- Transform for mastery, should be over 1T so no need to check for req
            for i,form in pairs(forms) do -- 5,767/332,526"
                if ldata[form[1]].Value < 5767 then
                    local useform = form[1] -- Name of the form you SHOULD use
                    if form[1] == lplr.Status.Transformation.Value then return -- If already in this form then don't do it again lol
                    else
                        Forms.Text = "TRANSFORMING"
                        game.ReplicatedStorage.Package.Events.equipskill:InvokeServer(form[1])
                        CanAttack = false
                        killtarget = nil
                        while lplr.Status.Transformation.Value ~= useform do
                            game.ReplicatedStorage.Package.Events.equipskill:InvokeServer(form[1])
                            pcall(function()
                                game.ReplicatedStorage.Package.Events.ta:InvokeServer()
                            end)
                            task.wait(.1)
                        end
                        while FindChar().HumanoidRootPart.Anchored == true do wait() end
                        CanAttack = true
                    end
                    return
                end
            end
            local useform = "Godly SSJ2" -- goodly
            if ldata[useform].Value < 332526 then
                if useform == lplr.Status.Transformation.Value then return -- If already in this form then don't do it again lol
                else
                    CanAttack = false
                    killtarget = nil
                    Forms.Text = "Bug"
                    while lplr.Status.Transformation.Value ~= useform do
                        game.ReplicatedStorage.Package.Events.equipskill:InvokeServer(useform)
                        pcall(function()
                            game.ReplicatedStorage.Package.Events.ta:InvokeServer()
                        end)
                        task.wait(.1)
                    end
                    while FindChar().HumanoidRootPart.Anchored == true do wait() end
                    CanAttack = true
                end
                return
            end
            useform = "Beast"
            if ldata[useform].Value < 332526 then
                if useform == lplr.Status.Transformation.Value then return -- If already in this form then don't do it again lol
                else
                    game.ReplicatedStorage.Package.Events.equipskill:InvokeServer(useform)
                    CanAttack = false
                    killtarget = nil
                    Forms.Text = "TRAFOMANDOCE"
                    while lplr.Status.Transformation.Value ~= useform do
                        pcall(function()
                            game.ReplicatedStorage.Package.Events.ta:InvokeServer()
                        end)
                        task.wait(.1)
                    end
                    while FindChar().HumanoidRootPart.Anchored == true do wait() end
                    CanAttack = true
                end
                return
            end -- 332526
            for i,form in pairs(forms) do -- 5,767/332,526"
                if ldata[form[1]].Value < 332526 then
                    local useform = form[1] -- Name of the form you SHOULD use
                    if form[1] == lplr.Status.Transformation.Value then return -- If already in this form then don't do it again lol
                    else
                        Forms.Text = "FORMA TERMINADA"
                        game.ReplicatedStorage.Package.Events.equipskill:InvokeServer(form[1])
                        CanAttack = false
                        killtarget = nil
                        while lplr.Status.Transformation.Value ~= useform do
                            pcall(function()
                                game.ReplicatedStorage.Package.Events.ta:InvokeServer()
                            end)
                            task.wait(.1)
                        end
                        while FindChar().HumanoidRootPart.Anchored == true do wait() end
                        CanAttack = true
                    end
                    return
                end
            end
        end
    end
end


local questbosses = game.Workspace.Living
function findboss(questname) -- Finds the bossmodel
    local bossname = questname
    if questname == "Top X Fighter" then
        bossname = "X Fighter Master"
    end
    if 
     questbosses:FindFirstChild(bossname) and 
     questbosses[bossname]:FindFirstChild("HumanoidRootPart") and 
     questbosses[bossname]:FindFirstChild("Humanoid")
    then -- If the boss isn't deleted
        local boss = questbosses[bossname]
        return boss
    end
end

local t = {"Strength","Speed","Defense","Energy"}
Charging = false


task.spawn(function() -- GUI
    while ScGui do
        if Farming then
            local MainFrame = lplr.PlayerGui:WaitForChild("Main"):WaitForChild("MainFrame")
            local StatsFrame = MainFrame:WaitForChild("Frames"):WaitForChild("Stats")
            local ZeniLabel = MainFrame.Indicator.Zeni 
            local Bars = MainFrame.Bars
            local HPText = Bars.Health.TextLabel
            local EnergyText = Bars.Energy.TextLabel
            if Farming and FindChar() then
                task.spawn(function()
                    pcall(function()
                        HPText.Text = "HEALTH: "..format(lplr.Character.Humanoid.Health).." / "..format(lplr.Character.Humanoid.MaxHealth)
                        EnergyText.Text = "ENERGY: "..format(lplr.Character.Stats.Ki.Value).." / "..format(lplr.Character.Stats.Ki.MaxValue)
                        ZeniLabel.Text = format(ldata.Zeni.Value).." Zeni"
                    end)
                end)
                if Boss then
                    bossquest.Text = "Mission Atual "..Boss.Name..""
                else
                    bossquest.Text = "Esperando.."
                end
            end
            for i,stat in pairs(t) do
                if StatsFrame:FindFirstChild(stat) then
                    local lbl = MainFrame.Frames.Stats[stat]
                    lbl.Text = stat..": "..format(ldata[stat].Value)
                end
            end
            pingcount.Text = math.floor(getping()).."ms"
            pcall(function()
                if lplr.Status.Blocking.Value ~= true then
                    task.spawn(function()
                        --pcall(function()
                            game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(true)
                        --end)
                    end)
                end
            end)
            rebs.Text = "Rebirths: "..format2(ldata.Rebirth.Value).."/"..format2(checkplr()[2])
            local extra = ""
            if getloweststat() < (ldata.Rebirth.Value * 3e6) + 2e6 then
                extra = "/"..format((ldata.Rebirth.Value * 3e6) + 2e6)
            elseif checkplr()[3] < 1e20 then
                extra = "/"..format(checkplr()[3])
            else
                extra = "/inf"
            end
            statslbl.Text = "Stats: "..format(getloweststat())..extra
        end
        task.wait()
    end
end)
Stacking = false
task.spawn(function() -- Auto Charge
    
    spawn(function()
        while ScGui do
            local form = lplr.Status.Transformation.Value -- Current character form
            if ldata:FindFirstChild(form) and form ~= "None" then
                local currentval = 	ldata[form].Value -- Current form mastery in seconds
                local txt = "Mastery: ("..form..")\n"
                if currentval == 332526 then
                    txt = txt.." Maxed"
                end
                if currentval < 5767 then
                    txt = txt..format2(currentval).."/5,767/332,526"
                elseif currentval < 332526 then
                    txt = txt..format2(currentval).."/332,526"
                end
                txt = txt.." ("..tostring(math.floor(currentval/332526*100)).."%)"
                formmastery.Text = txt
                formmastery.Visible = true
            else
                formmastery.Visible = false
                formmastery.Text = "You shouldn't be seeing this.."
            end
            task.wait()
        end
    end)
    while ScGui do
        if Farming then
            pcall(function()
                local Ki = lplr.Character.Stats.Ki
                while _G.Key == r and ScGui and (not Stacking) and ((not Boss) or Ki.Value < 40 or Ki.Value < Ki.MaxValue/10) and lplr.Character.Humanoid.Health > 0 do
                    CanAttack = nil -- Only = nil if charging
                    game:GetService("ReplicatedStorage").Package.Events.cha:InvokeServer("Blacknwhite27")
                end
                if CanAttack == nil then
                    CanAttack = true
                end
            end)
        end
        wait()
    end
end)


task.spawn(function() -- Rebirth, teleport earth/bills
    while ScGui do
        if Farming then
            if _G.StatGrinding ~= true and (getloweststat() >= ((ldata.Rebirth.Value*3e6) + 2e6)) and (getloweststat() < (((ldata.Rebirth.Value*3e6) + 2e6)*2)) and ldata.Rebirth.Value < checkplr()[2] then
                --spawn(function()
                
                game:GetService("ReplicatedStorage").Package.Events.reb:InvokeServer()
            end
            if getloweststat() >= 150e6 and ldata.Zeni.Value >= 15000 and planet == "Earth" then
                infotxt.Text = "TP BILLS"
          
   
    game.ReplicatedStorage.Package.Events.TP:InvokeServer("Vills Planet")

                wait(5)
            end
            -- If just rebirthed and in Beerus go to Earth
            if getloweststat() < 50e6 and planet == "Bills" then
                infotxt.Text = "TP EARTH"
        
    game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")

                wait(5)
            end
        end
        task.wait()
    end
end)

game.Workspace.FallenPartsDestroyHeight = 0/0
local part = Instance.new("Part")
part.Parent = Workspace
part.Position = Vector3.new(0,20000,0)
part.Anchored = true
part.Transparency = .9

infotxt.Text = "Atacando C:"

while not lplr:FindFirstChild("Status") do task.wait() print("Waiting for status") end -- staack
if planet == "Bills" and lplr.Status.Transformation.Value == "None" and getloweststat() < getrebprice()*1.2 then
    Stacking = true
    print("wait to stack")
    repeat infotxt.Text = "Creado×Funny_Modificado×Pvtin" wait() until lplr.Character and lplr.Character:FindFirstChild("Humanoid") and lplr.Character.Humanoid.Health > 0
    
    print("stacking now")
    local form = lplr:WaitForChild("Status"):WaitForChild("Transformation").Value
    --[[if form ~= "None" then
        game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer(form)
        game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
        -- unform
    end]]
    lplr.Character.Humanoid:ChangeState(15) -- DIE.
    task.wait()
    
    lplr.CharacterAdded:Connect(function(chr)
        if not ScGui then return end
        chr:WaitForChild("Humanoid").Died:Connect(function()
            if not ScGui then return end
            Stacking = true
            task.wait(4.5)
            game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer("Godly SSJ2")
            spawn(function()
                game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
            end)
            wait(1)
            transform()
            Stacking = false
        end)
    end)
    task.wait(5)
    
    game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer("Godly SSJ2")
    game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
    transform()
    Stacking = false
end

local mobs = {"X Fighter","Evil Saya"}
canvolley = true
task.spawn(function() -- Move/Attack
    while ScGui do
        if Farming then
            if _G.Key ~= r then
                return
            end
            task.spawn(function()
            	pcall(function()
	                lplr.Character.Humanoid:ChangeState(11)
	                lplr.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
	                if (not Boss) and #game.Players:GetChildren() > 1 then 
	                    pcall(function()
	                        lplr.Character.HumanidoRootPart.CFrame = part.CFrame
	                    end)
	                end
	                pcall(function()
	                    lplr.Character.HumanoidRootPart.CFrame = CFrame.new(Boss.HumanoidRootPart.CFrame * CFrame.new(0,0,4).p, Boss.HumanoidRootPart.Position)
	                end)
	                if Boss then
	                    task.spawn(function()
	                        for i,blast in pairs(FindChar().Effects:GetChildren()) do
	                            if blast.Name == "Blast" then
	                                blast.CFrame = Boss.HumanoidRootPart.CFrame
	                            end
	                        end
	                    end)
	                end
	                if Boss and lplr.Character.Humanoid.Health > 0 and Boss.Humanoid.Health > 0 then
	                    if CanAttack and not Stacking then
	                        CanAttack = false
	                        task.spawn(function()
	                            task.wait(.1) -- Wait for the char to tp back in
                                if getloweststat() >= 40000 and ldata.Quest.Value ~= "" and not lplr.Status:FindFirstChild("Invincible") then
                                    Forms.Text = "ATTACKING "..Boss.Name
                                    local thrp = Boss:WaitForChild("HumanoidRootPart",1)
                                    local stats = getloweststat()
                                    local moves = {}
                                    local attacked = false
                                    if stats >= 5000 then
                                        table.insert(moves, "Wolf Fang Fist")
                                    end
                                    if stats >= 40000 then
                                        table.insert(moves, "Meteor Crash")
                                    end
                                    if stats >= 100000 and not table.find({"Evil Saya","X Fighter"},Boss.Name)then
                                        table.insert(moves, "High Power Rush")
                                    end
                                    if stats >= 125000 then
                                        table.insert(moves, "Mach Kick")
                                    end
                                    if stats >= 60e6 then
                                        if ldata.Allignment.Value == "Good" then
                                            table.insert(moves, "Spirit Barrage")
                                        else
                                            table.insert(moves, "God Slicer")
                                        end
                                    end
                                    for i,move in pairs(moves) do
                                        if not lplr.Status:FindFirstChild(move) then
                                            spawn(function()
                                                game:GetService("ReplicatedStorage").Package.Events.mel:InvokeServer(move,"Blacknwhite27")
                                                
                                            end)
                                            attacked = true
                                        end
                                    end
                                    local args = {
                                        [1] = "Energy Volley",
                                        [2] = {
                                            ["MouseHit"] = CFrame.new(6905.29883, 4005.75342, -6207.93164, 0,0,0, -7.45058149e-09, 0.984732807, -0.174073309, 0.772913337, 0.110451572, 0.624824405),
                                            ["FaceMouse"] = true
                                        },
                                        [3] = "Blacknwhite27"
                                    }
                                    if getloweststat() > 10000 and canvolley then
                                        canvolley = false
                                        game.ReplicatedStorage.Package.Events.voleys:InvokeServer(unpack(args))
                                        
                                        attacked = true
                                        spawn(function()
                                            wait(5)
                                            canvolley = true
                                        end)
                                    end
                                    if not attacked then
                                        game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27",1)
                                        game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27",2)
                                    end
                                else
                                    game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27",1)
                                    game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27",2)
                                end
                                CanAttack = true
	                        end)
	                    end
                    elseif table.find(mobs,Boss.Name) then
                        game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27",1)
                        game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27",2)
                        
	               	end
                end)
            end)
        end
        task.wait()
    end
end)

task.spawn(function() -- Pick quest
    while ScGui and getloweststat() < checkplr()[3] do
        if Farming then
            transform()
            --while not CanAttack do wait() end
            if ldata.Quest.Value == "" or not Boss then
                for i,boss in pairs(bosses) do
                    if ldata.Rebirth.Value >= 2000 and boss[1] == "Mapa" then
                        boss[2] = 0
                    end
                    if getloweststat()/2 >= boss[2] and game.Workspace.Living:FindFirstChild(boss[1]) and game.Workspace.Living[boss[1]]:FindFirstChild("Humanoid") and game.Workspace.Living[boss[1]].Humanoid.Health > 0 then
                        if ldata.Quest.Value ~= boss[1] then
                            pcall(function()
                                game:GetService("ReplicatedStorage").Package.Events.Qaction:InvokeServer(questNPCs[boss[1]])
                                
                            end)
                        end
                        if ldata.Quest.Value == boss[1] then
                            Boss = game.Workspace.Living[boss[1]]
                            if CanAttack ~= false then -- Sets if it's not nil                            
                                CanAttack = true
                            end
                        else
                            task.wait(.05)
                            Boss = nil
                        end
                        task.wait(.1)
                        break 
                    end
                end
            elseif game.Workspace.Living:FindFirstChild(ldata.Quest.Value) then
                Boss = game.Workspace.Living[ldata.Quest.Value]
            else ldata.Quest.Value = ""
                wait(.1)
            end
        end
        task.wait()
    end
end)
