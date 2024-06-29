Config = {}

-- [TRANSLATIONS] --
Config.Translations = {
    BuyMenu = {
        fish_shop_name = 'Fishing Shop',
        menu_option_rod = 'Fishingrod | $10',
        menu_option_bait = 'Fishing Bait | $2',
    },
    SellMenu = {
        fish_shop_name = 'Fish Buyer',
        menu_option_fish_1 = 'Fish x1',
        menu_option_fish_2 = 'Fish x2',
        menu_option_fish_5 = 'Fish x5',
    },
    MenuDescriptions = {
        buy_rod = 'Buy a fishing rod for $10',
        buy_bait = 'Buy fishing bait for $2',
        sell_fish = 'Sell x1 fish',
        sell_fish2 = 'Sell x2 fishes',
        sell_fish5 = 'Sell x5 fishes',
    },
    Progress = {
        fishing = 'Fishing...',
    },
    Titles = {
        not_enough_money = 'NO MONEY',
        not_enough_fish = 'NOT ENOUGH FISH',
    },
    Interact = {
        open_fish_shop = '[E] - Fishing Shop',
        open_seller = '[E] - Sell Fish',
    },
    Notify = {
        bought_fishing_rod = 'You bought a fishing rod for $10',
        bought_fishing_bait = 'You bought fishing bait for $2',
        not_enough_money = 'You do not have enough money...',
        not_enough_fish = 'You do not have enough fish...',
    }
}

-- [NOTIFICATIONS] --
Config.Notifications = {
    fishing_started = {
        title = 'FISHING',
        message = 'You have started fishing!',
        type = 'info',
    },
    fishing_complete = {
        title = 'FISHING',
        message = 'You have caught a fish!',
        type = 'success',
    },
    not_allowed = {
        title = 'FISHING',
        message = 'You can only fish in designated fishing zones.',
        type = 'error',
    },
    no_bait = {
        title = 'BAIT',
        message = 'You do not have any fishing bait...',
        type = 'error',
    },
    not_enough_fish = {
        title = 'NOT ENOUGH FISH',
        message = 'You don\'t have enough fish to sell...',
        type = 'error',
    },
    sold_one_fish = {
        title = 'SOLD FISH',
        message = 'You sold 1 fish for $12',
        type = 'success',
    },
    sold_two_fish = {
        title = 'SOLD FISH',
        message = 'You sold 2 fish for $24',
        type = 'success',
    },
    sold_five_fish = {
        title = 'SOLD FISH',
        message = 'You sold 5 fish for $58',
        type = 'success',
    },
}

-- [PED SETTINGS] --
Config.PedSettings = {
    enabled = true,
    model = 'a_m_m_tourist_01',
    coords = vector3(1338.79, 4269.65, 30.5),
    heading = 85.7,
}

Config.BuyerPedSettings = {
    enabled = true,
    model = 'a_m_m_salton_02',
    coords = vector3(-1453.29, -387.26, 37.19),
    heading = 34.15,
}

-- [BLIP SETTINGS] --
Config.BlipSettings = {
    Store = {
        coords = vector3(1338.79, 4269.65, 30.5),
        sprite = 68,
        display = 4,
        scale = 0.8,
        color = 2,
        shortRange = true,
        name = 'Fishing Shop',
    },
    Buyer = {
        coords = vector3(-1453.73, -386.69, 38.18),
        sprite = 68,
        display = 4,
        scale = 0.8,
        color = 3,
        shortRange = true,
        name = 'Fish Buyer',
    },
    FishSpot = {
        coords = vector3(1333.11, 4269.42, 31.5),
        sprite = 373,
        display = 4,
        scale = 0.8,
        color = 3,
        shortRange = true,
        name = 'Fishing Spot',
    }
}

-- [FISHING SUPPLIES (Item Names)] --
Config.FishingSupplies = {
    fishingrod = 'fishingrod',
    fishingbait = 'fish_bait',
}

-- [FISHING PRODUCTS COSTS] --
Config.FishingCosts = {
    fishingrod = 10,
    fishingbait = 2,
}

-- [FISHING REWARDS] --
Config.RewardItem = 'meth'
Config.SellPrices = {
    fish1 = 12,
    fish2 = 24,
    fish5 = 58,
}

-- [FISHING LOCATIONS] --
Config.FishingZones = {
    {coords = vector3(1333.31, 4269.59, 31.5), radius = 10.0},
    {coords = vector3(1429.05, 3820.19, 31.39), radius = 10.0},
    {coords = vector3(-1859.21, -1242.67, 8.62), radius = 10.0},
    -- Add more fishing zones if you want | You can also adjust the radius of the fishing zones
}

-- [OVERALL FISHING SETTINGS] --
Config.FishingSettings = {
    fishingTime = 10000,
    paymentType = 'cash', -- 'cash' or 'bank'
}