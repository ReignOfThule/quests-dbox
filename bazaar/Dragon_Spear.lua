function event_say(e)
    local charName = e.other:GetCleanName();
    local pvpPoints = e.other:GetPVPPoints();
    local itemCost = 100000;

    if e.message:findi("hail") then
        e.other:Message(2, "You currently have "..pvpPoints.. " points available");
        e.other:Message(2, "Hail "..charName.."! I have the following items that I can trade for PvP points!");
        e.other:Message(2, "[1] "..eq.item_link(1001).."100 Points"..eq.say_link(" Purchase 1"));
        e.other:Message(2, "[2] "..eq.item_link(1002).. "100 Points"..eq.say_link(" Purchase 2"));
        e.other:Message(2, "[3] "..eq.item_link(1003).. "100 Points"..eq.say_link(" Purchase 3"));
        e.other:Message(2, "[4] "..eq.item_link(1004).. "100 Points"..eq.say_link(" Purchase 4"));
        e.other:Message(2, "[5] "..eq.item_link(1005).. "100 Points"..eq.say_link(" Purchase 5"));
        e.other:Message(2, "[6] "..eq.item_link(1006).. "100 Points"..eq.say_link(" Purchase 6"));
        e.other:Message(2, "[7] "..eq.item_link(1007).. "100 Points"..eq.say_link(" Purchase 7"));

    elseif e.message:findi(" Purchase (1)") then
        e.other:Message(2, "Confirming that you wish to purchase "..eq.item_link(1001).."for 100 points?");
        e.other:Message(2, eq.say_link("Confirm Purchase Cloth Cap "));

    elseif e.message:findi("Confirm Purchase Cloth Cap") then
        itemCost = 10;
        if pvpPoints >= itemCost then
            e.other:Message(2, "Congratulations on your new item!"); --logic to check if enough pvp points, take away pvp points for item.
            --summon item
            e.other:SetPVPPoints(pvpPoints - itemCost);
        end
    end
end