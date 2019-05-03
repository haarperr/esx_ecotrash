ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx-ecotrash:sellBottles')
AddEventHandler('esx-ecotrash:sellBottles', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    local current = xPlayer.getInventoryItem('bottle').count
    local randomMoney = math.random(1, 2)

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
    local random = math.random(1, 2)

    if luck >= 0 and luck <= 29 then
        TriggerClientEvent('esx:showNotification', src, 'Roskakorissa ei ole mitään!')
    else
        xPlayer.addInventoryItem('bottle', random)
        TriggerClientEvent('esx:showNotification', src, 'Löysit roskakorista pulloja')
        if luck == 33 then
			xPlayer.addInventoryItem('bread', 1)
            TriggerClientEvent('esx:showNotification', src, 'Löysit roskakorista 1 Leivän')
        elseif luck == 35 then
            xPlayer.addInventoryItem('donut', 1)
            TriggerClientEvent('esx:showNotification', src, 'Löysit roskakorista 1 Donitsin')
        elseif luck == 34 then
            xPlayer.addInventoryItem('muovi', 1)
            TriggerClientEvent('esx:showNotification', src, 'Löysit roskakorista 1 Muovin')
        elseif luck == 38 then
            xPlayer.addInventoryItem('petrol', 1)
            TriggerClientEvent('esx:showNotification', src, 'Löysit roskakorista 1  Öljyn')
        elseif luck == 42 then
        	xPlayer.addInventoryItem('haisevasukka', 1)
            TriggerClientEvent('esx:showNotification', src, 'Löysit roskakorista 1 Haisevan sukan')
        elseif luck == 46 then
            xPlayer.addInventoryItem('ruuti', 1)
            TriggerClientEvent('esx:showNotification', src, 'Löysit roskakorista 1 Paketin ruutia')
        elseif luck == 50 then
            xPlayer.addInventoryItem('blowpipe', 1)
            TriggerClientEvent('esx:showNotification', src, 'Löysit roskakorista 1 Polttoleikkurin')
        elseif luck == 54 then
            xPlayer.addInventoryItem('weapon_bottle', 1)
            TriggerClientEvent('esx:showNotification', src, 'Löysit roskakorista 1 Rikkinäisen pullon')
        elseif luck == 58 then
            xPlayer.addInventoryItem('marijuana', 1)
            TriggerClientEvent('esx:showNotification', src, 'Löysit roskakorista 1 Marijuanan')
        elseif luck == 62 then
            xPlayer.addInventoryItem('diamond', 1)
            TriggerClientEvent('esx:showNotification', src, 'Löysit roskakorista 1 Timanttin')
        elseif luck == 66 then
            xPlayer.addInventoryItem('fixkit', 1)
            TriggerClientEvent('esx:showNotification', src, 'Löysit roskakorista 1 Korjauskitin')
        elseif luck == 69 then
            xPlayer.addInventoryItem('teippi', 2)
            TriggerClientEvent('esx:showNotification', src, 'Löysit roskakorista 2 Teippiä')
        end
    end
end)
