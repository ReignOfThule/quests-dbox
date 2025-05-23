local spelldrops = {
    26954, --Tuyen's Chant of Poison        Brd Spell
    30444, --Celestial Healing              Clr Spell
    30437, --Ro's Fiery Sundering           Dru Spell
    30474, --Boon of the Garou              Enc Spell
    30403, --Elemental Maelstrom            Mag Spell
    7695, --Force of Nature                 Rng Spell
    15732, --Ice Comet                      Wiz Spell
    7674, --Scream of Death                 SK Spell
    15754, --Cannibalize II                 Shm Spell
    15693, --Divine Might                   Pal Spell
    26958, --Torbas Poison Blast            Nec Spell
}

local gemdrops = {
    10037, --Diamond
    22503 --Blue Diamond
}

local fabled = {
    32582, --Fabled Short Sword of the Ykesha
    32583 --Fabled Skull-shaped Barbute
}

function event_spawn(e)
    local item = spelldrops[math.random(1, #spelldrops)]
    local item2 = gemdrops[math.random(1, #gemdrops)]
    local item3 = fabled[math.random(1, #fabled)]
    e.self:AddItem(item, 0, false) --AddItem(int item_id, int charges, bool equip)
    e.self:AddItem(item2, 0, false) --AddItem(int item_id, int charges, bool equip)
    e.self:AddItem(item3, 0, false) --AddItem(int item_id, int charges, bool equip)
end