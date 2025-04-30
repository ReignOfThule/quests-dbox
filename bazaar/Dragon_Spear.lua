function event_say(e)
    local charName = e.other:GetCleanName();
    local pvpPoints = e.other:GetPVPPoints();
    local charLevel = e.other:GetLevel();
    local itemCost = 100000;

    if e.message:findi("hail") then
        e.other:Message(13, "You currently have "..pvpPoints.. " points available");
        e.other:Message(2, "Hail "..charName.."! I have the following that I can trade for PvP points!");
        e.other:Message(2, eq.say_link("EQUIPMENT").. " - Weapons and Tradeskill Items");
        e.other:Message(2, eq.say_link("COSMETICS").. " - Illusions");
        e.other:Message(2, eq.say_link("QOL/SERVICES").. " - Bags, Race Changes, and XP Potions");
    elseif e.message:findi("QOL/Services") then
        e.other:Message(2, eq.item_link(32739).. "1000 Points "..eq.say_link("Purchase Race Change: Barbarian"));
        e.other:Message(2, eq.item_link(32738).. "1000 Points "..eq.say_link("Purchase Race Change: Iksar"));
        e.other:Message(2, eq.item_link(32737).. "1000 Points "..eq.say_link("Purchase Race Change: Gnome"));
        e.other:Message(2, eq.item_link(32736).. "1000 Points "..eq.say_link("Purchase Race Change: Halfling"));
        e.other:Message(2, eq.item_link(32735).. "1000 Points "..eq.say_link("Purchase Race Change: Ogre"));
        e.other:Message(2, eq.item_link(32734).. "1000 Points "..eq.say_link("Purchase Race Change: Troll"));
        e.other:Message(2, eq.item_link(32733).. "1000 Points "..eq.say_link("Purchase Race Change: Dwarf"));
        e.other:Message(2, eq.item_link(32732).. "1000 Points "..eq.say_link("Purchase Race Change: Half Elf"));
        e.other:Message(2, eq.item_link(32731).. "1000 Points "..eq.say_link("Purchase Race Change: Dark Elf"));
        e.other:Message(2, eq.item_link(32730).. "1000 Points "..eq.say_link("Purchase Race Change: Iksar"));
        e.other:Message(2, eq.item_link(32729).. "1000 Points "..eq.say_link("Purchase Race Change: Wood Elf"));
        e.other:Message(2, eq.item_link(32728).. "1000 Points "..eq.say_link("Purchase Race Change: Erudite"));
        e.other:Message(2, eq.item_link(32727).. "1000 Points "..eq.say_link("Purchase Race Change: Human"));
        e.other:Message(2, eq.item_link(32700).. "100 Points "..eq.say_link("Purchase Potion of Experience"));
        e.other:Message(2, eq.item_link(32619).. "400 Points "..eq.say_link("Purchase Druzzil's Handbag of Holding"));

    elseif e.message:findi("COSMETICS") then
        e.other:Message(2, eq.item_link(32718).. "400 Points "..eq.say_link("Purchase Troll Hide Mask"));
        e.other:Message(2, eq.item_link(32719).. "400 Points "..eq.say_link("Purchase Mask of the Human"));
        e.other:Message(2, eq.item_link(32720).. "400 Points "..eq.say_link("Purchase Mask of the Erudite"));
        e.other:Message(2, eq.item_link(32721).. "400 Points "..eq.say_link("Purchase Faydark Hide Mask"));
        e.other:Message(2, eq.item_link(32722).. "400 Points "..eq.say_link("Purchase Mask of the High Elf"));
        e.other:Message(2, eq.item_link(32723).. "400 Points "..eq.say_link("Purchase Iksar Hide Mask"));
        e.other:Message(2, eq.item_link(32724).. "400 Points "..eq.say_link("Purchase Guise of the Half Elf"));
        e.other:Message(2, eq.item_link(32725).. "400 Points "..eq.say_link("Purchase Guise of Ogre"));
    
    elseif e.message:findi("EQUIPMENT") then
        e.other:Message(2, eq.say_link("TIER 1").. " - Lvl 1-20");
        e.other:Message(2, eq.say_link("TIER 2").. " - Lvl 21-35");
        e.other:Message(2, eq.say_link("TIER 3").. " - Lvl 36-50");

    elseif e.message:findi("TIER 1") then
        e.other:Message(2, eq.item_link(32633).. "250 Points "..eq.say_link("Purchase Flaming Zweihander"));
        e.other:Message(2, eq.item_link(32634).. "250 Points "..eq.say_link("Purchase Zimel's Axe of Stoic"));
        e.other:Message(2, eq.item_link(32639).. "250 Points "..eq.say_link("Purchase Orc Slayer"));
        e.other:Message(2, eq.item_link(32710).. "250 Points "..eq.say_link("Purchase Wu's Staff of Pain"));
        e.other:Message(2, eq.item_link(32635).. "150 Points "..eq.say_link("Purchase Serrated Bone Sword"));
        e.other:Message(2, eq.item_link(32636).. "150 Points "..eq.say_link("Purchase Frozen Steel Dirk"));
        e.other:Message(2, eq.item_link(32637).. "150 Points "..eq.say_link("Purchase Terror Whip"));
        e.other:Message(2, eq.item_link(32709).. "150 Points "..eq.say_link("Purchase Serrated Steel Ulak"));
        e.other:Message(2, eq.item_link(32711).. "150 Points "..eq.say_link("Purchase Terror Forged Ulak"));
        e.other:Message(2, eq.item_link(32638).. "150 Points "..eq.say_link("Purchase Brusco's Short Sword of Pain"));
        e.other:Message(2, eq.item_link(32640).. "150 Points "..eq.say_link("Purchase Donal's Warhammer of Mourning"));
        e.other:Message(2, eq.item_link(32641).. "150 Points "..eq.say_link("Purchase Adamantite Morning Star"));
        e.other:Message(2, eq.item_link(32642).. "150 Points "..eq.say_link("Purchase Tagar's Staff of Insects"));
        e.other:Message(2, eq.item_link(32643).. "150 Points "..eq.say_link("Purchase Runescale Staff"));
        e.other:Message(2, eq.item_link(32644).. "150 Points "..eq.say_link("Purchase Scepter of Forlorn Agony"));
        e.other:Message(2, eq.item_link(32715).. "50 Points "..eq.say_link("Purchase Planar Temper"));
        e.other:Message(2, eq.item_link(10580).. "200 Points "..eq.say_link("Purchase Shrunken Goblin Skull Earring"));
        e.other:Message(2, eq.item_link(11911).. "200 Points "..eq.say_link("Purchase Bracer of the Hidden"));
        e.other:Message(2, eq.item_link(2463).. "200 Points "..eq.say_link("Purchase Pegasus Feather Cloak"));


    elseif e.message:findi("TIER 2") then
        e.other:Message(2, eq.item_link(32645).. "500 Points "..eq.say_link("Purchase Charred Axe of the Executioner"));
        e.other:Message(2, eq.item_link(32646).. "500 Points "..eq.say_link("Purchase Mithril Two Handed Blade"));
        e.other:Message(2, eq.item_link(32712).. "500 Points "..eq.say_link("Purchase Treant Great Staff"));
        e.other:Message(2, eq.item_link(32651).. "500 Points "..eq.say_link("Purchase Giant Slayer"));
        e.other:Message(2, eq.item_link(32647).. "350 Points "..eq.say_link("Purchase Shadow Flame Scimitar"));
        e.other:Message(2, eq.item_link(32648).. "350 Points "..eq.say_link("Purchase Dirk of the Dain"));
        e.other:Message(2, eq.item_link(32713).. "350 Points "..eq.say_link("Purchase Ulak of Order"));
        e.other:Message(2, eq.item_link(32714).. "350 Points "..eq.say_link("Purchase Ulak of Discord"));
        e.other:Message(2, eq.item_link(32649).. "350 Points "..eq.say_link("Purchase Silver Mace of Rage"));
        e.other:Message(2, eq.item_link(32650).. "350 Points "..eq.say_link("Purchase Kelin's Lucid Dagger"));
        e.other:Message(2, eq.item_link(32652).. "350 Points "..eq.say_link("Purchase Donal's Hammer of Damnation"));
        e.other:Message(2, eq.item_link(32653).. "350 Points "..eq.say_link("Purchase Oakwynd Scimitar"));
        e.other:Message(2, eq.item_link(32654).. "350 Points "..eq.say_link("Purchase Togur's Staff of Insects"));
        e.other:Message(2, eq.item_link(32655).. "350 Points "..eq.say_link("Purchase Staff of Mardu"));
        e.other:Message(2, eq.item_link(32656).. "350 Points "..eq.say_link("Purchase Crystal Staff of Darkness"));
        e.other:Message(2, eq.item_link(32715).. "50 Points "..eq.say_link("Purchase Planar Temper"));
        e.other:Message(2, eq.item_link(10580).. "200 Points "..eq.say_link("Purchase Shrunken Goblin Skull Earring"));
        e.other:Message(2, eq.item_link(11911).. "200 Points "..eq.say_link("Purchase Bracer of the Hidden"));
        e.other:Message(2, eq.item_link(2463).. "200 Points "..eq.say_link("Purchase Pegasus Feather Cloak"));
        
    elseif e.message:findi("TIER 3") then
        e.other:Message(2, eq.item_link(32657).. "1000 Points "..eq.say_link("Purchase Ancient Singing Short Sword"));
        e.other:Message(2, eq.item_link(32658).. "1000 Points "..eq.say_link("Purchase Ancient Water Sprinkler of Nem Ankh"));
        e.other:Message(2, eq.item_link(32659).. "1000 Points "..eq.say_link("Purchase Ancient Nature Walkers Scimitar"));
        e.other:Message(2, eq.item_link(32660).. "1000 Points "..eq.say_link("Purchase Ancient Staff of the Serpent"));
        e.other:Message(2, eq.item_link(32661).. "1000 Points "..eq.say_link("Purchase Ancient Orb of Mastery"));
        e.other:Message(2, eq.item_link(32662).. "1000 Points "..eq.say_link("Purchase Ancient Celestial Fists"));
        e.other:Message(2, eq.item_link(32663).. "1000 Points "..eq.say_link("Purchase Ancient Scythe of the Shadowed Soul"));
        e.other:Message(2, eq.item_link(32664).. "1000 Points "..eq.say_link("Purchase Ancient Fiery Defender"));
        e.other:Message(2, eq.item_link(32665).. "1000 Points "..eq.say_link("Purchase Ancient Swiftwind"));
        e.other:Message(2, eq.item_link(32666).. "1000 Points "..eq.say_link("Purchase Ancient Earthcaller"));
        e.other:Message(2, eq.item_link(32667).. "1000 Points "..eq.say_link("Purchase Ancient Ragebringer"));
        e.other:Message(2, eq.item_link(32668).. "1000 Points "..eq.say_link("Purchase Ancient Innoruuks Curse"));
        e.other:Message(2, eq.item_link(32669).. "1000 Points "..eq.say_link("Purchase Ancient Spear of Fate"));
        e.other:Message(2, eq.item_link(32670).. "1000 Points "..eq.say_link("Purchase Ancient Jagged Blade of War"));
        e.other:Message(2, eq.item_link(32671).. "1000 Points "..eq.say_link("Purchase Ancient Blade of Strategy"));
        e.other:Message(2, eq.item_link(32672).. "1000 Points "..eq.say_link("Purchase Ancient Blade of Tactics"));
        e.other:Message(2, eq.item_link(32673).. "1000 Points "..eq.say_link("Purchase Ancient Staff of the Four"));
        e.other:Message(2, eq.item_link(32715).. "50 Points "..eq.say_link("Purchase Planar Temper"));
        e.other:Message(2, eq.item_link(10580).. "200 Points "..eq.say_link("Purchase Shrunken Goblin Skull Earring"));
        e.other:Message(2, eq.item_link(11911).. "200 Points "..eq.say_link("Purchase Bracer of the Hidden"));
        e.other:Message(2, eq.item_link(2463).. "200 Points "..eq.say_link("Purchase Pegasus Feather Cloak"));
    
        --Cosmetics
    elseif e.message:findi("Purchase Troll Hide Mask") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Troll Hide Mask"));
    elseif e.message:findi("Confirm Purchase of Troll Hide Mask") then
        itemCost = 400;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32718);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end
    elseif e.message:findi("Purchase Mask of the Human") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Mask of the Human"));
    elseif e.message:findi("Confirm Purchase of Mask of the Human") then
        itemCost = 400;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32719);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end

    elseif e.message:findi("Purchase Mask of the Erudite") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Mask of the Erudite"));
    elseif e.message:findi("Confirm Purchase of Mask of the Erudite") then
        itemCost = 400;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32720);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end

    elseif e.message:findi("Purchase Faydark Hide Mask") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Faydark Hide Mask"));
    elseif e.message:findi("Confirm Purchase of Faydark Hide Mask") then
        itemCost = 400;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32721);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end

    elseif e.message:findi("Purchase Mask of the High Elf") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Mask of the High Elf"));
    elseif e.message:findi("Confirm Purchase of Mask of the High Elf") then
        itemCost = 400;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32722);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end

    elseif e.message:findi("Purchase Iksar Hide Mask") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Iksar Hide Mask"));
    elseif e.message:findi("Confirm Purchase of Iksar Hide Mask") then
        itemCost = 400;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32723);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end
    elseif e.message:findi("Purchase Guise of the Half Elf") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Guise of the Half Elf"));
    elseif e.message:findi("Confirm Purchase of Guise of the Half Elf") then
        itemCost = 400;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32724);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end
    elseif e.message:findi("Purchase Guise of Ogre") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Guise of Ogre"));
    elseif e.message:findi("Confirm Purchase of Guise of Ogre") then
        itemCost = 400;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32725);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end

        e.other:Message(2, eq.item_link(32718).. "400 Points "..eq.say_link("Purchase Troll Hide Mask"));
        e.other:Message(2, eq.item_link(32719).. "400 Points "..eq.say_link("Purchase Mask of the Human"));
        e.other:Message(2, eq.item_link(32720).. "400 Points "..eq.say_link("Purchase Mask of the Erudite"));
        e.other:Message(2, eq.item_link(32721).. "400 Points "..eq.say_link("Purchase Faydark Hide Mask"));
        e.other:Message(2, eq.item_link(32722).. "400 Points "..eq.say_link("Purchase Mask of the High Elf"));
        e.other:Message(2, eq.item_link(32723).. "400 Points "..eq.say_link("Purchase Iksar Hide Mask"));
        e.other:Message(2, eq.item_link(32724).. "400 Points "..eq.say_link("Purchase Guise of the Half Elf"));
        e.other:Message(2, eq.item_link(32725).. "400 Points "..eq.say_link("Purchase Guise of Ogre"));

        
        --QOL/Services
    elseif e.message:findi("Purchase Race Change: Barbarian") then
        e.other:Message(2, eq.say_link("Confirm Purchase Barbarian Race Change"));
    elseif e.message:findi("Confirm Purchase Barbarian Race Change") then
        itemCost = 1000;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32739);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end

    elseif e.message:findi("Purchase Race Change: Iksar") then
        e.other:Message(2, eq.say_link("Confirm Purchase Iksar Race Change"));
    elseif e.message:findi("Confirm Purchase Iksar Race Change") then
        itemCost = 1000;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32738);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end

    elseif e.message:findi("Purchase Race Change: Gnome") then
        e.other:Message(2, eq.say_link("Confirm Purchase Gnome Race Change"));
    elseif e.message:findi("Confirm Purchase Gnome Race Change") then
        itemCost = 1000;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32737);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end

    elseif e.message:findi("Purchase Race Change: Halfling") then
        e.other:Message(2, eq.say_link("Confirm Purchase Halfling Race Change"));
    elseif e.message:findi("Confirm Purchase Halfling Race Change") then
        itemCost = 1000;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32736);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end

    elseif e.message:findi("Purchase Race Change: Ogre") then
        e.other:Message(2, eq.say_link("Confirm Purchase Ogre Race Change"));
    elseif e.message:findi("Confirm Purchase Ogre Race Change") then
        itemCost = 1000;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32735);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end

    elseif e.message:findi("Purchase Race Change: Troll") then
        e.other:Message(2, eq.say_link("Confirm Purchase Troll Race Change"));
    elseif e.message:findi("Confirm Purchase Troll Race Change") then
        itemCost = 1000;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32734);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end

    elseif e.message:findi("Purchase Race Change: Dwarf") then
        e.other:Message(2, eq.say_link("Confirm Purchase Dwarf Race Change"));
    elseif e.message:findi("Confirm Purchase Dwarf Race Change") then
        itemCost = 1000;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32733);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end

    elseif e.message:findi("Purchase Race Change: Half Elf") then
        e.other:Message(2, eq.say_link("Confirm Purchase Half Elf Race Change"));
    elseif e.message:findi("Confirm Purchase Half Elf Race Change") then
        itemCost = 1000;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32732);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end

    elseif e.message:findi("Purchase Race Change: Dark Elf") then
        e.other:Message(2, eq.say_link("Confirm Purchase Dark Elf Race Change"));
    elseif e.message:findi("Confirm Purchase Dark Elf Race Change") then
        itemCost = 1000;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32731);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end

    elseif e.message:findi("Purchase Race Change: Wood Elf") then
        e.other:Message(2, eq.say_link("Confirm Purchase Wood Elf Race Change"));
    elseif e.message:findi("Confirm Purchase Wood Elf Race Change") then
        itemCost = 1000;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32729);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end

    elseif e.message:findi("Purchase Race Change: Erudite") then
        e.other:Message(2, eq.say_link("Confirm Purchase Erudite Race Change"));
    elseif e.message:findi("Confirm Purchase Erudite Race Change") then
        itemCost = 1000;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32728);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end

    elseif e.message:findi("Purchase Race Change: Human") then
        e.other:Message(2, eq.say_link("Confirm Purchase Human Race Change"));
    elseif e.message:findi("Confirm Purchase Human Race Change") then
        itemCost = 1000;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item! Turn it back into me when you are ready for a race change");
            e.other:SummonItem(32727);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end

    elseif e.message:findi("Purchase Potion of Experience") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Potion of Experience"));
    elseif e.message:findi("Confirm Purchase of Potion of Experience") then
        itemCost = 100;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32700);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end

        
    elseif e.message:findi("Purchase Druzzil's Handbag of Holding") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Druzzil's Handbag of Holding"));
    elseif e.message:findi("Confirm Purchase of Druzzil's Handbag of Holding") then
        itemCost = 400;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32619);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end

    --Clickies

    elseif e.message:findi("Purchase Shrunken Goblin Skull Earring") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Shrunken Goblin Skull Earring"));
    elseif e.message:findi("Confirm Purchase of Shrunken Goblin Skull Earring") then
    itemCost = 200;
    if pvpPoints >= itemCost then
        e.other:Message(2, "Congratulations on your new item!");
        e.other:SummonItem(10580);
        e.other:SetPVPPoints(pvpPoints - itemCost);
    else
        e.other:Message(2, "Not enough PvP Points!"); 
    end

    elseif e.message:findi("Purchase Bracer of the Hidden") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Bracer of the Hidden"));
    elseif e.message:findi("Confirm Purchase of Bracer of the Hidden") then
    itemCost = 200;
    if pvpPoints >= itemCost then
        e.other:Message(2, "Congratulations on your new item!");
        e.other:SummonItem(11911);
        e.other:SetPVPPoints(pvpPoints - itemCost);
    else
        e.other:Message(2, "Not enough PvP Points!"); 
    end

    elseif e.message:findi("Purchase Pegasus Feather Cloak") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Pegasus Feather Cloak"));
    elseif e.message:findi("Confirm Purchase of Pegasus Feather Cloak") then
    itemCost = 200;
    if pvpPoints >= itemCost then
        e.other:Message(2, "Congratulations on your new item!");
        e.other:SummonItem(2463);
        e.other:SetPVPPoints(pvpPoints - itemCost);
    else
        e.other:Message(2, "Not enough PvP Points!"); 
    end


    --Tier 1
    elseif e.message:findi("Purchase Flaming Zweihander") then
            e.other:Message(2, eq.say_link("Confirm Purchase of Flaming Zweihander"));
    elseif e.message:findi("Confirm Purchase of Flaming Zweihander") then
        itemCost = 250;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32633);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end
    elseif e.message:findi("Purchase Zimel's Axe of Stoic") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Zimel's Axe of Stoic"));
    elseif e.message:findi("Confirm Purchase of Zimel's Axe of Stoic") then
        itemCost = 250;
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
        itemCost = 150;
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
        itemCost = 150;
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
        itemCost = 150;
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
        itemCost = 150;
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
        itemCost = 250;
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
        itemCost = 150;
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
        itemCost = 150;
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
        itemCost = 150;
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
        itemCost = 150;
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
        itemCost = 150;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32644);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end

    elseif e.message:findi("Purchase Wu's Staff of Pain") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Wu's Staff of Pain"));  
    elseif e.message:findi("Confirm Purchase of Wu's Staff of Pain") then
        itemCost = 250;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32710);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end
    elseif e.message:findi("Purchase Serrated Steel Ulak") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Serrated Steel Ulak"));  
    elseif e.message:findi("Confirm Purchase of Serrated Steel Ulak") then
        itemCost = 150;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32709);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end
    elseif e.message:findi("Purchase Terror Forged Ulak") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Terror Forged Ulak"));  
    elseif e.message:findi("Confirm Purchase of Terror Forged Ulak") then
        itemCost = 150;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32711);
            e.other:SetPVPPoints(pvpPoints - itemCost);
        else
            e.other:Message(2, "Not enough PvP Points!"); 
        end
    elseif e.message:findi("Purchase Planar Temper") then
        e.other:Message(2, eq.say_link("Confirm Purchase of Planar Temper"));  
    elseif e.message:findi("Confirm Purchase of Planar Temper") then
        itemCost = 50;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!");
            e.other:SummonItem(32715);
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
            itemCost = 500;
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
            itemCost = 500;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32646);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end
    elseif e.message:findi("Purchase Treant Great Staff") then
        if charLevel > 20 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Treant Great Staff"));  
        else
            e.other:Message(13, "Must be above level 20 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Treant Great Staff") then
        if charLevel > 20 then
            itemCost = 500;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32712);
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
            itemCost = 350;
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
            itemCost = 350;
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
            itemCost = 350;
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
            itemCost = 350;
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
            itemCost = 500;
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
            itemCost = 350;
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
            itemCost = 350;
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
            itemCost = 350;
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
            itemCost = 350;
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
            itemCost = 350;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32656);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end

    elseif e.message:findi("Purchase Ulak of Order") then
        if charLevel > 20 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Ulak of Order"));  
        else
            e.other:Message(13, "Must be above level 20 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Ulak of Order") then
        if charLevel > 20 then
            itemCost = 350;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32713);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
        end

    elseif e.message:findi("Purchase Ulak of Discord") then
        if charLevel > 20 then
            e.other:Message(2, eq.say_link("Confirm Purchase of Ulak of Discord"));  
        else
            e.other:Message(13, "Must be above level 20 to purchase");  
        end
    elseif e.message:findi("Confirm Purchase of Ulak of Discord") then
        if charLevel > 20 then
            itemCost = 350;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32714);
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
            itemCost = 1000;
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
            itemCost = 1000;
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
            itemCost = 1000;
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
            itemCost = 1000;
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
            itemCost = 1000;
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
            itemCost = 1000;
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
            itemCost = 1000;
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
            itemCost = 1000;
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
            itemCost = 1000;
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
            itemCost = 1000;
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
            itemCost = 1000;
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
            itemCost = 1000;
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
            itemCost = 1000;
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
            itemCost = 1000;
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
            itemCost = 1000;
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
            itemCost = 1000;
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
            itemCost = 1000;
            if pvpPoints >= itemCost then
                e.other:Message(2, "Congratulations on your new item!");
                e.other:SummonItem(32673);
                e.other:SetPVPPoints(pvpPoints - itemCost);
            else
                e.other:Message(2, "Not enough PvP Points!"); 
            end
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
