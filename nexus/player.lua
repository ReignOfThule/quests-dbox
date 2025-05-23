

function event_cast_begin(e)
	local allowed_spells = {797, 3087, 3088, 3089, 3090, 3091, 3092, 3093, 3094, 3095, 3096, 3097}
	local is_allowed = false
    for _, spell_id in ipairs(allowed_spells) do
        if e.spell == spell_id then
            is_allowed = true
            break
        end
    end

    if is_allowed == false then
        e.self:Duck()
        e.self:Message(15, "You cannot cast spells here.")
    end
end


function event_enter_zone(e)
    local x = 0
    local y = 3
    local z = -30
    local h = 0
    local playerX = e.self:GetX();
	local playerY = e.self:GetY();

    local random = math.random(1,2)
    local class = e.self:GetClass();
    local accountID = e.self:AccountID();


    eq.self_cast(1448); --cantata of soothing
     
    if class == 15 then
        if eq.get_data(tostring(accountID)) == "" then --If no beastlord unlock databucket, world kick
            e.self:WorldKick();
        end
    end
    if random == 1 then
        if playerX == x then
            e.self:MovePC(152, x + math.random(1,10), y + math.random(1,10), z, h);
        elseif playerY == y then
            e.self:MovePC(152, x + math.random(1,10), y + math.random(1,10), z, h);
        end
    else
        if playerX == x then
            e.self:MovePC(152, x - math.random(1,10), y - math.random(1,10), z, h);
        elseif playerY == y then
            e.self:MovePC(152, x - math.random(1,10), y - math.random(1,10), z, h);
        end
    end

    --e.self:HealDamage(e.self:GetMaxHP(), e.self);
    --e.self:SetMana(e.self:GetMaxMana());
end

function event_say(e)
    --Char and Guild Info
    local char_id = e.self:GetID();
    local charID = e.self:CharacterID();
	local char_name = eq.get_char_name_by_id(charID);

    --Ports
    local ports = {"Feerrott", "Lavastorm", "North Karana", "South Ro", "Surefall", "West Commons", "Misty", "Butcherblock", "Greater Faydark", "Steamfont", "Tox"}; --Antonica

	--Port Locations
    if(e.message:findi("port")) then
        local portLinks = {};

				
		for _, port in ipairs(ports) do
			table.insert(portLinks, eq.say_link(port, true, port))
		end

		local portString = table.concat(portLinks, ", ");

		e.self:Message(13, "Hail "..char_name.."! I can provide travel to the following: " .. portString .. "."); --Split in two due to char limits on say

	elseif(e.message:findi("Feerrott")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.self:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		local player = eq.get_entity_list():GetMob(saved_char_id);
		MoveGroup(saved_group, player, player:GetX(),player:GetY(),player:GetZ(), 20, -1885, 367, 16, 70, 47);
	elseif(e.message:findi("Lavastorm")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.self:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		local player = eq.get_entity_list():GetMob(saved_char_id);
		MoveGroup(saved_group, player, player:GetX(),player:GetY(),player:GetZ(), 20, 1389, 1014, 131, 301, 27);
	elseif(e.message:findi("North Karana")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.self:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		local player = eq.get_entity_list():GetMob(saved_char_id);
		MoveGroup(saved_group, player, player:GetX(),player:GetY(),player:GetZ(), 20, -1494, -2706, -4, 209, 13);
	elseif(e.message:findi("South Ro")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.self:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		local player = eq.get_entity_list():GetMob(saved_char_id);
		MoveGroup(saved_group, player, player:GetX(),player:GetY(),player:GetZ(), 20, 317, -2034, -19, 266, 35);
	elseif(e.message:findi("Surefall")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.self:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		local player = eq.get_entity_list():GetMob(saved_char_id);
		MoveGroup(saved_group, player, player:GetX(),player:GetY(),player:GetZ(), 20, -391, -209, 9, 384, 3);
	elseif(e.message:findi("West Commons")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.self:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		local player = eq.get_entity_list():GetMob(saved_char_id);
		MoveGroup(saved_group, player, player:GetX(),player:GetY(),player:GetZ(), 20, 1427, 478, -48, 325, 21);           
	elseif(e.message:findi("Misty")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.self:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		local player = eq.get_entity_list():GetMob(saved_char_id);
		MoveGroup(saved_group, player, player:GetX(),player:GetY(),player:GetZ(), 20, -1896, -490, 120, 332, 33);         
	elseif(e.message:findi("Butcherblock")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.self:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		local player = eq.get_entity_list():GetMob(saved_char_id);
		MoveGroup(saved_group, player, player:GetX(),player:GetY(),player:GetZ(), 20, 1984, -2135, 3, 58, 68);
		--player:CastSpell(3093, player:GetID()); --Circle of Butcherblock
	elseif(e.message:findi("Greater Faydark")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.self:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
        local player = eq.get_entity_list():GetMob(saved_char_id);
		MoveGroup(saved_group, player, player:GetX(),player:GetY(),player:GetZ(), 20, -441, -2023, 4, 478, 54);
		--player:CastSpell(3097, player:GetID()); --Fay Portal
	elseif(e.message:findi("Steamfont")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.self:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
        local player = eq.get_entity_list():GetMob(saved_char_id);
		MoveGroup(saved_group, player, player:GetX(),player:GetY(),player:GetZ(), 20, 1668, -1779, -104, 437, 56);
		--player:CastSpell(3090, player:GetID()); --Circle of Steamfont
	elseif(e.message:findi("Tox")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.self:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		local player = eq.get_entity_list():GetMob(saved_char_id);
		MoveGroup(saved_group, player, player:GetX(),player:GetY(),player:GetZ(), 20, -355, 1098, -58, 256, 38);
    end
end


function MoveGroup(frozen_group, player, src_x, src_y, src_z, distance, tgt_x, tgt_y, tgt_z, tgt_h, zoneid)
	if ( frozen_group.valid ) then
		local frozen_count = frozen_group:GroupCount();

		for i = 0, frozen_count - 1, 1 do
			local client_v = frozen_group:GetMember(i);

			local player = eq.get_entity_list():GetMob(client_v:CastToClient():CharacterID());
			
			if (player) then
				if (client_v:CastToClient().valid) then
					-- check the distance and port them up if close enough
					if (client_v:CastToClient():CalculateDistance(src_x, src_y, src_z) <= distance) then
						--local groupmate = eq.get_entity_list():GetMob(client_v:CharacterID());
						client_v:SpellFinished(207, client_v);
						-- port the player up
						client_v:CastToClient():MovePC(zoneid, tgt_x, tgt_y, tgt_z, tgt_h);
					end
				end
			end

		end
	else
		player:SpellFinished(207, player);
		player:CastToClient():MovePC(zoneid, tgt_x, tgt_y, tgt_z, tgt_h);
	end
end






