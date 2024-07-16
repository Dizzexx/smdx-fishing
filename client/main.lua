local QBCore = exports['qb-core']:GetCoreObject()

-- [LOCALS] --
local isOpen, text = lib.isTextUIOpen()
local pedSpawned = false
local start = Config.Translations.Interact.start_fishing

-- [SPAWN PED] --
local function spawnPed()
    if not pedSpawned then
        CreateFishSellerPed()
        CreatePurchasePed()
        pedSpawned = true
    end
end

Citizen.CreateThread(function()
    spawnPed()
end)

-- [BLIP] --
Citizen.CreateThread(function()
    CreateBlip()
    CreateBuyBlip()
end)

RegisterNetEvent('smdx-fishing:openMenu')
AddEventHandler('smdx-fishing:openMenu', function()
    lib.showMenu('buy_fishing_supplies')
end)


RegisterNetEvent('smdx-fishing:openSellMenu')
AddEventHandler('smdx-fishing:openSellMenu', function()
    lib.showMenu('sell_fish')
end)