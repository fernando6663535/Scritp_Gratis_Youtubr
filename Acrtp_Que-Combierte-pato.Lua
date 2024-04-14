-- Obtener servicios necesarios
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Crear el panel GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MissionPanel"
ScreenGui.ResetOnSpawn = false -- No se restablecerá al reaparecer el jugador
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Crear la BillboardGui
local BillboardGui = Instance.new("BillboardGui")
BillboardGui.Name = "MissionBillboard"
BillboardGui.Size = UDim2.new(0, 100, 0, 50) -- Tamaño de la BillboardGui
BillboardGui.StudsOffset = Vector3.new(0, 5, 0) -- Offset vertical para que esté sobre la cabeza del jugador
BillboardGui.Adornee = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") -- HumanoidRootPart del jugador
BillboardGui.Parent = ScreenGui

local missionTextLabel = Instance.new("TextLabel")
missionTextLabel.Name = "MissionTextLabel"
missionTextLabel.Size = UDim2.new(1, 0, 1, 0)
missionTextLabel.Position = UDim2.new(0, 0, 0, 0)
missionTextLabel.BackgroundTransparency = 1
missionTextLabel.Font = Enum.Font.SourceSansBold -- Cambiar la fuente a SourceSansBold para hacer las letras más grandes
missionTextLabel.TextSize = 40 -- Ajustar el tamaño de las letras a 40
missionTextLabel.TextColor3 = Color3.new(0, 0, 0) -- Cambiar el color del texto a negro
missionTextLabel.TextStrokeColor3 = Color3.new(0, 0, 255) -- Cambiar el color del contorno del texto a rojo
missionTextLabel.TextStrokeTransparency = 0 -- Cambiar la transparencia del contorno del texto a 0
missionTextLabel.Parent = BillboardGui

-- Función para actualizar el nombre de la misión
local function updateMissionName()
    local currentMission = ReplicatedStorage.Datas[Players.LocalPlayer.UserId].Quest.Value
    missionTextLabel.Text = "" .. currentMission -- Actualizar el texto con el nombre de la misión
end

-- Actualizar el nombre de la misión al inicio y suscribirse a futuros cambios
updateMissionName()
ReplicatedStorage.Datas[Players.LocalPlayer.UserId].Quest:GetPropertyChangedSignal("Value"):Connect(updateMissionName)

-- Función para actualizar la posición de la BillboardGui
local function updateBillboardPosition()
    BillboardGui.Adornee = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") -- Actualizar la Adornee a HumanoidRootPart
end

-- Actualizar la posición de la BillboardGui periódicamente
while true do
    updateBillboardPosition()
    wait(0.1) -- Esperar un breve tiempo antes de volver a actualizar
end
