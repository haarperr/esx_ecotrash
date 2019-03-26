ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx-ecotrash:sellBottles')
AddEventHandler('esx-ecotrash:sellBottles', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    local current = xPlayer.getInventoryItem('bottle').count
    local randomMoney = math.random(1, 4)

    if current > 0 then
        xPlayer.removeInventoryItem('bottle', current)
        xPlayer.addMoney(randomMoney * current)
        TriggerClientEvent('esx:showNotification', src, 'Kauppa otti vastaan ' .. current .. ' pulloa ja maksoi niistä ' .. randomMoney * current .. '€!')
    else
        TriggerClientEvent('esx:showNotification', src, 'Sinulla ei ole pulloja enää')
    end
end)


RegisterServerEvent('esx-ecotrash:retrieveBottle')
AddEventHandler('esx-ecotrash:retrieveBottle', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    local luck = math.random(0, 69)
    local random = math.random(1, 4)

    if luck >= 0 and luck <= 29 then
        TriggerClientEvent('esx:showNotification', src, 'Roskakorissa ei ole mitään!')
    else
        xPlayer.addInventoryItem('bottle', random)
        TriggerClientEvent('esx:showNotification', src, 'Löysit roskiksesta ' .. random .. ' Pullon')
        if luck == 27 then
            xPlayer.addInventoryItem('ruuti', random)
            TriggerClientEvent('esx:showNotification', src, 'Löysit roskiksesta ' .. random .. ' Ruutia')
        elseif luck == 31 then
            xPlayer.addInventoryItem('diamond', random)
            TriggerClientEvent('esx:showNotification', src, 'Löysit roskiksesta ' .. random .. ' Timanttin')
        elseif luck == 35 then
            xPlayer.addInventoryItem('petrol', random)
            TriggerClientEvent('esx:showNotification', src, 'Löysit roskiksesta ' .. random .. ' Bensan')
        elseif luck == 39 then
            xPlayer.addInventoryItem('fixkit', random)
            TriggerClientEvent('esx:showNotification', src, 'Löysit roskiksesta ' .. random .. ' Korjaussarjan')
        elseif luck == 43 then
            xPlayer.addInventoryItem('blowpipe', random)
            TriggerClientEvent('esx:showNotification', src, 'Löysit roskiksesta ' .. random .. ' Polttoleikkurin')
        elseif luck == 47 then
            xPlayer.addInventoryItem('weed', random)
            TriggerClientEvent('esx:showNotification', src, 'Löysit roskiksesta ' .. random .. ' Kannabista')
        elseif luck == 51 then
            xPlayer.addInventoryItem('donut', random)
            TriggerClientEvent('esx:showNotification', src, 'Löysit roskiksesta ' .. random .. ' Donitsi')
        elseif luck == 55 then
            xPlayer.addInventoryItem('donut', random)
            TriggerClientEvent('esx:showNotification', src, 'Löysit roskiksesta ' .. random .. ' Leipä')
        elseif luck == 59 then
            xPlayer.addInventoryItem('jager', random)
            TriggerClientEvent('esx:showNotification', src, 'Löysit roskiksesta ' .. random .. ' Pontikka shotin')
        end        
    end
end)