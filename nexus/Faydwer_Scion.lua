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
		elseif(e.message:findi("Butcherblock")) then
			porting = true;
			e.self:Say("Butcherblock coming up! Standby for a few seconds!");
			eq.set_timer("ButcherblockTimer", 3000); --3 second timer
		elseif(e.message:findi("Greater Faydark")) then
			porting = true;
			e.self:Say("Greater Faydark coming up! Standby for a few seconds!");
			eq.set_timer("GreaterFaydarkTimer", 3000); --3 second timer
		elseif(e.message:findi("Steamfont")) then
			porting = true;
			e.self:Say("Steamfont coming up! Standby for a few seconds!");
			eq.set_timer("SteamfontTimer", 3000); --3 second timer  
		end
	else
		if(e.message:findi("hail")) then
			e.self:Say("Apologies, I am in the middle of porting!");
		end
    end
end

function event_timer(e)

    if (e.timer == "ButcherblockTimer") then
        eq.stop_timer("ButcherblockTimer");

        local player = eq.get_entity_list():GetMob(saved_char_id);
		player:CastSpell(3093, player:GetID()); --Circle of Butcherblock
        porting = false;

    elseif (e.timer == "GreaterFaydarkTimer") then
        eq.stop_timer("GreaterFaydarkTimer");

        local player = eq.get_entity_list():GetMob(saved_char_id);
		player:CastSpell(3097, player:GetID()); --Fay Portal
        porting = false;

    elseif (e.timer == "SteamfontTimer") then
        eq.stop_timer("SteamfontTimer");

        local player = eq.get_entity_list():GetMob(saved_char_id);
		player:CastSpell(3090, player:GetID()); --Circle of Steamfont
        porting = false;      
    end    
end