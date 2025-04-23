function event_say(e)
    local charName = e.other:GetCleanName();
    local pvpPoints = e.other:GetPVPPoints();
    local charLevel = e.other:GetLevel();
    local itemCost = 100000;

    if e.message:findi("hail") then
        e.other:Message(13, "You currently have "..pvpPoints.. " points available");
        e.other:Message(2, "Hail "..charName.."! I have the following that I can trade for PvP points!");
        e.other:Message(2, eq.say_link("EQUIPMENT").. " - Weapons, Bags");
        e.other:Message(2, eq.say_link("COSMETICS").. " - Illusions, Unlimited Dye, Familiar/Pet Skins");
        e.other:Message(2, eq.say_link("QOL/SERVICES").. " - Clockwork Merchants, Race Changes, Potions");
    
    elseif e.message:findi("EQUIPMENT") then
        e.other:Message(2, eq.say_link("TIER 1").. " - Lvl 1-20");
        e.other:Message(2, eq.say_link("TIER 2").. " - Lvl 21-35");
        e.other:Message(2, eq.say_link("TIER 3").. " - Lvl 36-50");

    elseif e.message:findi("TIER 1") then
        e.other:Message(2, eq.item_link(32633).. "125 Points "..eq.say_link("Purchase Flaming Zweihander"));
        e.other:Message(2, eq.item_link(32634).. "125 Points "..eq.say_link("Purchase Gloomwater Axe"));
        e.other:Message(2, eq.item_link(32635).. "75 Points "..eq.say_link("Purchase Serrated Bone Sword"));
        e.other:Message(2, eq.item_link(32636).. "75 Points "..eq.say_link("Purchase Frozen Steel Dirk"));
        e.other:Message(2, eq.item_link(32637).. "75 Points "..eq.say_link("Purchase Terror Whip"));
        e.other:Message(2, eq.item_link(32638).. "75 Points "..eq.say_link("Purchase Brusco's Short Sword of Pain"));
        e.other:Message(2, eq.item_link(32639).. "125 Points "..eq.say_link("Purchase Orc Slayer"));
        e.other:Message(2, eq.item_link(32640).. "75 Points "..eq.say_link("Purchase Donal's Warhammer of Mourning"));
        e.other:Message(2, eq.item_link(32641).. "75 Points "..eq.say_link("Purchase Adamantite Morning Star"));
        e.other:Message(2, eq.item_link(32642).. "75 Points "..eq.say_link("Purchase Tagar's Staff of Insects"));
        e.other:Message(2, eq.item_link(32643).. "75 Points "..eq.say_link("Purchase Runescale Staff"));
        e.other:Message(2, eq.item_link(32644).. "75 Points "..eq.say_link("Purchase Scepter of Forlorn Agony"));

    elseif e.message:findi("TIER 2") then
        e.other:Message(2, eq.item_link(32645).. "250 Points "..eq.say_link("Purchase Charred Axe of the Executioner"));
        e.other:Message(2, eq.item_link(32646).. "250 Points "..eq.say_link("Purchase Mithril Two Handed Blade"));
        e.other:Message(2, eq.item_link(32647).. "175 Points "..eq.say_link("Purchase Shadow Flame Scimitar"));
        e.other:Message(2, eq.item_link(32648).. "175 Points "..eq.say_link("Purchase Dirk of the Dain"));
        e.other:Message(2, eq.item_link(32649).. "175 Points "..eq.say_link("Purchase Silver Mace of Rage"));
        e.other:Message(2, eq.item_link(32650).. "175 Points "..eq.say_link("Purchase Kelin's Lucid Dagger"));
        e.other:Message(2, eq.item_link(32651).. "175 Points "..eq.say_link("Purchase Giant Slayer"));
        e.other:Message(2, eq.item_link(32652).. "175 Points "..eq.say_link("Purchase Donal's Hammer of Damnation"));
        e.other:Message(2, eq.item_link(32653).. "175 Points "..eq.say_link("Purchase Oakwynd Scimitar"));
        e.other:Message(2, eq.item_link(32654).. "175 Points "..eq.say_link("Purchase Togur's Staff of Insects"));
        e.other:Message(2, eq.item_link(32655).. "175 Points "..eq.say_link("Purchase Staff of Mardu"));
        e.other:Message(2, eq.item_link(32656).. "175 Points "..eq.say_link("Purchase Crystal Staff of Darkness"));

        
    elseif e.message:findi("TIER 3") then
        e.other:Message(2, eq.item_link(32657).. "500 Points "..eq.say_link("Purchase Ancient Singing Short Sword"));
        e.other:Message(2, eq.item_link(32658).. "500 Points "..eq.say_link("Purchase Ancient Water Sprinkler of Nem Ankh"));
        e.other:Message(2, eq.item_link(32659).. "500 Points "..eq.say_link("Purchase Ancient Nature Walkers Scimitar"));
        e.other:Message(2, eq.item_link(32660).. "500 Points "..eq.say_link("Purchase Ancient Staff of the Serpent"));
        e.other:Message(2, eq.item_link(32661).. "500 Points "..eq.say_link("Purchase Ancient Orb of Mastery"));
        e.other:Message(2, eq.item_link(32662).. "500 Points "..eq.say_link("Purchase Ancient Celestial Fists"));
        e.other:Message(2, eq.item_link(32663).. "500 Points "..eq.say_link("Purchase Ancient Scythe of the Shadowed Soul"));
        e.other:Message(2, eq.item_link(32664).. "500 Points "..eq.say_link("Purchase Ancient Fiery Defender"));
        e.other:Message(2, eq.item_link(32665).. "500 Points "..eq.say_link("Purchase Ancient Swiftwind"));
        e.other:Message(2, eq.item_link(32666).. "500 Points "..eq.say_link("Purchase Ancient Earthcaller"));
        e.other:Message(2, eq.item_link(32667).. "500 Points "..eq.say_link("Purchase Ancient Ragebringer"));
        e.other:Message(2, eq.item_link(32668).. "500 Points "..eq.say_link("Purchase Ancient Innoruuks Curse"));
        e.other:Message(2, eq.item_link(32669).. "500 Points "..eq.say_link("Purchase Ancient Spear of Fate"));
        e.other:Message(2, eq.item_link(32670).. "500 Points "..eq.say_link("Purchase Ancient Jagged Blade of War"));
        e.other:Message(2, eq.item_link(32671).. "500 Points "..eq.say_link("Purchase Ancient Blade of Strategy"));
        e.other:Message(2, eq.item_link(32672).. "500 Points "..eq.say_link("Purchase Ancient Blade of Tactics"));
        e.other:Message(2, eq.item_link(32673).. "500 Points "..eq.say_link("Purchase Ancient Staff of the Four"));

    
    --Tier 1
    elseif e.message:findi("Purchase Flaming Zweihander") then
            e.other:Message(2, eq.say_link("Confirm Purchase of Flaming Zweihander"));
    elseif e.message:findi("Confirm Purchase of Flaming Zweihander") then
        itemCost = 75;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32633);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end
    elseif e.message:findi("Purchase Gloomwater Axe") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Gloomwater Axe"));
    elseif e.message:findi("Confirm Purchase of Gloomwater Axe") then
        itemCost = 75;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32634);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end
    elseif e.message:findi("Purchase Serrated Bone Sword") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Serrated Bone Sword"));
    elseif e.message:findi("Confirm Purchase of Serrated Bone Sword") then
        itemCost = 50;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32635);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end 

    elseif e.message:findi("Purchase Frozen Steel Dirk") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Frozen Steel Dirk"));  
    elseif e.message:findi("Confirm Purchase of Frozen Steel Dirk") then
        itemCost = 50;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32636);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end 
    elseif e.message:findi("Purchase Terror Whip") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Terror Whip"));  
    elseif e.message:findi("Confirm Purchase of Terror Whip") then
        itemCost = 50;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32637);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end 
    elseif e.message:findi("Purchase Brusco's Short Sword of Pain") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Brusco's Short Sword of Pain"));  
    elseif e.message:findi("Confirm Purchase of Brusco's Short Sword of Pain") then
        itemCost = 50;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32638);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end 
    elseif e.message:findi("Purchase Orc Slayer") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Orc Slayer"));  
    elseif e.message:findi("Confirm Purchase of Orc Slayer") then
        itemCost = 75;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32639);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end 
    elseif e.message:findi("Purchase Donal's Warhammer of Mourning") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Donal's Warhammer of Mourning"));  
    elseif e.message:findi("Confirm Purchase of Donal's Warhammer of Mourning") then
        itemCost = 50;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32640);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end 
    elseif e.message:findi("Purchase Adamantite Morning Star") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Adamantite Morning Star"));  
    elseif e.message:findi("Confirm Purchase of Adamantite Morning Star") then
        itemCost = 50;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32641);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end 
    elseif e.message:findi("Purchase Tagar's Staff of Insects") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Tagar's Staff of Insects"));  
    elseif e.message:findi("Confirm Purchase of Tagar's Staff of Insects") then
        itemCost = 50;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32642);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end
    elseif e.message:findi("Purchase Runescale Staff") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Runescale Staff"));  
    elseif e.message:findi("Confirm Purchase of Runescale Staff") then
        itemCost = 50;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32643);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end
    elseif e.message:findi("Purchase Scepter of Forlorn Agony") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Scepter of Forlorn Agony"));  
    elseif e.message:findi("Confirm Purchase of Scepter of Forlorn Agony") then
        itemCost = 50;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32644);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end

    --Tier 2
    elseif e.message:findi("Purchase Charred Axe of the Executioner") then
        if charLevel > 20 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Charred Axe of the Executioner"));  
        else
            e.other:Message(13, "Must be above level 20 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Charred Axe of the Executioner") then
        if charLevel > 20 then
            itemCost = 250;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32645);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end
    elseif e.message:findi("Purchase Mithril Two Handed Blade") then
        if charLevel > 20 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Mithril Two Handed Blade"));  
        else
            e.other:Message(13, "Must be above level 20 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Mithril Two Handed Blade") then
        if charLevel > 20 then
            itemCost = 250;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32646);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end

    elseif e.message:findi("Purchase Shadow Flame Scimitar") then
        if charLevel > 20 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Shadow Flame Scimitar"));  
        else
            e.other:Message(13, "Must be above level 20 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Shadow Flame Scimitar") then
        if charLevel > 20 then
            itemCost = 175;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32647);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end

    elseif e.message:findi("Purchase Dirk of the Dain") then
        if charLevel > 20 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Dirk of the Dain"));
        else
            e.other:Message(13, "Must be above level 20 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Dirk of the Dain") then
        if charLevel > 20 then
            itemCost = 175;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32648);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end

    elseif e.message:findi("Purchase Silver Mace of Rage") then
        if charLevel > 20 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Silver Mace of Rage"));  
        else
            e.other:Message(13, "Must be above level 20 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Silver Mace of Rage") then
        if charLevel > 20 then
            itemCost = 175;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32649);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end
    elseif e.message:findi("Purchase Kelin's Lucid Dagger") then
        if charLevel > 20 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Kelin's Lucid Dagger"));  
        else
            e.other:Message(13, "Must be above level 20 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Kelin's Lucid Dagger") then
        if charLevel > 20 then
            itemCost = 175;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32650);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end
    elseif e.message:findi("Purchase Giant Slayer") then
        if charLevel > 20 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Giant Slayer"));
        else
            e.other:Message(13, "Must be above level 20 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Giant Slayer") then
        if charLevel > 20 then
            itemCost = 175;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32651);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end
    elseif e.message:findi("Purchase Donal's Hammer of Damnation") then
        if charLevel > 20 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Donal's Hammer of Damnation"));
        else
            e.other:Message(13, "Must be above level 20 to purchase");  
        end 
    elseif e.message:findi("Confirm Purchase of Donal's Hammer of Damnation") then
        if charLevel > 20 then
            itemCost = 175;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32652);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end
    elseif e.message:findi("Purchase Oakwynd Scimitar") then
        if charLevel > 20 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Oakwynd Scimitar"));
        else
            e.other:Message(13, "Must be above level 20 to purchase");  
        end 
    elseif e.message:findi("Confirm Purchase of Oakwynd Scimitar") then
        if charLevel > 20 then
            itemCost = 175;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32653);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end

    elseif e.message:findi("Purchase Togur's Staff of Insects") then
        if charLevel > 20 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Togur's Staff of Insects"));  
        else
            e.other:Message(13, "Must be above level 20 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Togur's Staff of Insects") then
        if charLevel > 20 then
            itemCost = 175;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32654);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end

    elseif e.message:findi("Purchase Staff of Mardu") then
        if charLevel > 20 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Staff of Mardu"));
        else
            e.other:Message(13, "Must be above level 20 to purchase");  
        end 
    elseif e.message:findi("Confirm Purchase of Staff of Mardu") then
        if charLevel > 20 then
            itemCost = 175;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32655);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end

    elseif e.message:findi("Purchase Crystal Staff of Darkness") then
        if charLevel > 20 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Crystal Staff of Darkness"));  
        else
            e.other:Message(13, "Must be above level 20 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Crystal Staff of Darkness") then
        if charLevel > 20 then
            itemCost = 175;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32656);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end
    
    --Tier 3

    elseif e.message:findi("Purchase Ancient Singing Short Sword") then
        if charLevel > 35 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Ancient Singing Short Sword"));
        else
            e.other:Message(13, "Must be above level 35 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Ancient Singing Short Sword") then
        if charLevel > 35 then
            itemCost = 500;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32657);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end

    elseif e.message:findi("Purchase Ancient Water Sprinkler of Nem Ankh") then
        if charLevel > 35 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Ancient Water Sprinkler of Nem Ankh"));
        else
            e.other:Message(13, "Must be above level 35 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Ancient Water Sprinkler of Nem Ankh") then
        if charLevel > 35 then
            itemCost = 500;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32658);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end

    elseif e.message:findi("Purchase Ancient Nature Walkers Scimitar") then
        if charLevel > 35 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Ancient Nature Walkers Scimitar"));
        else
            e.other:Message(13, "Must be above level 35 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Ancient Nature Walkers Scimitar") then
        if charLevel > 35 then
            itemCost = 500;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32659);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end
    elseif e.message:findi("Purchase Ancient Staff of the Serpent") then
        if charLevel > 35 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Ancient Staff of the Serpent"));
        else
            e.other:Message(13, "Must be above level 35 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Ancient Staff of the Serpent") then
        if charLevel > 35 then
            itemCost = 500;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32660);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end
    elseif e.message:findi("Purchase Ancient Orb of Mastery") then
        if charLevel > 35 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Ancient Orb of Mastery"));
        else
            e.other:Message(13, "Must be above level 35 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Ancient Orb of Mastery") then
        if charLevel > 35 then
            itemCost = 500;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32661);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end

    elseif e.message:findi("Purchase Ancient Celestial Fists") then
        if charLevel > 35 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Ancient Celestial Fists"));
        else
            e.other:Message(13, "Must be above level 35 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Ancient Celestial Fists") then
        if charLevel > 35 then
            itemCost = 500;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32662);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end

    elseif e.message:findi("Purchase Ancient Scythe of the Shadowed Soul") then
        if charLevel > 35 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Ancient Scythe of the Shadowed Soul"));
        else
            e.other:Message(13, "Must be above level 35 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Ancient Scythe of the Shadowed Soul") then
        if charLevel > 35 then
            itemCost = 500;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32663);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end

    elseif e.message:findi("Purchase Ancient Fiery Defender") then
        if charLevel > 35 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Ancient Fiery Defender"));
        else
            e.other:Message(13, "Must be above level 35 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Ancient Fiery Defender") then
        if charLevel > 35 then
            itemCost = 500;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32664);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end

    elseif e.message:findi("Purchase Ancient Swiftwind") then
        if charLevel > 35 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Ancient Swiftwind"));
        else
            e.other:Message(13, "Must be above level 35 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Ancient Swiftwind") then
        if charLevel > 35 then
            itemCost = 500;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32665);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end

    elseif e.message:findi("Purchase Ancient Earthcaller") then
        if charLevel > 35 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Ancient Earthcaller"));
        else
            e.other:Message(13, "Must be above level 35 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Ancient Earthcaller") then
        if charLevel > 35 then
            itemCost = 500;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32666);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end

    elseif e.message:findi("Purchase Ancient Ragebringer") then
        if charLevel > 35 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Ancient Ragebringer"));
        else
            e.other:Message(13, "Must be above level 35 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Ancient Ragebringer") then
        if charLevel > 35 then
            itemCost = 500;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32667);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end

    elseif e.message:findi("Purchase Ancient Innoruuks Curse") then
        if charLevel > 35 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Ancient Innoruuks Curse"));
        else
            e.other:Message(13, "Must be above level 35 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Ancient Innoruuks Curse") then
        if charLevel > 35 then
            itemCost = 500;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32668);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end

    elseif e.message:findi("Purchase Ancient Spear of Fate") then
        if charLevel > 35 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Ancient Spear of Fate"));
        else
            e.other:Message(13, "Must be above level 35 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Ancient Spear of Fate") then
        if charLevel > 35 then
            itemCost = 500;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32669);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end

    elseif e.message:findi("Purchase Ancient Jagged Blade of War") then
        if charLevel > 35 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Ancient Jagged Blade of War"));
        else
            e.other:Message(13, "Must be above level 35 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Ancient Jagged Blade of War") then
        if charLevel > 35 then
            itemCost = 500;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32670);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end
    elseif e.message:findi("Purchase Ancient Blade of Strategy") then
        if charLevel > 35 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Ancient Blade of Strategy"));
        else
            e.other:Message(13, "Must be above level 35 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Ancient Blade of Strategy") then
        if charLevel > 35 then
            itemCost = 500;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32671);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end
    elseif e.message:findi("Purchase Ancient Blade of Tactics") then
        if charLevel > 35 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Ancient Blade of Tactics"));
        else
            e.other:Message(13, "Must be above level 35 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Ancient Blade of Tactics") then
        if charLevel > 35 then
            itemCost = 500;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32672);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end
    elseif e.message:findi("Purchase Ancient Staff of the Four") then
        if charLevel > 35 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Ancient Staff of the Four"));
        else
            e.other:Message(13, "Must be above level 35 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Ancient Staff of the Four") then
        if charLevel > 35 then
            itemCost = 500;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32673);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end    

    elseif e.message:findi("COSMETICS") then
        e.other:Message(2, "Coming soon. Mahalo for testing!");
    elseif e.message:findi("QOL/SERVICES") then
        e.other:Message(2, "Coming soon. Mahalo for testing!");
    end
end

