local QBCore = exports['qb-core']:GetCoreObject()

-- [BUY FISHING ROD] --
RegisterServerEvent('smdx_fishing:server:buyFishingrod')
AddEventHandler('smdx_fishing:server:buyFishingrod', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = Config.FishingCosts.fishingrod
    local item = Config.FishingSupplies.fishingrod
    local payment = Config.FishingSettings.paymentType

    if Player.Functions.RemoveMoney(payment, price) then
        Player.Functions.AddItem(item, 1)
        TriggerClientEvent('smdx_fishing:client:BoughtRodNotify', src)
    else
        TriggerClientEvent('smdx_fishing:client:NotBoughtRodNotify', src)
    end
end)

-- [BUY BAIT] --
RegisterServerEvent('smdx_fishing:server:buyBait')
AddEventHandler('smdx_fishing:server:buyBait', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = Config.FishingCosts.fishingbait
    local item = Config.FishingSupplies.fishingbait
    local payment = Config.FishingSettings.paymentType

    if Player.Functions.RemoveMoney(payment, price) then
        Player.Functions.AddItem(item, 1)
        TriggerClientEvent('smdx_fishing:client:BoughtBaitNotify', src)
    else
        TriggerClientEvent('smdx_fishing:client:NotBoughtBaitNotify', src)
    end
end)

-- [USE FISHING ROD] --
QBCore.Functions.CreateUseableItem('fishingrod', function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        
        TriggerClientEvent('smdx_fishing:client:startFishing', source)
    end
end)

-- [GET FISH REWARD] --
RegisterServerEvent('smdx_fishing:server:completeFishing')
AddEventHandler('smdx_fishing:server:completeFishing', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rewardItem = Config.RewardItem
    local removeItem = Config.FishingSupplies.fishingbait

    -- Check if the player has the required bait item
    local hasBait = Player.Functions.GetItemByName(removeItem)
    if hasBait and hasBait.amount >= 1 then
        Player.Functions.RemoveItem(removeItem, 1)
        
        Player.Functions.AddItem(rewardItem, 1)
    end
end)

-- [SELL FISH] --
RegisterServerEvent('smdx_fishing:server:sellOneFish')
AddEventHandler('smdx_fishing:server:sellOneFish', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rewardItem = Config.RewardItem

    local fishItem = Config.RewardItem
    local fishAmount = 1

    local fishPrice = Config.SellPrices.fish1

    local hasFish = Player.Functions.GetItemByName(fishItem)
    if hasFish and hasFish.amount >= fishAmount then
        TriggerClientEvent('smdx-fishing:client:FishOneSold', src)
        Player.Functions.RemoveItem(fishItem, fishAmount)
        Player.Functions.AddMoney('cash', fishPrice)
    else
        TriggerClientEvent('smdx-fishing:client:NotEnoughOneFish', src)
    end
end)

RegisterServerEvent('smdx_fishing:server:sellTwoFish')
AddEventHandler('smdx_fishing:server:sellTwoFish', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rewardItem = Config.RewardItem

    local fishItem = Config.RewardItem
    local fishAmount = 2

    local fishPrice = Config.SellPrices.fish2

    local hasFish = Player.Functions.GetItemByName(fishItem)
    if hasFish and hasFish.amount >= fishAmount then
        TriggerClientEvent('smdx-fishing:client:FishTwoSold', src)
        Player.Functions.RemoveItem(fishItem, fishAmount)
        Player.Functions.AddMoney('cash', fishPrice)
    else
        TriggerClientEvent('smdx-fishing:client:NotEnoughTwoFish', src)
    end
end)

RegisterServerEvent('smdx_fishing:server:sellFiveFish')
AddEventHandler('smdx_fishing:server:sellFiveFish', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rewardItem = Config.RewardItem

    local fishItem = Config.RewardItem
    local fishAmount = 5

    local fishPrice = Config.SellPrices.fish5

    local hasFish = Player.Functions.GetItemByName(fishItem)
    if hasFish and hasFish.amount >= fishAmount then
        TriggerClientEvent('smdx-fishing:client:FishFiveSold', src)
        Player.Functions.RemoveItem(fishItem, fishAmount)
        Player.Functions.AddMoney('cash', fishPrice)
    else
        TriggerClientEvent('smdx-fishing:client:NotEnoughFiveFish', src)
    end
end)