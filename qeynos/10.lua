local bank = "qeynosBank"
local bankIncome = "qeynosBankIncomeTime"

function event_spawn(e)
    calculate_vault(e); --calculate income earned from last time period
    eq.set_timer("IncomeTimer", 60000); --Every 60 seconds, check the time difference and add 1 plat per minute to the guild bank
end

function event_signal(e)
    local qeynosGuild = "qeynosGuild";
	local qeynosGuildName = "qeynosGuildName";
	local qeynosGuards = "qeynosGuards";
	local qeynosGuardsQuantity = tonumber(eq.get_data(qeynosGuards));
    local client = eq.get_entity_list():GetClientByID(e.signal);
	local maxGuards = 29;
    local cityRepop = "qeynosRepop";
    local cityRepopSecond = "qeynos2Repop";

    if ( client.valid ) then
        local clientName = client:GetCleanName()
        local clientGuildName = client:GetGuildName()
        local clientGuildID = client:GuildID()

        if (clientGuildName ~= "") then --can't participate in city take overs if guildless
            if (qeynosGuards ~= "") then
                eq.set_data(qeynosGuards, tostring(qeynosGuardsQuantity - 1));
                local qeynosGuardsFinalQuantity = tonumber(eq.get_data(qeynosGuards));
                if (qeynosGuardsFinalQuantity > 0) then
                    eq.world_emote(13, "[PvP News] The city of Qeynos is under attack!");
                    eq.zone_emote(5, "There are "..qeynosGuardsFinalQuantity.. " remaining guards in the city!");
                elseif (qeynosGuardsFinalQuantity == 0) then

                    local guardsBucketKey = "qeynosGuards";
                    local qeynosGuards = eq.get_data(guardsBucketKey);
                    eq.set_data(qeynosGuildName, tostring(clientGuildName)); --set guild name
                    eq.set_data(qeynosGuild, tostring(clientGuildID)); --set guild ID
                    eq.set_data(guardsBucketKey, tostring(maxGuards)); --reset guard count to max
                    if eq.get_data(cityRepop) == "no" then
                        eq.set_data(cityRepop, "yes"); --Set databucket to repop
                    end
                    if eq.get_data(cityRepopSecond) == "no" then
                        eq.set_data(cityRepopSecond, "yes")
                    end
                    eq.world_emote(13, "[PvP News] The city of Qeynos has been taken over by the nobles of <"..clientGuildName..">!");
                end
            end
        end
    end
end

function event_timer(e)
	if (e.timer == "IncomeTimer") then
        calculate_vault(e)
    end
end

function calculate_vault(e)
    eq.set_timer("IncomeTimer", 60000); --Every 60 seconds, check the time difference and add 1 plat per minute to the guild bank
    local bankIncome = "qeynosBankIncome"
    local bank = "qeynosBank" 
    
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
