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

function event_spawn(e)
    local roll = math.random(1,100)
    if roll < 34 then
        local item = spelldrops[math.random(1, #spelldrops)]
        e.self:AddItem(item, 0, false);
    end 
end