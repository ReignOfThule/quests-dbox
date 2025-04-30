local saved_char_id = 0;
local saved_group_id = 0;
local porting = false;

function event_say(e)
    --Char and Guild Info
    local char_id = e.other:GetID();
    local charID = e.other:CharacterID();
	local char_name = eq.get_char_name_by_id(charID);
    
    --Ports
    local ports = {"Butcherblock", "Greater Faydark", "Steamfont"}; --Faydwer

	if(e.message:findi("hail")) then
	
		local portLinks = {};

				
		for _, port in ipairs(ports) do
			table.insert(portLinks, eq.say_link(port));
		end

		local portString = table.concat(portLinks, ", ");

		e.self:Say("Hail "..char_name.."! I can provide travel to the following: " .. portString .. "."); --Split in two due to char limits on say

	--Port Locations
	elseif(e.message:findi("Butcherblock")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.other:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		e.self:Say("Butcherblock coming up!");
		local player = eq.get_entity_list():GetMob(saved_char_id);
		player:CastSpell(3093, player:GetID()); --Circle of Butcherblock
	elseif(e.message:findi("Greater Faydark")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.other:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		e.self:Say("Greater Faydark coming up!");
        local player = eq.get_entity_list():GetMob(saved_char_id);
		player:CastSpell(3097, player:GetID()); --Fay Portal
	elseif(e.message:findi("Steamfont")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.other:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		e.self:Say("Steamfont coming up!");
        local player = eq.get_entity_list():GetMob(saved_char_id);
		player:CastSpell(3090, player:GetID()); --Circle of Steamfont
	end
end