local saved_char_id = 0;

function event_say(e)

	local charID = e.other:CharacterID();
	local guild_id = e.other:GuildID();
    local charName = e.other:GetCleanName();
    local qeynosOwnership = "qeynosGuild";				
    local qeynosGuild = eq.get_data(qeynosOwnership);
    local felwitheOwnership = "felwitheGuild";				
    local felwitheGuild = eq.get_data(felwitheOwnership);
    local oggokOwnership = "oggokGuild";				
    local oggokGuild = eq.get_data(oggokOwnership);
    local erudinOwnership = "erudinGuild";				
    local erudinGuild = eq.get_data(erudinOwnership);
    local char_id = e.other:GetID();

    saved_char_id = char_id; --Saving char id for port

	if(e.message:findi("hail")) then
		e.self:Say("Hello "..charName.. " I can ".. eq.say_link("teleport") .. " you to a city you own or "..eq.say_link("gate to bind"));
    elseif(e.message:findi("teleport")) then
        if (qeynosGuild == tostring(guild_id)) then
            e.other:MovePC(1, -168, 115, 3, 166);
            e.self:Say("teleporting you to Qeynos!");
        end
        if (felwitheGuild == tostring(guild_id)) then
            e.self:Say("teleporting you to Felwithe!");
            e.other:MovePC(61, 94, -25, 3.80, 412);
        end
        if (oggokGuild == tostring(guild_id)) then
            e.self:Say("teleporting you to Oggok!");
            e.other:MovePC(49, -99, -345, 3.80, 138);
        end
        if (erudinGuild == tostring(guild_id)) then
            e.self:Say("teleporting you to Erudin!");
            e.other:MovePC(24, -338, 75, 23, 0);
        end            
	elseif(e.message:findi("gate to bind")) then
        local player = eq.get_entity_list():GetMob(saved_char_id);
		player:CastSpell(797, player:GetID()); --GM Gate
    end
end



