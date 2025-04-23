local bank = "erudinBank"
local bankIncome = "erudinBankIncomeTime"

function event_signal(e)
    local erudinGuild = "erudinGuild";
	local erudinGuildName = "erudinGuildName";
	local qeynosGuildName = "qeynosGuildName";
	local felwitheGuildName = "felwitheGuildName";
	local oggokGuildName = "oggokGuildName";

	local erudinGuards = "erudinGuards";
    local erudinBank = "erudinBank";
	local erudinGuardsQuantity = tonumber(eq.get_data(erudinGuards));
    local client = eq.get_entity_list():GetClientByID(e.signal);
	local maxGuards = 39;
    local erudinRepop = "erudinRepop";
    local erudinPalaceRepop = "erudinPalaceRepop";
    local toxRepop = "toxRepop";


    local erudinFaction = "erudinFaction";


    if ( client.valid ) then
        local clientName = client:GetCleanName()
        local clientGuildName = client:GetGuildName()
        local clientGuildID = client:GuildID()

        if (clientGuildName ~= "") then --can't participate in city take overs if guildless
            calculate_vault(e); --calculate vault on every guard kill
            if erudinGuardsQuantity > 0 then
                eq.set_data(erudinGuards, tostring(erudinGuardsQuantity - 1));
                local erudinGuardsFinalQuantity = tonumber(eq.get_data(erudinGuards));
                if (erudinGuardsFinalQuantity > 0) then
                    eq.world_emote(13, "[PvP News] The city of Erudin is under attack!");
                    eq.zone_emote(5, "There are "..erudinGuardsFinalQuantity.. " remaining guards in the city!");
                elseif (erudinGuardsFinalQuantity == 0) then
                    local guardsBucketKey = "erudinGuards";
                    local erudinGuards = eq.get_data(guardsBucketKey);
                    local erudinBankAmount = eq.get_data(erudinBank);
                    if eq.get_data(erudinGuildName) ~= tostring(clientGuildName) then --City take over - cannot take over your own city
                        if eq.get_data(qeynosGuildName) == tostring(clientGuildName) then --if you own a different city, you steal guild bank but don't initiate take over
                            client:AddMoneyToPP(0, 0, 0, tonumber(erudinBankAmount), true); --client who got the killing blow receives entire bank amount
                            eq.world_emote(13, "[PvP News] The city of Erudin has been ransacked by the nobles of <"..clientGuildName..">!");
                            eq.world_emote(13, "[PvP News] "..clientName.. " has stolen the erudin bank!");
                            eq.set_data(erudinGuild, "");
                            eq.set_data(erudinGuildName, "");
                            eq.set_data(erudinFaction, "peaceful");
                            reset_vault_time();
                            if eq.get_data(erudinRepop) == "no" then
                                eq.set_data(erudinRepop, "yes")
                            end
                            if eq.get_data(erudinPalaceRepop) == "no" then
                                eq.set_data(erudinPalaceRepop, "yes")
                            end
                            if eq.get_data(toxRepop) == "no" then
                                eq.set_data(toxRepop, "yes")
                            end
                        end
                        if eq.get_data(felwitheGuildName) == tostring(clientGuildName) then --if you own a different city, you steal guild bank but don't initiate take over
                            client:AddMoneyToPP(0, 0, 0, tonumber(erudinBankAmount), true); --client who got the killing blow receives entire bank amount
                            eq.world_emote(13, "[PvP News] The city of Erudin has been ransacked by the nobles of <"..clientGuildName..">!");
                            eq.world_emote(13, "[PvP News] "..clientName.. " has stolen the erudin bank!");
                            eq.set_data(erudinGuild, "");
                            eq.set_data(erudinGuildName, "");
                            eq.set_data(erudinFaction, "peaceful");
                            reset_vault_time();
                            if eq.get_data(erudinRepop) == "no" then
                                eq.set_data(erudinRepop, "yes")
                            end
                            if eq.get_data(erudinPalaceRepop) == "no" then
                                eq.set_data(erudinPalaceRepop, "yes")
                            end
                            if eq.get_data(toxRepop) == "no" then
                                eq.set_data(toxRepop, "yes")
                            end
                        end
                        if eq.get_data(oggokGuildName) == tostring(clientGuildName) then --if you own a different city, you steal guild bank but don't initiate take over
                            client:AddMoneyToPP(0, 0, 0, tonumber(erudinBankAmount), true); --client who got the killing blow receives entire bank amount
                            eq.world_emote(13, "[PvP News] The city of Erudin has been ransacked by the nobles of <"..clientGuildName..">!");
                            eq.world_emote(13, "[PvP News] "..clientName.. " has stolen the erudin bank!");
                            eq.set_data(erudinGuild, "");
                            eq.set_data(erudinGuildName, "");
                            reset_vault_time();
                            if eq.get_data(erudinRepop) == "no" then
                                eq.set_data(erudinRepop, "yes")
                            end
                            if eq.get_data(erudinPalaceRepop) == "no" then
                                eq.set_data(erudinPalaceRepop, "yes")
                            end
                        end
                        if eq.get_data(toxRepop) == "no" then
                            eq.set_data(toxRepop, "yes")
                        end
                        if eq.get_data(qeynosGuildName) ~= tostring(clientGuildName) then --If guild doesn't own Qeynos
                            if eq.get_data(felwitheGuildName) ~= tostring(clientGuildName) then --If guild doesn't own Felwithe
                                if eq.get_data(oggokGuildName) ~= tostring(clientGuildName) then --If guild doesn't own Oggok
                                    eq.set_data(erudinGuildName, tostring(clientGuildName)); --set guild name
                                    eq.set_data(erudinGuild, tostring(clientGuildID)); --set guild ID
                                    eq.set_data(guardsBucketKey, tostring(maxGuards)); --reset guard count to max
                                    client:AddMoneyToPP(0, 0, 0, tonumber(erudinBankAmount), true); --client who got the killing blow receives entire bank amount
                                    reset_vault_time();
                                    eq.stop_all_timers();
                                    if eq.get_data(erudinRepop) == "no" then
                                        eq.set_data(erudinRepop, "yes")
                                    end
                                    if eq.get_data(erudinPalaceRepop) == "no" then
                                        eq.set_data(erudinPalaceRepop, "yes")
                                    end
                                    if eq.get_data(toxRepop) == "no" then
                                        eq.set_data(toxRepop, "yes")
                                    end
                                    eq.world_emote(13, "[PvP News] The city of Erudin has been taken over by the nobles of <"..clientGuildName..">!");
                                    eq.world_emote(13, "[PvP News] "..clientName.. " has stolen the erudin bank!");
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end


function calculate_vault(e)
    local bank = "erudinBank" 
    
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



function reset_vault_time(e)
    local cityBank = "erudinBank"
    local cityBankAmount = eq.get_data(cityBank)
    local cityBankCollect = "erudinBankCollectTimer"
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
        eq.set_data(cityBank, tostring(0))
        eq.set_data(cityBankCollect, os.date("%c"))
    end
end
