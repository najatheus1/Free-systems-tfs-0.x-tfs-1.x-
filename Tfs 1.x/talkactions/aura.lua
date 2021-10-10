--[[
    registre no xml : <talkaction words="!aura on;!aura off" script="aura.lua"/>
]]
local config_aurea = {
    effect = 11; -- efeito que vai ficar girando no player
    effect_health = 55; -- efeito qnd curar o player
    level_use = { -- level que vai ser usado (min/max)
        min = 1,
        max = 600,
    } ;
    health = 10; -- tanto que vai curar por time configurado
    pos_aurea = { -- não mexa
        [1] = {x = 0, y = -1};
        [2] = {x = 1, y = -1};
        [3] = {x = 1, y = 0};
        [4] = {x = 1, y = 1};
        [5] = {x = 0, y = 1};
        [6] = {x = -1, y = 1};
        [7] = {x = -1, y = 0};
        [8] = {x = -1, y = -1};
    };
    storage_pos = 1547637649; -- não mexa e nem repita esse valor em outro script!!
    storage = 165477963; -- não mexa e nem repita esse valor em outro script!!
    tempo_aurea = 250; -- tempo da aurea para passar em cada posição
}

local function calculePosAurea(player_uid)
    local player = Player(player_uid)
    if(not(player))then
        return(nil)
    end

    if(player:getStorageValue(config_aurea.storage) <= 0)then
        return(nil)
    end

    if(player:getStorageValue(config_aurea.storage_pos) >= 8)then
        player:setStorageValue(config_aurea.storage_pos, 0)
    end

    player:setStorageValue(config_aurea.storage_pos, player:getStorageValue(config_aurea.storage_pos) + 1)
    return(player:getStorageValue(config_aurea.storage_pos))
end

local function posAurea(player_uid)
    local player = Player(player_uid)
    if(not(player))then
        return(nil)
    end

    if(player:getStorageValue(config_aurea.storage) <= 0)then
        return(nil)
    end

    local pos_x = player:getPosition().x
    local pos_y = player:getPosition().y
    local pos_z = player:getPosition().z

    local aa = calculePosAurea(player_uid)

    local pos = Position(pos_x + config_aurea.pos_aurea[aa].x, pos_y + config_aurea.pos_aurea[aa].y, pos_z)
    if(not(pos))then
        return(nil)
    end
   return(pos)
end

local function aurea(player_uid)
    local player = Player(player_uid)
    if(not(player))then
        return(nil)
    end

    if(player:getStorageValue(config_aurea.storage) <= 0)then
        return(nil)
    end

    player:addHealth(config_aurea.health)
    player:addMana(20)
    player:getPosition():sendMagicEffect(config_aurea.effect_health)

    local position = posAurea(player_uid)
    position:sendMagicEffect(config_aurea.effect)
    addEvent(aurea, config_aurea.tempo_aurea, player_uid)
end

function onSay(player, words, param)
    if(words == "!aura on")then
    if(player:getLevel() > config_aurea.level_use.max)then
        return(player:sendTextMessage(MESSAGE_STATUS_SMALL, player:getName() .. " seu level(" .. player:getLevel() .. ") precisa ser maior(" .. config_aurea.level_use.max) and false)
    end

    if(player:getLevel() < config_aurea.level_use.min)then
        return(player:sendTextMessage(MESSAGE_STATUS_SMALL, player:getName() .. " seu level(" .. player:getLevel() .. ") precisa ser menor(" .. config_aurea.level_use.max) and false)
    end

    if(player:getStorageValue(config_aurea.storage) >= 1)then
        return(player:sendTextMessage(MESSAGE_STATUS_SMALL, player:getName() .. " Você ja esta com a aurea ligada") and false)
    end

    player:setStorageValue(config_aurea.storage, 1)
    player:setStorageValue(config_aurea.storage_pos, 0)
    aurea(player.uid)
    elseif(words == "!aura off")then
        player:setStorageValue(config_aurea.storage, 0)
    end
  return(false)
end