local x = 0
local y = 3
local z = -30
local h = 0

function event_spawn(e)
    eq.set_proximity(x - 2, x + 2, y - 2, y + 2, z - 10, z + 10);
end

function event_enter(e)
    local random = math.random(1,2)
    if random == 1 then
        e.other:MovePC(152, x + math.random(1,10), y + math.random(1,10), z, h);
    else
        e.other:MovePC(152, x - math.random(1,10), y - math.random(1,10), z, h);
    end
end