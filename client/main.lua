local function concealVehicle(vehicleEntity, concealState)
    NetworkConcealEntity(vehicleEntity, concealState)
end

---@diagnostic disable-next-line: param-type-mismatch
AddStateBagChangeHandler("instanced", nil, function(bagName, _, value)
    local entityHandler = GetEntityFromStateBagName(bagName)
    if not entityHandler or entityHandler == 0 then return end

    concealVehicle(entityHandler, value)
end)

RegisterNetEvent("repro:instanced", function(vehicleNetId, concealState)
    if NetworkDoesNetworkIdExist(vehicleNetId) then
        local vehicleEntity = NetToVeh(vehicleNetId)
   
        if DoesEntityExist(vehicleEntity) then
            concealVehicle(vehicleEntity, concealState)
        end
    end
end)