local QBCore = exports['qb-core']:GetCoreObject()

local rodpurchased = Config.Translations.Notify.bought_fishing_rod
local baitpurchased = Config.Translations.Notify.bought_fishing_bait
local nomoney = Config.Translations.Notify.not_enough_money
local nomoneytitle = Config.Translations.Titles.not_enough_money

local function isInFishingZone()
    local playerCoords = GetEntityCoords(PlayerPedId())
    for _, zone in ipairs(Config.FishingZones) do
        local distance = #(playerCoords - zone.coords)
        if distance < zone.radius then
            return true
        end
    end
    return false
end

-- [BUY FISHING ROD NOTIFY] --
RegisterNetEvent('smdx_fishing:client:BoughtRodNotify')
AddEventHandler('smdx_fishing:client:BoughtRodNotify', function()
    lib.notify({
        title = 'PURCHASE',
        description = rodpurchased,
        type = 'success'
    })
end)

RegisterNetEvent('smdx_fishing:client:NotBoughtRodNotify')
AddEventHandler('smdx_fishing:client:NotBoughtRodNotify', function()
    lib.notify({
        title = nomoneytitle,
        description = nomoney,
        type = 'error'
    })
end)

-- [BUY BAIT NOTIFY] --
RegisterNetEvent('smdx_fishing:client:BoughtBaitNotify')
AddEventHandler('smdx_fishing:client:BoughtBaitNotify', function()
    lib.notify({
        title = 'PURCHASE',
        description = baitpurchased,
        type = 'success'
    })
end)

RegisterNetEvent('smdx_fishing:client:NotBoughtBaitNotify')
AddEventHandler('smdx_fishing:client:NotBoughtBaitNotify', function()
    lib.notify({
        title = nomoneytitle,
        description = nomoney,
        type = 'error'
    })
end)

-- [START FISHING] --
RegisterNetEvent('smdx_fishing:client:startFishing')
AddEventHandler('smdx_fishing:client:startFishing', function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    local startedFishing = Config.Notifications.fishing_started.message
    local fishing = Config.Notifications.fishing_started.title
    local notifyType = Config.Notifications.fishing_started.type

    local notAllowedMess = Config.Notifications.not_allowed.message
    local notAllowedTitle = Config.Notifications.not_allowed.title
    local notAllowedType = Config.Notifications.not_allowed.type

    local noBaitMess = Config.Notifications.no_bait.message
    local noBaitTitle = Config.Notifications.no_bait.title
    local noBaitType = Config.Notifications.no_bait.type

    local fishingProg = Config.Translations.Progress.fishing
    local fishingTime = Config.FishingSettings.fishingTime

    local caughtFishMess = Config.Notifications.fishing_complete.message
    local caughtFishNotifyType = Config.Notifications.fishing_complete.type

    if isInFishingZone() then
        -- Check if the player has the "fish_bait" item
        QBCore.Functions.TriggerCallback('smdx_fishing:server:hasBait', function(hasBait)
            if hasBait then
                lib.notify({
                    title = fishing,
                    description = startedFishing,
                    type = notifyType
                })

                lib.progressBar({
                    duration = fishingTime,
                    label = fishingProg,
                    position = 'bottom',
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        car = true,
                    },
                    anim = {
                        dict = 'amb@world_human_stand_fishing@idle_a',
                        clip = 'idle_c'
                    },
                    prop = {
                        model = `prop_fishing_rod_01`,  -- Change this to the correct prop model
                        pos = vec3(0.03, 0.03, 0.02),
                        rot = vec3(0.0, 0.0, -1.5),
                        bone = 60309  -- Right hand bone
                    },
                })

                -- Notify the player that they have caught a fish
                lib.notify({
                    title = fishing,
                    description = caughtFishMess,
                    type = caughtFishNotifyType
                })

                -- Trigger the server event to complete fishing
                TriggerServerEvent('smdx_fishing:server:completeFishing')
            else
                lib.notify({
                    title = noBaitTitle,
                    description = noBaitMess,
                    type = noBaitType
                })
            end
        end)
    else
        lib.notify({
            title = notAllowedTitle,
            description = notAllowedMess,
            type = notAllowedType
        })
    end
end)

-- [NOT ENOUGH FISH NOTIFICATIONS] --
RegisterNetEvent('smdx-fishing:client:NotEnoughOneFish')
AddEventHandler('smdx-fishing:client:NotEnoughOneFish', function()

    local nofishDesc = Config.Notifications.not_enough_fish.message
    local nofishTitle = Config.Notifications.not_enough_fish.title
    local nofishType = Config.Notifications.not_enough_fish.type

    lib.notify({
        title = nofishTitle,
        description = nofishDesc,
        type = nofishType
    })
end)

RegisterNetEvent('smdx-fishing:client:NotEnoughTwoFish')
AddEventHandler('smdx-fishing:client:NotEnoughTwoFish', function()

    local nofishDesc = Config.Notifications.not_enough_fish.message
    local nofishTitle = Config.Notifications.not_enough_fish.title
    local nofishType = Config.Notifications.not_enough_fish.type

    lib.notify({
        title = nofishTitle,
        description = nofishDesc,
        type = nofishType
    })
end)

RegisterNetEvent('smdx-fishing:client:NotEnoughFiveFish')
AddEventHandler('smdx-fishing:client:NotEnoughFiveFish', function()

    local nofishDesc = Config.Notifications.not_enough_fish.message
    local nofishTitle = Config.Notifications.not_enough_fish.title
    local nofishType = Config.Notifications.not_enough_fish.type

    lib.notify({
        title = nofishTitle,
        description = nofishDesc,
        type = nofishType
    })
end)

-- [FISH SOLD NOTIFICATIONS] --
RegisterNetEvent('smdx-fishing:client:FishOneSold')
AddEventHandler('smdx-fishing:client:FishOneSold', function()

    local fishSoldTitle = Config.Notifications.sold_one_fish.title
    local fishSoldDesc = Config.Notifications.sold_one_fish.message
    local fishSoldType = Config.Notifications.sold_one_fish.type

    lib.notify({
        title = fishSoldTitle,
        description = fishSoldDesc,
        type = fishSoldType
    })
end)

RegisterNetEvent('smdx-fishing:client:FishTwoSold')
AddEventHandler('smdx-fishing:client:FishTwoSold', function()

    local fishSoldTitle = Config.Notifications.sold_two_fish.title
    local fishSoldDesc = Config.Notifications.sold_two_fish.message
    local fishSoldType = Config.Notifications.sold_two_fish.type

    lib.notify({
        title = fishSoldTitle,
        description = fishSoldDesc,
        type = fishSoldType
    })
end)

RegisterNetEvent('smdx-fishing:client:FishFiveSold')
AddEventHandler('smdx-fishing:client:FishFiveSold', function()

    local fishSoldTitle = Config.Notifications.sold_five_fish.title
    local fishSoldDesc = Config.Notifications.sold_five_fish.message
    local fishSoldType = Config.Notifications.sold_five_fish.type

    lib.notify({
        title = fishSoldTitle,
        description = fishSoldDesc,
        type = fishSoldType
    })
end)