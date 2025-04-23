

function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 15, e.self:GetX() + 15, e.self:GetY() - 15, e.self:GetY() + 15, e.self:GetZ() -5, e.self:GetZ() +5);

	local npcName = e.self:GetCleanName()
	local cityOwnership = "oggokGuild";
	local cityOwnershipName = "oggokGuildName";
	local cityFactionStatus = "oggokFaction";
	local cityGuild = eq.get_data(cityOwnership);
	local cityGuildName = eq.get_data(cityOwnershipName);
	local cityFaction = eq.get_data(cityFactionStatus);
	local maxGuards = 17;

	if e.self:GetRace() ~= 93 then
		e.self:SetNPCFactionID(0); --peaceful
		if (cityGuild ~= "") then
			e.self:SetGuild(tonumber(cityGuild)); --set guild to player
		end

	elseif e.self:GetRace() == 93 then
		if (cityGuild == "") then
			e.self:SetNPCFactionID(0); --peaceful if no guild owns
			set_base_stats(e);
			local oggokGuards = "oggokGuards";
			local oggokGuardsQuantity = tonumber(eq.get_data(oggokGuards));
			if eq.get_data(oggokGuards) ~= "" then
				if oggokGuardsQuantity < maxGuards then
					eq.set_data(oggokGuards, tostring(oggokGuardsQuantity + 1));
				end
			end
		else
			e.self:SetGuild(tonumber(cityGuild)); --set guild to player
			if (eq.get_data(cityFactionStatus) == "hostile") then
				e.self:SetNPCFactionID(68); --hostile
				local myFactionID = e.self:GetNPCFactionID();
				set_base_stats(e);
				e.self:TempName(npcName.."_<"..cityGuildName..">"); --add guild name to npc name
				local oggokGuards = "oggokGuards";
				local oggokGuardsQuantity = tonumber(eq.get_data(oggokGuards));
				if eq.get_data(oggokGuards) ~= "" then
					if oggokGuardsQuantity < maxGuards then
						eq.set_data(oggokGuards, tostring(oggokGuardsQuantity + 1));
					end
				end
			else
				e.self:SetNPCFactionID(0); --peaceful
				local myFactionID = e.self:GetNPCFactionID();
				set_base_stats(e);
				e.self:TempName(npcName.."_<"..cityGuildName..">"); --add guild name to npc name
				local oggokGuards = "oggokGuards";
				local oggokGuardsQuantity = tonumber(eq.get_data(oggokGuards));
				if eq.get_data(oggokGuards) ~= "" then
					if oggokGuardsQuantity < maxGuards then
						eq.set_data(oggokGuards, tostring(oggokGuardsQuantity + 1));
					end
				end
			end
		end
	end
end

function event_death_complete(e)
    if e.self:GetRace() == 93 then
		eq.signal(22, e.killer:GetID());
    end
end


function event_enter(e)
	local char_id = e.other:CharacterID();
	local guild_id = e.other:GuildID();
	local char_guild_rank = e.other:GuildRank();
	local char_name = eq.get_char_name_by_id(char_id);
	local random_animation = math.random(1,2);
	local cityOwnership = "oggokGuild";
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
	if e.self:GetRace() == 93 then
		local char_id = e.other:CharacterID();
		local guild_id = e.other:GuildID();
		local char_guild_rank = e.other:GuildRank();
		local char_name = eq.get_char_name_by_id(char_id);
		local cityOwnership = "oggokGuild";
		local cityGuild = eq.get_data(cityOwnership);
		local cityFactionStatus = "oggokFaction";
		local cityFaction = eq.get_data(cityFactionStatus);
		local cityReset = "oggokReset";
		local cityResetTimer = eq.get_data(cityReset)
		local cityBank = "oggokBank";
		local cityBankAmount = eq.get_data(cityBank);
		local cityBankCollect = "oggokBankCollectTimer";
		local cityBankCollectTimer = eq.get_data(cityBankCollect);
		local cityRepop = "oggokRepop";

		if (cityGuild == tostring(guild_id)) then --if databucket matches guild id
			if char_guild_rank == 2 then --if leader of guild
				if(e.message:findi("hail")) then
					calculate_vault(e); --calculate vault on guild leader hail and also when guards are killed
					e.self:Say("Hail Master "..char_name.."! Would you like me to ["..eq.say_link("alert").."] the guards sir? Or, if it pleases, I could fetch the master of coin? ["..eq.say_link("check vault").."] or ["..eq.say_link("collect from vault").."]");
				elseif(e.message:findi("check vault")) then
					if eq.get_data(cityBank) ~= "" then
						e.self:Say("Sir, the bank currently has: " ..eq.get_data(cityBank) .." platinum.");
					end
				elseif(e.message:findi("collect from vault")) then
					try_collect_from_vault(e)
				elseif(e.message:findi("alert")) then
					e.self:Say("On your orders we can be ["..eq.say_link("hostile").. "] or ["..eq.say_link("peaceful").. "] to all whom enter oggok");
				elseif(e.message:findi("hostile")) then
					reset_guard_hostile(e)			
				elseif(e.message:findi("peaceful")) then
					reset_guard_peaceful(e)
				end
			end
		end
	end
end


function try_collect_from_vault(e)
    local cityBank = "oggokBank"
    local cityBankAmount = eq.get_data(cityBank)
    local cityBankCollect = "oggokBankCollectTimer"
    local cityBankCollectTimer = eq.get_data(cityBankCollect)

    -- Check if the collection timer exists
    if cityBankCollectTimer ~= "" then
        -- Adjust the pattern to match the format: "Tue Mar  4 22:24:40 2025"
		local pattern = "(%a+)%s+(%a+)%s+(%d+)%s+(%d+):(%d+):(%d+)%s+(%d+)"
		local _, month, day, hour, min, sec, year = cityBankCollectTimer:match(pattern)
        
        -- Debugging: Print the matched values
        print("Parsed values: ", month, day, hour, min, sec, year)

        -- Ensure that all required values are valid
        if not month or not day or not hour or not min or not sec or not year then
            print("Error: Malformed cityBankCollectTimer data")
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
        local daysPassed = difference / 86400  -- Convert seconds to days

        -- Debugging: Print the number of days passed
        print("Days passed: ", daysPassed)

        -- Check if 3 or more days have passed
        if daysPassed >= 3 then
            -- If there's money in the city bank, give it to the player
            if cityBankAmount ~= "" then
                e.self:Say("Sir, the bank currently has: " .. cityBankAmount .. " platinum. Here you are!")
                e.other:QuestReward(e.self, 0, 0, 0, tonumber(cityBankAmount))
                eq.set_data(cityBank, tostring(0))
                eq.set_data(cityBankCollect, os.date("%c"))
            end
        else
            -- If less than 3 days have passed, tell the player when the vault can be collected from again
            e.self:Say("Apologies sir, the master of coin is out... The next time the vault can be collected from is in: " .. tostring(math.floor(3 - daysPassed)) .. " days.")
        end
    else
        -- If the collection timer doesn't exist, process the bank amount
        if cityBankAmount ~= "" then
            e.self:Say("Sir, the bank currently has: " .. cityBankAmount .. " platinum. Here you are!")
            e.other:QuestReward(e.self, 0, 0, 0, tonumber(cityBankAmount))
            eq.set_data(cityBank, tostring(0))
            eq.set_data(cityBankCollect, os.date("%c"))
        end
    end
end

function calculate_vault(e)
	local bank = "oggokBank"
	local bankIncome = "oggokBankIncomeTime"
    
    -- Retrieve the last income time
    local timefrom = eq.get_data(bankIncome)
    
    -- If there's a stored time, process it
    if timefrom ~= "" then
        -- Adjust the pattern to match the format "Tue Mar  4 22:24:40 2025"
        local pattern = "(%a+)%s+(%a+)%s+(%d+)%s+(%d+):(%d+):(%d+)%s+(%d+)"
        local _, month, day, hour, min, sec, year = timefrom:match(pattern)
        
        -- Debugging: Print the parsed values
        print("Parsed values: ", month, day, hour, min, sec, year)

        -- Ensure that all required values are valid
        if not month or not day or not hour or not min or not sec or not year then
            -- Handle error by setting a default date (e.g., current date and time)
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

        local unixTimestamp = os.time(timeTable)

        local now = os.time()

        local difference = now - unixTimestamp

        local minspassed = difference / 60  -- Convert seconds to minutes

        local incomeaccrued = math.floor(minspassed)
        local bankamount = eq.get_data(bank)

        -- If there's already an amount in the bank, calculate new amount
        if bankamount ~= "" then
            -- Ensure we don't exceed 20,000 platinum
            if tonumber(bankamount) < 20000 then
                eq.set_data(bank, tostring(tonumber(bankamount) + incomeaccrued))
            end
        else
            -- If no bank amount is set, initialize it with the accrued income
            eq.set_data(bank, tostring(incomeaccrued))
        end

        -- Update the bankIncome with the current timestamp
        eq.set_data(bankIncome, os.date("%c"))
    else
        -- If no stored time, initialize bankIncome and bank values
        eq.set_data(bankIncome, os.date("%c"))
        eq.set_data(bank, tostring(0))
    end
end



function reset_guard_hostile(e)
	local cityRepop = "oggokRepop";
    local cityStatus = "oggokReset"
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
			local cityFactionStatus = "oggokFaction";
			if eq.get_data(cityFactionStatus) ~= "" then
				eq.set_data(cityFactionStatus, "hostile");
				local guardsBucketKey = "oggokGuards";
				local oggokGuards = eq.get_data(guardsBucketKey);
				if oggokGuards ~= "" then
					eq.set_data(guardsBucketKey, "0"); --reset guard count to 0
					if eq.get_data(cityRepop) == "no" then
						eq.set_data(cityRepop, "yes"); --Set databucket to repop
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
	local cityRepop = "oggokRepop";
    local cityStatus = "oggokReset"
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
			local cityFactionStatus = "oggokFaction";
			if eq.get_data(cityFactionStatus) ~= "" then
				eq.set_data(cityFactionStatus, "peaceful");
				local guardsBucketKey = "oggokGuards";
				local oggokGuards = eq.get_data(guardsBucketKey);
				if oggokGuards ~= "" then
					eq.set_data(guardsBucketKey, "0"); --reset guard count to 0
					if eq.get_data(cityRepop) == "no" then
						eq.set_data(cityRepop, "yes"); --Set databucket to repop
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
		local hp = "1150"; --+500 from normal
		local ac = "70";
		local str = "99";
		local sta = "99";
		local min_hit = "20"; --+10 from normal
		local max_hit = "46";
		local hp_regen = "3";
		local attack_delay = "15";
		local accuracy = "500";	
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
		local hp = "5250" --+2000 from normal
		local ac = "150"
		local str = "135"
		local sta = "135"
		local min_hit = "55" --+30 from normal
		local max_hit = "101"
		local hp_regen = "5"
		local attack_delay = "15";
		local accuracy = "500";	
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
	elseif (level == "50") then
		local hp = "20120" --+5000 from normal
		local ac = "190"
		local str = "191"
		local sta = "191"
		local min_hit = "101" --+40 from normal
		local max_hit = "175"
		local hp_regen = "6"
		local attack_delay = "15";
		local accuracy = "500";	
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
	end
end
