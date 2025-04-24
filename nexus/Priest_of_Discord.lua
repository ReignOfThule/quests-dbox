
function event_say(e)
	local x = e.other:GetX();
	local y = e.other:GetY(); 
	local z = e.other:GetZ(); 
	local h = e.other:GetHeading();
	local corpse = 0;
	local charID = e.other:CharacterID();
	local class = e.other:GetClass();
	local level = e.other:GetLevel();
	local corpseCount = e.other:GetCorpseCount();
    local client = eq.get_entity_list():GetClientByID(charID);
	local aaPoints = e.other:GetAAPoints();
	local str = e.other:GetAA(2);
	local sta = e.other:GetAA(7);
	local haste = e.other:GetAA(12);
	local seeinvis = e.other:GetAA(17);
	local clarity = e.other:GetAA(22);
	local reso = e.other:GetAA(27);
	local symb = e.other:GetAA(32);
	local fr = e.other:GetAA(37);
	local cr = e.other:GetAA(42);
	local mr = e.other:GetAA(47);
	local pr = e.other:GetAA(52);
	local dr = e.other:GetAA(57);
	local runspeed = e.other:GetAA(62);
	local special = e.other:GetAA(65); --Fading Memories, Bestow Divine Aura, Dire Charm, Elemental Form - Fire, Purify Body, Two Hand Bash, Guardian of the Forest, Escape, Flurry, Gather Mana
	local sow = e.other:GetAA(68);
	local makeshift = e.other:GetAA(71);
	local mastercraft = e.other:GetAA(74);
	local familiar = e.other:GetAA(412);

	if(e.message:findi("hail")) then
		e.other:Message(13, "Dead again? I can "..eq.say_link("summon corpses").. " here after they decay. If you'd like to train in "..eq.say_link("Alternate Advancements").. " I can also help");
	elseif(e.message:findi("summon corpses")) then
		corpse = eq.get_player_burried_corpse_count(charID);
		if corpse > 0 then
			e.other:Message(13, "Here is your corpse. Some advice? Perhaps die less.");
			eq.summon_burried_player_corpse(charID, x, y, z, h);
		else
			e.other:Message(13, "Why do you waste my time... Your corpse is not yet ready!");
		end
	elseif(e.message:findi("Alternate Advancements")) then
        e.other:Message(13, eq.say_link("Blessing of Strength"));
        e.other:Message(13, eq.say_link("Blessing of Stamina"));
        e.other:Message(13, eq.say_link("Blessing of Haste"));
        e.other:Message(13, eq.say_link("Blessing of Sight"));
        e.other:Message(13, eq.say_link("Blessing of Clarity"));
        e.other:Message(13, eq.say_link("Blessing of Resolution"));
        e.other:Message(13, eq.say_link("Blessing of Symbols"));
        e.other:Message(13, eq.say_link("Blessing of the Wolf"));
        e.other:Message(13, eq.say_link("Blessing of Fire Protection"));
        e.other:Message(13, eq.say_link("Blessing of Cold Protection"));
        e.other:Message(13, eq.say_link("Blessing of Magic Protection"));
        e.other:Message(13, eq.say_link("Blessing of Poison Protection"));
        e.other:Message(13, eq.say_link("Blessing of Disease Protection"));
        e.other:Message(13, eq.say_link("Innate Run Speed 3"));
        e.other:Message(13, eq.say_link("Master Crafter"));
        e.other:Message(13, eq.say_link("Familiar"));
        e.other:Message(13, eq.say_link("Makeshift Illusion"));
        e.other:Message(13, eq.say_link("Class Special"));
	elseif(e.message:findi("Blessing of Strength")) then
        e.other:Message(13, eq.say_link("Confirm Purchase Blessing of Str"));
	elseif(e.message:findi("Blessing of Stamina")) then
        e.other:Message(13, eq.say_link("Confirm Purchase Blessing of Sta"));
	elseif(e.message:findi("Blessing of Haste")) then
        e.other:Message(13, eq.say_link("Confirm Purchase Blessing of _Haste"));
	elseif(e.message:findi("Blessing of Sight")) then
        e.other:Message(13, eq.say_link("Confirm Purchase Blessing of _Sight"));
	elseif(e.message:findi("Blessing of Clarity")) then
        e.other:Message(13, eq.say_link("Confirm Purchase Blessing Clarity"));
	elseif(e.message:findi("Blessing of the Wolf")) then
        e.other:Message(13, eq.say_link("Confirm Purchase Blessing of Wolf"));
	elseif(e.message:findi("Blessing of Fire Protection")) then
        e.other:Message(13, eq.say_link("Confirm Purchase Blessing of FR"));
	elseif(e.message:findi("Blessing of Cold Protection")) then
        e.other:Message(13, eq.say_link("Confirm Purchase Blessing of CR"));
	elseif(e.message:findi("Blessing of Poison Protection")) then
        e.other:Message(13, eq.say_link("Confirm Purchase Blessing of PR"));
	elseif(e.message:findi("Blessing of Disease Protection")) then
        e.other:Message(13, eq.say_link("Confirm Purchase Blessing of DR"));
	elseif(e.message:findi("Blessing of Magic Protection")) then
        e.other:Message(13, eq.say_link("Confirm Purchase Blessing of MR"));
	elseif(e.message:findi("Innate Run Speed 3")) then
        e.other:Message(13, eq.say_link("Confirm Purchase Innate RunSpeed 3"));
	elseif(e.message:findi("Makeshift Illusion")) then
        e.other:Message(13, eq.say_link("Confirm Purchase Makeshift _Illusion"));
	elseif(e.message:findi("Master Crafter")) then
        e.other:Message(13, eq.say_link("Confirm Purchase Master _Crafter"));
	elseif(e.message:findi("Familiar")) then
        e.other:Message(13, eq.say_link("Confirm Purchase AA"));
	elseif(e.message:findi("Blessing of Resolution")) then
        e.other:Message(13, eq.say_link("Confirm Purchase Blessing of _Resolution"));
	elseif(e.message:findi("Blessing of Symbols")) then
        e.other:Message(13, eq.say_link("Confirm Purchase Blessing of _Symbols"));
	elseif(e.message:findi("Class Special")) then
        e.other:Message(13, eq.say_link("Confirm Purchase Class _Special"));

	elseif(e.message:findi("Confirm Purchase Blessing of Str")) then
		if str == 0 then
			e.other:SetAAPoints(aaPoints - 2);
			e.other:IncrementAA(2);
			e.other:Message(2, "The Blessing of Strength has been placed in your inventory!");
			e.other:SummonItem(2431);
		elseif str < 5 then
			if str > 0 then
				if (aaPoints >= 2) then
					e.other:SetAAPoints(aaPoints - 2);
					e.other:IncrementAA(2);
					e.other:Message(2, "You gained an additional rank in Blessing of Strength");
				end
			end
		else
			e.other:Message(13, "You already own this ability!");
		end
	elseif(e.message:findi("Confirm Purchase Blessing of Sta")) then
		if sta == 0 then
			if (aaPoints >= 2) then
				e.other:SetAAPoints(aaPoints - 2);
				e.other:IncrementAA(7);
				e.other:Message(2, "The Blessing of Stamina has been placed in your inventory!");
				e.other:SummonItem(2432);
			else
				e.other:Message(2, "Not enough AA's available for this purchase!");
			end
		elseif sta < 5 then
			if sta > 0 then
				if (aaPoints >= 2) then
					e.other:SetAAPoints(aaPoints - 2);
					e.other:IncrementAA(7);
					e.other:Message(2, "You gained an additional rank in Blessing of Stamina");
				end
			end
		else
			e.other:Message(13, "You already own this ability!");
		end
	elseif(e.message:findi("Confirm Purchase Blessing of _Haste")) then
		if haste == 0 then
			if (aaPoints >= 2) then
				e.other:SetAAPoints(aaPoints - 2);
				e.other:IncrementAA(12);
				e.other:Message(2, "The Blessing of Haste has been placed in your inventory!");
				e.other:SummonItem(2433);
			else
				e.other:Message(2, "Not enough AA's available for this purchase!");
			end
		elseif haste < 5 then
			if haste > 0 then
				if (aaPoints >= 2) then
					e.other:SetAAPoints(aaPoints - 2);
					e.other:IncrementAA(12);
					e.other:Message(2, "You gained an additional rank in Blessing of Haste!");
				end
			end	
		else
			e.other:Message(13, "You already own this ability!");
		end

	elseif(e.message:findi("Confirm Purchase Blessing of _Sight")) then
		if seeinvis == 0 then
			if (aaPoints >= 2) then
				e.other:SetAAPoints(aaPoints - 2);
				e.other:IncrementAA(17);
				e.other:Message(2, "The Blessing of Sight has been placed in your inventory!");
				e.other:SummonItem(2434);
			else
				e.other:Message(2, "Not enough AA's available for this purchase!");
			end
		elseif seeinvis < 5 then
			if seeinvis > 0 then
				if (aaPoints >= 2) then
					e.other:SetAAPoints(aaPoints - 2);
					e.other:IncrementAA(17);
					e.other:Message(2, "You gained an additional rank in Blessing of Sight!");
				end
			end
		else
			e.other:Message(13, "You already own this ability!");
		end
	elseif(e.message:findi("Confirm Purchase Blessing Clarity")) then
		if clarity == 0 then
			if (aaPoints >= 2) then
				e.other:SetAAPoints(aaPoints - 2);
				e.other:IncrementAA(22);
				e.other:Message(2, "The Blessing of Clarity has been placed in your inventory!");
				e.other:SummonItem(2435);
			else
				e.other:Message(2, "Not enough AA's available for this purchase!");
			end
		elseif clarity < 5 then
			if clarity > 0 then
				if (aaPoints >= 2) then
					e.other:SetAAPoints(aaPoints - 2);
					e.other:IncrementAA(22);
					e.other:Message(2, "You gained an additional rank in Blessing of Clarity!");
				end
			end	
		else
			e.other:Message(13, "You already own this ability!");
		end

	elseif(e.message:findi("Confirm Purchase Blessing of _Resolution")) then
		if reso == 0 then
			if (aaPoints >= 2) then
				e.other:SetAAPoints(aaPoints - 2);
				e.other:IncrementAA(27);
				e.other:Message(2, "The Blessing of Resolution has been placed in your inventory!");
				e.other:SummonItem(2436);
			else
				e.other:Message(2, "Not enough AA's available for this purchase!");
			end
		elseif reso < 5 then
			if reso > 0 then
				if (aaPoints >= 2) then
					e.other:SetAAPoints(aaPoints - 2);
					e.other:IncrementAA(27);
					e.other:Message(2, "You gained an additional rank in Blessing of Resolution!");
				end
			end
		else
			e.other:Message(13, "You already own this ability!");
		end

	elseif(e.message:findi("Confirm Purchase Blessing of _Symbols")) then
		if symb == 0 then
			if (aaPoints >= 2) then
				e.other:SetAAPoints(aaPoints - 2);
				e.other:IncrementAA(32);
				e.other:Message(2, "The Blessing of Symbols has been placed in your inventory!");
				e.other:SummonItem(2442);
			else
				e.other:Message(2, "Not enough AA's available for this purchase!");
			end
		elseif symb < 5 then
			if symb > 0 then
				if (aaPoints >= 2) then
					e.other:SetAAPoints(aaPoints - 2);
					e.other:IncrementAA(32);
					e.other:Message(2, "You gained an additional rank in Blessing of Symbols!");
				end
			end
		else
			e.other:Message(13, "You already own this ability!");
		end

	elseif(e.message:findi("Confirm Purchase Makeshift _Illusion")) then
		if makeshift == 0 then
			if (aaPoints >= 3) then
				e.other:SetAAPoints(aaPoints - 3);
				e.other:Message(2, "The Illusionists Staff has been placed in your inventory!");
				e.other:IncrementAA(71);
				e.other:SummonItem(2443);
			else
				e.other:Message(2, "Not enough AA's available for this purchase!");
			end
		elseif makeshift < 3 then
			if makeshift > 0 then
				if (aaPoints >= 3) then
					e.other:SetAAPoints(aaPoints - 3);
					e.other:Message(2, "You gained an additional rank in Makeshift Illusion!");
					e.other:IncrementAA(71);
				end
			end
		else
			e.other:Message(13, "You already own this ability!");
		end

	elseif(e.message:findi("Confirm Purchase Master _Crafter")) then
		if mastercraft == 0 then
			if (aaPoints >= 6) then
				e.other:SetAAPoints(aaPoints - 6);
				e.other:IncrementAA(74);
				e.other:Message(2, "You gained a rank in Master Crafting!");
				e.other:SetSkill(60, 250);
				e.other:Message(2, "You are now a master in Baking!");
				e.other:SetSkill(65, 250);
				e.other:Message(2, "You are now a master in Brewing!");
			else
				e.other:Message(2, "Not enough AA's available for this purchase!");
			end
		elseif mastercraft == 1 then
			if (aaPoints >= 6) then
				e.other:SetAAPoints(aaPoints - 6);
				e.other:IncrementAA(74);
				e.other:Message(2, "You gained a rank in Master Crafting!");
				e.other:SetSkill(61, 250);
				e.other:Message(2, "You are now a master in Tailoring!");
				e.other:SetSkill(63, 250);
				e.other:Message(2, "You are now a master in Blacksmithing!");
			else
				e.other:Message(2, "Not enough AA's available for this purchase!");
			end
		elseif mastercraft == 2 then
			if (aaPoints >= 6) then
				e.other:SetAAPoints(aaPoints - 6);
				e.other:IncrementAA(74);
				e.other:Message(2, "You gained a rank in Master Crafting!");
				e.other:SetSkill(68, 250);
				e.other:Message(2, "You are now a master in Jewelry Making!");
			else
				e.other:Message(2, "Not enough AA's available for this purchase!");
			end
		else
			e.other:Message(13, "You already own this ability!");
		end

	elseif(e.message:findi("Confirm Purchase AA")) then
		if familiar == 0 then
			if (aaPoints >= 6) then
				e.other:SetAAPoints(aaPoints - 6);
				e.other:Message(2, "The Familiar Stone has been placed in your inventory!");
				e.other:IncrementAA(412);
				e.other:SummonItem(2444);
			else
				e.other:Message(2, "Not enough AA's available for this purchase!");
			end
		else
			e.other:Message(13, "You already own this ability!");
		end
		
	elseif(e.message:findi("Confirm Purchase Blessing of Wolf")) then
		if sow == 0 then
			if (aaPoints >= 2) then
				e.other:SetAAPoints(aaPoints - 2);
				e.other:IncrementAA(68);
				e.other:Message(2, "The Blessing of the Wolf has been placed in your inventory!");
				e.other:SummonItem(2437);
			else
				e.other:Message(2, "Not enough AA's available for this purchase!");
			end
		elseif sow < 3 then
			if sow > 0 then
				if (aaPoints >= 2) then
					e.other:SetAAPoints(aaPoints - 2);
					e.other:IncrementAA(68);
					e.other:Message(2, "You gained an additional rank in Blessing of the Wolf!");
				end
			end
		else
			e.other:Message(13, "You already own this ability!");
		end

	elseif(e.message:findi("Confirm Purchase Class _Special")) then
		if(tostring(special)) == "0" then
			if (aaPoints >= 6) then
				e.other:IncrementAA(65);
				e.other:SetAAPoints(aaPoints - 6);
				if tostring(class) == "1" then --Warrior
					e.other:IncrementAA(255); --Flurry
					e.other:Message(2, "You gained a new ability! Flurry!");
				elseif tostring(class) == "2" then --Cleric
					e.other:IncrementAA(132); --Bestow Divine Aura
					e.other:Message(2, "You gained a new ability! Bestow Divine Aura! Create a hotkey with /alt activate 39 to use it.");
				elseif tostring(class) == "3" then --Paladin
					e.other:IncrementAA(196); --2 Hand Bash
					e.other:Message(2, "You gained a new ability! 2 Hand Bash!");
				elseif tostring(class) == "4" then --Ranger
					e.other:IncrementAA(205); --Endless Quiver
					e.other:Message(2, "You gained a new ability! Endless Quiver!");
				elseif tostring(class) == "5" then --Shadowknight
					e.other:IncrementAA(196); --2 Hand Bash
					e.other:Message(2, "You gained a new ability! 2 Hand Bash!");
				elseif tostring(class) == "6" then --Druid
					e.other:IncrementAA(145); --Dire Charm
					e.other:Message(2, "You gained a new ability! Dire Charm! Create a hotkey with /alt activate 46 to use it.");
				elseif tostring(class) == "7" then --Monk
					e.other:IncrementAA(233); --Purify Body
					e.other:Message(2, "You gained a new ability! Purify Body! Create a hotkey with /alt activate 98 to use it.");
				elseif tostring(class) == "8" then --Bard
					e.other:IncrementAA(630); --Fading Memories
					e.other:Message(2, "You gained a new ability! Fading Memories! Create a hotkey with /alt activate 212 to use it.");
				elseif tostring(class) == "9" then --Rogue
					e.other:IncrementAA(243); --Escape
					e.other:Message(2, "You gained a new ability! Escape! Create a hotkey with /alt activate 102 to use it.");
				elseif tostring(class) == "10" then --Shaman
					e.other:IncrementAA(136); --Purify Soul
					e.other:Message(2, "You gained a new ability! Purify Soul! Create a hotkey with /alt activate 41 to use it.");
				elseif tostring(class) == "11" then --Necromancer
					e.other:IncrementAA(145); --Dire Charm
					e.other:Message(2, "You gained a new ability! Dire Charm! Create a hotkey with /alt activate 46 to use it.");
				elseif tostring(class) == "12" then --Wizard
					e.other:IncrementAA(162); --Gather Mana
					e.other:Message(2, "You gained a new ability! Gather Mana! Create a hotkey with /alt activate 57 to use it.");
				elseif tostring(class) == "13" then --Magician
					if level < 21 then
						e.other:IncrementAA(168); --Fire Elemental Form
						e.other:Message(2, "You gained a new ability! Fire Elemental Form! Create a hotkey with /alt activate 61 to use it.");
					elseif level < 36 then
						if level > 20 then
							e.other:IncrementAA(168); --Fire Elemental Form
							e.other:Message(2, "You gained a new ability! Fire Elemental Form! Create a hotkey with /alt activate 61 to use it.");
							e.other:IncrementAA(168); --Fire Elemental Form
						end
					elseif level < 51 then
						if level > 35 then
							e.other:IncrementAA(168); --Fire Elemental Form
							e.other:Message(2, "You gained a new ability! Fire Elemental Form! Create a hotkey with /alt activate 61 to use it.");
							e.other:IncrementAA(168); --Fire Elemental Form
							e.other:Message(2, "You gained a new ability! Fire Elemental Form! Create a hotkey with /alt activate 61 to use it.");
							e.other:IncrementAA(168); --Fire Elemental Form
						end
					end	
				elseif tostring(class) == "14" then --Enchanter
					e.other:IncrementAA(145); --Dire Charm
					e.other:Message(2, "You gained a new ability! Dire Charm! Create a hotkey with /alt activate 46 to use it.");
				end
			else
				e.other:Message(2, "Not enough AA's available for this purchase!");
			end
		else
			e.other:Message(13, "You already own this ability!");
		end


	elseif(e.message:findi("Confirm Purchase Blessing of FR")) then
		if fr == 0 then
			if (aaPoints >= 2) then
				e.other:SetAAPoints(aaPoints - 2);
				e.other:IncrementAA(37);
				e.other:Message(2, "The Blessing of Fire Protection has been placed in your inventory!");
				e.other:SummonItem(2438);
			else
				e.other:Message(2, "Not enough AA's available for this purchase!");
			end
		elseif fr < 5 then
			if fr > 0 then
				if (aaPoints >= 2) then
					e.other:SetAAPoints(aaPoints - 2);
					e.other:IncrementAA(37);
					e.other:Message(2, "You gained an additional rank of Blessing of Fire Protection!");
				end
			end
		else
			e.other:Message(13, "You already own this ability!");
		end

	elseif(e.message:findi("Confirm Purchase Blessing of CR")) then
		if cr == 0 then
			if (aaPoints >= 2) then
				e.other:SetAAPoints(aaPoints - 2);
				e.other:IncrementAA(42);
				e.other:Message(2, "The Blessing of Cold Protection has been placed in your inventory!");
				e.other:SummonItem(2439);
			else
				e.other:Message(2, "Not enough AA's available for this purchase!");
			end
		elseif cr < 5 then
			if cr > 0 then
				if (aaPoints >= 2) then
					e.other:SetAAPoints(aaPoints - 2);
					e.other:IncrementAA(42);
					e.other:Message(2, "You gained an additional rank in Blessing of Cold Protection!");
				end
			end
		else
			e.other:Message(13, "You already own this ability!");
		end

	elseif(e.message:findi("Confirm Purchase Blessing of MR")) then
		if mr == 0 then
			if (aaPoints >= 2) then
				e.other:SetAAPoints(aaPoints - 2);
				e.other:IncrementAA(47);
				e.other:Message(2, "The Blessing of Magic Protection has been placed in your inventory!");
				e.other:SummonItem(2487);
			else
				e.other:Message(2, "Not enough AA's available for this purchase!");
			end
		elseif mr < 5 then
			if mr > 0 then
				if (aaPoints >= 2) then
					e.other:SetAAPoints(aaPoints - 2);
					e.other:IncrementAA(47);
					e.other:Message(2, "The Blessing of Magic Protection has been placed in your inventory!");
				end
			end
		else
			e.other:Message(13, "You already own this ability!");
		end

	elseif(e.message:findi("Confirm Purchase Blessing of PR")) then
		if pr == 0 then
			if (aaPoints >= 2) then
				e.other:SetAAPoints(aaPoints - 2);
				e.other:IncrementAA(52);
				e.other:Message(2, "The Blessing of Poison Protection has been placed in your inventory!");
				e.other:SummonItem(2486);
			else
				e.other:Message(2, "Not enough AA's available for this purchase!");
			end
		elseif pr < 5 then
			if pr > 0 then
				if (aaPoints >= 2) then
					e.other:SetAAPoints(aaPoints - 2);
					e.other:IncrementAA(52);
					e.other:Message(2, "You gained an additional rank in Blessing of Poison Protection!");
				end
			end
		else
			e.other:Message(13, "You already own this ability!");
		end

	elseif(e.message:findi("Confirm Purchase Blessing of DR")) then
		if dr == 0 then
			if (aaPoints >= 2) then
				e.other:SetAAPoints(aaPoints - 2);
				e.other:IncrementAA(57);
				e.other:Message(2, "The Blessing of Disease Protection has been placed in your inventory!");
				e.other:SummonItem(2485);
			else
				e.other:Message(2, "Not enough AA's available for this purchase!");
			end
		elseif dr < 5 then
			if dr > 0 then
				if (aaPoints >= 2) then
					e.other:SetAAPoints(aaPoints - 2);
					e.other:IncrementAA(57);
					e.other:Message(2, "You gained an additional rank in Blessing of Disease Protection!");
				end
			end
		else
			e.other:Message(13, "You already own this ability!");
		end

	elseif(e.message:findi("Confirm Purchase Innate RunSpeed 3")) then
		if runspeed == 0 then
			if (aaPoints >= 2) then
				e.other:SetAAPoints(aaPoints - 2);
				e.other:IncrementAA(62);
				e.other:Message(2, "You gained an additional rank in Innate Run Speed!");
			else
				e.other:Message(2, "Not enough AA's available for this purchase!");
			end
		elseif runspeed < 3 then
			if runspeed > 0 then
				if (aaPoints >= 2) then
					e.other:SetAAPoints(aaPoints - 2);
					e.other:IncrementAA(62);
					e.other:Message(2, "You gained an additional rank in Innate Run Speed!");
				end
			end
		else
			e.other:Message(13, "You already own this ability!");
		end
	end
end

