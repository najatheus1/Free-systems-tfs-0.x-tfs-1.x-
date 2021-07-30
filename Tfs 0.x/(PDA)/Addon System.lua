ADDON_CONFIG ={
    [1] = {
        addon1 = 2079,
        pokemon = "Blastoise",
		name_addon = "Red ninja pack",
		habilidade = 2089,
    },
	[2] = {
		addon1 = 2073,
		pokemon = "Charizard",
		name_addon = "Halloween addons",
		habilidade = 2071,
	},
	[3] = {
		addon1 = 2018,
		pokemon = "Metagross",
		name_addon = "King's crown addons",
		habilidade = 2063,
	},
}

local addon_type = {
    [13114] = {
        pokemon_use = "Blastoise",
        type = 1,
    },
    [13107] = {
        pokemon_use = "Charizard",
        type = 2,
    },
    [13103] = {
        pokemon_use = "Metagross",
        type = 3,
    },
}

Return_addon_table = {
    [1] = {
        retu = 13114,
    },
    [2] = {
        retu = 13107,
    },
    [3] = {
        retu = 13103,
    }
}

function AddonSystem(cid, item, item2)
local addon = addon_type[item.itemid]
if not addon then return doPlayerSendCancel(cid, "problem on the table") end
if(#getCreatureSummons(cid) >= 1)then return doPlayerSendCancel(cid, "You need to have the pokemon inside the ball") end
local slot = getPlayerSlotItem(cid, CONST_SLOT_FEET)
if not slot.uid then return doPlayerSendCancel(cid, "Target needs to be in sun or ball") end
if(item2 ~= slot.uid) then return doPlayerSendCancel(cid, "Target needs to be in sun or ball") end
local pokeball = getItemAttribute(slot.uid, "poke")
if(pokeball ~= addon.pokemon_use)then return doPlayerSendCancel(cid, "this addon is not from this pokemon") end
local poke_Addon = getItemAttribute(slot.uid, "pokeaddon")
if(poke_Addon)then
if(poke_Addon == addon.type)then 
return doPlayerSendCancel(cid, "your pokemon already has this addon")
end
end
doRemoveItem(item.uid,1)
doSendMagicEffect(getThingPos(cid), 180)
return doItemSetAttribute(slot.uid, "pokeaddon", addon.type)
end

function addonTransformOutfit(cid, attributeValor, pokeball)
local addon_config = ADDON_CONFIG[attributeValor]
if not addon_config then return false end
if not attributeValor then return false end
if(addon_config == pokeball)then return false end
local pk = getCreatureSummons(cid)[1]
if not pk then return false end
local pokemon_outfit = getCreatureOutfit(pk)
if not pokemon_outfit then return false end
pokemon_outfit.lookType = addon_config.addon1
doCreatureChangeOutfit(pk, pokemon_outfit)
return true
end

function removeAddon(cid, slot, valueAttribute)
local addon_Return = Return_addon_table[valueAttribute]
if not addon_Return then return false end
doPlayerAddItem(cid, addon_Return.retu, 1)
doItemEraseAttribute(slot.uid, "pokeaddon")
doSendMagicEffect(getThingPos(cid), 180)
end

function addonTransformOutfitAbility(cid)
local slot = getPlayerSlotItem(cid, CONST_SLOT_FEET)
if not slot then return false end
local addon = getItemAttribute(slot.uid, "pokeaddon")
local table_addon = ADDON_CONFIG[addon]
if not table_addon then return false end
doSetCreatureOutfit(cid, {lookType = table_addon.habilidade}, -1)
end