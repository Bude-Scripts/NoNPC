-- Thread für frame-sensitiv Dichte-Multiplikatoren
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        SetVehicleDensityMultiplierThisFrame(0.0)
        SetPedDensityMultiplierThisFrame(0.0)
        SetRandomVehicleDensityMultiplierThisFrame(0.0)
        SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
        SetParkedVehicleDensityMultiplierThisFrame(0.0)
    end
end)

-- Thread für das Deaktivieren von zufälligen Spawns (nicht frame-sensitiv)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)  -- einmal pro Sekunde aktualisieren
        SetCreateRandomCops(false)
        SetCreateRandomCopsNotOnScenarios(false)
        SetCreateRandomCopsOnScenarios(false)
        SetGarbageTrucks(false)
        SetRandomBoats(false)
    end
end)

-- Thread zum periodischen Entfernen von Fahrzeugen
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)  -- alle 500ms ausführen
        local playerCoords = GetEntityCoords(PlayerPedId())
        local x, y, z = table.unpack(playerCoords)
        ClearAreaOfVehicles(x, y, z, 1000.0, false, false, false, false, false)
        RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0)
    end
end)
