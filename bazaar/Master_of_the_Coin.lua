local common = {
    19993, -- Pixie Powder Cinnesticks
    19995, --Dragon Steak
    19996, -- Sea Dragon Steak
    19997 -- Water Dragon Steak
}

local uncommon = {
    11703, -- Box of Abu Kar
    17404, --Large Soiled Bag
    16868, --Spyglass
    1841 --Sporali Gloves
}

local rare = {
    1138, --White Resistance Stone
    1139, --Blue Resistance Stone
    1141, --Red Resistance Stone
    1152, --Green Resistance Stone
    1135, --Mask of Tinkering
    44518, --Ancient Cobalt Bracer (all shrink)
    14727 --Locket of Escape
}

local ultrarare = {
    6639, --Tranquil Staff
    11696 --Windstriker
}

function event_say(e)
    if e.message:findi("hail") then
        e.self:Say("Step on up and test your luck! "..eq.say_link("Five hundred platinum").." is just one chuck! The dice will roar, the dice will sing! For my fortune favors everything!");
    elseif e.message:findi("Five hundred platinum") then
        e.self:Say("Yes, yes! Quite the deal I say!");
    end
end

function event_trade(e)
    local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {platinum = 500}, 0)) then
        local roll = math.random(1,100)
        if roll > 96 then --97-100
            e.self:Say("ULTRA RARE REWARD!!! I'm going to be ruined...");
            local item = ultrarare[math.random(1, #ultrarare)]
            e.other:SummonCursorItem(item);
        elseif roll > 84 then --85-96
            if roll < 97 then
                e.self:Say("A rare reward!!! Oh my bank...");
                local item = rare[math.random(1, #rare)]
                e.other:SummonCursorItem(item);
            end
        elseif roll > 49 then --50-84
            if roll < 85 then
                e.self:Say("An uncommon reward! It will hurt, but I can part with it!");
                local item = uncommon[math.random(1, #uncommon)]
        		e.other:SummonCursorItem(item);
            end
        elseif roll < 50 then --0-49
            e.self:Say("A common reward is the best kind of reward! I will gladly give this to you!");
            local item = common[math.random(1, #common)]
            e.other:SummonCursorItem(item);
        end
    end
end
