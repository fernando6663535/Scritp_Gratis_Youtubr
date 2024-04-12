local function modifyCharacter(z)
    if z.Character then
        local character = z.Character

        -- Eliminar sombreros y accesorios
        for _, v in ipairs(character:GetChildren()) do
            if v:IsA("Hat") or v:IsA("Accessory") then
                v:Destroy()
            end
        end

        -- Crear un SpecialMesh para hacer que el personaje parezca un pato
        local duckMesh = Instance.new("SpecialMesh", character.HumanoidRootPart)
        duckMesh.MeshType = Enum.MeshType.FileMesh
        duckMesh.MeshId = "http://www.roblox.com/asset/?id=9419831"
        duckMesh.TextureId = "http://www.roblox.com/asset/?id=9419827"
        duckMesh.Scale = Vector3.new(5, 5, 5)

        -- Establecer la transparencia de todos los objetos del personaje, excepto la raíz del personaje, a 1 (invisibilidad)
        for _, descendant in ipairs(character:GetDescendants()) do
            if descendant:IsA("BasePart") or descendant:IsA("MeshPart") then
                descendant.Transparency = 1
            end
        end
        -- Hacer que la raíz del personaje no sea transparente
        character.HumanoidRootPart.Transparency = 0
    end
end

-- Iterar sobre todos los jugadores en el juego y aplicar la función modifyCharacter a sus personajes
for _, player in ipairs(game.Players:GetPlayers()) do
    modifyCharacter(player)
end
