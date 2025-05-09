SMODS.Joker {
    key = "abyssalecho",
    name = "Echo of The Abyss",
    atlas = 'buf_special',
    pos = {
        x = 5,
        y = 0,
    },
    rarity = "buf_spc",
    cost = 0,
    unlocked = false,
    discovered = false,
    eternal_compat = false,
    perishable_compat = true,
    blueprint_compat = true,
	in_pool = false,
    config = {
        extra = { mult = 0, mult_gain = 6, cost = 0 },
    },
    loc_txt = {set = 'Joker', key = 'j_buf_blackstallion'},
    loc_vars = function(self, info_queue, card)
		if Buffoonery.config.show_info then
			info_queue[#info_queue+1] = {set = 'Other', key = 'special_info'}
		end
        return {
            vars = {card.ability.extra.mult, card.ability.extra.mult_gain}
        }
    end,
	
	remove_from_deck = function(self, card, context) -- Destroy the Echo when removed
		for i = 1, #G.jokers.cards do
			local _card = G.jokers.cards[i]
			if _card.config.center.key == 'j_buf_abyssalp' then
				_card.ability.extra.echo_slot = 0  -- removes the temporary extra slot from abyssal prism if removed
			end
		end
	end,
	
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
	
	-- HIDE JOKER IN COLLECTION (THANKS, EREMEL) --
	inject = function(self)
		if not Buffoonery.config.show_spc then
			SMODS.Joker.super.inject(self)
			G.P_CENTER_POOLS.Joker[#G.P_CENTER_POOLS.Joker] = nil
		else
			SMODS.Joker.super.inject(self)
		end
	end
}