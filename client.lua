-- Do not delete this to use my script
-- Script created by esFerDev. Uploaded from https://github.com/esFer102/rSkin-FiveM

ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('resetskin:resetSkin')
AddEventHandler('resetskin:resetSkin', function()
    
    local uniforms = {
  
          male = {
              ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
              ['torso_1'] = 260,   ['torso_2'] = 23,
              ['decals_1'] = 0,   ['decals_2'] = 0,
              ['arms'] = 11,
              ['pants_1'] = 26,   ['pants_2'] = 6,
              ['shoes_1'] = 1,   ['shoes_2'] = 0,
              ['chain_1'] = 0,  ['chain_2'] = 0
          },
          female = {
              ['tshirt_1'] = 14,   ['tshirt_2'] = 0,
              ['torso_1'] = 269,    ['torso_2'] = 23,
              ['decals_1'] = 0,   ['decals_2'] = 0,
              ['arms'] = 9,
              ['pants_1'] = 0,   ['pants_2'] = 8,
              ['shoes_1'] = 1,    ['shoes_2'] = 1,
              ['chain_1'] = 0,    ['chain_2'] = 0
          }

    }
    local playerPed = PlayerPedId()
    local lastHealth = GetEntityHealth(playerPed) 
    local defaultModel = GetHashKey('a_m_y_stbla_02')
    SetEntityVisible(PlayerPedId(), false)
    RequestModel(defaultModel)
    while not HasModelLoaded(defaultModel) do
        Citizen.Wait(100)
    end
    SetPlayerModel(PlayerId(), defaultModel)
    
    
    SetPedDefaultComponentVariation(PlayerPedId())
    SetPedRandomComponentVariation(PlayerPedId(), true)
    SetModelAsNoLongerNeeded(defaultModel)
    FreezeEntityPosition(PlayerPedId(), false)
 
    Citizen.Wait(300)

    TriggerEvent('skinchanger:getSkin', function(skin)
  
        skin['sex'] = changeSex(skin['sex']) --cambiamos sexo
        TriggerEvent('skinchanger:loadSkin', skin)
        Citizen.Wait(300)
        skin['sex'] = changeSex(skin['sex'])
        TriggerEvent('skinchanger:loadSkin', skin)
        ESX.ShowNotification('~g~Skin recargada')
    end)
    Citizen.Wait(1000)
    TriggerEvent('skinchanger:getSkin', function(skin)
  
        if skin.sex == 0 then
            if uniforms.male ~= nil then
                TriggerEvent('skinchanger:loadClothes', skin, uniforms.male)
            else
                ESX.ShowNotification('~r~Error')
            end
        else
            if uniforms.female ~= nil then
                TriggerEvent('skinchanger:loadClothes', skin, uniforms.female)
            else
                ESX.ShowNotification('~r~Error')
            end
        end
    end)
    Citizen.Wait(300)

    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
    SetEntityHealth(GetPlayerPed(-1), lastHealth)
    SetEntityVisible(PlayerPedId(), true)
    ClearPedTasksImmediately(GetPlayerPed(-1))

    -- REMOVE ALL WEAPONS OF FIVEM IN CLIENT
    RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_DAGGER")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BAT")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BOTTLE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CROWBAR")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_GOLFCLUB")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HAMMER")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HATCHET")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_KNUCKLE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_KNIFE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MACHETE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SWITCHBLADE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_NIGHTSTICK")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_WRENCH")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_WRENCH")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BATTLEAXE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_POOLCUE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_STONE_HATCHET")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_VINTAGEPISTOL")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLAREGUN")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_RAYPISTOL")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CERAMICPISTOL")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_NAVYREVOLVER")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_GADGETPISTOL")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MACHINEPISTOL")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MINISMG")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_RAYCARBINE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SAWNOFFSHOTGUN")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPSHOTGUN")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MUSKET")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_DBSHOTGUN")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_AUTOSHOTGUN")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATSHOTGUN")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMPACTRIFLE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MILITARYRIFLE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MG")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_GUSENBERG")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_RPG")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_GRENADELAUNCHER")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_GRENADELAUNCHER_SMOKE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MINIGUN")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_FIREWORK")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_RAILGUN")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HOMINGLAUNCHER")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMPACTLAUNCHER")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_RAYMINIGUN")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_GRENADE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BZGAS")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MOLOTOV")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_STICKYBOMB")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PROXMINE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNOWBALL")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PIPEBOMB")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BALL")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMOKEGRENADE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLARE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HAZARDCAN")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_FIREEXTINGUISHER")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("GADGET_PARACHUTE")) RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PETROLCAN"))

    TriggerEvent('esx_tattooshop:cleanPlayer')

    -- RELOAD GUNS
    TriggerServerEvent('esfer-rskin:recargararmas', source)


    
end)

function changeSex(sex)
    if sex == 0 then sex = 1 else sex = 0 end
    return sex
end

RegisterCommand('rskin', function(source, args, rawCommand)
    TriggerEvent('resetskin:resetSkin')
end, false)

--[[ All of this is shit
ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
  Citizen.Wait(0)
    end
end)

-------------------------

-- Command /reloadskin
RegisterCommand("reloadskin", function(source, args, rawCommand)
  reloadSkin()
end)

-- Command /rskin
RegisterCommand("rskin", function(source, args, rawCommand)
  if not args[1] then
    ESX.ShowNotification('¿Estás seguro de hacer rskin? Se te borrarán todas las armas, guardalas antes de hacerlo. Escribe "/rskin si" si estás seguro.')
  end
  if args[1] == 'si' then
    reloadSkin()
  end
end)

function reloadSkin()
  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  
    if skin.sex == 0 then
  
      local model = GetHashKey("a_f_y_tourist_01")
  
      RequestModel(model)
      while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
      end
  
      SetPlayerModel(PlayerId(), model)
      SetModelAsNoLongerNeeded(model)
    else
      local model = GetHashKey("a_f_y_tourist_01")
  
      RequestModel(model)
      while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
      end
  
      SetPlayerModel(PlayerId(), model)
      SetModelAsNoLongerNeeded(model)
    end
  
  end)
  Wait(200)
  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
    local isMale = skin.sex == 0
    TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
      ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)
        TriggerEvent('esx:restoreLoadout')
      end)
    end)
  end)
end

--[[
function reloadSkin()
  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
    local isMale = skin.sex == 0

    TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
      ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)
        TriggerEvent('esx:restoreLoadout')
      end)
    end)
  end)
end
--]]
