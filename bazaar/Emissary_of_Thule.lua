        
function event_say(e) 
    if e.message:findi("hail") then
        e.other:Message(2, "Coming soon. Mahalo for testing!");
    end
end
