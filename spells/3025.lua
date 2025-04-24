function event_cast(e)
    e.self:Message(15, "Cast success!");
    e.self:Damage(e.self, 25, 4003, 1); --testing dmg
    e.self:Message(15, "You gouge your flesh, black blood erupts from the wound!");
end
