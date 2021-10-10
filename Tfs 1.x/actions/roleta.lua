--[[
    registro no xml : <action itemid="o id da alavanca do seu servidor" script="roleta.lua" />
]]

local configuration_table = {
    storage_pos_item = 0; -- não mexa
    level_requeriment = { -- requimento para poder girar alavanca
        min = 1;
        max = 100;
    };
    count = 0; -- não mexa
    count_gire_item = 0;
    bag_id = 1991;
    count_remove = 0; -- não mexa
    floor_id_or_table = 10449; -- id da mesa ou piso que vão ficar os item por cima
    items = {3000, 2012, 13042, 13045, 13047, 13051, 13044, 13041}; -- items da roleta que vai ser usado na roleta
    effect_item = 8; -- efeito de quando estiver gerando o item
    effect_addItem = 1;  -- efeito de qnd o player receber o item
    effect_addItem_remove = 32; -- efeito de qnd o item for pro slot do player
    effect_removeItem = 36; -- efeito de qnd for remover os item da mesa ou piso
    time_create_item = 400; -- tempo para criar um a um item na mesa ou piso
    time_calcule_pos_item = 500; -- tempo para mover o item para a proxima posição
    time_count_calcule_pos_item = 3200; -- tempo para começar a mover o item ( obs o calculo min tem que ser a quantidade de mesa que vai ter x o tempo time_create_item)
    position = { -- configuração dos movimentos e posição
        create_item = { -- posição para criar os items
            [1] = {x = 981, y = 945, z = 7};
            [2] = {x = 981, y = 946, z = 7};
            [3] = {x = 982, y = 945, z = 7};
            [4] = {x = 982, y = 946, z = 7};
            [5] = {x = 983, y = 945, z = 7};
            [6] = {x = 983, y = 946, z = 7};
            [7] = {x = 984, y = 945, z = 7};
            [8] = {x = 984, y = 946, z = 7};
        };
        roleta = { -- giros da roleta
            [1] = {            
                [1] = {x = 0, y = 1, z = 0};
                [2] = {x = 1, y = -1, z = 0};
                [3] = {x = 0, y = 1, z = 0};
                [4] = {x = 1, y = -1, z = 0};
                [5] = {x = 0, y = 1, z = 0};
                [6] = {x = 1, y = -1, z = 0};
                [7] = {x = 0, y = 1, z = 0};
                [8] = {x = 3, y = 0, z = 0};
            };
            [2] = {
                [1] = {x = 0, y = 0, z = 0};
                [2] = {x = 1, y = -1, z = 0};
                [3] = {x = 0, y = 1, z = 0};
                [4] = {x = 1, y = -1, z = 0};
                [5] = {x = 0, y = 1, z = 0};
                [6] = {x = 1, y = -1, z = 0};
                [7] = {x = 0, y = 1, z = 0};
                [8] = {x = 3, y = 0, z = 0};
            };
            [3] = {
                [1] = {x = 0, y = 0, z = 0};
                [2] = {x = 0, y = 0, z = 0};
                [3] = {x = 0, y = 1, z = 0};
                [4] = {x = 1, y = -1, z = 0};
                [5] = {x = 0, y = 1, z = 0};
                [6] = {x = 1, y = -1, z = 0};
                [7] = {x = 0, y = 1, z = 0};
                [8] = {x = 3, y = 0, z = 0};
            };
            [4] = {
                [1] = {x = 0, y = 0, z = 0};
                [2] = {x = 0, y = 0, z = 0};
                [3] = {x = 0, y = 0, z = 0};
                [4] = {x = 1, y = -1, z = 0};
                [5] = {x = 0, y = 1, z = 0};
                [6] = {x = 1, y = -1, z = 0};
                [7] = {x = 0, y = 1, z = 0};
                [8] = {x = 3, y = 0, z = 0};
            };
            [5] = {
                [1] = {x = 0, y = 0, z = 0};
                [2] = {x = 0, y = 0, z = 0};
                [3] = {x = 0, y = 0, z = 0};
                [4] = {x = 0, y = 0, z = 0};
                [5] = {x = 0, y = 1, z = 0};
                [6] = {x = 1, y = -1, z = 0};
                [7] = {x = 0, y = 1, z = 0};
                [8] = {x = 3, y = 0, z = 0};
            };
            [6] = {
                [1] = {x = 0, y = 0, z = 0};
                [2] = {x = 0, y = 0, z = 0};
                [3] = {x = 0, y = 0, z = 0};
                [4] = {x = 0, y = 0, z = 0};
                [5] = {x = 0, y = 0, z = 0};
                [6] = {x = 1, y = -1, z = 0};
                [7] = {x = 0, y = 1, z = 0};
                [8] = {x = 3, y = 0, z = 0};
            };
            [7] = {
                [1] = {x = 0, y = 0, z = 0};
                [2] = {x = 0, y = 0, z = 0};
                [3] = {x = 0, y = 0, z = 0};
                [4] = {x = 0, y = 0, z = 0};
                [5] = {x = 0, y = 0, z = 0};
                [6] = {x = 0, y = 0, z = 0};
                [7] = {x = 0, y = 1, z = 0};
                [8] = {x = 3, y = 0, z = 0};
            };
            [8] = {
                [1] = {x = 0, y = 0, z = 0};
                [2] = {x = 0, y = 0, z = 0};
                [3] = {x = 0, y = 0, z = 0};
                [4] = {x = 0, y = 0, z = 0};
                [5] = {x = 0, y = 0, z = 0};
                [6] = {x = 0, y = 0, z = 0};
                [7] = {x = 0, y = 0, z = 0};
                [8] = {x = 3, y = 0, z = 0};
            };
        }
    }
}

local function createItemPos()
    if(configuration_table.count >= #configuration_table.position.create_item)then
        configuration_table.count = 0
        return
    end

    configuration_table.count = configuration_table.count + 1

    local item = Game.createItem(configuration_table.items[math.random(1, #configuration_table.items)], 1, configuration_table.position.create_item[configuration_table.count])
    local pos_item = item:getPosition()
    pos_item:sendMagicEffect(configuration_table.effect_item)
    item:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Item do evento da roleta")
    addEvent(createItemPos, configuration_table.time_create_item)
end

local function removeItemPos()
    if(configuration_table.count_remove >= #configuration_table.position.create_item)then
        configuration_table.count_remove = 0
        return
    end

    configuration_table.count_remove = configuration_table.count_remove + 1

    local tile = Tile(configuration_table.position.create_item[configuration_table.count_remove])
    if not tile then
        return
    end

   local item = tile:getTopVisibleThing()
   if not item then
       return
   end

   if(item:getId() == configuration_table.floor_id_or_table)then
        return removeItemPos()
   end

   item:getPosition():sendMagicEffect(configuration_table.effect_removeItem)
   item:remove()
   removeItemPos()
end

local function addItemPlayer(player_uid)
    local player = Player(player_uid)
    if not player then
        return
    end

    local tile = Tile(configuration_table.storage_pos_item)
    if not tile then
        return
    end

    local item = tile:getTopVisibleThing()
    if not item then
        return
    end

    local player_pos = player:getPosition()
    local item_pos = item:getPosition()

    local bag = player:addItem(configuration_table.bag_id, 1, true, 1, 3)
    bag:addItem(item:getId(), item:getCount(), true, 1, 3)
    player_pos:sendMagicEffect(configuration_table.effect_addItem)
    item_pos:sendMagicEffect(configuration_table.effect_addItem_remove)
    item:remove(item:getCount())
end

local function calculePosItem(value, player_uid)
    if(configuration_table.count_gire_item >= #configuration_table.position.create_item)then
        removeItemPos()
        addItemPlayer(player_uid)
        configuration_table.count_gire_item = 0
        return nil
    end

    configuration_table.count_gire_item = configuration_table.count_gire_item + 1

    local tile = Tile(configuration_table.position.create_item[configuration_table.count_gire_item])
    if not tile then
        return nil
    end

   local item = tile:getTopVisibleThing()
   if not item then
       return nil
   end

   if(item:getId() == configuration_table.floor_id_or_table)then
       return nil
   end

   local pos = item:getPosition()
   local item_pos_x = pos.x
   local item_pos_y = pos.y
   local item_pos_z = pos.z

   local pos_ = configuration_table.position.roleta[value]

   local position = Position(item_pos_x + pos_[configuration_table.count_gire_item].x, item_pos_y + pos_[configuration_table.count_gire_item].y, item_pos_z)
   if not position then
        return nil
   end

    configuration_table.storage_pos_item = position

   item:moveTo(position)
   addEvent(calculePosItem, configuration_table.time_calcule_pos_item, value, player_uid)
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if(player:getLevel() > configuration_table.level_requeriment.max)then
        return(not(player:sendTextMessage(MESSAGE_INFO_DESCR, player:getName() .. " your level(" .. player:getLevel() .. ") needs to be bigger(" .. configuration_table.level_requeriment.max .. ")")))
    end

    if(player:getLevel() < configuration_table.level_requeriment.min)then
        return(not(player:sendTextMessage(MESSAGE_INFO_DESCR, player:getName() .. " your level(" .. player:getLevel() .. ") needs to be smaller(" .. configuration_table.level_requeriment.min .. ")")))
    end

    if(configuration_table.count_gire_item >= 1) or (configuration_table.count >= 1) or (configuration_table.count_remove >= 1)then
        return(not(player:sendTextMessage(MESSAGE_INFO_DESCR, player:getName() .. " wait the roulette is in action, wait for it to finish")))
    end

    local random = math.random(1, #configuration_table.position.roleta)

    configuration_table.storage_pos_item = 0

    createItemPos()
    addEvent(calculePosItem, configuration_table.time_count_calcule_pos_item, random, player.uid)
    Game.sendAnimatedText("Spin number will be: " .. random, player:getPosition(), math.random(1, 255))
    player:sendTextMessage(MESSAGE_INFO_DESCR, player:getName() .. " item of the day is on the rocks there")
  return true
end