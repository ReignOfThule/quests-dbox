function event_say(e)
    local charName = e.other:GetCleanName()

    if e.message:findi("hail") then
        e.other:Message(2, "Time stops as you Hail Aradune. Though he is gone, Brad Aradune Mithara will never be forgotten.");
    end
end