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
		elseif(e.message:findi("Feerrott")) then
			porting = true;
			e.self:Say("Feerrott coming up! Standby for a few seconds!");
			eq.set_timer("FeerrottTimer", 3000); --3 second timer
		elseif(e.message:findi("Lavastorm")) then
			porting = true;
			e.self:Say("Lavastorm coming up! Standby for a few seconds!");
			eq.set_timer("LavastormTimer", 3000); --3 second timer
		elseif(e.message:findi("North Karana")) then
			porting = true;
			e.self:Say("North Karana coming up! Standby for a few seconds!");
			eq.set_timer("NorthKaranaTimer", 3000); --3 second timer
		elseif(e.message:findi("South Ro")) then
			porting = true;
			e.self:Say("South Ro coming up! Standby for a few seconds!");
			eq.set_timer("SouthRoTimer", 3000); --3 second timer
		elseif(e.message:findi("Surefall")) then
			porting = true;
			e.self:Say("Surefall coming up! Standby for a few seconds!");
			eq.set_timer("SurefallTimer", 3000); --3 second timer
		elseif(e.message:findi("West Commons")) then
			porting = true;
			e.self:Say("West Commons coming up! Standby for a few seconds!");
			eq.set_timer("WestCommonsTimer", 3000); --3 second timer                
		end
	else
		if(e.message:findi("hail")) then
			e.self:Say("Apologies, I am in the middle of porting!");
		end
    end
end

function event_timer(e)

    if (e.timer == "FeerrottTimer") then
        eq.stop_timer("FeerrottTimer");

        local player = eq.get_entity_list():GetMob(saved_char_id);
		player:CastSpell(3087, player:GetID()); --Circle of Feerrott
        porting = false;

    elseif (e.timer == "LavastormTimer") then
        eq.stop_timer("LavastormTimer");

        local player = eq.get_entity_list():GetMob(saved_char_id);
		player:CastSpell(3092, player:GetID()); --Circle of Lavastorm
        porting = false;

    elseif (e.timer == "NorthKaranaTimer") then
        eq.stop_timer("NorthKaranaTimer");

        local player = eq.get_entity_list():GetMob(saved_char_id);
		player:CastSpell(3096, player:GetID()); --Circle of Karana
        porting = false;      

    elseif (e.timer == "SouthRoTimer") then
        eq.stop_timer("SouthRoTimer");

        local player = eq.get_entity_list():GetMob(saved_char_id);
		player:CastSpell(3091, player:GetID()); --Circle of Ro
        porting = false;  

    elseif (e.timer == "SurefallTimer") then
        eq.stop_timer("SurefallTimer");

        local player = eq.get_entity_list():GetMob(saved_char_id);
		player:CastSpell(3088, player:GetID()); --Circle of Surefall
        porting = false;    
    
    elseif (e.timer == "WestCommonsTimer") then
        eq.stop_timer("WestCommonsTimer");

        local player = eq.get_entity_list():GetMob(saved_char_id);
		player:CastSpell(3095, player:GetID()); --Common Portal
        porting = false;     
    end    
end