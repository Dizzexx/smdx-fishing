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

-- [PED INTERACTION] --
Citizen.CreateThread(function()
    local UiShown = false

    while true do
        Citizen.Wait(20) -- KANSKE justera lite senare

        local player = PlayerPedId()
        local playerCoords = GetEntityCoords(player)
        local pedCoords = Config.PedSettings["coords"]
        local distance = #(playerCoords - pedCoords)

        if distance < 2.0 then
            if not UiShown then
                lib.showTextUI(Config.Translations.Interact.open_fish_shop)
                UiShown = true
            end

            if IsControlJustReleased(0, 38) then
                lib.showMenu('buy_fishing_supplies')
                lib.hideTextUI()
                UiShown = false
            end
        else
            if UiShown then
                lib.hideTextUI()
                UiShown = false
            end
        end
    end
end)

-- [SELLER PED] --
Citizen.CreateThread(function()
    local UiShown = false

    while true do
        Citizen.Wait(20) -- KANSKE justera lite senare

        local player = PlayerPedId()
        local playerCoords = GetEntityCoords(player)
        local pedCoords = Config.BuyerPedSettings["coords"]
        local distance = #(playerCoords - pedCoords)

        if distance < 2.0 then
            if not UiShown then
                lib.showTextUI(Config.Translations.Interact.open_seller)
                UiShown = true
            end

            if IsControlJustReleased(0, 38) then
                lib.showMenu('sell_fish')
                lib.hideTextUI()
                UiShown = false
            end
        else
            if UiShown then
                lib.hideTextUI()
                UiShown = false
            end
        end
    end
end)