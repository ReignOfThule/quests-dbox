local saved_char_id = 0;
local saved_group_id = 0;
local porting = false;

function event_say(e)
    --Char and Guild Info
    local char_id = e.other:GetID();
    local charID = e.other:CharacterID();
	local char_name = eq.get_char_name_by_id(charID);
	
    
    --Ports
    local ports = {"Tox"}; --Odus


	local portLinks = {};

			
	for _, port in ipairs(ports) do
		table.insert(portLinks, eq.say_link(port, true, port))
	end

	local portString = table.concat(portLinks, ", ");


	if(e.message:findi("hail")) then
		e.other:Message(2, "Hail "..char_name.."! I can provide travel to the following: " .. portString .. "."); --Split in two due to char limits on say
	--Port Locations
	elseif(e.message:findi("Tox")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.other:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		local player = eq.get_entity_list():GetMob(saved_char_id);
		MoveGroup(saved_group, player, player:GetX(),player:GetY(),player:GetZ(), 20, -355, 1098, -58, 256, 38);
	elseif(e.message:findi("chud")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.other:GetGroup(); --Saving group id for port
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

