local planardrops = {
    --Imbrued Platemail Bard Planar
    4861,
    4862,
    4863,
    4864,
    4865,
    4866,
    4867,
    --Anthemion Beastlord Planar
    7817,
    7818,
    7819,
    7832,
    7833,
    7834,
    7835,
    --Ethereal Mist Cleric Planar
    4881,
    4882,
    4883,
    4884,
    4885,
    4886,
    4887,
    --Vermiculated Druid Planar
    3801,
    3802,
    3803,
    3804,
    3805,
    3806,
    3807,
    --Insidious Enchanter Planar
    1246,
    1247,
    1248,
    1249,
    1250,
    1251,
    1252,
    --Apothic Mage Planar
    1239,
    1240,
    1241,
    1242,
    1243,
    1244,
    1245,
    --Shiverback Hide Monk Planar
    1201,
    1202,
    1203,
    1204,
    1205,
    1206,
    --Blighted Necromancer Planar
    1232,
    1233,
    1234,
    1235,
    1236,
    1237,
    1238,
    --Valorium Paladin Planar
    4851,
    4852,
    4853,
    4854,
    4855,
    4856,
    4857,
    --Thorny Vine Ranger Planar
    4891,
    4892,
    4893,
    4894,
    4895,
    4896,
    4897,
    --Woven Shadow Rogue Planar
    4901,
    4902,
    4903,
    4904,
    4905,
    4906,
    4907,
    --Umbral Platemail Shadowknight Planar
    4841,
    4842,
    4843,
    4844,
    4845,
    4846,
    4847,
    --Carmine Wizard Planar
    1225,
    1226,
    1227,
    1228,
    1229,
    1230,
    1231,
    --Indicolite Warrior Planar
    4911,
    4912,
    4913,
    4914,
    4915,
    4916,
    4917,
    --Lustrous Russet
    4831,
    4832,
    4833,
    4834,
    4835,
    4836,
    4837
}

function event_spawn(e)
    local roll = math.random(1,100)
    if roll < 34 then
        local item = planardrops[math.random(1, #planardrops)]
        e.self:AddItem(item, 0, false) --AddItem(int item_id, int charges, bool equip)
    end 
end