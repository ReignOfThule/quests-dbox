
function event_say(e)
	local x = e.other:GetX();
	local y = e.other:GetY(); 
	local z = e.other:GetZ(); 
	local h = e.other:GetHeading();
	local charID = e.other:CharacterID();
	local corpseCount = e.other:GetCorpseCount();

	if(e.message:findi("hail")) then
		e.self:Say("Dead again? I can "..eq.say_link("summon").. " your corpse once every 30 minutes.");
	elseif(e.message:findi("summon")) then
		if eq.get_data(tostring(charID)) == "" then
			if corpseCount > 0 then
				eq.summon_all_player_corpses(charID,x,y,z,h);
				eq.set_data(tostring(charID), "time remaining", "30m");
			end
		else
			e.self:Say("Get your own corpse!");
		end
	end
end

