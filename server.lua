ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('esfer-rskin:recargararmas')
AddEventHandler('esfer-rskin:recargararmas', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    for k,v in ipairs(xPlayer.getLoadout()) do
        xPlayer.removeWeapon(v.name)
        xPlayer.addWeapon(v.name, v.ammo)
    end
end)
