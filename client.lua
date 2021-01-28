ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
  Citizen.Wait(0)
    end
end)

----------------------------------------------------------------------------------------------------

-- Command /reloadskin
RegisterCommand("reloadskin", function(source, args, rawCommand)
  reloadSkin()
end)

-- Command /rskin
RegisterCommand("rskin", function(source, args, rawCommand)
  reloadSkin()
end)

function reloadSkin()
  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
  local model = nil
       
  if skin.sex == 0 then
    model = GetHashKey("mp_m_freemode_01")
  else
    model = GetHashKey("mp_f_freemode_01")
  end
        
  RequestModel(model)
  while not HasModelLoaded(model) do
    RequestModel(model)
    Citizen.Wait(1)
  end
        
  SetPlayerModel(PlayerId(), model)
  SetModelAsNoLongerNeeded(model)
        
  TriggerEvent('skinchanger:loadSkin', skin)
  TriggerEvent('esx:restoreLoadout')
  end)
end
