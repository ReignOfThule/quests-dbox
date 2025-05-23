local saved_char_id = 0;
local saved_group_id = 0;
local porting = false;

local Event = "Nothing";

function event_spawn(e)
	eq.set_timer("Event",5000);
end

function event_timer(e)
	local time = GetCurrentTime();
	local day = os.date("%A");
	--e.self:Say("The day is " ..os.date("%A").. "hour is: " ..time.hour)
	if(e.timer == "Event") then
		if (day == "Thursday" and time.hour == 20 and Event == "Nothing") then
			eq.world_emote(13, "[PvP Event] Lets get ready to rumble!");
			Event = "KingOfTheHill";
		elseif(time.hour == 22 and Event ~= "Nothing") then
			eq.world_emote(13, "[PvP Event] The event has concluded.");
			Event = "Nothing";
		end
	end
end

function event_say(e)

	if (Event == "Nothing" and not e.other:CastToClient():GetGM()) then
		e.self:Say("Sorry " ..e.other:GetCleanName() .. " it is not time for the event. I will announce when the event is ongoing. Time is: " ..GetCurrentTime());
		return;
	end
    --Char and Guild Info
    local char_id = e.other:GetID();
    local charID = e.other:CharacterID();
	local char_name = eq.get_char_name_by_id(charID);
    
    --Ports
    local ports = {"Arena"}; --Antonica

	if(e.message:findi("hail")) then


		local portLinks = {};

				
		for _, port in ipairs(ports) do
			table.insert(portLinks, eq.say_link(port, true, port))
		end

		local portString = table.concat(portLinks, ", ");

		e.self:Say("Hail "..char_name.."! I can provide travel to the following: " .. portString .. "."); --Split in two due to char limits on say

	--Port Locations
	elseif(e.message:findi("Arena")) then
		saved_char_id = char_id; --Saving char id for port timer
		local saved_group = e.other:GetGroup(); --Saving group id for port
		saved_group_id = saved_group:GetID();
		e.self:Say("Arena coming up!");
		local player = eq.get_entity_list():GetMob(saved_char_id);
		local roll = math.random(4);
        if (roll == 1) then
			MoveGroup(saved_group, player, player:GetX(),player:GetY(),player:GetZ(), 35, 0, -673, 3, 68, 77);
        elseif (roll == 2) then
            MoveGroup(saved_group, player, player:GetX(),player:GetY(),player:GetZ(), 35, 1105, -463, 3, 450, 77);
        elseif (roll == 3) then
            MoveGroup(saved_group, player, player:GetX(),player:GetY(),player:GetZ(), 35, 970, 571,  3, 322, 77);
		elseif (roll == 4) then
            MoveGroup(saved_group, player, player:GetX(),player:GetY(),player:GetZ(), 35, -77, 556, 3, 208, 77);
        end
	end
end

function MoveGroup(frozen_group, player, src_x, src_y, src_z, distance, tgt_x, tgt_y, tgt_z, tgt_h, zoneid)
	if ( frozen_group.valid ) then
		local frozen_count = frozen_group:GroupCount();

		for i = 0, frozen_count - 1, 1 do
			local client_v = frozen_group:GetMember(i);

			local player = eq.get_entity_list():GetMob(client_v:CastToClient():CharacterID());
			
			if (player) then
				if (client_v:CastToClient().valid) then
					-- check the distance and port them up if close enough
					if (client_v:CastToClient():CalculateDistance(src_x, src_y, src_z) <= distance) then
						--local groupmate = eq.get_entity_list():GetMob(client_v:CharacterID());
						-- port the player up
						client_v:CastToClient():MovePC(zoneid, tgt_x, tgt_y, tgt_z, tgt_h);
					end
				end
			end

		end
	else
		player:CastToClient():MovePC(zoneid, tgt_x, tgt_y, tgt_z, tgt_h);
	end
end

function GetCurrentTime()
		-- Get the current Unix timestamp
		local now = os.date("%c")

		-- Adjust the pattern to match the format: "Tue Mar  4 22:24:40 2025"
		local pattern = "(%a+)%s+(%a+)%s+(%d+)%s+(%d+):(%d+):(%d+)%s+(%d+)"
		local _, month, day, hour, min, sec, year = now:match(pattern)

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
		--print("Time Table: ", timeTable.year, timeTable.month, timeTable.day, timeTable.hour, timeTable.min, timeTable.sec)



		--e.self:Say("The hour is:" ..timeTable.hour);
		return timeTable;
end
