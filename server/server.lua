local QBCore = exports['qb-core']:GetCoreObject()

--[[ DELETE BIN ON RESTART ]]

MySQL.Async.execute('DELETE FROM stashitems WHERE stash = ?', {
	"irishpubbin"
})

-- EVENT HANDLERS

RegisterServerEvent("qb-irishpub:server:billplayer", function(playerId, amount)
    local src = source
    local biller = QBCore.Functions.GetPlayer(src)
    local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
    local amount = tonumber(amount)
    if biller.PlayerData.job.name == 'irishpub' then -- CHANGE LATER
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                if amount and amount > 0 then
                    MySQL.Async.insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (@citizenid, @amount, @society, @sender)', {
                        ['@citizenid'] = billed.PlayerData.citizenid,
                        ['@amount'] = amount,
                        ['@society'] = biller.PlayerData.job.name,
                        ['@sender'] = biller.PlayerData.charinfo.firstname
                    })
                    TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                    TriggerClientEvent('QBCore:Notify', src, 'Invoice Successfully Sent', 'success')
                    TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                else
                    TriggerClientEvent('QBCore:Notify', src, 'Must Be A Valid Amount Above 0', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', src, 'You Cannot Bill Yourself', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'Player Not Online', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'No Access', 'error')
    end
end)

-- RegisterNetEvent("qb-irishpub:server:MakePotato", function()
-- 	local src = source
-- 	local Player = QBCore.Functions.GetPlayer(src)
-- 	local ped = GetPlayerPed(src)
-- 	local coords = GetEntityCoords(ped)
-- 	local dist = #(coords - vector3(826.24, -108.78, 79.77))
-- 	if dist < 2.5 then
-- 		if Player.Functions.RemoveItem('potato', 1) and Player.Functions.RemoveItem('salt', 1) and Player.Functions.RemoveItem('butter', 1) then
-- 			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["potato"], "remove")
-- 			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["salt"], "remove")
-- 			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["butter"], "remove")
-- 			Player.Functions.AddItem("bakedpotato", 1)
-- 			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["bakedpotato"], "add")
-- 		else
-- 			TriggerClientEvent("QBCore:Notify", src, "You do not have the required ingredients", "error")
-- 		end
-- 	end
-- end)


RegisterNetEvent("qb-irishpub:server:MakePotato", function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local ped = GetPlayerPed(src)
	local coords = GetEntityCoords(ped)
	local dist = #(coords - vector3(826.24, -108.78, 79.77))
	if dist < 2.5 then
		if Player.Functions.GetItemByName('potato') and Player.Functions.GetItemByName('salt') and Player.Functions.GetItemByName('butter') then
			Player.Functions.RemoveItem('potato', 1)
			Player.Functions.RemoveItem('salt', 1)
			Player.Functions.RemoveItem('butter', 1)
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["potato"], "remove")
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["salt"], "remove")
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["butter"], "remove")
			Player.Functions.AddItem("bakedpotato", 1)
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["bakedpotato"], "add")
		else
			TriggerClientEvent("QBCore:Notify", src, "You do not have the required ingredients", "error")
		end
	end
end)

RegisterNetEvent("qb-irishpub:server:BaileysCoffee", function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local ped = GetPlayerPed(src)
	local coords = GetEntityCoords(ped)
	local dist = #(coords - vector3(838.06, -115.42, 79.77))
	--1x Coffee, 1x Baileys, 1x Whipped Cream, 1x Chocolat
	if dist < 5 then
		if Player.Functions.GetItemByName('coffee') and Player.Functions.GetItemByName('baileys') and Player.Functions.GetItemByName('whippedcream') and Player.Functions.GetItemByName('chocolate') then
			Player.Functions.RemoveItem('coffee', 1)
			Player.Functions.RemoveItem('baileys', 1)
			Player.Functions.RemoveItem('whippedcream', 1)
			Player.Functions.RemoveItem('chocolate', 1)
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["coffee"], "remove")
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["baileys"], "remove")
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["whippedcream"], "remove")
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chocolate"], "remove")
			Player.Functions.AddItem("baileyscoffee", 1)
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["baileyscoffee"], "add")
		else
			-- print('test')
			TriggerClientEvent("QBCore:Notify", src, "You do not have the required ingredients", "error")
		end
	end
end)

--[[


header = "Dingle Donkey",
						txt = "Requires 1x Lime, 1x Vodka, 1x Ginger Beer",
						params = {
							isServer = true,
							event = "qb-irishpub:server:DingleDonkey",
						}
]]

RegisterNetEvent("qb-irishpub:server:DingleDonkey", function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local ped = GetPlayerPed(src)
	local coords = GetEntityCoords(ped)
	local dist = #(coords - vector3(838.06, -115.42, 79.77))
	if dist < 5 then
		if Player.Functions.GetItemByName('lime') and Player.Functions.GetItemByName('gingerbeer') and Player.Functions.GetItemByName('vodka') then
			Player.Functions.RemoveItem('lime', 1)
			Player.Functions.RemoveItem('gingerbeer', 1)
			Player.Functions.RemoveItem('vodka', 1)
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["lime"], "remove")
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["gingerbeer"], "remove")
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["vodka"], "remove")
			Player.Functions.AddItem("dingledonkey", 1)
			TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["dingledonkey"], "add")
		else
			TriggerClientEvent("QBCore:Notify", src, "You do not have the required ingredients", "error")
		end
	end
end)

RegisterNetEvent('qb-irishpub:server:MakeCoffee', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local ped = GetPlayerPed(src)
	local coords = GetEntityCoords(ped)
	local dist = #(coords - vector3(832.73, -114.74, 79.77))
	if dist < 2.5 then
    	Player.Functions.AddItem("coffee", 1)
		TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["coffee"], "add")
	end
end)

RegisterNetEvent('qb-irishpub:server:pourBeer', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local ped = GetPlayerPed(src)
	local coords = GetEntityCoords(ped)
	local dist = #(coords - vector3(835.76, -113.63, 79.77))
	if dist < 5 then
    	Player.Functions.AddItem(data, 1)
		TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[data], "add")
	end
end)

RegisterNetEvent("qb-irishpub:server:ReturnDelivery", function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local ped = GetPlayerPed(src)
	local coords = GetEntityCoords(ped)
	local dist = #(coords - vector3(825.97, -112.69, 80.43))
	if dist < 2.5 then
    	Player.Functions.AddItem("potato", math.random(1,15))
		TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["potato"], "add")
		Player.Functions.AddItem("salt", math.random(1,15))
		TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["salt"], "add")
		Player.Functions.AddItem("butter", math.random(1,15))
		TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["butter"], "add")
		Player.Functions.AddItem("chocolate", math.random(1,15))
		TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["chocolate"], "add")
	end
end)

QBCore.Functions.CreateUseableItem("baileys", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
	TriggerClientEvent("test:drunk", src, 60)
end)

QBCore.Functions.CreateUseableItem("scraggybay", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
	TriggerClientEvent("test:drunk", src, 60)
end)

QBCore.Functions.CreateUseableItem("baileyscoffee", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
	TriggerClientEvent("test:drunk", src, 60)
end)

QBCore.Functions.CreateUseableItem("kilkenny", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
	TriggerClientEvent("test:drunk", src, 60)
end)

QBCore.Functions.CreateUseableItem("dingledonkey", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("consumables:client:DrinkAlcohol", src, item.name)
	TriggerClientEvent("test:drunk", src, 60)
end)

QBCore.Functions.CreateUseableItem("chocolate", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("bakedpotato", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src, item.name)
    end
end)

