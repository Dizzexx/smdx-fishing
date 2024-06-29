local QBCore = exports['qb-core']:GetCoreObject()

-- [CREATE PEDS] --
function CreateFishSellerPed()
    if not Config.PedSettings["enabled"] then
        return
    end
    local settings = Config.PedSettings
    local pedModel = settings["model"]
    local pedCoords = settings["coords"]
    local pedHeading = settings["heading"]

    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(0)
    end

    local FishPed = CreatePed(0, pedModel, pedCoords, pedHeading, false, false)
    FreezeEntityPosition(FishPed, true)
    SetEntityInvincible(FishPed, true)
end

function CreatePurchasePed()
    if not Config.BuyerPedSettings["enabled"] then
        return
    end
    local settings = Config.BuyerPedSettings
    local pedModel = settings["model"]
    local pedCoords = settings["coords"]
    local pedHeading = settings["heading"]

    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(0)
    end

    local FishPed = CreatePed(0, pedModel, pedCoords, pedHeading, false, false)
    FreezeEntityPosition(FishPed, true)
    SetEntityInvincible(FishPed, true)
end

-- [CREATE BLIPS] --
function CreateBlip()
    local settings = Config.BlipSettings.Store
    local blip = AddBlipForCoord(settings["coords"])
    SetBlipSprite(blip, settings["sprite"])
    SetBlipDisplay(blip, settings["display"])
    SetBlipScale(blip, settings["scale"])
    SetBlipColour(blip, settings["color"])
    SetBlipAsShortRange(blip, settings["shortRange"])
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(settings["name"])
    EndTextCommandSetBlipName(blip)
end

function CreateBuyBlip()
    local settings = Config.BlipSettings.Buyer
    local blip = AddBlipForCoord(settings["coords"])
    SetBlipSprite(blip, settings["sprite"])
    SetBlipDisplay(blip, settings["display"])
    SetBlipScale(blip, settings["scale"])
    SetBlipColour(blip, settings["color"])
    SetBlipAsShortRange(blip, settings["shortRange"])
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(settings["name"])
    EndTextCommandSetBlipName(blip)
end

local function createFishSpotBlips()
    for _, zone in ipairs(Config.FishingZones) do
        local blip = AddBlipForCoord(zone.coords)

        SetBlipSprite(blip, Config.BlipSettings.FishSpot.sprite)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, Config.BlipSettings.FishSpot.scale)
        SetBlipColour(blip, Config.BlipSettings.FishSpot.color)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.BlipSettings.FishSpot.name)
        EndTextCommandSetBlipName(blip)
    end
end

Citizen.CreateThread(function()
    createFishSpotBlips()
end)