local spelldrops = {
    7703, --Amplification                   Brd Spell
    29011, --Celestial Health               Clr Spell
    30439, --Fury of Air                    Dru Spell
    26972, --Entrancing Lights              Enc Spell
    19503, --Expedience                     Mag Spell
    30461, --Call of Sky                    Rng Spell
    19434, --Harvest                        Wiz Spell
    19506, --Strengthen Death               Sk Spell
    30427, --Shock of the Tainted           Nec Spell
    30415, --Torbas' Acid Blast             Shm Spell
    7684, --Divine Vigor                    Pal Spell
}

local gemdrops = {
    10037 --Diamond
}

local fabled = {
    32745 --Fabled Charred Guardian Shield
}

function event_spawn(e)
    local item = spelldrops[math.random(1, #spelldrops)]
    local item2 = gemdrops[math.random(1, #gemdrops)]
    local item3 = fabled[math.random(1, #fabled)]
    e.self:AddItem(item, 0, false) --AddItem(int item_id, int charges, bool equip)
    e.self:AddItem(item2, 0, false) --AddItem(int item_id, int charges, bool equip)
    e.self:AddItem(item3, 0, false) --AddItem(int item_id, int charges, bool equip)
end