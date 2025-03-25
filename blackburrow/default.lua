function event_death(e)
    local killerID = e.killer:GetID();
    local client = eq.get_entity_list():GetClientByID(killerID);
	local currentAA = client:GetAAExp();
    local currentXP = client:GetEXP();
    client:SetEXP(currentXP, currentAA + 1000000); --5% AA xp
end