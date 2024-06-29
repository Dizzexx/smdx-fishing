local buyFish = Config.Translations.BuyMenu.fish_shop_name
local rod = Config.Translations.BuyMenu.menu_option_rod
local bait = Config.Translations.BuyMenu.menu_option_bait
local rodDesc = Config.Translations.MenuDescriptions.buy_rod
local baitDesc = Config.Translations.MenuDescriptions.buy_bait

local sellFish = Config.Translations.SellMenu.fish_shop_name
local fish = Config.Translations.SellMenu.menu_option_fish_1
local fish2 = Config.Translations.SellMenu.menu_option_fish_2
local fish5 = Config.Translations.SellMenu.menu_option_fish_5

local fishDesc = Config.Translations.MenuDescriptions.sell_fish
local fishDesc2 = Config.Translations.MenuDescriptions.sell_fish2
local fishDesc5 = Config.Translations.MenuDescriptions.sell_fish5

lib.registerMenu({
    id = 'buy_fishing_supplies',
    title = buyFish,
    position = 'top-left',
    options = {
        {label = rod, description = rodDesc, args = {action = 'buy_rod'}},
        {label = bait, description = baitDesc, args = {action = 'buy_bait'}}
    }
}, function(selected, scrollIndex, args)
    -- This callback is triggered when a button is pressed
    if args.action == 'buy_rod' then
        TriggerServerEvent('smdx_fishing:server:buyFishingrod')
        -- Add your logic to handle the purchase here
    elseif args.action == 'buy_bait' then
        -- Handle buying fishing bait
        TriggerServerEvent('smdx_fishing:server:buyBait')
        -- Add your logic to handle the purchase here
    end
end)

lib.registerMenu({
    id = 'sell_fish',
    title = sellFish,
    position = 'top-left',
    options = {
        {label = fish, description = fishDesc, args = {action = 'sell_fish'}},
        {label = fish2, description = fishDesc2, args = {action = 'sell_fish2'}},
        {label = fish5, description = fishDesc5, args = {action = 'sell_fish5'}}
    }
}, function(selected, scrollIndex, args)
    -- This callback is triggered when a button is pressed
    if args.action == 'sell_fish' then
        TriggerServerEvent('smdx_fishing:server:sellOneFish')
        -- Add your logic to handle the purchase here
    elseif args.action == 'sell_fish2' then
        -- Handle buying fishing bait
        TriggerServerEvent('smdx_fishing:server:sellTwoFish')
        -- Add your logic to handle the purchase here
    elseif args.action == 'sell_fish5' then
        -- Handle buying fishing bait
        TriggerServerEvent('smdx_fishing:server:sellFiveFish')
        -- Add your logic to handle the purchase here
    end
end)