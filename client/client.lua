local QBCore = exports['qb-core']:GetCoreObject()
local DEBUG = false
--[[


--Name: .5 | 2022-02-19T23:37:56Z
BoxZone:Create(vector3(834.51, -115.75, 79.77), 0.5, 0.5, {
  name=".5",
  heading=330,
  --debugPoly=true,
  minZ=79.67,
  maxZ=80.07
})

]]

exports['qb-target']:AddBoxZone("irish-register", vector3(834.51, -115.75, 79.77), 0.5, 0.5, {
	name = "irish-register",
	heading=330,
	debugPoly=DEBUG,
	minZ=79.67,
  	maxZ=80.07
}, {
	options = {
		{
			action = function()
				local bill = exports["qb-input"]:ShowInput({
					header = "Create Receipt",
					submitText = "Bill",
					inputs = {
						{
							text = "Server ID",
							name = "serverid",
							type = "number",
							isRequired = true ,
						},
						{
							text = "Amount",
							name = "amount",
							type = "number",
							isRequired = true,
						}
					}
				})
				if bill ~= nil then
					TriggerServerEvent("qb-irishpub:server:billplayer", bill.serverid, bill.amount) 
				end
			end,
			icon = "fa-solid fa-scissors",
			label = "Bill",
			job = "irishpub"
		}
	},          
	distance = 2.5
})

exports['qb-target']:AddBoxZone("irish-makefood", vector3(826.24, -108.78, 79.77), 1.2, 0.4, {
	name = "irish-makefood",
	heading=65,
	debugPoly=DEBUG,
	minZ=79.57,
	maxZ=79.77
}, {
	options = {
		{
			action = function()
				local menudata = {
					{
						header = "Make Food",
						isMenuHeader = true, -- Set to true to make a nonclickable title
					},
					{
						header = "Baked Potato",
						txt = "Requires 1x Potato, 1x Butter, 1x Salt",
						params = {
							isServer = true,
							event = "qb-irishpub:server:MakePotato",
						}
					}
				}
				exports['qb-menu']:openMenu(menudata)
			end,
			icon = "fa-solid fa-scissors",
			label = "Make food",
			job = "irishpub"
		}
	},          
	distance = 2.5
})

-- RegisterNetEvent("qb-irishpub:client:MakePotato", function()
-- 	QBCore.Functions.Progressbar("make-potato", "Pouring Beer..", 1500, false, true, {
-- 		disableMovement = true,
-- 		disableCarMovement = true,
-- 		disableMouse = false,
-- 		disableCombat = true,
-- 	}, { -- anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer"
-- 		animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
-- 		anim = "machinic_loop_mechandplayer",
-- 		flags = 49,
-- 	}, {}, {}, function() -- Done
-- 		TriggerServerEvent('qb-irishpub:server:pourBeer', data.type)
-- 	end, function() -- Cancel
-- 		StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
-- 	end)
-- end)

--[[


BoxZone:Create(vector3(838.06, -115.42, 79.77), 0.6, 2, {
  name="wanker",
  heading=330,
  --debugPoly=true,
  minZ=79.77,
  maxZ=79.97
})


]]

exports['qb-target']:AddBoxZone("irish-makedrinks", vector3(838.06, -115.42, 79.77), 0.6, 2, {
	name = "irish-makedrinks",
	heading=330,
	debugPoly=DEBUG,
	minZ=79.77,
	maxZ=79.97
}, {
	options = {
		{
			action = function()
				local menudata = {
					{
						header = "Make Drink",
						isMenuHeader = true, -- Set to true to make a nonclickable title
					},
					{
						header = "Baileys Coffee",
						txt = "Requires 1x Coffee, 1x Baileys, 1x Whipped Cream, 1x Chocolate",
						params = {
							isServer = true,
							event = "qb-irishpub:server:BaileysCoffee",
						}
					},
					{
						header = "Dingle Donkey",
						txt = "Requires 1x Lime, 1x Vodka, 1x Ginger Beer",
						params = {
							isServer = true,
							event = "qb-irishpub:server:DingleDonkey",
						}
					}
				}
				exports['qb-menu']:openMenu(menudata)
			end,
			icon = "fa-solid fa-scissors",
			label = "Make drink",
			job = "irishpub"
		}
	},          
	distance = 2.5
})

--[[


--Name: .5 | 2022-02-20T00:31:26Z
BoxZone:Create(vector3(832.73, -114.74, 79.77), 0.5, 0.5, {
  name=".5",
  heading=330,
  --debugPoly=true,
  minZ=79.72,
  maxZ=80.12
})

]]

--[[

BoxZone:Create(vector3(835.76, -113.63, 79.77), 0.7, 0.3, {
  name="1",
  heading=60,
  --debugPoly=true,
  minZ=79.97,
  maxZ=80.57
})
]]
exports['qb-target']:AddBoxZone("irish-pourbeer", vector3(835.76, -113.63, 79.77), 0.7, 0.3, {
	name = "irish-pourbeer",
	heading=60,
	debugPoly=DEBUG,
	minZ=79.97,
	maxZ=80.57
}, {
	options = {
		{
			action = function()
				local menudata = {
					{
						header = "Pour Beer",
						isMenuHeader = true, -- Set to true to make a nonclickable title
					},
					{
						header = "Corona",
						txt = "Pour a Corona Beer",
						params = {
							event = "qb-irishpub:client:pourBeer",
							args = {
								type = "beer" 
							}
						}
					},
					{
						header = "Scraggy Bay",
						txt = "Pour a Scraggy Bay Beer",
						params = {
							event = "qb-irishpub:client:pourBeer",
							args = {
								type = "scraggybay" 
							}
						}
					},
					{
						header = "Baileys",
						txt = "Pour a Baileys",
						params = {
							event = "qb-irishpub:client:pourBeer",
							args = {
								type = "baileys" 
							}
						}
					},
					{
						header = "Kilkenny Beer",
						txt = "Pour a Kilkenny Beer",
						params = {
							event = "qb-irishpub:client:pourBeer",
							args = {
								type = "kilkenny" 
							}
						}
					}
				}
				exports['qb-menu']:openMenu(menudata)

			end,
			icon = "fa-solid fa-scissors",
			label = "Pour Beer",
			job = "irishpub"
		}
	},          
	distance = 2.5
})
local drunk = 60
local drunkfx = false
local drinkamt = 0

function Between(drink, one, two)
	if drink > one and drink < two then
		return true
	else
		return false
	end
end

-- CreateThread(function()
--     while true do
--         local sleep = 1000
--         local ped = PlayerPedId()
--         if IsPedInAnyVehicle(ped) and not IsPedInAnyPlane(ped) and not IsPedInAnyHeli(ped) then
--             local veh = GetVehiclePedIsIn(ped)
--             local air = IsEntityInAir(veh)
--             sleep = 100
--             if air then
--                 sleep = 0
--                 DisableAllControlActions(0)
--                 EnableControlAction(0, 1, true)
--                 EnableControlAction(0, 2, true)
--                 EnableControlAction(0, 245, true)
--                 EnableControlAction(0, 0, true)
--                 EnableControlAction(0, 322, true)
--                 EnableControlAction(0, 288, true)
--                 EnableControlAction(0, 213, true)
--                 EnableControlAction(0, 249, true)
--                 EnableControlAction(0, 75, true)
--             end
--         end
--         Wait(sleep)
--     end
-- end)

RegisterNetEvent("test:drunk", function(value) DrunkMan(value) end)

function DrunkMan(value)
	-- print(value)
	drunk = value
	drinkamt = drinkamt + 1
	if Between(drinkamt, 0, 3) then
		-- print("not drunk yet")
	elseif Between(drinkamt, 3, 4) then
		-- print("almost wasted")
	elseif Between(drinkamt, 4, 10) then
		if drinkamt == 10 then drinkamt = 0 return end
		if drinkamt > 5 then return end
		CreateThread(function()
			local ped = PlayerPedId()
			repeat
				if not drunkfx and drunk > 0 then
					drunkfx = true
					RequestAnimSet('move_m@drunk@verydrunk')
					while not HasAnimSetLoaded('move_m@drunk@verydrunk') do
						Wait(0)
					end
					DoScreenFadeOut(1000)
					Wait(1000)
					SetTimecycleModifier('spectator5')
					SetPedMotionBlur(ped, true)
					SetPedMovementClipset(ped, 'move_m@drunk@verydrunk', true)
					SetPedIsDrunk(ped, true)
					DoScreenFadeIn(1000)
					
				end
				Wait(1000)
				drunk = drunk - 1
				if drunk == 0 then
					DoScreenFadeOut(1000)
					Wait(1000)
					DoScreenFadeIn(1000)
					ClearTimecycleModifier()
					ResetScenarioTypesEnabled()
					ResetPedMovementClipset(ped, 0)
					SetPedIsDrunk(ped, false)
					SetPedMotionBlur(ped, false)
					drunkfx = false
				end
				-- print(drunk)
			until drunk <= 0
		end)
	end
end

-- RegisterCommand("setup", function()
-- 	CreateThread(function()
-- 		local ped = PlayerPedId()
-- 		repeat
-- 			if not drunkfx and drunk > 0 then
-- 				drunkfx = true
-- 				RequestAnimSet('move_m@drunk@verydrunk')
-- 				while not HasAnimSetLoaded('move_m@drunk@verydrunk') do
-- 					Wait(0)
-- 				end
-- 				-- TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_DRUG_DEALER', 0, 1)
-- 				DoScreenFadeOut(1000)
-- 				Wait(1000)
-- 				-- ClearPedTasksImmediately(ped)
-- 				SetTimecycleModifier('spectator5')
-- 				SetPedMotionBlur(ped, true)
-- 				SetPedMovementClipset(ped, 'move_m@drunk@verydrunk', true)
-- 				SetPedIsDrunk(ped, true)
-- 				DoScreenFadeIn(1000)
				
-- 			end
-- 			Wait(1000)
-- 			drunk = drunk - 1
-- 			if drunk == 0 then
-- 				DoScreenFadeOut(1000)
-- 				Wait(1000)
-- 				DoScreenFadeIn(1000)
-- 				ClearTimecycleModifier()
-- 				ResetScenarioTypesEnabled()
-- 				ResetPedMovementClipset(ped, 0)
-- 				SetPedIsDrunk(ped, false)
-- 				SetPedMotionBlur(ped, false)
-- 				drunkfx = false
-- 			end
-- 			print(drunk)
-- 		until drunk <= 0
-- 	end)
-- end)

-- RegisterCommand("undrunk", function()
-- 	DoScreenFadeOut(1000)
-- 	Citizen.Wait(1000)
-- 	DoScreenFadeIn(1000)
-- 	ClearTimecycleModifier()
-- 	ResetScenarioTypesEnabled()
-- 	ResetPedMovementClipset(GetPlayerPed(-1), 0)
-- 	SetPedIsDrunk(GetPlayerPed(-1), false)
-- 	SetPedMotionBlur(GetPlayerPed(-1), false)
-- end)

-- RegisterCommand("drunk", function()
-- 	drunk = 10
-- 	local ped = PlayerPedId()
-- 	RequestAnimSet('move_m@drunk@verydrunk')
-- 	while not HasAnimSetLoaded('move_m@drunk@verydrunk') do
-- 		Wait(0)
-- 	end
-- 	-- TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_DRUG_DEALER', 0, 1)
-- 	DoScreenFadeOut(1000)
-- 	Wait(1000)
-- 	-- ClearPedTasksImmediately(ped)
-- 	SetTimecycleModifier('spectator5')
-- 	SetPedMotionBlur(ped, true)
-- 	SetPedMovementClipset(ped, 'move_m@drunk@verydrunk', true)
-- 	SetPedIsDrunk(ped, true)
-- 	DoScreenFadeIn(1000)
-- end)

RegisterNetEvent("qb-irishpub:client:pourBeer", function(data)
	QBCore.Functions.Progressbar("pour-beer", "Pouring Beer..", 1500, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, { -- anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer"
		animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
		anim = "machinic_loop_mechandplayer",
		flags = 49,
	}, {}, {}, function() -- Done
		TriggerServerEvent('qb-irishpub:server:pourBeer', data.type)
	end, function() -- Cancel
		StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
	end)
end)

exports['qb-target']:AddBoxZone("irish-makecoffee", vector3(832.73, -114.74, 79.77), 0.5, 0.5, {
	name = "irish-makecoffee",
	heading=330,
	debugPoly=DEBUG,
	minZ=79.72,
	maxZ=80.12
}, {
	options = {
		{
			action = function()
				QBCore.Functions.Progressbar("making_coffee", "Making Coffee..", 1500, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, { -- anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer"
					animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
					anim = "machinic_loop_mechandplayer",
					flags = 49,
				}, {}, {}, function() -- Done
					TriggerServerEvent('qb-irishpub:server:MakeCoffee')
				end, function() -- Cancel
					StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
				end)
			end,
			icon = "fa-solid fa-scissors",
			label = "Make Coffee",
			job = "irishpub"
		}
	},          
	distance = 1.0
})
--[[


BoxZone:Create(vector3(826.31, -111.4, 79.77), 1.6, 1, {
  name="1",
  heading=60,
  --debugPoly=true,
  minZ=78.77,
  maxZ=81.17
})


]]

exports['qb-target']:AddBoxZone("irish-fridge", vector3(826.31, -111.4, 79.77), 1.6, 1, {
	name = "irish-fridge",
	heading=60,
	debugPoly=DEBUG,
	minZ=78.77,
 	maxZ=81.17
}, {
	options = {
		{
			action = function()
				TriggerEvent("inventory:client:SetCurrentStash", "irishpubfridge")
                    TriggerServerEvent("inventory:server:OpenInventory", "stash", "irishpubfridge", {
                        maxweight = 4000000,
                        slots = 500,
                    })
			end,
			icon = "fa-solid fa-scissors",
			label = "Fridge",
			job = "irishpub"
		}
	},          
	distance = 2.5
})
--[[


--Name: .6 | 2022-02-20T00:58:57Z
BoxZone:Create(vector3(827.37, -111.9, 79.77), 0.6, 0.6, {
  name=".6",
  heading=0,
  --debugPoly=true,
  minZ=78.77,
  maxZ=79.77
})

]]

--[[

--Name: .2 | 2022-02-20T03:21:41Z
BoxZone:Create(vector3(829.8, -110.24, 79.77), 0.4, 0.2, {
  name=".2",
  heading=240,
  --debugPoly=true,
  minZ=80.17,
  maxZ=80.77
})

]]

-- exports['qb-target']:AddBoxZone("irish-clockin", vector3(829.8, -110.24, 79.77), 0.4, 0.2, {
-- 	name = "irish-clockin",
-- 	heading=240,
-- 	debugPoly=DEBUG,
-- 	minZ=80.17,
-- 	maxZ=80.77
-- }, {
-- 	options = {
-- 		{
-- 			action = function()
-- 				TriggerServerEvent("QBCore:ToggleDuty")
-- 			end,
-- 			icon = "fa-solid fa-scissors",
-- 			label = "Clock in",
-- 			job = "irishpub"
-- 		}
-- 	},          
-- 	distance = 2.5
-- })

exports['qb-target']:AddBoxZone("irish-secretbin", vector3(827.37, -111.9, 79.77), 0.6, 0.6, {
	name = "irish-secretbin",
	heading=00,
	debugPoly=DEBUG,
	minZ=78.77,
	maxZ=79.77
}, {
	options = {
		{
			action = function()
				TriggerEvent("inventory:client:SetCurrentStash", "irishpubbin")
                    TriggerServerEvent("inventory:server:OpenInventory", "stash", "irishpubbin", {
                        maxweight = 4000000,
                        slots = 500,
                    })
			end,
			icon = "fa-solid fa-scissors",
			label = "Bin",
			job = "irishpub"
		}
	},          
	distance = 2.5
})
--[[

BoxZone:Create(vector3(825.97, -112.69, 80.43), 0.6, 1.4, {
  name="aa",
  heading=330,
  --debugPoly=true,
  minZ=80.43,
  maxZ=81.03
})


]]
local deliveryzones = {
	[1] = vector4(716.75, -654.72, 26.78, 263.83)
}

local doingdelivery = false
local hasbox = false
local box
exports['qb-target']:AddBoxZone("irish-delivery", vector3(825.97, -112.69, 80.43), 0.6, 1.4, {
	name = "irish-delivery",
	heading=330,
	debugPoly=DEBUG,
	minZ=80.43,
	maxZ=81.03
}, {
	options = {
		{	
			canInteract = function()
				return not doingdelivery
			end,
			action = function()
				doingdelivery = true
				local coords = deliveryzones[math.random(1, #deliveryzones)]
				local blip = AddBlipForCoord(coords)
				SetBlipSprite(blip, 1)
				SetBlipDisplay(blip, 2)
				SetBlipScale(blip, 1.0)
				SetBlipAsShortRange(blip, false)
				SetBlipColour(blip, 76)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentSubstringPlayerName("Get Stock")
				EndTextCommandSetBlipName(blip)
				SetBlipRoute(blip, true)
				while not HasModelLoaded(`a_m_m_farmer_01`) do
					RequestModel(`a_m_m_farmer_01`)
					Wait(0)
				end
				local ped = CreatePed(4, `a_m_m_farmer_01`, coords, false, true)
				-- SetPedComponentVariation(ped, 1, 4, 0, 2)
				FreezeEntityPosition(ped, true)
				SetEntityInvincible(ped, true)
				SetBlockingOfNonTemporaryEvents(ped, true)
				--[[


				["box"] = {"anim@heists@box_carry@", "idle", "Box", AnimationOptions =
			{
				Prop = "hei_prop_heist_box",
				PropBone = 60309,
				PropPlacement = {0.025, 0.08, 0.255, -145.0, 290.0, 0.0},
				EmoteLoop = true,
				EmoteMoving = true,
			}},
				]]
				local ad = "anim@heists@box_carry@" 
				local anim = "idle"
				while not HasAnimDictLoaded(ad) do
					RequestAnimDict(ad)
					Wait(1)
				end
				box = CreateObject(`hei_prop_heist_box`, coords.x, coords.y, coords.z+0.2,  true,  true, true)
				AttachEntityToEntity(box, ped, GetPedBoneIndex(ped, 60309), 0.025, 0.08, 0.255, -145.0, 290.0, 0.0, true, true, false, true, 1, true)
				TaskPlayAnim(ped, ad, anim, 8.00, -8.00, -1, (2 + 16 + 32), 0.00, 0, 0, 0)

				exports['qb-target']:AddTargetModel(`a_m_m_farmer_01`, {
					options = {
						{	
							canInteract = function()
								local playerped = PlayerPedId()
								local playerpedcoords = GetEntityCoords(playerped)
								local distance = #(playerpedcoords - vector3(coords.x, coords.y, coords.z))
								if distance < 2.5 then
									return true
								end
							end,
							action = function()
								local playerped = PlayerPedId()
								RemoveBlip(blip)
								DeleteEntity(ped)
								AttachEntityToEntity(box, playerped, GetPedBoneIndex(playerped, 60309), 0.025, 0.08, 0.255, -145.0, 290.0, 0.0, true, true, false, true, 1, true)
								hasbox = true
								TaskPlayAnim(playerped, ad, anim, 8.00, -8.00, -1, (2 + 16 + 32), 0.00, 0, 0, 0)

							end,
							icon = "fas fa-burn",
							label = "Collect",
						},
					},          
					distance = 2.5
				})
			end,
			icon = "fa-solid fa-scissors",
			label = "Start Delivery",
			job = "irishpub"
			
		},
		{	
			canInteract = function()
				return hasbox
			end,
			action = function()
				doingdelivery = false
				hasbox = false
				DeleteEntity(box)
				StopAnimTask(PlayerPedId(), "anim@heists@box_carry@" , "idle", 1.0)
				TriggerServerEvent("qb-irishpub:server:ReturnDelivery")
			end,
			icon = "fa-solid fa-scissors",
			label = "Finish Delivery",
			job = "irishpub"
		},
		{
			action = function()
				TriggerServerEvent("QBCore:ToggleDuty")
			end,
			icon = "fa-solid fa-scissors",
			label = "Clock in",
			job = "irishpub"
		}
	},          
	distance = 2.5
})

-- RegisterCommand("init", function()
-- 	doingdelivery = true
-- 	local coords = deliveryzones[math.random(1, #deliveryzones)]
-- 	local blip = AddBlipForCoord(coords)
-- 	SetBlipSprite(blip, 1)
-- 	SetBlipDisplay(blip, 2)
-- 	SetBlipScale(blip, 1.0)
-- 	SetBlipAsShortRange(blip, false)
-- 	SetBlipColour(blip, 76)
-- 	BeginTextCommandSetBlipName("STRING")
-- 	AddTextComponentSubstringPlayerName("Get Stock")
-- 	EndTextCommandSetBlipName(blip)
-- 	SetBlipRoute(blip, true)
-- 	while not HasModelLoaded(`a_m_m_farmer_01`) do
-- 		RequestModel(`a_m_m_farmer_01`)
-- 		Wait(0)
-- 	end
-- 	local ped = CreatePed(4, `a_m_m_farmer_01`, coords, false, true)
-- 	-- SetPedComponentVariation(ped, 1, 4, 0, 2)
-- 	FreezeEntityPosition(ped, true)
-- 	SetEntityInvincible(ped, true)
-- 	SetBlockingOfNonTemporaryEvents(ped, true)
-- 	--[[


-- 	 ["box"] = {"anim@heists@box_carry@", "idle", "Box", AnimationOptions =
--    {
--        Prop = "hei_prop_heist_box",
--        PropBone = 60309,
--        PropPlacement = {0.025, 0.08, 0.255, -145.0, 290.0, 0.0},
--        EmoteLoop = true,
--        EmoteMoving = true,
--    }},
-- 	]]
-- 	local ad = "anim@heists@box_carry@" 
-- 	local anim = "idle"
-- 	while not HasAnimDictLoaded(ad) do
-- 		RequestAnimDict(ad)
-- 		Wait(1)
-- 	end
-- 	local box = CreateObject(`hei_prop_heist_box`, coords.x, coords.y, coords.z+0.2,  true,  true, true)
-- 	AttachEntityToEntity(box, ped, GetPedBoneIndex(ped, 60309), 0.025, 0.08, 0.255, -145.0, 290.0, 0.0, true, true, false, true, 1, true)
-- 	TaskPlayAnim(ped, ad, anim, 8.00, -8.00, -1, (2 + 16 + 32), 0.00, 0, 0, 0)

-- 	exports['qb-target']:AddTargetModel(`a_m_m_farmer_01`, {
-- 		options = {
-- 			{	
-- 				canInteract = function()
-- 					local playerped = PlayerPedId()
-- 					local playerpedcoords = GetEntityCoords(playerped)
-- 					local distance = #(playerpedcoords - vector3(coords.x, coords.y, coords.z))
-- 					if distance < 2.5 then
-- 						return true
-- 					end
-- 				end,
-- 				action = function()
-- 					local playerped = PlayerPedId()
-- 					RemoveBlip(blip)
-- 					DeleteEntity(ped)
-- 					AttachEntityToEntity(box, playerped, GetPedBoneIndex(playerped, 60309), 0.025, 0.08, 0.255, -145.0, 290.0, 0.0, true, true, false, true, 1, true)
					
-- 					TaskPlayAnim(playerped, ad, anim, 8.00, -8.00, -1, (2 + 16 + 32), 0.00, 0, 0, 0)

-- 				end,
-- 				icon = "fas fa-burn",
-- 				label = "Collect",
-- 			},
-- 		},          
-- 		distance = 2.5
-- 	})
-- end)

-- CreateThread(function()

-- 	local deliveryzones = {
-- 		[1] = vector4(716.75, -654.72, 27.78, 263.83)
-- 	}

-- 	local coords = deliveryzones[math.random(1, #deliveryzones)]
-- 	local blip = AddBlipForCoord(coords)
-- 	SetBlipSprite(blip, 1)
-- 	SetBlipDisplay(blip, 2)
-- 	SetBlipScale(blip, 1.0)
-- 	SetBlipAsShortRange(blip, false)
-- 	SetBlipColour(blip, 76)
-- 	BeginTextCommandSetBlipName("STRING")
-- 	AddTextComponentSubstringPlayerName("Get Stock")
-- 	EndTextCommandSetBlipName(blip)
-- 	SetBlipRoute(blip, true)



-- end)