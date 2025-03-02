function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello there, " .. e.other:GetCleanName() .. ". There seem to be some strange problems with the boats in this area. The Academy of Arcane Sciences has sent a small team of us to investigate them. In the meantime, I can transport you to my companion there if you wish to travel to [Butcher] or [Freeport].");
	elseif(e.message:findi("Butcher")) then
		e.self:CastSpell(2280,e.other:GetID()); -- Spell: Portal to Butcher
		e.self:Say("Off you go!");
	elseif(e.message:findi("Freeport")) then
		e.self:CastSpell(2283, e.other:GetID()); -- Spell: Portal to Freeport
	end
end
