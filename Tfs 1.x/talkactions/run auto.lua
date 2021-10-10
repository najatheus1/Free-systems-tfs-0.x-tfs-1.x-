--[[
    registre no xml : <talkaction words="run" script="run auto.lua" />
]]

local config = {
 speed_storage = 5237688;
 value_storage = 1;
 speed = 100;
 effect = 13;
 event_time = 3000
}

local function run(value)
    local player = Player(value)
    if(not(player))then
        return
    end

    if(player:getStorageValue(config.speed_storage) >= 1)then
        player:setStorageValue(config.speed_storage, 0)
        player:changeSpeed(-config.speed)
        run(player)
        return
    end

    player:say("run", TALKTYPE_MONSTER_SAY)
    player:getPosition():sendMagicEffect(config.effect)
    player:changeSpeed(config.speed)
    player:setStorageValue(config.speed_storage, config.value_storage)
    addEvent(run, config.event_time, player.uid)
end

function onSay(player, words, param)
    run(player.uid)
end