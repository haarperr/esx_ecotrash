ESX                           = nil

local lastBin = 0

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(5)
    end

    LoadMarkers()
end)

local Coordinates = {
    { x = 29.337753295898, y = -1770.3348388672, z = 29.607357025146 - 0.945 },
    --{ x = 388.30194091797, y = -874.88238525391, z = 29.295169830322 - 0.945 },
    --{ x = 26.877752304077, y = -1343.0764160156, z = 29.497024536133 - 0.945 },
}

function LoadMarkers()
    Citizen.Wait(1000)

    Citizen.CreateThread(function()

        for index, value in pairs(Coordinates) do
            local blip = AddBlipForCoord(value.x, value.y, value.z)
    
            SetBlipSprite (blip, 365)
            SetBlipDisplay(blip, 4)
            SetBlipScale  (blip, 0.8)
            SetBlipColour (blip, 20)
            SetBlipAsShortRange(blip, true)
    
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString('Palautus')
            EndTextCommandSetBlipName(blip)
        end

        while true do
            sleep = 500

            local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))

            for id, val in ipairs(Coordinates) do


                local distance = GetDistanceBetweenCoords(x, y, z, val.x, val.y, val.z, true)

                if distance <= 5.0 then
                    sleep = 1
                    DrawMarker(27, val.x, val.y, val.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, 255, 255, 255, 100, false, true, 2, false, false, false, false)
                    if distance <= 1.5 then
                        ESX.Game.Utils.DrawText3D({x = val.x, y = val.y, z = val.z + 1}, '[E] Pullojen palautus', 0.4)
                        if IsControlJustReleased(0, 38) then
                            TriggerServerEvent('esx-ecotrash:sellBottles')
                        end
                    end
                end

            end
            Citizen.Wait(sleep)
        end
    
    end)
end

trashCanModels = {
  [1] = -2096124444,
  [2] = 218085040,
  [3] = -58485588,
  [4] = -329415894
}

Citizen.CreateThread(function()
    while true do

        sleep = 500
        local trashCan = closestTrashCan()
        if trashCan ~= 0 and trashCan ~= nil then
            sleep = 1
            local binCoords = GetEntityCoords(trashCan)
            ESX.Game.Utils.DrawText3D({ x = binCoords.x, y = binCoords.y, z = binCoords.z + 1 }, '[E] Dyykkaus', 0.4)
            if IsControlJustReleased(0, 38) then
                if lastBin ~= trashCan then
                    lastBin = trashCan
                    OpenTrashCan()
                else
                    ESX.ShowNotification('Tarkastit jo roskiksen')
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

function OpenTrashCan()
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
    Citizen.Wait(10000)
    TriggerServerEvent('esx-ecotrash:retrieveBottle')
    ClearPedTasksImmediately(PlayerPedId())
end

function closestTrashCan()
  local ped = GetPlayerPed(-1)
  local pedCoords = GetEntityCoords(ped)

  for i = 1, #trashCanModels do

      local closestTrashCan = GetClosestObjectOfType(pedCoords.x, pedCoords.y, pedCoords.z, 1.5, trashCanModels[i], false, false)
      
      if closestTrashCan ~= nil then
        if GetDistanceBetweenCoords(pedCoords, GetEntityCoords(closestTrashCan)) <= 1.5 then
          return closestTrashCan
      end
    end
  end
end
