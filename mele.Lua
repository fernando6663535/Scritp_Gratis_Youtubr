local ReplicatedStorage = game:GetService("ReplicatedStorage")

local meleeAttacks = {
    {name = "God Slicer", requerido = 1000000 * 60},
    {name = "Spirit Barrage", requerido = 1000000 * 60},
    {name = "Super Dragon Fist", requerido = 1000000 * 50},
    {name = "Flash Kick", requerido = 1000000 / 2},
    {name = "Spirit Breaking Cannon", requerido = 200000},
    {name = "Mach Kick", requerido = 90000},
    {name = "High Power Rush", requerido = 65000},
    {name = "Meteor Crash", requerido = 28000},
    {name = "Wolf Fang Fist", requerido = 2000}
}

local function attackMelee(name)
    local event = ReplicatedStorage.Package.Events.mel
    event:InvokeServer(name, "Blacknwhite27")
end

local function performMeleeAttacks()
    for _, attackData in ipairs(meleeAttacks) do
        local attackName = attackData.name
        local requiredStrength = attackData.requerido

        attackMelee(attackName)
    end
end

local function startMeleeAttackLoop()
    while true do
        performMeleeAttacks()
        wait(0.001) -- Espera un solo fotograma antes de volver a atacar
    end
end

local function checkPlayerHealth()
    local player = game:GetService("Players").LocalPlayer
    while true do
        if player.Character and player.Character.Humanoid.Health <= 0 then
            -- Reiniciar el script
            startMeleeAttackLoop()
        end
        wait() -- Verificar el estado del jugador cada segundo
    end
end

-- Iniciar bucle principal de ataques cuerpo a cuerpo y bucle de verificación de la salud del jugador
spawn(startMeleeAttackLoop)
spawn(checkPlayerHealth)


