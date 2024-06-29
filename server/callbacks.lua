local QBCore = exports['qb-core']:GetCoreObject()

-- [HAS BAIT CALLBACK] --
QBCore.Functions.CreateCallback('smdx_fishing:server:hasBait', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        local hasBait = Player.Functions.GetItemByName('fish_bait')
        cb(hasBait ~= nil and hasBait.amount > 0)
    else
        cb(false)
    end
end)