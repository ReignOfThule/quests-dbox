local saved_char_id = 0;

function event_discover_item(e)
	eq.world_emote(15, "" .. e.self:GetCleanName() .. " has discovered " .. eq.item_link(e.item:ID()) .. "!" );
end

function event_connect(e)
	local charID = e.self:CharacterID();
	local charIDBind = tostring(charID).."bind"
	if eq.get_data(charIDBind) == "" then
		eq.set_data(charIDBind, "nexusbound");
		e.self:MovePC(152, 0, 0, -30.90, 0);
	end
end

function event_enter_zone(e)
	local charLevel = e.self:GetLevel();
	local charID = e.self:CharacterID();
	local charIDBind = tostring(charID).."bind"
	local initialSpells = tostring(charID).."initialspells"
	
	if eq.get_data(charIDBind) == "" then
		eq.set_data(charIDBind, "nexusbound");
		e.self:MovePC(152, 0, 0, -30.90, 0);
	end

	if eq.get_data(initialSpells) == "" then
		e.self:SummonItem(10184);
		e.self:ScribeSpells(1, 1);
		e.self:MaxSkills(false); 
		eq.set_data(initialSpells, "nexusbound");
	end
end

function event_cast_begin(e)
	--AA List
	local str = e.self:GetAA(2);
	local sta = e.self:GetAA(7);
	local haste = e.self:GetAA(12);
	local seeinvis = e.self:GetAA(17);
	local clarity = e.self:GetAA(22);
	local reso = e.self:GetAA(27);
	local symb = e.self:GetAA(32);
	local fr = e.self:GetAA(37);
	local cr = e.self:GetAA(42);
	local mr = e.self:GetAA(47);
	local pr = e.self:GetAA(52);
	local dr = e.self:GetAA(57);
	local sow = e.self:GetAA(68);
	local makeshift = e.self:GetAA(71);
	local familiar = e.self:GetAA(412);

	local charLevel = e.self:GetLevel();
	local charID = e.self:CharacterID();
	local clericResoRecast = eq.get_data(tostring(charID).."clericResoTimer");
	local clericSymbRecast = eq.get_data(tostring(charID).."clericSymbTimer");


	if e.spell == 2759 then --Undead Pact - Necromancer Dire Charm
		if e.target_level >= e.self:GetLevel() then -- Charm target must be lower level than player
			e.self:Duck();
			e.self:Message(15,"Target is too high level. Try casting on something lower level than you.");
		end
	elseif e.spell == 2760 then --Servant of Nature - Druid Dire Charm
		if e.target_level >= e.self:GetLevel() then -- Charm target must be lower level than player
			e.self:Duck();
			e.self:Message(15,"Target is too high level. Try casting on something lower level than you.");
		end
	elseif e.spell == 2761 then --Dominating Gaze - Enchanter Dire Charm
		if e.target_level >= e.self:GetLevel() then -- Charm target must be lower level than player
			e.self:Duck();
			e.self:Message(15,"Target is too high level. Try casting on something lower level than you.");
		end
	elseif e.spell == 3138 then --Blessing of the Resolute
		if clericResoRecast ~= "" then
			e.self:Message(13, "This spell is currently on a cooldown.");
			e.self:Duck();
		end
	elseif e.spell == 3149 then --Blessing of Symbols
		if clericSymbRecast ~= "" then
			e.self:Message(13, "This spell is currently on a cooldown.");
			e.self:Duck();
		end
	end
end

function event_level_up(e)
	local charLevel = e.self:GetLevel();
	e.self:ScribeSpells(1, charLevel); 
	e.self:MaxSkills(false); 
end

function event_cast(e)
	local str = e.self:GetAA(2);
	local sta = e.self:GetAA(7);
	local haste = e.self:GetAA(12);
	local seeinvis = e.self:GetAA(17);
	local clarity = e.self:GetAA(22);
	local reso = e.self:GetAA(27);
	local symb = e.self:GetAA(32);
	local fr = e.self:GetAA(37);
	local cr = e.self:GetAA(42);
	local mr = e.self:GetAA(47);
	local pr = e.self:GetAA(52);
	local dr = e.self:GetAA(57);
	local sow = e.self:GetAA(68);
	local makeshift = e.self:GetAA(71);
	local familiar = e.self:GetAA(412);
	local charLevel = e.self:GetLevel();
	local charID = e.self:CharacterID();
	local clericResoRecast = eq.get_data(tostring(charID).."clericResoTimer");
	local clericSymbRecast = eq.get_data(tostring(charID).."clericSymbTimer");

	saved_char_id = charID;

	if e.spell == 3137 then --blessing of the wolf
		if charLevel < 20 then
			if sow == 1 then
				eq.self_cast(874); --Journeyman's Boots
			elseif sow > 1 then
				eq.self_cast(874); --Journeyman's Boots
			end
		elseif charLevel < 30 then
			if charLevel > 19 then
				if sow == 1 then
					eq.self_cast(874); --Journeyman's Boots
				elseif sow > 1 then
					eq.self_cast(278); --Spirit of Wolf
				end
			end
		elseif charLevel > 29 then
			if sow == 1 then
				eq.self_cast(874); --Journeyman's Boots
			elseif sow == 2 then
				eq.self_cast(278); --Spirit of Wolf
			elseif sow > 2 then
				eq.self_cast(2524); --Spirit of Bih Li
			end
		end
	elseif e.spell == 3138 then --blessing of the Resolute
		if clericResoRecast == "" then
			if charLevel < 20 then
				if reso == 1 then
					eq.self_cast(89); --Daring
					eq.set_data(tostring(charID).."clericResoTimer", "onCooldown", "10M");
				elseif reso > 1 then
					eq.self_cast(89); --Daring
					eq.set_data(tostring(charID).."clericResoTimer", "onCooldown", "10M");
				end			
			elseif charLevel < 30 then
				if charLevel > 19 then
					if reso == 1 then
						eq.self_cast(89); --Daring
						eq.set_data(tostring(charID).."clericResoTimer", "onCooldown", "10M");
					elseif reso > 1 then
						eq.self_cast(244); --Bravery
						eq.set_data(tostring(charID).."clericResoTimer", "onCooldown", "10M");
					end
				end
			elseif charLevel < 40 then
				if charLevel > 29 then
					if reso == 1 then
						eq.self_cast(89); --Daring
						eq.set_data(tostring(charID).."clericResoTimer", "onCooldown", "10M");
					elseif reso == 2 then
						eq.self_cast(244); --Bravery
						eq.set_data(tostring(charID).."clericResoTimer", "onCooldown", "10M");
					elseif reso > 2 then
						eq.self_cast(312); --Valor
						eq.set_data(tostring(charID).."clericResoTimer", "onCooldown", "10M");
					end
				end
			elseif charLevel < 51 then
				if charLevel > 39 then
					if reso == 1 then
						eq.self_cast(89); --Daring
						eq.set_data(tostring(charID).."clericResoTimer", "onCooldown", "10M");
					elseif reso == 2 then
						eq.self_cast(244); --Bravery
						eq.set_data(tostring(charID).."clericResoTimer", "onCooldown", "10M");
					elseif reso == 3 then
						eq.self_cast(312); --Valor
						eq.set_data(tostring(charID).."clericResoTimer", "onCooldown", "10M");
					elseif reso > 3 then
						eq.self_cast(314); --Resolution
						eq.set_data(tostring(charID).."clericResoTimer", "onCooldown", "10M");
					end
				end
			end
		else
			e.self:Message(13, "This spell is currently on a cooldown.");
		end

	elseif e.spell == 3149 then --blessing of symbols
		if clericSymbRecast == "" then
			if charLevel < 20 then
				if symb == 1 then
					eq.self_cast(485); --Symbol of Transal
					eq.set_data(tostring(charID).."clericSymbTimer", "onCooldown", "10M");
				elseif symb > 1 then
					eq.self_cast(485); --Symbol of Transal
					eq.set_data(tostring(charID).."clericSymbTimer", "onCooldown", "10M");
				end
			elseif charLevel < 30 then
				if charLevel > 19 then
					if symb == 1 then
						eq.self_cast(485); --Symbol of Transal
						eq.set_data(tostring(charID).."clericSymbTimer", "onCooldown", "10M");
					elseif symb > 1 then
						eq.self_cast(486); --Symbol of Ryltan
						eq.set_data(tostring(charID).."clericSymbTimer", "onCooldown", "10M");
					end
				end
			elseif charLevel < 40 then
				if charLevel > 29 then
					if symb == 1 then
						eq.self_cast(485); --Symbol of Transal
						eq.set_data(tostring(charID).."clericSymbTimer", "onCooldown", "10M");
					elseif symb == 2 then
						eq.self_cast(486); --Symbol of Ryltan
						eq.set_data(tostring(charID).."clericSymbTimer", "onCooldown", "10M");
					elseif symb > 2 then
						eq.self_cast(487); --Symbol of Pinzarn
						eq.set_data(tostring(charID).."clericSymbTimer", "onCooldown", "10M");
					end
				end
			elseif charLevel < 51 then
				if charLevel > 39 then
					if symb == 1 then
						eq.self_cast(485); --Symbol of Transal
						eq.set_data(tostring(charID).."clericSymbTimer", "onCooldown", "10M");
					elseif symb == 2 then
						eq.self_cast(486); --Symbol of Ryltan
						eq.set_data(tostring(charID).."clericSymbTimer", "onCooldown", "10M");
					elseif symb == 3 then
						eq.self_cast(487); --Symbol of Pinzarn
						eq.set_data(tostring(charID).."clericSymbTimer", "onCooldown", "10M");
					elseif symb > 3 then
						eq.self_cast(488); --Symbol of Naltron
						eq.set_data(tostring(charID).."clericSymbTimer", "onCooldown", "10M");
					end
				end
			end
		else
			e.self:Message(13, "This spell is currently on a cooldown.");
		end
	elseif e.spell == 3139 then --blessing of clarity
		if charLevel < 20 then
			if clarity == 1 then
				eq.self_cast(697); --Breeze
			elseif clarity > 1 then
				eq.self_cast(697); --Breeze
			end
		elseif charLevel < 30 then
			if charLevel > 19 then
				if clarity == 1 then
					eq.self_cast(697); --Breeze
				elseif clarity > 1 then
					eq.self_cast(174); --Clarity
				end
			end
		elseif charLevel > 29 then
			if clarity == 1 then
				eq.self_cast(697); --Breeze
			elseif clarity == 2 then
				eq.self_cast(174); --Clarity
			elseif clarity > 2 then
				eq.self_cast(1693); --Clarity II
			end
		end
	elseif e.spell == 3140 then -- Blessing of Sight
		eq.self_cast(80); --See Invis
	elseif e.spell == 3141 then --Blessing of Haste
		if charLevel < 20 then
			if haste == 1 then
				eq.self_cast(39); --Quickness
			elseif haste > 1 then
				eq.self_cast(39); --Quickness
			end
		elseif charLevel < 30 then
			if charLevel > 19 then
				if haste == 1 then
					eq.self_cast(39); --Quickness
				elseif haste > 1 then
					eq.self_cast(170); --Alacrity
				end
			end
		elseif charLevel < 40 then
			if charLevel > 29 then
				if haste == 1 then
					eq.self_cast(39); --Quickness
				elseif haste == 2 then
					eq.self_cast(170); --Alacrity
				elseif haste > 2 then
					eq.self_cast(171); --Celerity
				end
			end
		elseif charLevel < 51 then
			if charLevel > 39 then
				if haste == 1 then
					eq.self_cast(39); --Quickness
				elseif haste == 2 then
					eq.self_cast(170); --Alacrity
				elseif haste == 3 then
					eq.self_cast(171); --Celerity
				elseif haste > 3 then
					eq.self_cast(172); --Swift like the Wind
				end
			end
		end
	elseif e.spell == 3142 then --Blessing of Stamina
		if charLevel < 20 then
			if sta == 1 then
				eq.self_cast(279); --Spirit of Bear
			elseif sta > 1 then
				eq.self_cast(279); --If above rank 1 at level 20, still cast Spirit of Bear
			end
		elseif charLevel < 30 then
			if charLevel > 19 then
				if sta == 1 then
					eq.self_cast(279); --Spirit of Bear
				elseif sta > 1 then 
					eq.self_cast(149); --If above rank 1 at level 21-30 cast Spirit of Ox
				end
			end
		elseif charLevel < 40 then
			if charLevel > 29 then
				if sta == 1 then
					eq.self_cast(279); --Spirit of Bear
				elseif sta == 2 then
					eq.self_cast(149); --Spirit of Ox
				elseif sta > 2 then
					eq.self_cast(161); --If above rank 2 at level 31-40 cast Health
				end
			end
		elseif charLevel < 51 then
			if charLevel > 39 then
				if sta == 1 then
					eq.self_cast(279); --Spirit of Bear
				elseif sta == 2 then
					eq.self_cast(149); --Spirit of Ox
				elseif sta == 3 then
					eq.self_cast(161); --Health
				elseif sta > 3 then
					eq.self_cast(158); --If above rank 3 at level 41-50 cast Stamina
				end
			end
		end
	elseif e.spell == 3143 then --Blessing of Strength
		if charLevel < 20 then
			if str == 1 then
				eq.self_cast(147); --Spirit Strength
			elseif str > 1 then
				eq.self_cast(147); --If above rank 1 at level 20, still cast Spirit Strength
			end
		elseif charLevel < 30 then
			if charLevel > 19 then
				if str == 1 then
					eq.self_cast(147); --Spirit Strength
				elseif str > 1 then
					eq.self_cast(151); --If above rank 1 at level 21-30, cast Raging Strength
				end
			end
		elseif charLevel < 40 then
			if charLevel > 29 then
				if str == 1 then
					eq.self_cast(147); --Spirit Strength
				elseif str == 2 then
					eq.self_cast(151); --Raging Strength
				elseif str > 2 then
					eq.self_cast(153); --If above rank 2 at level 31-40, cast Furious Strength
				end
			end
		elseif charLevel < 51 then
			if charLevel > 39 then
				if str == 1 then
					eq.self_cast(147); --Spirit Strength
				elseif str == 2 then
					eq.self_cast(151); --Raging Strength
				elseif str == 3 then
					eq.self_cast(153); --Furious Strength
				elseif str > 3 then
					eq.self_cast(159); --If above rank 3 at level 41-50, cast Strength
				end
			end
		end
	elseif e.spell == 3144 then --Blessing of Fire
		if charLevel < 20 then
			if fr == 1 then
				eq.self_cast(224); --Endure Fire
			elseif fr > 1 then
				eq.self_cast(224); -- Endure Fire
			end
		elseif charLevel > 19 then
			if fr == 1 then
				eq.self_cast(224); --Endure Fire
			elseif fr > 1 then
				eq.self_cast(60); -- Resist Fire
			end
		end
	elseif e.spell == 3145 then --Blessing of Cold
		if charLevel < 20 then
			if cr == 1 then
				eq.self_cast(225); --Endure Cold
			elseif cr > 1 then
				eq.self_cast(225); -- Endure Cold
			end
		elseif charLevel > 19 then
			if cr == 1 then
				eq.self_cast(225); --Endure Cold
			elseif cr > 1 then
				eq.self_cast(61); -- Resist Cold
			end
		end
	elseif e.spell == 3146 then --Blessing of Disease
		if charLevel < 20 then
			if dr == 1 then
				eq.self_cast(226); --Endure Disease
			elseif dr > 1 then
				eq.self_cast(226); -- Endure Disease
			end
		elseif charLevel > 19 then
			if dr == 1 then
				eq.self_cast(226); --Endure Disease
			elseif dr > 1 then
				eq.self_cast(63); -- Resist Disease
			end
		end
	elseif e.spell == 3147 then --Blessing of Poison
		if charLevel < 20 then
			if pr == 1 then
				eq.self_cast(227); --Endure Poison
			elseif pr > 1 then
				eq.self_cast(227); -- Endure Poison
			end
		elseif charLevel > 19 then
			if pr == 1 then
				eq.self_cast(227); --Endure Poison
			elseif pr > 1 then
				eq.self_cast(62); -- Resist Poison
			end
		end
	elseif e.spell == 3148 then --Blessing of Magic
		if charLevel < 20 then
			if mr == 1 then
				eq.self_cast(228); --Endure Magic
			elseif mr > 1 then
				eq.self_cast(228); -- Endure Magic
			end
		elseif charLevel > 19 then
			if mr == 1 then
				eq.self_cast(228); --Endure Magic
			elseif mr > 1 then
				eq.self_cast(64); -- Resist Magic
			end
		end
	elseif e.spell == 3211 then --Makeshift Illusion
		if makeshift == 1 then
			local random_illusion = math.random(1,9);
			if random_illusion == 1 then
				eq.self_cast(582); --Illusion Human
			elseif random_illusion == 2 then
				eq.self_cast(583); --Illusion Half Elf
			elseif random_illusion == 3 then
				eq.self_cast(586); --Illusion Barbarian
			elseif random_illusion == 4 then
				eq.self_cast(587); --Illusion Erudite
			elseif random_illusion == 5 then
				eq.self_cast(588); --Illusion Wood Elf
			elseif random_illusion == 6 then
				eq.self_cast(589); --Illusion High Elf
			elseif random_illusion == 7 then
				eq.self_cast(590); --Illusion Dark Elf
			elseif random_illusion == 8 then
				eq.self_cast(592); --Illusion Troll
			elseif random_illusion == 9 then
				eq.self_cast(593); --Illusion Ogre
			end
		elseif makeshift == 2 then
			local random_illusion = math.random(1,14);
			if random_illusion == 1 then
				eq.self_cast(582); --Illusion Human
			elseif random_illusion == 2 then
				eq.self_cast(583); --Illusion Half Elf
			elseif random_illusion == 3 then
				eq.self_cast(586); --Illusion Barbarian
			elseif random_illusion == 4 then
				eq.self_cast(587); --Illusion Erudite
			elseif random_illusion == 5 then
				eq.self_cast(588); --Illusion Wood Elf
			elseif random_illusion == 6 then
				eq.self_cast(589); --Illusion High Elf
			elseif random_illusion == 7 then
				eq.self_cast(590); --Illusion Dark Elf
			elseif random_illusion == 8 then
				eq.self_cast(592); --Illusion Troll
			elseif random_illusion == 9 then
				eq.self_cast(593); --Illusion Ogre
			elseif random_illusion == 10 then
				eq.self_cast(3063); --Illusion Froglok
			elseif random_illusion == 11 then
				eq.self_cast(2826); --Illusion Vah Shir
			elseif random_illusion == 12 then
				eq.self_cast(243); --Illusion Iksar
			elseif random_illusion == 13 then
				eq.self_cast(591); --Illusion Dwarf
			elseif random_illusion == 14 then
				eq.self_cast(595); --Illusion Gnome
			end
		elseif makeshift == 3 then
			local random_illusion = math.random(1,16);
			if random_illusion == 1 then
				eq.self_cast(582); --Illusion Human
			elseif random_illusion == 2 then
				eq.self_cast(583); --Illusion Half Elf
			elseif random_illusion == 3 then
				eq.self_cast(586); --Illusion Barbarian
			elseif random_illusion == 4 then
				eq.self_cast(587); --Illusion Erudite
			elseif random_illusion == 5 then
				eq.self_cast(588); --Illusion Wood Elf
			elseif random_illusion == 6 then
				eq.self_cast(589); --Illusion High Elf
			elseif random_illusion == 7 then
				eq.self_cast(590); --Illusion Dark Elf
			elseif random_illusion == 8 then
				eq.self_cast(592); --Illusion Troll
			elseif random_illusion == 9 then
				eq.self_cast(593); --Illusion Ogre
			elseif random_illusion == 10 then
				eq.self_cast(3063); --Illusion Froglok
			elseif random_illusion == 11 then
				eq.self_cast(2826); --Illusion Vah Shir
			elseif random_illusion == 12 then
				eq.self_cast(243); --Illusion Iksar
			elseif random_illusion == 13 then
				eq.self_cast(591); --Illusion Dwarf
			elseif random_illusion == 14 then
				eq.self_cast(595); --Illusion Gnome
			elseif random_illusion == 15 then
				eq.self_cast(581); --Illusion Skeleton
			elseif random_illusion == 16 then
				eq.self_cast(585); --Illusion Werewolf
			end
		end
	end
end




