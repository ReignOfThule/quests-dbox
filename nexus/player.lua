function event_cast_begin(e)
	local allowed_spells = {797, 3087, 3088, 3089, 3090, 3091, 3092, 3093, 3094, 3095, 3096, 3097}

 	local is_allowed = false
    for _, spell_id in ipairs(allowed_spells) do
        if e.spell == spell_id then
            is_allowed = true
            break
        end
    end

    if is_allowed == false then
        e.self:Duck()
        e.self:Message(15, "You cannot cast spells here.")
    end
end