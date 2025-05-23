local spelldrops = {
    7692, --Hawk Eye                        Rng spell
    7602, --Celestial Remedy                Clr spell
    7652, --Garrison's Mighty Mana Shock    Wiz spell
    15177, --Color Shift                    Enc spell
    7682, --Desist                          Pal spell
    15199, --Harmshield                     Nec spell
    32702, --Scorchbloom                    Dru spell
    32703, --Stupor                         Shm spell
    32704, --Flamecloak                     Mag spell
    32705, --Blackblood Bargain             Shd spell
}

local gemdrops = {
    10053, --Jacinth
    10036, --Black Sapphire
}

local fabled = {
    32674 --Fabled Dwarven Ringmail Tunic
}

function event_spawn(e)
    local item = spelldrops[math.random(1, #spelldrops)]
    local item2 = gemdrops[math.random(1, #gemdrops)]
    local item3 = fabled[math.random(1, #fabled)]
    e.self:AddItem(item, 0, false) --AddItem(int item_id, int charges, bool equip)
    e.self:AddItem(item2, 0, false) --AddItem(int item_id, int charges, bool equip)
    e.self:AddItem(item3, 0, false) --AddItem(int item_id, int charges, bool equip)
end