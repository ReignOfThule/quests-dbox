local spelldrops = {
    1287, --Cassindras Chant of Clarity     Brd spell
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

function event_spawn(e)
    local roll = math.random(1,100)
    if roll < 34 then
        local item = spelldrops[math.random(1, #spelldrops)]
        e.self:AddItem(item, 0, false) --AddItem(int item_id, int charges, bool equip)
    end 
end