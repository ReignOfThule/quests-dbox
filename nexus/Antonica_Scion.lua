local saved_char_id = 0;
local saved_group_id = 0;
local porting = false;

function event_say(e)
    --Char and Guild Info
    local char_id = e.other:GetID();
    local charID = e.other:CharacterID();
	local char_name = eq.get_char_name_by_id(charID);
    
    --Ports
    local ports = {"Feerrott", "Lavastorm", "North Karana", "South Ro", "Surefall", "West Commons"}; --Antonica

	if(e.message:findi("hail")) then


		local portLinks = {};

				
		for _, port in ipairs(ports) do
			table.insert(portLinks, eq.say_link(port));
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
		player:CastSpell(3087, player:GetID()); --Circle of Feerrott
	elseif(e.message:findi("Lavastorm")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.other:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		e.self:Say("Lavastorm coming up!");
		local player = eq.get_entity_list():GetMob(saved_char_id);
		player:CastSpell(3092, player:GetID()); --Circle of Lavastorm
	elseif(e.message:findi("North Karana")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.other:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		e.self:Say("North Karana coming up!");
		local player = eq.get_entity_list():GetMob(saved_char_id);
		player:CastSpell(3096, player:GetID()); --Circle of Karana
	elseif(e.message:findi("South Ro")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.other:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		e.self:Say("South Ro coming up!");
		local player = eq.get_entity_list():GetMob(saved_char_id);
		player:CastSpell(3091, player:GetID()); --Circle of Ro
	elseif(e.message:findi("Surefall")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.other:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		e.self:Say("Surefall coming up!");
		local player = eq.get_entity_list():GetMob(saved_char_id);
		player:CastSpell(3088, player:GetID()); --Circle of Surefall
	elseif(e.message:findi("West Commons")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.other:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		e.self:Say("West Commons coming up!");
		local player = eq.get_entity_list():GetMob(saved_char_id);
		player:CastSpell(3095, player:GetID()); --Common Portal             
	end
end
