local saved_char_id = 0;
local saved_group_id = 0;
local porting = false;

function event_say(e)
    --Char and Guild Info
    local char_id = e.other:GetID();
    local charID = e.other:CharacterID();
	local char_name = eq.get_char_name_by_id(charID);
    
    --Ports
    local ports = {"Feerrott", "Lavastorm", "North Karana", "South Ro", "Surefall", "West Commons", "Misty"}; --Antonica

	if(e.message:findi("hail")) then


		local portLinks = {};

				
		for _, port in ipairs(ports) do
			table.insert(portLinks, eq.say_link(port, true, port))
		end

		local portString = table.concat(portLinks, ", ");

		e.self:Say("Hail "..char_name.."! I can provide travel to the following: " .. portString .. "."); --Split in two due to char limits on say

	--Port Locations
	elseif(e.message:findi("Feerrott")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.other:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		e.self:Say("Feerrott coming up!");
		local player = eq.get_entity_list():GetMob(saved_char_id);
		MoveGroup(saved_group, player, player:GetX(),player:GetY(),player:GetZ(), 20, -1885, 367, 16, 70, 47);
		--player:CastSpell(3087, player:GetID()); --Circle of Feerrott
		--player:SpellFinished(3087, player);
		--player:SpellFinished(207, player);
	elseif(e.message:findi("Lavastorm")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.other:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		e.self:Say("Lavastorm coming up!");
		local player = eq.get_entity_list():GetMob(saved_char_id);
		--player:CastSpell(3092, player:GetID()); --Circle of Lavastorm
		MoveGroup(saved_group, player, player:GetX(),player:GetY(),player:GetZ(), 20, 1389, 1014, 131, 301, 27);
		--player:SpellFinished(3092, player);
		--player:SpellFinished(207, player);
	elseif(e.message:findi("North Karana")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.other:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		e.self:Say("North Karana coming up!");
		local player = eq.get_entity_list():GetMob(saved_char_id);
		--player:CastSpell(3096, player:GetID()); --Circle of Karana
		MoveGroup(saved_group, player, player:GetX(),player:GetY(),player:GetZ(), 20, -1494, -2706, -4, 209, 13);
		--player:SpellFinished(3096, player);
		--player:SpellFinished(207, player);
	elseif(e.message:findi("South Ro")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.other:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		e.self:Say("South Ro coming up!");
		local player = eq.get_entity_list():GetMob(saved_char_id);
		--player:CastSpell(3091, player:GetID()); --Circle of Ro
		MoveGroup(saved_group, player, player:GetX(),player:GetY(),player:GetZ(), 20, 317, -2034, -19, 266, 35);
		--player:SpellFinished(3091, player);
		--player:SpellFinished(207, player);
	elseif(e.message:findi("Surefall")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.other:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		e.self:Say("Surefall coming up!");
		local player = eq.get_entity_list():GetMob(saved_char_id);
		--player:CastSpell(3088, player:GetID()); --Circle of Surefall
		MoveGroup(saved_group, player, player:GetX(),player:GetY(),player:GetZ(), 20, -391, -209, 9, 384, 3);
		--player:SpellFinished(3088, player);
		--player:SpellFinished(207, player);
	elseif(e.message:findi("West Commons")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.other:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		e.self:Say("West Commons coming up!");
		local player = eq.get_entity_list():GetMob(saved_char_id);
		--player:CastSpell(3095, player:GetID()); --Common Portal
		MoveGroup(saved_group, player, player:GetX(),player:GetY(),player:GetZ(), 20, 1427, 478, -48, 325, 21);
		--player:SpellFinished(3095, player);
		--player:SpellFinished(207, player);            
	elseif(e.message:findi("Misty")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.other:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		e.self:Say("Misty coming up!");
		local player = eq.get_entity_list():GetMob(saved_char_id);
		--player:CastSpell(3095, player:GetID()); --Common Portal
		MoveGroup(saved_group, player, player:GetX(),player:GetY(),player:GetZ(), 20, -1896, -490, 120, 332, 33);
		--player:SpellFinished(3095, player);
		--player:SpellFinished(207, player);            
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
