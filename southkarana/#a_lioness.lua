function event_death_complete(e)
	if(math.random(100) < 8) then
        local roll = math.random(3);
        if (roll == 1) then
            eq.unique_spawn(14139,0,0, 3234,-6890,33,382); -- spawn Quillmane
        elseif (roll == 2) then
            eq.unique_spawn(14139,0,0, -2618,-6055,0,510); -- spawn Quillmane
        elseif (roll == 3) then
            eq.unique_spawn(14139,0,0, -1809,1065,38,4); -- spawn Quillmane
        end
	end
end