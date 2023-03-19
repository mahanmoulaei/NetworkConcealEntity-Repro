local toboolean = {["true"] = true, ["false"] = false}

RegisterCommand("spawnVehicle", function(source, args, _)
    local playerPed = GetPlayerPed(source)
    local playerCoords = GetEntityCoords(playerPed)
    local vehicleEntity = CreateVehicleServerSetter(joaat(args[1]), args[2] or "automobile", table.unpack(playerCoords))
    print(("vehicleEntity: %s - vehicleNetId: %s"):format(vehicleEntity, NetworkGetNetworkIdFromEntity(vehicleEntity)))
end, false)

RegisterCommand("concealVehicleForAll", function(source, args, _)
    local vehicleEntity = tonumber(args[1]) --[[@as number]]
    local conceal = toboolean[args[2]:lower()] --[[@as boolean]]

    if DoesEntityExist(vehicleEntity) and conceal ~= nil then
        Entity(vehicleEntity).state:set("instanced", conceal, true)
    end
end, false)

RegisterCommand("concealVehicleForSelf", function(source, args, _)
    local vehicleEntity = tonumber(args[1]) --[[@as number]]
    local conceal = toboolean[args[2]:lower()] --[[@as boolean]]

    if DoesEntityExist(vehicleEntity) and conceal ~= nil then
        local vehicleNetId = NetworkGetNetworkIdFromEntity(vehicleEntity)

        TriggerClientEvent("repro:instanced", source, vehicleNetId, conceal)
    end
end, false)