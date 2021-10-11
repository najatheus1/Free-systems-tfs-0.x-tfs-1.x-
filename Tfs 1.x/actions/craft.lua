--[[
    Registre no xml : <action itemid="eo id do item que ser utilizado" script="craft.lua" />
]]

local config = {
    storage_outfit = 4584864776; -- storage da outfit não mexa
    count = 0;
    [2704] = { -- id do item que vai ser craft ( arvore )
        level_use = { -- level para dar craft MIN/MAX
            min = 0;
            max = 100;
        };
        outfit = { -- id da outfit male/famela
            male = 1275;
            female = 1276;
        };
        item_create = 3000; -- id do item que o jogador vai receber
        count = 1; -- a quandidade que ele vai receber
        transform = 2713; -- tranformção do item que vai ser craft
        time_transform = 3000; -- o tempo para transforma o item ( arvore )
        time_addItem = 3050; -- tempo que o player vai ganhar o item ( obs sempre coloque time_tranform + 50 )
        time_message = 300; -- tempo que a mensagem vai carregar ( obs - time_transform / 10 )
    }
}

local function respawnItem(pos_item, item_id)
    local tile = Tile(pos_item)
    if not tile then
        return
    end

    local item = tile:getTopVisibleThing()
    if not item then
        return
    end

    item:transform(item_id)
    Game.sendAnimatedText("Sucess", pos_item, math.random(1, 255))
end

local function tranformItem(item_uid, value)
    local tile = Tile(item_uid)
    if not tile then
        return
    end

    local item = tile:getTopVisibleThing()
    if not item then
        return
    end

    local item_id = item:getId()

    addEvent(respawnItem, 3000, item_uid, item_id)

    item:transform(value)
end

local function message(pos_, time)
    if(config.count >= 10)then
        config.count = 0
        return
    end

    config.count = config.count + 1

    Game.sendAnimatedText(config.count .. "/" .. 10, pos_, math.random(1, 255))
    addEvent(message, time, pos_, time)
end

local function addItem(player_uid, value_item, value_count)
    local player = Player(player_uid)
    if not player then
        return
    end

    player:addItem(value_item, value_count, 1, 3)
    local outfit = player:getStorageValue(config.storage_outfit)
    player:setOutfitLookType(outfit)
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local item_target = Item(target.uid)
    if not item_target then
        return not player:sendTextMessage(MESSAGE_INFO_DESCR, player:getName() .. " isso não é um item")
    end

    local target_id = item_target:getId()
    local config_table = config[target_id]
    if not config_table then
        return not player:sendTextMessage(MESSAGE_INFO_DESCR, player:getName() .. " esse item não pode ser minerado")
    end

    if(player:getLevel() < config_table.level_use.min)then
        return not player:sendTextMessage(MESSAGE_INFO_DESCR, player:getName() .. " Seu level esta muito baixo para minerar esse item, level requerido (" .. config_table.level_use.min .. ")")
    end

    if(player:getLevel() > config_table.level_use.max)then
        return not player:sendTextMessage(MESSAGE_INFO_DESCR, player:getName() .. " Seu level esta muito alto para minerar esse item, level requerido (" .. config_table.level_use.max .. ")")
    end

    local outfit = player:getOutfit().lookType
    player:setStorageValue(config.storage_outfit, outfit)

    if(player:getSex() > 1)then
        player:setOutfitLookType(config_table.outfit.male)
    else
        player:setOutfitLookType(config_table.outfit.female)
    end

    local pos_target = item_target:getPosition()

    message(pos_target, config_table.time_message)
    addEvent(tranformItem, config_table.time_transform, pos_target, config_table.transform)
    addEvent(addItem, config_table.time_addItem, player.uid, config_table.item_create, config_table.count)
    return true
end