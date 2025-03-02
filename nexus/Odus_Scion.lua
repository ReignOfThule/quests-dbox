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

	if(porting == false) then
		if(e.message:findi("hail")) then
			saved_char_id = char_id; --Saving char id for port timer
			local saved_group = e.other:GetGroup(); --Saving group id for port
			saved_group_id = saved_group:GetID();

			local portLinks = {};

                    
			for _, port in ipairs(ports) do
				table.insert(portLinks, eq.say_link(port));
			end

			local portString = table.concat(portLinks, ", ");

			e.self:Say("Hail "..char_name.."! I can provide travel to the following: " .. portString .. "."); --Split in two due to char limits on say

		--Port Locations
		elseif(e.message:findi("Tox")) then
			porting = true;
			e.self:Say("Tox coming up! Standby for a few seconds!");
			eq.set_timer("ToxTimer", 3000); --3 second timer
		end
	else
		if(e.message:findi("hail")) then
			e.self:Say("Apologies, I am in the middle of porting!");
		end
    end
end

function event_timer(e)

    if (e.timer == "ToxTimer") then
        eq.stop_timer("ToxTimer");

        local player = eq.get_entity_list():GetMob(saved_char_id);
		player:CastSpell(3094, player:GetID()); --Circle of Tox
        porting = false;
    end    
end