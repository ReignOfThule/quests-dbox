function event_say(e)
    local charName = e.other:GetCleanName();
    local pvpPoints = e.other:GetPVPPoints();
    local charLevel = e.other:GetLevel();
    local thuleCoin = eq.get_data(tostring(charName).."ThuleCoin");

    if e.message:findi("hail") then
        e.other:Message(13, "You currently have "..thuleCoin.. " Thule Coins");
        e.other:Message(2, "Hail "..charName.."! I have the following that I can trade for Thule Coins!");
        e.other:Message(2, eq.say_link("COSMETICS").. " - Illusions");
        e.other:Message(2, eq.say_link("QOL/SERVICES").. " - Bags, Race Changes, XP Potions, and more coming soon");
    elseif e.message:findi("QOL/Services") then
        e.other:Message(2, eq.item_link(32739).. "4 Thule Coin "..eq.say_link("Purchase Race Change: Barbarian"));
        e.other:Message(2, eq.item_link(32738).. "4 Thule Coin "..eq.say_link("Purchase Race Change: Iksar"));
        e.other:Message(2, eq.item_link(32737).. "4 Thule Coin "..eq.say_link("Purchase Race Change: Gnome"));
        e.other:Message(2, eq.item_link(32736).. "4 Thule Coin "..eq.say_link("Purchase Race Change: Halfling"));
        e.other:Message(2, eq.item_link(32735).. "4 Thule Coin "..eq.say_link("Purchase Race Change: Ogre"));
        e.other:Message(2, eq.item_link(32734).. "4 Thule Coin "..eq.say_link("Purchase Race Change: Troll"));
        e.other:Message(2, eq.item_link(32733).. "4 Thule Coin "..eq.say_link("Purchase Race Change: Dwarf"));
        e.other:Message(2, eq.item_link(32732).. "4 Thule Coin "..eq.say_link("Purchase Race Change: Half Elf"));
        e.other:Message(2, eq.item_link(32731).. "4 Thule Coin "..eq.say_link("Purchase Race Change: Dark Elf"));
        e.other:Message(2, eq.item_link(32730).. "4 Thule Coin "..eq.say_link("Purchase Race Change: Iksar"));
        e.other:Message(2, eq.item_link(32729).. "4 Thule Coin "..eq.say_link("Purchase Race Change: Wood Elf"));
        e.other:Message(2, eq.item_link(32728).. "4 Thule Coin "..eq.say_link("Purchase Race Change: Erudite"));
        e.other:Message(2, eq.item_link(32727).. "4 Thule Coin "..eq.say_link("Purchase Race Change: Human"));
        e.other:Message(2, eq.item_link(32700).. "1 Thule Coin "..eq.say_link("Purchase Potion of Experience"));
        e.other:Message(2, eq.item_link(32619).. "2 Thule Coin "..eq.say_link("Purchase Druzzil's Handbag of Holding"));
        e.other:Message(2, eq.item_link(32753).. "4 Thule Coin "..eq.say_link("Purchase Unlock: Beastlord"));
        e.other:Message(2, eq.item_link(32764).. "2 Thule Coin "..eq.say_link("Purchase Level 30 Boost"));
        e.other:Message(13, "PLEASE BE AWARE THAT CHANGING YOUR RACE WILL DISCONNECT YOUR CLIENT. UPON LOADING BACK IN THE CHANGE WILL TAKE EFFECT");


    elseif e.message:findi("COSMETICS") then
        e.other:Message(2, eq.item_link(32718).. "4 Thule Coin "..eq.say_link("Purchase Troll Hide Mask"));
        e.other:Message(2, eq.item_link(32719).. "4 Thule Coin "..eq.say_link("Purchase Mask of the Human"));
        e.other:Message(2, eq.item_link(32720).. "4 Thule Coin "..eq.say_link("Purchase Mask of the Erudite"));
        e.other:Message(2, eq.item_link(32721).. "4 Thule Coin "..eq.say_link("Purchase Faydark Hide Mask"));
        e.other:Message(2, eq.item_link(32722).. "4 Thule Coin "..eq.say_link("Purchase Mask of the High Elf"));
        e.other:Message(2, eq.item_link(32723).. "4 Thule Coin "..eq.say_link("Purchase Iksar Hide Mask"));
        e.other:Message(2, eq.item_link(32724).. "4 Thule Coin "..eq.say_link("Purchase Guise of the Half Elf"));
        e.other:Message(2, eq.item_link(32725).. "4 Thule Coin "..eq.say_link("Purchase Guise of Ogre"));
    
        --Cosmetics
    elseif e.message:findi("Purchase Troll Hide Mask") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Troll Hide Mask"));
    elseif e.message:findi("Confirm Purchase of Troll Hide Mask") then
        itemCost = 4;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32718);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end
    elseif e.message:findi("Purchase Mask of the Human") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Mask of the Human"));
    elseif e.message:findi("Confirm Purchase of Mask of the Human") then
        itemCost = 4;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32719);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end

    elseif e.message:findi("Purchase Mask of the Erudite") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Mask of the Erudite"));
    elseif e.message:findi("Confirm Purchase of Mask of the Erudite") then
        itemCost = 4;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32720);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end

    elseif e.message:findi("Purchase Faydark Hide Mask") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Faydark Hide Mask"));
    elseif e.message:findi("Confirm Purchase of Faydark Hide Mask") then
        itemCost = 4;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32721);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end

    elseif e.message:findi("Purchase Mask of the High Elf") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Mask of the High Elf"));
    elseif e.message:findi("Confirm Purchase of Mask of the High Elf") then
        itemCost = 4;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32722);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end

    elseif e.message:findi("Purchase Iksar Hide Mask") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Iksar Hide Mask"));
    elseif e.message:findi("Confirm Purchase of Iksar Hide Mask") then
        itemCost = 4;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32723);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end
    elseif e.message:findi("Purchase Guise of the Half Elf") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Guise of the Half Elf"));
    elseif e.message:findi("Confirm Purchase of Guise of the Half Elf") then
        itemCost = 4;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32724);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end
    elseif e.message:findi("Purchase Guise of Ogre") then
        e.other:Message(2, eq.say_link("Confirm Purchase Guise of the Ogre"));
    elseif e.message:findi("Confirm Purchase Guise of the Ogre") then
        itemCost = 4;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32725);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end
        
        --QOL/Services

    elseif e.message:findi("Purchase Unlock: Beastlord") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Unlock: Beastlord"));
    elseif e.message:findi("Confirm Purchase of Unlock: Beastlord") then
        itemCost = 4;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back in to me when ready to unlock Beastlord");
            e.other:SummonItem(32753);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end

    elseif e.message:findi("Purchase Level 30 Boost") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Level 30 Boost"));
    elseif e.message:findi("Confirm Purchase of Level 30 Boost") then
        itemCost = 2;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back in to me when ready to unlock Beastlord");
            e.other:SummonItem(32764);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end

    elseif e.message:findi("Purchase Race Change: Barbarian") then
        e.other:Message(2, eq.say_link("Confirm Purchase Barbarian Race Change"));
    elseif e.message:findi("Confirm Purchase Barbarian Race Change") then
        itemCost = 4;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32739);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end

    elseif e.message:findi("Purchase Race Change: Iksar") then
        e.other:Message(2, eq.say_link("Confirm Purchase Iksar Race Change"));
    elseif e.message:findi("Confirm Purchase Iksar Race Change") then
        itemCost = 4;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32738);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end

    elseif e.message:findi("Purchase Race Change: Gnome") then
        e.other:Message(2, eq.say_link("Confirm Purchase Gnome Race Change"));
    elseif e.message:findi("Confirm Purchase Gnome Race Change") then
        itemCost = 4;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32737);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end

    elseif e.message:findi("Purchase Race Change: Halfling") then
        e.other:Message(2, eq.say_link("Confirm Purchase Halfling Race Change"));
    elseif e.message:findi("Confirm Purchase Halfling Race Change") then
        itemCost = 4;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32736);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end

    elseif e.message:findi("Purchase Race Change: Ogre") then
        e.other:Message(2, eq.say_link("Confirm Purchase Ogre Race Change"));
    elseif e.message:findi("Confirm Purchase Ogre Race Change") then
        itemCost = 4;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32735);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end

    elseif e.message:findi("Purchase Race Change: Troll") then
        e.other:Message(2, eq.say_link("Confirm Purchase Troll Race Change"));
    elseif e.message:findi("Confirm Purchase Troll Race Change") then
        itemCost = 4;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32734);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end

    elseif e.message:findi("Purchase Race Change: Dwarf") then
        e.other:Message(2, eq.say_link("Confirm Purchase Dwarf Race Change"));
    elseif e.message:findi("Confirm Purchase Dwarf Race Change") then
        itemCost = 4;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32733);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end

    elseif e.message:findi("Purchase Race Change: Half Elf") then
        e.other:Message(2, eq.say_link("Confirm Purchase Half Elf Race Change"));
    elseif e.message:findi("Confirm Purchase Half Elf Race Change") then
        itemCost = 4;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32732);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end

    elseif e.message:findi("Purchase Race Change: Dark Elf") then
        e.other:Message(2, eq.say_link("Confirm Purchase Dark Elf Race Change"));
    elseif e.message:findi("Confirm Purchase Dark Elf Race Change") then
        itemCost = 4;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32731);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end

    elseif e.message:findi("Purchase Race Change: Wood Elf") then
        e.other:Message(2, eq.say_link("Confirm Purchase Wood Elf Race Change"));
    elseif e.message:findi("Confirm Purchase Wood Elf Race Change") then
        itemCost = 4;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32729);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end

    elseif e.message:findi("Purchase Race Change: Erudite") then
        e.other:Message(2, eq.say_link("Confirm Purchase Erudite Race Change"));
    elseif e.message:findi("Confirm Purchase Erudite Race Change") then
        itemCost = 4;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32728);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end

    elseif e.message:findi("Purchase Race Change: Human") then
        e.other:Message(2, eq.say_link("Confirm Purchase Human Race Change"));
    elseif e.message:findi("Confirm Purchase Human Race Change") then
        itemCost = 4;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32727);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end

    elseif e.message:findi("Purchase Potion of Experience") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Potion of Experience"));
    elseif e.message:findi("Confirm Purchase of Potion of Experience") then
        itemCost = 1;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32700);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end

        
    elseif e.message:findi("Purchase Druzzil's Handbag of Holding") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Druzzil's Handbag of Holding"));
    elseif e.message:findi("Confirm Purchase of Druzzil's Handbag of Holding") then
        itemCost = 2;
        if tonumber(thuleCoin) >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32619);
            eq.set_data(charName.."ThuleCoin", tostring(thuleCoin - itemCost));
        else
            e.other:Message(2, "Not enough Thule Coins!"); 
        end
    end
end



function event_trade(e)
    local class = e.other:GetClass()
    local accountID = e.other:AccountID()
    local aaPoints = e.other:GetAAPoints()
    local trade = e.trade

    -- Utility to find an item in trade slots
    local function has_item(id)
        for i = 1, 4 do
            local inst = trade["item" .. i]
            if inst and inst.valid and inst:GetID() == id then
                return true
            end
        end
        return false
    end

    -- Utility to find matching scroll item
    local function get_matching_scroll(scroll_table)
        for item_id, data in pairs(scroll_table) do
            if has_item(item_id) then
                return item_id, data
            end
        end
        return nil, nil
    end

    -- Beastlord Unlock
    if has_item(32753) then
        if eq.get_data(tostring(accountID)) == "" then
            eq.set_data(tostring(accountID), "beastlordunlocked")
            e.other:Message(15, "You have unlocked the Beastlord class!")
        else
            e.other:Message(13, "You have already unlocked the Beastlord class.")
        end
        return
    end

    -- Race Change Scrolls
    local scrolls = {
        [32727] = {race = 1, classes = {1,2,3,4,5,6,7,8,9,11,12,13,14}}, -- Human
        [32739] = {race = 2, classes = {1,9,10}}, -- Barbarian
        [32728] = {race = 3, classes = {2,3,5,11,12,13,14}}, -- Erudite
        [32729] = {race = 4, classes = {1,4,6,8,9}}, -- Wood Elf
        [32730] = {race = 5, classes = {2,3,12,13,14}}, -- High Elf
        [32731] = {race = 6, classes = {1,2,5,9,11,12,13,14}}, -- Dark Elf
        [32732] = {race = 7, classes = {1,3,4,6,8,9}}, -- Half Elf
        [32733] = {race = 8, classes = {1,2,3,9}}, -- Dwarf
        [32734] = {race = 9, classes = {1,5,10}}, -- Troll
        [32735] = {race = 10, classes = {1,5,10}}, -- Ogre
        [32736] = {race = 11, classes = {1,2,3,4,6,9}}, -- Halfling
        [32737] = {race = 12, classes = {1,2,5,9,11,12,13,14}}, -- Gnome
        [32738] = {race = 128, classes = {1,5,7,10,11}}, -- Iksar
    }

    local scroll_id, scroll_data = get_matching_scroll(scrolls)
    if scroll_id and scroll_data then
        for _, allowed_class in ipairs(scroll_data.classes) do
            if class == allowed_class then
                e.other:SetBaseRace(scroll_data.race)
                e.other:WorldKick()
                return
            end
        end
        e.other:Message(13, "This is not an eligible class/race combination. Please contact a GM for reimbursement.")
        return
    end

    -- Level 30 Boost
    if has_item(32764) then
        if e.other:GetLevel() < 30 then
            e.other:SetLevel(30)
            e.other:SetAAPoints(aaPoints + 15)
            e.other:AddMoneyToPP(0, 0, 0, 200, true)

            local class_gear = {
                plate = {32763,32761,32760,32759,32758,32757,32757,32756,32755,32754},
                leather = {2001,2002,2004,2005,2006,2007,2008,2009,2009,2010,2011,2012},
                silk = {1160,1161,1320,1164,1165,1166,1167,1168,1168,1169,1170,1171}
            }

            local weapon_sets = {
                [1] = {gear = "plate", weapon = {32767}}, -- Warrior
                [2] = {gear = "plate", weapon = {32559}}, -- Cleric
                [3] = {gear = "plate", weapon = {32767}}, -- Paladin
                [4] = {gear = "plate", weapon = {32639, 32636, 32637}}, -- Ranger
                [5] = {gear = "plate", weapon = {32767}}, -- Shadowknight
                [6] = {gear = "leather", weapon = {32559}}, -- Druid
                [7] = {gear = "leather", weapon = {32709, 32711, 32710}}, -- Monk
                [8] = {gear = "plate", weapon = {32558, 32637}}, -- Bard
                [9] = {gear = "plate", weapon = {32635, 32636}}, -- Rogue
                [10] = {gear = "plate", weapon = {32559}}, -- Shaman
                [11] = {gear = "silk", weapon = {32560}}, -- Necromancer
                [12] = {gear = "silk", weapon = {32561}}, -- Wizard
                [13] = {gear = "silk", weapon = {32561}}, -- Magician
                [14] = {gear = "silk", weapon = {32561}}, -- Enchanter
                [15] = {gear = "leather", weapon = {32709, 32711, 32710}}, -- Beastlord
            }

            local entry = weapon_sets[class]
            if entry then
                local gear = class_gear[entry.gear]
                if gear then
                    for _, item_id in ipairs(gear) do
                        e.other:SummonItem(item_id)
                    end
                end
                for _, weapon_id in ipairs(entry.weapon) do
                    e.other:SummonItem(weapon_id)
                end
            else
                e.other:Message(13, "Your class is not eligible for the Level 30 Boost.")
            end

            e.self:Say("You have been granted a level 30 boost! Good luck!")
        else
            e.other:Message(13, "You are already level 30 or higher and cannot use this boost.")
        end
        return
    end

    -- Fallback: return all items
    for i = 1, 4 do
        local inst = trade["item" .. i]
        if inst and inst.valid then
            e.other:SummonItem(inst:GetID(), inst:GetCharges() or 1)
        end
    end
end




