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
        e.other:Message(2, eq.item_link(32739).. "10 Thule Coin "..eq.say_link("Purchase Race Change: Barbarian"));
        e.other:Message(2, eq.item_link(32738).. "10 Thule Coin "..eq.say_link("Purchase Race Change: Iksar"));
        e.other:Message(2, eq.item_link(32737).. "10 Thule Coin "..eq.say_link("Purchase Race Change: Gnome"));
        e.other:Message(2, eq.item_link(32736).. "10 Thule Coin "..eq.say_link("Purchase Race Change: Halfling"));
        e.other:Message(2, eq.item_link(32735).. "10 Thule Coin "..eq.say_link("Purchase Race Change: Ogre"));
        e.other:Message(2, eq.item_link(32734).. "10 Thule Coin "..eq.say_link("Purchase Race Change: Troll"));
        e.other:Message(2, eq.item_link(32733).. "10 Thule Coin "..eq.say_link("Purchase Race Change: Dwarf"));
        e.other:Message(2, eq.item_link(32732).. "10 Thule Coin "..eq.say_link("Purchase Race Change: Half Elf"));
        e.other:Message(2, eq.item_link(32731).. "10 Thule Coin "..eq.say_link("Purchase Race Change: Dark Elf"));
        e.other:Message(2, eq.item_link(32730).. "10 Thule Coin "..eq.say_link("Purchase Race Change: Iksar"));
        e.other:Message(2, eq.item_link(32729).. "10 Thule Coin "..eq.say_link("Purchase Race Change: Wood Elf"));
        e.other:Message(2, eq.item_link(32728).. "10 Thule Coin "..eq.say_link("Purchase Race Change: Erudite"));
        e.other:Message(2, eq.item_link(32727).. "10 Thule Coin "..eq.say_link("Purchase Race Change: Human"));
        e.other:Message(2, eq.item_link(32700).. "1 Thule Coin "..eq.say_link("Purchase Potion of Experience"));
        e.other:Message(2, eq.item_link(32619).. "4 Thule Coin "..eq.say_link("Purchase Druzzil's Handbag of Holding"));
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
    elseif e.message:findi("Purchase Race Change: Barbarian") then
        e.other:Message(2, eq.say_link("Confirm Purchase Barbarian Race Change"));
    elseif e.message:findi("Confirm Purchase Barbarian Race Change") then
        itemCost = 10;
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
        itemCost = 10;
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
        itemCost = 10;
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
        itemCost = 10;
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
        itemCost = 10;
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
        itemCost = 10;
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
        itemCost = 10;
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
        itemCost = 10;
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
        itemCost = 10;
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
        itemCost = 10;
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
        itemCost = 10;
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
        itemCost = 10;
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
        itemCost = 4;
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
    local item_lib = require("items")
    local class = e.other:GetClass()

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

    for item_id, data in pairs(scrolls) do
        if item_lib.check_turn_in(e.self, e.trade, {item1 = item_id}) then
            for _, allowed_class in ipairs(data.classes) do
                if class == allowed_class then
                    e.other:SetBaseRace(data.race);
                    e.other:WorldKick();
                    return
                end
            end
            e.other:Message(13, "This is not an eligible class/race combination. Please contact a GM for reimbursement")
            return
        end
    end

    item_lib.return_items(e.self, e.other, e.trade)
end




