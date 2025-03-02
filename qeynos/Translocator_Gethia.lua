function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello there, " .. e.other:GetCleanName() .. ". There seem to be some strange problems with the boats in this area. The Academy of Arcane Sciences has sent a small team of us to investigate them. In the meantime, I can transport you to my companion there if you wish to [travel] to Erud's Crossing.");
	elseif(e.message:findi("Travel")) then
		e.self:CastSpell(2289,e.other:GetID()); -- Spell: Portal to Erud's Crossing
		e.self:Say("Off you go!");
	end
end
