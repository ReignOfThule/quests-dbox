

function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 15, e.self:GetX() + 15, e.self:GetY() - 15, e.self:GetY() + 15, e.self:GetZ() -5, e.self:GetZ() +5);

	local npcName = e.self:GetCleanName()
	local cityOwnership = "southkaranaGuild";
	local cityOwnershipName = "southkaranaGuildName";
	local cityFactionStatus = "southkaranaFaction";
	local cityGuild = eq.get_data(cityOwnership);
	local cityGuildName = eq.get_data(cityOwnershipName);
	local cityFaction = eq.get_data(cityFactionStatus);
	local maxGuards = 7;
    local southkaranaGuards = "southkaranaGuards";
    local southkaranaGuardsQuantity = tonumber(eq.get_data(southkaranaGuards));

    e.self:SetHostile(true);
    set_base_stats(e);
				
    if (cityGuild ~= "") then
        e.self:SetGuild(tonumber(cityGuild)); --set guild to player
        e.self:TempName(npcName.."_<"..cityGuildName..">"); --add guild name to npc name
        if eq.get_data(southkaranaGuards) ~= "" then
            if southkaranaGuardsQuantity < maxGuards then
                eq.set_data(southkaranaGuards, tostring(southkaranaGuardsQuantity + 1));
            end
        end
    else
        if eq.get_data(southkaranaGuards) ~= "" then
            if southkaranaGuardsQuantity < maxGuards then
                eq.set_data(southkaranaGuards, tostring(southkaranaGuardsQuantity + 1));
            end
        end
	end
end

function event_death_complete(e)
    eq.signal(32, e.killer:GetID());
end


function event_enter(e)
	local char_id = e.other:CharacterID();
	local guild_id = e.other:GuildID();
	local char_guild_rank = e.other:GuildRank();
	local char_name = eq.get_char_name_by_id(char_id);
	local random_animation = math.random(1,2);
	local cityOwnership = "southkaranaGuild";
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
    local char_id = e.other:CharacterID();
    local charID = e.other:GetID();
    local guild_id = e.other:GuildID();
    local char_guild_rank = e.other:GuildRank();
    local char_name = eq.get_char_name_by_id(char_id);
    local cityOwnership = "southkaranaGuild";
    local cityGuild = eq.get_data(cityOwnership);
    local cityFactionStatus = "southkaranaFaction";
    local cityFaction = eq.get_data(cityFactionStatus);
    local cityReset = "southkaranaReset";
    local cityResetTimer = eq.get_data(cityReset)
    local cityBank = "southkaranaBank";
    local cityBankAmount = eq.get_data(cityBank);
    local cityBankCollect = "southkaranaBankCollectTimer";
    local cityBankCollectTimer = eq.get_data(cityBankCollect);
    local cityRepop = "southkaranaRepop";
	local level = eq.get_rule("Character:MaxLevel") --Guards scale with character max level

			
    if (cityGuild == tostring(guild_id)) then --if databucket matches guild id
        if (e.other:InPvP()) then
            e.other:Message(13, "You cannot interact with this NPC while flagged for PvP.");
            return;
        end
        if(e.message:findi("hail")) then
            e.self:Say("Hail "..char_name.."! Would you like [ "..eq.say_link("HP").." ] , [ "..eq.say_link("Symbol").." ] , [ "..eq.say_link("PR").."] , [ "..eq.say_link("DR").."] ?");
        elseif(e.message:findi("HP")) then
            local player = eq.get_entity_list():GetMob(charID);
            if level == "20" then
    		    player:SpellFinished(89, player); --Daring
            elseif level == "30" then
    		    player:SpellFinished(244, player); --Bravery
            elseif level == "35" then
    		    player:SpellFinished(312, player); --Valor
            elseif level == "40" then
    		    player:SpellFinished(312, player); --Valor
            end
        elseif(e.message:findi("sow")) then
            local player = eq.get_entity_list():GetMob(charID);
            player:SpellFinished(278, player);
        elseif(e.message:findi("Symbol")) then
            local player = eq.get_entity_list():GetMob(charID);
            if level == "20" then
    		    player:SpellFinished(485, player); --Symbol of Transal
            elseif level == "30" then
    		    player:SpellFinished(486, player); --Symbol of Ryltan
            elseif level == "35" then
    		    player:SpellFinished(487, player); --Symbol of Pinzarn
            elseif level == "40" then
    		    player:SpellFinished(487, player); --Symbol of Pinzarn
            end
		elseif(e.message:findi("PR")) then
            local player = eq.get_entity_list():GetMob(charID);
            if level == "20" then
    		    player:SpellFinished(227, player); --Endure Poison
            elseif level == "30" then
    		    player:SpellFinished(227, player); --Endure Poison
            elseif level == "35" then
    		    player:SpellFinished(62, player); --Resist Poison
            elseif level == "40" then
    		    player:SpellFinished(62, player); --Resist Poison
            end
		elseif(e.message:findi("DR")) then
            local player = eq.get_entity_list():GetMob(charID);
            if level == "20" then
    		    player:SpellFinished(226, player); --Endure Disease
            elseif level == "30" then
    		    player:SpellFinished(226, player); --Endure Disease
            elseif level == "35" then
    		    player:SpellFinished(63, player); --Resist Disease
            elseif level == "40" then
    		    player:SpellFinished(63, player); --Resist Disease
            end
		end
	end
end


function reset_guard_hostile(e)
	local cityRepop = "southkaranaRepop";
	local cityRepopSecond = "southkarana2Repop";
    local cityStatus = "southkaranaReset"
    local cityCurrentStatus = eq.get_data(cityStatus)

    -- Check if the collection timer exists
    if cityCurrentStatus ~= "" then
        -- Adjust the pattern to match the format: "Tue Mar  4 22:24:40 2025"
		local pattern = "(%a+)%s+(%a+)%s+(%d+)%s+(%d+):(%d+):(%d+)%s+(%d+)"
		local _, month, day, hour, min, sec, year = cityCurrentStatus:match(pattern)
        
        -- Debugging: Print the matched values
        print("Parsed values: ", month, day, hour, min, sec, year)

        -- Ensure that all required values are valid
        if not month or not day or not hour or not min or not sec or not year then
            print("Error: Malformed city Timer data")
            -- Handle the error: set a default date (for example, the current date)
            month, day, hour, min, sec, year = "Jan", "01", "00", "00", "00", os.date("%Y")
        end
        
        -- Convert month name to number
        local months = {
            Jan = 1, Feb = 2, Mar = 3, Apr = 4, May = 5, Jun = 6,
            Jul = 7, Aug = 8, Sep = 9, Oct = 10, Nov = 11, Dec = 12
        }

        -- Build the timeTable
        local timeTable = {
            year = tonumber(year),
            month = months[month],
            day = tonumber(day),
            hour = tonumber(hour),
            min = tonumber(min),
            sec = tonumber(sec)
        }

        -- Debugging: Print the timeTable
        print("Time Table: ", timeTable.year, timeTable.month, timeTable.day, timeTable.hour, timeTable.min, timeTable.sec)

        -- Get the Unix timestamp from the timeTable
        local unixTimestamp = os.time(timeTable)

        -- Get the current Unix timestamp
        local now = os.time()

        -- Calculate the difference in seconds between now and the stored time
        local difference = now - unixTimestamp

        -- Calculate the number of days passed
        local hoursPassed = difference / 3600  -- Convert seconds to hours
        if hoursPassed >= 1 then
            eq.set_data(cityStatus, os.date("%c"));
			local cityFactionStatus = "southkaranaFaction";
			if eq.get_data(cityFactionStatus) ~= "" then
				eq.set_data(cityFactionStatus, "hostile");
				local guardsBucketKey = "southkaranaGuards";
				local southkaranaGuards = eq.get_data(guardsBucketKey);
				if southkaranaGuards ~= "" then
					eq.set_data(guardsBucketKey, "0"); --reset guard count to 0
					if eq.get_data(cityRepop) == "no" then
						eq.set_data(cityRepop, "yes"); --Set databucket to repop
					end
					if eq.get_data(cityRepopSecond) == "no" then
						eq.set_data(cityRepopSecond, "yes")
					end
					e.self:Say("Right away sir! Sending word sir!");
				end
			end
		else
			e.self:Say("I'm sorry sir, the guard is not currently available!");
		end
	else
		local pattern = "(%a+)%s+(%a+)%s+(%d+)%s+(%d+):(%d+):(%d+)%s+(%d+)"
		local _, month, day, hour, min, sec, year = cityCurrentStatus:match(pattern)
        
        -- Debugging: Print the matched values
        print("Parsed values: ", month, day, hour, min, sec, year)

        -- Ensure that all required values are valid
        if not month or not day or not hour or not min or not sec or not year then
            print("Error: Malformed cityCurrentStatus data")
            -- Handle the error: set a default date (for example, the current date)
            month, day, hour, min, sec, year = "Jan", "01", "00", "00", "00", os.date("%Y")
        end
        
        -- Convert month name to number
        local months = {
            Jan = 1, Feb = 2, Mar = 3, Apr = 4, May = 5, Jun = 6,
            Jul = 7, Aug = 8, Sep = 9, Oct = 10, Nov = 11, Dec = 12
        }

        -- Build the timeTable
        local timeTable = {
            year = tonumber(year),
            month = months[month],
            day = tonumber(day),
            hour = tonumber(hour),
            min = tonumber(min),
            sec = tonumber(sec)
        }

        -- Debugging: Print the timeTable
        print("Time Table: ", timeTable.year, timeTable.month, timeTable.day, timeTable.hour, timeTable.min, timeTable.sec)

        -- Get the Unix timestamp from the timeTable
        local unixTimestamp = os.time(timeTable)

        -- Get the current Unix timestamp
        local now = os.time()
		eq.set_data(cityStatus, os.date("%c")); --Initialize time if nothing exists
    end
end

function reset_guard_peaceful(e)
	local cityRepop = "southkaranaRepop";
	local cityRepopSecond = "southkarana2Repop";
    local cityStatus = "southkaranaReset"
    local cityCurrentStatus = eq.get_data(cityStatus)

    -- Check if the collection timer exists
    if cityCurrentStatus ~= "" then
        -- Adjust the pattern to match the format: "Tue Mar  4 22:24:40 2025"
		local pattern = "(%a+)%s+(%a+)%s+(%d+)%s+(%d+):(%d+):(%d+)%s+(%d+)"
		local _, month, day, hour, min, sec, year = cityCurrentStatus:match(pattern)
        
        -- Debugging: Print the matched values
        print("Parsed values: ", month, day, hour, min, sec, year)

        -- Ensure that all required values are valid
        if not month or not day or not hour or not min or not sec or not year then
            print("Error: Malformed cityCurrentStatus data")
            -- Handle the error: set a default date (for example, the current date)
            month, day, hour, min, sec, year = "Jan", "01", "00", "00", "00", os.date("%Y")
        end
        
        -- Convert month name to number
        local months = {
            Jan = 1, Feb = 2, Mar = 3, Apr = 4, May = 5, Jun = 6,
            Jul = 7, Aug = 8, Sep = 9, Oct = 10, Nov = 11, Dec = 12
        }

        -- Build the timeTable
        local timeTable = {
            year = tonumber(year),
            month = months[month],
            day = tonumber(day),
            hour = tonumber(hour),
            min = tonumber(min),
            sec = tonumber(sec)
        }

        -- Debugging: Print the timeTable
        print("Time Table: ", timeTable.year, timeTable.month, timeTable.day, timeTable.hour, timeTable.min, timeTable.sec)

        -- Get the Unix timestamp from the timeTable
        local unixTimestamp = os.time(timeTable)

        -- Get the current Unix timestamp
        local now = os.time()

        -- Calculate the difference in seconds between now and the stored time
        local difference = now - unixTimestamp

        -- Calculate the number of days passed
        local hoursPassed = difference / 3600  -- Convert seconds to hours
        if hoursPassed >= 1 then
            eq.set_data(cityStatus, os.date("%c"));
			local cityFactionStatus = "southkaranaFaction";
			if eq.get_data(cityFactionStatus) ~= "" then
				eq.set_data(cityFactionStatus, "peaceful");
				local guardsBucketKey = "southkaranaGuards";
				local southkaranaGuards = eq.get_data(guardsBucketKey);
				if southkaranaGuards ~= "" then
					eq.set_data(guardsBucketKey, "0"); --reset guard count to 0
					if eq.get_data(cityRepop) == "no" then
						eq.set_data(cityRepop, "yes"); --Set databucket to repop
					end
					if eq.get_data(cityRepopSecond) == "no" then
						eq.set_data(cityRepopSecond, "yes")
					end
					e.self:Say("Right away sir! Sending word sir!");
				end
			end
        else
			e.self:Say("I'm sorry sir, the guard is not currently available!");
		end
	else
		local pattern = "(%a+)%s+(%a+)%s+(%d+)%s+(%d+):(%d+):(%d+)%s+(%d+)"
		local _, month, day, hour, min, sec, year = cityCurrentStatus:match(pattern)
        
        -- Debugging: Print the matched values
        print("Parsed values: ", month, day, hour, min, sec, year)

        -- Ensure that all required values are valid
        if not month or not day or not hour or not min or not sec or not year then
            print("Error: Malformed cityCurrentStatus data")
            -- Handle the error: set a default date (for example, the current date)
            month, day, hour, min, sec, year = "Jan", "01", "00", "00", "00", os.date("%Y")
        end
        
        -- Convert month name to number
        local months = {
            Jan = 1, Feb = 2, Mar = 3, Apr = 4, May = 5, Jun = 6,
            Jul = 7, Aug = 8, Sep = 9, Oct = 10, Nov = 11, Dec = 12
        }

        -- Build the timeTable
        local timeTable = {
            year = tonumber(year),
            month = months[month],
            day = tonumber(day),
            hour = tonumber(hour),
            min = tonumber(min),
            sec = tonumber(sec)
        }

        -- Debugging: Print the timeTable
        print("Time Table: ", timeTable.year, timeTable.month, timeTable.day, timeTable.hour, timeTable.min, timeTable.sec)

        -- Get the Unix timestamp from the timeTable
        local unixTimestamp = os.time(timeTable)

        -- Get the current Unix timestamp
        local now = os.time()
		eq.set_data(cityStatus, os.date("%c")); --Initialize time if nothing exists
	end
end

function set_base_stats(e)

	local zone = eq.get_zone_long_name();
	local level = eq.get_rule("Character:MaxLevel") --Guards scale with character max level
	local levelAdjustment = tonumber(level) + 2;
	local npcClass = e.self:GetClass();
	
	e.self:SetLevel(levelAdjustment); --Add +2 to max level		

	if (level == "20") then
		local hp = "650";
		local ac = "40";
		local str = "99";
		local sta = "99";
		local min_hit = "10"; 
		local max_hit = "36";
		local hp_regen = "3";
		local attack_delay = "15";
		local accuracy = "250";	
		e.self:ModifyNPCStat("aggro", "100");
		e.self:ModifyNPCStat("assist", "50");	
		e.self:ModifyNPCStat("max_hp", hp);
		e.self:SetHP(tonumber(hp));
		e.self:ModifyNPCStat("ac", ac);
		e.self:ModifyNPCStat("str", str);
		e.self:ModifyNPCStat("sta", sta);
		e.self:ModifyNPCStat("min_hit", min_hit);
		e.self:ModifyNPCStat("max_hit", max_hit);
		e.self:ModifyNPCStat("hp_regen", hp_regen);
		e.self:ModifyNPCStat("attack_delay", attack_delay);
		e.self:ModifyNPCStat("accuracy", accuracy);
	elseif (level == "30") then
		local hp = "1500";
		local ac = "70";
		local str = "99";
		local sta = "99";
		local min_hit = "20"; 
		local max_hit = "56";
		local hp_regen = "3";
		local attack_delay = "15";
		local accuracy = "250";	
		e.self:ModifyNPCStat("aggro", "100");
		e.self:ModifyNPCStat("assist", "50");	
		e.self:ModifyNPCStat("max_hp", hp);
		e.self:SetHP(tonumber(hp));
		e.self:ModifyNPCStat("ac", ac);
		e.self:ModifyNPCStat("str", str);
		e.self:ModifyNPCStat("sta", sta);
		e.self:ModifyNPCStat("min_hit", min_hit);
		e.self:ModifyNPCStat("max_hit", max_hit);
		e.self:ModifyNPCStat("hp_regen", hp_regen);
		e.self:ModifyNPCStat("attack_delay", attack_delay);
		e.self:ModifyNPCStat("accuracy", accuracy);
	elseif (level == "35") then
		local hp = "2000"
		local ac = "100"
		local str = "99"
		local sta = "99"
		local min_hit = "25"
		local max_hit = "70"
		local hp_regen = "5"
		local attack_delay = "15";
		local accuracy = "250";	
		e.self:ModifyNPCStat("aggro", "100");
		e.self:ModifyNPCStat("assist", "50");	
		e.self:ModifyNPCStat("max_hp", hp);
		e.self:SetHP(tonumber(hp));
		e.self:Shout("hp "..hp);
		e.self:ModifyNPCStat("ac", ac);
		e.self:ModifyNPCStat("str", str);
		e.self:ModifyNPCStat("sta", sta);
		e.self:ModifyNPCStat("min_hit", min_hit);
		e.self:Shout("min hit "..min_hit);
		e.self:Shout("max hit "..max_hit);
		e.self:ModifyNPCStat("max_hit", max_hit);
		e.self:ModifyNPCStat("hp_regen", hp_regen);
		e.self:ModifyNPCStat("attack_delay", attack_delay);
		e.self:ModifyNPCStat("accuracy", accuracy);
	elseif (level == "40") then
		local hp = "3500"
		local ac = "100"
		local str = "99"
		local sta = "99"
		local min_hit = "30"
		local max_hit = "80"
		local hp_regen = "5"
		local attack_delay = "15";
		local accuracy = "250";	
		e.self:ModifyNPCStat("aggro", "100");
		e.self:ModifyNPCStat("assist", "50");	
		e.self:ModifyNPCStat("max_hp", hp);
		e.self:SetHP(tonumber(hp));
		e.self:Shout("hp "..hp);
		e.self:ModifyNPCStat("ac", ac);
		e.self:ModifyNPCStat("str", str);
		e.self:ModifyNPCStat("sta", sta);
		e.self:ModifyNPCStat("min_hit", min_hit);
		e.self:Shout("min hit "..min_hit);
		e.self:Shout("max hit "..max_hit);
		e.self:ModifyNPCStat("max_hit", max_hit);
		e.self:ModifyNPCStat("hp_regen", hp_regen);
		e.self:ModifyNPCStat("attack_delay", attack_delay);
		e.self:ModifyNPCStat("accuracy", accuracy);
	end
end
