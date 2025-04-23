function event_death(e)
    local killerID = e.killer:GetID()
    local killer = eq.get_entity_list():GetMob(killerID)
    --local client = eq.get_entity_list():GetClientByID(killerID)
    local player_list = nil;
    local player_list_count = 0;

    if killer:IsPet() and killer:GetOwner():IsClient() then
        killer = killer:GetOwner()
    end

    player_list = killer:CastToClient():GetGroup();
    player_list_count = player_list:GroupCount();

    if (player_list.valid) then
        --killer:CastToClient():Message(15, "grp valid");
        for i = 0, player_list_count - 1 do
            --killer:CastToClient():Message(15, "boooom");
            local player = player_list:GetMember(i);
            local currentAA = player:CastToClient():GetAAExp();
            local currentXP = player:CastToClient():GetEXP();
            player:CastToClient():SetEXP(currentXP, currentAA + 2000000); --10% AA xp
            --player:CastToClient():Message(15, "here's the xps");
        end
    else
        local currentAA = killer:CastToClient():GetAAExp();
        local currentXP = killer:CastToClient():GetEXP();
       -- killer:CastToClient():Message(15, "Not in group");
        killer:CastToClient():SetEXP(currentXP, currentAA + 2000000); --10% AA xp
    end
end
        