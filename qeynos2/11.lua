function event_signal(e)
    local qeynosGuild = "qeynosGuild";
	local qeynosGuildName = "qeynosGuildName";
	local qeynosGuards = "qeynosGuards";
	local qeynosGuardsQuantity = tonumber(eq.get_data(qeynosGuards));
    local client = eq.get_entity_list():GetClientByID(e.signal);

    if ( client.valid ) then
        local clientName = client:GetCleanName()
        local clientGuildName = client:GetGuildName()
        local clientGuildID = client:GuildID()

        if (clientGuildName ~= "") then --can't participate in city take overs if guildless
            if (qeynosGuards ~= "") then
                eq.set_data(qeynosGuards, tostring(qeynosGuardsQuantity - 1));
                local qeynosGuardsFinalQuantity = tonumber(eq.get_data(qeynosGuards));
                if (qeynosGuardsFinalQuantity > 0) then
                    eq.world_emote(13, "[PvP News] The city of Qeynos is under attack!");
                    eq.zone_emote(5, "There are "..qeynosGuardsFinalQuantity.. " remaining guards in the city!");
                elseif (qeynosGuardsFinalQuantity == 0) then
                    local guardsBucketKey = "qeynosGuards";
                    local qeynosGuards = eq.get_data(guardsBucketKey);
                    eq.set_data(qeynosGuildName, tostring(clientGuildName)); --set guild name
                    eq.set_data(qeynosGuild, tostring(clientGuildID)); --set guild ID
                    eq.set_data(guardsBucketKey, "0"); --reset guard count to 0
                    eq.world_emote(13, "[PvP News] The city of Qeynos has been taken over by the nobles of <"..clientGuildName..">!");
                end
            end
        end
    end
end