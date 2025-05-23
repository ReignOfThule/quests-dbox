local saved_char_id = 0;
local saved_group_id = 0;
local porting = false;

local Event = "Nothing";
local KotH = 0;

local xloc = 0;
local yloc = 0;
local zloc = 0;

function event_spawn(e)
	xloc = e.self:GetX();
	yloc = e.self:GetY();
	zloc = e.self:GetZ();
	eq.set_proximity(xloc - 65, xloc + 65, yloc - 65, yloc + 65, zloc - 65, zloc + 65);
	eq.set_timer("Event",5000);
	eq.set_timer("Point Trigger", 60000);
end

function event_enter(e)
	if ( e.other:GetGM() ) then
		return
	elseif (Event == "KingOfTheHill") then
		if (KotH == 0) then
			KotH = e.other:CastToClient():GetID();
			e.other:CastToClient():Message(13, "You are the new King of the Hill, remain in this area to gain 5 PvP points a minute.")
			e.self:Shout("[PvP Event] " ..e.other:GetCleanName().. " is the new King of the Hill! Slay them to stop them from gaining more PvP points!");
		end
	end
end

function event_exit(e)
	if (Event == "KingOfTheHill" and e.other:CastToClient():GetID() == KotH) then
		KotH = 0;
		e.other:CastToClient():Message(13, "You have left the hill and are no longer the King of the Hill.")
		eq.set_timer("GetNearbyKing", 1000);
	end
end

function event_timer(e)
	local time = GetCurrentTime();
	local day = os.date("%A");
	if(e.timer == "Event") then
		if ((time == 20 or time == 21) and day == "Thursday" and Event == "Nothing") then
			eq.world_emote(13, "[PvP Event] King of the Hill Event has been activated in the Arena!");
			Event = "KingOfTheHill";
			KotH = 0;
		elseif(time == 22 and Event ~= "Nothing") then
			eq.world_emote(13, "[PvP Event] The event has concluded. ");
			Event = "Nothing";
			KotH = 0;
		end
	elseif (e.timer == "Point Trigger" and Event == "KingOfTheHill") then
		local player = eq.get_entity_list():GetMob(KotH)

		if (player) then
			--eq.world_emote(13, "[PvP Event] " ..player:CastToClient():GetCleanName() .. " is the King of the Hill! Slay them to stop them from gaining more PvP points! ");
			player:CastToClient():AddPVPPoints(5);
			player:CastToClient():Message(13, "You are the King of the hill, heres 5 points")
			e.self:Shout("[PvP Event] " ..player:GetCleanName().. " is the current King of the Hill! Head to the Arena and slay him!");
		else
			eq.set_timer("GetNearbyKing", 1000);
		end
	elseif (e.timer == "GetNearbyKing") then
		if (KotH == 0) then
			FindNewKing()
		end
		eq.stop_timer("GetNearbyKing")
	end
end

function FindNewKing()
	local clientList = eq.get_entity_list():GetClientList();
	local clients;
	local closestclient = 0;
	local distance = 500;
	KotH = 0

	if ( clientList ) then
		for client in clientList.entries do
			local dist = client:CalculateDistance(xloc, yloc, zloc);
			if ( dist < 50 and dist < distance) then
				closestclient = client:GetID();
				distance = dist;
			end
		end
		KotH = closestclient;
		local player = eq.get_entity_list():GetMob(KotH);
		if player then
			player:CastToClient():Message(13, "You are the new King of the Hill, remain in this area to gain 5 PvP points a minute.")
		end
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
		return timeTable.hour;
end
