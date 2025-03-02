
local spellsets = {
	Warrior = 0, Rogue = 0, Monk = 0, Cleric = 1, Wizard = 2, Necromancer = 3, Magician = 4, Enchanter = 5, Shaman = 6,
	Druid = 7, Paladin = 8, ShadowKnight = 9, Ranger = 10, Bard = 11, Beastlord = 12
}


function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 15, e.self:GetX() + 15, e.self:GetY() - 15, e.self:GetY() + 15, e.self:GetZ() -5, e.self:GetZ() +5);

	local npcName = e.self:GetCleanName()
	local cityOwnership = "qeynosGuild";
	local cityOwnershipName = "qeynosGuildName";
	local cityFactionStatus = "qeynosFaction";
	local cityGuild = eq.get_data(cityOwnership);
	local cityGuildName = eq.get_data(cityOwnershipName);
	local cityFaction = eq.get_data(cityFactionStatus);
	local maxGuards = 29;

	if (eq.get_data(cityFactionStatus) == "hostile") then
		e.self:SetNPCFactionID(68); --hostile
		e.self:Shout("Setting faction to hostile");
	else
		e.self:SetNPCFactionID(0); --peaceful
		e.self:Shout("Setting faction to peaceful");
	end

	if e.self:GetRace() == 71 then
		if (cityGuild == "") then
			if e.self:GetTexture() == 1 then 
				if e.self:GetClass() ~= 41 then
					set_base_stats(e);
					local qeynosGuards = "qeynosGuards";
					local qeynosGuardsQuantity = tonumber(eq.get_data(qeynosGuards));
					if eq.get_data(qeynosGuards) ~= "" then
						if qeynosGuardsQuantity < maxGuards then
							eq.set_data(qeynosGuards, tostring(qeynosGuardsQuantity + 1));
						end
					end
				end
			end
		else
			if e.self:GetTexture() == 1 then 
				if e.self:GetClass() ~= 41 then
					local myFactionID = e.self:GetNPCFactionID();
					e.self:SetGuild(tonumber(cityGuild)); --set guild to player
					set_base_stats(e);
					--e.self:TempName(npcName.."_<"..cityGuildName..">"); --add guild name to npc name
					local qeynosGuards = "qeynosGuards";
					local qeynosGuardsQuantity = tonumber(eq.get_data(qeynosGuards));
					if eq.get_data(qeynosGuards) ~= "" then
						if qeynosGuardsQuantity < maxGuards then
							eq.set_data(qeynosGuards, tostring(qeynosGuardsQuantity + 1));
						end
					end
				end
			end
		end
	end
end

function event_death_complete(e)
    if e.self:GetRace() == 71 then
        if e.self:GetTexture() == 1 then 
            if e.self:GetClass() ~= 41 then
                eq.signal(10, e.killer:GetID());
            end
        end
    end
end


function event_enter(e)
	local char_id = e.other:CharacterID();
	local guild_id = e.other:GuildID();
	local char_guild_rank = e.other:GuildRank();
	local char_name = eq.get_char_name_by_id(char_id);
	local random_animation = math.random(1,2);
	local cityOwnership = "qeynosGuild";
	local cityGuild = eq.get_data(cityOwnership);
	if (cityGuild == tostring(guild_id)) then --if databucket matches guild id
		if char_guild_rank == 2 then --if leader of guild
			if random_animation == 1 then
				e.self:DoAnim(36);
				e.self:Say("Welcome home Master "..char_name.."!");
			elseif random_animation == 2 then
				e.self:DoAnim(67);
				e.self:Say("Welcome home Master "..char_name.."!");
			end

		end
	end
end


function event_say(e)
	if e.self:GetRace() == 71 then
		if e.self:GetTexture() == 1 then 
            if e.self:GetClass() ~= 41 then
				local char_id = e.other:CharacterID();
				local guild_id = e.other:GuildID();
				local char_guild_rank = e.other:GuildRank();
				local char_name = eq.get_char_name_by_id(char_id);
				local cityOwnership = "qeynosGuild";
				local cityGuild = eq.get_data(cityOwnership);
				local cityFactionStatus = "qeynosFaction";
				local cityFaction = eq.get_data(cityFactionStatus);
				local cityReset = "qeynosReset";
				local cityResetTimer = eq.get_data(cityReset)
				local cityBank = "qeynosBank";
				local cityBankAmount = eq.get_data(cityBank);
				local cityBankCollect = "qeynosBankCollectTimer";
				local cityBankCollectTimer = eq.get_data(cityBankCollect);


				if (cityGuild == tostring(guild_id)) then --if databucket matches guild id
					if char_guild_rank == 2 then --if leader of guild
						if(e.message:findi("hail")) then
							e.self:Say("Hail Master "..char_name.."! Would you like me to ["..eq.say_link("alert").."] the guards sir? Or, if it pleases, I could fetch the master of coin? ["..eq.say_link("check vault").."] or ["..eq.say_link("collect from vault").."]");
						elseif(e.message:findi("check vault")) then
							if eq.get_data(cityBank) ~= "" then
								e.self:Say("Sir, the bank currently has: " ..eq.get_data(cityBank) .." platinum.");
							end
						elseif(e.message:findi("collect from vault")) then
							try_collect_from_vault(e)
						end
						if eq.get_data(cityReset) == "0" then --city reset timer cooldown to prevent chain resetting guards from defending guild. Once an hour reset.
							if(e.message:findi("alert")) then
								e.self:Say("On your orders we can be ["..eq.say_link("hostile").. "] or ["..eq.say_link("peaceful").. "] to all whom enter Qeynos");
							elseif(e.message:findi("hostile")) then
								local cityFactionStatus = "qeynosFaction";
								if eq.get_data(cityFactionStatus) ~= "" then
									eq.set_data(cityFactionStatus, "hostile");
									local guardsBucketKey = "qeynosGuards";
									local qeynosGuards = eq.get_data(guardsBucketKey);
									if qeynosGuards ~= "" then
										eq.set_data(guardsBucketKey, "0"); --reset guard count to 0
										eq.set_data(cityReset, "1");
										--eq.cross_zone_signal_npc_by_npctype_id(450002, 7); --cooldown signal to courier in CSHOME
										--eq.set_timer("repopCooldownHostile", 1000); --1 second cooldown to make sure guardsBucketKey is set to 0 before repops
										e.self:Say("Right away sir! Sending word sir!");
									end
								end				
							elseif(e.message:findi("peaceful")) then
								if eq.get_data(cityFactionStatus) ~= "" then
									eq.set_data(cityFactionStatus, "peaceful");
									local guardsBucketKey = "qeynosGuards";
									local qeynosGuards = eq.get_data(guardsBucketKey);
									if qeynosGuards ~= "" then
										eq.set_data(guardsBucketKey, "0"); --reset guard count to 0
										eq.set_data(cityReset, "1");
										--eq.cross_zone_signal_npc_by_npctype_id(450002, 7); --cooldown signal to courier in CSHOME
										--eq.set_timer("repopCooldownPeaceful", 1000); --1 second cooldown to make sure guardsBucketKey is set to 0 before repops
										e.self:Say("Right away sir! Sending word sir!");
									end
								end
							end
						else
							if(e.message:findi("alert")) then
								e.self:Say("My apologies sir. I've already sent new orders to the guard. I can send additional word within the hour");
							end
						end
					end
				end
			end
		end
	end
end


function event_timer(e)
	if (e.timer == "repopCooldownHostile") then
		eq.stop_timer("repopCooldownHostile");
		repop_guards_in_zone_hostile();
	elseif (e.timer == "repopCooldownPeaceful") then
		eq.stop_timer("repopCooldownPeaceful");
		repop_guards_in_zone_peaceful();
	end
end


function repop_guards_in_zone_hostile()
	eq.signal(450001, 2); --signal of war to the Qeynos Courier (South Qeynos) - 450001
	eq.cross_zone_signal_npc_by_npctype_id(450000, 2); --signal of war to Qeynos Courier (North Qeynos) - 450000
end

function repop_guards_in_zone_peaceful()
	eq.signal(450001, 3); --signal of peace to the Qeynos Courier (South Qeynos) - 450001
	eq.cross_zone_signal_npc_by_npctype_id(450000, 3); --signal of peace to Qeynos Courier (North Qeynos) - 450000
end

function try_collect_from_vault(e)
	local cityBank = "qeynosBank";
	local cityBankAmount = eq.get_data(cityBank);
	local cityBankCollect = "qeynosBankCollectTimer";
	local cityBankCollectTimer = eq.get_data(cityBankCollect);

	if cityBankCollectTimer ~= "" then
		local pattern = "(%a+) (%a+) (%d+) (%d+):(%d+):(%d+) (%d+)"
        local _, month, day, hour, min, sec, year = cityBankCollectTimer:match(pattern)
        
        -- Convert month name to number
        local months = {
            Jan = 1, Feb = 2, Mar = 3, Apr = 4, May = 5, Jun = 6,
            Jul = 7, Aug = 8, Sep = 9, Oct = 10, Nov = 11, Dec = 12
        }
        
        local timeTable = {
            year = tonumber(year),
            month = months[month],
            day = tonumber(day),
            hour = tonumber(hour),
            min = tonumber(min),
            sec = tonumber(sec)
        }
        local unixTimestamp = os.time(timeTable)

        local now = os.time()

        local difference = now - unixTimestamp 

        local dayspassed = difference / 86400 --every day passed
        if dayspassed >= 3 then
			if cityBankAmount ~= "" then
				e.self:Say("Sir, the bank currently has: " ..cityBankAmount .." platinum. Here you are!");
				e.other:QuestReward(e.self,0,0,0,tonumber(cityBankAmount))
				eq.set_data(cityBank, tostring(0));
				eq.set_data(cityBankCollect, os.date("%c"));

			end
		else
			e.self:Say("Apologies sir, the master of coin is out... The next time the vault can be collected from is in: " ..tostring(math.floor(3 - tonumber(dayspassed))).." days.");
		end
	else

		if cityBankAmount ~= "" then
			e.self:Say("Sir, the bank currently has: " ..cityBankAmount .." platinum. Here you are!");
			e.other:QuestReward(e.self,0,0,0,tonumber(cityBankAmount))
			eq.set_data(cityBank, tostring(0));
			eq.set_data(cityBankCollect, os.date("%c"));
		end
	end
end

function set_base_stats(e)

	local zone = eq.get_zone_long_name();
	local level = eq.get_rule("Character:MaxLevel") --Guards scale with character max level
	e.self:SetLevel(tonumber(level));
	--e.self:ModifyNPCStat("npc_spells_id", tostring(spellsets[e.self:GetClassName()]));
	e.self:ModifyNPCStat("aggroradius", tostring(70));
	e.self:ModifyNPCStat("assistradius", tostring(70));	

	if (level == 20) then
		local hp = 650
		local ac = 70
		local str = 99
		local sta = 99
		local min_dmg = 10
		local max_dmg = 46
		local hp_regen_rate = 3

		for i,hp in pairs(hp) do
			e.self:ModifyNPCStat("hp", ""..hp);
			e.self:SetHP(e.self:GetMaxHP());
			e.self:Shout("Setting my hp to "..hp);
		end
		for i,ac in pairs(ac) do
			e.self:ModifyNPCStat("AC", ""..ac);
		end
		for i,str in pairs(str) do
			e.self:ModifyNPCStat("STR", ""..str);
		end
		for i,sta in pairs(sta) do
			e.self:ModifyNPCStat("STA", ""..sta);
		end
		for i,min_dmg in pairs(min_dmg) do
			e.self:ModifyNPCStat("mindmg", ""..min_hit);
		end
		for i,max_dmg in pairs(max_dmg) do
			e.self:ModifyNPCStat("maxdmg", ""..max_hit);
		end
		for i,hp_regen_rate in pairs(hp_regen_rate) do
			e.self:ModifyNPCStat("combat_hp_regen", ""..hp_regen_rate);
		end
	elseif (level == 30) then
		local hp = 1650
		local ac = 120
		local str = 120
		local sta = 120
		local min_dmg = 15
		local max_dmg = 70
		local hp_regen_rate = 4

		for i,hp in pairs(hp) do
			e.self:ModifyNPCStat("hp", ""..hp);
			e.self:SetHP(e.self:GetMaxHP());
		end
		for i,ac in pairs(ac) do
			e.self:ModifyNPCStat("AC", ""..ac);
		end
		for i,str in pairs(str) do
			e.self:ModifyNPCStat("STR", ""..str);
		end
		for i,sta in pairs(sta) do
			e.self:ModifyNPCStat("STA", ""..sta);
		end
		for i,min_dmg in pairs(min_dmg) do
			e.self:ModifyNPCStat("mindmg", ""..min_hit);
		end
		for i,max_dmg in pairs(max_dmg) do
			e.self:ModifyNPCStat("maxdmg", ""..max_hit);
		end
		for i,hp_regen_rate in pairs(hp_regen_rate) do
			e.self:ModifyNPCStat("combat_hp_regen", ""..hp_regen_rate);
		end
	elseif (level == 40) then
		local hp = 3250
		local ac = 150
		local str = 135
		local sta = 135
		local min_dmg = 25
		local max_dmg = 101
		local hp_regen_rate = 5

		for i,hp in pairs(hp) do
			e.self:ModifyNPCStat("hp", ""..hp);
			e.self:SetHP(e.self:GetMaxHP());
		end
		for i,ac in pairs(ac) do
			e.self:ModifyNPCStat("AC", ""..ac);
		end
		for i,str in pairs(str) do
			e.self:ModifyNPCStat("STR", ""..str);
		end
		for i,sta in pairs(sta) do
			e.self:ModifyNPCStat("STA", ""..sta);
		end
		for i,min_dmg in pairs(min_dmg) do
			e.self:ModifyNPCStat("mindmg", ""..min_hit);
		end
		for i,max_dmg in pairs(max_dmg) do
			e.self:ModifyNPCStat("maxdmg", ""..max_hit);
		end
		for i,hp_regen_rate in pairs(hp_regen_rate) do
			e.self:ModifyNPCStat("combat_hp_regen", ""..hp_regen_rate);
		end
	elseif (level == 50) then
		local hp = 15120
		local ac = 190
		local str = 191
		local sta = 191
		local min_dmg = 61
		local max_dmg = 175
		local hp_regen_rate = 6

		for i,hp in pairs(hp) do
			e.self:ModifyNPCStat("hp", ""..hp);
			e.self:SetHP(e.self:GetMaxHP());
		end
		for i,ac in pairs(ac) do
			e.self:ModifyNPCStat("AC", ""..ac);
		end
		for i,str in pairs(str) do
			e.self:ModifyNPCStat("STR", ""..str);
		end
		for i,sta in pairs(sta) do
			e.self:ModifyNPCStat("STA", ""..sta);
		end
		for i,min_dmg in pairs(min_dmg) do
			e.self:ModifyNPCStat("mindmg", ""..min_hit);
		end
		for i,max_dmg in pairs(max_dmg) do
			e.self:ModifyNPCStat("maxdmg", ""..max_hit);
		end
		for i,hp_regen_rate in pairs(hp_regen_rate) do
			e.self:ModifyNPCStat("combat_hp_regen", ""..hp_regen_rate);
		end		
	end
end
