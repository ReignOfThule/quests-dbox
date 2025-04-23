function event_spawn(e)
    eq.set_timer("cityCheckA", 5000); --Kick off initial timer to check for city take over/repop
end

function event_timer(e)
    local cityRepop = "oggokRepop";
    if (e.timer == "cityCheckA") then
        if eq.get_data(cityRepop) == "yes" then
            repop_zone();
            eq.set_data(cityRepop, "no");
            eq.set_timer("cityCheckB", 5000); --5 seconds
        else
            eq.set_timer("cityCheckB", 5000); --5 seconds
        end
    elseif (e.timer == "cityCheckB") then
        if eq.get_data(cityRepop) == "yes" then
            repop_zone();
            eq.set_data(cityRepop, "no");
            eq.set_timer("cityCheckA", 5000); --5 seconds
        else
            eq.set_timer("cityCheckA", 5000); --5 seconds
        end
    end
end


function repop_zone()
    eq.clear_spawn_timers();
    eq.repop_zone();
end
            